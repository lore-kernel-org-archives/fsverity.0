Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFB163D1CB2
	for <fsverity@lists.linux.dev>; Wed, 25 Mar 2026 11:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774438890; cv=none; b=gLguzYXw72Xk7ie3QIIJuvWrpgXkpl772wTwUvPZhcQESRynfAtoRvxgWRzTTo2ewWMjJEyWAD9TQtpkI729TC8f9XlEJCGn61c+xrAAZJzjITjqKGDf/bO79VZigMp1UK5BRmjWppQWNE6I5Y48MsN2Kv0mvX7K4Jyhyb5sQhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774438890; c=relaxed/simple;
	bh=ld1uLQcQ3wX/aLoEZ5yp05fFuiyLeeDey5H16fj3er4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=bg0YwA9b/FMrPguQQzHv0L6vlq8ORnhT+8uT7zmxkhYhc6N5HiMiwdUDANbzSD0nX4AEdKR9JI5FA9ygGvNhUEcVPm5xRWLK4M84oSesbNlFvuK/oj4MOYkR92nLO9URjWtZ3jx5vVeruIlbfFFZKz5UYqs9eJjRT+tZUbpnwKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UpeHMCGI; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UpeHMCGI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774438888;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1xEylKt1sFxQZZ3xBGKJ8RdOSFC0up8CAh1cSzczQVQ=;
	b=UpeHMCGI0OWvsjQMOVzzC4cLslpISysz/kVkR/sZ7aKRK3Sh4CIQRuKbRBB9zDIf5djghI
	5gzo+6rmKZK4xGgR1i2MABBpJQAHMG6hIDNnXIpLSCgvbl++AercDjnevy0+7HE/vcva5W
	QpIuhJAqQfecAPQApahcjNHWSfc1wQQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-670-9ChKfTYQMkevwzy7gm3iSw-1; Wed, 25 Mar 2026 07:41:26 -0400
X-MC-Unique: 9ChKfTYQMkevwzy7gm3iSw-1
X-Mimecast-MFC-AGG-ID: 9ChKfTYQMkevwzy7gm3iSw_1774438885
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-439c54e0f6aso652398f8f.0
        for <fsverity@lists.linux.dev>; Wed, 25 Mar 2026 04:41:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774438885; x=1775043685;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1xEylKt1sFxQZZ3xBGKJ8RdOSFC0up8CAh1cSzczQVQ=;
        b=rcAemYPfUdK5qwZwqGZ/npTcdmkIiTjlEc3Kt08y4qEx5tCovEStZMLEXduNKbQ17K
         qD5XM06rM2UbDdo9APvQp6pIK/xspQkU3tXaVtDfZO+vMTZnnm28sSC9INKbu2ZChVzT
         9AaqADEtLDJ7k/JP3gf6uJoYWJ3jj0fNsj4CvxKBxMT25iTu3o85n8rYtnoSbtbcBW44
         +LLiqdxdHt8MpqX45zxBG8hH7a3KvleigHbapvw+VEBSMQqv/osV0oiP8BqARY8hW+YR
         8SfPBh746MzD1oH+/sJ84Nvt2ntRkX5VBSU6w+G2iFso+pMWkFxjDutGPYpT1+B8A/wF
         KM4g==
X-Forwarded-Encrypted: i=1; AJvYcCVNUTZx2QUYPWAUIf9OYRr6s+dOlZENH+C0O1SxL4LL1mT2mleuz5ejzk2QEKjpEwCLkaIVziMBcg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxETD5MSTacim3d1pSr6NJrJH+HNnJ+vKp0kc54UiyydTcqht09
	QzE9mg6koxmfuHr2D5rqB0aiD4o4I6Kc5cYqliuha21VITsiyf8gPQI6E2H4o2fdBd67PW0RnZP
	HT/0tdkByc8ouKWQkYIPfw185UGDrHOhuttRnulO8JjDdR5Ao1OPbDVpr8AA=
X-Gm-Gg: ATEYQzwwqyVXeQPzpeEi+hD+BiYufPKSBWUflqnRLRvY+NKgEYTxLcRnUDt74M3VNli
	MeOpDmRwJhIN8w4dUN83/WumPiV94cEOK/vDcQFHcqbr3jy0rgwLrgbeXEa/wqqi0GyYTKY9s9d
	+Zo0xz/gSTycfHXCz2JTJUAiFdJam+BnxNjliyY2HqmDbSTlpLGehH74udY/IHZmJ0Hzpf5+jTi
	y0nZUK8ZWevrMBaQUHPCfbhyF2ZpcN8HRq1UqFMzhzr2zfcu6lHwYTxr6L9OVr7Ta2NIgtJWAeQ
	Rf2uWNGjbP2BE/8f+2D1MjWMnUmxL9kCIX09pqn6Abx4nq9Z+2vay+SV5mXZOk0AcWiSOv20we8
	5hCjhyXIok1ZcNw==
X-Received: by 2002:a05:6000:2a09:b0:43b:425b:ec3f with SMTP id ffacd0b85a97d-43b80526465mr7202979f8f.4.1774438885311;
        Wed, 25 Mar 2026 04:41:25 -0700 (PDT)
X-Received: by 2002:a05:6000:2a09:b0:43b:425b:ec3f with SMTP id ffacd0b85a97d-43b80526465mr7202929f8f.4.1774438884770;
        Wed, 25 Mar 2026 04:41:24 -0700 (PDT)
Received: from thinky ([91.245.205.131])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b6470c239sm46289550f8f.27.2026.03.25.04.41.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 04:41:24 -0700 (PDT)
Date: Wed, 25 Mar 2026 12:41:23 +0100
From: Andrey Albershteyn <aalbersh@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Cc: Andrey Albershteyn <aalbersh@kernel.org>, linux-xfs@vger.kernel.org, 
	fsverity@lists.linux.dev, linux-fsdevel@vger.kernel.org, ebiggers@kernel.org, 
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
	linux-btrfs@vger.kernel.org, djwong@kernel.org
Subject: Re: [PATCH v5 01/25] fsverity: report validation errors through
 fserror to fsnotify
Message-ID: <3lllvimldwcgi7crh3kgwy3a5z2ng2ugcka52ab47o5mwx4dnu@xyzbelhykn7n>
References: <20260319170231.1455553-1-aalbersh@kernel.org>
 <20260319170231.1455553-2-aalbersh@kernel.org>
 <20260325075402.GA952@lst.de>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260325075402.GA952@lst.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0xp1gcE8AYOpHmdOWvapMOZz10e5PatROOaJGdZQM70_1774438885
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2026-03-25 08:54:02, Christoph Hellwig wrote:
> On Thu, Mar 19, 2026 at 06:01:48PM +0100, Andrey Albershteyn wrote:
> > Reported verification errors to fsnotify through recently added fserror
> > interface.
> 
> Looks good:
> 
> Reviewed-by: Christoph Hellwig <hch@lst.de>
Thanks!

> 
> Btw, would it make sense to enhance the interface to tell why the
> data vs considered lost?  i.e. checksum failure vs

> (part of) device disappeared?

isn't it something filesystem should report even before fsverity
gets the page?

-- 
- Andrey

