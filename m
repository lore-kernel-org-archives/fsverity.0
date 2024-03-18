Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB7C55C04
	for <fsverity@lists.linux.dev>; Mon, 18 Mar 2024 17:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710784324; cv=none; b=IpxSj/TD07m6+0hZ9GQybFxzO1OgzR+EyF3oFYjfVcMicJWIWBa07ip6snOmdzGRgWcWCXoyC7J1uJy6yw32pzopMkhXbMShH8O645Hijku2tKYPqLnv6X44ylY5d/dpbzswOze/uF8K9hFwaiPfOoSOfjDCmdUjwNIOiqcdaWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710784324; c=relaxed/simple;
	bh=fqTElAEqBOCrS+SEJ/QGcyaZBur12synCMYU0rQu1bk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=tZe4Jx8aS3i9fseG7u38+lrMU2f/gsYmcKJEWcgbCR3KfUik7NlHO8q4dSD8zS7s/0NrLTLqOgSTKs5XCnF/zsKsLLzWk9jb5UEz+tDK/BkRrQuu9ZUqe0xwLStI7WrzEvRbVEYSVbG1vyRXoKwct6Wy7npaQof8lrawPs+rej4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bVC+PNlc; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bVC+PNlc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710784321;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ICN/PTNvFGb1DjAB0N+/RyGurYAnxvURBuljr7cKqW8=;
	b=bVC+PNlc0b/1myAeoQJZyIiZiwmlv5UUdUx/wDUD/DAd0aoeSgvRvot4h001rbMYQlRSXh
	9XwlSPupzs9HNKdPi/iCbYF9MeOUfRdPf+8dvSnLF6p50s+vEUtJmKFMTt0y4MFagHFLPj
	F8COjo0tnUWKZOv9BAz2EM5CckqyWY8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-292-NzK-39thMK2X0AB2xhWa0w-1; Mon, 18 Mar 2024 13:51:58 -0400
X-MC-Unique: NzK-39thMK2X0AB2xhWa0w-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-34172041676so716907f8f.1
        for <fsverity@lists.linux.dev>; Mon, 18 Mar 2024 10:51:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710784317; x=1711389117;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ICN/PTNvFGb1DjAB0N+/RyGurYAnxvURBuljr7cKqW8=;
        b=P840v4zmbNre7y5YMnOFQuRGzz3AUZuV62wjuqZoF6dEqGHXY2XUqB6minMCKreHzM
         mmHU0J6m03ORCXcUZF7zZrxxI7Da4F+QY6FGwLBtZ442JAIdEIZ4jeCzGoLenSsomLoe
         QHtFkr2+s9549nsxmOD4CrHtKCOVDkegvBI2JI9M4b/hlxz2n2CvzNvikHY+/5psYK3r
         CxV7nfjIE5Zo0+g/fwTEgLT+04oxVn9JRWT/0ixOVyG2qOc9kFSm4tHmbt1XyIe1Ecq4
         lsqSroqFKFp3GaX69i30nWyd/Uf0O8NH+2DLCNbhpdK5P0FBqXzYrW+eYpQZaYkAcquv
         pbyw==
X-Forwarded-Encrypted: i=1; AJvYcCW25IuajKK+WPHk5z5GcOhpMcH9J9pvUnEEtXrQnMU0uOh3hH7PmHYiejmUia+u1Gss9nBdSZv2JkeDHL0RJvc9nBg8DY/pxBU=
X-Gm-Message-State: AOJu0YwirAFxsg5t7XmheaUsUGzAPPqT5IuaYraTxjWF2GMUozX1M/O0
	Q/aJpKUQ8CU5DCxth2E6JCo2E5fZvLVab23prHqAKimGorZVfy0a13d6Wbk/zziRqJ7KxKTfCmD
	SIrQZoIyNSg9IibCYd/uHLh5RZK/WW7v8ZzCYyY56EVexNiFh1jQ1Ews=
X-Received: by 2002:a5d:6a48:0:b0:33d:eb13:9e27 with SMTP id t8-20020a5d6a48000000b0033deb139e27mr290444wrw.23.1710784316753;
        Mon, 18 Mar 2024 10:51:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEYSUHL198Rb526cW9SI0mG6UqLPgcAal2tyuFEAHmiIsVF9MBLJF60tkez08WEu6iLpM8qRQ==
X-Received: by 2002:a5d:6a48:0:b0:33d:eb13:9e27 with SMTP id t8-20020a5d6a48000000b0033deb139e27mr290426wrw.23.1710784316183;
        Mon, 18 Mar 2024 10:51:56 -0700 (PDT)
Received: from thinky ([109.183.6.197])
        by smtp.gmail.com with ESMTPSA id bu27-20020a056000079b00b0033ecbfc6941sm10048239wrb.110.2024.03.18.10.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 10:51:55 -0700 (PDT)
Date: Mon, 18 Mar 2024 18:51:55 +0100
From: Andrey Albershteyn <aalbersh@redhat.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: ebiggers@kernel.org, linux-fsdevel@vger.kernel.org, 
	fsverity@lists.linux.dev, linux-xfs@vger.kernel.org
Subject: Re: [PATCH 31/40] xfs: better reporting and error handling in
 xfs_drop_merkle_tree
Message-ID: <kszur5shvmrodxfc3hefebu2cennigrbfowucsxydpvizssatx@mpe6lvoaqain>
References: <171069245829.2684506.10682056181611490828.stgit@frogsfrogsfrogs>
 <171069246408.2684506.9245902616854244173.stgit@frogsfrogsfrogs>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <171069246408.2684506.9245902616854244173.stgit@frogsfrogsfrogs>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2024-03-17 09:31:28, Darrick J. Wong wrote:
> From: Darrick J. Wong <djwong@kernel.org>
> 
> xfs_drop_merkle_tree is responsible for removing the fsverity metadata
> after a failed attempt to enable fsverity for a file.  However, if the
> enablement process fails before the verity descriptor is written to the
> file, the cleanup function will trip the WARN_ON.  The error code in
> that case is ENOATTR, which isn't worth logging about.
> 
> Fix that return code handling, fix the tree block removal loop not to
> return early with ENOATTR, and improve the logging so that we actually
> capture what kind of error occurred.
> 
> Signed-off-by: Darrick J. Wong <djwong@kernel.org>

Looks good to me:
Reviewed-by: Andrey Albershteyn <aalbersh@redhat.com>

> ---
>  fs/xfs/xfs_verity.c |   25 ++++++++++++++++++-------
>  1 file changed, 18 insertions(+), 7 deletions(-)
> 
> 
> diff --git a/fs/xfs/xfs_verity.c b/fs/xfs/xfs_verity.c
> index db43e017f10e..32891ae42c47 100644
> --- a/fs/xfs/xfs_verity.c
> +++ b/fs/xfs/xfs_verity.c
> @@ -472,15 +472,14 @@ xfs_verity_begin_enable(
>  			tree_blocksize);
>  }
>  
> +/* Try to remove all the fsverity metadata after a failed enablement. */
>  static int
> -xfs_drop_merkle_tree(
> +xfs_verity_drop_incomplete_tree(
>  	struct xfs_inode		*ip,
>  	u64				merkle_tree_size,
>  	unsigned int			tree_blocksize)
>  {
>  	struct xfs_verity_merkle_key	name;
> -	int				error = 0;
> -	u64				offset = 0;
>  	struct xfs_da_args		args = {
>  		.dp			= ip,
>  		.whichfork		= XFS_ATTR_FORK,
> @@ -491,6 +490,8 @@ xfs_drop_merkle_tree(
>  		/* NULL value make xfs_attr_set remove the attr */
>  		.value			= NULL,
>  	};
> +	u64				offset;
> +	int				error;
>  
>  	if (!merkle_tree_size)
>  		return 0;
> @@ -498,6 +499,8 @@ xfs_drop_merkle_tree(
>  	for (offset = 0; offset < merkle_tree_size; offset += tree_blocksize) {
>  		xfs_verity_merkle_key_to_disk(&name, offset);
>  		error = xfs_attr_set(&args);
> +		if (error == -ENOATTR)
> +			error = 0;
>  		if (error)
>  			return error;
>  	}
> @@ -505,7 +508,8 @@ xfs_drop_merkle_tree(
>  	args.name = (const uint8_t *)XFS_VERITY_DESCRIPTOR_NAME;
>  	args.namelen = XFS_VERITY_DESCRIPTOR_NAME_LEN;
>  	error = xfs_attr_set(&args);
> -
> +	if (error == -ENOATTR)
> +		return 0;
>  	return error;
>  }
>  
> @@ -564,9 +568,16 @@ xfs_verity_end_enable(
>  		inode->i_flags |= S_VERITY;
>  
>  out:
> -	if (error)
> -		WARN_ON_ONCE(xfs_drop_merkle_tree(ip, merkle_tree_size,
> -						  tree_blocksize));
> +	if (error) {
> +		int	error2;
> +
> +		error2 = xfs_verity_drop_incomplete_tree(ip, merkle_tree_size,
> +				tree_blocksize);
> +		if (error2)
> +			xfs_alert(ip->i_mount,
> + "ino 0x%llx failed to clean up new fsverity metadata, err %d",
> +					ip->i_ino, error2);
> +	}
>  
>  	xfs_iflags_clear(ip, XFS_VERITY_CONSTRUCTION);
>  	return error;
> 

-- 
- Andrey

