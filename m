Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D2E322C6D
	for <fsverity@lists.linux.dev>; Wed, 14 Jan 2026 08:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768378855; cv=none; b=lybySpp+sAS0s8RHyiCP7Z6ChvdMKZj3El/7y8kH88L/5I7f2yx/zcxJkWyTepUQ9iB3Ua8c4p7j6Gt9j3WnonElY0mbM3Ww8C0Qjgrj6GD3k/lvWUM7GoCblx3RsPDbRDgod6nD0nwhMCQ1CKSCRFFoiuXrkWmnBRyhcfcMYyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768378855; c=relaxed/simple;
	bh=RTcjpEqOm45gmsFr+TBc5Irtq01dJ5bQ4/uCScFzUhw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=h/ABs2qXH1yaHeSGCvu3zAiMzlcMn/UIVyaWscz36PjW1KCzB4SqLdxRfJMHImhTiTxvuZn0KWcQU/wz85gQp80GHBx3xe+05oGioueq9chDpcSKG5RZ4duM+SVrUg50sbSWygQ5V+CYUvslhOrvn7ycs9fsrJ7KForSTD5lmN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ou4ScwtC; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ou4ScwtC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768378840;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VYnnUZghf6HwJqXJDWVaeOjjdjMBw+O6FSttE0RsUb8=;
	b=Ou4ScwtC8rI60ttbe9BApbMsl+0m2y8wxCMs14Hx/GBIPBo0OnuUTEUjQZI6exj9jVWcwm
	HE8JnUqrVtFgllAyWH1/5SI4CXfnHJ4+zTuGL0xb+/FshJ+u7EyQnxY+pi5zLWL2mMk68c
	6Pe6dqYWeyKtqCqgjrnmfPlZGROlhIY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-7-ZEFYInKPPk6daSU78eHPSQ-1; Wed, 14 Jan 2026 03:20:37 -0500
X-MC-Unique: ZEFYInKPPk6daSU78eHPSQ-1
X-Mimecast-MFC-AGG-ID: ZEFYInKPPk6daSU78eHPSQ_1768378836
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-477563a0c75so50977525e9.1
        for <fsverity@lists.linux.dev>; Wed, 14 Jan 2026 00:20:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768378836; x=1768983636;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VYnnUZghf6HwJqXJDWVaeOjjdjMBw+O6FSttE0RsUb8=;
        b=M2F4szT8LrfLVEcygb02vRHKVHIWuaPcMrSOMT1UVZRdBWTm0MQ2nGUCx8AoQqpytH
         cNLBEMszWchh7/AsvzMGGU1enXWeKKfpVb3VhHAikOZPwru24xxAjdpM6uMFoVZc4FpT
         FLEzMDLiW2V9879TKCTaxzkM47uyG91Zd4lrD2orJt6ZBOyCn0tmV5hFjjRZq22n8s1p
         K/nRUISiaSf3Ruhv44Pe2FYt0ZHQuTC/xpWnTYtDmMeCzyi4ccb8F14JSP5HReDJ8hK/
         Ea5AiGuMyn8jxRb5OoJh5n1Iodf7uXiyxb4bCBX6ANgyEjmrT/sz+z3TFLrdtuDM34yy
         sc7w==
X-Forwarded-Encrypted: i=1; AJvYcCUVsfFsoPpqN0SqXsH0Uzu3k6Ogz5mqwL4oZUorz66V9k8WjKlk5FelvEAkh+ZLxceLQe3FGJY5EA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yza6wXkxsJYGcScj5+5TWc6zMUtbncGshGEOzQHTba6kHbMHYac
	lubsGFAPdOFZU9XSiNHmabsY+5sYYzNESWUIEg7jJ7QklsYTTjV/tXkY7I4PRV9peLcd8lBdU9l
	h9ywQK6arEs9yUsQp/F0GCOSOprmi/vtdpv6QfssxtHlKjHlrM3W4LFVmfVo=
X-Gm-Gg: AY/fxX4e36ckq5LLCnyIh6pHB7HLYxDX+GMtel9Y6XUgxtZ4vho+UrAIe469jy+5YVG
	u/g3CvUT+SCJlSHOBkb/Tqj8Nm5lMI7TUwJR+d2DcrI8qyk9xnoNxB600Hn01SAbNhmjAFLbZi/
	YB6vrEFWJzxnuDDI5VoMgLrsArDrxsa4/0W5scfh/Faac62Ip2hDqqQEsZv7eNW37M5HHmSrSA4
	AVjcypu3bYSl5CdfZ9f2H5altW9Q3T33FWGuSUMOCAyPXnla0U0AqjBnvTNmbSe8DkI3WGY6om5
	R13t7cnPpxcsg+xeb0OvV5KPcgSFeE/CebWlQFdogu3OyjRBeCP96GVSxT3H3vAhguuUQiNDoO4
	=
X-Received: by 2002:a05:600c:3555:b0:47b:e2a9:2bd7 with SMTP id 5b1f17b1804b1-47ee3363c12mr21824075e9.19.1768378836240;
        Wed, 14 Jan 2026 00:20:36 -0800 (PST)
X-Received: by 2002:a05:600c:3555:b0:47b:e2a9:2bd7 with SMTP id 5b1f17b1804b1-47ee3363c12mr21823815e9.19.1768378835799;
        Wed, 14 Jan 2026 00:20:35 -0800 (PST)
Received: from thinky ([217.30.74.39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5edb7esm48605635f8f.30.2026.01.14.00.20.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 00:20:35 -0800 (PST)
Date: Wed, 14 Jan 2026 09:20:34 +0100
From: Andrey Albershteyn <aalbersh@redhat.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: Matthew Wilcox <willy@infradead.org>, fsverity@lists.linux.dev, 
	linux-xfs@vger.kernel.org, ebiggers@kernel.org, linux-fsdevel@vger.kernel.org, 
	aalbersh@kernel.org, david@fromorbit.com, hch@lst.de
Subject: Re: [PATCH v2 0/23] fs-verity support for XFS with post EOF merkle
 tree
Message-ID: <5z5r6jizgxqz5axvzwbdmtkadehgdf7semqy2oxsfytmzzu6ik@zfvhexcp3fz2>
References: <cover.1768229271.patch-series@thinky>
 <aWZ0nJNVTnyuFTmM@casper.infradead.org>
 <op5poqkjoachiv2qfwizunoeg7h6w5x2rxdvbs4vhryr3aywbt@cul2yevayijl>
 <aWci_1Uu5XndYNkG@casper.infradead.org>
 <20260114061536.GG15551@frogsfrogsfrogs>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260114061536.GG15551@frogsfrogsfrogs>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: aZG9WjGGNyE3jCe_M1S2d1PSFaWhhydRwDeCLChbLTs_1768378836
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2026-01-13 22:15:36, Darrick J. Wong wrote:
> On Wed, Jan 14, 2026 at 05:00:47AM +0000, Matthew Wilcox wrote:
> > On Tue, Jan 13, 2026 at 07:45:47PM +0100, Andrey Albershteyn wrote:
> > > On 2026-01-13 16:36:44, Matthew Wilcox wrote:
> > > > On Mon, Jan 12, 2026 at 03:49:44PM +0100, Andrey Albershteyn wrote:
> > > > > The tree is read by iomap into page cache at offset 1 << 53. This is far
> > > > > enough to handle any supported file size.
> > > > 
> > > > What happens on 32-bit systems?  (I presume you mean "offset" as
> > > > "index", so this is 1 << 65 bytes on machines with a 4KiB page size)
> > > > 
> > > it's in bytes, yeah I missed 32-bit systems, I think I will try to
> > > convert this offset to something lower on 32-bit in iomap, as
> > > Darrick suggested.
> > 
> > Hm, we use all 32 bits of folio->index on 32-bit plaftorms.  That's
> > MAX_LFS_FILESIZE.  Are you proposing reducing that?
> > 
> > There are some other (performance) penalties to using 1<<53 as the lowest
> > index for metadata on 64-bit.  The radix tree is going to go quite high;
> > we use 6 bits at each level, so if you have a folio at 0 and a folio at
> > 1<<53, you'll have a tree of height 9 and use 17 nodes.
> > 
> > That's going to be a lot of extra cache misses when walking the XArray
> > to find any given folio.  Allowing the filesystem to decide where the
> > metadata starts for any given file really is an important optimisation.
> > Even if it starts at index 1<<29, you'll almost halve the number of
> > nodes needed.

Thanks for this overview!

> 
> 1<<53 is only the location of the fsverity metadata in the ondisk
> mapping.  For the incore mapping, in theory we could load the fsverity
> anywhere in the post-EOF part of the pagecache to save some bits.
> 
> roundup(i_size_read(), 1<<folio_max_order)) would work, right?

Then, there's probably no benefits to have ondisk mapping differ,
no?

> 
> > Adding this ability to support RW merkel trees is certainly coming at
> > a cost.  Is it worth it?  I haven't seen a user need for that articulated,
> > but I haven't been paying close attention.
> 
> I think the pagecache writes of fsverity metadata are only performed
> once, while enabling fsverity for a file.

yes

-- 
- Andrey

