Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1FF96ABC
	for <fsverity@lists.linux.dev>; Wed,  5 Apr 2023 16:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680710553;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4E5sAaKj2nRhZMpCfhlf1IVMfFLjV6lcrwFxgfc+2Uo=;
	b=IY6JIjSapKSkXGMuNcYI6g9oZj8mMi9U5SOw3mQJXVEdtjGZuEbO/vNrHHjQ6ByKwH2OFk
	irrlt9cFLG8kwm5awxp2bDDwKoW5o7GOb6C0hJQNAWTYUv5hztKjc2rPYurK9jMUI6hlxu
	nqA8TDWNulNkIT3YG3pnfizkO6bjbMY=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-172-i1dUjhotOqqhFbQJHJPNRw-1; Wed, 05 Apr 2023 12:02:29 -0400
X-MC-Unique: i1dUjhotOqqhFbQJHJPNRw-1
Received: by mail-qv1-f71.google.com with SMTP id h7-20020a0cd807000000b005dd254e7babso16388547qvj.14
        for <fsverity@lists.linux.dev>; Wed, 05 Apr 2023 09:02:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680710548;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4E5sAaKj2nRhZMpCfhlf1IVMfFLjV6lcrwFxgfc+2Uo=;
        b=q3yA4T70btNBNKqrkeRMHeC1WjD/f1kbBjpwgegfOuSQjIbV3YJPiNdgx0ztJKmM5R
         ff1UaZiEZWpMm1ETOx0B5J+8OKFAcq2QG/BDCOg7gd0RgPAVIJ6n3qrN40Ndlcir4SGW
         6YuaFWUXweEY86h2+t5JW+KHRHat1A8ddbSIMXYfdl1U18HpSXmoiB7x0FAv4esyfQdX
         U5CoFlP0+hwVqJ28c/ekwjk+Dx6GThOTth+Pv1alDkC+wHFzAvH2Toa2uwiawaMtSTuS
         zakn2IYm8f6ccq3RAIjvOAp1knQ4PFaesja/s5Qa5TPRuTq/dS9B+TCFXBMLcM4IHc3G
         INaw==
X-Gm-Message-State: AAQBX9dKLWx8llBdhvg0g8Cbz/g6IX7WEauBjF70rBMmjnyEBBTkGzV2
	ddBG5JCFLDxCkd77nTZcMPyesWzNAY46mqIx3JM7XRu1GSIhjiMpBp/jPF65U1U0T3Zr/jcX8Ro
	beZd88TNU+3VOoreCFw==
X-Received: by 2002:ac8:5fce:0:b0:3b9:b6e3:c78e with SMTP id k14-20020ac85fce000000b003b9b6e3c78emr5645472qta.8.1680710548137;
        Wed, 05 Apr 2023 09:02:28 -0700 (PDT)
X-Google-Smtp-Source: AKy350a9fBwBu823yNMJRRNCF/kPjd5TTa8a0sHl1G7/F6LAQ61bqbdFkGDEgXPZez2BOg5cs9V+tg==
X-Received: by 2002:ac8:5fce:0:b0:3b9:b6e3:c78e with SMTP id k14-20020ac85fce000000b003b9b6e3c78emr5645405qta.8.1680710547586;
        Wed, 05 Apr 2023 09:02:27 -0700 (PDT)
Received: from aalbersh.remote.csb ([109.183.6.197])
        by smtp.gmail.com with ESMTPSA id m12-20020ac8688c000000b003df7d7bbc8csm4060750qtq.75.2023.04.05.09.02.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 09:02:26 -0700 (PDT)
Date: Wed, 5 Apr 2023 18:02:21 +0200
From: Andrey Albershteyn <aalbersh@redhat.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: dchinner@redhat.com, ebiggers@kernel.org, hch@infradead.org,
	linux-xfs@vger.kernel.org, fsverity@lists.linux.dev,
	rpeterso@redhat.com, agruenba@redhat.com, xiang@kernel.org,
	chao@kernel.org, damien.lemoal@opensource.wdc.com, jth@kernel.org,
	linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org,
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	cluster-devel@redhat.com
Subject: Re: [PATCH v2 21/23] xfs: handle merkle tree block size != fs
 blocksize != PAGE_SIZE
Message-ID: <20230405160221.he76fb5b45dud6du@aalbersh.remote.csb>
References: <20230404145319.2057051-1-aalbersh@redhat.com>
 <20230404145319.2057051-22-aalbersh@redhat.com>
 <20230404163602.GC109974@frogsfrogsfrogs>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20230404163602.GC109974@frogsfrogsfrogs>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Darrick,

On Tue, Apr 04, 2023 at 09:36:02AM -0700, Darrick J. Wong wrote:
> On Tue, Apr 04, 2023 at 04:53:17PM +0200, Andrey Albershteyn wrote:
> > In case of different Merkle tree block size fs-verity expects
> > ->read_merkle_tree_page() to return Merkle tree page filled with
> > Merkle tree blocks. The XFS stores each merkle tree block under
> > extended attribute. Those attributes are addressed by block offset
> > into Merkle tree.
> > 
> > This patch make ->read_merkle_tree_page() to fetch multiple merkle
> > tree blocks based on size ratio. Also the reference to each xfs_buf
> > is passed with page->private to ->drop_page().
> > 
> > Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
> > ---
> >  fs/xfs/xfs_verity.c | 74 +++++++++++++++++++++++++++++++++++----------
> >  fs/xfs/xfs_verity.h |  8 +++++
> >  2 files changed, 66 insertions(+), 16 deletions(-)
> > 
> > diff --git a/fs/xfs/xfs_verity.c b/fs/xfs/xfs_verity.c
> > index a9874ff4efcd..ef0aff216f06 100644
> > --- a/fs/xfs/xfs_verity.c
> > +++ b/fs/xfs/xfs_verity.c
> > @@ -134,6 +134,10 @@ xfs_read_merkle_tree_page(
> >  	struct page		*page = NULL;
> >  	__be64			name = cpu_to_be64(index << PAGE_SHIFT);
> >  	uint32_t		bs = 1 << log_blocksize;
> > +	int			blocks_per_page =
> > +		(1 << (PAGE_SHIFT - log_blocksize));
> > +	int			n = 0;
> > +	int			offset = 0;
> >  	struct xfs_da_args	args = {
> >  		.dp		= ip,
> >  		.attr_filter	= XFS_ATTR_VERITY,
> > @@ -143,26 +147,59 @@ xfs_read_merkle_tree_page(
> >  		.valuelen	= bs,
> >  	};
> >  	int			error = 0;
> > +	bool			is_checked = true;
> > +	struct xfs_verity_buf_list	*buf_list;
> >  
> >  	page = alloc_page(GFP_KERNEL);
> >  	if (!page)
> >  		return ERR_PTR(-ENOMEM);
> >  
> > -	error = xfs_attr_get(&args);
> > -	if (error) {
> > -		kmem_free(args.value);
> > -		xfs_buf_rele(args.bp);
> > +	buf_list = kzalloc(sizeof(struct xfs_verity_buf_list), GFP_KERNEL);
> > +	if (!buf_list) {
> >  		put_page(page);
> > -		return ERR_PTR(-EFAULT);
> > +		return ERR_PTR(-ENOMEM);
> >  	}
> >  
> > -	if (args.bp->b_flags & XBF_VERITY_CHECKED)
> > +	/*
> > +	 * Fill the page with Merkle tree blocks. The blcoks_per_page is higher
> > +	 * than 1 when fs block size != PAGE_SIZE or Merkle tree block size !=
> > +	 * PAGE SIZE
> > +	 */
> > +	for (n = 0; n < blocks_per_page; n++) {
> 
> Ahah, ok, that's why we can't pass the xfs_buf pages up to fsverity.
> 
> > +		offset = bs * n;
> > +		name = cpu_to_be64(((index << PAGE_SHIFT) + offset));
> 
> Really this ought to be a typechecked helper...
> 
> struct xfs_fsverity_merkle_key {
> 	__be64	merkleoff;

Sure, thanks, will change this

> };
> 
> static inline void
> xfs_fsverity_merkle_key_to_disk(struct xfs_fsverity_merkle_key *k, loff_t pos)
> {
> 	k->merkeloff = cpu_to_be64(pos);
> }
> 
> 
> 
> > +		args.name = (const uint8_t *)&name;
> > +
> > +		error = xfs_attr_get(&args);
> > +		if (error) {
> > +			kmem_free(args.value);
> > +			/*
> > +			 * No more Merkle tree blocks (e.g. this was the last
> > +			 * block of the tree)
> > +			 */
> > +			if (error == -ENOATTR)
> > +				break;
> > +			xfs_buf_rele(args.bp);
> > +			put_page(page);
> > +			kmem_free(buf_list);
> > +			return ERR_PTR(-EFAULT);
> > +		}
> > +
> > +		buf_list->bufs[buf_list->buf_count++] = args.bp;
> > +
> > +		/* One of the buffers was dropped */
> > +		if (!(args.bp->b_flags & XBF_VERITY_CHECKED))
> > +			is_checked = false;
> 
> If there's enough memory pressure to cause the merkle tree pages to get
> evicted, what are the chances that the xfs_bufs survive the eviction?

The merkle tree pages are dropped after verification. When page is
dropped xfs_buf is marked as verified. If fs-verity wants to
verify again it will get the same verified buffer. If buffer is
evicted it won't have verified state.

So, with enough memory pressure buffers will be dropped and need to
be reverified.

> 
> > +		memcpy(page_address(page) + offset, args.value, args.valuelen);
> > +		kmem_free(args.value);
> > +		args.value = NULL;
> > +	}
> > +
> > +	if (is_checked)
> >  		SetPageChecked(page);
> > +	page->private = (unsigned long)buf_list;
> >  
> > -	page->private = (unsigned long)args.bp;
> > -	memcpy(page_address(page), args.value, args.valuelen);
> > -
> > -	kmem_free(args.value);
> >  	return page;
> >  }
> >  
> > @@ -191,16 +228,21 @@ xfs_write_merkle_tree_block(
> >  
> >  static void
> >  xfs_drop_page(
> > -	struct page	*page)
> > +	struct page			*page)
> >  {
> > -	struct xfs_buf *buf = (struct xfs_buf *)page->private;
> > +	int				i = 0;
> > +	struct xfs_verity_buf_list	*buf_list =
> > +		(struct xfs_verity_buf_list *)page->private;
> >  
> > -	ASSERT(buf != NULL);
> > +	ASSERT(buf_list != NULL);
> >  
> > -	if (PageChecked(page))
> > -		buf->b_flags |= XBF_VERITY_CHECKED;
> > +	for (i = 0; i < buf_list->buf_count; i++) {
> > +		if (PageChecked(page))
> > +			buf_list->bufs[i]->b_flags |= XBF_VERITY_CHECKED;
> > +		xfs_buf_rele(buf_list->bufs[i]);
> > +	}
> >  
> > -	xfs_buf_rele(buf);
> > +	kmem_free(buf_list);
> >  	put_page(page);
> >  }
> >  
> > diff --git a/fs/xfs/xfs_verity.h b/fs/xfs/xfs_verity.h
> > index ae5d87ca32a8..433b2f4ae3bc 100644
> > --- a/fs/xfs/xfs_verity.h
> > +++ b/fs/xfs/xfs_verity.h
> > @@ -16,4 +16,12 @@ extern const struct fsverity_operations xfs_verity_ops;
> >  #define xfs_verity_ops NULL
> >  #endif	/* CONFIG_FS_VERITY */
> >  
> > +/* Minimal Merkle tree block size is 1024 */
> > +#define XFS_VERITY_MAX_MBLOCKS_PER_PAGE (1 << (PAGE_SHIFT - 10))
> > +
> > +struct xfs_verity_buf_list {
> > +	unsigned int	buf_count;
> > +	struct xfs_buf	*bufs[XFS_VERITY_MAX_MBLOCKS_PER_PAGE];
> 
> So... this is going to be a 520-byte allocation on arm64 with 64k pages?
> Even if the merkle tree block size is the same as the page size?  Ouch.

yeah, it also allocates a page and is dropped with the page, so,
I took it as an addition to already big chunk of memory. But I
probably will change it, viz. comment from Eric on this patch.

-- 
- Andrey

