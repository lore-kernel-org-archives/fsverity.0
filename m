Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE3E2C9A
	for <fsverity@lists.linux.dev>; Thu, 31 Jul 2025 11:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753961673; cv=none; b=Q01jam+Y+lR0vYsEEHKkTJw/tEhmTA56uoUfgrkBt7keRjSnpi0dSWps4yigfFKEN25CHuaWYVJjk1yCDb/k8sxh6WJltxAdkm6zcODy1Tg3AED3o+pJnkcnWAcq+RxqvfHNTDpy54YVg3POgapJ0Jc5vQKvEVoVka5n9TBfJk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753961673; c=relaxed/simple;
	bh=1y/Zo/lSEB/Fk9LFo90eHbV7ymK42YnCVP9XzCjHHlk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=ggU9J24dOxOY4ODPal+tXfatC5GuPx3a+LNZN+lARBTbox5lURnin5VV0bxSrVLwcVR3LqnoFv+a1l20Gd5DFdsMDF138k96ayaGjyPNiqyYtxusYEuNIigX5iU+cLBn0oaBKtEZ+Rmw++Jg8m5nr5u92df8InxTVDcJAi7SG/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=e7lnx9AQ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="e7lnx9AQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753961670;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yzA8GugouwSPOp8MLwKZ10q7duF8uy9sV/hJy9Wdq5c=;
	b=e7lnx9AQBnqq2qh6ejifcPU5fyfl6SnImfUFWJYscQ6lIuuidX4e87DCG9HSnsYLbq4UW5
	bpgxsWKsgVF4Rvwy2glQ6HR6y2ZxBUhhnD2GBcu9w2o6Skb9nvFyW1DwzanmdZaqpRadQM
	3AF0N5dSyY3IL9fhY9dWrrjIqU6fbqU=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-450-wexsmsH_OSWxvkBt6OeXSg-1; Thu, 31 Jul 2025 07:34:27 -0400
X-MC-Unique: wexsmsH_OSWxvkBt6OeXSg-1
X-Mimecast-MFC-AGG-ID: wexsmsH_OSWxvkBt6OeXSg_1753961667
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-af8f5f48b5bso87693066b.0
        for <fsverity@lists.linux.dev>; Thu, 31 Jul 2025 04:34:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753961667; x=1754566467;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yzA8GugouwSPOp8MLwKZ10q7duF8uy9sV/hJy9Wdq5c=;
        b=bFT3XmGg8GXo5unIIqWp4Fzso8gfUp5J1C+xA/HMU2qsIaBQc8iBwGs6yBdCUXe0GL
         gs0BR2nSdOy66Hpw7l2L+H9WtZgih0BWdOMbXW+bWiJJYNivyXX/p7J/ZLLJSb8s8wCy
         E2eh+nqI4+b4VbGjXBMFgDTpHQdK7rJkzax5i3OCvdkDGopOFEM4ycq8KTp5qfnAc2Pi
         Jiplj15pjAlFdhzL6HZfBxAAuUiVoTf+bnj3pIr2eeWCjPmnhUJDTUbV6R4fqwt0VsVT
         79YYuhTdKtmkSRAOcOj42LpXBLJy1rkS4Lv0tJAJsBnc64PI0Z/hJb4OR3YDKZOZ5ieC
         YxUA==
X-Gm-Message-State: AOJu0YxBsz/Jwe5ECsWpnLL2k6iLofIp6AEBHrMsL8nMf1Ojo7UR1ovm
	TLDyW5SsXb10a6spEtqwljDrR57j+1NhZpdXpp0xrF9z4C5cy4MH0vEHj1lb5quAkjFXry1dTxh
	P2bKiV5XupkeHRluGV7xFZ+3PbK2TLp6D9gfaJlTtVZYZGm3XTYtvwANM/bw=
X-Gm-Gg: ASbGncvUqoakWGkwN7+dqMpJ1ikuvJBvs8sFQoWemfJYbog6UrANYlDBOo6ZKLl1VTk
	GroJBSbG5rbKaTtabUk7bGacstsoaY1UTkzglQOQ3qUhHQFKtSCsWmHqduWvKIrBMp8DOrUytS+
	zrw7JOSO1H9LXY5iYImpkTAs1xWkbrezjp2HtZHPSgeJao+cq0p3kku0aoaQeeo/x3f6kEkNYXv
	kOwahel0gOwwp4OYb/Y1ChQQ9J+lTMgiNyjsOKrEZ9AmYpiXTqF5BSqWNOl1X3+IG+f4/koxMGL
	K1Pb8NOcqK9e8GgaKWM8NoXsQG4nVKRGbu/WL2+rCdLI+IJcQm57YPNXj1E=
X-Received: by 2002:a17:906:730d:b0:adb:2f9b:e16f with SMTP id a640c23a62f3a-af91bdd3c6bmr195223166b.16.1753961666554;
        Thu, 31 Jul 2025 04:34:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEKAHLGQZxBEP+us0JAlF6fYX18OP/zg5OsAyh5jFH4x6ZcoJFlTCLXN30mB+Dnt4D/i2T6XA==
X-Received: by 2002:a17:906:730d:b0:adb:2f9b:e16f with SMTP id a640c23a62f3a-af91bdd3c6bmr195220066b.16.1753961666002;
        Thu, 31 Jul 2025 04:34:26 -0700 (PDT)
Received: from thinky (ip-217-030-074-039.aim-net.cz. [217.30.74.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a0a3792sm96117666b.50.2025.07.31.04.34.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 04:34:25 -0700 (PDT)
Date: Thu, 31 Jul 2025 13:34:24 +0200
From: Andrey Albershteyn <aalbersh@redhat.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: fsverity@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
	linux-xfs@vger.kernel.org, david@fromorbit.com, ebiggers@kernel.org, hch@lst.de, 
	Andrey Albershteyn <aalbersh@kernel.org>
Subject: Re: [PATCH RFC 13/29] iomap: integrate fs-verity verification into
 iomap's read path
Message-ID: <f767jjbn25ffuigxnigsi7kz6tqvfqkbk4j2xs3mobtyhnmqip@24mjx53j3axv>
References: <20250728-fsverity-v1-0-9e5443af0e34@kernel.org>
 <20250728-fsverity-v1-13-9e5443af0e34@kernel.org>
 <20250729232152.GP2672049@frogsfrogsfrogs>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20250729232152.GP2672049@frogsfrogsfrogs>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: wUoZiAgIi6dBxWPTyhxIuYcCAa0gHsmUf-4AYGo5qyU_1753961667
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2025-07-29 16:21:52, Darrick J. Wong wrote:
> On Mon, Jul 28, 2025 at 10:30:17PM +0200, Andrey Albershteyn wrote:
> > From: Andrey Albershteyn <aalbersh@redhat.com>
> > 
> > This patch adds fs-verity verification into iomap's read path. After
> > BIO's io operation is complete the data are verified against
> > fs-verity's Merkle tree. Verification work is done in a separate
> > workqueue.
> > 
> > The read path ioend iomap_read_ioend are stored side by side with
> > BIOs if FS_VERITY is enabled.
> > 
> > [djwong: fix doc warning]
> > Signed-off-by: Darrick J. Wong <djwong@kernel.org>
> > Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org>
> > ---
> >  fs/iomap/buffered-io.c | 151 +++++++++++++++++++++++++++++++++++++++++++++++--
> >  fs/iomap/ioend.c       |  41 +++++++++++++-
> >  include/linux/iomap.h  |  13 +++++
> >  3 files changed, 198 insertions(+), 7 deletions(-)
> > 
> > diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
> > index e959a206cba9..87c974e543e0 100644
> > --- a/fs/iomap/buffered-io.c
> > +++ b/fs/iomap/buffered-io.c
> > @@ -6,6 +6,7 @@
> >  #include <linux/module.h>
> >  #include <linux/compiler.h>
> >  #include <linux/fs.h>
> > +#include <linux/fsverity.h>
> >  #include <linux/iomap.h>
> >  #include <linux/pagemap.h>
> >  #include <linux/uio.h>
> > @@ -363,6 +364,116 @@ static inline bool iomap_block_needs_zeroing(const struct iomap_iter *iter,
> >  		pos >= i_size_read(iter->inode);
> >  }
> >  
> > +#ifdef CONFIG_FS_VERITY
> > +int iomap_init_fsverity(struct super_block *sb, unsigned int wq_flags,
> > +			int max_active)
> > +{
> > +	int ret;
> > +
> > +	if (!iomap_fsverity_bioset) {
> > +		ret = iomap_fsverity_init_bioset();
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	return fsverity_init_wq(sb, wq_flags, max_active);
> > +}
> > +EXPORT_SYMBOL_GPL(iomap_init_fsverity);
> > +
> > +static void
> > +iomap_read_fsverify_end_io_work(struct work_struct *work)
> > +{
> > +	struct iomap_fsverity_bio *fbio =
> > +		container_of(work, struct iomap_fsverity_bio, work);
> > +
> > +	fsverity_verify_bio(&fbio->bio);
> > +	iomap_read_end_io(&fbio->bio);
> > +}
> > +
> > +static void
> > +iomap_read_fsverity_end_io(struct bio *bio)
> > +{
> > +	struct iomap_fsverity_bio *fbio =
> > +		container_of(bio, struct iomap_fsverity_bio, bio);
> > +
> > +	INIT_WORK(&fbio->work, iomap_read_fsverify_end_io_work);
> > +	queue_work(bio->bi_private, &fbio->work);
> > +}
> > +
> > +static struct bio *
> > +iomap_fsverity_read_bio_alloc(struct inode *inode, struct block_device *bdev,
> > +			    int nr_vecs, gfp_t gfp)
> > +{
> > +	struct bio *bio;
> > +
> > +	bio = bio_alloc_bioset(bdev, nr_vecs, REQ_OP_READ, gfp,
> > +			iomap_fsverity_bioset);
> > +	if (bio) {
> > +		bio->bi_private = inode->i_sb->s_verity_wq;
> > +		bio->bi_end_io = iomap_read_fsverity_end_io;
> > +	}
> > +	return bio;
> > +}
> > +
> > +/*
> > + * True if tree is not aligned with fs block/folio size and we need zero tail
> > + * part of the folio
> > + */
> > +static bool
> > +iomap_fsverity_tree_end_align(struct iomap_iter *iter, struct folio *folio,
> > +		loff_t pos, size_t plen)
> > +{
> > +	int error;
> > +	u8 log_blocksize;
> > +	u64 tree_size, tree_mask, last_block_tree, last_block_pos;
> > +
> > +	/* Not a Merkle tree */
> > +	if (!(iter->iomap.flags & IOMAP_F_BEYOND_EOF))
> > +		return false;
> > +
> > +	if (plen == folio_size(folio))
> > +		return false;
> > +
> > +	if (iter->inode->i_blkbits == folio_shift(folio))
> > +		return false;
> > +
> > +	error = fsverity_merkle_tree_geometry(iter->inode, &log_blocksize, NULL,
> > +			&tree_size);
> > +	if (error)
> > +		return false;
> > +
> > +	/*
> > +	 * We are beyond EOF reading Merkle tree. Therefore, it has highest
> > +	 * offset. Mask pos with a tree size to get a position whare are we in
> > +	 * the tree. Then, compare index of a last tree block and the index of
> > +	 * current pos block.
> > +	 */
> > +	last_block_tree = (tree_size + PAGE_SIZE - 1) >> PAGE_SHIFT;
> > +	tree_mask = (1 << fls64(tree_size)) - 1;
> > +	last_block_pos = ((pos & tree_mask) >> PAGE_SHIFT) + 1;
> > +
> > +	return last_block_tree == last_block_pos;
> > +}
> > +#else
> > +# define iomap_fsverity_read_bio_alloc(...)	(NULL)
> > +# define iomap_fsverity_tree_end_align(...)	(false)
> > +#endif /* CONFIG_FS_VERITY */
> > +
> > +static struct bio *iomap_read_bio_alloc(struct inode *inode,
> > +		const struct iomap *iomap, int nr_vecs, gfp_t gfp)
> > +{
> > +	struct bio *bio;
> > +	struct block_device *bdev = iomap->bdev;
> > +
> > +	if (fsverity_active(inode) && !(iomap->flags & IOMAP_F_BEYOND_EOF))
> > +		return iomap_fsverity_read_bio_alloc(inode, bdev, nr_vecs, gfp);
> > +
> > +	bio = bio_alloc(bdev, nr_vecs, REQ_OP_READ, gfp);
> > +	if (bio)
> > +		bio->bi_end_io = iomap_read_end_io;
> > +	return bio;
> > +}
> > +
> >  static int iomap_readpage_iter(struct iomap_iter *iter,
> >  		struct iomap_readpage_ctx *ctx)
> >  {
> > @@ -375,6 +486,10 @@ static int iomap_readpage_iter(struct iomap_iter *iter,
> >  	sector_t sector;
> >  	int ret;
> >  
> > +	/* Fail reads from broken fsverity files immediately. */
> > +	if (IS_VERITY(iter->inode) && !fsverity_active(iter->inode))
> > +		return -EIO;
> > +
> >  	if (iomap->type == IOMAP_INLINE) {
> >  		ret = iomap_read_inline_data(iter, folio);
> >  		if (ret)
> > @@ -391,6 +506,11 @@ static int iomap_readpage_iter(struct iomap_iter *iter,
> >  	if (iomap_block_needs_zeroing(iter, pos) &&
> >  	    !(iomap->flags & IOMAP_F_BEYOND_EOF)) {
> >  		folio_zero_range(folio, poff, plen);
> > +		if (fsverity_active(iter->inode) &&
> > +		    !fsverity_verify_blocks(folio, plen, poff)) {
> > +			return -EIO;
> > +		}
> > +
> >  		iomap_set_range_uptodate(folio, poff, plen);
> >  		goto done;
> >  	}
> > @@ -408,32 +528,51 @@ static int iomap_readpage_iter(struct iomap_iter *iter,
> >  	    !bio_add_folio(ctx->bio, folio, plen, poff)) {
> >  		gfp_t gfp = mapping_gfp_constraint(folio->mapping, GFP_KERNEL);
> >  		gfp_t orig_gfp = gfp;
> > -		unsigned int nr_vecs = DIV_ROUND_UP(length, PAGE_SIZE);
> >  
> >  		if (ctx->bio)
> >  			submit_bio(ctx->bio);
> >  
> >  		if (ctx->rac) /* same as readahead_gfp_mask */
> >  			gfp |= __GFP_NORETRY | __GFP_NOWARN;
> > -		ctx->bio = bio_alloc(iomap->bdev, bio_max_segs(nr_vecs),
> > -				     REQ_OP_READ, gfp);
> > +
> > +		ctx->bio = iomap_read_bio_alloc(iter->inode, iomap,
> > +				bio_max_segs(DIV_ROUND_UP(length, PAGE_SIZE)),
> > +				gfp);
> > +
> >  		/*
> >  		 * If the bio_alloc fails, try it again for a single page to
> >  		 * avoid having to deal with partial page reads.  This emulates
> >  		 * what do_mpage_read_folio does.
> >  		 */
> >  		if (!ctx->bio) {
> > -			ctx->bio = bio_alloc(iomap->bdev, 1, REQ_OP_READ,
> > -					     orig_gfp);
> > +			ctx->bio = iomap_read_bio_alloc(iter->inode,
> > +					iomap, 1, orig_gfp);
> >  		}
> >  		if (ctx->rac)
> >  			ctx->bio->bi_opf |= REQ_RAHEAD;
> >  		ctx->bio->bi_iter.bi_sector = sector;
> > -		ctx->bio->bi_end_io = iomap_read_end_io;
> >  		bio_add_folio_nofail(ctx->bio, folio, plen, poff);
> >  	}
> >  
> >  done:
> > +	/*
> > +	 * For post EOF region, zero part of the folio which won't be read. This
> > +	 * happens at the end of the region. So far, the only user is
> > +	 * fs-verity which stores continuous data region.
> 
> Is it ever the case that the zeroed region actually has merkle tree
> content on disk?  Or if this region truly was never written by the
> fsverity construction code, then why would it access the unwritten
> region later?
> 
> Or am I misunderstanding something here?
> 
> (Probably...)

The zeroed region is never written. With 1k fs block and 1k merkle
tree block and 4k page size we could end up reading only single
block, at the end of the tree. But we have to pass PAGE to the
fsverity. So, only the 1/4 of the page is read. This if-case zeroes
the rest of the page to make it uptodate. In the normal read path
this is bound by EOF, but here I use tree size. So, we don't read
this unwritten region but zero the folio.

The fsverity does zeroing of unused space while construction, but
this works only for full fs blocks, therefore, 4k fs block and 1k
merkle tree block.

-- 
- Andrey

