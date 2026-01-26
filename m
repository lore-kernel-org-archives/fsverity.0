Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC0A288CA3
	for <fsverity@lists.linux.dev>; Mon, 26 Jan 2026 04:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769402617; cv=none; b=cnZTUGtbA9s2Ea1CR+6Hy5glddqAllpbDCHCj5NBprtM1sAN8Kaz5F5rcTlfEU8Cas6lnO8bLGV2wZ05FFTHXaHpFZgJ9BEA62G+cmrjArRkjUe+TcMyXfwRwZHLoybp/pH+mCg1CXaNd9GQ+Ai+kOKZFQBna2B9QlTikRC1WuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769402617; c=relaxed/simple;
	bh=HzND9p9JRQozIE7HCqyhKMnVk9dyYUaRmZx7DX9vEyo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hunTrRmY2F1qTGVFMCG2eLL76EqE+Tyk1872aWyE4iHRmTTmlomgYD+IuenMGyg3jje80DJOyBfkTahH2ffQNNzNIjNdhAbuEpHIQgjP24Ot5N5P/H7AU6DKwLwYCRqsxvEJ2c/Q1DVZlLhETczbNT3qusrHpvKOG/ySf+P9htw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 938F3227A88; Mon, 26 Jan 2026 05:43:33 +0100 (CET)
Date: Mon, 26 Jan 2026 05:43:33 +0100
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
Subject: Re: [PATCH 11/11] fsverity: use a hashtable to find the
 fsverity_info
Message-ID: <20260126044333.GD30803@lst.de>
References: <20260122082214.452153-1-hch@lst.de> <20260122082214.452153-12-hch@lst.de> <20260125013104.GA2255@sol>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260125013104.GA2255@sol>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Sat, Jan 24, 2026 at 05:31:04PM -0800, Eric Biggers wrote:
> > +	found = rhashtable_lookup_get_insert_fast(&fsverity_info_hash,
> > +			&vi->rhash_head, fsverity_info_hash_params);
> > +	if (found) {
> > +		fsverity_free_info(vi);
> > +		if (IS_ERR(found))
> > +			err = PTR_ERR(found);
> > +	}
> 
> Is there any explanation for why it's safe to use the *_fast variants of
> these functions?

_fast is the default mode of operation of rhashtable, I have no idea
why the authors came up with the naming.  The _fast postfixed versions
just add the required RCU critical sections over ther otherwise fully
internally locked rhashtable operations.  I've expanded the commit
message a bit to make this hopefully more clear.

> This looks incorrect.  The memory barrier is needed after reading the
> flag, not before.  (See how smp_load_acquire() works.)
> 
> Also, it's needed only for verity inodes.
> 
> Maybe do:
> 
> 	if (IS_ENABLED(CONFIG_FS_VERITY) && IS_VERITY(inode)) {
> 		/*
>                  * This pairs with the try_cmpxchg in set_mask_bits()
>                  * used to set the S_VERITY bit in i_flags.
> 		 */
> 		smp_mb();
> 		return true;
> 	}
> 	return false;

Thanks, I've fixed this up.

