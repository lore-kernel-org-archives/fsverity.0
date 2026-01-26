Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD69B19A2A3
	for <fsverity@lists.linux.dev>; Mon, 26 Jan 2026 04:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769401847; cv=none; b=Ho4Wnoo7Qv+cAEOX1/Pk8AP9T+45CjoHJdpIkCHS8Hojg8SzCzb25Q8NfJ+MTR5lqmpilNrhWtWMI/5MOl+IqWR0Sl2323TjQvv+Zm92YI0pC+1N5s3zBYQF85/uxhyzMTWvEpmOxL/R1OCsyxr7MLu1dAeOs75JKBtaGb8dwNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769401847; c=relaxed/simple;
	bh=udhD9Q9jATMwJS6PxCqXE8wYDkakqwwtnhDWysAw6HU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kSRiksqS8kIn3IdHMiHRaVYkPd/KcdKKRLLtVlE20YLX+Jthj7RGMmeEk1HpQOk207429aedFnxpYQncy+gI9tQJn0mNKoXwusgqh56hxGWJKhRlmNiNK3NnZGlgo2xtWPGjRqKM1xUn7B9qUba7VJlIGh+B+fj6OEsoPOUj/Zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 6F6B0227A8E; Mon, 26 Jan 2026 05:30:43 +0100 (CET)
Date: Mon, 26 Jan 2026 05:30:42 +0100
From: Christoph Hellwig <hch@lst.de>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, Al Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	David Sterba <dsterba@suse.com>, Theodore Ts'o <tytso@mit.edu>,
	Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
	Andrey Albershteyn <aalbersh@redhat.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	linux-fsdevel@vger.kernel.org, linux-btrfs@vger.kernel.org,
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	fsverity@lists.linux.dev
Subject: Re: [PATCH 05/11] fsverity: kick off hash readahead at data I/O
 submission time
Message-ID: <20260126043042.GB30803@lst.de>
References: <20260122082214.452153-1-hch@lst.de> <20260122082214.452153-6-hch@lst.de> <20260124205329.GE2762@quark>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260124205329.GE2762@quark>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Sat, Jan 24, 2026 at 12:53:29PM -0800, Eric Biggers wrote:
> > +void generic_readahead_merkle_tree(struct inode *inode, pgoff_t index,
> > +		unsigned long nr_pages)
> >  {
> >  	struct folio *folio;
> >  
> >  	folio = __filemap_get_folio(inode->i_mapping, index, FGP_ACCESSED, 0);
> > -	if (IS_ERR(folio) || !folio_test_uptodate(folio)) {
> > +	if (PTR_ERR(folio) == -ENOENT || !folio_test_uptodate(folio)) {
> 
> This dereferences an ERR_PTR() when __filemap_get_folio() returns an
> error other than -ENOENT.

Yes.  I've fixed that and split the change in error handling into a
separate well described prep patch while at it.
> I think the correct thing to do here would be the following:
> 
>         if (inode->i_sb->s_vop->readahead_merkle_tree)
> 		inode->i_sb->s_vop->readahead_merkle_tree(inode, index,
> 							  last_index - index + 1);
> 
> Then __fsverity_readahead() can be folded into fsverity_readahead().

I've done that, and also added a little comment.

> 
> > +void __fsverity_readahead(struct inode *inode, const struct fsverity_info *vi,
> > +		loff_t data_start_pos, unsigned long nr_pages)
> > +{
> > +	const struct merkle_tree_params *params = &vi->tree_params;
> > +	u64 start_hidx = data_start_pos >> params->log_blocksize;
> > +	u64 end_hidx = (data_start_pos + ((nr_pages - 1) << PAGE_SHIFT)) >>
> > +			params->log_blocksize;
> 
> (nr_pages - 1) << PAGE_SHIFT can overflow an 'unsigned long'.
> (nr_pages - 1) needs to be cast to u64 before doing the shift.
> 
> But also it would make more sense to pass
> (pgoff_t start_index, unsigned long nr_pages) instead of
> (loff_t data_start_pos, unsigned long nr_pages),
> so that the two numbers have the same units.
> 
> start_idx and end_hidx could then be computed as follows:
> 
>     u64 start_hidx = (u64)start_index << params->log_blocks_per_page;
>     u64 end_hidx = (((u64)start_index + nr_pages) << params->log_blocks_per_page) - 1;
> 
> Note that fsverity_readahead() derives the position from the index.  If
> it just used the index directly, that would be more direct.

Yes, I've updated that.  Having proper types and/or conversion helpers
for the fsverity specific addressing would be really nice as well,
but I've not touched that for now.

> > +	int level;
> > +
> > +	if (!inode->i_sb->s_vop->readahead_merkle_tree)
> > +		return;
> > +	if (unlikely(data_start_pos >= inode->i_size))
> > +		return;
> 
> The check against i_size shouldn't be necessary: the caller should just
> call this only for data it's actually going to read.

This check is based on / copied from the check in verify_data_block.
Now we only kick off readahead now and and don't actually do anything
with the read blocks, so I'll take your word that this can be removed.

> > +	for (level = 0; level < params->num_levels; level++) {
> > +		unsigned long level_start = params->level_start[level];
> > +		unsigned long next_start_hidx = start_hidx >> params->log_arity;
> > +		unsigned long next_end_hidx = end_hidx >> params->log_arity;
> > +		unsigned long start_idx = (level_start + next_start_hidx) >>
> > +				params->log_blocks_per_page;
> > +		unsigned long end_idx = (level_start + next_end_hidx) >>
> > +				params->log_blocks_per_page;
> 
> start_idx and end_idx should have type pgoff_t to make it clear that
> they're page indices.

Fixed.

> > +/**
> > + * fsverity_readahead() - kick off readahead on fsverity hashes
> > + * @folio:		first folio that is being read
> 
> folio => file data folio
> 
> Otherwise it can be confused with the Merkle tree.

I've incoroporate the various suggested documentation improvements.
Thanks!

