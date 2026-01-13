Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2968038BDA9
	for <fsverity@lists.linux.dev>; Tue, 13 Jan 2026 11:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768303342; cv=none; b=pC5Ki5j8EQA2081nYgRkdxoZMidWSmkh9E9FqbQE9qkF+FSo8QYM9B2yMvqCVa2/dpYazzHaUVi7+fXXYrwnV49gln/FaqoDbrR0KcJw28TIjZrZ/ChlM/M1AfmB0ADyM904a2UriF9QowtS80qeuFpC4YRpK/vdEO4QxH7M9PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768303342; c=relaxed/simple;
	bh=bGU+byuWxoKQcS0Xj3pE6Dx3kVaO+LSqxEQBS0FaCho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=lumpMOYkr+TwoMQQYfUxBFeOHo5yYcmavmnoHgHVpj8UjUZfc8KltzwPDIECygtYLabuwXsr/GsCLqDlxgT7UXt+427d+DwRqyakr164OgoGGUnbBZ/G1KeukaayWwm2cfBoGkMq3dMNm7g1gKQiGQNVNyKr6b2rzUy7T8t3uPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Mva8FIlb; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Mva8FIlb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768303337;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FM5vgtgxBBy+mCIHGqrkC14i392iYSrQOYRpquRMkP0=;
	b=Mva8FIlbFNXsuVNBezJrXRp/zeFkJqPS/EbZXjh1sTpyyK9Ls7Io1JIVWu4lkhDetw+rW3
	RomKgL6EaXxNEjY9AEfR1yGCGAcEaB7Il+9iUvmk/nHAlbf6ZHQ04SjxwUxxUUD4YqzOf6
	k+fIjth82JhSkWS2MJqNlvgGMImI6LI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-487-UX1HaNbePdCvyl1bVbMxCQ-1; Tue, 13 Jan 2026 06:22:16 -0500
X-MC-Unique: UX1HaNbePdCvyl1bVbMxCQ-1
X-Mimecast-MFC-AGG-ID: UX1HaNbePdCvyl1bVbMxCQ_1768303335
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-47d28e7960fso76385915e9.0
        for <fsverity@lists.linux.dev>; Tue, 13 Jan 2026 03:22:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768303335; x=1768908135;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FM5vgtgxBBy+mCIHGqrkC14i392iYSrQOYRpquRMkP0=;
        b=NtQ0QWnamBWAdgPevwrKi+kI/w1EYlDGhjVlKlx3K03fx7zx1FwHJNuLm1VF5tUJ8x
         q5gwmnp41AjG5+gIuhS2FSuJCUxx7Rjqwij5IQxQC7qGE45zS3KXLfTapSYj9rG1h6Wt
         GUshlDhv1muUJM/YHLtmmyWvImNnWZ4JhPlipuPPta2a2TlWN8OVg27W9WO9jIpHYjWz
         g8dpAvSM3tutGfq3EqgIBXXB1i1jxCs3GSnT/1qWljeixcc4HbsAqBu1oPikSh7Rdy/9
         6Db4mCASGXIjCDRyY/WrK+dm8z/55wnrCEJ9G68bs2HQk3x656l+UaoJh4QrMHgdwZoR
         8JBg==
X-Gm-Message-State: AOJu0YyXOvlvYS3o9wiIrD+QdNV0kmDcCG0GpiL8j8JeH6DIn6Q8CPfs
	aSws2viij1jQt5FnSCrfIHE9MDda0GqCEdeHAGT4pu5XD45J5FwycwdRNBCL9VcWrGygykRCALE
	J2q9AujOuzJjL/BPebO+ePScGbMO7RSoEmTQUcGgHB4KMTiCuux0cbKU4/zE=
X-Gm-Gg: AY/fxX4Xgoa5vcfi2fG6G7xyrRk2bIJYbs+j3MkLvRU3KKl0CHFQcHbq6xTaPLFUQvS
	o04mXnl36uUer3t4pXbUl1mbC83QGX0+GgeVMT/909OCJ8N+mQyotWX5eDMe0i76qYVJ9bnavFl
	EwnFNA7j0zUhE3Z6ITxAeVQlOQSA9OGybFWksjf0ybiCoQ8dAo5BgClL4AbmXWI8dN3uvZHh8We
	j/zaoY9DXWhRjWWR8U7rrkgJHvKV9YgdRqOtO7qhpYsbwgSlzuUiC3Q8ZBeCTLG9xSH0SpK712e
	gbzap04TosL+D4FiHWuhmqkO3paeYfiOgQIAyZb/tepURL7pdNJtQG7e9FKSMbnKOasvkjMubhI
	=
X-Received: by 2002:a05:600c:45d3:b0:47a:7fdd:2906 with SMTP id 5b1f17b1804b1-47d84b21188mr256772165e9.12.1768303335109;
        Tue, 13 Jan 2026 03:22:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGECcWxkFiiho9xlJ0D1CGOKm8pe8jEYN9Y3nhBbyrWbiKdDM0WvmxiXd/9pHeU2AaRVbQriA==
X-Received: by 2002:a05:600c:45d3:b0:47a:7fdd:2906 with SMTP id 5b1f17b1804b1-47d84b21188mr256771605e9.12.1768303334401;
        Tue, 13 Jan 2026 03:22:14 -0800 (PST)
Received: from thinky ([217.30.74.39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47eda0e59cesm12968085e9.8.2026.01.13.03.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 03:22:14 -0800 (PST)
Date: Tue, 13 Jan 2026 12:22:13 +0100
From: Andrey Albershteyn <aalbersh@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Cc: fsverity@lists.linux.dev, linux-xfs@vger.kernel.org, 
	ebiggers@kernel.org, linux-fsdevel@vger.kernel.org, aalbersh@kernel.org, 
	djwong@kernel.org, david@fromorbit.com
Subject: Re: [PATCH v2 10/22] xfs: disable direct read path for fs-verity
 files
Message-ID: <5pr72dlwyxeel5tfi55wbe4ill2bjltbqih7kypt6mg3lpzcgj@36h6uwaa4fyj>
References: <cover.1768229271.patch-series@thinky>
 <6rsqoybslyv6cguyk4usq5k2noetozrj3k67ygv5ko5fc57lvn@zv67vcnds7ts>
 <20260113082039.GE30809@lst.de>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260113082039.GE30809@lst.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: oggcocLfK3K0UjAmQqKhRbDj6SE15_o0GSQbX00kAW8_1768303335
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2026-01-13 09:20:39, Christoph Hellwig wrote:
> On Mon, Jan 12, 2026 at 03:51:03PM +0100, Andrey Albershteyn wrote:
> >  	if (IS_DAX(inode))
> >  		ret = xfs_file_dax_read(iocb, to);
> > -	else if (iocb->ki_flags & IOCB_DIRECT)
> > +	else if ((iocb->ki_flags & IOCB_DIRECT) && !fsverity_active(inode))
> >  		ret = xfs_file_dio_read(iocb, to);
> > -	else
> > +	else {
> > +		/*
> > +		 * In case fs-verity is enabled, we also fallback to the
> > +		 * buffered read from the direct read path. Therefore,
> > +		 * IOCB_DIRECT is set and need to be cleared (see
> > +		 * generic_file_read_iter())
> > +		 */
> > +		iocb->ki_flags &= ~IOCB_DIRECT;
> >  		ret = xfs_file_buffered_read(iocb, to);
> > +	}
> 
> I think this might actuall be easier as:
> 
> 	if (fsverity_active(inode))
> 		iocb->ki_flags &= ~IOCB_DIRECT;
> 
> 	...
> 	<existing if/else>
> 

sure, thanks!

-- 
- Andrey

