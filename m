Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C163E55E40
	for <fsverity@lists.linux.dev>; Mon, 18 Mar 2024 17:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710784550; cv=none; b=Xoqy/EKlvkqv1re4D9I7DFMupUMInqjV7oTnWA1niexZtov0uDlKhtdOMlHj/V8HwKyY7ZOm7pZqNIL95Fv8E6v5VXMRl7XuGApG8XEodpvuh/UJmo9fftVNX96QvaGs27eWfVE/E0TEcgIs3Y/LxEGcw78R94R81/e5ohsZpfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710784550; c=relaxed/simple;
	bh=pulUaf4YhSsFFM1biSTcYfSrkKMd+Ti4pDXyJ7rmZls=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=U9kEmqtKCTOIvLYB0Xy35OpFfjJGI9lkzatqadcmU7EeFyk6Si4BgWPBeusJkMU8Jst7/Bdz7Q5aqyEfZxR79cMVsFuL1uQ32/dAsxVuCx7iE7FEC6ql+y3RpdWm1/TVnd+5TThZL5nHxlryKmSPJGntobQvhejj9AVfyUKL0I4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Q7gGOmF4; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Q7gGOmF4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710784547;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BIeZF3pcV9ybXmMCNiFAFeode04oEpCoNs6YN4HJg24=;
	b=Q7gGOmF4swbNDLYLq12mRj+1MRz9fcSoB9CrP+98qC9UASqyhHwFRG95gWGQUid88ubJ8P
	5sD7okZRhSO8IuDwkwb5Xrvu3gEZUdZV3T4Nw/mxyPmN7q8GfJTOZLDhy9Zp4vc1TGQJ91
	lvE2iV4ZcaSvRtERZPGOVaXZ0CZvB68=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-414-pcCj8m6UMge75e5jjlqkXw-1; Mon, 18 Mar 2024 13:55:46 -0400
X-MC-Unique: pcCj8m6UMge75e5jjlqkXw-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-33ec6c43a9cso3535924f8f.1
        for <fsverity@lists.linux.dev>; Mon, 18 Mar 2024 10:55:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710784541; x=1711389341;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BIeZF3pcV9ybXmMCNiFAFeode04oEpCoNs6YN4HJg24=;
        b=acQtm/9+o24S5CdCh1XQARtLEMLrABJNbRXGghSCGMo6C2KkCgfuh4JEUfihJTchfw
         J82tOGI33xkNRuZGjUPUv/MqruSUK8grUKegktjPdYAVDT89EHqWbxq2Pw8tUatuyuWg
         A+r9ld0pjpwMnmYdNz9wIqqc3cjzhmMlcxofTjkHs/0LvKdsuPKGCYpDjWBedypUwE4h
         pgsEM5rcRD5Ltxa3/FVbrMKUb/TFUzkWaQZXcvBKbZRj0LtnX1Gx+Zdpf0YYDyFh14/S
         fVTTZpeK9Q1ws/310hBI9B0V/Y7vObjH+P9vjBI2c93Z9WnYj7A06Zoio04eZJuvkCIh
         HBXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXcWABrvEo8nPf718NAOziiErMF+8dgoRQv00v7goJ5wv5qUIFA5OCwGyfqYRrsjY2/dJgLp3IadSkVgQWfbOrjsgFbZhsc89M=
X-Gm-Message-State: AOJu0YxnQOMna33C6eMwD+ISrwItGB029BpwQLD93F2/tKoxzSApFAwj
	Bf1r1Zb/iC0n7Nxmyt9l5dYcqnoG6tWuyuTWP1Sbivy2/uCJYDrRZl69fT1ejvTWGxuG3xobub7
	rHEsduG7GvQ45chzOVZtoDSvBAR4CZ2chWl2ydLJArWRBy+mg+yWMJdhZ9jDcxu8=
X-Received: by 2002:a05:6000:912:b0:33e:7564:ceb with SMTP id cw18-20020a056000091200b0033e75640cebmr6538758wrb.52.1710784540469;
        Mon, 18 Mar 2024 10:55:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGIYaglzyvoDgvioWLXHUUli7NeWqj9AChqPSkZfhtsI7iCTP9DwDDB2UpPqVyaLx8GqGL/pQ==
X-Received: by 2002:a05:6000:912:b0:33e:7564:ceb with SMTP id cw18-20020a056000091200b0033e75640cebmr6538740wrb.52.1710784539982;
        Mon, 18 Mar 2024 10:55:39 -0700 (PDT)
Received: from thinky ([109.183.6.197])
        by smtp.gmail.com with ESMTPSA id i18-20020adffc12000000b0033e786abf84sm10329696wrr.54.2024.03.18.10.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 10:55:39 -0700 (PDT)
Date: Mon, 18 Mar 2024 18:55:39 +0100
From: Andrey Albershteyn <aalbersh@redhat.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: ebiggers@kernel.org, linux-fsdevel@vger.kernel.org, 
	fsverity@lists.linux.dev, linux-xfs@vger.kernel.org
Subject: Re: [PATCH 38/40] xfs: use merkle tree offset as attr hash
Message-ID: <tbqzcbhc267i6be5suodaqdxbdtdettd7jb442dvgiugbeoxsm@rkzvxzj7ca63>
References: <171069245829.2684506.10682056181611490828.stgit@frogsfrogsfrogs>
 <171069246517.2684506.8560170754721057486.stgit@frogsfrogsfrogs>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <171069246517.2684506.8560170754721057486.stgit@frogsfrogsfrogs>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2024-03-17 09:33:18, Darrick J. Wong wrote:
> From: Darrick J. Wong <djwong@kernel.org>
> 
> I was exploring the fsverity metadata with xfs_db after creating a 220MB
> verity file, and I noticed the following in the debugger output:
> 
> entries[0-75] = [hashval,nameidx,incomplete,root,secure,local,parent,verity]
> 0:[0,4076,0,0,0,0,0,1]
> 1:[0,1472,0,0,0,1,0,1]
> 2:[0x800,4056,0,0,0,0,0,1]
> 3:[0x800,4036,0,0,0,0,0,1]
> ...
> 72:[0x12000,2716,0,0,0,0,0,1]
> 73:[0x12000,2696,0,0,0,0,0,1]
> 74:[0x12800,2676,0,0,0,0,0,1]
> 75:[0x12800,2656,0,0,0,0,0,1]
> ...
> nvlist[0].merkle_off = 0x18000
> nvlist[1].merkle_off = 0
> nvlist[2].merkle_off = 0x19000
> nvlist[3].merkle_off = 0x1000
> ...
> nvlist[71].merkle_off = 0x5b000
> nvlist[72].merkle_off = 0x44000
> nvlist[73].merkle_off = 0x5c000
> nvlist[74].merkle_off = 0x45000
> nvlist[75].merkle_off = 0x5d000
> 
> Within just this attr leaf block, there are 76 attr entries, but only 38
> distinct hash values.  There are 415 merkle tree blocks for this file,
> but we already have hash collisions.  This isn't good performance from
> the standard da hash function because we're mostly shifting and rolling
> zeroes around.
> 
> However, we don't even have to do that much work -- the merkle tree
> block keys are themslves u64 values.  Truncate that value to 32 bits
> (the size of xfs_dahash_t) and use that for the hash.  We won't have any
> collisions between merkle tree blocks until that tree grows to 2^32nd
> blocks.  On a 4k block filesystem, we won't hit that unless the file
> contains more than 2^49 bytes, assuming sha256.
> 
> As a side effect, the keys for merkle tree blocks get written out in
> roughly sequential order, though I didn't observe any change in
> performance.
> 
> Signed-off-by: Darrick J. Wong <djwong@kernel.org>

Looks good to me:
Reviewed-by: Andrey Albershteyn <aalbersh@redhat.com>

> ---
>  fs/xfs/libxfs/xfs_attr.c      |    7 +++++++
>  fs/xfs/libxfs/xfs_da_format.h |    2 ++
>  2 files changed, 9 insertions(+)
> 
> 
> diff --git a/fs/xfs/libxfs/xfs_attr.c b/fs/xfs/libxfs/xfs_attr.c
> index b1fa45197eac..7c0f006f972a 100644
> --- a/fs/xfs/libxfs/xfs_attr.c
> +++ b/fs/xfs/libxfs/xfs_attr.c
> @@ -245,6 +245,13 @@ xfs_attr_hashname(
>  	const uint8_t		*name,
>  	unsigned int		namelen)
>  {
> +	if ((attr_flags & XFS_ATTR_VERITY) &&
> +	    namelen == sizeof(struct xfs_verity_merkle_key)) {
> +		uint64_t	off = xfs_verity_merkle_key_from_disk(name);
> +
> +		return off >> XFS_VERITY_MIN_MERKLE_BLOCKLOG;
> +	}
> +
>  	return xfs_da_hashname(name, namelen);
>  }
>  
> diff --git a/fs/xfs/libxfs/xfs_da_format.h b/fs/xfs/libxfs/xfs_da_format.h
> index e4aa7c9a0ccb..58887a1c65fe 100644
> --- a/fs/xfs/libxfs/xfs_da_format.h
> +++ b/fs/xfs/libxfs/xfs_da_format.h
> @@ -946,4 +946,6 @@ xfs_verity_merkle_key_from_disk(
>  #define XFS_VERITY_DESCRIPTOR_NAME	"vdesc"
>  #define XFS_VERITY_DESCRIPTOR_NAME_LEN	(sizeof(XFS_VERITY_DESCRIPTOR_NAME) - 1)
>  
> +#define XFS_VERITY_MIN_MERKLE_BLOCKLOG	(10)
> +
>  #endif /* __XFS_DA_FORMAT_H__ */
> 

-- 
- Andrey

