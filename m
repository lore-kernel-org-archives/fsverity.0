Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A702841C71
	for <fsverity@lists.linux.dev>; Wed,  1 Apr 2026 13:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775049578; cv=none; b=RA2RC9kUFPO2+dMnGwB1c7yYCJCt8BnKA5XEdVIuTT4hMNwM9VcNrAWM4Yehnq7IsAtzWQ3knPGaYQmW53FSPvB0jI6AF4EnhPoSIfPgCDl84svmYbHty74o/ELG9RG9X/jt8riIsKg/p7sjhsP7NIuMu5k7I20SwfG+Yks5hYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775049578; c=relaxed/simple;
	bh=zRSq9GBe9RB8pR9poGoz6gdAAzNYkiK3X/2GByHGY5A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=eaInj1ex5KRN/0mAL67ozlogsP6J9FOnYGmN5WEznmk7wHVuEykfA2M2rHp6KmcW5xiATyXULGXivB5MBhDSqd45EZ7oUktAbDPHjM+gXEu6Cq+XjgWsmkAbC0LPug37ILorst5Hw+h2/55pT9hc6b0FZUWCCwgRTX3YwDbuYog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KnFDrz6d; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KnFDrz6d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775049576;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lyW12uBXRpbNCpKffg0iXnMuUrdM+MfpJppnsHO2xnY=;
	b=KnFDrz6duhNyc2h770tthcRVuE6XDE0GlzXSDqLLQt5/Cuk3sFfUqpQGiD52rm/4Kc5WYH
	lLA4gM9QaJ4ax42twsRjMWIWMivbpuSYN7h/Z0V3lWtzXuxqtVeuV/1FqBOpkAQA8PwBXD
	pLzLFfw2IWe6CYa4fAg0hGqW+xw9Lzk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-637-UTXW0aVrOhufdc3JWjTEjQ-1; Wed, 01 Apr 2026 09:19:35 -0400
X-MC-Unique: UTXW0aVrOhufdc3JWjTEjQ-1
X-Mimecast-MFC-AGG-ID: UTXW0aVrOhufdc3JWjTEjQ_1775049574
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-48881eac1f2so7173875e9.0
        for <fsverity@lists.linux.dev>; Wed, 01 Apr 2026 06:19:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775049574; x=1775654374;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lyW12uBXRpbNCpKffg0iXnMuUrdM+MfpJppnsHO2xnY=;
        b=tT1d4ZYHE/4G1qBJAYt5ykVkHVXUe4KNqrbZr1qx4Gm8baHs+mJrnIrR1nBNNaFBX6
         QdIqXlFDU5QXXptiIIdDW/z6G33kFkYSGrr6dl0zLHa4dq6vydn6h3tdh3l+Y+v+wEeR
         hBasMjByTmSA9dE8O3qPWo2Vmnjkah2r6gANHUJTUHlqh7id73L2O2IWo79XTai1RxLx
         hN1zZ6Q9QqsfRUiU1CfHTNWuyWGtgoxBmlEo6nOT+NVtynxfqs5TrNcEG4qhPSO++WTe
         DfcMUXfTHD6XqhUI+epNYTUGsmN6HFM1ZLfFd/3GKosK57TiGWMTf+0ardsu5wyHQqq7
         CD8A==
X-Forwarded-Encrypted: i=1; AJvYcCWNzr7W4TloVF/Lm0KshrV7CCDxNl1Zt0caBVhNXvnbwKv0XQCMgYhfrI8gJWdAWd6hDYBeMevLxw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzYHuJ+FLVgYS+qSwRMvLq2sP6/IYlcSnbrMT/M+p/MtnWIGckY
	/jSOD0xZuRKFEHGB4Hv4fAugl0mSGVzsrvCbF8UM+AOzrylE9ltNdpFNTq8Ky+gBf/cUtp3+g2i
	p/1t+hE0Eie1Z80RrhzcGgSGez8Wb6RGjopmvzN//lF0l88WZqZGM1hAKzLI=
X-Gm-Gg: ATEYQzy0k2GI2KdCmwFz7fLAEtBwD/7CTVHkj4753GB8JhiZmqvHPcvG1T1j+kXA8bw
	cwEob+C+4oqN43DwDb0/eh6qlCppuhsnH/DLi29K2ehoEUQv34kMAjknTg2XzhWE833adK3BI8q
	SvaqO6kVvU4YJKoyANGrsZZtAicEacEOVKtNYPIUbPIQ2sjHwpUeBRYgkDUhEUluxcun0gd8d5F
	ue2yXdv2BDZ85eFNWjESHjQ1rJPhT80atOmyFAn241IgQZYiYIcT79yyNC0AWYQx4y5otpLUyJz
	Hns7tLPYjv/mSKUjbngCteiMFWr7YVXNbyUKzqb8mwvXcp0TaNab/UGwbfLQsPVLnH+pBAXDbyn
	bdotrpblU/cvghw==
X-Received: by 2002:a05:600d:18:b0:483:6a8d:b2f9 with SMTP id 5b1f17b1804b1-4888356847amr45594845e9.5.1775049574210;
        Wed, 01 Apr 2026 06:19:34 -0700 (PDT)
X-Received: by 2002:a05:600d:18:b0:483:6a8d:b2f9 with SMTP id 5b1f17b1804b1-4888356847amr45594115e9.5.1775049573591;
        Wed, 01 Apr 2026 06:19:33 -0700 (PDT)
Received: from thinky ([91.245.205.131])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887adc52b2sm43924305e9.12.2026.04.01.06.19.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 06:19:33 -0700 (PDT)
Date: Wed, 1 Apr 2026 15:19:31 +0200
From: Andrey Albershteyn <aalbersh@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Cc: Andrey Albershteyn <aalbersh@kernel.org>, linux-xfs@vger.kernel.org, 
	fsverity@lists.linux.dev, linux-fsdevel@vger.kernel.org, ebiggers@kernel.org, 
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
	linux-btrfs@vger.kernel.org, djwong@kernel.org
Subject: Re: [PATCH v6 21/22] xfs: add fsverity traces
Message-ID: <oxglumin3yplbpc647rudg6vqptkcfatf5mayzqdjcowfx7q23@p3flnabfpd4g>
References: <20260331212827.2631020-1-aalbersh@kernel.org>
 <20260331212827.2631020-22-aalbersh@kernel.org>
 <20260401063146.GD24459@lst.de>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260401063146.GD24459@lst.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: lI7aQYHe-MNF9NMv8iNeilqvXfmZbZRp1orPx_A5IEQ_1775049574
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2026-04-01 08:31:46, Christoph Hellwig wrote:
> Wouldn't most of these trace points make more sense in the core
> fsverity code before calling into the file system?
> 
> Otherwise they look good to me.
> 

oh the _file_corrupt one seems to be not used anymore with new
fserror interface

The _read/_write ones were pretty handy for debugging issues when
block size < page size when XFS read block, so, fsverity request a single page but
filesystem fetched more blocks, but with the current implementation
it's not relevant anymore

The only one which still make sense is get_descriptor, which
probably could be core fsverity one

I will drop this patch, this doesn't seem to worth it for single
trace point

-- 
- Andrey 

