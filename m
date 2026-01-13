Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C4C3451B0
	for <fsverity@lists.linux.dev>; Tue, 13 Jan 2026 10:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768300786; cv=none; b=TMrD0PeVmvCrCfYfEKffTGh4H9iWdPkQSIaUyi10+Odtmhld+gcBR6jSsWEfw8nlUmyudeNkz2gXccTP+s34gOS5kAjUFwfYZYmi1hlHPndrIuHaF9GsEO5hSsjvt+Wp9mCsXyRGVJuUaPONvIEAWmrcgrp0G6bseHpY9nQl3Us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768300786; c=relaxed/simple;
	bh=L1eUBbPokLBPE3y6roA4cFp01J7xKbKvqN8kV2tZYnA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=hn9MJB0drMBz1AlUqCP/vyHIN+sUOW0Y/X+F7Z4Z03D3/V3FuBTHsDyKaF4yvK52cwV7jIgX+FpndvcB2sT0XXIm2h9DeIIMC2cI3JtuPvW0sQN+JGngHDZTcPzRojAtKEPaYAsCCR2WQ6SWSLQOCr5BYmX1RuhNVFvF7n33uMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JUlP9QNW; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JUlP9QNW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768300782;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oRY1Papqna+6VteCH2AFvtA5W4GaXMzSIx7WQy0o9ac=;
	b=JUlP9QNWxqe3yhRNKDdoD0p8nSLZRkgiwVe+X3RvEvMOg+Sze7pb4dRcHZWLG/s8zVDoJk
	qsLNt+y2L/ecprabhAfRYR1uerwuvSwqDDqElb86SNvo2n2wsYExbWe39OMSbJ1429yiD6
	+saDoSFgPw1rZIehbx3HcPrkxKoJQvw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-583-E3wY0SyKN-C8y_bm_lgGbQ-1; Tue, 13 Jan 2026 05:39:41 -0500
X-MC-Unique: E3wY0SyKN-C8y_bm_lgGbQ-1
X-Mimecast-MFC-AGG-ID: E3wY0SyKN-C8y_bm_lgGbQ_1768300781
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-47d3ffa98fcso48593745e9.3
        for <fsverity@lists.linux.dev>; Tue, 13 Jan 2026 02:39:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768300780; x=1768905580;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oRY1Papqna+6VteCH2AFvtA5W4GaXMzSIx7WQy0o9ac=;
        b=kqYaDNm20+/QubC+NuSirvhth/wAnl1HKdoygmjt1MxerXjIR9pwaOfjYkopsql88E
         b0ck3avEH8kOCWzJZhdU6GrZWDiPIVmwe5RBj8vlC1IIPdEujUo4Rn7zYmoW2k4CRb+/
         KDw/ILxsQUrKffJP9QV2LXpPXi3V8EHLCV4Wq/Zj2zZTt3/oThMBHIsk/95nAGHjaYUk
         pWm8pBbiyFT2iwjTJHyzPyGC7orLXQtQsXEKd7VX4iYLD/YsTRll7gqFkoUYsg+Drh+e
         c4CxMBdvkKqLr4jTBRILuTm63Ba90T0ggZKqBm9Olex7YCKpa2elaCkf//Mo3K563PCo
         akjA==
X-Gm-Message-State: AOJu0Yzx8lT+zAe0leqtI24uT8iBW6DiqZ5I77edp9fFLChS7i/bOYBT
	Vi/Q5Vb0luIgTWdTUzcQHt29N0fZ/cCNMKolHvKcGwqV7Lc0ni9UQhdCIJlFCw/slvkjSuATp6L
	+5j1Bxd7s3E8WB8ADWTjUE4xUKRcePfg3XOa0W6i8xVVYo9jWU0AkR1j5XYlbqzao8CU=
X-Gm-Gg: AY/fxX7ibxM/m3wI/Rmn2Q7UI1F84X0dBOfc84poejsurZQigASczeHpg94pm0FH4Av
	0SF5Ig02Y1ySE+bxZmjCoJNqheC2FeeMW4e5ourZzzfOl61FYDCyyMOBLbC7Mt46mzjsq8drf7R
	E29nRqYTG7zFMA/0KSZmQ60y+/NsQh5jsidQXjnPRZHukZLJOrrzvbXyOan/Ndw95uhtmO42sKq
	e+ksn/djCAjtG7pMPAFGELH0rh1lTiQV92ABKswtrckEHZi1NUNQiC3jbguEpWxAYHrHKrNfAXF
	gEzWP3c8gp9kfhbWZr1AY0TueZNdJIYtRcVwMMDHNA68oG4RwR1Ok8+8txsV9XqP09Ohh4MGUkc
	=
X-Received: by 2002:a05:600c:4fc6:b0:477:b734:8c41 with SMTP id 5b1f17b1804b1-47d84b0b320mr239515765e9.1.1768300780247;
        Tue, 13 Jan 2026 02:39:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGEmQllHcVxm7YMRWnIy0b/NbiM/9edk0sK25a00CV3tkioxyNGlnGyr83KsHze3vdlvpabJw==
X-Received: by 2002:a05:600c:4fc6:b0:477:b734:8c41 with SMTP id 5b1f17b1804b1-47d84b0b320mr239515475e9.1.1768300779721;
        Tue, 13 Jan 2026 02:39:39 -0800 (PST)
Received: from thinky ([217.30.74.39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47eda5854f4sm11656095e9.20.2026.01.13.02.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 02:39:39 -0800 (PST)
Date: Tue, 13 Jan 2026 11:39:38 +0100
From: Andrey Albershteyn <aalbersh@redhat.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: fsverity@lists.linux.dev, linux-xfs@vger.kernel.org, 
	ebiggers@kernel.org, linux-fsdevel@vger.kernel.org, aalbersh@kernel.org, 
	david@fromorbit.com, hch@lst.de
Subject: Re: [PATCH v2 3/22] iomap: introduce IOMAP_F_BEYOND_EOF
Message-ID: <lsggncpo3kbgjilvph2wjucrkvrwdggmbtosu6zqbrzs564u7d@nn4iyhq6edtz>
References: <cover.1768229271.patch-series@thinky>
 <d5fc72ldfwyzbgiypzlhn5diiqyijxaicpa3w6obx4iismuko3@kttpcgqjy6i5>
 <20260112221853.GI15551@frogsfrogsfrogs>
 <20260112223158.GK15551@frogsfrogsfrogs>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260112223158.GK15551@frogsfrogsfrogs>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: hBIEPodNzGIZTjNpHqIcAxzXD43opFYKF-aBGXRSmi8_1768300781
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2026-01-12 14:31:58, Darrick J. Wong wrote:
> On Mon, Jan 12, 2026 at 02:18:53PM -0800, Darrick J. Wong wrote:
> > On Mon, Jan 12, 2026 at 03:50:05PM +0100, Andrey Albershteyn wrote:
> > > Flag to indicate to iomap that read/write is happening beyond EOF and no
> > > isize checks/update is needed.
> > > 
> > > Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org>
> > > ---
> > >  fs/iomap/buffered-io.c | 13 ++++++++-----
> > >  fs/iomap/trace.h       |  3 ++-
> > >  include/linux/iomap.h  |  5 +++++
> > >  3 files changed, 15 insertions(+), 6 deletions(-)
> > > 
> > > diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
> > > index e5c1ca440d..cc1cbf2a4c 100644
> > > --- a/fs/iomap/buffered-io.c
> > > +++ b/fs/iomap/buffered-io.c
> > > @@ -533,7 +533,8 @@
> > 
> > (Does your diff program not set --show-c-function?  That makes reviewing
> > harder because I have to search on the comment text to figure out which
> > function this is)
> > 
> > >  			return 0;
> > >  
> > >  		/* zero post-eof blocks as the page may be mapped */
> > > -		if (iomap_block_needs_zeroing(iter, pos)) {
> > > +		if (iomap_block_needs_zeroing(iter, pos) &&
> > > +		    !(iomap->flags & IOMAP_F_BEYOND_EOF)) {
> > 
> > Hrm.  The last test in iomap_block_needs_zeroing is if pos is at or
> > beyond EOF, and iomap_adjust_read_range takes great pains to reduce plen
> > so that poff/plen never cross EOF.  I think the intent of that code is
> > to ensure that we always zero the post-EOF part of a folio when reading
> > it in from disk.
> > 
> > For verity I can see why you don't want to zero the merkle tree blocks
> > beyond EOF, but I think this code can expose unwritten junk in the
> > post-EOF part of the EOF block on disk.
> 
> Oh wait, is IOMAP_F_BEYOND_EOF only set on mappings that are entirely
> beyond EOF, aka the merkle tree extents?

yes, and only on fsverity files, so no normal read can get
BEYOND_EOF

> 
> --D
> 
> > Would it be more correct to do:
> > 
> > static inline bool
> > iomap_block_needs_zeroing(
> > 	const struct iomap_iter *iter,
> > 	struct folio *folio,
> > 	loff_t pos)
> > {
> > 	const struct iomap *srcmap = iomap_iter_srcmap(iter);
> > 
> > 	if (srcmap->type != IOMAP_MAPPED)
> > 		return true;
> > 	if (srcmap->flags & IOMAP_F_NEW);
> > 		return true;
> > 
> > 	/*
> > 	 * Merkle tree exists in a separate folio beyond EOF, so
> > 	 * only zero if this is the EOF folio.
> > 	 */
> > 	if (iomap->flags & IOMAP_F_BEYOND_EOF)
> > 		return folio_pos(folio) == i_size_read(iter->inode);
> > 
> > 	return pos >= i_size_read(iter->inode);
> > }
> > 
> > >  			folio_zero_range(folio, poff, plen);
> > >  			iomap_set_range_uptodate(folio, poff, plen);
> > >  		} else {
> > > @@ -1130,13 +1131,14 @@
> > >  		 * unlock and release the folio.
> > >  		 */
> > >  		old_size = iter->inode->i_size;
> > > -		if (pos + written > old_size) {
> > > +		if (pos + written > old_size &&
> > > +		    !(iter->flags & IOMAP_F_BEYOND_EOF)) {
> > >  			i_size_write(iter->inode, pos + written);
> > >  			iter->iomap.flags |= IOMAP_F_SIZE_CHANGED;
> > >  		}
> > >  		__iomap_put_folio(iter, write_ops, written, folio);
> > >  
> > > -		if (old_size < pos)
> > > +		if (old_size < pos && !(iter->flags & IOMAP_F_BEYOND_EOF))
> > >  			pagecache_isize_extended(iter->inode, old_size, pos);
> > >  
> > >  		cond_resched();
> > > @@ -1815,8 +1817,9 @@
> > >  
> > >  	trace_iomap_writeback_folio(inode, pos, folio_size(folio));
> > >  
> > > -	if (!iomap_writeback_handle_eof(folio, inode, &end_pos))
> > > -		return 0;
> > > +	if (!(wpc->iomap.flags & IOMAP_F_BEYOND_EOF) &&
> > > +	    !iomap_writeback_handle_eof(folio, inode, &end_pos))
> > 
> > Hrm.  I /think/ this might break post-eof zeroing on writeback if
> > BEYOND_EOF is set.  For verity this isn't a problem because there's no
> > writeback, but it's a bit of a logic bomb if someone ever tries to set
> > BEYOND_EOF on a non-verity file.

I will rename it to IOMAP_F_FSVERITY

> > 
> > --D
> > 
> > > + 		return 0;
> > >  	WARN_ON_ONCE(end_pos <= pos);
> > >  
> > >  	if (i_blocks_per_folio(inode, folio) > 1) {
> > > diff --git a/fs/iomap/trace.h b/fs/iomap/trace.h
> > > index 532787277b..f1895f7ae5 100644
> > > --- a/fs/iomap/trace.h
> > > +++ b/fs/iomap/trace.h
> > > @@ -118,7 +118,8 @@
> > >  	{ IOMAP_F_ATOMIC_BIO,	"ATOMIC_BIO" }, \
> > >  	{ IOMAP_F_PRIVATE,	"PRIVATE" }, \
> > >  	{ IOMAP_F_SIZE_CHANGED,	"SIZE_CHANGED" }, \
> > > -	{ IOMAP_F_STALE,	"STALE" }
> > > +	{ IOMAP_F_STALE,	"STALE" }, \
> > > +	{ IOMAP_F_BEYOND_EOF,	"BEYOND_EOF" }
> > >  
> > >  
> > >  #define IOMAP_DIO_STRINGS \
> > > diff --git a/include/linux/iomap.h b/include/linux/iomap.h
> > > index 520e967cb5..7a7e31c499 100644
> > > --- a/include/linux/iomap.h
> > > +++ b/include/linux/iomap.h
> > > @@ -86,6 +86,11 @@
> > >  #define IOMAP_F_PRIVATE		(1U << 12)
> > >  
> > >  /*
> > > + * IO happens beyound inode EOF
> > 
> > s/beyound/beyond/

will fix

-- 
- Andrey

