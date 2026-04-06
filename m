Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 420D0273803
	for <fsverity@lists.linux.dev>; Mon,  6 Apr 2026 16:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775494025; cv=none; b=BvviNSHOtS8iUOPilRfJdZDf2bhwRIVc87qHw4TEctSdauK6O7i6VSZdi0rEUvtepFEogBvxptQe5CuOLYlJlVmtYy8788mK1jWud38K8tovzMMyhg9S0YH0YutbQYvOUyrndDskPUH1vMp4xzqmUdhu/DAw2uayiVofrcH19Fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775494025; c=relaxed/simple;
	bh=TM530/6yKMcAW47oGWofQmxobx/hCLNWp+3sjj8ksR8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N1KEi4gfjpnt+HC+HB6sEILlEQZNIlZsJXLPV3c0+25F1h7bphcP4cl5BxSAKhpAmWjk4HUwBqem9pVMzD0OJbDUvkJB/r6eoa2EdZ5i+iqRuq+xUJucsdL2wlfL4Lqjd9/1yS7MoIxdvc2XWJ38xXOKs0QXNMmVsMB/rBtgIwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mvhWn62B; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mvhWn62B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0584C4CEF7;
	Mon,  6 Apr 2026 16:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775494024;
	bh=TM530/6yKMcAW47oGWofQmxobx/hCLNWp+3sjj8ksR8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mvhWn62B4rUOCHuzqeKrahvs8rhF4q1LSJ4zl8WAD9JQNXZaKTTp/6b0onmNOrQxk
	 l0HHen8wQplvpHu3OpTBwV1cidJfw2DF0ILPFFeIdFFQAekgMNc6D+WEIvABdawx7c
	 ypBUKMfJmvCQCDKzRQ9drMxYs3In/tb7lBJYsVMUTv1KZl2BB4gxvyOqjUu/D8dfF/
	 tHyNJ/cZY6gmA+66dsVtkQFYvz8DrvF/DfB7oulMOGRPfDzGWViDCr6fcAFCdTCW2v
	 D6X0IJcBtWFuGq8mcFuC/6bkHD2HoL66SO9cRfkjNGFhlYPpiQKtflph71grQ/WHQP
	 sfYMI0ZihGmLA==
Date: Mon, 6 Apr 2026 09:45:48 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Cc: fsverity@lists.linux.dev, "Theodore Y. Ts'o" <tytso@mit.edu>,
	Christoph Hellwig <hch@lst.de>
Subject: Re: fsverity and large folios
Message-ID: <20260406164548.GC2971@sol>
References: <adM9g5jgxzG_NvgI@casper.infradead.org>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <adM9g5jgxzG_NvgI@casper.infradead.org>

On Mon, Apr 06, 2026 at 05:58:43AM +0100, Matthew Wilcox wrote:
> I suspect that fsverity simply doesn't support large folios today.

fs/verity/ already supports large folios in the mapping, including
verifying data from them and having the Merkle tree pages be backed by
them.  This is already being used on ext4.  It seems your concern is
about a more specific topic related to the Merkle tree caching.

> To make a move in that direction, I started to convert
> ->read_markle_tree_page() to ->read_merkle_tree_folio().  But there's
> a problem.  The Merkle tree is stored at "some offset" from the EOF.  And
> the knowledge of what offset is particular to the individual filesystem
> (or potentially each individual file).  That means that we can't hoist
> the "folio_file_page(folio, index)" call from the filesystem to the core
> code because the core code doesn't know what offset the tree is stored at.
> 
> And it's kind of dangerous because calling offset_in_folio(folio,
> byte_offset) doesn't work correctly eitheer (it's fine as long as the
> Merkle tree starts at some multiple of folio_size() from the base of
> the file ... which is a nasty gotcha to stumble across!)
> 
> This actually came up for me because fsverity is using PageChecked(),
> and it's the last part of the kernel still using PageChecked().  I was
> hoping to replace these uses with folio_test/set_checked(), but it all
> feels a bit fragile at this point.
> 
> I don't have an idea beyond exposing ->verity_metadata_pos() to the
> core code from individual filesystems, which feels like poor
> architecture.  Ideas welcome.

->read_merkle_tree_page() returns a page, but filesystems can back that
page with a large folio, as ext4 does.

While ext4 does it correctly as far as I can tell, btrfs does not, as
Christoph pointed out.  btrfs_read_merkle_tree_page() unconditionally
allocates an order-0 folio, even if the mapping uses folios of a
different order.  Yes, that needs to be fixed.

If I understand correctly, the other topic you're raising is whether the
page-granular use of PG_checked in fs/verity/verify.c can be replaced
with folio-granular use.

The bitmap-based code path (i.e. when fsverity_info::hash_block_verified
is allocated) partially addresses that.  But it still uses PG_checked to
determine whether the page was newly instantiated.

That use can be replaced with the folio-granular bit, tracking whether
the entire folio was newly instantiated.  But it will require a change
to the fsverity_operations, as you noticed.  There are multiple ways it
could be done, but I think one way would be:

    struct folio *(*read_merkle_tree_folio)(struct inode *inode, u64 pos,
                                            size_t *offset_in_folio_ret);

So it would take a byte position, which might not be folio-aligned or
even page-aligned.  It would return the folio containing it, along with
the byte offset of the requested position in that folio.

With that interface, fs/verity/ would have the information it needs to
determine which bitmap bits the folio-level checked bit correspond to.

Along with that, fsverity_init_merkle_tree_params() would need to enable
the bitmap-based code path whenever the file is using large folios.

- Eric
