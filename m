Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC576171E62
	for <fsverity@lists.linux.dev>; Tue, 30 Apr 2024 13:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714483378; cv=none; b=ZBHlZ4ASwXHytMtauXkgSUYYZFHgomwEwMxvFUrWX0TLw4Z+Rk97KEIrUo+Hu+VtVmJQ9vva3p6InZqzcdZ+KQGwSronH0CuDHBajmmgcQPK4CJbK7jdm4+wA9hT31zpQBSeMGT0gag8EtDRyn3BleagN1A9TXIN5tMedoK3/94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714483378; c=relaxed/simple;
	bh=YnEJ0sEcEqRvMruWiehseLaJw4OasqybHAEjGtiIl2s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=b0a9CJg+GYgBf+zaK8JaFqpHktiY7vJrTg1dAjdQDn96T+gmf8EenDL6E6Td9MvwstdMRYwhNfoKs9zmRkYK7qKA5ZoAWyPcUc/x4MRcilPvcFYbvIayRDZNGldKzw6+r4CzrYWnFbWobJoNSvWL6NAfOoSR0NljEZ2RKbgt97o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Id0L6v32; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Id0L6v32"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714483375;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kf4VuVjSkqqaSBuXyiy9b+enj0lsiQgUxAzYhGA5mE8=;
	b=Id0L6v32oey+N40rOj0hWK9lp0rb6ECgGCXCDpFwqAIbtqL0BVZjxS49n4xdQMhhWylc+8
	eebXv6PQGUAN3/Qwl69nd9n3o8+YgqCAfS/Zy2NYjZXxPMcNtDpGzFKK7iEJ/XJj1Xox3l
	TacriKsOAV+THXxRjqfi/nrNyfsFMJ8=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-8-FBeLPs58ONqx5Bpxn73GOA-1; Tue, 30 Apr 2024 09:22:54 -0400
X-MC-Unique: FBeLPs58ONqx5Bpxn73GOA-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-56e645a8762so2978349a12.3
        for <fsverity@lists.linux.dev>; Tue, 30 Apr 2024 06:22:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714483372; x=1715088172;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kf4VuVjSkqqaSBuXyiy9b+enj0lsiQgUxAzYhGA5mE8=;
        b=h3LQXj+sUjMb1hz+S3FIQvWRtukR/8vYmf2aHY226+Xnrzhgx1UeqgeEvCIWPVPxsK
         q94J8aMaaTXvmMAdNFxBw4H283nLy9LDLW86x8KMboJdGJs6YRsoNGeiMGMsPXKzRnb7
         23BlXvQrUSE7ImptyA9bXqH/jOEf+N5dpkAylyh3Wq5yyg+fk4PnEBkJcNA3g49KmsK3
         PB1II5dpoHCgvOt4RewIymG1lHZbNtt7KhnUvdIWr6NG30KAi5jBDQWvxiEFe4/XJHZM
         rdDF0D6isgqTABrVp2lRFId+oGbYjtcEDb2cM5iXxPIW5qwKNV1AhzoD8ot0jp84XDOT
         luIg==
X-Forwarded-Encrypted: i=1; AJvYcCVhsGKsRFjci280LabCHbMoOFJeKbovmtgto+b6he464Uoi+XVGSCVQbcxBVazSpd3nMnBF36uxwvTzgjvwCSfxPCpt+XyEuHE=
X-Gm-Message-State: AOJu0YwHWwmyBx7nmDuGt7AJDOQJagkdCpf4hCd7yzRBpLnNvugnZZqT
	qsE4FRbfEwn2X9saZGMcvjsc0Bjjv6Mr30GMb7l8iTm19+X5v7T1oc4wUuKJJYSBtWaBOg+I6FT
	tOCvTzzDL8bQ88Ega5e8uegu6cRPL/1na4VE1M6kqFF33Puchj94kbTs=
X-Received: by 2002:a50:9993:0:b0:572:9e96:cdd0 with SMTP id m19-20020a509993000000b005729e96cdd0mr891916edb.2.1714483372176;
        Tue, 30 Apr 2024 06:22:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGEpwaRQV/7d7WM8xQJn8O8slwrFWWcV0hlAQMVCF07J1eFJuZ01TvonvPaHMPCXLdzduGgyw==
X-Received: by 2002:a50:9993:0:b0:572:9e96:cdd0 with SMTP id m19-20020a509993000000b005729e96cdd0mr891893edb.2.1714483371609;
        Tue, 30 Apr 2024 06:22:51 -0700 (PDT)
Received: from thinky ([109.183.6.197])
        by smtp.gmail.com with ESMTPSA id b61-20020a509f43000000b0056e51535a2esm14826411edf.82.2024.04.30.06.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 06:22:51 -0700 (PDT)
Date: Tue, 30 Apr 2024 15:22:50 +0200
From: Andrey Albershteyn <aalbersh@redhat.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: zlang@redhat.com, ebiggers@kernel.org, fsverity@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, guan@eryu.me, linux-xfs@vger.kernel.org, fstests@vger.kernel.org
Subject: Re: [PATCH 6/6] common/populate: add verity files to populate xfs
 images
Message-ID: <jalepm6lu3nwy4bext62pj2fii6s2iknkgbsh5p3ltz65yeqcs@5z4s72utnopv>
References: <171444687971.962488.18035230926224414854.stgit@frogsfrogsfrogs>
 <171444688070.962488.15915265664424203708.stgit@frogsfrogsfrogs>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <171444688070.962488.15915265664424203708.stgit@frogsfrogsfrogs>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2024-04-29 20:42:21, Darrick J. Wong wrote:
> From: Darrick J. Wong <djwong@kernel.org>
> 
> If verity is enabled on a filesystem, we should create some sample
> verity files.
> 
> Signed-off-by: Darrick J. Wong <djwong@kernel.org>
> ---
>  common/populate |   24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> 
> diff --git a/common/populate b/common/populate
> index 35071f4210..ab9495e739 100644
> --- a/common/populate
> +++ b/common/populate
> @@ -520,6 +520,30 @@ _scratch_xfs_populate() {
>  		done
>  	fi
>  
> +	# verity merkle trees
> +	is_verity="$(_xfs_has_feature "$SCRATCH_MNT" verity -v)"
> +	if [ $is_verity -gt 0 ]; then
> +		echo "+ fsverity"
> +
> +		# Create a biggish file with all zeroes, because metadump
> +		# won't preserve data blocks and we don't want the hashes to
> +		# stop working for our sample fs.

Hashes of the data blocks in the merkle tree? All zeros to use
.zero_digest in fs-verity? Not sure if got this comment right

> +		for ((pos = 0, i = 88; pos < 23456789; pos += 234567, i++)); do
> +			$XFS_IO_PROG -f -c "pwrite -S 0 $pos 234567" "$SCRATCH_MNT/verity"
> +		done
> +
> +		fsverity enable "$SCRATCH_MNT/verity"
> +
> +		# Create a sparse file
> +		$XFS_IO_PROG -f -c "pwrite -S 0 0 3" -c "pwrite -S 0 23456789 3" "$SCRATCH_MNT/sparse_verity"
> +		fsverity enable "$SCRATCH_MNT/sparse_verity"
> +
> +		# Create a salted sparse file
> +		$XFS_IO_PROG -f -c "pwrite -S 0 0 3" -c "pwrite -S 0 23456789 3" "$SCRATCH_MNT/salted_verity"
> +		local salt="5846532066696e616c6c7920686173206461746120636865636b73756d732121"	# XFS finally has data checksums!!
> +		fsverity enable --salt="$salt" "$SCRATCH_MNT/salted_verity"
> +	fi
> +
>  	# Copy some real files (xfs tests, I guess...)
>  	echo "+ real files"
>  	test $fill -ne 0 && __populate_fill_fs "${SCRATCH_MNT}" 5
> 

-- 
- Andrey

