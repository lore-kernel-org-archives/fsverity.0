Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69CCD38B7CA
	for <fsverity@lists.linux.dev>; Tue, 13 Jan 2026 10:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768301591; cv=none; b=ESP2VchiXsryIahd+RFcxlb4qxkWW/dmS3VWRM33SJx/eegZHMG1El+phzhwowEUTe8lJ4DQcehUYosPAiqfMvdwmDhqWimzM7InT6fn14VNK7Il/eDvueGI6ZRlXzlzpMmHi+FbUf6JWfoXNhyT/86wGRgEqOGwNYdxi3FoXhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768301591; c=relaxed/simple;
	bh=PjHHNXMU2ECbmiFzVWprvbt8oK2qCpnxqnQXWFkJbRY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=Jb4VVMSfzwEhrmMJLKEdbKL4CSdkzKufdtcrTV6sulZevxtx27Wcwgypxgpj/3gTSiwlGsTyxvWjhg6tRxErooYkUpK320ADHOmo1FLzkflmRVu9k9eyqnAgLOwUCY/FHA9G+9nKLSV2rSTyD/C24+0hIYjgdFUcuW8MWupJRo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=h2slBqe6; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="h2slBqe6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768301589;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RRzq/OiqJCPG2bkBaZVulxyOOCKnLsjXMbp4ew7Pkeg=;
	b=h2slBqe6vwakrqvCTQzx6d0/75UXUAKQ1/vM4ZDAv/1K/Kf9HtKagXIUDEmFMIVqicbHdN
	M6Q7Juw/0ZPOkpLX9+nAEnN+42HWaiZUs7oaW4H0aTdELaRpU7jzoG/4/TSsiB4U16/SCE
	UcyUt9GVuE4Ka3gB9hTwwR6fV8a3ot4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-561-4KY_KKDsMkecxMb-tr2j4g-1; Tue, 13 Jan 2026 05:53:08 -0500
X-MC-Unique: 4KY_KKDsMkecxMb-tr2j4g-1
X-Mimecast-MFC-AGG-ID: 4KY_KKDsMkecxMb-tr2j4g_1768301587
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-4325aa61c6bso4660673f8f.0
        for <fsverity@lists.linux.dev>; Tue, 13 Jan 2026 02:53:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768301587; x=1768906387;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RRzq/OiqJCPG2bkBaZVulxyOOCKnLsjXMbp4ew7Pkeg=;
        b=u1KYP3zIgjuDoMj35IhNZDuxxIOQgfbojQNPofURMB+BXjpN03g++VNkSle0fLYKLv
         wnIIBnojcrnSVn1Jkdull20Anmg5eEaLvLPF0d79ruhs8LagQeyg87+w9ts9XTREdUpF
         A+VWJ2tlo8l6+ZYzJcp1F5kavyczvP7o2oMNWzK7vVFjctI/Y9K76GLeyvxOZrg6QvKj
         zlIrE00U/6WSL3y+wHDCs1jzaQ29FYPt2Ew9AxWCjhQSmS6c0afF6GMi8dYGOCthYJY+
         wyauHNgxt2tP3VtoUoGfPl6mpvHep7T9EMliGJM1Akbq/qH4+Ho37NhpN1B39O5zadTe
         5FzQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4vvl2LfPcX9x86f7O2QMrPBolR4VAeXBEgb44UzvpbVnJvAZ6wal6u8+5frEwDHgCFylRX6dlhw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxEDio7p4yWR81yHcllskMiF5nq5MxsTO7wuQEaL7+MAd9uVKZc
	8+Co1KhkprHOepeyqn7vwkBcg6PxW68d4OfR+t3FeX3g3S1kVFQIeApKy2HjC1qkRi734tGsv4v
	4C2W1GMWMEYHycpjJHEwkSzdNjgM30WUFSIV+FqwRJVer+KQbasyFXeDrN4w=
X-Gm-Gg: AY/fxX5t5MDvW+4xWB4L0Vs52oLoy0Eh38tQyXmB1GCluN5hGbeZbs0uMUegABne5nT
	cPAmjWYtFJaWHHPuKaUj4EswuV6tQDTii97kDj93/iUHzb9NbNz+YabsNIjgVDI/2bSfpePPMwb
	QX7N6dsrT2sgJp4/mBYmQkmNpk2cUDndDZSZwS5p/J9iwW90vqmXmkao62sE3XReMRIjGznKtWZ
	EXRoDYsOar/Jq4P5nqP27MUHeSRENNjnfTqWBLB5S5oqKrVtLZ8jSzKesgHrXg+OWy/zx5/V4Z8
	+m1F3Re0iRaR+TNUOBA+3emGR9nxp920ay1bWOBqRhC0lNCO4jTMKOE93bZsMFaNrFxHVV9EuRI
	=
X-Received: by 2002:a5d:64c4:0:b0:42f:bc44:1908 with SMTP id ffacd0b85a97d-432c3628318mr21995930f8f.6.1768301586767;
        Tue, 13 Jan 2026 02:53:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFh4NEoqV1IGWMRybfYo/BPX2SnOF98P97L08GyHqewwRXa7H6fD1m4rMETsETdz+2sbqsNaQ==
X-Received: by 2002:a5d:64c4:0:b0:42f:bc44:1908 with SMTP id ffacd0b85a97d-432c3628318mr21995903f8f.6.1768301586365;
        Tue, 13 Jan 2026 02:53:06 -0800 (PST)
Received: from thinky ([217.30.74.39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0daa78sm44253141f8f.6.2026.01.13.02.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 02:53:06 -0800 (PST)
Date: Tue, 13 Jan 2026 11:53:05 +0100
From: Andrey Albershteyn <aalbersh@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Cc: "Darrick J. Wong" <djwong@kernel.org>, fsverity@lists.linux.dev, 
	linux-xfs@vger.kernel.org, ebiggers@kernel.org, linux-fsdevel@vger.kernel.org, 
	aalbersh@kernel.org, david@fromorbit.com
Subject: Re: [PATCH v2 4/22] iomap: allow iomap_file_buffered_write() take
 iocb without file
Message-ID: <3h675bqgb6rslcn5anicpg4f3n4j4irqqotyopmebh4bx2crqw@nh47jqrj3ucm>
References: <cover.1768229271.patch-series@thinky>
 <kibhid6bipmrndfn774tlbm6wcitya5qydhjws3n6tnjvbd4a3@bui63p535b3q>
 <20260112222215.GJ15551@frogsfrogsfrogs>
 <20260113081535.GC30809@lst.de>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260113081535.GC30809@lst.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9QCSehEgxPv1sWHInvvuDWVVgRzQdRAEIX-vNhqAGCs_1768301587
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2026-01-13 09:15:35, Christoph Hellwig wrote:
> On Mon, Jan 12, 2026 at 02:22:15PM -0800, Darrick J. Wong wrote:
> > > +		iter.inode = iocb->ki_filp->f_mapping->host;
> > > +	} else {
> > > +		iter.inode = (struct inode *)private;
> > 
> > @private is for the filesystem implementation to access, not the generic
> > iomap code.  If this is intended for fsverity, then shouldn't merkle
> > tree construction be the only time that fsverity writes to the file?
> > And shouldn't fsverity therefore have access to the struct file?
> 
> It's not passed down, but I think it could easily.
> 
> > 
> > > +		iter.flags |= IOMAP_F_BEYOND_EOF;
> > 
> > IOMAP_F_ flags are mapping state flags for struct iomap::flags, not the
> > iomap_iter.
> 
> But we could fix this part as well by having a specific helper for
> fsverity that is called instead of iomap_file_buffered_write.
> Neither the iocb, nor struct file are used inside of iomap_write_iter.
> So just add a new helper that takes an inode, sets the past-EOF/verify
> flag and open codes the iomap_iter/iomap_write_iter loop.
> 

sure, sounds good

-- 
- Andrey

