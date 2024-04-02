Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA232A8E5
	for <fsverity@lists.linux.dev>; Tue,  2 Apr 2024 12:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712062331; cv=none; b=VB/Z8FdMu3O3o/xpW6v2wjoiC52tcRzDxaW9uhwyGCYl8sDY0fiVLT6F3U5dWgyXsYqr+flcbuXprYNH2L6ENlsJCeN4nIfyEebwD3bsXdsUe0KfLpx3NMg5Hwn+w56BzYF28d9E2gFzFWEOYqd99T+47NESooqaQgE/OmSYTg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712062331; c=relaxed/simple;
	bh=fPTm8EwrxCKUCKlXtMQ46fsMh23VPD/sF98j59+9tqE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=fOOYF2MczcBGv7fyn5A9bhgYicRzWACKdFetjAr/KVzza7xJHmIHvDQleM8PheOFDseYW71Fgkr/KI+jkTV7urS2DNwInw9Qg/KHGETnX4SkrObWQApAlhLHfuM/hVR1KiTV94UJEaHoR8ZUcdwk5JjSRQcaDacPSZEX+9YvrEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FTLg/Qpb; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FTLg/Qpb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712062327;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=udjv9FB82NBjappNOEsAL426nV2L32B7yhwcIFshiA0=;
	b=FTLg/QpbkEVjYVzNCxfYmLbcjrtBs5/fM9mcM09KKFK9ky0Ek4/bru0tGM2XkUzA3v/4ro
	6RQMNavR9RgHCW1EHll8Tju8sw6DyolIUNx6AySAtvr6abm1Vyex7y7oLg8JCmQCI5FASw
	APHPtOM0KirwA9kYQdh2dm3N1UXPfNw=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-574--K0hax6gPzyhOBK7sfxuvQ-1; Tue, 02 Apr 2024 08:52:06 -0400
X-MC-Unique: -K0hax6gPzyhOBK7sfxuvQ-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a45acc7f07cso295083366b.2
        for <fsverity@lists.linux.dev>; Tue, 02 Apr 2024 05:52:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712062325; x=1712667125;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=udjv9FB82NBjappNOEsAL426nV2L32B7yhwcIFshiA0=;
        b=bueypPsv8nvFFsetSlGitj+81C9YEOIF0scQPf3pRNFThLTpU/QfyuQxTQJwrgWEAu
         esAxy31sisLGVrD4IAQ+PClEMjSDgEp1S4A/0akze31sZaX7BaVYxbxQDeiwtrvQe5aw
         36oxb/KX0RvH3LrMTJs61YdQ25jdv35N9IBx5X9+RFVm6xgW0MyXDllHCgIcowtEfTEy
         bSzYQPH8+U+rKJHiOaWKFlUGzDwN6/FP5P0yFPz9tocJob5apWkeYFRBGchmllAXmtMG
         SaLf5ukzsGD0Cjcrp/ppIYFPRbEUMCaEUGeq9cxfBzqkPkoErmvtsM+1au1nOYt3vxCA
         Ak+A==
X-Forwarded-Encrypted: i=1; AJvYcCV923uaXKUO1QhLijXZ6TAeEkyRqKBnL5zuKZpHjd2Sx/YWTF9vIHB/VrjezF3E+JtLDVmWcnmrTGezvcYfeY5vA6HfKTRn7yA=
X-Gm-Message-State: AOJu0Yxh0qeDSJ+Y7ZxxsJSyyjEeLf3qBZ87BhA7VZBC90hGjGH3EFT7
	WXQIYz+o7Yl/sOjK96fJioP5UWeb9OnAw8WrxcnyOnYw00vjfn8grTmtK2nY31oSotfjLfequXO
	KUcbWJBJvRUw1u4QQxONJlN02NbRzwZ+Idb5BDeEP/IXphR7wkAl0PqUV7Dp31pI=
X-Received: by 2002:a17:907:26ce:b0:a4e:67ca:1040 with SMTP id bp14-20020a17090726ce00b00a4e67ca1040mr5256398ejc.14.1712062324651;
        Tue, 02 Apr 2024 05:52:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF5KO71h1979wkCqoKkC7ot0dVk+kkaLg4kpoiFC8fXUDFCkH0e2YdCuNNW7DymBtRtxiSpAQ==
X-Received: by 2002:a17:907:26ce:b0:a4e:67ca:1040 with SMTP id bp14-20020a17090726ce00b00a4e67ca1040mr5256381ejc.14.1712062324120;
        Tue, 02 Apr 2024 05:52:04 -0700 (PDT)
Received: from thinky ([109.183.6.197])
        by smtp.gmail.com with ESMTPSA id wr1-20020a170907700100b00a473a0f3384sm6544357ejb.16.2024.04.02.05.52.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 05:52:03 -0700 (PDT)
Date: Tue, 2 Apr 2024 14:52:03 +0200
From: Andrey Albershteyn <aalbersh@redhat.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: ebiggers@kernel.org, linux-xfs@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, fsverity@lists.linux.dev
Subject: Re: [PATCH 17/29] xfs: only allow the verity iflag for regular files
Message-ID: <rdonyolmknblerpfl37uvt5i5ica3sjoy2kpmdlcue6qb7pauv@myouxj6bfxjb>
References: <171175868489.1988170.9803938936906955260.stgit@frogsfrogsfrogs>
 <171175868843.1988170.2809557712645656626.stgit@frogsfrogsfrogs>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <171175868843.1988170.2809557712645656626.stgit@frogsfrogsfrogs>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2024-03-29 17:40:30, Darrick J. Wong wrote:
> From: Darrick J. Wong <djwong@kernel.org>
> 
> Only regular files can have fsverity enabled on them, so check this in
> the inode verifier.
> 
> Signed-off-by: Darrick J. Wong <djwong@kernel.org>
> ---
>  fs/xfs/libxfs/xfs_inode_buf.c |    8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> 
> diff --git a/fs/xfs/libxfs/xfs_inode_buf.c b/fs/xfs/libxfs/xfs_inode_buf.c
> index adc457da52ef0..dae0f27d3961b 100644
> --- a/fs/xfs/libxfs/xfs_inode_buf.c
> +++ b/fs/xfs/libxfs/xfs_inode_buf.c
> @@ -695,6 +695,14 @@ xfs_dinode_verify(
>  	    !xfs_has_rtreflink(mp))
>  		return __this_address;
>  
> +	/* only regular files can have fsverity */
> +	if (flags2 & XFS_DIFLAG2_VERITY) {
> +		if (!xfs_has_verity(mp))
> +			return __this_address;
> +		if ((mode & S_IFMT) != S_IFREG)
> +			return __this_address;
> +	}
> +
>  	/* COW extent size hint validation */
>  	fa = xfs_inode_validate_cowextsize(mp, be32_to_cpu(dip->di_cowextsize),
>  			mode, flags, flags2);
> 

Looks good to me:
Reviewed-by: Andrey Albershteyn <aalbersh@redhat.com>

-- 
- Andrey

