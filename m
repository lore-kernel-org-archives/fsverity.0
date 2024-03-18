Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E9F55C16
	for <fsverity@lists.linux.dev>; Mon, 18 Mar 2024 17:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710784236; cv=none; b=ZIXBdCovSVPpZI+hQfy6GIf5VPX/tUt9KCNm4lIy3/aJYv8qyUREXfq8y+aJ78ISlOMo4n36c+Qr8WlqkPg2WfKSZ1bkZ+yOYxn7gTtYnDhUerNhfKrfmAbiov2gpyCqs+3kOPRyz+OsYaGF962PmwKsVhcrUrR3+FsPpkYs+qA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710784236; c=relaxed/simple;
	bh=VSQ0tmSwRjDwW5fy7UUgJMNC6Ng/wGsRe7imRURDMb4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=C6z6LMfE1o1m9YwOHuNiz+gjolyh2FjWSpkc2cdLCYHAXJsaAhdKSW+X83L/D+wrKVRxdKpaz+7FfWiABMCRDzcXLyQbJOH5ukUKOY6WfbUFUd3IiarGV5ozncHyhDtzyeySZnpUy+KLXxIowqhvCuD01uM9akn73DcLorw/7Mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Wdyjg+BU; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Wdyjg+BU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710784234;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1Or4VimCWvfyGUvZM7p25HXg/XaR3dHWNB4n6Dz87mU=;
	b=Wdyjg+BUPx6y8L2kLWPCvCziJJCqGZ6EueO2ciodaV2+6f0t/F/2hvYsThpQDK7DfaF1cj
	krErkVkRr7EbrQXU/SM8uA1CSUoWr17KgAUtvgQJZoF4dWtuB8Q/d7uarCNu6OtyzlCzCa
	fhY/y0eiiEqcWacKC+t7vc1JvpCRFag=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-155-ANmYS7IwMUCgQYImqPTJYg-1; Mon, 18 Mar 2024 13:50:32 -0400
X-MC-Unique: ANmYS7IwMUCgQYImqPTJYg-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-33ece03ca5dso2722676f8f.1
        for <fsverity@lists.linux.dev>; Mon, 18 Mar 2024 10:50:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710784230; x=1711389030;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Or4VimCWvfyGUvZM7p25HXg/XaR3dHWNB4n6Dz87mU=;
        b=CN5ySoGAPTwrBcYq2IOPY9wje+Ik9kpCcl/IGnGwPHMrIzM+NKfXuRVZgZ5FgdOG3B
         64ebWNVLME2n+QhmRCtUc9QeyT7oThV/T3xqWQprSMmDKGPUX7fneMxtxWztKsW6knwF
         9jSAyjCrvruaAgt3sp+95SOjf3L/u8F89S0CHMMRQFxuZA8Cv/lQ0ayAELh8xPtcyTxJ
         f+XsIb+xn8qaagh4aPog/ypF5AWT3BEsU2ylR0Ft9vKLxcllJxvGxAMgb/9T+C8NPdld
         OXi9q+WR8KOcDJbofalhLhrtmef6Tti2NF1DrjidmNlzQ0I8RHqpA8MY9tDxVQFPj/Hc
         lCzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNzLEQC/Ej52j7DgggRwkfRX2FCe0rw2jmm58w16AI8F3N8RxnnEryakqSZYmy+sVfAoARBirjayZhyGHNQpw91H2Hs7QT+1U=
X-Gm-Message-State: AOJu0YyazzfvzjfRRnoVQ4yau+M8DXfArGeYOUr95zh20F6LTq+TTNUQ
	QmstnYMIwRJzVIMlTsX4FhllKQeZ6D65blSjqGm8pPIrrCXT0/OfcBltvcqT1njryDG+Bhtm4Ol
	LiFxC1W6ywWwpMxRmmL1zRetleb7Wri19UODJY1sdQc8GqerX2menRS0=
X-Received: by 2002:a5d:5f46:0:b0:33e:cc1e:399 with SMTP id cm6-20020a5d5f46000000b0033ecc1e0399mr111488wrb.43.1710784230291;
        Mon, 18 Mar 2024 10:50:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE0Q5QGGaxtRRAp41mQLI9R6LLdwMi0/OK+Zlpqg7BDZ5jGKy59R6hNbykKKkAiQg1LfeWu0A==
X-Received: by 2002:a5d:5f46:0:b0:33e:cc1e:399 with SMTP id cm6-20020a5d5f46000000b0033ecc1e0399mr111460wrb.43.1710784229665;
        Mon, 18 Mar 2024 10:50:29 -0700 (PDT)
Received: from thinky ([109.183.6.197])
        by smtp.gmail.com with ESMTPSA id a26-20020a5d457a000000b0033e7e9c8657sm10302050wrc.45.2024.03.18.10.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 10:50:29 -0700 (PDT)
Date: Mon, 18 Mar 2024 18:50:28 +0100
From: Andrey Albershteyn <aalbersh@redhat.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: ebiggers@kernel.org, linux-fsdevel@vger.kernel.org, 
	fsverity@lists.linux.dev, linux-xfs@vger.kernel.org
Subject: Re: [PATCH 30/40] xfs: clean up stale fsverity metadata before
 starting
Message-ID: <ps5yrmbecbh75w35jgsc4j7yup6wkspu7g2ulrkgn46z5na3x7@jnb7im6wky5z>
References: <171069245829.2684506.10682056181611490828.stgit@frogsfrogsfrogs>
 <171069246392.2684506.14484170564314714404.stgit@frogsfrogsfrogs>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <171069246392.2684506.14484170564314714404.stgit@frogsfrogsfrogs>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2024-03-17 09:31:13, Darrick J. Wong wrote:
> From: Darrick J. Wong <djwong@kernel.org>
> 
> Before we let fsverity begin writing merkle tree blocks to the file,
> let's perform a minor effort to clean up any stale metadata from a
> previous attempt to enable fsverity.  This can only happen if the system
> crashes /and/ the file shrinks, which is unlikely.  But we could do a
> better job of cleaning up anyway.
> 
> Signed-off-by: Darrick J. Wong <djwong@kernel.org>

Looks good to me:
Reviewed-by: Andrey Albershteyn <aalbersh@redhat.com>

> ---
>  fs/xfs/xfs_verity.c |   42 ++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 40 insertions(+), 2 deletions(-)
> 
> 
> diff --git a/fs/xfs/xfs_verity.c b/fs/xfs/xfs_verity.c
> index c19fa47d1f76..db43e017f10e 100644
> --- a/fs/xfs/xfs_verity.c
> +++ b/fs/xfs/xfs_verity.c
> @@ -413,6 +413,44 @@ xfs_verity_get_descriptor(
>  	return args.valuelen;
>  }
>  
> +/*
> + * Clear out old fsverity metadata before we start building a new one.  This
> + * could happen if, say, we crashed while building fsverity data.
> + */
> +static int
> +xfs_verity_drop_old_metadata(
> +	struct xfs_inode		*ip,
> +	u64				new_tree_size,
> +	unsigned int			tree_blocksize)
> +{
> +	struct xfs_verity_merkle_key	name;
> +	struct xfs_da_args		args = {
> +		.dp			= ip,
> +		.whichfork		= XFS_ATTR_FORK,
> +		.attr_filter		= XFS_ATTR_VERITY,
> +		.op_flags		= XFS_DA_OP_REMOVE,
> +		.name			= (const uint8_t *)&name,
> +		.namelen		= sizeof(struct xfs_verity_merkle_key),
> +		/* NULL value make xfs_attr_set remove the attr */
> +		.value			= NULL,
> +	};
> +	u64				offset;
> +	int				error = 0;
> +
> +	/*
> +	 * Delete as many merkle tree blocks in increasing blkno order until we
> +	 * don't find any more.  That ought to be good enough for avoiding
> +	 * dead bloat without excessive runtime.
> +	 */
> +	for (offset = new_tree_size; !error; offset += tree_blocksize) {
> +		xfs_verity_merkle_key_to_disk(&name, offset);
> +		error = xfs_attr_set(&args);
> +	}
> +	if (error == -ENOATTR)
> +		return 0;
> +	return error;
> +}
> +
>  static int
>  xfs_verity_begin_enable(
>  	struct file		*filp,
> @@ -421,7 +459,6 @@ xfs_verity_begin_enable(
>  {
>  	struct inode		*inode = file_inode(filp);
>  	struct xfs_inode	*ip = XFS_I(inode);
> -	int			error = 0;
>  
>  	xfs_assert_ilocked(ip, XFS_IOLOCK_EXCL);
>  
> @@ -431,7 +468,8 @@ xfs_verity_begin_enable(
>  	if (xfs_iflags_test_and_set(ip, XFS_VERITY_CONSTRUCTION))
>  		return -EBUSY;
>  
> -	return error;
> +	return xfs_verity_drop_old_metadata(ip, merkle_tree_size,
> +			tree_blocksize);
>  }
>  
>  static int
> 

-- 
- Andrey

