Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B1D14AD3D
	for <fsverity@lists.linux.dev>; Tue,  2 Apr 2024 17:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712078114; cv=none; b=e9C/n9ewbI2kWQWnXqDKEYYEqSeEA+j/FTUe+Z4rC6L8Omnf28t7KGL3xig/N1M2Qw046XzdTvImSBMM+kRCFsfw3ug8b/4362aSKKMWwV89mqZk4v90p777PhZK1TPMl5mM15V1im2TkccNUfpUHQwjmA5Er2RwMo4KgqeNE/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712078114; c=relaxed/simple;
	bh=gONxLiG/KtKALcV3UaKI4cYHp0a8d+JcZLnRPZyZ83I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=lC5ejZ4d66DeV8JiXi6Qx0BlKrGUDwjvCLl94IMjDjnHUvYD9UXPq/MtI1mpL8F8Q2O9XVMuJyEQfP60W+m/vf4ZE0a8Mmj7O31UQZaiFnQqmkTjB8hdkPSI/2coqUOIOlOIX/fUM52rQ3DurK722pRQV+6GtZQmwShIKvHSaOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bvN3eUUT; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bvN3eUUT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712078111;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JH2SMOejoMJVVtHeJkNgAl35h2UZLOewvGHfqdN+G3A=;
	b=bvN3eUUT0j1ZU0cXHtJtvugFFlacexwIR7NkIzb635p32z+nAAnIhDHYAhVCH5yCPAk0Vo
	3IvybcoPyx0XdztbCMPQIObXVLQytgucF8JwjAay+gZKZmy1kCZyxTvmSmpUN4HkNgIlZZ
	xgwPFeZnY0WGMWbPXIM+lEAqsJTctOk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-563-c8s6nixIOVaUYXAnufmi2g-1; Tue, 02 Apr 2024 13:15:08 -0400
X-MC-Unique: c8s6nixIOVaUYXAnufmi2g-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4147faf154cso24172195e9.2
        for <fsverity@lists.linux.dev>; Tue, 02 Apr 2024 10:15:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712078107; x=1712682907;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JH2SMOejoMJVVtHeJkNgAl35h2UZLOewvGHfqdN+G3A=;
        b=tD6NO3+m4QxLNM/0lZDr9UbOLuYCE6bUOkGHCL1mE6McxjD1Pr+i9CSlUbweFcQKuR
         cSgaF8iQKhp6yteloawgjkQEkLW7M/pKG7/M0TYVwPhvoxqPdmRws+MF1KQ+d1Gjg/W1
         XtPIq63uJzHq82HWBV5TVNazySNFg9SIXQYEJSOZJuZ5zZ3pdxmKusEZNm7JpcBUmbg5
         kFNvTwMJ2ek19mnznf0nfHFnvm35+Ra3igeh9EW4B4dlZeB1N4Hvru6IbN3YQy1Gh27y
         Xr5lZYVWYPwHyO35MK+TkmzQt5edk1TxzfnRkafW/Xf3sXWGrrp7C5SrfQZe+HwXTmde
         L+HA==
X-Forwarded-Encrypted: i=1; AJvYcCXx9w9YBQgVYmW/L6sHJlfEYrvgoIqmWf/Z0dOGE4VXHCKUlmRxwj09kNNoY50nAAI7m8JeThkSaCUE78/NtUihmu0imogTdMo=
X-Gm-Message-State: AOJu0Yyl9mRXbz2u9hne41G4I5QaX6tokSTBRi1IThjPN5J9Gqia96zg
	aWmRDJxCcIO1DynYzQ2/awg1LuVYaZiKakby6okwuo2LvnaPIIhZbpMVe/wL4IOB4vmcUr6S4Dc
	2EJ+pP0HNUO7ibWa0pP7Y8xSVHkcczUt/PoyketO3rGRzH1qYgg8bntfwbpnJrTg=
X-Received: by 2002:a05:600c:4583:b0:414:7198:88a7 with SMTP id r3-20020a05600c458300b00414719888a7mr10227232wmo.34.1712078107262;
        Tue, 02 Apr 2024 10:15:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEBkh/H8jx4WNfScg0QetIRqTHa3bAsRuQbjjcs0nbQsFEOKtPqhLK97VSqKnvJb3sIfaqaSQ==
X-Received: by 2002:a05:600c:4583:b0:414:7198:88a7 with SMTP id r3-20020a05600c458300b00414719888a7mr10227213wmo.34.1712078106668;
        Tue, 02 Apr 2024 10:15:06 -0700 (PDT)
Received: from thinky ([109.183.6.197])
        by smtp.gmail.com with ESMTPSA id fc11-20020a05600c524b00b0041408e16e6bsm18656884wmb.25.2024.04.02.10.15.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 10:15:06 -0700 (PDT)
Date: Tue, 2 Apr 2024 19:15:04 +0200
From: Andrey Albershteyn <aalbersh@redhat.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: ebiggers@kernel.org, linux-xfs@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, fsverity@lists.linux.dev
Subject: Re: [PATCH 27/29] xfs: make it possible to disable fsverity
Message-ID: <lq4w62nepbmkxaktcpukts4v3jz6wbjfc7odv76iujttzrvyze@yglhbnoiwptc>
References: <171175868489.1988170.9803938936906955260.stgit@frogsfrogsfrogs>
 <171175869006.1988170.17755870506078239341.stgit@frogsfrogsfrogs>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <171175869006.1988170.17755870506078239341.stgit@frogsfrogsfrogs>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2024-03-29 17:43:06, Darrick J. Wong wrote:
> From: Darrick J. Wong <djwong@kernel.org>
> 
> Create an experimental ioctl so that we can turn off fsverity.
> 
> Signed-off-by: Darrick J. Wong <djwong@kernel.org>
> ---
>  fs/xfs/libxfs/xfs_fs_staging.h |    3 ++
>  fs/xfs/xfs_fsverity.c          |   73 ++++++++++++++++++++++++++++++++++++++++
>  fs/xfs/xfs_fsverity.h          |    3 ++
>  fs/xfs/xfs_ioctl.c             |    6 +++
>  4 files changed, 85 insertions(+)
> 
> 

Looks good to me:
Reviewed-by: Andrey Albershteyn <aalbersh@redhat.com>

-- 
- Andrey

