Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA2433C1B3
	for <fsverity@lists.linux.dev>; Wed, 18 Feb 2026 09:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771407796; cv=none; b=SLnDywo21On2Tw9LMqi9e1pd5SVnr2SmT38M6ep6sVeBAstAN1BZ/YRJiwBCkCnrGKZtONeoo2BemDJc5tE5WNoO9n4igg67U5etjoFggeQSEjxomkRN2WCpe3GNyEOmowAybQYXnXLBkYe9hz0IupY0EKTfbYCWz/enjcOuOrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771407796; c=relaxed/simple;
	bh=7MlMSQiD44nGkm9QdFDfkQrwjXCe6pqty82o5oGxOvs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=K6hJaNjbzgXJF0ImXk9xlrykmH2g2Lx8lhSNq344OsbrA3afUVqatX7dSTxGwI5WSYKqNbIOJ9LgZ1yeOVnqJLVHLenUciSaIyor0cnmGABcJ9qD/mxrTwkRa2EW8aJIibLQobey7Et5vHx+uD4KfbhGLYmplGAYrLXefr6tRoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JHnyFxlc; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JHnyFxlc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771407794;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=acxJsX/Fq0LQyGsW9dYw2IB/+V+2/p4bzlJYGYuBU/A=;
	b=JHnyFxlcbukAMrtuuohPJmaVQJLCKJHtWzgkgtVwjgnE8kbJRfKWbGhTpy9HF91QrQ1VwB
	8vMymtz7PBoVjpgzKjkuOHXK8f2060PWGdmpDP4aYEo6hKe1/+XlHD2UMKjlWl1DPnIhsj
	IS0f1bU0D/xVsUYFeK4ZCpf+fBu8cxI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-211-7660MGCUOYWbWNivmgKLhg-1; Wed, 18 Feb 2026 04:43:13 -0500
X-MC-Unique: 7660MGCUOYWbWNivmgKLhg-1
X-Mimecast-MFC-AGG-ID: 7660MGCUOYWbWNivmgKLhg_1771407792
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4837246211bso53715675e9.0
        for <fsverity@lists.linux.dev>; Wed, 18 Feb 2026 01:43:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771407792; x=1772012592;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=acxJsX/Fq0LQyGsW9dYw2IB/+V+2/p4bzlJYGYuBU/A=;
        b=vl0SY4IYWkqY6tP6iijBL4lpDlKKVPFC5F6VzaMQiAPLge+B5eGcQ7amoIwH1m5py0
         PU3WemaatQwdxnZq+tZucXyHi5tqYh32Jl7Vh8EjuNxUwVVFKg6TeS2+GsP3nfi1jm2D
         mr7t1cSBFT72REdBAhGNVDryzQ59mKRtaSDonLTe5ClkIexvBvmMKeVeGD3TY8sqg4b1
         iPC9LKUA+LkPeBSsb9b5sommrruPPsSRzY8kjkO39C9Tmyo4c4tSyX8a0eXClcuJrvRi
         gc72ydvmCYxr6W+rpYcGssBYW7x0XNzDayiGAtKv6Kqij2VKGkuxIflQ0MvIdfllIdgy
         x1lQ==
X-Forwarded-Encrypted: i=1; AJvYcCViKU/kAGFdE/gc/DlWotsdoS0Hzvt3cEbyK5UIBLOxnVJhz/VEf1k2wkcwmqzqYCVElqUHKRFHGA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyXDIgxe1H9cyIYRuxv5Nzi9t+JFLpN0C30mq1aY3fbhwQw8MNs
	jRPHrs7UY8uAGAoxqya5lAMH2Wk9cIAoNvqyofjg1XCzABo9hw3Zm8KX7FxbfdcckW/hgh4SYNY
	AUfrcFBth4bZ83s9UdTO5XFIz5XWBqZwK8XAqgshbWysKDPCNKETSfVcbXhI=
X-Gm-Gg: AZuq6aJiiuzAByvbP4U2v71WU6ImGuxdeGRCt6c9OQb9F3DNyxEGDujD5xkCRPWBXXu
	2VH3fCv8v4okDqF7bsFhN+m2/bggH7g12rXiCDu9h7c6w0OZp/9kBBUsy4FaL0pRy9PEgJyEz9O
	rT0rf23lr898RRkOxE2vxM2UU6YpFB9Ltu1Ih00t+UCN1NUyiLEFVQ5f+kll5T1D3IpspEQFyyc
	W10lGlHzpCzZrmm8qCZVLXByLPPfVdGnqt+z8Q64iTc0zzEAAaDdShYIvvr3YvoVKqbu0AnTRrR
	o9RSJjTmRj+NV9apvcFMRgbtLdylQjHscQ7wHN4NUG/VjVYSHhNdtdqfv4VdGuNjqQbq9f5i1zZ
	Ec4Qyy/E2yrc=
X-Received: by 2002:a05:600c:3e0c:b0:477:76c2:49c9 with SMTP id 5b1f17b1804b1-48398a65ecdmr21410055e9.2.1771407791616;
        Wed, 18 Feb 2026 01:43:11 -0800 (PST)
X-Received: by 2002:a05:600c:3e0c:b0:477:76c2:49c9 with SMTP id 5b1f17b1804b1-48398a65ecdmr21409665e9.2.1771407791053;
        Wed, 18 Feb 2026 01:43:11 -0800 (PST)
Received: from thinky ([217.30.74.39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796abc85csm40263806f8f.22.2026.02.18.01.43.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 01:43:10 -0800 (PST)
Date: Wed, 18 Feb 2026 10:42:40 +0100
From: Andrey Albershteyn <aalbersh@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Cc: Andrey Albershteyn <aalbersh@kernel.org>, linux-xfs@vger.kernel.org, 
	fsverity@lists.linux.dev, linux-fsdevel@vger.kernel.org, ebiggers@kernel.org, 
	djwong@kernel.org
Subject: Re: [PATCH v3 13/35] xfs: use folio host instead of file struct
Message-ID: <jvxkaf73yuudonjcu2uoazt6yq33ievjo3js43lh4amrwrb5gq@7sj7zzcv2jfl>
References: <20260217231937.1183679-1-aalbersh@kernel.org>
 <20260217231937.1183679-14-aalbersh@kernel.org>
 <20260218063234.GA8600@lst.de>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260218063234.GA8600@lst.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: XzNhQglpBJSMyAYi6Gi-cYIJ1w-8N5R9i0uyTsiiN1o_1771407792
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2026-02-18 07:32:34, Christoph Hellwig wrote:
> On Wed, Feb 18, 2026 at 12:19:13AM +0100, Andrey Albershteyn wrote:
> > fsverity will not have file struct in ioend context
> > (fsverity_verify_bio() path). This will cause null pointer dereference
> > here.
> 
> FYI, I've included this and some cosmetic cleanups in the just posted
> updated PI series.
> 

aha, thanks, I will drop this one then

-- 
- Andrey

