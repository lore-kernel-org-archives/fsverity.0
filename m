Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 144A8145348
	for <fsverity@lists.linux.dev>; Fri, 16 Jan 2026 14:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768575139; cv=none; b=R6zDUCbQ3advQdn45Hhjk5oM7ChntN3AtKPPyVxFvUXq4c41rBAxI/5h/lWhvSRtq1nugGuuSvN3XZCEIMB3OlSbON6edMh8LkuFPXnOONYC1kHI5owqk4Byl4W9qyNZwidulkaCOnEk19sCrp0BEIpo/vdJiY61pde71H54dVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768575139; c=relaxed/simple;
	bh=7cGeMk8GyRdqCvDdT0G0vEEeDlTTsLl/4l41tbPOOLE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=XjC6NtmZ3XvOf7Z2m8By6RyEf0zugjCBnzPjIIIwsTuoAYhwXwXdPk8rA+ytbCGOH5+uW/K/nOBnLbbs4coOGn8Ex9U4Yi7szl1pOtL5by/quNXzx845xgfQnFad+xXnbsTpEb4aNyMswECoM24bQ06iSK/hwrbOkD9poD07+0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WB4HYyfx; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WB4HYyfx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768575137;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0h8VbcliXJU5w8d5JITrLYVgYncPw3n5MJT/9tJnIiY=;
	b=WB4HYyfxYtZnufUlvKIo+8nLniIYYJbfRWAjiebLLa3Xz/lO7eDcJg9ZSrwUsKLgc4Lgbx
	pkJQRecdfWfNDE+xANtmAdiBCvO64jorHklmI1hYh6UCIpLw0FhII5gyUS59umWkdr2Mk+
	9UDwRou+U08eMTmm0IzCLI1oeW0zXv8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-489-E4cFAVpPPpSRWDsjTMGGwg-1; Fri, 16 Jan 2026 09:52:15 -0500
X-MC-Unique: E4cFAVpPPpSRWDsjTMGGwg-1
X-Mimecast-MFC-AGG-ID: E4cFAVpPPpSRWDsjTMGGwg_1768575135
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-430fcf10287so1816430f8f.0
        for <fsverity@lists.linux.dev>; Fri, 16 Jan 2026 06:52:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768575134; x=1769179934;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0h8VbcliXJU5w8d5JITrLYVgYncPw3n5MJT/9tJnIiY=;
        b=Lpw7LxrTra6tYxtA5zo3MBf3cdqSlSWrqYxY3RXk8LgkuDXDYIegzxtQ0RLn0XoP2Y
         TxyWfQlf90yh675I0yCb4uym1LWFgbJyaFq4yIV/kms8DNWt3MjWKD5bQF7GbKYKf/u0
         cmgQX9mfScfJGloUiHLxpssjJ0fixAKn0i4TLDiz+062qHB52uLd7ZfToIsRTBaQjGh5
         OnTKuQc46JNAp5MsS8sIUVHXds0qBqq2wDmzvkHVRqu76XbB3WL0ZZ3wkizplBjbqhdt
         Hl/jHkDnc318Lb+D/DHJ+lZrp9Wb09sm8RIz8u1gIXB328AgS6+VE1VgIE0lzL/ZdRl1
         mpKw==
X-Gm-Message-State: AOJu0YxzQGGSpxBFZZpvdkEsvFNXTWDtJspuTRperUuOLv0FiNLQlMUf
	34sRB10c0Tz57ThawBAzKbnOF6L/5Ko1bYu39HVBgCIauCvFcMjsj0R0GEii4RQZPd2vSHXs09y
	JWVEVf7LS6p9z2CPeNDOXL1kEvMflBJi2yYKXEKXxySFmX2GG9lb97z1SWDg=
X-Gm-Gg: AY/fxX6AlbXW1iIrn6c0LaoIqvuwLWsjixPfjCpQnilaQkD20VykPBYIJPbkKQKlbNe
	GByL9ceDOg6ec2iKUwpYt8KoMem9sMPBvfCgx1YpZ7oGWsIQGcFoYassfKRV6yuQPHIAqEwKtez
	EYL+p/1ijnGYHKqBjC6h0raALhTVgwxIV/gA5/ubIEAr9wtlI2OY/jUI50bPI1WllJriduhhZax
	myW09hVRHVH5z4Zen1PneaOKbYMKKVRcqz7hwbpYIT3Rsf8w3QNKmNZEnUnz/Q27tkBoVYRyyRw
	r/7Ns9x+U0BP70U+QPfs13N6K1LMX4BzhTzFU/npzWs1VWalQ2k2kKUAv5EumdCZhun+26bVPvs
	=
X-Received: by 2002:a05:6000:40e0:b0:431:701:4a1a with SMTP id ffacd0b85a97d-435699997a3mr4331553f8f.26.1768575134319;
        Fri, 16 Jan 2026 06:52:14 -0800 (PST)
X-Received: by 2002:a05:6000:40e0:b0:431:701:4a1a with SMTP id ffacd0b85a97d-435699997a3mr4331513f8f.26.1768575133696;
        Fri, 16 Jan 2026 06:52:13 -0800 (PST)
Received: from thinky ([217.30.74.39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356996d02dsm5633075f8f.23.2026.01.16.06.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 06:52:13 -0800 (PST)
Date: Fri, 16 Jan 2026 15:52:12 +0100
From: Andrey Albershteyn <aalbersh@redhat.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: fsverity@lists.linux.dev, linux-xfs@vger.kernel.org, 
	ebiggers@kernel.org, linux-fsdevel@vger.kernel.org, aalbersh@kernel.org, 
	david@fromorbit.com, hch@lst.de
Subject: Re: [PATCH v2 16/22] xfs: add fs-verity support
Message-ID: <5s37vliyxikgz22dakooeml37yo2jnhqqinnnag5czbtz46io5@h6jikziw3qxr>
References: <cover.1768229271.patch-series@thinky>
 <p4vwqbgks2zr5i4f4d2t2i3gs2l4tnsmi2eijay5jba5y4kx6e@g3k4uk4ia4es>
 <20260112230548.GR15551@frogsfrogsfrogs>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260112230548.GR15551@frogsfrogsfrogs>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: nCCux8Ee7u8R1Gal11U1M7OZgDOzl_igB7nlHJjVJuE_1768575135
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> > +	desc_pos = round_down(desc_size_pos - desc_size, blocksize);
> > +	error = xfs_fsverity_read(inode, buf, desc_size, desc_pos);
> > +	if (error)
> > +		return error;
> > +
> > +	return desc_size;
> > +}
> 
> You might want to wrap the integrity checks through XFS_IS_CORRUPT so
> that we get some logging on corrupt fsverity data.  Also, if descriptor
> corruption doesn't prevent iget from completing, then we ought to define
> a new health state for the xfs_inode so that it can report those kinds
> of failures via bulkstat.

yeah, iget will complete as it doesn't trigger fsverity to read
descriptor. I will add a new health state. Thanks!

-- 
- Andrey

