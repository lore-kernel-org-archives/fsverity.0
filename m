Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA81515A8
	for <fsverity@lists.linux.dev>; Thu, 31 Jul 2025 15:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753974119; cv=none; b=JgmfUMpq2FA7M3P/zzFnDtpjv3KD60jiumdFjfNivAggLcn8T9ev6rc7OLads5xOfmbTT6EnyKXMSxVuw9KfLoprBAXHo1fJAeYoWy998cJ2lfPzRknEnb05RS3YjAkL4eDGsCqxtGQ1xXIkfenQVvBo6pbhsNVTK4KcuKC3BB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753974119; c=relaxed/simple;
	bh=C2o0Lvne0cCNDsimlsqgbMKsv5mi2W4tRSJaT5aours=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=C2KWdePjfNqxcYhlbolJnONY1QMJ0tXCf+ix6SBSFROIG77GMjUUIRhz7t1H9C67f+EjVqDwN3cFK54PasQNvvQMDxFRb07bRUDEJH2LXXIQkbi5l27ugnrEl3IQcuQ+OOCM/DBV0bQeYxl527o9p3lmwbD4zkhhnqWxNlD/Q9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=H8cZE9IE; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="H8cZE9IE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753974116;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FYWF/twaLqY/DbwXLo4Q7QUDaME4akWU5NgI7Alefig=;
	b=H8cZE9IE0shc/u/PBtIOF7+zS7Ps44JWVuM3WmIGMOjvd8uuUmJjUHGQudE7iN5rI4ZLPv
	hgwxDbtsKdOJeHEEglokuARfYXpe8Z3k4cUAo9aQbTqp4Rq4t+WBurpDBwFqLjNA0IOLUb
	/PRdgCAHMja1c2bxpEbEh1VKfs2PekE=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-421-1LJOF-Z2NXG3ivDEs-srYA-1; Thu, 31 Jul 2025 11:01:55 -0400
X-MC-Unique: 1LJOF-Z2NXG3ivDEs-srYA-1
X-Mimecast-MFC-AGG-ID: 1LJOF-Z2NXG3ivDEs-srYA_1753974114
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-adb33457610so125184266b.3
        for <fsverity@lists.linux.dev>; Thu, 31 Jul 2025 08:01:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753974114; x=1754578914;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FYWF/twaLqY/DbwXLo4Q7QUDaME4akWU5NgI7Alefig=;
        b=uWgaXJjX64Jwakx4goBf7d4i/ZuLZ5EPqM5ICpG8nIcY2FlwHPUnUju0tHhyRcRHuk
         RSSh+KCAhV+uNqJtvLoO/F5z0zfLwfWgjSxzbl1eGrmviO3xq0Gy8AW6gQ2580u02pQ/
         k2vKEv++4CAuROBk+Lrmblivpikq7I2rO5AbSBUScEd9LEOSSCTlQhYZBkmmQ3iV0YQv
         KZ3QHrGxvHgfi/6vqdtGdjx5wj0jjYOgsQPISNENnyG6jItdwLlLd7Gs3PVRAuTKOfMw
         Y2h/rpVp8FdF7wK2Cx9TzfvIUBmq17iEBpQe/yvL61KMXZ2zAJSDzLveNu9wM9zMVicT
         jUmg==
X-Gm-Message-State: AOJu0YzjFalc29eY8yVfn8KtPcufesMIXeAZoazCkB5Cw4U4mZRdgMTF
	ylrSr2yqGBd6SodwhYDZCph37wDiPpzAP+MJpc6y0aFlwitU/r1dU3nfkv3IXGAyATDEscirlYw
	3ZQ7ZhSa6cu4G0qXf8bq4FuHkPpSufHypQedVU7xXjcP7tN+cC/jYWyPPckMMW6K13xI=
X-Gm-Gg: ASbGncuNdTS7znp5Gz2c7plXKPNnyw1t5Ui3BoqtgqEvo6jxtT6IvnbSgcs4U1boa1v
	8CxMTR+k2a/sFhSq6NeqD/TZ9ryoYrccIbPpE0is2UZDQHkWpomL2zCwe0uuvzXXta+Ia8xl/NJ
	b3NPgkR67+8ir1sBG7Wh6PbeR7FjWkk7wKj51VqmSW2OLdQVoRWWA0GVUiCV5iVbsqblmQvpPh6
	zHGiqElCw9TObvRZfAGHj7ZXIzSGnFeEQi/0/BTxXjpurFJS/wRYKV+Rcam19Q555+kMksZeASV
	BNLb5QFCAv4co/TWQ/OOZjBgIFxxPVcPgvjJZzet+aqA+bvCimfatXNkjAU=
X-Received: by 2002:a17:907:9406:b0:ae6:f087:953 with SMTP id a640c23a62f3a-af8fd6a2978mr797020066b.12.1753974112203;
        Thu, 31 Jul 2025 08:01:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEBaE3lbv+mxzwSASk5fHPQEjeLTnCI6nAdLo7+F+C5W7fYthtLDQO7Gzz3kpH8rMy8vT9x8A==
X-Received: by 2002:a17:907:9406:b0:ae6:f087:953 with SMTP id a640c23a62f3a-af8fd6a2978mr796991766b.12.1753974109924;
        Thu, 31 Jul 2025 08:01:49 -0700 (PDT)
Received: from thinky (ip-217-030-074-039.aim-net.cz. [217.30.74.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a0766absm124207666b.14.2025.07.31.08.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 08:01:48 -0700 (PDT)
Date: Thu, 31 Jul 2025 17:01:48 +0200
From: Andrey Albershteyn <aalbersh@redhat.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: fsverity@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
	linux-xfs@vger.kernel.org, david@fromorbit.com, ebiggers@kernel.org, hch@lst.de, 
	Andrey Albershteyn <aalbersh@kernel.org>
Subject: Re: [PATCH RFC 13/29] iomap: integrate fs-verity verification into
 iomap's read path
Message-ID: <oy45h4xpktjswnwnwgzp6ihqif2bgplslwgctbcotdjum4jh5v@wbnx7syzucvk>
References: <20250728-fsverity-v1-0-9e5443af0e34@kernel.org>
 <20250728-fsverity-v1-13-9e5443af0e34@kernel.org>
 <20250729232152.GP2672049@frogsfrogsfrogs>
 <f767jjbn25ffuigxnigsi7kz6tqvfqkbk4j2xs3mobtyhnmqip@24mjx53j3axv>
 <20250731145233.GA2672029@frogsfrogsfrogs>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20250731145233.GA2672029@frogsfrogsfrogs>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0mEvpxkX2udfvsuxn1EoPYEeXwF_SArk-OjVABIZl4U_1753974114
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2025-07-31 07:52:33, Darrick J. Wong wrote:
> On Thu, Jul 31, 2025 at 01:34:24PM +0200, Andrey Albershteyn wrote:
> > On 2025-07-29 16:21:52, Darrick J. Wong wrote:
> > > On Mon, Jul 28, 2025 at 10:30:17PM +0200, Andrey Albershteyn wrote:
> > > > From: Andrey Albershteyn <aalbersh@redhat.com>
> > > > 
> > > > This patch adds fs-verity verification into iomap's read path. After
> > > > BIO's io operation is complete the data are verified against
> > > > fs-verity's Merkle tree. Verification work is done in a separate
> > > > workqueue.
> > > > 
> > > > The read path ioend iomap_read_ioend are stored side by side with
> > > > BIOs if FS_VERITY is enabled.
> > > > 
> > > > [djwong: fix doc warning]
> > > > Signed-off-by: Darrick J. Wong <djwong@kernel.org>
> > > > Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org>
> > > > ---
> > > >  fs/iomap/buffered-io.c | 151 +++++++++++++++++++++++++++++++++++++++++++++++--
> > > >  fs/iomap/ioend.c       |  41 +++++++++++++-
> > > >  include/linux/iomap.h  |  13 +++++
> > > >  3 files changed, 198 insertions(+), 7 deletions(-)
> > > > 
> > > > diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
> > > > index e959a206cba9..87c974e543e0 100644
> > > > --- a/fs/iomap/buffered-io.c
> > > > +++ b/fs/iomap/buffered-io.c
> > > > @@ -6,6 +6,7 @@
> > > >  #include <linux/module.h>
> > > >  #include <linux/compiler.h>
> > > >  #include <linux/fs.h>
> > > > +#include <linux/fsverity.h>
> > > >  #include <linux/iomap.h>
> > > >  #include <linux/pagemap.h>
> > > >  #include <linux/uio.h>
> > > > @@ -363,6 +364,116 @@ static inline bool iomap_block_needs_zeroing(const struct iomap_iter *iter,
> > > >  		pos >= i_size_read(iter->inode);
> > > >  }
> > > >  
> > > > +#ifdef CONFIG_FS_VERITY
> > > > +int iomap_init_fsverity(struct super_block *sb, unsigned int wq_flags,
> > > > +			int max_active)
> > > > +{
> > > > +	int ret;
> > > > +
> > > > +	if (!iomap_fsverity_bioset) {
> > > > +		ret = iomap_fsverity_init_bioset();
> > > > +		if (ret)
> > > > +			return ret;
> > > > +	}
> > > > +
> > > > +	return fsverity_init_wq(sb, wq_flags, max_active);
> > > > +}
> > > > +EXPORT_SYMBOL_GPL(iomap_init_fsverity);
> > > > +
> > > > +static void
> > > > +iomap_read_fsverify_end_io_work(struct work_struct *work)
> > > > +{
> > > > +	struct iomap_fsverity_bio *fbio =
> > > > +		container_of(work, struct iomap_fsverity_bio, work);
> > > > +
> > > > +	fsverity_verify_bio(&fbio->bio);
> > > > +	iomap_read_end_io(&fbio->bio);
> > > > +}
> > > > +
> > > > +static void
> > > > +iomap_read_fsverity_end_io(struct bio *bio)
> > > > +{
> > > > +	struct iomap_fsverity_bio *fbio =
> > > > +		container_of(bio, struct iomap_fsverity_bio, bio);
> > > > +
> > > > +	INIT_WORK(&fbio->work, iomap_read_fsverify_end_io_work);
> > > > +	queue_work(bio->bi_private, &fbio->work);
> > > > +}
> > > > +
> > > > +static struct bio *
> > > > +iomap_fsverity_read_bio_alloc(struct inode *inode, struct block_device *bdev,
> > > > +			    int nr_vecs, gfp_t gfp)
> > > > +{
> > > > +	struct bio *bio;
> > > > +
> > > > +	bio = bio_alloc_bioset(bdev, nr_vecs, REQ_OP_READ, gfp,
> > > > +			iomap_fsverity_bioset);
> > > > +	if (bio) {
> > > > +		bio->bi_private = inode->i_sb->s_verity_wq;
> > > > +		bio->bi_end_io = iomap_read_fsverity_end_io;
> > > > +	}
> > > > +	return bio;
> > > > +}
> > > > +
> > > > +/*
> > > > + * True if tree is not aligned with fs block/folio size and we need zero tail
> > > > + * part of the folio
> > > > + */
> > > > +static bool
> > > > +iomap_fsverity_tree_end_align(struct iomap_iter *iter, struct folio *folio,
> > > > +		loff_t pos, size_t plen)
> > > > +{
> > > > +	int error;
> > > > +	u8 log_blocksize;
> > > > +	u64 tree_size, tree_mask, last_block_tree, last_block_pos;
> > > > +
> > > > +	/* Not a Merkle tree */
> > > > +	if (!(iter->iomap.flags & IOMAP_F_BEYOND_EOF))
> > > > +		return false;
> > > > +
> > > > +	if (plen == folio_size(folio))
> > > > +		return false;
> > > > +
> > > > +	if (iter->inode->i_blkbits == folio_shift(folio))
> > > > +		return false;
> > > > +
> > > > +	error = fsverity_merkle_tree_geometry(iter->inode, &log_blocksize, NULL,
> > > > +			&tree_size);
> > > > +	if (error)
> > > > +		return false;
> > > > +
> > > > +	/*
> > > > +	 * We are beyond EOF reading Merkle tree. Therefore, it has highest
> > > > +	 * offset. Mask pos with a tree size to get a position whare are we in
> > > > +	 * the tree. Then, compare index of a last tree block and the index of
> > > > +	 * current pos block.
> > > > +	 */
> > > > +	last_block_tree = (tree_size + PAGE_SIZE - 1) >> PAGE_SHIFT;
> > > > +	tree_mask = (1 << fls64(tree_size)) - 1;
> > > > +	last_block_pos = ((pos & tree_mask) >> PAGE_SHIFT) + 1;
> > > > +
> > > > +	return last_block_tree == last_block_pos;
> > > > +}
> > > > +#else
> > > > +# define iomap_fsverity_read_bio_alloc(...)	(NULL)
> > > > +# define iomap_fsverity_tree_end_align(...)	(false)
> > > > +#endif /* CONFIG_FS_VERITY */
> > > > +
> > > > +static struct bio *iomap_read_bio_alloc(struct inode *inode,
> > > > +		const struct iomap *iomap, int nr_vecs, gfp_t gfp)
> > > > +{
> > > > +	struct bio *bio;
> > > > +	struct block_device *bdev = iomap->bdev;
> > > > +
> > > > +	if (fsverity_active(inode) && !(iomap->flags & IOMAP_F_BEYOND_EOF))
> > > > +		return iomap_fsverity_read_bio_alloc(inode, bdev, nr_vecs, gfp);
> > > > +
> > > > +	bio = bio_alloc(bdev, nr_vecs, REQ_OP_READ, gfp);
> > > > +	if (bio)
> > > > +		bio->bi_end_io = iomap_read_end_io;
> > > > +	return bio;
> > > > +}
> > > > +
> > > >  static int iomap_readpage_iter(struct iomap_iter *iter,
> > > >  		struct iomap_readpage_ctx *ctx)
> > > >  {
> > > > @@ -375,6 +486,10 @@ static int iomap_readpage_iter(struct iomap_iter *iter,
> > > >  	sector_t sector;
> > > >  	int ret;
> > > >  
> > > > +	/* Fail reads from broken fsverity files immediately. */
> > > > +	if (IS_VERITY(iter->inode) && !fsverity_active(iter->inode))
> > > > +		return -EIO;
> > > > +
> > > >  	if (iomap->type == IOMAP_INLINE) {
> > > >  		ret = iomap_read_inline_data(iter, folio);
> > > >  		if (ret)
> > > > @@ -391,6 +506,11 @@ static int iomap_readpage_iter(struct iomap_iter *iter,
> > > >  	if (iomap_block_needs_zeroing(iter, pos) &&
> > > >  	    !(iomap->flags & IOMAP_F_BEYOND_EOF)) {
> > > >  		folio_zero_range(folio, poff, plen);
> > > > +		if (fsverity_active(iter->inode) &&
> > > > +		    !fsverity_verify_blocks(folio, plen, poff)) {
> > > > +			return -EIO;
> > > > +		}
> > > > +
> > > >  		iomap_set_range_uptodate(folio, poff, plen);
> > > >  		goto done;
> > > >  	}
> > > > @@ -408,32 +528,51 @@ static int iomap_readpage_iter(struct iomap_iter *iter,
> > > >  	    !bio_add_folio(ctx->bio, folio, plen, poff)) {
> > > >  		gfp_t gfp = mapping_gfp_constraint(folio->mapping, GFP_KERNEL);
> > > >  		gfp_t orig_gfp = gfp;
> > > > -		unsigned int nr_vecs = DIV_ROUND_UP(length, PAGE_SIZE);
> > > >  
> > > >  		if (ctx->bio)
> > > >  			submit_bio(ctx->bio);
> > > >  
> > > >  		if (ctx->rac) /* same as readahead_gfp_mask */
> > > >  			gfp |= __GFP_NORETRY | __GFP_NOWARN;
> > > > -		ctx->bio = bio_alloc(iomap->bdev, bio_max_segs(nr_vecs),
> > > > -				     REQ_OP_READ, gfp);
> > > > +
> > > > +		ctx->bio = iomap_read_bio_alloc(iter->inode, iomap,
> > > > +				bio_max_segs(DIV_ROUND_UP(length, PAGE_SIZE)),
> > > > +				gfp);
> > > > +
> > > >  		/*
> > > >  		 * If the bio_alloc fails, try it again for a single page to
> > > >  		 * avoid having to deal with partial page reads.  This emulates
> > > >  		 * what do_mpage_read_folio does.
> > > >  		 */
> > > >  		if (!ctx->bio) {
> > > > -			ctx->bio = bio_alloc(iomap->bdev, 1, REQ_OP_READ,
> > > > -					     orig_gfp);
> > > > +			ctx->bio = iomap_read_bio_alloc(iter->inode,
> > > > +					iomap, 1, orig_gfp);
> > > >  		}
> > > >  		if (ctx->rac)
> > > >  			ctx->bio->bi_opf |= REQ_RAHEAD;
> > > >  		ctx->bio->bi_iter.bi_sector = sector;
> > > > -		ctx->bio->bi_end_io = iomap_read_end_io;
> > > >  		bio_add_folio_nofail(ctx->bio, folio, plen, poff);
> > > >  	}
> > > >  
> > > >  done:
> > > > +	/*
> > > > +	 * For post EOF region, zero part of the folio which won't be read. This
> > > > +	 * happens at the end of the region. So far, the only user is
> > > > +	 * fs-verity which stores continuous data region.
> > > 
> > > Is it ever the case that the zeroed region actually has merkle tree
> > > content on disk?  Or if this region truly was never written by the
> > > fsverity construction code, then why would it access the unwritten
> > > region later?
> > > 
> > > Or am I misunderstanding something here?
> > > 
> > > (Probably...)
> > 
> > The zeroed region is never written. With 1k fs block and 1k merkle
> > tree block and 4k page size we could end up reading only single
> > block, at the end of the tree. But we have to pass PAGE to the
> > fsverity. So, only the 1/4 of the page is read. This if-case zeroes
> > the rest of the page to make it uptodate. In the normal read path
> > this is bound by EOF, but here I use tree size. So, we don't read
> > this unwritten region but zero the folio.
> > 
> > The fsverity does zeroing of unused space while construction, but
> > this works only for full fs blocks, therefore, 4k fs block and 1k
> > merkle tree block.
> 
> But if the regions you have to zero are outside the merkle tree, then
> fsverity shouldn't ever see those bytes, so why zero them?  Or does it
> actually check the uptodate bit?  So then you want the folio to have
> well defined contents?

verity doesn't check uptodate, but I do in xfs_fsverity_read_merkle().
I think we need to check as it tells that iomap is done reading,
but that's true that zeroing is not necessary.

> 
> (At this point I'm picking at nits :P)
> 
> --D
> 
> > -- 
> > - Andrey
> > 
> > 
> 

-- 
- Andrey

