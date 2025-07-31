Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6398381E
	for <fsverity@lists.linux.dev>; Thu, 31 Jul 2025 15:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753974273; cv=none; b=VV7wF6d6omRuAXkfWZ5F55UhHGNnX1qzARCFewJAO3tKtisb+VLukI0hmMTsPlrYHuvRrl6CEHdbaBiA5ipKJtGLGhyd2X0ZExC2BuPfu4UDuKfZbYThAOLDXrisLEO/b01DtlK45WY+evuXaW1jdLBKZ2HMp2XAIX9SlL8rb5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753974273; c=relaxed/simple;
	bh=l2A8KqcNihaR78kVgz4RRAisascIyaPt/Bghlwi1/UE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=amD5pB/imos7lG9K261nOeYIUjEkvDctOHuvowZUKcaUCoQTmGDt72M3C3ok/gtkB4p+fBE7d3XpRf4IgQztTSn25o8I3Cpvo27H+wQd9xA/Z6QmYr4G1Vqu22hgZsK3On5oyc9PLh06h5WDdGN86gQesycMaPODi9znMb9VGU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BEcGQHW3; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BEcGQHW3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753974270;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7ITeDGbZ2O04OUGrMEksyGPJeLffXN0Jxej6Zs+oslg=;
	b=BEcGQHW385muYjASJN2JTPegkTfBgqUbIA+V2awggGpNwKGps25fpgqArK2p7CYxLYfqBW
	uID7Ub+QOHtijc2+S4CKLcenufszu2XLijBMQNB+N38xMWBt9riNA6ZA5lA7GFsmH8vIgR
	mAG9akh6LOQ4a32pnWOaw54wIcg0QKI=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-18-fL9GF1UnNHKi_4lGyunKjg-1; Thu, 31 Jul 2025 11:04:28 -0400
X-MC-Unique: fL9GF1UnNHKi_4lGyunKjg-1
X-Mimecast-MFC-AGG-ID: fL9GF1UnNHKi_4lGyunKjg_1753974268
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-ae708b158f2so82133966b.3
        for <fsverity@lists.linux.dev>; Thu, 31 Jul 2025 08:04:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753974268; x=1754579068;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ITeDGbZ2O04OUGrMEksyGPJeLffXN0Jxej6Zs+oslg=;
        b=g2tMj0/WwhhtNsoAfNSCPr1N1vYJHgNA9xXdpedY1P/W9jfGf9p9jn4c4GBodutVDS
         hwzJRShL2+J1mxN3CS4s/JKEflL1HQqk+E+av36TVB6Wk2fj82xaWmGt1s8CJKB4jJ5z
         p51CuP6CvMbkBW/5lS7sZRrnZrKZs8hPEPxVlf3kDnuGyL0xoCKBP6+j5be7uvz1HEL9
         qRqvBSz4wRBSDnccI7rInDC3nl7+th7++jK5GhS9sfCZYceHkS8pZ2zXaVy5Ye/5Fd04
         gCE+GYtD8IBg5gr4x0cH1ib3ens4qzSxNitCYHJhPgeuCvBaD5AKN8gDiGEv0X0Fl/gM
         1I2Q==
X-Gm-Message-State: AOJu0Yw5SOoA66m1jVC668PJRrOgGkiIhByOs/puskzuZCEou3Uuy7Gd
	2GVPpYEt3iKl3xw5KouNLFEF2GVSACiGdAcQW3Ma0EEaEX5Lg82LL45+tn4kU9/wqPfXnPYFhvf
	gh/j/XYQE+yWCgpu3/5ORe8qsivBa5hZ4dKnpWkn6QbuVwFf+mfAJevS8J0M=
X-Gm-Gg: ASbGnctWLWdkB7qRLMjV1gV4kxI5yaN1gQVGTq+1Sw/ztwC1sGEJ13y9XN3bzj4eQ60
	8WPR+POQvOM2GfCSZ4c2qkcvyV/NxEwBxRFVeU+1YfbsOg0QC9lhchzSUjD7xdACBMPhRBN52lT
	RXC46jpsllyyFJvd6sYLSgs1xJ9gwXM6KJsx+lIFkLdItJLoHES2vX3brqneSnE3cSf2iw+YNiO
	UNSOs4AzM/ecr2+9fQbCvqNrfD8TwqodN/u/1amLMedSTAupquhqCf4eKPs6IhwtDt5uG598IkO
	tyYigrh885qkt2d2q1sB3DQyxAHXEct6FSbZQ9qkGsTStnAIclpLAxTeuGM=
X-Received: by 2002:a17:907:7b86:b0:af9:29c1:1103 with SMTP id a640c23a62f3a-af929c113ccmr49446666b.55.1753974267381;
        Thu, 31 Jul 2025 08:04:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE2H4LIPL12j3qW/yGGCCmOnDSbqpel+xd+fEj1NOlXlMnjHTd1aHsEE2cdwQmPhM7OdTqi5w==
X-Received: by 2002:a17:907:7b86:b0:af9:29c1:1103 with SMTP id a640c23a62f3a-af929c113ccmr49440766b.55.1753974266858;
        Thu, 31 Jul 2025 08:04:26 -0700 (PDT)
Received: from thinky (ip-217-030-074-039.aim-net.cz. [217.30.74.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a0def2esm119318666b.61.2025.07.31.08.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 08:04:26 -0700 (PDT)
Date: Thu, 31 Jul 2025 17:04:25 +0200
From: Andrey Albershteyn <aalbersh@redhat.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: fsverity@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
	linux-xfs@vger.kernel.org, david@fromorbit.com, ebiggers@kernel.org, hch@lst.de, 
	Andrey Albershteyn <aalbersh@kernel.org>
Subject: Re: [PATCH RFC 01/29] iomap: add iomap_writepages_unbound() to write
 beyond EOF
Message-ID: <b5mblbmz32iobfmsg2remrevgrb3fqzlg463mwycruzmxpjdrk@dm54azica6xr>
References: <20250728-fsverity-v1-0-9e5443af0e34@kernel.org>
 <20250728-fsverity-v1-1-9e5443af0e34@kernel.org>
 <20250729220743.GI2672049@frogsfrogsfrogs>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20250729220743.GI2672049@frogsfrogsfrogs>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xa_R4mRMvscM6RggKykhaX58pl2LNcG0U_5O9b4NOjo_1753974268
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2025-07-29 15:07:43, Darrick J. Wong wrote:
> On Mon, Jul 28, 2025 at 10:30:05PM +0200, Andrey Albershteyn wrote:
> > From: Andrey Albershteyn <aalbersh@redhat.com>
> > 
> > Add iomap_writepages_unbound() without limit in form of EOF. XFS
> > will use this to write metadata (fs-verity Merkle tree) in range far
> > beyond EOF.
> 
> ...and I guess some day fscrypt might use it to encrypt merkle trees
> too?

Probably, then, the region offsets will need to be adjusted also.

> 
> > Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org>
> > ---
> >  fs/iomap/buffered-io.c | 51 +++++++++++++++++++++++++++++++++++++++-----------
> >  include/linux/iomap.h  |  3 +++
> >  2 files changed, 43 insertions(+), 11 deletions(-)
> > 
> > diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
> > index 3729391a18f3..7bef232254a3 100644
> > --- a/fs/iomap/buffered-io.c
> > +++ b/fs/iomap/buffered-io.c
> > @@ -1881,18 +1881,10 @@ static int iomap_writepage_map(struct iomap_writepage_ctx *wpc,
> >  	int error = 0;
> >  	u32 rlen;
> >  
> > -	WARN_ON_ONCE(!folio_test_locked(folio));
> > -	WARN_ON_ONCE(folio_test_dirty(folio));
> > -	WARN_ON_ONCE(folio_test_writeback(folio));
> > -
> > -	trace_iomap_writepage(inode, pos, folio_size(folio));
> > -
> > -	if (!iomap_writepage_handle_eof(folio, inode, &end_pos)) {
> > -		folio_unlock(folio);
> > -		return 0;
> > -	}
> >  	WARN_ON_ONCE(end_pos <= pos);
> >  
> > +	trace_iomap_writepage(inode, pos, folio_size(folio));
> > +
> >  	if (i_blocks_per_folio(inode, folio) > 1) {
> >  		if (!ifs) {
> >  			ifs = ifs_alloc(inode, folio, 0);
> > @@ -1956,6 +1948,23 @@ static int iomap_writepage_map(struct iomap_writepage_ctx *wpc,
> >  	return error;
> >  }
> >  
> > +/* Map pages bound by EOF */
> > +static int iomap_writepage_map_eof(struct iomap_writepage_ctx *wpc,
> 
> iomap_writepage_map_within_eof ?

sure

> 
> > +		struct writeback_control *wbc, struct folio *folio)
> > +{
> > +	int error;
> > +	struct inode *inode = folio->mapping->host;
> > +	u64 end_pos = folio_pos(folio) + folio_size(folio);
> > +
> > +	if (!iomap_writepage_handle_eof(folio, inode, &end_pos)) {
> > +		folio_unlock(folio);
> > +		return 0;
> > +	}
> > +
> > +	error = iomap_writepage_map(wpc, wbc, folio);
> > +	return error;
> > +}
> > +
> >  int
> >  iomap_writepages(struct address_space *mapping, struct writeback_control *wbc,
> >  		struct iomap_writepage_ctx *wpc,
> > @@ -1972,9 +1981,29 @@ iomap_writepages(struct address_space *mapping, struct writeback_control *wbc,
> >  			PF_MEMALLOC))
> >  		return -EIO;
> >  
> > +	wpc->ops = ops;
> > +	while ((folio = writeback_iter(mapping, wbc, folio, &error))) {
> > +		WARN_ON_ONCE(!folio_test_locked(folio));
> > +		WARN_ON_ONCE(folio_test_dirty(folio));
> > +		WARN_ON_ONCE(folio_test_writeback(folio));
> > +
> > +		error = iomap_writepage_map_eof(wpc, wbc, folio);
> > +	}
> > +	return iomap_submit_ioend(wpc, error);
> > +}
> > +EXPORT_SYMBOL_GPL(iomap_writepages);
> > +
> > +int
> > +iomap_writepages_unbound(struct address_space *mapping, struct writeback_control *wbc,
> 
> Might want to leave a comment here explaining what's the difference
> between the two iomap_writepages exports:
> 
> /*
>  * Write dirty pages, including any beyond EOF.  This is solely for use
>  * by files that allow post-EOF pagecache, which means fsverity.
>  */

sure, thanks!

> 
> > +		struct iomap_writepage_ctx *wpc,
> > +		const struct iomap_writeback_ops *ops)
> > +{
> > +	struct folio *folio = NULL;
> > +	int error;
> > +
> 
> ...and you might want a:
> 
> 	WARN_ON(!IS_VERITY(wpc->inode));
> 
> to keep it that way.

yup, make sense, thanks!

> 
> --D
> 
> >  	wpc->ops = ops;
> >  	while ((folio = writeback_iter(mapping, wbc, folio, &error)))
> >  		error = iomap_writepage_map(wpc, wbc, folio);
> >  	return iomap_submit_ioend(wpc, error);
> >  }
> > -EXPORT_SYMBOL_GPL(iomap_writepages);
> > +EXPORT_SYMBOL_GPL(iomap_writepages_unbound);
> > diff --git a/include/linux/iomap.h b/include/linux/iomap.h
> > index 522644d62f30..4a0b5ebb79e9 100644
> > --- a/include/linux/iomap.h
> > +++ b/include/linux/iomap.h
> > @@ -464,6 +464,9 @@ void iomap_sort_ioends(struct list_head *ioend_list);
> >  int iomap_writepages(struct address_space *mapping,
> >  		struct writeback_control *wbc, struct iomap_writepage_ctx *wpc,
> >  		const struct iomap_writeback_ops *ops);
> > +int iomap_writepages_unbound(struct address_space *mapping,
> > +		struct writeback_control *wbc, struct iomap_writepage_ctx *wpc,
> > +		const struct iomap_writeback_ops *ops);
> >  
> >  /*
> >   * Flags for direct I/O ->end_io:
> > 
> > -- 
> > 2.50.0
> > 
> > 
> 

-- 
- Andrey

