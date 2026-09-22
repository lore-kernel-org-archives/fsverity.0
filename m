Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F7314AA3E6
	for <fsverity@lists.linux.dev>; Tue, 22 Sep 2026 08:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790065954; cv=none; b=GsdhjfmmFK7Kw6MiJtiY2ut3y8AJnRcWlCqrCyK8Fn5m+FJ8N6IrN3AOWGgZkkUAq806CzErROWvyXD3jEsQUT41/DDigZY/mVzaJ8Qp9PQLoZGmtOHrxFUWvwjKLkw8TwZoCJ/cV2BIWU3E3BOzIjv8gHl3CXf/MW8AdRkY5JI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790065954; c=relaxed/simple;
	bh=bxOLRyx+TtzIaCObuWShkyjhDbes/LDLjKEl4CexuEU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=UJh2Cy6zL08Bw+cxy0cJymzud28K2G8SW6Q7oKjIqB+ZkH7bjig7UAUeS+Qr/dsgljI2mEquLKD5FTThgxcLzP/VYzdAXu+5Qunyc5JNQ8xed+YMriWOUIx4pekgD33eev4w/UCTgmUXxQ0NdnWV66qr+jPe9uiPrFIXGDGlVEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OaX3zQe1; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OaX3zQe1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790065951;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=v6HyFSOK4HYSfvcwVKnaiUCa+pWXMNUUzDe6nYFstxk=;
	b=OaX3zQe1A/i6f2euJs4tg+AxapSpwR/3HNRrlUjSYIpC9Mpdqm+Kj2SRngRipSkoiPwBFa
	zKsoxQVrgM/M7HDYboV9viAOVrd+eXclj+dPXexYRpPt2rIFqfz5jy2ytcX+46/V8uP7+C
	M88uKc11snPa14dasNqQJu3m5Pg4bAk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-605-hpLq7LIGPre7DQ0uc89xew-1; Tue, 22 Sep 2026 04:32:29 -0400
X-MC-Unique: hpLq7LIGPre7DQ0uc89xew-1
X-Mimecast-MFC-AGG-ID: hpLq7LIGPre7DQ0uc89xew_1790065949
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-49ccfad90f1so25073995e9.0
        for <fsverity@lists.linux.dev>; Tue, 22 Sep 2026 01:32:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790065948; x=1790670748;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v6HyFSOK4HYSfvcwVKnaiUCa+pWXMNUUzDe6nYFstxk=;
        b=BBqqEjO/85lNtZKWj/bmh14mtYY/QIm1VQjZf+77ddPPfK3CeE0g91r8alRTLezXdi
         Xq5NiWO8Mzh1nOA9QLiSPm/xjMPneZN4fkyFLznu4LDa5QjqzSol7LJ3jkb/WT9aPcLx
         GWkvbGgYff09htSDtQQquPUOqQnfFArDX5rhlGb/rQqxFBb9RcPXZaxj1qBZPAt1SbNp
         CcEyb3s0yk6EHPcrSJhpiPbljv7KfbGaEv/E2eAyGgndfFHoiN7ACLftA0qiTli5dQQF
         WgvzwQ5sJNPAhk0Mqmaoy9l57+dWiXGgY3tdCR7OkLsVfN3ZIGV/UOwZlGOzO7Vv/o0J
         G3Dw==
X-Forwarded-Encrypted: i=1; AKwUvBwSS9gDnISxLaOVGLtqWy8hlyZ4cxniJhJR86+PRcqgp//ITK+29v7f+SUHCcA4aUJOKnX5YeIY5g==@lists.linux.dev
X-Gm-Message-State: AFuF++k8L9dj+/rD4WlxDuiiJR+GUQgJH4joJKg/e4Estzv0RhXMZZnT
	lTyTvHW0/XoOOeC/op8fD7csV5vKefp8Tp10ozgG/ji1qxDhfycQSHz2kmrCQXeAglYz6x9hsM7
	pwllD1L+qN/ioywKNDyXXf5rJwYci3lI+La8bWxtKLDAKZyq3mjqSeO14zm0=
X-Gm-Gg: AYBFou0lvnJRmqdRqATvYsAMin9+jhBOu4rwDBxfKOcDle3Ed2o+VBVolTSxCHISLNp
	Iften5GtLSBwv/uCUwOH8DYC2qiUku5YgdwsMBvl8xKpAEmvFg+TTEq3JxsYZ5Ke4DRa5FVr8sL
	24yai/VT8OP7Gbzl6XmGhEagcreaK+WlH3i/DLQF3D/C7f0Jwvjt1tiECai4NeBF+xO0DWjjUpo
	KYq/gMYor8LF2EdF6vrNLPztQMSkvR4EJs4/QdWELpCQuxzkxEd5qXYWHeqzbXv0WDn4VKHQ4s1
	NrWmNE935vwmmp5vgLcJ40jNBfTGvLsquauIbfkLf9nIiCd9MhrMht+3ySm0t4Qyk4Y3JsFlB/X
	qNdb7acEUsxi9LsYQy3Brea2vHaMb0ULyCQ==
X-Received: by 2002:a05:600c:3f0b:b0:49d:1df6:2592 with SMTP id 5b1f17b1804b1-49fc5750c61mr161767045e9.21.1790065948522;
        Tue, 22 Sep 2026 01:32:28 -0700 (PDT)
X-Received: by 2002:a05:600c:3f0b:b0:49d:1df6:2592 with SMTP id 5b1f17b1804b1-49fc5750c61mr161766615e9.21.1790065948022;
        Tue, 22 Sep 2026 01:32:28 -0700 (PDT)
Received: from aalbersh-thinkpadx1carbongen13.rmtcz.csb ([217.30.74.39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fdabe8a2asm32746655e9.4.2026.09.22.01.32.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 01:32:27 -0700 (PDT)
Date: Tue, 22 Sep 2026 10:32:24 +0200
From: Andrey Albershteyn <aalbersh@redhat.com>
To: Christoph Hellwig <hch@infradead.org>
Cc: "Darrick J. Wong" <djwong@kernel.org>, 
	Andrey Albershteyn <aalbersh@kernel.org>, ebiggers@kernel.org, hch@lst.de, 
	Carlos Maiolino <cem@kernel.org>, fsverity@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
	linux-xfs@vger.kernel.org, linux-unionfs@vger.kernel.org, linux-ext4@vger.kernel.org, 
	linux-f2fs-devel@lists.sourceforge.net, linux-btrfs@vger.kernel.org, david@fromorbit.com
Subject: Re: [PATCH v16 13/21] xfs: add XFS_BMAPI_UNWRITTEN to unmap
 unwritten extents in __xfs_bunmapi()
Message-ID: <arI8cvh8rgIwmv9V@aalbersh-thinkpadx1carbongen13.rmtcz.csb>
References: <20260918111539.1003439-1-aalbersh@kernel.org>
 <20260918111539.1003439-14-aalbersh@kernel.org>
 <20260922043402.GM2705364@frogsfrogsfrogs>
 <arIsIhrWltHi9Aej@infradead.org>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <arIsIhrWltHi9Aej@infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Hn_vxBqRphNUn_iThsiqiCrYaTbDM-MxJedqoMPDIHk_1790065949
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2026-09-22 00:20:02, Christoph Hellwig wrote:
> On Mon, Sep 21, 2026 at 09:34:02PM -0700, Darrick J. Wong wrote:
> > > diff --git a/fs/xfs/libxfs/xfs_bmap.c b/fs/xfs/libxfs/xfs_bmap.c
> > > index cc48f6e20e80..7ba76017ae56 100644
> > > --- a/fs/xfs/libxfs/xfs_bmap.c
> > > +++ b/fs/xfs/libxfs/xfs_bmap.c
> > > @@ -5280,6 +5280,10 @@ __xfs_bunmapi(
> > >  		if (del.br_startoff + del.br_blockcount > end + 1)
> > >  			del.br_blockcount = end + 1 - del.br_startoff;
> > >  
> > > +		if ((flags & XFS_BMAPI_UNWRITTEN) &&
> > > +				del.br_state != XFS_EXT_UNWRITTEN)
> > 
> > Odd indentation?
> > 
> > 		if ((flags & XFS_BMAPI_UNWRITTEN) &&
> > 		    del.br_state != XFS_EXT_UNWRITTEN)
> 
> Yeah.
> 
> > /me again wonders if bunmapi ought to have its own flags instaed of
> > reusing *some* of bmapi.  But I concede that ought to be a different
> > cleanup, because figuring out which flags are for bunmapi.  I think it's
> > REMAP, ATTR_FORK, NODISCARD, and UNWRITTEN?
> 
> I think that would create more confusion than it helps.  OTOH asserting
> the valid flag would be helful.
> 
> Sashiko complains about interactions with the weird rtextent bunmap
> behavior.  Should we disallow fsverity with a larger than fsb
> rtextensive to not bother with this?  Btw, did you test this series
> with RT classic and or zoned?

yeah, I will disallow it

I did many revisions back, but haven't tested recent versions, I
will test with rt for the next version

-- 
- Andrey

