Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88699350A30
	for <fsverity@lists.linux.dev>; Tue, 13 Jan 2026 18:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768329954; cv=none; b=X2iaVolOLCCeOsNYM6eAKkxsOoWvh3Dm6NXjojxlAIEgw0wun+1hROLmccYFvF0ZiMYXVD3U8sf8gm32XHRIic6pKef99PdKme4kXQJFqdbvQBJZsc2RjunuOHe0wQG3LocOSFeDv62xwz8WxErxZ5mkiTOX/89cwbs1qH1xnL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768329954; c=relaxed/simple;
	bh=qivh3wagBk/shdLYP6zydPvglQJ+blhVUa56KzR+fL8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=iDHzuNnHkz+sywQDm3vqcFJoPy78zgzkl6cXckQ1dGMrwdAid81W/rrJE3FGZx6ietZhJ6rvhhOW3+sNzsnIFOxRCjZWPeTP/dQ0zTCD/m9T7+NfFhYnO+ktMOpGe95Q3093bAZ2hnTGJmbN6gnClOltrbkoegxG3qD+vVepmL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FURWYaK3; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FURWYaK3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768329952;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3sW+QU0VGV+EprjAG2KGpy+b5oDyp2QtdQx40jMcQqU=;
	b=FURWYaK37VA2kEEKxJlsmdI0TBWqCvMgFhGShYbqBKs4zDoaOBhsfxjsbi22syyiTWTSoL
	q96uqBO79DK/Mu2oWyWHizyAo543nHfp6SSECsHvc18EK1eCoE2g0LItT4MdsoXTObuTm4
	6W1Ks4ce27MaK9ffSl5DoBAOVxbvOU0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-400-7CBtQ3_YN9av3m74znuirg-1; Tue, 13 Jan 2026 13:45:50 -0500
X-MC-Unique: 7CBtQ3_YN9av3m74znuirg-1
X-Mimecast-MFC-AGG-ID: 7CBtQ3_YN9av3m74znuirg_1768329949
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-47918084ac1so72415235e9.2
        for <fsverity@lists.linux.dev>; Tue, 13 Jan 2026 10:45:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768329949; x=1768934749;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3sW+QU0VGV+EprjAG2KGpy+b5oDyp2QtdQx40jMcQqU=;
        b=iAQC56wIQ4bkUrExUbpoIgDTKZA+cKcZ50uz1wPDXAZOyOfLpjXtCRrEiFmCQrfnCV
         eE0RneLlwZe1gUPCsyOJBRq236zf6CEoCeUwRd9AjOLEdlyiTjmVB+hjHxgpXKQorGhN
         HKw2QoH2qj0W0AMjD+ll5bLdP5p6As3wxw+qH3jCVxIk+SZBwCa9Omhjzw+qKcZtdwpe
         8DDjVmTgLOCqMLCbGby6R9OVKdLpbmmhcgZMGaKXtMBHvWPglSzS9/JRRcQ1BABM3YEd
         b6NVIGKgTH24m5GqGT16QxpoKvWOc7dOEx1TDmOO3Ydd8p0bMHbfjUHNdvxi2/5moCoZ
         O7zw==
X-Gm-Message-State: AOJu0YwnRObLe8pPzJrBhM0PQoNT7cW6dv1bPENZY8ffgSZ3te+D+QrY
	tJerm33H8H3XsKWFM9qb1rRV++16wUXO8FuOfp+SqUv+HuuPLdKmfUF6NqSori8RCDLX9sjjmER
	XOg3sXjzfkRfcZF37PCDeFseabtMIsqCnTj9u0UB2eTE711N1oWc/2fdxLvZ9pPbMVDY=
X-Gm-Gg: AY/fxX45Xq2rINniL7RNyLxfYls/1YTkginNZYEbUCYdtNptIDq+n+M2Q7LbEe1V/CN
	0S9a4f+8jjOHUge/4PcWW1Jd9QwCYi0gfZ4vh9wdJE3cbeLYonvimpma09ty7hGFGf29eEk4liD
	5uGkDYKmIXMP+8BwJqcOyVpl2mFXIFBS5UWMJmNR6kphs5InOTx+fUTM7zGstwB5xhYaM49oyZ/
	S9vfgOhJ3tXDLuEEA26u76vK1EXBRnOMtogsg2OGey3gfwJ+Nacmr0AXQWloIns+Qx531QbXZp1
	XPrjCR6KO2bOAZ1iLRtyJL2/HxlADXeQDrf0mUJNGhsOuFlO2gpOf7ti3ABPus5bNFseeMnqzYM
	=
X-Received: by 2002:a05:600c:470c:b0:47e:e2b0:15ba with SMTP id 5b1f17b1804b1-47ee32e03edmr2480875e9.8.1768329948837;
        Tue, 13 Jan 2026 10:45:48 -0800 (PST)
X-Received: by 2002:a05:600c:470c:b0:47e:e2b0:15ba with SMTP id 5b1f17b1804b1-47ee32e03edmr2480595e9.8.1768329948427;
        Tue, 13 Jan 2026 10:45:48 -0800 (PST)
Received: from thinky ([217.30.74.39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d8384646fsm384816455e9.15.2026.01.13.10.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 10:45:48 -0800 (PST)
Date: Tue, 13 Jan 2026 19:45:47 +0100
From: Andrey Albershteyn <aalbersh@redhat.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: fsverity@lists.linux.dev, linux-xfs@vger.kernel.org, 
	ebiggers@kernel.org, linux-fsdevel@vger.kernel.org, aalbersh@kernel.org, 
	djwong@kernel.org, david@fromorbit.com, hch@lst.de
Subject: Re: [PATCH v2 0/23] fs-verity support for XFS with post EOF merkle
 tree
Message-ID: <op5poqkjoachiv2qfwizunoeg7h6w5x2rxdvbs4vhryr3aywbt@cul2yevayijl>
References: <cover.1768229271.patch-series@thinky>
 <aWZ0nJNVTnyuFTmM@casper.infradead.org>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <aWZ0nJNVTnyuFTmM@casper.infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: CQbb6Itol4XLumahUWISwxk9zg7Go2gE5SaY6kaJSng_1768329949
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2026-01-13 16:36:44, Matthew Wilcox wrote:
> On Mon, Jan 12, 2026 at 03:49:44PM +0100, Andrey Albershteyn wrote:
> > The tree is read by iomap into page cache at offset 1 << 53. This is far
> > enough to handle any supported file size.
> 
> What happens on 32-bit systems?  (I presume you mean "offset" as
> "index", so this is 1 << 65 bytes on machines with a 4KiB page size)
> 
it's in bytes, yeah I missed 32-bit systems, I think I will try to
convert this offset to something lower on 32-bit in iomap, as
Darrick suggested.

-- 
- Andrey

