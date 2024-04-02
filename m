Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C67D14B06F
	for <fsverity@lists.linux.dev>; Tue,  2 Apr 2024 16:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712075212; cv=none; b=TYX5jH5OTkuEB8TsgoKW1//1dh+8eCf6znnywLdENwMr6fFtEWqLvUmgfjWsnX0g1CZKssGUGArmKx6q2tYEmQBaMwTI+nbZDc9ed+pX3HSkE29PrCDEJY9uAX+1WTYEHR3rg8ffU2ME0AesGN9f0M/04QH02scHHl1aNYP25Kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712075212; c=relaxed/simple;
	bh=F5+iyGUCvQpuV8lv12EAHUDCmUU3i5EFr4dh4MbLXwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=K5yBoK/Eky+SJFNj+tqtU9FyujslFc8LUGZVSk8zLnG9Nh8ChuCFlnWh6aWila5HTIlQd/gaevShcEv5QsQ8Zu9v2JHRztKx2YnGoChuJgHSyn22zEBfTHt+Xbk0WZFcajoPcF1pugRqywPPEir1gNWAU25kfnc0RJ3+iiij3uU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=H3qNaJE0; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="H3qNaJE0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712075209;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7TpGFn21m1i2uNjneulzVfYfTm+8lK5ZR+k7A+k840E=;
	b=H3qNaJE0/eHrNDRcntWhOsyyjsb7I3r7M9z8wr4fX6ry+Yj8KU6MpqSy9thKMIhknsfZuH
	fJoAN9zoQUZW/BC+OgbyLoVquz8J+TerYUxpLkjr314cpwrfrWKf6edbAIcMij+oJRZy+d
	RN/UjntLli9l9pxi2MZ8POnV9EXoWO8=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-640-KxaJLLgOMwyx33azISftKw-1; Tue, 02 Apr 2024 12:26:48 -0400
X-MC-Unique: KxaJLLgOMwyx33azISftKw-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a4921e09cebso216780666b.2
        for <fsverity@lists.linux.dev>; Tue, 02 Apr 2024 09:26:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712075207; x=1712680007;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7TpGFn21m1i2uNjneulzVfYfTm+8lK5ZR+k7A+k840E=;
        b=Uz13DPKzwJjfD29495FU0cX6ax40O0/qKFocXxcXqqB5Pymk92kkyj7NwznHcDuCjQ
         UBXCKG4inSnGwxBVbmiJS1dA2gxrAQbGzkeP9a9qihszncLKh5a4GXsNVFwWpDXWPyl/
         U80rgv55ghDfbwlQIF2bEDJwRo4e+LM1qpzHDUWzbjnTSZ7vXUG4NYdfpeKjpmZTQo/0
         SwcDu8Xkl/ASFDK3eUDdEcZrKIZhjzBYN5ScZUEQC2Ilgt6RT18xVZ+XxZ3BubDLpFAC
         F3eWY7ofGYW7O1RpUax0GXaRXfz+wifCf0/DRkQnxVjG5z2USCMqADR4RgVpXUE/iVeo
         +3fg==
X-Forwarded-Encrypted: i=1; AJvYcCUmsifQ1GpGbF2i1H+Z0SyUcVjBLLx0A4w3cIZPE9E2tjyxn1trZ09BTgkWO+OYR0Zq4JEOhzMKGVtLYerVo1xmCjVnYA+T1bo=
X-Gm-Message-State: AOJu0Yy6lffLgOJW5OVCDTLPye6GMJciItLRHFLI6V9Y37gwqyfSSeLx
	cTR9pW6JTl2MSXMt2VsAJT5L25od3k4+0CiplcV8ZnTU79s6uFm/G6irjjOzl+U/rYB2bzf4SxN
	/HD7yDgeXsUsZKurDLHxdYygnhbj9RS/hsXfouoVq01+Mf0+0TcEW+Qs=
X-Received: by 2002:a17:906:1390:b0:a4e:3a09:4854 with SMTP id f16-20020a170906139000b00a4e3a094854mr179149ejc.61.1712075206749;
        Tue, 02 Apr 2024 09:26:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGbgALg3k0jk88bFML2ntWceIt+4WbChdRCLZb4p2oD8DsKtXsq8JdftPPwH7GoLWKYGoeFWQ==
X-Received: by 2002:a17:906:1390:b0:a4e:3a09:4854 with SMTP id f16-20020a170906139000b00a4e3a094854mr179128ejc.61.1712075206163;
        Tue, 02 Apr 2024 09:26:46 -0700 (PDT)
Received: from thinky ([109.183.6.197])
        by smtp.gmail.com with ESMTPSA id bw17-20020a170906c1d100b00a46b4544da2sm6658587ejb.125.2024.04.02.09.26.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 09:26:45 -0700 (PDT)
Date: Tue, 2 Apr 2024 18:26:45 +0200
From: Andrey Albershteyn <aalbersh@redhat.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: ebiggers@kernel.org, linux-xfs@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, fsverity@lists.linux.dev
Subject: Re: [PATCH 26/29] xfs: clear the verity iflag when not appropriate
Message-ID: <smmx4hendu6fbin2kcuowsmlvwjm2nmqk7bd3mce65qawpf4ej@5d6demmjry5e>
References: <171175868489.1988170.9803938936906955260.stgit@frogsfrogsfrogs>
 <171175868990.1988170.5463670567083439208.stgit@frogsfrogsfrogs>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <171175868990.1988170.5463670567083439208.stgit@frogsfrogsfrogs>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2024-03-29 17:42:50, Darrick J. Wong wrote:
> From: Darrick J. Wong <djwong@kernel.org>
> 
> Clear the verity inode flag if the fs doesn't support verity or if it
> isn't a regular file.  This will clean up a busted inode enough that we
> will be able to iget it.
> 
> Signed-off-by: Darrick J. Wong <djwong@kernel.org>
> ---
>  fs/xfs/scrub/inode_repair.c |    2 ++
>  1 file changed, 2 insertions(+)
> 
> 
> diff --git a/fs/xfs/scrub/inode_repair.c b/fs/xfs/scrub/inode_repair.c
> index fb8d1ba1f35c0..30e62f00a17a6 100644
> --- a/fs/xfs/scrub/inode_repair.c
> +++ b/fs/xfs/scrub/inode_repair.c
> @@ -566,6 +566,8 @@ xrep_dinode_flags(
>  		dip->di_nrext64_pad = 0;
>  	else if (dip->di_version >= 3)
>  		dip->di_v3_pad = 0;
> +	if (!xfs_has_verity(mp) || !S_ISREG(mode))
> +		flags2 &= ~XFS_DIFLAG2_VERITY;
>  
>  	if (flags2 & XFS_DIFLAG2_METADIR) {
>  		xfs_failaddr_t	fa;
> 

Looks good to me:
Reviewed-by: Andrey Albershteyn <aalbersh@redhat.com>

-- 
- Andrey

