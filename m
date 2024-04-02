Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5127C1E526
	for <fsverity@lists.linux.dev>; Tue,  2 Apr 2024 13:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712065486; cv=none; b=Tyqj7rftjQ6h5sVIpDXuSXIhOCQcgDN//Lfw1cWUFWXaWXQsIUAdAJ3Nej/x18Y0CFrmnvrBKQDGo3K5SuZs6aznYjW5Cq+qZbjz0fyeqTFcoTZnGxqZtBB6VsaxRazzfBm7wJQvDR6PIE6J/aX9V0DErWh24j4YrkFEz2alwUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712065486; c=relaxed/simple;
	bh=SIArLVUDiFNY3hVGncu+PytHFdeKvFE0fJK76TNQAjo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=p6b/VPWXOH1uJloWPy1rM2FpA2lggCOVb/n6XDwWw3jftwUKZEYl6R3sXuXUIHIhblQvBVxwutmFMstJBxZ7/1SFEEV4/+zMz1OqYInocoZIsSvCkgoXfimY+MOz6mSTZVqX100yO/Z/hewY2/i9GfmoKMpbpl86ZCBOpQ6WOYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=V70YIryX; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="V70YIryX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712065484;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BZCJuoqC4xW+HEtvtzls9a4rpC5/GEvrSeKVyrktLa4=;
	b=V70YIryXrrnDNBqU9WcoIPxsiS+kgjxFFe1+B+yxm8i3mPkhJ4rZxSxZvTZ0aLb/2yU549
	T5p1CNtnh3W7vsSX9877gj1INxjmT70OKV0fazl49aMPE1ELPoxWTOfC0G9PUFVw3+Pd1K
	x+aXTFEA92FYG61a9VuIkUIKXMtwHto=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-651-U9eu9LO0PXOjBCZIuya9Kg-1; Tue, 02 Apr 2024 09:44:43 -0400
X-MC-Unique: U9eu9LO0PXOjBCZIuya9Kg-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-56c0d3517deso5127211a12.0
        for <fsverity@lists.linux.dev>; Tue, 02 Apr 2024 06:44:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712065481; x=1712670281;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BZCJuoqC4xW+HEtvtzls9a4rpC5/GEvrSeKVyrktLa4=;
        b=u9mLDs1iUydVL5qxIc40I4bUQ/fox3HifZW19HnpAEIV3HejPr3W/Pl6+Fb0KNS6EB
         pWAsxo4MD1zot2dbZT9HgGPjl58rQIP8I3Gap4t13Q0gcIh09Z9wJeNoyNGw3Qj38DNk
         eYboUvuVNYQ9JvEmHqLmf7cpm/9MaHaQmWJkpBzPG6CJzNhqEAOGPwoOicOBWgE9AXBi
         WlPKcw/X9ziY+DmTo0i5x2WRhm8oiJR4iji3GoMXJsuQY6KYQmKQnvn+TZccRDxZVMWT
         vSc1RP7OwqV7RiXTA64Y1nLcuDTY5LkR/y5um5Nt3oGP3m5HTmtg+fJWKDrlICQHV0Ui
         JqVg==
X-Forwarded-Encrypted: i=1; AJvYcCVY/mQwL76B1EqpB4xThTJW7R2JX3ZEFn58HpZtw90MmKV+UkIDlITe8JAQRoSGcxhrXgHvTOvqwYIJYMXckwuiBaPDsPOAs5g=
X-Gm-Message-State: AOJu0Yz/yGjMTUOo0RQTvCbSTvJ9dqNi8VIywyy6HsD75aDxFwDmevda
	sE0TakXAzXlPl7Q2agm6DoIuZi8D/LogZqlrgZmQAUeZRt8uf+oSqk88bLu7ZKvTxcdCXtYG6/A
	vGAfvhRlVujQEIXSqdONY1X7fiJjT+rtKaxdb3UteVQ9+YvEpM2ZTDi+Is2A59e0=
X-Received: by 2002:a50:d743:0:b0:568:9f77:9c0 with SMTP id i3-20020a50d743000000b005689f7709c0mr14627302edj.4.1712065481530;
        Tue, 02 Apr 2024 06:44:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7nguyZhip49uwET9ebOdtBS4qLmp/cHqlkRdW9k815nTIg/HnVbpEo6nETLV8jkZ0smQWzg==
X-Received: by 2002:a50:d743:0:b0:568:9f77:9c0 with SMTP id i3-20020a50d743000000b005689f7709c0mr14627276edj.4.1712065480941;
        Tue, 02 Apr 2024 06:44:40 -0700 (PDT)
Received: from thinky ([109.183.6.197])
        by smtp.gmail.com with ESMTPSA id da8-20020a056402176800b0056c18b79cd3sm6720654edb.22.2024.04.02.06.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 06:44:40 -0700 (PDT)
Date: Tue, 2 Apr 2024 15:44:39 +0200
From: Andrey Albershteyn <aalbersh@redhat.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: ebiggers@kernel.org, linux-xfs@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, fsverity@lists.linux.dev
Subject: Re: [PATCH 22/29] xfs: advertise fs-verity being available on
 filesystem
Message-ID: <mfjbt655lndrhd5pswiximwoehpo4lpxoquhd73ohdk5ur7tdh@qgdxyzoh5zw6>
References: <171175868489.1988170.9803938936906955260.stgit@frogsfrogsfrogs>
 <171175868924.1988170.14529689278344464510.stgit@frogsfrogsfrogs>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <171175868924.1988170.14529689278344464510.stgit@frogsfrogsfrogs>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2024-03-29 17:41:48, Darrick J. Wong wrote:
> From: Darrick J. Wong <djwong@kernel.org>
> 
> Advertise that this filesystem supports fsverity.
> 
> Signed-off-by: Darrick J. Wong <djwong@kernel.org>
> ---
>  fs/xfs/libxfs/xfs_fs.h |    1 +
>  fs/xfs/libxfs/xfs_sb.c |    2 ++
>  2 files changed, 3 insertions(+)
> 
> 
> diff --git a/fs/xfs/libxfs/xfs_fs.h b/fs/xfs/libxfs/xfs_fs.h
> index 6ede243fbecf7..af45a246eb1c1 100644
> --- a/fs/xfs/libxfs/xfs_fs.h
> +++ b/fs/xfs/libxfs/xfs_fs.h
> @@ -247,6 +247,7 @@ typedef struct xfs_fsop_resblks {
>  /* file range exchange available to userspace */
>  #define XFS_FSOP_GEOM_FLAGS_EXCHANGE_RANGE	(1 << 24)
>  
> +#define XFS_FSOP_GEOM_FLAGS_VERITY	(1U << 28) /* fs-verity */
>  #define XFS_FSOP_GEOM_FLAGS_METADIR	(1U << 29) /* metadata directories */
>  #define XFS_FSOP_GEOM_FLAGS_PARENT	(1U << 30) /* parent pointers */
>  
> diff --git a/fs/xfs/libxfs/xfs_sb.c b/fs/xfs/libxfs/xfs_sb.c
> index 39b5083745d0e..24e22a2dea51c 100644
> --- a/fs/xfs/libxfs/xfs_sb.c
> +++ b/fs/xfs/libxfs/xfs_sb.c
> @@ -1427,6 +1427,8 @@ xfs_fs_geometry(
>  		geo->flags |= XFS_FSOP_GEOM_FLAGS_EXCHANGE_RANGE;
>  	if (xfs_has_metadir(mp))
>  		geo->flags |= XFS_FSOP_GEOM_FLAGS_METADIR;
> +	if (xfs_has_verity(mp))
> +		geo->flags |= XFS_FSOP_GEOM_FLAGS_VERITY;
>  	geo->rtsectsize = sbp->sb_blocksize;
>  	geo->dirblocksize = xfs_dir2_dirblock_bytes(sbp);
>  
> 

Looks good to me:
Reviewed-by: Andrey Albershteyn <aalbersh@redhat.com>

-- 
- Andrey

