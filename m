Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0022D36EA84
	for <fsverity@lists.linux.dev>; Mon, 27 Jul 2026 11:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785152410; cv=none; b=K1AYe15x7aRV7MrBTj+hw+QxnCW0XlW7pNbawcMlSZSQQjcoljSRCrm61NLq3AIooDoj4vx0dZECA6A+yakv7wT9mITS0Df1UNG6Hw46MLxZx13gf18OU2T8LRQC695g835rd59S3x6jnjHnED2j1+KIhFVkvCuuvYwMaH4qF/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785152410; c=relaxed/simple;
	bh=bi8BA5oS5R3RGDXFaAMjH9VjI7t5/jzE6E9xn3TWcOI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=ntL09bzQHwujxAuUIN6zTOjQic0AjEZVi6LOuVHend46lBM4m2RKBkJ27OntSJv8GPCVuv4VEglheOXkPiyjWSjSmSUJ/6C8eNmU34ZcUDmODM8lbZhRFPwAFvgZA+m3/6y3Oa9y604YHb+DFm/8jz3Ll567VZkgehAMOHMVeNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gtDOBZUp; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gtDOBZUp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785152407;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XjT/PIWbG/51hlsr95HE/1iGTwI0BlJqCQFAOLtkIYs=;
	b=gtDOBZUpRFdw2prYrCHvHS0Dw+CmRDMjpfFU7GRo3cm/6NGZNhpZS6AUKsKr9BoX8yWciu
	89CoJoSy2J6HsYnOm9EHJOu04A6tBohlaAYSDJG769jDR/N+pdral9RQhDY83XoEUq/tHb
	hr+Zu0O6gQhfuk7O1rqZR3xlvup3ei8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-404-D7xEl-ikPZaaSZ8Tw9p1iA-1; Mon, 27 Jul 2026 07:40:04 -0400
X-MC-Unique: D7xEl-ikPZaaSZ8Tw9p1iA-1
X-Mimecast-MFC-AGG-ID: D7xEl-ikPZaaSZ8Tw9p1iA_1785152403
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4955d314945so18737925e9.0
        for <fsverity@lists.linux.dev>; Mon, 27 Jul 2026 04:40:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785152403; x=1785757203;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XjT/PIWbG/51hlsr95HE/1iGTwI0BlJqCQFAOLtkIYs=;
        b=XdRLzEwyr4atura+nX0YtWHNhPvxH+bOFEjxHeXUzU6P+cjhvffzaJ1HMvWMOTlGaB
         AuFq7li45+hkDEIDPRFkaBsbtoWwQKi/nB1CiI3hl+YEi8G240eJiAteflsJHO9NNVLG
         M+akOuuUywzNyPlMg/W+amxQ+wXA/PIoMpwbDrL5BVLyD+zCp2MSLV5ZYYnJFpQyX+37
         Ix3bTCyfjqAtp17nXD9SauFLCgNoS/WIvWJaN8DZLg97Fifmai2IEBEnqIcclyNscvNS
         elY8dJ64NGjWMdrpv8zGNMWtBybpNENzXa36hrNgFrFISmgJlXc9F/3ODGwoQ3JiyWMl
         zHjQ==
X-Forwarded-Encrypted: i=1; AHgh+Rphh5/y8yHV7atSEee54tA3wuBE0GsU3KcHVIXf/NrMkPOSoQd2dIUAGFStxGWWe/OzJ1Zk5lrDzw==@lists.linux.dev
X-Gm-Message-State: AOJu0YybiCW/u2sfxM304+v1dl39cs9g0v7kaNw/T52Sa4RFbui2SI+K
	InNJIlNARp5YO/YZxDdVOcnv6BroUZbKPBWnM84YboHF5vKLtw1n+0LZcQe22F0aqqkIzws9usj
	wYTpF6ej9jjWWcBEwQk/Urp6dZHR2pz9nDe+C7bMaVJsh0kLQNpX942rWBpU=
X-Gm-Gg: AR+sD100X4GOgmg+MLKGLuAagAr+l5D+jXFw3iBqhVDJXZi/zolLVDf1vAC2xKdkZ/R
	Q1iq9eapJRkgyMcZDnxeCuzTTfMwCHPAXIOlH4gFCnze82J+6FUoM4qaDl8d2NKPFQSz5Vqm1Lu
	Kdmn3IyfvcZSgRc/PtLP7utkU0CTWvK5x7YXulzUE85L0f5AhXkGXr92PzxA3UP2U1/gYvyScem
	GLFZbVSlnKfeg/G+gSzSuuYA76yf7por7kN8ng+HYKVczqpHGMP59e8x5C65E5f9pIZ+reS3hBO
	Dc3gy/p6OkqnIULgNYtOcpX9CDovNzzxLWP/Xbv208PQ/4qwP1PO6NbVr1yNW8+PGv+tJ7Ch83O
	u/UfN1Z9KAiHQBYnJ/vC2aoiB+3TM89NiXCk=
X-Received: by 2002:a05:600c:c87:b0:493:fa66:4861 with SMTP id 5b1f17b1804b1-496b5747df9mr103190565e9.25.1785152403042;
        Mon, 27 Jul 2026 04:40:03 -0700 (PDT)
X-Received: by 2002:a05:600c:c87:b0:493:fa66:4861 with SMTP id 5b1f17b1804b1-496b5747df9mr103189935e9.25.1785152402345;
        Mon, 27 Jul 2026 04:40:02 -0700 (PDT)
Received: from aalbersh-thinkpadx1carbongen13.rmtcz.csb ([217.30.74.39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b499ccb4sm225617015e9.10.2026.07.27.04.40.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 04:40:02 -0700 (PDT)
Date: Mon, 27 Jul 2026 13:40:01 +0200
From: Andrey Albershteyn <aalbersh@redhat.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Andrey Albershteyn <aalbersh@kernel.org>, linux-xfs@vger.kernel.org, 
	fsverity@lists.linux.dev, linux-fsdevel@vger.kernel.org, hch@lst.de, 
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
	linux-btrfs@vger.kernel.org, djwong@kernel.org
Subject: Re: [PATCH v13 02/23] fsverity: expose ensure_fsverity_info()
Message-ID: <amcy2KC3veaniXof@aalbersh-thinkpadx1carbongen13.rmtcz.csb>
References: <20260721184346.416657-1-aalbersh@kernel.org>
 <20260721184346.416657-3-aalbersh@kernel.org>
 <20260724233744.GB1901@sol>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260724233744.GB1901@sol>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: CcJzU4t4sfLGGt0e6M0lPNligprMJ-7zlafb_TXfngU_1785152403
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2026-07-24 16:37:44, Eric Biggers wrote:
> On Tue, Jul 21, 2026 at 08:40:39PM +0200, Andrey Albershteyn wrote:
> > +/**
> > + * fsverity_ensure_verity_info() - cache verity info if it's not already cached
> > + * @inode: the inode for which verity info should be cached
> > + *
> > + * Ensure this inode has verity info attached to it, it's assumed the inode
> > + * already has fsverity enabled. Read fsverity descriptor and creates verity
> > + * based on that.
> > + *
> > + * This needs to be called at least once before any of the inode's data
> > + * can be verified (and thus read at all) or the inode's fsverity digest
> > + * retrieved.  fsverity_file_open() calls this already, which handles
> > + * normal file accesses.  If a filesystem does any internal (i.e. not
> > + * associated with a file descriptor) reads of the file's data or
> > + * fsverity digest, it must call this explicitly before doing so.
> > + *
> > + * Return: 0 on success, -errno on failure
> > + */
> > +int fsverity_ensure_verity_info(struct inode *inode)
> 
> There really should be a note here that if the file is also encrypted,
> then the encryption key has to have been set up first.  This was already
> gotten wrong when it was proposed for overlayfs to call this.

Sure I will add a note.

> Do we also need a more specific contract than "-errno on failure"?  The
> caller in xchk_inode_setup_verity() tries to distinguish between
> "metadata validation errors" and "runtime errors" by checking for a
> bunch of different error codes, and I'm not sure what that means
> exactly.

The scrub checks that if incore fsverity flag is set on the inode
we should be able to read verity info. If metadata is invalid,
"metadata validation error" happens, then scrub will clear fsverity
flag on incore and on-disk inode.

Not sure if this can be improved much, any new error codes won't
trigger scrub. Passing int *corrupted everywhere also doesn't seem
to help and changing everything to EFSCORRUPTED will change
file_open return code.

-- 
- Andrey

