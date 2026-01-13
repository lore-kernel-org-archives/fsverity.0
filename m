Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA5963570D3
	for <fsverity@lists.linux.dev>; Tue, 13 Jan 2026 10:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768298862; cv=none; b=hvMrPPSwYDiCXtuZC0kN8YReu2WIL40kLtvK7n434EmQ1kE2nBmdDOBI1zw/KtD9mikwZwtbvWyF8KjGKnamP5lcTMNgl3V0bNZQyC/MXfJTUYP7aCq87qCL9sCCam911tPDf4nvNgc0bqoYIsW4px21otDswyWqoGmPi39O7HI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768298862; c=relaxed/simple;
	bh=uAFVPI6uQiEXpq8Eb8dhHlts2OgSkzLJamHHnPYRfv4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=JVhmh70RUWp5PcnEbWmTr9ycwMuodv9fe4D/Tr+Uig0D9aOObGrWEQizCJkqHLzvn+vgCbvqyXBi4MLt9hi2wUQ8ncdPUGgp6TTLMQelpD944v/LuOjF3XQ6OkNHlHmBkJQvTLsV9wPF4UPrfWShyAKkKOBtiaMdR/aFiSv0CJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XlAkzSRz; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XlAkzSRz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768298859;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ey7dVDoqltlJQHSEzn99T7MBP69D70+LdEPWnoRweKs=;
	b=XlAkzSRznoPXMxmLLGvg2GF2JzfyRFAHnAVRWXvQS2Pjj8671sLFJ24zmm6kfcHdpj09b5
	hzXAj9Aqf+SnI62XHfGJs4qB6i6wBGhkwGnc+0nfQY/XnSiaj+RF94FgywCCbKCfhz20/n
	NnJRjozzDXamw1M6aLW4VM75DxVk5Cc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-371-bfnZ0yjTMlmxxd2djRUWxA-1; Tue, 13 Jan 2026 05:07:38 -0500
X-MC-Unique: bfnZ0yjTMlmxxd2djRUWxA-1
X-Mimecast-MFC-AGG-ID: bfnZ0yjTMlmxxd2djRUWxA_1768298857
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-47d17fff653so32744675e9.0
        for <fsverity@lists.linux.dev>; Tue, 13 Jan 2026 02:07:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768298857; x=1768903657;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ey7dVDoqltlJQHSEzn99T7MBP69D70+LdEPWnoRweKs=;
        b=nvq+aO4gqZNXIbaTXiVVZArmvIGIeMxRuJKViLuMsbFzDivdmpEVcispDk/cYOT7eo
         y4C2G5KAdUGmFjGPL5yz8YvaybRZtNtRKFeXFe90g448oOFzsX3y4N88gw+W8bc/pFBd
         OMRwGtBrE6CA4YXNcbYPpP28mb0T47M+ZwtJKOTBCEUdRl7TGez+YP3LyWAqQKuqXv3M
         L+8g1ewu8ci3GmddjmyAnElTRj/u4rWZCdrghVdyiwXZTOLg68uGUO7JLfcr6qGXMnXQ
         0cqiFPObtbYmfejVGsG0liYUIyw1cpDXyXlQkAd9Zc5oph5y6fSdTsbERAviRFgPaJul
         q4tA==
X-Gm-Message-State: AOJu0Yyt8wS7KcppOHhehuut582ol/VEzQ7d1S9T+djWtbVnjalpKAdu
	oBmp9hADY0ZRF2WELiFvbpjtPIQqYB5ueblS2EkqQ+lZc5gMQ7Pb0DCKk+mqNeq8Xd6mDioltC2
	pKCVvCzVWl6mefoXlnItYEAKglB8JI7fKptD2oRIHPjLPqi2OK2MLPQ6GoAk=
X-Gm-Gg: AY/fxX4IxcrtWTP9DGOoC1fjvEzLMQHNKpqireJk785tR1ZpGXTrClx19dx5pD0jszF
	IEQPwDvUyQmAh6RAoGk3NvlX4Ec/j+5lzOP1f3pltkVjhnWfxRZ+8gIw6w2pSAIbPACqwWdSaX6
	VsLGzerwpbFk7pUG7p6AZ4gOlm0TedTqc8WRIcTo6/eT6xjoK8Yp32y0N7yTOtWdJCnMvG4wMG8
	P3Yc8mWlXwTw8nWJ/AT5A/8Ax+mo1Pf44JeM4OnN1IhCzZRDtzgvJHdUB3xGeszh48+fHSdnN2C
	0JmNb+T94rJPQpnWXHtaekvMLcSSg4c5QAkj/R1HQEc1r1xFUevd5Q5VqCABGh1A3omPHw167sc
	=
X-Received: by 2002:a05:600c:3b90:b0:471:9da:5248 with SMTP id 5b1f17b1804b1-47d84b39890mr234794035e9.26.1768298856892;
        Tue, 13 Jan 2026 02:07:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG638nLxFUUqlUT1KTaJxjB9RnZGSQ8pNA6wA9H+EpxUcQiR/AspZiwcScAJJ9qXFN2tPVnKQ==
X-Received: by 2002:a05:600c:3b90:b0:471:9da:5248 with SMTP id 5b1f17b1804b1-47d84b39890mr234793655e9.26.1768298856330;
        Tue, 13 Jan 2026 02:07:36 -0800 (PST)
Received: from thinky ([217.30.74.39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47edb26792fsm23721915e9.14.2026.01.13.02.07.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 02:07:35 -0800 (PST)
Date: Tue, 13 Jan 2026 11:07:35 +0100
From: Andrey Albershteyn <aalbersh@redhat.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: fsverity@lists.linux.dev, ebiggers@kernel.org, aalbersh@kernel.org
Subject: Re: [PATCH 1/2] fs: add FS_XFLAG_VERITY for fs-verity files
Message-ID: <vnmnsza4dbiecac47lbjco7abclvjahmpgutho5atwfxv62js6@nlooeudq7hmb>
References: <cover.1768219885.patch-series@thinky>
 <osw6nyp4khzjirdl5mf7ebpcuxlqxqggfez62vcx7bfj5kgksv@pt2bvkxmb5t3>
 <20260112220257.GG15551@frogsfrogsfrogs>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260112220257.GG15551@frogsfrogsfrogs>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: VjIx8jentQOg_7uAJCdWOlagA_sRajZFmy2Db5r1XO4_1768298857
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2026-01-12 14:02:57, Darrick J. Wong wrote:
> On Mon, Jan 12, 2026 at 01:14:21PM +0100, Andrey Albershteyn wrote:
> > fs-verity introduced inode flag for inodes with enabled fs-verity on
> > them. This patch adds FS_XFLAG_VERITY file attribute which can be
> > retrieved with FS_IOC_FSGETXATTR ioctl() and file_getattr() syscall. This
> > flag is read-only and can not be set with corresponding set ioctl() and
> > file_setattr().
> > 
> > Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org>
> > ---
> >  Documentation/filesystems/fsverity.rst | 16 ++++++++++++++++
> >  fs/file_attr.c                         |  4 ++++
> >  include/linux/fileattr.h               |  2 +-
> >  include/uapi/linux/fs.h                |  1 +
> >  4 files changed, 22 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/filesystems/fsverity.rst b/Documentation/filesystems/fsverity.rst
> > index 412cf11e32..541ac4af4b 100644
> > --- a/Documentation/filesystems/fsverity.rst
> > +++ b/Documentation/filesystems/fsverity.rst
> > @@ -341,6 +341,22 @@
> >  FS_IOC_GETFLAGS and FS_IOC_MEASURE_VERITY because it doesn't require
> >  opening the file, and opening verity files can be expensive.
> >  
> > +FS_IOC_FSGETXATTR
> > +-----------------
> > +
> > +Since Linux v6.19, the FS_IOC_FSGETXATTR ioctl sets FS_XFLAG_VERITY (0x00020000)
> 
> We're headed to v7.0 now, please update that.
> 
> > +in the returned flags when the file has verity enabled. Note that this attribute
> > +cannot be set with FS_IOC_FSSETXATTR as enabling verity requires input
> > +parameters. See FS_IOC_ENABLE_VERITY.
> > +
> > +file_getattr
> > +------------
> > +
> > +Since Linux v6.19, the file_getattr() syscall sets FS_XFLAG_VERITY (0x00020000)
> > +in the returned flags when the file has verity enabled. Note that this attribute
> > +cannot be set with file_setattr() as enabling verity requires input parameters.
> > +See FS_IOC_ENABLE_VERITY.
> > +
> >  .. _accessing_verity_files:
> >  
> >  Accessing verity files
> > diff --git a/fs/file_attr.c b/fs/file_attr.c
> > index 13cdb31a3e..f44c873af9 100644
> > --- a/fs/file_attr.c
> > +++ b/fs/file_attr.c
> > @@ -37,6 +37,8 @@
> >  		fa->flags |= FS_DAX_FL;
> >  	if (fa->fsx_xflags & FS_XFLAG_PROJINHERIT)
> >  		fa->flags |= FS_PROJINHERIT_FL;
> > +	if (fa->fsx_xflags & FS_XFLAG_VERITY)
> > +		fa->flags |= FS_VERITY_FL;
> >  }
> >  EXPORT_SYMBOL(fileattr_fill_xflags);
> >  
> > @@ -67,6 +69,8 @@
> >  		fa->fsx_xflags |= FS_XFLAG_DAX;
> >  	if (fa->flags & FS_PROJINHERIT_FL)
> >  		fa->fsx_xflags |= FS_XFLAG_PROJINHERIT;
> > +	if (fa->flags & FS_VERITY_FL)
> > +		fa->fsx_xflags |= FS_XFLAG_VERITY;
> >  }
> >  EXPORT_SYMBOL(fileattr_fill_flags);
> >  
> > diff --git a/include/linux/fileattr.h b/include/linux/fileattr.h
> > index f89dcfad3f..6aebfd63bd 100644
> > --- a/include/linux/fileattr.h
> > +++ b/include/linux/fileattr.h
> > @@ -16,7 +16,7 @@
> >  
> >  /* Read-only inode flags */
> >  #define FS_XFLAG_RDONLY_MASK \
> > -	(FS_XFLAG_PREALLOC | FS_XFLAG_HASATTR)
> > +	(FS_XFLAG_PREALLOC | FS_XFLAG_HASATTR | FS_XFLAG_VERITY)
> >  
> >  /* Flags to indicate valid value of fsx_ fields */
> >  #define FS_XFLAG_VALUES_MASK \
> > diff --git a/include/uapi/linux/fs.h b/include/uapi/linux/fs.h
> > index 66ca526cf7..70b2b661f4 100644
> > --- a/include/uapi/linux/fs.h
> > +++ b/include/uapi/linux/fs.h
> > @@ -253,6 +253,7 @@
> >  #define FS_XFLAG_FILESTREAM	0x00004000	/* use filestream allocator */
> >  #define FS_XFLAG_DAX		0x00008000	/* use DAX for IO */
> >  #define FS_XFLAG_COWEXTSIZE	0x00010000	/* CoW extent size allocator hint */
> > +#define FS_XFLAG_VERITY		0x00020000	/* fs-verity enabled */
> 
> Is the indentation broken       ^^^^^^^^ here?

I think it's fine (there's two tabs one of them is single char
width), I suppose it shows like this due to + at the line start.

> 
> Otherwise this looks fine to me.
> 
> --D
> 
> >  #define FS_XFLAG_HASATTR	0x80000000	/* no DIFLAG for this	*/
> >  
> >  /* the read-only stuff doesn't really belong here, but any other place is
> > 
> > -- 
> > - Andrey
> > 
> 

-- 
- Andrey

