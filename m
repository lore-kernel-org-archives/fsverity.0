Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A62133A6FE
	for <fsverity@lists.linux.dev>; Thu, 19 Feb 2026 13:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771508315; cv=none; b=iLaQyvcWjRwIa9kS5wl/i9QqfG3Qq2vW4jAfPIWyGmJqijsG+PYZs+qlXySJNPo37MNjudPmS3gXba3YTwtRZLMMDw1jYkH76xN0WBhkh52qwOhnZQDKgGdnmrp2fVCLCjSqa2TLhAO6ZCyWuNMZvNxqA63g+f5oKOF/8p5DI8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771508315; c=relaxed/simple;
	bh=SNekF7prFibKS9mG5Fno51gLDqSAsz6awlkrLP9LR+M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EWr2M4Nf3U1rjWjDpHYWLQoas2sEwxabWAsAMNIcx62mLZ+Vss7ilhhRaK8SxShPSDSWbE9+HBX+aiSP0cmzBxtcG9UqOMLKo+vNyvWMcNFRrbqxk9dT0RM/UOVfoP156GF+fcuQpcxqmg41TaCpeg5GrrdJx2cPzc3JGRzpRCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id A7C5168B05; Thu, 19 Feb 2026 14:38:29 +0100 (CET)
Date: Thu, 19 Feb 2026 14:38:29 +0100
From: Christoph Hellwig <hch@lst.de>
To: Andrey Albershteyn <aalbersh@redhat.com>
Cc: Christoph Hellwig <hch@lst.de>,
	Andrey Albershteyn <aalbersh@kernel.org>, linux-xfs@vger.kernel.org,
	fsverity@lists.linux.dev, linux-fsdevel@vger.kernel.org,
	ebiggers@kernel.org, djwong@kernel.org
Subject: Re: [PATCH v3 11/35] iomap: allow filesystem to read fsverity
 metadata beyound EOF
Message-ID: <20260219133829.GA11935@lst.de>
References: <20260217231937.1183679-1-aalbersh@kernel.org> <20260217231937.1183679-12-aalbersh@kernel.org> <20260218063606.GD8600@lst.de> <hfteu6bonpv7djecbf3d6ekh56ktgcl4c2lvtjtrjfetzaq5dw@scsrvxx5rgig> <20260219060420.GC3739@lst.de> <qheg77kxcl4ecqdrsnmz4acfvszjlamlb7ilgxxyf3pmt4r7ah@5fzzmcpurdfp>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <qheg77kxcl4ecqdrsnmz4acfvszjlamlb7ilgxxyf3pmt4r7ah@5fzzmcpurdfp>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Thu, Feb 19, 2026 at 12:11:18PM +0100, Andrey Albershteyn wrote:
> > > fsverity descriptor. This is basically the case as for EOF folio.
> > > Descriptor is the end of the fsverity metadata region. If we have 1k
> > > fs blocks (= merkle blocks) we can have [descriptor | hole ] folio.
> > > As we are not limited by i_size here, iomap_block_needs_zeroing()
> > > won't fire to zero this hole. So, this case is to mark this tail as
> > > uptodate.
> > 
> > How do we end up in that without ctx->vi set?
> 
> We're reading it

Did a part of that sentence get lost?

> yes this would work
> 
> I've attached the current patch, with all the changes.
> 
> +               } else if (iomap_block_needs_zeroing(iter, pos) &&
> +                          !(iomap->flags & IOMAP_F_FSVERITY)) {
> 
> This check is still needed as we should not hit it when we're
> reading normal merkle tree block. iomap_block_needs_zeroing is
> checking if offset is beyond i_size and will fire here for merkle
> blocks.
> 
> Let me know if you prefer to split the first case further, or the
> current patch is good enough.
> 
> -- 
> - Andrey
> 
> diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
> index 47356c763744..af7b79073879 100644
> --- a/fs/iomap/buffered-io.c
> +++ b/fs/iomap/buffered-io.c
> @@ -533,10 +533,31 @@ static int iomap_read_folio_iter(struct iomap_iter *iter,
>                 if (plen == 0)
>                         return 0;
>  
> -               /* zero post-eof blocks as the page may be mapped */
> -               if (iomap_block_needs_zeroing(iter, pos) &&
> -                   !(iomap->flags & IOMAP_F_FSVERITY)) {
> +               /*
> +                * Handling of fsverity "holes". We hits this for two case:
> +                *   1. No need to go further, the hole after fsverity
> +                *      descriptor is the end of the fsverity metadata.
> +                *
> +                *   2. This folio contains merkle tree blocks which need to be

Overly long line here.

> +                *      synthesized and fsverity descriptor.
> +                */
> +               if ((iomap->flags & IOMAP_F_FSVERITY) &&
> +                   iomap->type == IOMAP_HOLE) {
> +                       /*
> +                        * Synthesize the hash value for a zeroed folio if we
> +                        * are reading merkle tree blocks.
> +                        */

.. and we'll probably want to merge this into the above comment.

> +                       if (ctx->vi)
> +                               fsverity_folio_zero_hash(folio, poff, plen,
> +                                                        ctx->vi);
> +                       iomap_set_range_uptodate(folio, poff, plen);
> +               } else if (iomap_block_needs_zeroing(iter, pos) &&
> +                          !(iomap->flags & IOMAP_F_FSVERITY)) {
> +                       /* zero post-eof blocks as the page may be mapped */
>                         folio_zero_range(folio, poff, plen);
> +                       if (fsverity_active(iter->inode) &&
> +                           !fsverity_verify_blocks(ctx->vi, folio, plen, poff))

Another overly long line here.  Also we should avoid the
fsverity_active check here, as it causes a rhashtable lookup.  F2fs
and ext4 just check ctx->vi, but based on the checks above, we seem
to set this also for (some) reads of the fsverity metadata.  But as
we exclude IOMAP_F_FSVERITY above, we might actually be fine with a
ctx->vi anyway.

Please document the rules for ctx->vi while were it.

