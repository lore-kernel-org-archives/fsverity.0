Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0331E13F43D
	for <fsverity@lists.linux.dev>; Tue, 30 Apr 2024 12:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714480751; cv=none; b=rg/rzukbSzJdTB3o+nzdp/LlaCSiqgul/o0AJw9vmKmBKV2oItQsH1jFbm4QzC0yiK93cVfS9ezk5byomp0pzY590kNXiLbG9naiYjUykcNueUdykUNdGkAiw+lTYsJnE15+VwE1GfmyiAI4PQoEA5Q9cYO9Y+QPROvCgGOtHOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714480751; c=relaxed/simple;
	bh=2B5D0D1GgUPmS0uCeYNjZO5NRwRu0X9XoEhIRqRwJsQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=urJosdBJZeVIftV29AprnluzfGq1GIMQPY7vUVE9HZ/mwWUzUEahux4aV3EFNImH0VYj0uLw03e9ScmEeM9mTQBySs+1Uy4kfm2OtDPcc8BCcaMMpu0qMh2QhrfK2zQ3BQx0lY+ccgffR/UB6CGNpKRCiEJR+oPKLIVesRwZGOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=enWqOxC4; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="enWqOxC4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714480749;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=W8nGH1asXpyg2kuAwkDFcJcU70PWri0NFYqSFUgAKXg=;
	b=enWqOxC4hJ2z3NCoYs5iGAKuxCcdU8B09PevdcMNoT+v1WejC41dXt+QTOYpIIx/ZmADB3
	plSxX4c5BR0oSKZMfpnhnXqfp0CJvcKA1YH4kLcAhbwOBFf+hRgeitNDBgM9RdUfHgUA06
	G8urrwdE5PSKrIeJyVy00m0ghJb+1ks=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-671-YyygfNJPOG-6ku6EpF1Iuw-1; Tue, 30 Apr 2024 08:39:07 -0400
X-MC-Unique: YyygfNJPOG-6ku6EpF1Iuw-1
Received: by mail-lj1-f199.google.com with SMTP id 38308e7fff4ca-2db6fbc1dedso54327501fa.3
        for <fsverity@lists.linux.dev>; Tue, 30 Apr 2024 05:39:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714480746; x=1715085546;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W8nGH1asXpyg2kuAwkDFcJcU70PWri0NFYqSFUgAKXg=;
        b=vOM1qqmqCalEXEtW285RoTDIOZwZFh96PkdnHDvvAvYNj3VoQQ5uX3z/yIV525EKeJ
         eB4mDCrDESXB8CJ/z05fIDY2FXrAZZS8aY28V9641flsTeTiLXUS5Gflruaj5wnILZdy
         5E98V3seEnlgPSbQ1ZivyK00YJ8L4Oo0Scd3mKhErh86edvheTHwPl/Oa4CQee68k1TE
         G3vqtLbvjykw1lzFpagImJ0+sorsJS9F0tHwfkC3fYwXbx0I12OUdZPNExypc2DcOjFY
         8e17MFEAG1priWeT7A+15eDxhe1yeqCRQAW9zY+nuGifMX4ZB22AerWHGbfA5n5lZ90Z
         6KDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXI2PKJCdYAjV8KBlZaX6408W/FtaXR3VQHyELWENxe+Q/TmclVW+kJu45+La/IMnDTDaE/4pPKgbKyIx0qhbkQEQN3OiaSxwY=
X-Gm-Message-State: AOJu0Yzty09+iN0LCARWdbaT7xogsId7Bd24k2cuE+TOBuGLi8TlyD7h
	krV1gMhl45RYCgxZDlQYkbs+o8pOKbOVZhnQPXwnBdU3WGKlLXBBDBueuuHD7U5+Ti6F+qMwnB3
	ZQXQOrN3iMQ5a2OPUWHq/30nAZZ0N1hTdUx9wswP7UooqD93iByldkCk=
X-Received: by 2002:a2e:8751:0:b0:2da:7cd1:3f1f with SMTP id q17-20020a2e8751000000b002da7cd13f1fmr9600218ljj.52.1714480745919;
        Tue, 30 Apr 2024 05:39:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGVYxuPVguCsONK3OpB7FYzf3d9kL4MuW/MmdYMbqLYevCuGHaDwdtQS1Ck+BozrjZINcYDmg==
X-Received: by 2002:a2e:8751:0:b0:2da:7cd1:3f1f with SMTP id q17-20020a2e8751000000b002da7cd13f1fmr9600183ljj.52.1714480745328;
        Tue, 30 Apr 2024 05:39:05 -0700 (PDT)
Received: from thinky ([109.183.6.197])
        by smtp.gmail.com with ESMTPSA id jw5-20020a170906e94500b00a58eab0f0e9sm3899676ejb.185.2024.04.30.05.39.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 05:39:04 -0700 (PDT)
Date: Tue, 30 Apr 2024 14:39:04 +0200
From: Andrey Albershteyn <aalbersh@redhat.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: zlang@redhat.com, ebiggers@kernel.org, 
	Andrey Albershteyn <andrey.albershteyn@gmail.com>, fsverity@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
	guan@eryu.me, linux-xfs@vger.kernel.org, fstests@vger.kernel.org
Subject: Re: [PATCH 1/6] common/verity: enable fsverity for XFS
Message-ID: <owfufxxoyiv3f67shc42n7pxvw4ippzjgukn3lfhayu5uraeci@pmqvwjh2u424>
References: <171444687971.962488.18035230926224414854.stgit@frogsfrogsfrogs>
 <171444687994.962488.5112127418406573234.stgit@frogsfrogsfrogs>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <171444687994.962488.5112127418406573234.stgit@frogsfrogsfrogs>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2024-04-29 20:41:03, Darrick J. Wong wrote:
> From: Andrey Albershteyn <aalbersh@redhat.com>
> 
> XFS supports verity and can be enabled for -g verity group.
> 
> Signed-off-by: Andrey Albershteyn <andrey.albershteyn@gmail.com>
> Reviewed-by: Darrick J. Wong <djwong@kernel.org>
> Signed-off-by: Darrick J. Wong <djwong@kernel.org>
> ---
>  common/verity |   39 +++++++++++++++++++++++++++++++++++++--
>  1 file changed, 37 insertions(+), 2 deletions(-)
> 
> 
> diff --git a/common/verity b/common/verity
> index 59b67e1201..20408c8c0e 100644
> --- a/common/verity
> +++ b/common/verity
> @@ -43,7 +43,16 @@ _require_scratch_verity()
>  
>  	# The filesystem may be aware of fs-verity but have it disabled by
>  	# CONFIG_FS_VERITY=n.  Detect support via sysfs.
> -	if [ ! -e /sys/fs/$fstyp/features/verity ]; then
> +	case $FSTYP in
> +	xfs)
> +		_scratch_unmount
> +		_check_scratch_xfs_features VERITY &>>$seqres.full
> +		_scratch_mount
> +	;;
> +	*)
> +		test -e /sys/fs/$fstyp/features/verity
> +	esac
> +	if [ ! $? ]; then
>  		_notrun "kernel $fstyp isn't configured with verity support"
>  	fi
>  
> @@ -201,6 +210,9 @@ _scratch_mkfs_verity()
>  	ext4|f2fs)
>  		_scratch_mkfs -O verity
>  		;;
> +	xfs)
> +		_scratch_mkfs -i verity
> +		;;
>  	btrfs)
>  		_scratch_mkfs
>  		;;
> @@ -334,12 +346,19 @@ _fsv_scratch_corrupt_bytes()
>  	local lstart lend pstart pend
>  	local dd_cmds=()
>  	local cmd
> +	local device=$SCRATCH_DEV
>  
>  	sync	# Sync to avoid unwritten extents
>  
>  	cat > $tmp.bytes
>  	local end=$(( offset + $(_get_filesize $tmp.bytes ) ))
>  
> +	# If this is an xfs realtime file, switch @device to the rt device
> +	if [ $FSTYP = "xfs" ]; then
> +		$XFS_IO_PROG -r -c 'stat -v' "$file" | grep -q -w realtime && \
> +			device=$SCRATCH_RTDEV
> +	fi
> +
>  	# For each extent that intersects the requested range in order, add a
>  	# command that writes the next part of the data to that extent.
>  	while read -r lstart lend pstart pend; do
> @@ -355,7 +374,7 @@ _fsv_scratch_corrupt_bytes()
>  		elif (( offset < lend )); then
>  			local len=$((lend - offset))
>  			local seek=$((pstart + (offset - lstart)))
> -			dd_cmds+=("head -c $len | dd of=$SCRATCH_DEV oflag=seek_bytes seek=$seek status=none")
> +			dd_cmds+=("head -c $len | dd of=$device oflag=seek_bytes seek=$seek status=none")
>  			(( offset += len ))
>  		fi
>  	done < <($XFS_IO_PROG -r -c "fiemap $offset $((end - offset))" "$file" \
> @@ -408,6 +427,22 @@ _fsv_scratch_corrupt_merkle_tree()
>  		done
>  		_scratch_mount
>  		;;
> +	xfs)
> +		local ino=$(stat -c '%i' $file)

I didn't know about xfs_db's "path" command, this can be probably
replace with -c "path $file", below in _scratch_xfs_db.

> +		local attr_offset=$(( $offset % $FSV_BLOCK_SIZE ))
> +		local attr_index=$(printf "%08d" $(( offset - attr_offset )))
> +		_scratch_unmount
> +		# Attribute name is 8 bytes long (byte position of Merkle tree block)
> +		_scratch_xfs_db -x -c "inode $ino" \
                                here   ^^^^^^^^^^
> +			-c "attr_modify -f -m 8 -o $attr_offset $attr_index \"BUG\"" \
> +			-c "ablock 0" -c "print" \
> +			>>$seqres.full
> +		# In case bsize == 4096 and merkle block size == 1024, by
> +		# modifying attribute with 'attr_modify we can corrupt quota
> +		# account. Let's repair it
> +		_scratch_xfs_repair >> $seqres.full 2>&1
> +		_scratch_mount
> +		;;
>  	*)
>  		_fail "_fsv_scratch_corrupt_merkle_tree() unimplemented on $FSTYP"
>  		;;
> 
> 

Otherwise, looks good to me:
Reviewed-by: Andrey Albershteyn <aalbersh@redhat.com>

-- 
- Andrey

