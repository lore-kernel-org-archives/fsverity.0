Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC66E199D2
	for <fsverity@lists.linux.dev>; Wed, 11 Oct 2023 11:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dbFBEO+R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697022403;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=U5ykf39aqWNOUh8hPUCI/eBpTU0D+3eGNJ/G++fJXuk=;
	b=dbFBEO+RD/SA0KSLU9DE0z8PzRpmcqynKz1ysGemRAV2cTmOm0mzrU9MpchVQ7dRe+k1+Y
	KNhoRLhMRofFWjH3ZnTSLgH49mmmL+3MPIUaeTrDHNaLh1c9ZmuUaYrSROokrqGWCAJSbt
	bB2VF1Hb44p1BDlZA70LqJxtrNgqNSA=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-475-NeH-BF67PyObglYO-PEG-Q-1; Wed, 11 Oct 2023 07:06:42 -0400
X-MC-Unique: NeH-BF67PyObglYO-PEG-Q-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-53df4385dccso37006a12.0
        for <fsverity@lists.linux.dev>; Wed, 11 Oct 2023 04:06:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697022401; x=1697627201;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U5ykf39aqWNOUh8hPUCI/eBpTU0D+3eGNJ/G++fJXuk=;
        b=dcpOMtHUzU9PkGtVKoXvYqvvJXN2rX0JAI1DeibM4KxFHc4kg8PgV5edj/MF/DiH4T
         6veN9yXYnWnNU7BDULBTDazlvCGr4nkXpyVyYTp2mM3ZdZx9LWnlPWusRcKQXP/S3nAp
         jCsr8yJjNxtQC70NuHjmRbnzQ8I9bq9EC7hN8YaG0UYH2g5HaWffCIWQYFCTofTWO6zH
         gzXoG7b3DJoHRTcHPsJysDRVYBZ9dRJeL4M2UVWl4jdt1vBA6OQ1tt81Ia7Ir6fXTEk3
         Y6vdHZ50PlIE6LpLOM6X38wcQ726KQJi3RgKK4ArwOkCO9oOp4v7k3KA1+gEfKgykARZ
         AtPQ==
X-Gm-Message-State: AOJu0YwljlpbxHO6UkwGOiTIFz/gX525Dk/jKZmIB4r4+N4xZqNYXtsS
	g2fMI0KqwKLAE6JSakOyKBCPVk+WcyMMg7WW1Mnlnx/TndzNtdarrVcR8ldfKMzTc8jGJrK/IR8
	OJLrN65QJkHTmT+GKLw==
X-Received: by 2002:a50:ee0a:0:b0:530:4967:df1a with SMTP id g10-20020a50ee0a000000b005304967df1amr16923190eds.17.1697022401149;
        Wed, 11 Oct 2023 04:06:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSGYnkltW7whS6Jj12+S7pY5s2T9PH4UQibdHpglYLF1SUbXTX1V2fcfwWWQglY7dJbEAyjA==
X-Received: by 2002:a50:ee0a:0:b0:530:4967:df1a with SMTP id g10-20020a50ee0a000000b005304967df1amr16923158eds.17.1697022400685;
        Wed, 11 Oct 2023 04:06:40 -0700 (PDT)
Received: from thinky ([109.183.6.197])
        by smtp.gmail.com with ESMTPSA id n14-20020aa7c44e000000b005361fadef32sm8628821edr.23.2023.10.11.04.06.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 04:06:40 -0700 (PDT)
Date: Wed, 11 Oct 2023 13:06:39 +0200
From: Andrey Albershteyn <aalbersh@redhat.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	fsverity@lists.linux.dev, djwong@kernel.org, david@fromorbit.com, dchinner@redhat.com
Subject: Re: [PATCH v3 05/28] fs: add FS_XFLAG_VERITY for fs-verity sealed
 inodes
Message-ID: <bwwok7q2mf6loildyudbuwazvojz5e4aiqhnn4ptgmno4w2wym@xrvlvhk3u2hy>
References: <20231006184922.252188-1-aalbersh@redhat.com>
 <20231006184922.252188-6-aalbersh@redhat.com>
 <20231011040544.GF1185@sol.localdomain>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20231011040544.GF1185@sol.localdomain>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2023-10-10 21:05:44, Eric Biggers wrote:
> There's currently nowhere in the documentation or code that uses the phrase
> "fs-verity sealed file".  It's instead called a verity file, or a file that has
> fs-verity enabled.  I suggest we try to avoid inconsistent terminology.
> 
> Also, it should be mentioned which kernel versions this works on.
> 
> See for example what the statx section of the documentation says just above the
> new section that you're adding:
> 
>     Since Linux v5.5, the statx() system call sets STATX_ATTR_VERITY if
>     the file has fs-verity enabled.

Sure, will change terminology. Would it be fine to add kernel
version in additional patch when patchset is merged?

> 
> Also, is FS_XFLAG_VERITY going to work on all filesystems?  The existing ways to
> query the verity flag work on all filesystems.  Hopefully any new API will too.
> 

Yes, if FS_VERITY_FL is set on the verity file. I will probably move
hunks in fs/ioctl.c from [1] to this patch so it makes more sense.

> Also, "Extended file attributes" is easily confused with, well, extended file
> attributes (xattrs).  It should be made clear that this is talking about the
> FS_IOC_FSGETXATTR ioctl, not real xattrs.
> 
> Also, it should be made clear that FS_XFLAG_VERITY cannot be set using
> FS_IOC_FSSETXATTR.  See e.g. how the existing documentation says that
> FS_IOC_GETFLAGS can get FS_VERITY_FL but FS_IOC_SETFLAGS cannot set it.

Thanks, will add it.

[1]: https://lore.kernel.org/all/20231011013940.GJ21298@frogsfrogsfrogs/T/#m75e77f585b9b7437556d108c325126865c1f6ce7

-- 
- Andrey

