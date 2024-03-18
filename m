Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC43456776
	for <fsverity@lists.linux.dev>; Mon, 18 Mar 2024 19:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710791334; cv=none; b=WTszEVCYHNS+VZLnw45IOvgrbSNMi4l3RoRhWiK2/SdqXCpBlXwg5n0Mz/MzaUcCruQgF3ER5MSu9rW9TWRhseLapjxw6fzj1WOx+C18FFGoKsjftguramxjT36YnDHF0+cOCJeE5RtFwCyB8g/hKCgVWX6dyGTgrcndSr7/xSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710791334; c=relaxed/simple;
	bh=HcyNRAaSvVR/TK1oY1imlZkpQ7tr6zcuYNe1c6B+IZg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=nA4yqyl+GHhsBBaN0jiPpa/A/JUPs+P23B9FIUIwNMc6ch+P3oqQw2BWzb/7d03Nblay/IuYCDnoWQA6HkJ6Ai0o0rxSyArZUb26x5av/B32poL8BOo7ubGF/TqRfp/xqtQFmOU4PwFC4OYPfTF8gYPQNt9QMzHEZGFJzc0Dv7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BQiEOzaa; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BQiEOzaa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710791331;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oOqdgcxTH2OLnV0pHfnH8Nt0Lqbw8koRvQxc7E7h07s=;
	b=BQiEOzaaSS6aJmaMmQReVVuqS9XKKVMp+keG7ThAVkL39X3kzvW97BljFsb7qLkDDP/wKg
	pbB1/BdH/nrkVjrVpCzEPXPaAcPoZTCRWGsMP+L11187RcY2geRK1S7Zax2oSUwxvYGX+z
	Q7GhmQfmdEke5XL09ZB17DTEv14004A=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-526-c-O6SkDhN2e2XTXon28quA-1; Mon, 18 Mar 2024 15:48:50 -0400
X-MC-Unique: c-O6SkDhN2e2XTXon28quA-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-33ec06aac83so3117527f8f.2
        for <fsverity@lists.linux.dev>; Mon, 18 Mar 2024 12:48:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710791329; x=1711396129;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oOqdgcxTH2OLnV0pHfnH8Nt0Lqbw8koRvQxc7E7h07s=;
        b=erYRPgJW4fNrx/tg63J62YQtvQRLrZ+ODlPvKvfG0vJ5Kvvv+OlETNm6spkHk56lOz
         xSz1G6v5p8BpSBKGuElTDc+qKRy4BVQswsmNaGwWwihWDIBOO2GUFEBLrQh3uLai5z/G
         Oi2aXiuYW0IdZYb52wfh6AvuseAk4Uv8MqA6fi+5T7xx/v0Wjc0QY1udgeTTg2tB0yxG
         5exTv0xXmvnZjOUjVe39iAzIa06T0Itp47AgXceSUCX1FTxZfxPxSqow0WdT4rA6ewaZ
         KldiWdFvdfkJjEwnzq8TKt0q4iueCkZk0lJrG1LQKQtD2mBi7A9tWzzRVnTQXr+jo4Gj
         0ePQ==
X-Forwarded-Encrypted: i=1; AJvYcCUmORklvN0V310sKG2vhxyrmejlXc/zpQHhKYA+zb5vjT/K7hkI8uzN2Mpr5mPUu/2yoVx5BWDjsHIMzYxEhSM903Bo2OZ3ptA=
X-Gm-Message-State: AOJu0Yz2IGFhZwRPV3E1xN0UlFVvUN9eYAZT7u2dql0SxbB1+izk5clm
	Ki38MdB+YAIQBLvRZ9FSfD+KY33K1ZvoUw3MsCETfNVJG5YGIpTIHy5rIv/ZHLBfe/0kLojQiAI
	qoV4vzKTnMyaudt+xTOW8jza9eKDhc3urcu6blULe+iERaEAGyx0nzf0=
X-Received: by 2002:a05:6000:2c1:b0:33e:75fb:b913 with SMTP id o1-20020a05600002c100b0033e75fbb913mr362550wry.14.1710791329025;
        Mon, 18 Mar 2024 12:48:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEmhHFEmeCMf0/MvrmnUNbFENwn/JsYxFZoXvcdt6TUYYdr+isHkaJA/RtYfMH4u+9ztYUvhg==
X-Received: by 2002:a05:6000:2c1:b0:33e:75fb:b913 with SMTP id o1-20020a05600002c100b0033e75fbb913mr362530wry.14.1710791328487;
        Mon, 18 Mar 2024 12:48:48 -0700 (PDT)
Received: from thinky ([109.183.6.197])
        by smtp.gmail.com with ESMTPSA id f22-20020a5d58f6000000b0033e7a204dc7sm10493478wrd.32.2024.03.18.12.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 12:48:48 -0700 (PDT)
Date: Mon, 18 Mar 2024 20:48:47 +0100
From: Andrey Albershteyn <aalbersh@redhat.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: ebiggers@kernel.org, linux-fsdevel@vger.kernel.org, 
	fsverity@lists.linux.dev, linux-xfs@vger.kernel.org
Subject: Re: [PATCH 24/40] xfs: disable direct read path for fs-verity files
Message-ID: <eb7rlbfslyht2vmn7ocqcx5fkjyrle4ocgex6hmjxzs4gtkkgm@mvmsrj7sgojd>
References: <171069245829.2684506.10682056181611490828.stgit@frogsfrogsfrogs>
 <171069246296.2684506.17423583037447505680.stgit@frogsfrogsfrogs>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <171069246296.2684506.17423583037447505680.stgit@frogsfrogsfrogs>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2024-03-17 09:29:39, Darrick J. Wong wrote:
> From: Andrey Albershteyn <aalbersh@redhat.com>
> 
> The direct path is not supported on verity files. Attempts to use direct
> I/O path on such files should fall back to buffered I/O path.
> 
> Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
> Reviewed-by: Darrick J. Wong <djwong@kernel.org>
> [djwong: fix braces]
> Signed-off-by: Darrick J. Wong <djwong@kernel.org>
> ---
>  fs/xfs/xfs_file.c |   15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
> 
> 
> diff --git a/fs/xfs/xfs_file.c b/fs/xfs/xfs_file.c
> index 74dba917be93..0ce51a020115 100644
> --- a/fs/xfs/xfs_file.c
> +++ b/fs/xfs/xfs_file.c
> @@ -281,7 +281,8 @@ xfs_file_dax_read(
>  	struct kiocb		*iocb,
>  	struct iov_iter		*to)
>  {
> -	struct xfs_inode	*ip = XFS_I(iocb->ki_filp->f_mapping->host);
> +	struct inode		*inode = iocb->ki_filp->f_mapping->host;
> +	struct xfs_inode	*ip = XFS_I(inode);
>  	ssize_t			ret = 0;
>  
>  	trace_xfs_file_dax_read(iocb, to);
> @@ -334,10 +335,18 @@ xfs_file_read_iter(
>  
>  	if (IS_DAX(inode))
>  		ret = xfs_file_dax_read(iocb, to);
> -	else if (iocb->ki_flags & IOCB_DIRECT)
> +	else if (iocb->ki_flags & IOCB_DIRECT && !fsverity_active(inode))

Brackets missing

>  		ret = xfs_file_dio_read(iocb, to);
> -	else
> +	else {
> +		/*
> +		 * In case fs-verity is enabled, we also fallback to the
> +		 * buffered read from the direct read path. Therefore,
> +		 * IOCB_DIRECT is set and need to be cleared (see
> +		 * generic_file_read_iter())
> +		 */
> +		iocb->ki_flags &= ~IOCB_DIRECT;
>  		ret = xfs_file_buffered_read(iocb, to);
> +	}
>  
>  	if (ret > 0)
>  		XFS_STATS_ADD(mp, xs_read_bytes, ret);
> 
> 

-- 
- Andrey

