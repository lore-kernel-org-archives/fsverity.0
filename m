Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51E2256450
	for <fsverity@lists.linux.dev>; Tue, 12 Mar 2024 12:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710247355; cv=none; b=mJ5sy+2RFb+fnADDgY7GY+Yhj9rIHWFFJoYrHuofNfPoyDKVd9u+dnMv5zEAfLpE27W/g6TRa0cD1zUwENIQmRO22T9trVwQbnno/t9c1QsO8bXSwzNfyf55sJYvIVGshWZvxQ9Xp/EZi5WwI58ljtbNzaJeVcQzXATiuWI+FLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710247355; c=relaxed/simple;
	bh=WdNiCw9a6QyxEfoXxzqePgCN33RJ0NkeRM5mNDnx5Yo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=UYyJXsR9TGzjTufF7UHJjUh6PtuNxpDAyV6pZJ+SYsZ75NCasLmGR91oRO4dITJGAEKQGJI/RYts8pKLLoIwuCKc6iIJL7TjVC/Lh3bKgYE8EEoDVkJdnq7N62MntfrIANZwPy99kNfKtCT+iplvolkSHIaj/oMkgKjqkyEpfrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cF4F5tCo; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cF4F5tCo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710247352;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KVF+T75LwSeiDiQb6FyOLvE1cqevBb5wDY4YhiPNbGQ=;
	b=cF4F5tCoWQGTVtZ1JX5I/kUc1t5uBou3wXFFYWL0NHQCztpiBoDqPTZT3Jhcnsaan2jKNp
	cvTS/GTOtRFWSJTPPV1r42aLaaErGLr2g2TblqbGN/LeItTVvnIe63xoMbbg3MS5F1mz75
	sPHbWupSoCERTcJyh4V1uZrAM2xEfBM=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-157-RQbmnSIjPbmqQTwVhkEnAg-1; Tue, 12 Mar 2024 08:42:30 -0400
X-MC-Unique: RQbmnSIjPbmqQTwVhkEnAg-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a4531df8727so147241566b.2
        for <fsverity@lists.linux.dev>; Tue, 12 Mar 2024 05:42:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710247349; x=1710852149;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KVF+T75LwSeiDiQb6FyOLvE1cqevBb5wDY4YhiPNbGQ=;
        b=Kr7fOXJ8xbOiG0roruC2d0povjIhqYw2esiJIyjsykmXtO3814ywDUvlB6Km9S3Wpk
         nh+1pCQtNh/+LbxjpH6X7cALejDNXY/pUBK5oE+Nvs9/7uJkwTshSICvCeaqPto+m1cq
         cRPGG4uaZq0T9X5+NHdQ+XKKcmlg6S+Td9M/lxOn8/F2UcnG7VDX1jj7rpg0IIpTfhd7
         M1wPoZltyXtEgjd5hmty5p4zGySf74ihARFubTdek56sve35jY4EB1z+S2DdAUXH9oxz
         3sy3dW4K4XrPfMh6RoCdl0Y0xKv58Zaw6U1GHXfSs0sPjgbbA2Km2Cf58Wr4m+mFxNtR
         CB/w==
X-Gm-Message-State: AOJu0YwhbAg6R9fY7zqsxwLxN6ZXg6uS9SsrRfsL3Yjlu074QipEBWRx
	QA7R868gnjELx1l/y2GjLn5ut0ocCfLjkJepJXVz7swjA02PRmfEP/3ONubYlieXdSzYvbw/vSm
	nyWXeOTCCGhJ+f10v3dKtuhA/4fcQ6jmn86zz5aAjniqeYrGIOzMTsJQ=
X-Received: by 2002:a17:906:f850:b0:a3f:29c:c8fa with SMTP id ks16-20020a170906f85000b00a3f029cc8famr134633ejb.66.1710247349528;
        Tue, 12 Mar 2024 05:42:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFW3bzo7NZebTVEL0evFaE30La4fanl7fiHQtvMNtFbdkYJaaT0rzJHzdyOHCS50THEn4Dl9w==
X-Received: by 2002:a17:906:f850:b0:a3f:29c:c8fa with SMTP id ks16-20020a170906f85000b00a3f029cc8famr134610ejb.66.1710247349003;
        Tue, 12 Mar 2024 05:42:29 -0700 (PDT)
Received: from thinky ([109.183.6.197])
        by smtp.gmail.com with ESMTPSA id l8-20020a170906230800b00a4131367204sm3811243eja.80.2024.03.12.05.42.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 05:42:28 -0700 (PDT)
Date: Tue, 12 Mar 2024 13:42:27 +0100
From: Andrey Albershteyn <aalbersh@redhat.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: fsverity@lists.linux.dev, linux-xfs@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, chandan.babu@oracle.com, ebiggers@kernel.org
Subject: Re: [PATCH v5 23/24] xfs: add fs-verity ioctls
Message-ID: <3rovt56zfexku6if3d6rgtyyuu7is735sg4u7aglqxf7dec7rh@declezwqfvpp>
References: <20240304191046.157464-2-aalbersh@redhat.com>
 <20240304191046.157464-25-aalbersh@redhat.com>
 <20240307221445.GY1927156@frogsfrogsfrogs>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20240307221445.GY1927156@frogsfrogsfrogs>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2024-03-07 14:14:45, Darrick J. Wong wrote:
> On Mon, Mar 04, 2024 at 08:10:46PM +0100, Andrey Albershteyn wrote:
> > Add fs-verity ioctls to enable, dump metadata (descriptor and Merkle
> > tree pages) and obtain file's digest.
> > 
> > Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
> > ---
> >  fs/xfs/xfs_ioctl.c | 17 +++++++++++++++++
> >  1 file changed, 17 insertions(+)
> > 
> > diff --git a/fs/xfs/xfs_ioctl.c b/fs/xfs/xfs_ioctl.c
> > index ab61d7d552fb..4763d20c05ff 100644
> > --- a/fs/xfs/xfs_ioctl.c
> > +++ b/fs/xfs/xfs_ioctl.c
> > @@ -43,6 +43,7 @@
> >  #include <linux/mount.h>
> >  #include <linux/namei.h>
> >  #include <linux/fileattr.h>
> > +#include <linux/fsverity.h>
> >  
> >  /*
> >   * xfs_find_handle maps from userspace xfs_fsop_handlereq structure to
> > @@ -2174,6 +2175,22 @@ xfs_file_ioctl(
> >  		return error;
> >  	}
> >  
> > +	case FS_IOC_ENABLE_VERITY:
> > +		if (!xfs_has_verity(mp))
> > +			return -EOPNOTSUPP;
> > +		return fsverity_ioctl_enable(filp, (const void __user *)arg);
> 
> Isn't @arg already declared as a (void __user *) ?
> 
> --D
> 

Right, will remove that.

-- 
- Andrey

