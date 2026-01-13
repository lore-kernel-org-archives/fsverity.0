Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6917E3921E3
	for <fsverity@lists.linux.dev>; Tue, 13 Jan 2026 10:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768301414; cv=none; b=EBNoDtxX/eai8nOSXR0azdsSszKlQWqEYVCsbvyxZ/eG8F9vbtBsF7/3SZsbI5toRtO9Jx3ej35TdrVe6nAent04pGZ4BvXXtSEXrrk9QEJqJMQACxvs/nxVv9g+s/ErK9+siqJhBi/YutKkYy+OposwjqgcRJ1FKzbsmsG8uh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768301414; c=relaxed/simple;
	bh=zs4+pY6UFBBhQer26MrIS2bBpKEtlbeski6Dk0lOabo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=kp9qn8dIWrK4belIE76IGYELJZhCDjgsQ99kRRkhOBmPKXSBz2DMrUuaG9DJXI+g/NgV3nYcb+vcHKggi/us0bdv/2BAh10GPu0IXIwr8t+18wcmCZd9OhZEz+nM4toeAUJzC8r16lQgDl3b2rSkt+opxJkjqIcGEc2vCPE1RD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UenjutGG; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UenjutGG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768301411;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jZ3j0SOHASLnmo9OqDChCwBfxwLNuYXaGvQPIXl45AM=;
	b=UenjutGGvRHrAJXE/eXDj0TfRyGehZ9g6C3siI8bA+dCO2LpqZpfWZ9pUwzPg2zhkLk9jU
	c0Q9e+940xRgXIS914yP0quZuucb9anrGa/nPYmwnOgqnsz3KnAYhhh0yKfK9y+GWPaih3
	+DP5OHW2by5fthewEn9OkSQrh2NdgzQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-592-RgpEDmyGOH-GJi-p7o2xLw-1; Tue, 13 Jan 2026 05:50:10 -0500
X-MC-Unique: RgpEDmyGOH-GJi-p7o2xLw-1
X-Mimecast-MFC-AGG-ID: RgpEDmyGOH-GJi-p7o2xLw_1768301409
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-430fd96b2f5so5440152f8f.3
        for <fsverity@lists.linux.dev>; Tue, 13 Jan 2026 02:50:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768301409; x=1768906209;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jZ3j0SOHASLnmo9OqDChCwBfxwLNuYXaGvQPIXl45AM=;
        b=BF1nCbOQcrKT3LSgqGdwj1d/drWnqSBI6pnsE7Sw4v+C7idvUYejOD4F7oXKQnTmsa
         A3fr1tqDBhV/UZ9z6ATyhZdOG93kN/ucc+YZDERsn2coUgQBAxrA7s6p6Vxs7eEKFzI3
         FyWUnWVlwijjhepa8rtQdWjw6Zz8NnFT0FqKKi+gAMvEmtk+2G8fXdpUW8kkuv8wNBOC
         7mtJ9MplYqnXNqj/vpL0KUw0L+HWxSL8TxyhBtdiIyo+h6/3flTGC6vMO14OpEZpyIBq
         SdMGfmo2pd5aHKt0bE96UpTxkhgYKrSEryckKFXXrg55Qrfu9G3BPrxrKxGMHjQbL4iz
         8LnA==
X-Forwarded-Encrypted: i=1; AJvYcCVCou/T0KTR2/miPItG7iwrze3Ev5wQ2XhYvt0ep8WPZPKeiLrSPzUIEXEbrgo7bjUDXGWs8d2ViQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwyEecUEJ+j84Fz00ArA/3HWDQ72xdnI3TVQOc6ASOSIjYvRJ9i
	OVwYyTqhjK47s2nNkoqpnVNiJI0n698cqXHRa4YehDzqi9HvzF/Lb1bH0vkqyW757pBiixXiRmV
	IYl4I5MobhirG9PVbL4ZFqHAibJocMhqp73YYV/+ALFVXLZ8MmPJV6XnJ3BQ=
X-Gm-Gg: AY/fxX575I9QavawaIrr8y97dsHRTaxyjGsVvCdwNVBvahlU9hcD5Ce/3n7s6Q7VmJM
	5MecMph5L8qXfH8Hcv/TDTXx6HFaLclqkfRg4dUic0S7vNexMEZGNuBDWBER1pLu/DbEiaGGMHV
	sSnp87IC5So1oq6bq0E7ZAwFD1Zj1qy7eZdm8aA4cWj/lvNOL+cT84NFD5nM0Yx5WTHME7VdSBk
	9rnwnledNttNsd+HGyyPXOyvIJ61AyMQI3/YuKSVCYARBpiawQbdSx9fsqlAAHqRcTkF1rK+lV3
	v0/i84fP/uEcc00pT397m5ARSdPIAj1LC+PZGqswsBSuaAsHo6a5gbNC2lxO8oSznMtDb8/t5jI
	=
X-Received: by 2002:a05:6000:3102:b0:429:c851:69ab with SMTP id ffacd0b85a97d-432c38d22e5mr20813943f8f.55.1768301408659;
        Tue, 13 Jan 2026 02:50:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGcmNmJys26XuZztJOyKdSJM/PHCDpO7qgbJlWds4OOLxDbjN5kxlCB20323N+1/6DIlpZFFA==
X-Received: by 2002:a05:6000:3102:b0:429:c851:69ab with SMTP id ffacd0b85a97d-432c38d22e5mr20813895f8f.55.1768301408145;
        Tue, 13 Jan 2026 02:50:08 -0800 (PST)
Received: from thinky ([217.30.74.39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432d286cdecsm29847812f8f.7.2026.01.13.02.50.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 02:50:07 -0800 (PST)
Date: Tue, 13 Jan 2026 11:50:07 +0100
From: Andrey Albershteyn <aalbersh@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Cc: "Darrick J. Wong" <djwong@kernel.org>, fsverity@lists.linux.dev, 
	linux-xfs@vger.kernel.org, ebiggers@kernel.org, linux-fsdevel@vger.kernel.org, 
	aalbersh@kernel.org, david@fromorbit.com
Subject: Re: [PATCH v2 3/22] iomap: introduce IOMAP_F_BEYOND_EOF
Message-ID: <xjz5a35ypk3am6fbhkfdeeeilu54lhbcymginjv6srjve4qfjn@uucfin46ylhj>
References: <cover.1768229271.patch-series@thinky>
 <d5fc72ldfwyzbgiypzlhn5diiqyijxaicpa3w6obx4iismuko3@kttpcgqjy6i5>
 <20260112221853.GI15551@frogsfrogsfrogs>
 <20260113081220.GB30809@lst.de>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260113081220.GB30809@lst.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _4fkI9GTyCf-qvMMyehePPaDf-ZRroQ2F09vyBCWkec_1768301409
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2026-01-13 09:12:20, Christoph Hellwig wrote:
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
> 
> Or use git-send-email which sidesteps all these issues :)
> 
> > Hrm.  The last test in iomap_block_needs_zeroing is if pos is at or
> > beyond EOF, and iomap_adjust_read_range takes great pains to reduce plen
> > so that poff/plen never cross EOF.  I think the intent of that code is
> > to ensure that we always zero the post-EOF part of a folio when reading
> > it in from disk.
> > 
> > For verity I can see why you don't want to zero the merkle tree blocks
> > beyond EOF, but I think this code can expose unwritten junk in the
> > post-EOF part of the EOF block on disk.
> > 
> > Would it be more correct to do:
> 
> Or replace the generic past EOF flag with a FSVERITY flag making
> the use case clear?
> 

I will rename it to _FSVERITY

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
> 
> Maybe we should not even support the flag for writeback?
> 

Hmm not sure how you see this, the verity pages need to get written
somehow and as they are beyond EOF they will be zeroed out here.

Regarding your comment in the thread to use direct IO, fsverity
wants to use page cache as cache for verified pages (already
verified page will have "verified" flag set, freshly read won't).

So, I think writeback has to know how to handle them

-- 
- Andrey

