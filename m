Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48011D61BC
	for <fsverity@lists.linux.dev>; Tue, 13 Jan 2026 12:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768307472; cv=none; b=qGlq4lDw1PC14gSoo8KK6k6U0ikXYBvOyRFlogMsUD8uf2xFXqcM3W4Z6p4V3inBGXPzJwrIKV63UWv0AcWIlKoeljJD13E+VEBmgt2MIWWGEZxD8B4COVZzTDdLqN3cUCS7woD5V2RfD31s4RIORUHZxXgg3A9nY7b1Bf25fr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768307472; c=relaxed/simple;
	bh=dr/deaXgcA6wPeq1B6ILKvHv9WqvrG3xbYZ2Dadm3hk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=NY80msaiYLBBB2lXPmBo066do6t7UjcTFo5YkY89/wK7ZmstOVaWy7wsmQanfd0HnqZa8fMp5wi/gIEB4+CH1uoN2XLElPWk/3VdnLlsxzb8YRcyuk3OoSKHwnnXIHj2Yn183aDHea5h8XwdhOeZYScbd/Nq8dKq3rw/0uTgjCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Tx5Oh18A; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Tx5Oh18A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768307465;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1kRCPW/g/RoIM20GSJuVNzuIhcgaphVA4TMkA/x3UKo=;
	b=Tx5Oh18AU9H+Fl4CdfL5Xx9gU2lQP03tk32TrkCuBTDWZpDEVg+fWNF3dHFAS0nwAb1JJE
	MWpwlUGRwiC6Yc5+W6FvV3jPffzmHj8HUTKWb0+KJmq9sqgrVmciqwud2hLkX7UliExWta
	RfYbvNruOKDpcwxNjX0INFsCmuirhRQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-533-CHarob-qN1aB7tAmkDZLpA-1; Tue, 13 Jan 2026 07:31:04 -0500
X-MC-Unique: CHarob-qN1aB7tAmkDZLpA-1
X-Mimecast-MFC-AGG-ID: CHarob-qN1aB7tAmkDZLpA_1768307463
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-430fb8d41acso4937553f8f.1
        for <fsverity@lists.linux.dev>; Tue, 13 Jan 2026 04:31:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768307463; x=1768912263;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1kRCPW/g/RoIM20GSJuVNzuIhcgaphVA4TMkA/x3UKo=;
        b=R7gGOuIXbL36+HEgo2LRRXNqzWQjGlLl4NeXs12UyQhUjJPrOLLhkBebbu2fAaprqp
         AVr2soGfVqVr5EvYQqgfONOCh7PImC/kxcodguxsLPJFVnn/Ak1PcAXGv+HC2NP1GzZo
         LKLyvsqgLmNdXX9frG5h1AGfWG7J78+A0fD0PLU3iockVTKeN3ps4ie4Y56ltPnPPlN0
         flmBWWSOcE6tMC+Tkn1YP2JKTdk6G7OSXTG1z7O0g1iUzNoKs9UhTd7hS7G8KHIDZBrL
         tQbtP9tlOxuZ3Nf/T1v594zb6JPTDZazpoC2KypKSNz6b43JvRYFb0PJRreZEUfVyveW
         cPhQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMGk0kHxtDRbjXiZ7XJuuNHMkjy6SjlpTIrQISKDQ7b5VfKiB/1tRzAROUYTGj6grS0Ha6CQ4Srg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxvCwVsewhlTz6sHJrfchrDmLoaxlVs+rWHw1ypXulSUCxkdjD9
	VTMrs7dLC7CUknlXNxgeOszsER66viIebfQ/ZnxcrlYQ2O9x9K44+i3aprYi91shvZQjrFgiaxy
	Layt0tXS7Hkf3khM9bZ8Bk0YPcuTJ9OU5F0alcd/7HZJCNoMXU9Flm1d7bro=
X-Gm-Gg: AY/fxX6u8BxhAmkdd/XBkhbkDxfoeNfigmpQi0OPKaGmuuO3ICOMlnTIEsntroTLpGh
	FxtBIcdCYoiw3gJU++kUA/uY51j7/FYv3QvCLscjDGF7GwYf9jIkjouSuPUhKYIVMwgSaDC060a
	xzuH9X7l3p7Pm1/xs6IJ+hOKNoPQu489znPOSQTJuI5YUSggIIas+X/Cdk4UtlNXuG2aj6GgO1x
	9v2RT11DYjdHcMM46jyu4p/Iv5dNF1vtUQ+dMmv7uNbUok2z6PQ7ToAWNnmihKWEihj/x3+xh53
	YKn8F2Ebgew5/1CIi3aB0FpfotYs2+kNY+FWzxtaGTWKBw3zeci6UHFPqkdQ79O1UrIunNy1QSk
	=
X-Received: by 2002:a05:600c:4fd0:b0:477:8a2a:1244 with SMTP id 5b1f17b1804b1-47d84b17e75mr242698205e9.11.1768307462727;
        Tue, 13 Jan 2026 04:31:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEEv+vamH9clJci/VsanC5PjfTDujMWW6wmVj/wH+rxud84JLfRUY3cNQgVFJ6VRoHnSpduKw==
X-Received: by 2002:a05:600c:4fd0:b0:477:8a2a:1244 with SMTP id 5b1f17b1804b1-47d84b17e75mr242697885e9.11.1768307462317;
        Tue, 13 Jan 2026 04:31:02 -0800 (PST)
Received: from thinky ([217.30.74.39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47eda45ad38sm13548765e9.14.2026.01.13.04.31.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 04:31:01 -0800 (PST)
Date: Tue, 13 Jan 2026 13:31:01 +0100
From: Andrey Albershteyn <aalbersh@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Cc: "Darrick J. Wong" <djwong@kernel.org>, fsverity@lists.linux.dev, 
	linux-xfs@vger.kernel.org, ebiggers@kernel.org, linux-fsdevel@vger.kernel.org, 
	aalbersh@kernel.org, david@fromorbit.com
Subject: Re: [PATCH v2 15/22] xfs: add writeback and iomap reading of Merkle
 tree pages
Message-ID: <6m2lpjl2rgwbil2yixs5s77qzidvyvsrws2x4utvkqyd2exi4u@hqijtifezoob>
References: <cover.1768229271.patch-series@thinky>
 <bkwfiiwnqleh3rr3mcge2fx6uucvvj2qzyl3sbzgb4b4sbjm27@nw2i3bz7xvrr>
 <20260112225121.GQ15551@frogsfrogsfrogs>
 <20260113082317.GG30809@lst.de>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260113082317.GG30809@lst.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ic0T41ykchsKHYIQBC_XmqFzKp9xP2uIAKzyVRSoUtM_1768307463
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2026-01-13 09:23:17, Christoph Hellwig wrote:
> On Mon, Jan 12, 2026 at 02:51:21PM -0800, Darrick J. Wong wrote:
> > > +			wpc.ctx.iomap.flags |= IOMAP_F_BEYOND_EOF;
> > 
> > But won't xfs_map_blocks reset wpc.ctx.iomap.flags?

It will, this one is only for the initial run. This is what allows
to pass that check in iomap_writeback_folio(), the
iomap_writeback_handle_eof() call. Further folios would have this
flag set in xfs_map_blocks().

> > 
> > /me realizes that you /are/ using writeback for writing the fsverity
> > metadata now, so he'll go back and look at the iomap patches a little
> > closer.
> 
> The real question to me is why we're doing that, instead of doing a
> simple direct I/O-style I/O (or even doing actual dio using a bvec
> buffer)?
> 

fs-verity uses page cache for caching verified status via setting
flag on the verified pages.

-- 
- Andrey

