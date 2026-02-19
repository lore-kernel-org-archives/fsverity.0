Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 206533382E8
	for <fsverity@lists.linux.dev>; Thu, 19 Feb 2026 14:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771510998; cv=none; b=YoFGxFPU9wMyJgNuwZofggEiiJ7DbHO6etSTz85O4C7hIhFIQSUGOTql49RVudxYb/bkCdDUDYzZDyPDqOOuhRKHxIcqwaB0aNLb9nW8QYHmPpRf7U49AmWTRj/yUZQI1a723krOlE8qu3tPfxMK1XTilubA+6hqjGBsyV2d5lM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771510998; c=relaxed/simple;
	bh=ZrKSzVTQMlzjhHHLkggaBkEKCBxQTXU9GuPjLSZmUro=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=lJbea2C2rufNVjofxiqWhmu+37vfEmvIdAOrsIIDM2ArQrwj61mxKVLXsdUVcpNAS4WhCXI7tkrqGAApGafp0oB4hTxYB5enAKD6yYpIRmU0d18zSBsrtmaEFP080RfUULh79wpfxYPJSMhYrS3jshTCRmwClZBGZsdgo0/D/4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZJ8kmtq0; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZJ8kmtq0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771510996;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FbHvuuKoNJAJaoIiQsSzhjqIeQ7NdHJUqSJNAtbvmAg=;
	b=ZJ8kmtq0K+HTG5M3js3xFIljlXj4yEh3IURxbT/3psSlJiFNLNusCu06VQae0l4U1yQZ4a
	JYs0IBdc9XZfqGuC2hNZjBL79JM6ol0PgQeHM3bk7zPiJEe0lXcx2G5eSj2XhuPJdCVszB
	Pm7+X5NFj0WNXKKTXXG9TFBwwUsVEdk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-363-trJZ67CXOjCclWSfeItoYw-1; Thu, 19 Feb 2026 09:23:14 -0500
X-MC-Unique: trJZ67CXOjCclWSfeItoYw-1
X-Mimecast-MFC-AGG-ID: trJZ67CXOjCclWSfeItoYw_1771510993
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4837907ec88so16131125e9.0
        for <fsverity@lists.linux.dev>; Thu, 19 Feb 2026 06:23:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771510993; x=1772115793;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FbHvuuKoNJAJaoIiQsSzhjqIeQ7NdHJUqSJNAtbvmAg=;
        b=ss0bIu2o7jfg/tdfSfYRpLmVqy4NPXZKXq0laOSCJ1fz/lKkGbGrVaYv4FH4Xyq+Aw
         3bw0rWIobjCdwPFSway/HyKC+iXujawdd7rOKGZ7j/ypbBRp8ho3ticzpeC1kxdA4wpY
         /ZcMH+uyiM9tBBeh5MnO+XH5eQkzmkQQwCfI5t+MnWuguOABwyRGhhy5GxhQgUCJSzgO
         JQpEWRKBjHjfoFcbH6N5h/dLKTjbyWlYEJm3UJ1UEWbOujxbtnDw7R/BeqXGN5Swn/f9
         Dw6PkK3+iofKdxNoozMAg1WVOe5wSkT6YHFMJv1bA/i3p7EI2+TEhn6hEP9/28E7sZ+0
         +ffA==
X-Forwarded-Encrypted: i=1; AJvYcCVqRSfvBcG5WsMNj5RuiyQdHm/6I4c+QeG4XWTPMMiKzUNyoXpKg20RW5ofGR6+9xQzr2GUxcTGmA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxOMVe+9BUqS7ZvtXqz//pKYbahIlW2bOGvppTuf7XLaXmjg9T1
	BEGIt239NA2xqWNEwWfNUmrNNSyBaFos2ktzG3N+i9kTxDgRLFbuimtcDmxxQ2eZuNY2/GQCPUM
	P2auGJPckhrbrJJWTx7ukACUE3LBApvVcIsm4X2VMtEQde/CZzFLIQndzFAQ=
X-Gm-Gg: AZuq6aL9lPpg1X5bPc/+u2vygpLOYE4+tlIp2jpHuETyHTKmTy01XTPQunbGY5oEugu
	hhJmuBe9EeyKndGSpjNkhC8aAzhykU1mipstxo7auZ4qm4IKngzPamLuacmcxwr6ggvj9lh6Bdi
	5WKR1R/kLYOBBz4gbyhN00W/9ZLYO1RfxAKIPRkbhNo0WW+1w46Y3bqnFaYbuCZLB6rFcWzh+1G
	JyqAHFUKcYCJ/iPT8LXsYXBMYf1ou3Kv2myALZYW+DTlX/uUtEQPriklAUh5SU66vQPdtwwEkLn
	V/mVf2VUj/LCBdbYGURivel9u3Sk61Jufwg0Z4PhmouE/iPszOXRLWaJzNNZId5ju+/6HaxawuD
	FoijE1BD9RnA=
X-Received: by 2002:a05:600c:458a:b0:483:6f37:1b33 with SMTP id 5b1f17b1804b1-48373a58babmr320615195e9.30.1771510993038;
        Thu, 19 Feb 2026 06:23:13 -0800 (PST)
X-Received: by 2002:a05:600c:458a:b0:483:6f37:1b33 with SMTP id 5b1f17b1804b1-48373a58babmr320614575e9.30.1771510992342;
        Thu, 19 Feb 2026 06:23:12 -0800 (PST)
Received: from thinky ([217.30.74.39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a31c56d8sm10551145e9.8.2026.02.19.06.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 06:23:11 -0800 (PST)
Date: Thu, 19 Feb 2026 15:23:11 +0100
From: Andrey Albershteyn <aalbersh@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Cc: Andrey Albershteyn <aalbersh@kernel.org>, linux-xfs@vger.kernel.org, 
	fsverity@lists.linux.dev, linux-fsdevel@vger.kernel.org, ebiggers@kernel.org, 
	djwong@kernel.org
Subject: Re: [PATCH v3 11/35] iomap: allow filesystem to read fsverity
 metadata beyound EOF
Message-ID: <bltgc6uliclhzkuqd4la2tzp6x7vsww73nvjedxh7s624tby3k@jw4ij5irh6ni>
References: <20260217231937.1183679-1-aalbersh@kernel.org>
 <20260217231937.1183679-12-aalbersh@kernel.org>
 <20260218063606.GD8600@lst.de>
 <hfteu6bonpv7djecbf3d6ekh56ktgcl4c2lvtjtrjfetzaq5dw@scsrvxx5rgig>
 <20260219060420.GC3739@lst.de>
 <qheg77kxcl4ecqdrsnmz4acfvszjlamlb7ilgxxyf3pmt4r7ah@5fzzmcpurdfp>
 <20260219133829.GA11935@lst.de>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260219133829.GA11935@lst.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: wdCbUNLTsY9Tg-XecfitcGpUCYBbnV7n9OnIjSwwY38_1771510993
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2026-02-19 14:38:29, Christoph Hellwig wrote:
> On Thu, Feb 19, 2026 at 12:11:18PM +0100, Andrey Albershteyn wrote:
> > > > fsverity descriptor. This is basically the case as for EOF folio.
> > > > Descriptor is the end of the fsverity metadata region. If we have 1k
> > > > fs blocks (= merkle blocks) we can have [descriptor | hole ] folio.
> > > > As we are not limited by i_size here, iomap_block_needs_zeroing()
> > > > won't fire to zero this hole. So, this case is to mark this tail as
> > > > uptodate.
> > > 
> > > How do we end up in that without ctx->vi set?
> > 
> > We're reading it
> 
> Did a part of that sentence get lost?

I mean that to have ctx->vi we need to read fsverity descriptor
first. When iomap is reading fsverity descriptor inode won't have
any fsverity_info yet.

> >  
> > -               /* zero post-eof blocks as the page may be mapped */
> > -               if (iomap_block_needs_zeroing(iter, pos) &&
> > -                   !(iomap->flags & IOMAP_F_FSVERITY)) {
> > +               /*
> > +                * Handling of fsverity "holes". We hits this for two case:
> > +                *   1. No need to go further, the hole after fsverity
> > +                *      descriptor is the end of the fsverity metadata.
> > +                *
> > +                *   2. This folio contains merkle tree blocks which need to be
> 
> Overly long line here.
> 
> > +                *      synthesized and fsverity descriptor.
> > +                */
> > +               if ((iomap->flags & IOMAP_F_FSVERITY) &&
> > +                   iomap->type == IOMAP_HOLE) {
> > +                       /*
> > +                        * Synthesize the hash value for a zeroed folio if we
> > +                        * are reading merkle tree blocks.
> > +                        */
> 
> .. and we'll probably want to merge this into the above comment.

sure

> 
> > +                       if (ctx->vi)
> > +                               fsverity_folio_zero_hash(folio, poff, plen,
> > +                                                        ctx->vi);
> > +                       iomap_set_range_uptodate(folio, poff, plen);
> > +               } else if (iomap_block_needs_zeroing(iter, pos) &&
> > +                          !(iomap->flags & IOMAP_F_FSVERITY)) {
> > +                       /* zero post-eof blocks as the page may be mapped */
> >                         folio_zero_range(folio, poff, plen);
> > +                       if (fsverity_active(iter->inode) &&
> > +                           !fsverity_verify_blocks(ctx->vi, folio, plen, poff))
> 
> Another overly long line here.  Also we should avoid the
> fsverity_active check here, as it causes a rhashtable lookup.  F2fs
> and ext4 just check ctx->vi, but based on the checks above, we seem
> to set this also for (some) reads of the fsverity metadata.  But as
> we exclude IOMAP_F_FSVERITY above, we might actually be fine with a
> ctx->vi anyway.

Don't you confused this with fsverity_get_info()? I don't see how it
could cause lookup.

> 
> Please document the rules for ctx->vi while were it.
> 

Hmm, the vi is set in iomap_read_folio() [1] and then used down
through I/O up to ioend completion. What info you would like to see
there?

https://lore.kernel.org/fsverity/20260217231937.1183679-10-aalbersh@kernel.org/T/#u

-- 
- Andrey

