Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B4179DC8
	for <fsverity@lists.linux.dev>; Tue, 12 Mar 2024 12:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710244980; cv=none; b=Gx0B2cj9y5QIn1cQJ1fTK6Lbb5vevWJ59Opi16imAT52P4LFszQGuEl0C2PRVO5FY6s4HWWZPQf5SaY+yXVAGUC/ek14+PHs4Rw7SlieVQdseB1zDVvG/C+Gn2qQpX5HFViLJ2gFyovX45pB88IBdL1Df9eM68sA04wN4TWX9/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710244980; c=relaxed/simple;
	bh=gLJ7CIvGElJrM3FH8zc5Ikyx3f1w8B64p7eGgtgMKn4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=EtOFzL2nemOlWw7eeWvMY0mML1Ih//A5bDfbH3YF+7VInZ6kzYsCyTEpW4l3jDAFBcGSr3JqBJcwyV/mit6285NLpogqLC6MARznXPMp2DLeY1cEbKXpsRgU1tyMuQKknHlzs9nHgxELJyP2yycPgegpCy6BgexkIawn90S8FBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hZeHAMtI; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hZeHAMtI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710244977;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6ZNgBnphBVUjd2R20eoaYssWgOFygTeJ0L4LhcZX464=;
	b=hZeHAMtIJcefoblhMj1c+qcjPdNi3g46nfDeVg4gbY8QTLbU3LmJg0Jc3wBsY5ZOnSpLhL
	ajSuGbGYvjhNvSKHvpntbikKCKzVLIk/xuUUjXE19fMPk0Uub3Gni2EPI/IdKAlL2UNXOL
	Zey0deEU4KIYIbdbeF5Jpjs2gcilHpw=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-498-pAFJDsQuM02Z7ZvqfUUhpA-1; Tue, 12 Mar 2024 08:02:55 -0400
X-MC-Unique: pAFJDsQuM02Z7ZvqfUUhpA-1
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-559555e38b0so4343434a12.3
        for <fsverity@lists.linux.dev>; Tue, 12 Mar 2024 05:02:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710244974; x=1710849774;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ZNgBnphBVUjd2R20eoaYssWgOFygTeJ0L4LhcZX464=;
        b=eRJo2IgXzbzSe450Ew/n36ysF4EaqJMRrZH7O9zoSfoydDYjfgvsgLtmy2yuNhDYLb
         eik+/xqsEIjltE1k0BNVQqQMKQDcdqB+f6pRRiJQVHqRIHlEGjuEhuSMqGmFcDYtrIWp
         4fvgDfWYplalBILUQss8KzjJKVzITT0s5Oir/03zZviGUrP0LA0pWUPBMfij2K+pPM7j
         z9coJCLhlp8LeVqVZY9hwLCp/ZjgvBSQje56h3QWpiU1AA8yM5pm2Ksddx/Mn4a2SyCV
         81sLC4NNhJUrTJZcHQxoreoMJujUMS3xFphdM1WSsEkS1Kkf/AFSyqWKVywdnrfkJjhk
         OzsA==
X-Gm-Message-State: AOJu0YyKFkGS+/Fokz1vLmGKe4cz+RrlbvjVF1ZOmvKVyNZC7s47Rcr8
	M/ytnILd9RJ9NT43Dlom0wMcqqPe1SBjvgkVBExHTZBUg21HW6S1KmKCpwOCYrM7ZmL9bEv9p97
	MMpNUBgmSrXKyvG84ErGb5926YxHU0mhYO9K7ff2jiK1yJQz5gmCtjJk=
X-Received: by 2002:a50:9fc1:0:b0:566:b0fc:1107 with SMTP id c59-20020a509fc1000000b00566b0fc1107mr7059712edf.24.1710244974514;
        Tue, 12 Mar 2024 05:02:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE7xAfun2JnAHXUSEV9ZQaEmUy3Cd7FlaZLul69utVqZ8bARjrEBLt2760n9Q/glLHtlZR+Vw==
X-Received: by 2002:a50:9fc1:0:b0:566:b0fc:1107 with SMTP id c59-20020a509fc1000000b00566b0fc1107mr7059686edf.24.1710244973994;
        Tue, 12 Mar 2024 05:02:53 -0700 (PDT)
Received: from thinky ([109.183.6.197])
        by smtp.gmail.com with ESMTPSA id x1-20020a056402414100b005683b6d8809sm3807014eda.19.2024.03.12.05.02.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 05:02:53 -0700 (PDT)
Date: Tue, 12 Mar 2024 13:02:52 +0100
From: Andrey Albershteyn <aalbersh@redhat.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: fsverity@lists.linux.dev, linux-xfs@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, chandan.babu@oracle.com, ebiggers@kernel.org
Subject: Re: [PATCH v5 20/24] xfs: disable direct read path for fs-verity
 files
Message-ID: <w23uzzjqhu7mt4qp532vwjd3c7triq6vfftzsmi6ofium34qic@fghx7nfarmke>
References: <20240304191046.157464-2-aalbersh@redhat.com>
 <20240304191046.157464-22-aalbersh@redhat.com>
 <20240307221108.GX1927156@frogsfrogsfrogs>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20240307221108.GX1927156@frogsfrogsfrogs>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2024-03-07 14:11:08, Darrick J. Wong wrote:
> On Mon, Mar 04, 2024 at 08:10:43PM +0100, Andrey Albershteyn wrote:
> > The direct path is not supported on verity files. Attempts to use direct
> > I/O path on such files should fall back to buffered I/O path.
> > 
> > Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
> > ---
> >  fs/xfs/xfs_file.c | 15 ++++++++++++---
> >  1 file changed, 12 insertions(+), 3 deletions(-)
> > 
> > diff --git a/fs/xfs/xfs_file.c b/fs/xfs/xfs_file.c
> > index 17404c2e7e31..af3201075066 100644
> > --- a/fs/xfs/xfs_file.c
> > +++ b/fs/xfs/xfs_file.c
> > @@ -281,7 +281,8 @@ xfs_file_dax_read(
> >  	struct kiocb		*iocb,
> >  	struct iov_iter		*to)
> >  {
> > -	struct xfs_inode	*ip = XFS_I(iocb->ki_filp->f_mapping->host);
> > +	struct inode		*inode = iocb->ki_filp->f_mapping->host;
> > +	struct xfs_inode	*ip = XFS_I(inode);
> >  	ssize_t			ret = 0;
> >  
> >  	trace_xfs_file_dax_read(iocb, to);
> > @@ -334,10 +335,18 @@ xfs_file_read_iter(
> >  
> >  	if (IS_DAX(inode))
> >  		ret = xfs_file_dax_read(iocb, to);
> > -	else if (iocb->ki_flags & IOCB_DIRECT)
> > +	else if (iocb->ki_flags & IOCB_DIRECT && !fsverity_active(inode))
> >  		ret = xfs_file_dio_read(iocb, to);
> > -	else
> > +	else {
> 
> I think the earlier cases need curly braces {} too.
> 
> > +		/*
> > +		 * In case fs-verity is enabled, we also fallback to the
> > +		 * buffered read from the direct read path. Therefore,
> > +		 * IOCB_DIRECT is set and need to be cleared (see
> > +		 * generic_file_read_iter())
> > +		 */
> > +		iocb->ki_flags &= ~IOCB_DIRECT;
> 
> I'm curious that you added this flag here; how have we gotten along
> this far without clearing it?
> 
> --D

Do you know any better place? Not sure if that should be somewhere
before. I've made it same as ext4 does it.

-- 
- Andrey

