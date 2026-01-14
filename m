Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B57CC37BE60
	for <fsverity@lists.linux.dev>; Wed, 14 Jan 2026 07:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768377574; cv=none; b=FKGU/qTvG0D2mq7JqiLii7ecwen/PVSyhhZk3gRYT9RZ9DR8I4ea6DHQNcXkqgz3ksSl+dkKAGxMkvze48fNR+erDqVhfcglqbj4/t7wxjqO9VN/Mo7/b+vCkY/nZqg4NO/+6JPUQDtax1K5AdFa2L3myQpmKHBYipUaROazgtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768377574; c=relaxed/simple;
	bh=1aUKYIRl2BwEm914CynRUZT9PGBuxECbpl4PjADuaek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=Gqc8YmP3aHQYvT9WWdQjnmHdfQI3I8BnHY5KcucSucRZUDy95Bwa5lcIG78Cq+oCzKc2uFyhe6b4+It1UZe8eLKeVIzi+glOrfsSsHXMMUAPYJdDRDmfLYHiQ3wYR7xNjfeDvZvRb2WR2zm1eBFCDbH5HCNXkFSPx3aEDgT4Mws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PfDgOx7g; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PfDgOx7g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768377570;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ttw7mSCoUtfFUMLK1cUNknHOhK7ms79WYyJovBvM2fs=;
	b=PfDgOx7gu56odT1roEdkxiGvX6ooinSo3vWWYtIRisZkfwyjRJY7NfuVfOKYCv8saaw7sA
	zT8LcLOPmEa2OLr9CP4vZnu1Wi+PyDfP0+T8Cb5dHiTHSVw6FGOnwGvibyIWTk/Sd8lZJq
	kx9isWhQaLhjYQWLgq4PHhN8Zfit2xM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-68-b9kI2urwMay-TYa2y9XHYA-1; Wed, 14 Jan 2026 02:59:28 -0500
X-MC-Unique: b9kI2urwMay-TYa2y9XHYA-1
X-Mimecast-MFC-AGG-ID: b9kI2urwMay-TYa2y9XHYA_1768377567
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-477563a0c75so50853075e9.1
        for <fsverity@lists.linux.dev>; Tue, 13 Jan 2026 23:59:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768377567; x=1768982367;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ttw7mSCoUtfFUMLK1cUNknHOhK7ms79WYyJovBvM2fs=;
        b=JajnuTanlxl4wV2iSTP0t0XqxQFsHSnXKdh/47+FjLqV+JmaI/XDPk4dzggBZnnpE6
         aRToJyIMeheBo5LwWLzqxINCseV2/d8UYiNt+zWLua1eg4jrIYvOxPxG+VwXTDkveUoH
         IQlm1YoPEBvRqXemYJNOLyIG52yKEyJbl09zALBAq9cbcSI38MuBv2mAvhiwlkkjIYuf
         47rsPF+XkYcZJl4EVzfXDWOyC25rHlK07FkMJWz+ViBZfjwN5Bwij8RGqOzFqfxbzOdM
         9yyhQT3RIv+2Hy8+40qNJNamabCLpXfqp52bOT6yTrH44MFyHfxj+Lbfj1sqlBKagUtK
         YjIA==
X-Forwarded-Encrypted: i=1; AJvYcCXX8Tpb3pHkKDPruzNBH3J5SV9V+OzcxPyD69M9IQ5ewRuXgkNa27yZiDsp7Fopp7mIKzmBpHeeSg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx2RND0ph2ljx5IgnuTbPaA3eGfKFbVY+cMQcHVJcGEOITSDk01
	5Mq7U6l5AgrZeXCfZkmXIE3vZhaDDzXODoAMwVYK6DMFYYuTPoxpZoSYqpFaL09IdSA1TcjlrVH
	22hYUTvzRdJXeR/TxqFRAx9513is3r7F4PQoMV7yc0fmC7eZzdRL6P3822lM=
X-Gm-Gg: AY/fxX4tbJppoA1/5BW2StUL6l+m1CP0VLTjs1m2TXvHJdKuiwnjG2lHLG2qlbim7z8
	9+87+sqSl8mgj1MZs420oLpByw40SdYwjfPITKM7ACi2W8yI4tJUYv8B/eoKTIyAnPUu7DVo36D
	MD19o0ltbWSpQ7f8/vUyhTAu6OuJgxZNfPwBR4NE6xTg8mW3qnK6lb8Plyyook8br5seMa7V/SL
	5TSWDzaPK4AwTZhk/zjblV1AkwFwcjH0HK6tFUKLf6j0T/a+YR2K08CZSUy9UfNUuUpxv8g7ArY
	5hB4CnTQuryZnAoZZknZOeXtWwQT/Ixxxhkz22yPeWcXo9++a6ITG+C+uJPzpwGKNfgpvD+ajWg
	=
X-Received: by 2002:a05:600c:4f4d:b0:477:b48d:ba7a with SMTP id 5b1f17b1804b1-47ee338a84cmr18465425e9.32.1768377567234;
        Tue, 13 Jan 2026 23:59:27 -0800 (PST)
X-Received: by 2002:a05:600c:4f4d:b0:477:b48d:ba7a with SMTP id 5b1f17b1804b1-47ee338a84cmr18465175e9.32.1768377566779;
        Tue, 13 Jan 2026 23:59:26 -0800 (PST)
Received: from thinky ([217.30.74.39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47ee54b8c9bsm14967685e9.3.2026.01.13.23.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 23:59:26 -0800 (PST)
Date: Wed, 14 Jan 2026 08:59:25 +0100
From: Andrey Albershteyn <aalbersh@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Cc: "Darrick J. Wong" <djwong@kernel.org>, fsverity@lists.linux.dev, 
	linux-xfs@vger.kernel.org, ebiggers@kernel.org, linux-fsdevel@vger.kernel.org, 
	aalbersh@kernel.org, david@fromorbit.com
Subject: Re: [PATCH v2 13/22] xfs: introduce XFS_FSVERITY_REGION_START
 constant
Message-ID: <dktp3ghx5h4eqcfgam6dj2eaajfbje6kis2z27ofovuz63lfe2@37pwttncu4ki>
References: <cover.1768229271.patch-series@thinky>
 <qwtd222f5dtszwvacl5ywnommg2xftdtunco2eq4sni4pyyps7@ritrh57jm2eg>
 <20260112224631.GO15551@frogsfrogsfrogs>
 <5ax7476dl472kpg3djnlojoxo2k4pmfbzwzsw4mo4jnaoqumeh@t3l4aesjfhwz>
 <20260113180655.GY15551@frogsfrogsfrogs>
 <20260114064735.GD10876@lst.de>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260114064735.GD10876@lst.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 2c6W5wFMbI9KFEUfrmpOA1fxvthcY5aBNq5diF-fHJI_1768377567
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2026-01-14 07:47:35, Christoph Hellwig wrote:
> On Tue, Jan 13, 2026 at 10:06:55AM -0800, Darrick J. Wong wrote:
> > > hmm right, check in begin_enable() will be probably enough
> > 
> > I think that would probably be more of a mount-time prohibition?
> > 
> > Which would be worse -- any fsverity filesystem refuses to mount on
> > 32-bit; or it mounts but none of the fsverity files are readable?
> > 
> > Alternately I guess for 32-bit you could cheat in ->iomap_begin
> > by loading the fsverity artifacts into the pagecache at 1<<39 instead of
> > 1<<53, provided the file is smaller than 1<<39 bytes.  Writing the
> > fsverity metadata would perform the reverse translation.
> > 
> > (Or again we just don't allow mounting of fsverity on 32-bit kernels.)
> 
> What are the other file systems doing here?  Unless we have a good
> reason to differ we should just follow the precedence.
> 

The ext4/f2fs/btrfs does this

	round_up(inode->i_size, 65536);

It's not fixed offset but next block after EOF. As EOF won't move
this is fine. So, this works for both 32/64bits

-- 
- Andrey

