Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 415397EB
	for <fsverity@lists.linux.dev>; Wed,  5 Apr 2023 11:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680692486;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BoHgQZFE6GmfSeys+DR2W7oxw4hgWtoFTpySQ2VkKFk=;
	b=V0YFHs3q1dLyZp4PMwJNCCZ33lAFL3XbzLK2np25QTW7So8YIDuXIa+RO/8Dnu2ClfuhnK
	ZPRWi7QRhYts68A5SRVeptxYKJ77Lv9cKPElSU901ixPibk7i2+Ak241hDyVxHeAUytT9c
	dncUlvYXYDjomzIs6g84eq76rx7baj8=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-141-oMMTI6H0NGK3RBZYlp3mCg-1; Wed, 05 Apr 2023 07:01:24 -0400
X-MC-Unique: oMMTI6H0NGK3RBZYlp3mCg-1
Received: by mail-qk1-f197.google.com with SMTP id 198-20020a370bcf000000b007468cffa4e2so16029014qkl.10
        for <fsverity@lists.linux.dev>; Wed, 05 Apr 2023 04:01:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680692482;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BoHgQZFE6GmfSeys+DR2W7oxw4hgWtoFTpySQ2VkKFk=;
        b=aq4+kF7GtRZFP3Trg3IgJ0QlV/THc0k/h3AuWaMvZ0suioSf4m7N55LYqMCr8W68yw
         +u3jXyyWnrxAnY0K5fxcFxfOD2X5ypxZeFXfCcENtsbJu+54vg0jtcsl4GTIper6NHO4
         Wh/2sulltZJ037QRx0JmafdK4MIdKUZD/FEpoSE0lzO5sQbobSdljyPRbWkkPA21Q/xu
         SLFJHCB+wjsnw3PwtKl05PYuIP5zvGfEI8OmxJM9q1m3kZeqhQPIyx06B52fFQ4rh/3R
         FOw2PW8XrGaG9bsah3Xh0XhUwpHmJxTeBNBt+bBLCiQrp7kr88Trh/7NYSgjNAdOYLFR
         kbbQ==
X-Gm-Message-State: AAQBX9eeIuO3HafDcHXwr5am70N+K5FMtU42+sgdnyShY1o+NwySD7y0
	HEWozoEcusAdKyMJfOdHeDQA/FiOTgr5/yFKiax9H/5mOumwmFtPtevhQYG1QUrkK1KBGmFoj+o
	RVDlkNItc5fM7LWvrjg==
X-Received: by 2002:a05:6214:4001:b0:5ca:f6dd:f3b6 with SMTP id kd1-20020a056214400100b005caf6ddf3b6mr8310664qvb.16.1680692482378;
        Wed, 05 Apr 2023 04:01:22 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZN5rxyt4g78lpjs6te5NjsBmYN83L29u8HXb3VRNmLRZGiyzEv7hgqJmGPE20fJY6cuY/SPQ==
X-Received: by 2002:a05:6214:4001:b0:5ca:f6dd:f3b6 with SMTP id kd1-20020a056214400100b005caf6ddf3b6mr8310617qvb.16.1680692482068;
        Wed, 05 Apr 2023 04:01:22 -0700 (PDT)
Received: from aalbersh.remote.csb ([109.183.6.197])
        by smtp.gmail.com with ESMTPSA id om30-20020a0562143d9e00b005dd8b934576sm4136208qvb.14.2023.04.05.04.01.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 04:01:21 -0700 (PDT)
Date: Wed, 5 Apr 2023 13:01:16 +0200
From: Andrey Albershteyn <aalbersh@redhat.com>
To: Christoph Hellwig <hch@infradead.org>
Cc: djwong@kernel.org, dchinner@redhat.com, ebiggers@kernel.org,
	linux-xfs@vger.kernel.org, fsverity@lists.linux.dev,
	rpeterso@redhat.com, agruenba@redhat.com, xiang@kernel.org,
	chao@kernel.org, damien.lemoal@opensource.wdc.com, jth@kernel.org,
	linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org,
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	cluster-devel@redhat.com
Subject: Re: [PATCH v2 09/23] iomap: allow filesystem to implement read path
 verification
Message-ID: <20230405110116.ia5wv3qxbnpdciui@aalbersh.remote.csb>
References: <20230404145319.2057051-1-aalbersh@redhat.com>
 <20230404145319.2057051-10-aalbersh@redhat.com>
 <ZCxEHkWayQyGqnxL@infradead.org>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <ZCxEHkWayQyGqnxL@infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Christoph,

On Tue, Apr 04, 2023 at 08:37:02AM -0700, Christoph Hellwig wrote:
> >  	if (iomap_block_needs_zeroing(iter, pos)) {
> >  		folio_zero_range(folio, poff, plen);
> > +		if (iomap->flags & IOMAP_F_READ_VERITY) {
> 
> Wju do we need the new flag vs just testing that folio_ops and
> folio_ops->verify_folio is non-NULL?

Yes, it can be just test, haven't noticed that it's used only here,
initially I used it in several places.

> 
> > -		ctx->bio = bio_alloc(iomap->bdev, bio_max_segs(nr_vecs),
> > -				     REQ_OP_READ, gfp);
> > +		ctx->bio = bio_alloc_bioset(iomap->bdev, bio_max_segs(nr_vecs),
> > +				REQ_OP_READ, GFP_NOFS, &iomap_read_ioend_bioset);
> 
> All other callers don't really need the larger bioset, so I'd avoid
> the unconditional allocation here, but more on that later.

Ok, make sense.

> 
> > +		ioend = container_of(ctx->bio, struct iomap_read_ioend,
> > +				read_inline_bio);
> > +		ioend->io_inode = iter->inode;
> > +		if (ctx->ops && ctx->ops->prepare_ioend)
> > +			ctx->ops->prepare_ioend(ioend);
> > +
> 
> So what we're doing in writeback and direct I/O, is to:
> 
>  a) have a submit_bio hook
>  b) allow the file system to then hook the bi_end_io caller
>  c) (only in direct O/O for now) allow the file system to provide
>     a bio_set to allocate from

I see.

> 
> I wonder if that also makes sense and keep all the deferral in the
> file system.  We'll need that for the btrfs iomap conversion anyway,
> and it seems more flexible.  The ioend processing would then move into
> XFS.
> 

Not sure what you mean here.

> > @@ -156,6 +160,11 @@ struct iomap_folio_ops {
> >  	 * locked by the iomap code.
> >  	 */
> >  	bool (*iomap_valid)(struct inode *inode, const struct iomap *iomap);
> > +
> > +	/*
> > +	 * Verify folio when successfully read
> > +	 */
> > +	bool (*verify_folio)(struct folio *folio, loff_t pos, unsigned int len);
> 
> Why isn't this in iomap_readpage_ops?
> 

Yes, it can be. But it appears to me to be more relevant to
_folio_ops, any particular reason to move it there? Don't mind
moving it to iomap_readpage_ops.

-- 
- Andrey

