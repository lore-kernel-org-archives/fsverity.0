Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC161524B11
	for <fsverity@lists.linux.dev>; Tue, 22 Sep 2026 08:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790067376; cv=none; b=lLd7BnA/MxXEleHWUsS8SvUHhWNFQceMZDN7DsGOHVQ6dDzqQcoWbWkd4t1IYplQS+ap2LOFsBhnYvEqsuF+/nta3TzL+6CDZiji1cEXQ7Yi+l/AOiWuWHjkfdN7O9d2sFvFMQtFazlgEshtWVVKfGnDsLlWfpA7wL0iFbPGdLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790067376; c=relaxed/simple;
	bh=dTZ74AujbnWToEkdYNhWDDknBgtfEGUv+/3pS6per/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=ZPip8ff8mIDVeJN919gz3j7xaYghBH95Rz6Pw2UKJt1HHtT0ak+hiDVGMCOni608HPt5oFF1iVfqAey7gFAQ40ESGlsJs2M59ZLrUXwMKqq4bTzPlRUeIg1+4Z2RdrJVAUNTntVwa0UJt7tCSqyEO/voxaZ6jwE7ILwoIxhZ9j4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hPvvBF8U; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hPvvBF8U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790067373;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ovEqrxQiNC1fApdCYwkn/e/ow08kQkdi30NnfIiXj3g=;
	b=hPvvBF8UC2vymQ2BK4aaMJYkbHYv7IxK1cVV4bzFwLICa+Ra1xa7Pf/TEiI9w6FNkxeGDf
	TBb47Eoa7EQavBcQNr1TNxWSjqergxD+JkARWeamm1/q8N9G0Nwo1iTAXtqvNTAf3sDhvU
	yr4jrvhmfg46Cr2Ciy3xXnW98isuw58=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-325-IWKeTDkPODGtXTEM2dYmFQ-1; Tue, 22 Sep 2026 04:56:12 -0400
X-MC-Unique: IWKeTDkPODGtXTEM2dYmFQ-1
X-Mimecast-MFC-AGG-ID: IWKeTDkPODGtXTEM2dYmFQ_1790067371
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-486f52ac21eso2553107f8f.3
        for <fsverity@lists.linux.dev>; Tue, 22 Sep 2026 01:56:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790067371; x=1790672171;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ovEqrxQiNC1fApdCYwkn/e/ow08kQkdi30NnfIiXj3g=;
        b=BP2Bo9KWplSVsGN51hgnneVqp4gFBgVe3UP+TEvWD+0QfOuBWKnUyhh+xvJmNLs1yx
         mLeEQzf2GGklkQkel4cqCDqyQesM7JneeTKHmrkB3Nzioo847oTm5nZHWLB+edLzxiaC
         3E4Y6gu9ROgvnoke2Fe12ik5LGHn1IdR2C2me0MegHrcXH88ou8HK8Zq50nwi8ODVgON
         5MuYWNTVnvEHI104av8Znld+myEonK3gMr/18kmrcJLEo/cvJW9c6nWgSEGg+pKWf5gC
         q9TcmPEgj65AxskkR22RmpcsevQUOPHVn0cajsMLCnaqkHJndSUnsuRWOiXRSgTiKDYL
         r1yA==
X-Forwarded-Encrypted: i=1; AKwUvBxDDM/ryEWP++dR7hUspMW7rv7bHmBy1s3a3eOs1SnHSWdZuty2AYhEuPR101EJAzOlE2dQMzcHrQ==@lists.linux.dev
X-Gm-Message-State: AFuF++nNZI8IKCT4z6Ykwf6ytvJxP+KhRmoZlmHF1kbYq7AL4gxXB+DE
	Bwesf0bGM9NMg5M0EFI4XX4cyIb2EOZikEsJ69bTc3SpApBMxvfm4f30GoalTq5DZoofJGtesUT
	zn4OONfD+znS7JCu3X+DudHx7Qw2H6JRYRhWhJLgZ4i5Un6geaVSfPqrM6H1SmpXBENY=
X-Gm-Gg: AYBFou2GMqJD7ohwrNVQBtJ7ElmDMXcG28xZzNXxKT9i38wu4q3W9qstoyILsAN6oQt
	1Ln5GyG7+HTPmvFOnnaHS1qhatI7MKD6zPPzXemjIntq3V1TWSdn5A1YwP/fA+DPwKMl3FnRt1c
	mEGWRZbzBNz0Yit/Wqc3y4WnF/yNG4PhPGYENJC6B1p56XTPnx7/KdkjsJHS/UVys0jhNL1rXmz
	hWEo2XkKWNXnVK4bQ1ruxwRwW552Dsd3NEsuBaoiuC4vZJnS17+unVqOWJOZ4sH5R2z4+leWMGq
	KYGK7OOqYvOPIyqSXequUvQxi12FHt7DhllbOFOVsyZsSWgfdtXY20f+I/KFNvqz4+J+GhyMJTk
	9vR/+VgTGUpla8Gt4qjLWQG67/D4IMYysfQ==
X-Received: by 2002:a5d:64e8:0:b0:484:3310:f394 with SMTP id ffacd0b85a97d-4871e25c7f7mr20485484f8f.23.1790067371014;
        Tue, 22 Sep 2026 01:56:11 -0700 (PDT)
X-Received: by 2002:a5d:64e8:0:b0:484:3310:f394 with SMTP id ffacd0b85a97d-4871e25c7f7mr20485428f8f.23.1790067370461;
        Tue, 22 Sep 2026 01:56:10 -0700 (PDT)
Received: from aalbersh-thinkpadx1carbongen13.rmtcz.csb ([217.30.74.39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48862795083sm3236382f8f.33.2026.09.22.01.56.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 01:56:10 -0700 (PDT)
Date: Tue, 22 Sep 2026 10:56:09 +0200
From: Andrey Albershteyn <aalbersh@redhat.com>
To: Christoph Hellwig <hch@infradead.org>
Cc: Andrey Albershteyn <aalbersh@kernel.org>, djwong@kernel.org, 
	ebiggers@kernel.org, hch@lst.de, Carlos Maiolino <cem@kernel.org>, 
	fsverity@lists.linux.dev, linux-fsdevel@vger.kernel.org, linux-xfs@vger.kernel.org, 
	linux-unionfs@vger.kernel.org, linux-ext4@vger.kernel.org, 
	linux-f2fs-devel@lists.sourceforge.net, linux-btrfs@vger.kernel.org, david@fromorbit.com
Subject: Re: [PATCH v16 15/21] xfs: add fs-verity support
Message-ID: <arI-5Ejg0Xw7OVmH@aalbersh-thinkpadx1carbongen13.rmtcz.csb>
References: <20260918111539.1003439-1-aalbersh@kernel.org>
 <20260918111539.1003439-16-aalbersh@kernel.org>
 <arIszDCcy0VbRVFp@infradead.org>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <arIszDCcy0VbRVFp@infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: byggXJvl0vik9metEcXuxvX1qXfj20G7kD6Zh5nTh1E_1790067371
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2026-09-22 00:22:52, Christoph Hellwig wrote:
> On Fri, Sep 18, 2026 at 01:15:27PM +0200, Andrey Albershteyn wrote:
> > +	xfs_ilock(ip, XFS_ILOCK_EXCL);
> > +	xfs_trans_ijoin(tp, ip, 0);
> > +
> > +	truncate_inode_pages(VFS_I(ip)->i_mapping, XFS_ISIZE(ip));
> 
> We can't call truncate_inode_pages with the ilock held.
> 
> I also don't see what this is trying to protect to start with.
> 

I added this to remove stale pages created post-EOF, so, writeback
doesn't try to flush them latter (but now I see that writeback will
fail to map them to extents anyway). Also, if EOF gets extended
these pages would be exposed as they are up-to-date which would be
unexpected garbage.

-- 
- Andrey

