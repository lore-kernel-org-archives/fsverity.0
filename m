Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 935373DC4BE
	for <fsverity@lists.linux.dev>; Wed, 11 Mar 2026 11:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773229250; cv=none; b=a6KBKGu+6X3l82IxU++CHX9rwJsdTF4bCG78GAbx0OberO0g7dPZyJmWau6JLtO2J/oPj5ibHjAX85NB+G7mMDfRtoUAM73tqe8auxvoU7Ih1KZEseZNj+DePvaLLXLQEcitHEjK+3eCWglCTQSqxuxPrmF8R4x8CPKzaJ17aS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773229250; c=relaxed/simple;
	bh=20znycAiWYwgVpDq1AEoFnk1IQDyUcy9AAi5peaAKMg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=lonIIMS6VWngV0bSdpAiuhpxlW3xDnnCqnEFNQe50y5WMscn2WizkuJ+3v+yKhxHG8zUqw/lyqcQH2SxbHYhdD7Ujts25GrDBro8O1vNQN5bMYXI9a1rFtbO4WvldLu/pVf+I90WLP0SUI5h1FaJMr/2NRSosGcK3EO/bESHMjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JPxldiaA; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JPxldiaA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773229248;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hghvzVba1q/xAQn2tH8MfPNoAAIYmfTOne/cK1QhKyo=;
	b=JPxldiaAezuIdMZKc5FA8pyHzrazYiIEcDXAKHki8Ekxa3oIowJuqy4ar1bkfD6KUB8o6W
	I1kybWT7TyX9JFKSJo/8DhOEEKxtjDkC6ZEups+On7QLGw7f9UYfFm9tLvDW94axHqZ2g9
	rvq1W25zuRdrA+2uIBifs1oKLKaivQY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-528-CMSc1hbBM46rO1PsEaQ9Og-1; Wed, 11 Mar 2026 07:40:47 -0400
X-MC-Unique: CMSc1hbBM46rO1PsEaQ9Og-1
X-Mimecast-MFC-AGG-ID: CMSc1hbBM46rO1PsEaQ9Og_1773229246
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4852ccff333so44514905e9.2
        for <fsverity@lists.linux.dev>; Wed, 11 Mar 2026 04:40:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773229246; x=1773834046;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hghvzVba1q/xAQn2tH8MfPNoAAIYmfTOne/cK1QhKyo=;
        b=aVUXEijkWaLT1I/vF/Q0o01Y9TJ/oyv8Xt4FN7SMAcWvtncbxBQI2Pf649LErFMPCL
         PZIAWTzPxlUFCgXJVq2bE2QQekv+wxFVuLg3wPIl72MK7UqYf5N3CYUq5qeA3JfiJBFr
         VYgvhGP3YheQGTl1dOjf6JkeCievPE4VkcJUD18v280UJnnc2srURebkjdo91DgTEn5k
         WRtVN3GqDX/VDC1YWlNF+Bpyp2sRNvmo/ZBjFZefZYP7iYB5hwNZPo/Drp9Q1ym6GEtj
         PqbUnL3sOaQ0c9pEDh9VhtGCua5TzZfZ9GifnxY+vV/9RQd3xbrfuY/DZ2gUlngfFGlL
         vc8w==
X-Forwarded-Encrypted: i=1; AJvYcCUH2VXm2lNGPIt2X0dr+SwMs2/B0YsTIFzctKxJ/h7kd2VWVmwy+hDzOvNOD7wdLNORrvG0aU/4Nw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzbrnpXCCkO/XwPY9tmMive4MBllQzOiahR6Mjgjczp5CFckD8q
	ACE1dLu6tyir9Dw4L3I4YqMEyYtNjS3dnRZAQDpzyLBiGvt865IyMrOhW8kHLkk3mEXtTU00zS4
	yuE+Q5Hj8xRTsnk+Q20sYrJSVZKoq6rwrTF37q3U+EXctSVRCHQwiG3KFL1o=
X-Gm-Gg: ATEYQzyq9CbskhTcwR37SM3UKTl65ukrSkgkidPaKwprc+OlbQ4BzmKeZ8SvQvJryEK
	fP+0qZ4ufrPM6MRH1plSaEiahjlP9QTyvb9HaMwnGXjILWpB1VcYNGx7PWBnCO8couDbFudmew+
	E0A8IaQUILOikCjvco9zTTOqqxzh30RD48PUpG83AfoLNFLEYBYDdMf3YhxuqfrS3Ev7U/rsDMQ
	uBweDTHPOHvXKgaYTbsqfv1NzYPaz1XWrKhm+mp4Ah22eHYeb4oLcbl0l5qaFccEvATU4yVoz/G
	4V6AImQCex0GWXZf1gZ6sFcBb6HFFVJPY4xNYiws522zQX18bez6mHikXdD9l/VRvSyj0PJbtAo
	b8rvRJNmK4rw=
X-Received: by 2002:a05:600c:a08:b0:485:4388:3492 with SMTP id 5b1f17b1804b1-4854b0b2979mr36839605e9.11.1773229246037;
        Wed, 11 Mar 2026 04:40:46 -0700 (PDT)
X-Received: by 2002:a05:600c:a08:b0:485:4388:3492 with SMTP id 5b1f17b1804b1-4854b0b2979mr36839045e9.11.1773229245499;
        Wed, 11 Mar 2026 04:40:45 -0700 (PDT)
Received: from thinky ([217.30.74.39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439f818d61esm6551972f8f.8.2026.03.11.04.40.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 04:40:45 -0700 (PDT)
Date: Wed, 11 Mar 2026 12:40:44 +0100
From: Andrey Albershteyn <aalbersh@redhat.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: Andrey Albershteyn <aalbersh@kernel.org>, linux-xfs@vger.kernel.org, 
	fsverity@lists.linux.dev, linux-fsdevel@vger.kernel.org, ebiggers@kernel.org, hch@lst.de, 
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
	linux-btrfs@vger.kernel.org
Subject: Re: [PATCH v4 17/25] xfs: use read ioend for fsverity data
 verification
Message-ID: <bjvosviztvgxswil77pbhw6227y3qss7govt74iyduhfoo7biu@uifmquvn67vj>
References: <20260309192355.176980-1-aalbersh@kernel.org>
 <20260309192355.176980-18-aalbersh@kernel.org>
 <20260310012105.GE1105363@frogsfrogsfrogs>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260310012105.GE1105363@frogsfrogsfrogs>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ulGeI4EXYUGHaaaVX3meCSLw2dNeybxRW0yRRY1lXdg_1773229246
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2026-03-09 18:21:05, Darrick J. Wong wrote:
> >  
> >  	spin_lock_irqsave(&ip->i_ioend_lock, flags);
> > -	if (list_empty(&ip->i_ioend_list))
> > -		WARN_ON_ONCE(!queue_work(mp->m_unwritten_workqueue,
> > +	if (list_empty(&ip->i_ioend_list)) {
> > +		if (IS_ENABLED(CONFIG_FS_VERITY) && ioend->io_vi &&
> > +		    ioend->io_offset < xfs_fsverity_metadata_offset(ip))
> > +			fsverity_enqueue_verify_work(&ip->i_ioend_work);
> 
> I think the fsverity metadata (merkle tree & descriptor) don't need any
> (read) ioend completion work since all we're doing is reading that into
> the pagecache and eventually fsverity will go look at those contents
> when it wants to verify some actual file data, right?

Yes, metadata don't need any verification. We skip it here and
enqueue only data (this check):

+		    ioend->io_offset < xfs_fsverity_metadata_offset(ip))

The metadata goes through normal read path ioend completion.

-- 
- Andrey

