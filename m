Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB36F59B56
	for <fsverity@lists.linux.dev>; Tue,  2 Apr 2024 10:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712052711; cv=none; b=O/bR2TsHUBxdSEAzpQgB9vi5GZdanfudtnsCb8uYAzQDfr2vudgcI/NUnHLaytng7+hHV8Qo0Kb+/qm12pVWyqgY4eUXMtKxAANTbqlyBKQEVFQEek0Pm2zMzvmn9srPC5EeP1p8246PxZB8/15RaO112gvOW7kBotirXmsbel0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712052711; c=relaxed/simple;
	bh=oZZKISQHCkrhZ3u+KHXv2WzzLIaOCG06G8lFEDVCZx0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=LFqyeVYLJzs9+qmNvXZR+fqmekB/mjHWqr/JjTdNhFB5eLBvigaVSisYhuOR3itLw6oRpNeA1dl8m7++6vDIg3LvOz0+nIorTQGSYpf/868JpClreSYrtKAJj2K/zfvRZrJOek02QYNJ3FWLvhpNlDUfRGsHOOJ6lCUPT7npyQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JSQLUx/0; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JSQLUx/0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712052708;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8orag78Onu0GAnEHG0xqHWizNVsLLZWgOVAfNSrOVdQ=;
	b=JSQLUx/0oyII5W4NhZefFS5gJO/4qteyCqJd3w27s+j4j51ixlngaPxTRscCDg4hKIjnbE
	TRfcEYO29r8pdASKxOoz3mRFU3Kj/RAfA67xsDIxOD7PNzV8m6vroIpUXadQhtjxRHPop5
	AZoea0u+HhApVjvmlowTT0mnChRbBqc=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-638-S0qjnQVpN7iO9LEBWcIdtQ-1; Tue, 02 Apr 2024 06:11:47 -0400
X-MC-Unique: S0qjnQVpN7iO9LEBWcIdtQ-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a4455ae71fcso303626466b.3
        for <fsverity@lists.linux.dev>; Tue, 02 Apr 2024 03:11:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712052706; x=1712657506;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8orag78Onu0GAnEHG0xqHWizNVsLLZWgOVAfNSrOVdQ=;
        b=OPEdQbfMFJ4xr+kHwVOOfMvNBfeTfgeFdkQ9MjeHSX2Pd0TzAdt+26hgceBDEfXiXG
         oqCnQTQXe5FfTKGE6Kja5+LpgFxohec1ewB270HQjQ+DtcuZ9dJrej0PkFw+8n9HWeEs
         LvSuf69noHvTlp9tdniR9+qA35Igdee/vetT8wfh6UB02SZ2hLbVt34w9MJxvJvHNksb
         i8/XWwaot7C7FJLyx35NigdiJWNJkd5cHPh5HkrMr6LY/ZeJV0wLaeZlypKHnJEgTJVT
         kwf9xUoHTmhlYhfUo442Jp5uEMYjtjmv0YIjqoSaJdJfvBndedCSfVFJsLkUwftiEse8
         WUqw==
X-Forwarded-Encrypted: i=1; AJvYcCXDEf6cmlzvMuKNS81qrbPAKgr6ILukRnC+Ne7X9hkequlNrAn8mWYUb17khR7BjabQAVFsco/HaXfxJ29eQuf4KTBLH2he4EE=
X-Gm-Message-State: AOJu0Yy1dz7xYpjNSgUdK25qTO1ggAK/KqKcWfIr2zdQKhjxbEXcohZl
	mVNGewWp4aINWKgiQmudAfHl4FV0vr4jtSG6sKSu1kkfpnYpJ+j8zWYFGC7nhkwqYK/t+M+NwMi
	CZ0P2SydSyty3zbaJE2BX0y2y3LUwKOuxoXkhUufBMukud2sVsJHxVYU=
X-Received: by 2002:a17:907:97c9:b0:a4e:5088:a959 with SMTP id js9-20020a17090797c900b00a4e5088a959mr7941031ejc.17.1712052705925;
        Tue, 02 Apr 2024 03:11:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE41BTVXEvs87C4g9qG9R7fbvM19lrF8k4VutiO9eGKUH1kUl1mTLBx9qRMEitVDjuOVUJp8g==
X-Received: by 2002:a17:907:97c9:b0:a4e:5088:a959 with SMTP id js9-20020a17090797c900b00a4e5088a959mr7940989ejc.17.1712052705312;
        Tue, 02 Apr 2024 03:11:45 -0700 (PDT)
Received: from thinky ([109.183.6.197])
        by smtp.gmail.com with ESMTPSA id dp12-20020a170906c14c00b00a473a1fe089sm6354140ejc.1.2024.04.02.03.11.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 03:11:45 -0700 (PDT)
Date: Tue, 2 Apr 2024 12:11:44 +0200
From: Andrey Albershteyn <aalbersh@redhat.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: ebiggers@kernel.org, linux-xfs@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, fsverity@lists.linux.dev
Subject: Re: [PATCH 04/29] xfs: minor cleanups of xfs_attr3_rmt_blocks
Message-ID: <uevz4uxzbgos2zgffvqgjfxyycbwddyq26wli7l2ufvq33qqic@rpy5vxr2nuqn>
References: <171175868489.1988170.9803938936906955260.stgit@frogsfrogsfrogs>
 <171175868626.1988170.3178382336043313130.stgit@frogsfrogsfrogs>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <171175868626.1988170.3178382336043313130.stgit@frogsfrogsfrogs>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2024-03-29 17:37:06, Darrick J. Wong wrote:
> From: Darrick J. Wong <djwong@kernel.org>
> 
> Clean up the type signature of this function since we don't have
> negative attr lengths or block counts.
> 
> Signed-off-by: Darrick J. Wong <djwong@kernel.org>
> ---
>  fs/xfs/libxfs/xfs_attr_remote.c |   16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> 

Looks good to me:
Reviewed-by: Andrey Albershteyn <aalbersh@redhat.com>

-- 
- Andrey

