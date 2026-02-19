Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AECBF305976
	for <fsverity@lists.linux.dev>; Thu, 19 Feb 2026 13:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771506017; cv=none; b=ScvqM4WwYrh5BlCHMwOqK0axyAAAbmj78gvozPP7k4vu44j8oydfTy1A3F1KAbDgQFAjvzAfR8vdY8u3u9bskuGnku84MLI+57d8z1RJlGfSdyDq/rqfD2Yy3sHRvgUfPg7UCVFXmOMzGA2nkrIY5DSMPRdhMIlpjJ9NjDJ8i5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771506017; c=relaxed/simple;
	bh=hlu4srWB7+MTqqrrEztAIVIK0Nl3yD8y6slEbQdtLUQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=cEs15MAVrBwt4JbVLzZPaIqJeTCz8mvJcZdY4ZA5mUbxZ0r5FZC0iLd5FQVgFS2EaIzzH6XpqzV2McYOKadm/ef0kpEHjImmNIKPuIZ/6U0lxxtY9mos9Wyst08c04q1j4y5ddyp+OPmp+0dKAcxiNofE7v0fPW0JJ7w0EsnOLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YOEglM03; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YOEglM03"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771506015;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YRdmcSb5fRzx6pFuColKu/1eTpEZSmutbO/RV80LleY=;
	b=YOEglM03njEkyNNheIA3lWvSyRMPyPtVfyaHlito7O3mcFwvk4SY9ZcyhTAv7oPA7bUaQs
	TERtOCVak21RcoC1dO7zPEVW6idwDEJOCVmHShd0nl581XSWVndbSq3nKfXNe5w0iMDiwd
	b2OyKXl9w7YXb/gpC6l+iyZfJJSciII=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-508-gRgT0K_2Ot60ql97WEoYlw-1; Thu, 19 Feb 2026 08:00:14 -0500
X-MC-Unique: gRgT0K_2Ot60ql97WEoYlw-1
X-Mimecast-MFC-AGG-ID: gRgT0K_2Ot60ql97WEoYlw_1771506013
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4837cee2e9bso7184195e9.3
        for <fsverity@lists.linux.dev>; Thu, 19 Feb 2026 05:00:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771506013; x=1772110813;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YRdmcSb5fRzx6pFuColKu/1eTpEZSmutbO/RV80LleY=;
        b=ezlOdgbq88PA+2JKJJfe1rilNEDEj2uPb/FLPhymAiilOYNIoDVZeNRTLePTc48LfN
         oYQscvcT43zmkCq6rWjzkzYSPQfIMyW031E7nBzhECMXlUDnunqNtBjBgHw7HHXvS/31
         RLkae8vOhEI8kW9eePBiNw/G38xPozr6voy2mum+a1BDeZAmVMg8yiV6ZIzwdff2vQTS
         1jI8KqY9yCUnVx4rcDu0a8fmu4JurCAP3CjueiZHawfWmwxCsS066cBpI8kYdV8LARf7
         3QCAcFWklY2MAx4zs2TE8uL/uTbZ55qPaCg5v5fqtN7BIxohTlLE8gnuHVRZ/J+XRSuJ
         jufg==
X-Forwarded-Encrypted: i=1; AJvYcCU9GYnhYA89S0n2sHWi4a+1jN6s0mdv16/Qj/9gF/6G5mO1BKBAWqdQYth+TvQ+KMSJBceHlwXMZw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw6C+uIlNpqlJnle35HbMutptWRlKE0d/AC0DSUqRgO/4Fjfq5A
	AIMyQ5dXJUI98+fuXRdoMPzLBPGCWy5WyXPWyqkKsuZUe1MxsA2YxZYj1C7S2g39M4/cLBdtTqF
	2fgtdD8re0qbRkp+MsMLUNv8mbghuIT1WxVegFn7FIpDHQr8GsLvFeFxMmIA=
X-Gm-Gg: AZuq6aJKJ08GcJxJvfjysuVzkowfCtmOjpBuF+hoHHTcTytOCJioq1D1qfRkbs52q7G
	GmBFjvoCR1XRVWdH5z0uFWjw/QpL+D0eA+9C230I2cNLqqmaePn6c+Uc5dC3/O/R5uult2Z0tkc
	bGG6mM4XjbqEOo5IRBjmnlfItZtWsvmxjP9VNRd5MZSjJJhlI3DVZz9+0tbEPVqGNbpmV6SL4CY
	sbZQ6gbGbviHJqQNUMiD4KhfloLdyKdVm63G/AymO+GTkq20Qo5CzjAZrqFhf6bi/XVqpuY/ylU
	VTol03R81GmNiMFXEeXh2yLpgYnNccRS/KnCNVa9/8WwPKDY3A3Rhbjqp2LYh5osEvMEOX4QW+f
	l9PFsavREyzI=
X-Received: by 2002:a05:600c:8189:b0:483:6f37:1b61 with SMTP id 5b1f17b1804b1-48379bac876mr281468055e9.4.1771506012861;
        Thu, 19 Feb 2026 05:00:12 -0800 (PST)
X-Received: by 2002:a05:600c:8189:b0:483:6f37:1b61 with SMTP id 5b1f17b1804b1-48379bac876mr281467615e9.4.1771506012330;
        Thu, 19 Feb 2026 05:00:12 -0800 (PST)
Received: from thinky ([217.30.74.39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4839f9835f9sm16027655e9.19.2026.02.19.05.00.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 05:00:12 -0800 (PST)
Date: Thu, 19 Feb 2026 14:00:11 +0100
From: Andrey Albershteyn <aalbersh@redhat.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: Andrey Albershteyn <aalbersh@kernel.org>, linux-xfs@vger.kernel.org, 
	fsverity@lists.linux.dev, linux-fsdevel@vger.kernel.org, ebiggers@kernel.org, hch@lst.de
Subject: Re: [PATCH v3 04/35] fsverity: generate and store zero-block hash
Message-ID: <uty67fmpx24hs7ecrgb5ewjhdwl6gxcwm7mosfsfstl5ir47qr@52amkzbbvilv>
References: <20260217231937.1183679-1-aalbersh@kernel.org>
 <20260217231937.1183679-5-aalbersh@kernel.org>
 <20260218220433.GD6467@frogsfrogsfrogs>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260218220433.GD6467@frogsfrogsfrogs>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: N6KV-6x5aZS04f-XbR-LFJes6jGjS_s1I9BNcC2bNwQ_1771506013
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> >  
> > +	fsverity_hash_block(params, page_address(ZERO_PAGE(0)),
> > +			    params->zero_digest);
> 
> Hrm.  At first I thought "Now that xfs supports blocksize > pagesize
> you actually need to compute this with a zeroed folio."  But then I
> remembered that merkle tree blocksize != filesystem blocksize.  So I
> guess as long as *fsverity* doesn't support merkle tree blocksize >
> pagesize then this is still ok?
> 

yes and this is hashes a single merkle block from the page, so only
zero_page will need to be updated to fit merkle block size

-- 
- Andrey

