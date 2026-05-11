Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2919936E489
	for <fsverity@lists.linux.dev>; Mon, 11 May 2026 11:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778498148; cv=none; b=bmn0NUO0WCzQeN/IxrAAygD9JO5TxuVVPHsXctoSJnUz22HD4syOdmq+J3Rf8j588Hw2F6x+4Qm09dK0j4HrW8QmHO3vLUWfsAeAE3MEHGJZsY4vHD2ARikkjiANgbv9NHYlpQ1c124WyWwe6/TT4pIn+rHTpqecnzDFl1xiM7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778498148; c=relaxed/simple;
	bh=RR1NenBgrAYdu1c55iySbUR6WPCvJPcX8MV/1pGj/Aw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=rvwYC7Onv9/x2OdtSw6hJzew5AONDpUIlfquP6gy2zWwLMSFS8U2bWVaZQU7anlhg+c0fU5kTi0UPhyFXpGD5VwqXzFiOwMvJ5cegxrszGtwe69+PrsNOAq8MjAy93tHrs7vNaMl/jSSSOm4183beb87iwTwYenzH/yjcpt6myU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IlLwuKIt; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IlLwuKIt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778498146;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yQi40JXMVWHDZRjke+rHrQlcRrLFkKa2WRv/wpGjnDg=;
	b=IlLwuKItqCC/e2dJp+CtZBVs4Q42EFIS1Td4DgQltJTZc2ZFmusRFzeWS//BGNWIQU3URQ
	/y4lvWa667bE43QUz1pYA+JS1lw0vl7bDkwlYvjnCw2DuGpvPK1+hr/u+L2kdf7eSEqENT
	jSw1mh0/zVPa+OqEb8HZArCRybrDoRU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-97-H1eusPM5NjuxLLEXJ6Gjrg-1; Mon, 11 May 2026 07:15:43 -0400
X-MC-Unique: H1eusPM5NjuxLLEXJ6Gjrg-1
X-Mimecast-MFC-AGG-ID: H1eusPM5NjuxLLEXJ6Gjrg_1778498142
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-48a5952c635so48432205e9.2
        for <fsverity@lists.linux.dev>; Mon, 11 May 2026 04:15:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778498142; x=1779102942;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yQi40JXMVWHDZRjke+rHrQlcRrLFkKa2WRv/wpGjnDg=;
        b=XYvg8xP6VHeyRHDDmmVAp4pd4s2OZmcCy7P/4v3pCjJf7L+l9bjoRBSWzCpVXYCMNg
         0/Mxq1zcD171ZtvpGs3p77GiMB1GkXbELE6pTTLOjpkZxdXUswGv9IDS9qiJOS3MqlXG
         BqyM8Q5NFEQn+ajjykA853oVgEB7gF3N5cP9GSgwK+NEVnBkU1ALOotJXLOehDOCMH+Y
         ob4ogVJb1Ikc1/VkT+KlS1VBYnai6FbbJ6P0xDcNpPpxeSiDsALwsvPKUEJTKIluR7Km
         t5Udx/tOFVKRA0mqhnWe9Al6oFPfKIpK26DsaaHwEki/bNwfNhXoFmFanX7S0llzCmQu
         1Jjw==
X-Forwarded-Encrypted: i=1; AFNElJ90ot/RN/j+Q3piVbA5UemvnaVp2wvxPgOE9fvFEfBacglsNhFVOTzYov+f1saET5OhabjOquEIiw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwfAfImi2KpaIm9l/GjjbxPFovzkFCr7Zn9wKk2RtR1pA+05StZ
	CLV+qDb6W6slsagZf54NBqcH0HQUSRMKeL4yJYmZfJ97rKIAFO8LRphQ65Sbz5j0UB0+58xQHSw
	TlC3AvIRRBN1TpO//C5afGVVUVkJQKrr1v/cpgcEB/JF/iXmyYynjSYQP+84=
X-Gm-Gg: Acq92OFOiZ49A3Mcr7xSAaPEe0i7M/ADGW63ASturFwFnUvlQVhpU5/nwnowTY5U4Qu
	K+blUzcwOZE7N4S9VmnPliG6/MAQ59BG4a529ZrwVJborJyQb+pS+IjYu50+OYQ7fl0WwPiZ0EH
	OKHmJk63SPYG8CjK2u3Vr/J6OHZDNPs6Dngb2SXOlZiiQ2oL0IAsbXnw4bcbopJ4v6OJ2MHtATM
	Fikw0UzeWyVfQB6TdLLQYnM4otE2QvRZ6gJKEZofRLN+VW7ueqp8E/rFK0yLEwViZ887nj3B3ZP
	ja3STklMAOxXuwgD6zd9UPQcA9FujQyjc97kvq3Gir7DKPHHcWDwr0bjM29wm00u1y/0AZwnNn3
	S8EWph0U5qnw=
X-Received: by 2002:a05:600c:1f89:b0:48e:8741:fd4c with SMTP id 5b1f17b1804b1-48e8741ff98mr21083655e9.18.1778498141661;
        Mon, 11 May 2026 04:15:41 -0700 (PDT)
X-Received: by 2002:a05:600c:1f89:b0:48e:8741:fd4c with SMTP id 5b1f17b1804b1-48e8741ff98mr21082605e9.18.1778498140980;
        Mon, 11 May 2026 04:15:40 -0700 (PDT)
Received: from thinky ([217.30.74.39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e7040a9a9sm309872515e9.9.2026.05.11.04.15.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 04:15:40 -0700 (PDT)
Date: Mon, 11 May 2026 13:15:39 +0200
From: Andrey Albershteyn <aalbersh@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Cc: Andrey Albershteyn <aalbersh@kernel.org>, linux-xfs@vger.kernel.org, 
	fsverity@lists.linux.dev, linux-fsdevel@vger.kernel.org, ebiggers@kernel.org, 
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
	linux-btrfs@vger.kernel.org, linux-unionfs@vger.kernel.org, djwong@kernel.org, 
	david@fromorbit.com
Subject: Re: [PATCH v9 00/22] fs-verity support for XFS with post EOF merkle
 tree
Message-ID: <hnsxzymuydf5evoxw4chao7rkixm4eafolebxfjtsqschgfazh@nll3fdfnsigx>
References: <20260428083332.768693-1-aalbersh@kernel.org>
 <20260507055217.GA19888@lst.de>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260507055217.GA19888@lst.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: aqVMNdyJI4GlLIciCMzOdHqBWy9b7jR9wiVAr6Ppew0_1778498142
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2026-05-07 07:52:17, Christoph Hellwig wrote:
> On Tue, Apr 28, 2026 at 10:33:06AM +0200, Andrey Albershteyn wrote:
> > This series based on v7.0 with Christoph's read ioends patchset [1].
> 
> That's not a good baseline.  We'll need it on the -rc that has everything
> from the current merge window at least.  It might also interact with
> the fsverity fix that just went in.

Sure, I will sent v10 with a latest master and that fix soon.

> 
> This might also be time to come up with a merge plan to figure out through
> what tree(s) to merge it as there don't seem to be any maintainer
> objections.
> 
> 

-- 
- Andrey

