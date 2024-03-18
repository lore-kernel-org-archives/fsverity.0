Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C175955C18
	for <fsverity@lists.linux.dev>; Mon, 18 Mar 2024 17:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710784376; cv=none; b=hB9EYrzupyzm7I5bXUviQAZKkaN2vNyUErVz1ctB6Y9XDrBCK/9aO5/qTG+YVxZ/es8CbE+VcrSxXxVrs/vtMLDtv6VmmqQH9a4uioVN0Ook+oHCrMiA1DcH/WyV3tBxPw3cNVZP8V9vD98i3R7OXe8y1eGnOvK83ow8CMY5IOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710784376; c=relaxed/simple;
	bh=fS/Il+cK3HtI9bAeGxWw+BBtB0/QjJLvVKLFtR8tR+8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=gLUHgIoZkCeZrE2xX3RrKluVDLWR9u2bIDzVb3CuUOkGOshvVuLlkwAsKAkd0KEn5GCQSq7rNG1hfhMZ/vKzxOaVChnRsBZJymnfYf3DUdcb+ky2wQP4v73UHMoecCimL35x1b+jqyXDWwwB5EbHTDzgxDn0uT8BR2gM3qj9xNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=H428t0ty; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="H428t0ty"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710784373;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rAbeI/yN1CujlA/Yp2t7bafFqLrYgHBFMsaR1Wk9Jl0=;
	b=H428t0tyJvhdgwM8lMNH6ZJv7Kfdym7iI+7IufWc+qg8JFDroqjRAZcKkvW/dbD/l9QVS3
	PgldtnRDEKEf/xIcTjlqvz1EnQeMXSKjMsT8S5RbRdKrwrwa4gKQo4MPD69wbsnzIPqCfs
	dmyKbDDyBQpzuG9ssChR7mwAMHS4dZY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-411-pvuo8es_Mw2utwKnQvR3Jg-1; Mon, 18 Mar 2024 13:52:51 -0400
X-MC-Unique: pvuo8es_Mw2utwKnQvR3Jg-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3417fbb38daso356034f8f.3
        for <fsverity@lists.linux.dev>; Mon, 18 Mar 2024 10:52:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710784370; x=1711389170;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rAbeI/yN1CujlA/Yp2t7bafFqLrYgHBFMsaR1Wk9Jl0=;
        b=eZG+EHi51iFguS5Pyf2UD84V2gGPY7scmiSmC5aHzMppMtplwo2pZkaehUsosYz7qC
         vU1nlYIIzAW3X/NcMupVCZAgqAOcV7VjgN4QEhuFh1Y86hFZZ24RYd5KjYCziaPNYhxS
         LVzg5BnbqoXdZhjJc1z6pWEfm/qX6aacrrZVyU/HM4zHsnBGD5DMnwtEYOYpuaE8wpHl
         /Io6WrPV3wG//LOc8+Rs2ZUaFpln8CRFXBkIisYY6V8ydepIKRQCd1dNxUNT6e75Ljnq
         Q9zKoK+Kz0s9u8IsUfQxiuM/H9eNeRnmzMybFc4yOUxpldOK5aXxChUMzN313C/4R12E
         dM8w==
X-Forwarded-Encrypted: i=1; AJvYcCU3zcLi0zXUklAg5sBgdp3huVHaNhrsdP4pdE4KJx1IsyBNLfyZ4tezGMlIp37M8scJWInwp/P6yQ5xuNraJcLB2gYKTTsttxI=
X-Gm-Message-State: AOJu0YwcmCqGCzBJSEImsWdpH5M36WVJS/aly4g0b2DEWW+bGXWGtvy0
	RKPGXw6RZx1KL33zZO26FdSA47yHNy8wwp1Ox11JRjukmp5zazGbvKzJX4Z77hKB6b2qZeYjUet
	sgRGig5hSeqtbLL9ATk82vZzVieISitwTuMukdjSKXs5/sYJWjsZAEeAjgVh3jb8=
X-Received: by 2002:adf:fdcc:0:b0:33e:c3ca:e9ff with SMTP id i12-20020adffdcc000000b0033ec3cae9ffmr8924112wrs.61.1710784369803;
        Mon, 18 Mar 2024 10:52:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFy65n4nPmyObvMmHt58bqd/Rqxh6Qm3q5Bx3DsIXra1l+xAjekqM6JmSqoP5kkpnEFHwCAqA==
X-Received: by 2002:adf:fdcc:0:b0:33e:c3ca:e9ff with SMTP id i12-20020adffdcc000000b0033ec3cae9ffmr8924098wrs.61.1710784369301;
        Mon, 18 Mar 2024 10:52:49 -0700 (PDT)
Received: from thinky ([109.183.6.197])
        by smtp.gmail.com with ESMTPSA id bs26-20020a056000071a00b0034185c5ffbcsm77268wrb.117.2024.03.18.10.52.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 10:52:48 -0700 (PDT)
Date: Mon, 18 Mar 2024 18:52:48 +0100
From: Andrey Albershteyn <aalbersh@redhat.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: ebiggers@kernel.org, linux-fsdevel@vger.kernel.org, 
	fsverity@lists.linux.dev, linux-xfs@vger.kernel.org
Subject: Re: [PATCH 36/40] xfs: don't store trailing zeroes of merkle tree
 blocks
Message-ID: <vo4rc3vopl4u77u2bmva3onln2ssmixuvq3gsdffltdr6a6nuj@mppvl5hbmvd3>
References: <171069245829.2684506.10682056181611490828.stgit@frogsfrogsfrogs>
 <171069246485.2684506.6805355726574585050.stgit@frogsfrogsfrogs>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <171069246485.2684506.6805355726574585050.stgit@frogsfrogsfrogs>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2024-03-17 09:32:47, Darrick J. Wong wrote:
> From: Darrick J. Wong <djwong@kernel.org>
> 
> As a minor space optimization, don't store trailing zeroes of merkle
> tree blocks to reduce space consumption and copying overhead.  This
> really only affects the rightmost blocks at each level of the tree.
> 
> Signed-off-by: Darrick J. Wong <djwong@kernel.org>

Looks good to me:
Reviewed-by: Andrey Albershteyn <aalbersh@redhat.com>

> ---
>  fs/xfs/xfs_verity.c |   11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> 
> diff --git a/fs/xfs/xfs_verity.c b/fs/xfs/xfs_verity.c
> index 32891ae42c47..abd95bc1ba6e 100644
> --- a/fs/xfs/xfs_verity.c
> +++ b/fs/xfs/xfs_verity.c
> @@ -622,11 +622,6 @@ xfs_verity_read_merkle(
>  	if (error)
>  		goto out_new_mk;
>  
> -	if (!args.valuelen) {
> -		error = -ENODATA;
> -		goto out_new_mk;
> -	}
> -
>  	mk = xfs_verity_cache_store(ip, key, new_mk);
>  	if (mk != new_mk) {
>  		/*
> @@ -681,6 +676,12 @@ xfs_verity_write_merkle(
>  		.value			= (void *)buf,
>  		.valuelen		= size,
>  	};
> +	const char			*p = buf + size - 1;
> +
> +	/* Don't store trailing zeroes. */
> +	while (p >= (const char *)buf && *p == 0)
> +		p--;
> +	args.valuelen = p - (const char *)buf + 1;
>  
>  	xfs_verity_merkle_key_to_disk(&name, pos);
>  	return xfs_attr_set(&args);
> 

-- 
- Andrey

