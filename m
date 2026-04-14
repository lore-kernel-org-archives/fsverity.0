Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1DA23E6DCC
	for <fsverity@lists.linux.dev>; Tue, 14 Apr 2026 13:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776174825; cv=none; b=deiDFMFhBq8BQ0P2+yUiWObxaSXWNFcXXaRLi01fBdtse/n2yxIt7BKYVkCXmQsV4Ur790vDT+ytx4UDHJ5fhQG4tZRWO7M7GGMcMiJKKp6OSzJ7X0zYhHAB++eMmTCQ74xIZPCxBhyQC67l+vG+dMyTUJwKaqC4JwKVAGstifA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776174825; c=relaxed/simple;
	bh=zqDrKV4/Tx3b7Hkm4HZGlLUnVsA7Xl9FQkWdRSU4yPE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=FQfLhdwdMtDeMcbhTp0HJop28DlvZgyG+9EYO0DGo6Plvy5Q6q61NUcnppHEAgixxXzd918vk6yGcVwr/K68OhuWb3MCFNKTzMPy4xytz1/pkA9v9bhW9ZmfOgYOO3OymJygP+q9IA0YOcNUOd2oIKwP1Ul3SBcfGCKuk/WdLtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SBNKXcuu; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SBNKXcuu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776174821;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YY1Mbdcw/s+c+i+V6kA9q5Q93RsUlrrtxkE/+YiJlwM=;
	b=SBNKXcuuXicvW3yBITJHxAHD0uZTxX2YPH8/wZAImg5DK3UOiC9qaZs+yRvvypbdqbwoxW
	6TmsIIrvuL7WTloLVdi1ZDO2H3Tbu89T6ywkvT2YhoEmUaPj+zswo17Rhgym3pjNojguGy
	td2LhwZCnqAy2GnvJcb5yHtO8S9ZioI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-530-jDHHdS07MVSzyWNdhGPwAQ-1; Tue, 14 Apr 2026 09:53:40 -0400
X-MC-Unique: jDHHdS07MVSzyWNdhGPwAQ-1
X-Mimecast-MFC-AGG-ID: jDHHdS07MVSzyWNdhGPwAQ_1776174819
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-488d9e1e61aso27257285e9.0
        for <fsverity@lists.linux.dev>; Tue, 14 Apr 2026 06:53:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776174819; x=1776779619;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YY1Mbdcw/s+c+i+V6kA9q5Q93RsUlrrtxkE/+YiJlwM=;
        b=ReWGP2ViaMCQG0RtsEuQzK1EEepdOBX8gTja65h6iEra3v0n2T4HMyjifnNxPAtQAH
         7hvNhV6RQiXkFTrrK04hSe0JhK3ABnHGFFOMuOY3cKNBy7itqu8hnDIlgrKEHcpTIYR4
         OFFIJFIgsu+PcTOewI+cEo2uUhuInwMHySZ4nnh0hRnHMl7hcb+E89cBBebTh/EBFSU4
         2FxYFefZj2HS+ggC8OHi/190XH91ptALqA+UonL89VH0E3uTaObn1xy/4Oc2fDO5I+3c
         Tnpv+9h6QjzSS01fdMSomWrPJKMjm1mYN5L1IZoJrgl1KL8WHNHbhBmwLojcecatb9iB
         bl6w==
X-Forwarded-Encrypted: i=1; AFNElJ+JeBAmWuKAvN8B5l1N1I7VnQzr/crsOUJRqQV35/Y2f/a14JtCUssB4fWgl63GEnrlUUqMEHG2Fw==@lists.linux.dev
X-Gm-Message-State: AOJu0YylLRqg1FDLL3zbrUb3sK+10wlBIkxCJJCeq0OmgADyG+MCYvb3
	OefCs/ArvI3jWbhd9Gh9p8/zyLhQA/nIhhnwzo5n2K6Rn0dc7HKKfMFj00lrJS7bXqygbQ/FomT
	PUyyoAxvu+Xe2nJRyOH4dxjKFPar/yZxBg9TOzQGQkETiNfUd14Bk/QBFv58=
X-Gm-Gg: AeBDiesuHfOnNnaBjP8I60lwLfFBgQxfz+xZ0uh59Hrv2G1ONEQrcW62f7tZBCQX1cw
	4HeeTC9OeswJLSU61Prxq6ku9adhW6BPgjpKRfnDs8+0OpBHTqvNpGSZb/YYcYDGlbz4A6/BnsU
	y0EjdeeJRsKFSkIXnWWeXZ2DjdU2JMGD1lj8INmusBO1W+90OtTE+lPEiiwlkCDzb5As3eTinZH
	Uv2EI/CISslEpvqsOGHFYj9d7hztpJAa7psiZ9q2tfE4EGO4LdMuWMMyvz98wqQnqzhKlNV640I
	B0OzsJgIWBU9a7dM7TuOBlnlBzT0an+IEmzT3tseMlWcLYLfDEeNyWNBwhkNTC/n4RjKQ8vMy7q
	js7wGKYuIm+3ibg==
X-Received: by 2002:a05:600c:a109:b0:477:76bf:e1fb with SMTP id 5b1f17b1804b1-488d6843245mr171916555e9.16.1776174818765;
        Tue, 14 Apr 2026 06:53:38 -0700 (PDT)
X-Received: by 2002:a05:600c:a109:b0:477:76bf:e1fb with SMTP id 5b1f17b1804b1-488d6843245mr171916275e9.16.1776174818293;
        Tue, 14 Apr 2026 06:53:38 -0700 (PDT)
Received: from thinky ([91.245.205.131])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5cfeb2dsm124119015e9.0.2026.04.14.06.53.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 06:53:37 -0700 (PDT)
Date: Tue, 14 Apr 2026 15:53:36 +0200
From: Andrey Albershteyn <aalbersh@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Cc: Andrey Albershteyn <aalbersh@kernel.org>, linux-xfs@vger.kernel.org, 
	fsverity@lists.linux.dev, linux-fsdevel@vger.kernel.org, ebiggers@kernel.org, 
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
	linux-btrfs@vger.kernel.org, djwong@kernel.org
Subject: Re: [PATCH v7 03/22] ovl: use core fsverity ensure info interface
Message-ID: <u3szxuhjrv7vyxwyrepuflwhzeucss7xj3cxj73mnpm5kal2da@jck24ig4oxxa>
References: <20260409131404.1545834-1-aalbersh@kernel.org>
 <20260409131404.1545834-4-aalbersh@kernel.org>
 <20260414081301.GB11138@lst.de>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260414081301.GB11138@lst.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: szn2GoKJt1TM0EGihe94rj7AclsCIf1654c93L5QRUI_1776174819
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2026-04-14 10:13:01, Christoph Hellwig wrote:
> On Thu, Apr 09, 2026 at 03:13:35PM +0200, Andrey Albershteyn wrote:
> > -	if (!fsverity_active(inode) && IS_VERITY(inode)) {
> > -		/*
> > -		 * If this inode was not yet opened, the verity info hasn't been
> > -		 * loaded yet, so we need to do that here to force it into memory.
> > -		 */
> > -		filp = kernel_file_open(datapath, O_RDONLY, current_cred());
> > -		if (IS_ERR(filp))
> > -			return PTR_ERR(filp);
> > -		fput(filp);
> > -	}
> > +	if (fsverity_active(inode))
> > +		fsverity_ensure_verity_info(inode);
> 
> fsverity_ensure_verity_info already is a no-op for !fsverity_active,
> so the check could be remove.

I don't think it is. For non-fsverity inodes it will try to call into
descriptor reading callback and fail.

> Also we should probably propagate the
> error return from fsverity_ensure_verity_info here.

oh right, thanks!

-- 
- Andrey

