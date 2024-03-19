Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC2F54FA0
	for <fsverity@lists.linux.dev>; Tue, 19 Mar 2024 14:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710860396; cv=none; b=OujRIw5uhgXmqN6gE4lRFeaTzNmszRQ7uT3AYUqpXueYJP9HgFIw3mEU28eAm13wfp4xw4xCixRTVqAmccsieNxndkhScH8f0bqDuVVlikTtdPt02nmkErn7ZMsbC6SMJKYs6r4Mp0ybRHz5/v6XH1sl6KgWjpwLwBLn302pYK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710860396; c=relaxed/simple;
	bh=ajxpaMC3T8IunaZ5P+9lA5RJwsCq/EAHYOIJkPgl3hw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=NHAClSdOuT2py6TAF70MgEfNf/KWg8wYGk2BbPDS1hUcSzN9nDRLy4DwzzOv3qnzjTDrv91Z+7/uyc85/vJdiZ26w5PaZMqIYk8UV1bxQIPVoSndtSUfkRu9V6GeyPPngN+bxqoUXk9lz9muOxuAU1JF5a8dn/jTTiX/SpZXSlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KqrqLXVl; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KqrqLXVl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710860393;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ia2sWuwHy79VhH6nPO9UUd5RJV3cIBJb+5/X2TNMkJY=;
	b=KqrqLXVlS/xZX2Dsdqmu9GRb92XmVs5hl/qRE6zimXIQ9PA+ioWnule0JSkTQTPI5dznvP
	JVazrCKliMxiumyT9RIvZ/HlxCzL83uOyyJw1gfYm66Z92H2yolyTXaygX2HzcSnhzdCRW
	eISRlJhQ1WWupiWB76aowmvGyi8sVkI=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-680-kOqaK71-MqmZm6v2l3frcA-1; Tue, 19 Mar 2024 10:59:52 -0400
X-MC-Unique: kOqaK71-MqmZm6v2l3frcA-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a464f5e2499so252810966b.2
        for <fsverity@lists.linux.dev>; Tue, 19 Mar 2024 07:59:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710860391; x=1711465191;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ia2sWuwHy79VhH6nPO9UUd5RJV3cIBJb+5/X2TNMkJY=;
        b=fNkm60phE4FnTY+6qn5nNO9frxlQpaqc4L5TqPUa0JNZTNVC5r5TV0TE2zBhfwSFrD
         woK05rXhZ8LW16XG7/uyimnJ5ggGKHIYqXlSYE0vwL86B7MVXDWpSL5Z1PKsfDpEC470
         TYRSytE8uEo6/ubBzSJWts46AFv8kNBLIp1e503XeEgFF3VcQQirKNlBC8BTrYRpm1fW
         rRbHykE1795CtPOB/jmPf56i+l2pmcYGHBzBZGhIaHjoHsBj63B0V+lPYaCgQOOqThkP
         3WcGMICl3DQOnTh+VCxv7L2t+jjdi9sqrF7XHOLid/WOAMzH2YwvEVbYl6rxyJPdQD13
         Rzvg==
X-Forwarded-Encrypted: i=1; AJvYcCVaVdEreCq1VU5ZvjmW2A7qfPbG0I2Z25uVwHAEo7zmFNifYwPxv/dU988I+FeU7mgM/YH8PbwsYNvEGXaLiabZnY7C8nck08Y=
X-Gm-Message-State: AOJu0YzHlX7giYx27RlOI+69UtoqPkc9WHqdP+VXlFvP7w5nUMxvKoB/
	PWjOqOjj06Tk3XMaIGHvHS0NdHxflrOYB87cCNeh1vQ7KAjxXyGPMekyd5cWp3DX/QHSQmDGprU
	Qn4+YJ4ucTChlWo/OgeM8BPbD32Ln9tGYBivGpK1hr3qbpp+hMTgR/xBJErPEtMo=
X-Received: by 2002:a17:906:bc95:b0:a46:9b71:b852 with SMTP id lv21-20020a170906bc9500b00a469b71b852mr1799580ejb.26.1710860390637;
        Tue, 19 Mar 2024 07:59:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGkhUvQ74NDR8xixLTTUY2PjtMB1t6xn8SFEqwr9V0Tb0eFn1ewzSnxrxKXEH+0uqKR3BI3w==
X-Received: by 2002:a17:906:bc95:b0:a46:9b71:b852 with SMTP id lv21-20020a170906bc9500b00a469b71b852mr1799556ejb.26.1710860390115;
        Tue, 19 Mar 2024 07:59:50 -0700 (PDT)
Received: from thinky ([109.183.6.197])
        by smtp.gmail.com with ESMTPSA id nb33-20020a1709071ca100b00a46da83f7fdsm1040601ejc.145.2024.03.19.07.59.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 07:59:49 -0700 (PDT)
Date: Tue, 19 Mar 2024 15:59:48 +0100
From: Andrey Albershteyn <aalbersh@redhat.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: ebiggers@kernel.org, zlang@redhat.com, fsverity@lists.linux.dev, 
	fstests@vger.kernel.org, linux-fsdevel@vger.kernel.org, guan@eryu.me, 
	linux-xfs@vger.kernel.org
Subject: Re: [PATCH 2/3] xfs/{021,122}: adapt to fsverity xattrs
Message-ID: <qwe6bnzuqkmef5hpwf6hzv5ce447xij7ko67vvasjcnzxy4eho@xnvyvawp5mba>
References: <171069248832.2687004.7611830288449050659.stgit@frogsfrogsfrogs>
 <171069248865.2687004.1285202749756679401.stgit@frogsfrogsfrogs>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <171069248865.2687004.1285202749756679401.stgit@frogsfrogsfrogs>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2024-03-17 09:39:33, Darrick J. Wong wrote:
> From: Darrick J. Wong <djwong@kernel.org>
> 
> Adjust these tests to accomdate the use of xattrs to store fsverity
> metadata.
> 
> Signed-off-by: Darrick J. Wong <djwong@kernel.org>

Is it against one of pptrs branches? doesn't seem to apply on
for-next

> ---
>  tests/xfs/021     |    3 +++
>  tests/xfs/122.out |    1 +
>  2 files changed, 4 insertions(+)
> 
> 
> diff --git a/tests/xfs/021 b/tests/xfs/021
> index ef307fc064..dcecf41958 100755
> --- a/tests/xfs/021
> +++ b/tests/xfs/021
> @@ -118,6 +118,7 @@ _scratch_xfs_db -r -c "inode $inum_1" -c "print a.sfattr"  | \
>  	perl -ne '
>  /\.secure/ && next;
>  /\.parent/ && next;
> +/\.verity/ && next;
>  	print unless /^\d+:\[.*/;'
>  
>  echo "*** dump attributes (2)"
> @@ -128,6 +129,7 @@ _scratch_xfs_db -r -c "inode $inum_2" -c "a a.bmx[0].startblock" -c print  \
>  	| perl -ne '
>  s/,secure//;
>  s/,parent//;
> +s/,verity//;
>  s/info.hdr/info/;
>  /hdr.info.crc/ && next;
>  /hdr.info.bno/ && next;
> @@ -135,6 +137,7 @@ s/info.hdr/info/;
>  /hdr.info.lsn/ && next;
>  /hdr.info.owner/ && next;
>  /\.parent/ && next;
> +/\.verity/ && next;
>  s/^(hdr.info.magic =) 0x3bee/\1 0xfbee/;
>  s/^(hdr.firstused =) (\d+)/\1 FIRSTUSED/;
>  s/^(hdr.freemap\[0-2] = \[base,size]).*/\1 [FREEMAP..]/;
> diff --git a/tests/xfs/122.out b/tests/xfs/122.out
> index 3a99ce77bb..ff886b4eec 100644
> --- a/tests/xfs/122.out
> +++ b/tests/xfs/122.out
> @@ -141,6 +141,7 @@ sizeof(struct xfs_scrub_vec) = 16
>  sizeof(struct xfs_scrub_vec_head) = 32
>  sizeof(struct xfs_swap_extent) = 64
>  sizeof(struct xfs_unmount_log_format) = 8
> +sizeof(struct xfs_verity_merkle_key) = 8
>  sizeof(struct xfs_xmd_log_format) = 16
>  sizeof(struct xfs_xmi_log_format) = 80
>  sizeof(union xfs_rtword_raw) = 4
> 

-- 
- Andrey

