Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B928339DBFA
	for <fsverity@lists.linux.dev>; Mon, 13 Jul 2026 08:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783930606; cv=none; b=O12+oLru24t5uHCH3iQ0pGy7BCTW6rKKaPF+jY/K02Edq+vsb3S7dRYRSyHBnYI8JW0LeYettUrEvfEut3amG5BEy4A84FZAMSwaKwXtDJMSKMHJskX+NbunbmdFDUYTM5z83FJp2GnapDzA/mdoGXjO2sif0SkVK8nFMly8EcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783930606; c=relaxed/simple;
	bh=ZtGi/8vtQN7HKCumPKvrusANeC8z6jPebDpLjTiSNQA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=p0k373g/E0+9L6H8g2/CTXytg1X93W/0v8W7HUDXT/9K0amAVT1xPWbtTvg5oFoVLuU1NPkP/SHpAJM+WZgnpwVd8CA0An6+YviAr8m/TMk0/YqHm0rHf2t6ii19MF6LzPk7raOee6B+2LWUVv7cxAWFJGXt3u5I75QQ/Fej0Ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IjF7/HKC; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IjF7/HKC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783930603;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qitVlXfkVbLZ19rYAoRnVT8+321wabtilZzFTJ/EX/8=;
	b=IjF7/HKCR/qjv96qzWsH/k/tx49fge58hjdVAHConhqrDl86W5cPt2iFUp2k1UE/Qx3yxL
	xr4vRNSk3dsg4EUn+pXuvRgZVdXwaVC9u2FU/o9w7vDsMy4mxdw7MeYpxBZ9r2ZvUzr5P/
	lM2yq/fojRNb32FyWCqzGiF1E0S+7Bw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-618-5Uxfk2Z7N2u5oO6r80bXxQ-1; Mon, 13 Jul 2026 04:16:41 -0400
X-MC-Unique: 5Uxfk2Z7N2u5oO6r80bXxQ-1
X-Mimecast-MFC-AGG-ID: 5Uxfk2Z7N2u5oO6r80bXxQ_1783930601
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4926596eebcso26648175e9.3
        for <fsverity@lists.linux.dev>; Mon, 13 Jul 2026 01:16:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783930600; x=1784535400;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qitVlXfkVbLZ19rYAoRnVT8+321wabtilZzFTJ/EX/8=;
        b=Q7Tk7HWSBQsVf1nYNLGo0JDDSWNUO1Xb+K1svnkMlrlBXCFrywPdtqp5XervvM1aq7
         Ji2LtsyTaGoq3NXpfLfLWRRsj3EfTdGIuNs9fLRUho79+aYm6S7sFdh+7N6L5Tu6qjeB
         OAe3zEVtiKDg9HeYZpA8HAgAO8J5VcioUpTHqPmHvR1KomLAJEpJXLIF7wCpp7hNlPWM
         xCleSp0WC2BKHf2fSeGtFXk2LORB7ZpljibUt2vyT9kgu01IRV84Ogu+2hhhLftuSFR4
         vb2RuioRu2ApsOHWsIiCH2eMEY1bNb9Vpt6Co/fCX8y75frkcUB4cNCcLVs7FZW5zHXI
         e4jQ==
X-Forwarded-Encrypted: i=1; AHgh+RoPQGZxR6+9ey18agRvWSsmDcbdgoV3sjUrnUjX5Y0RmhmDikPkusd6b4B/dBQyL6Q07zDBNfdhgA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz7AQ5q/L5wRH+8HIRrXBtJQNO1Jz+T5BPWn57Chr5Jhtd9+I6I
	gYv6l6TDv3UmlYuJxvGtECUOeoH2DtTibejnD6RBfQg5jFarELDZnOpvDi4YAA67VQpBLvDqBJU
	1yktXr5dsgibbQCscA8dX+p10EPLSP6rfWVNR30ZpE8QoZ/SfHn4KyNNHbuU=
X-Gm-Gg: AfdE7cm1pUN38s8eC3Y6JgKqhxretr4FqdQUdPQOxGKFP3BYmbR+U6HsmWOqzDY1j9J
	GWCoiTXTZW9+/Kz3kuL+SRlJwl4VZ1p4SejGZeh8Yp+3TJEYQf3wGK+XE94mjYWSgotGEAmWsCz
	nO459Dn6AXrikViBUOm4PQKFOv0qzzBSZ9+qtu856t9RBzPJ99ywgHeuvxtNXyDlSjPDHBeitS8
	4W1UdZjQVAUPj1DNbOpCMau0Z4d/CyQkTZNjSp0mcAkau8b3/vPFv9yxl/dXVqWTHpkspUgOvRN
	Njmr6hj0Sf5AUgTIxFZLytSqocnhnmvCa17GYSea/vVlarnlx0x+ejPxWAPuA1foeYhW0uRy5iS
	sW688XdwMoJOflcgPJ221TxtSiGSWOeSWnBSwfyz0PxcOOA==
X-Received: by 2002:a05:600c:674a:b0:493:f80c:5455 with SMTP id 5b1f17b1804b1-493f87d85a9mr80792575e9.5.1783930600529;
        Mon, 13 Jul 2026 01:16:40 -0700 (PDT)
X-Received: by 2002:a05:600c:674a:b0:493:f80c:5455 with SMTP id 5b1f17b1804b1-493f87d85a9mr80792235e9.5.1783930600066;
        Mon, 13 Jul 2026 01:16:40 -0700 (PDT)
Received: from aalbersh-thinkpadx1carbongen13.rmtcz.csb ([217.30.74.39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9de1e785sm82014266f8f.8.2026.07.13.01.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 01:16:39 -0700 (PDT)
Date: Mon, 13 Jul 2026 10:16:39 +0200
From: Andrey Albershteyn <aalbersh@redhat.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Andrey Albershteyn <aalbersh@kernel.org>, linux-xfs@vger.kernel.org, 
	fsverity@lists.linux.dev, linux-fsdevel@vger.kernel.org, hch@lst.de, 
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
	linux-btrfs@vger.kernel.org, djwong@kernel.org
Subject: Re: [PATCH v11 06/20] fsverity: don't allow setting DAX file
 attribute on fsverity files
Message-ID: <alSdUBiA6n40PKim@aalbersh-thinkpadx1carbongen13.rmtcz.csb>
References: <20260710085256.3464201-1-aalbersh@kernel.org>
 <20260710085256.3464201-7-aalbersh@kernel.org>
 <20260710234643.GF1911@quark>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260710234643.GF1911@quark>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: pZjCXZGukwh35-BGDCv5nv_EbEoniRuxxlbpGrVgJVk_1783930601
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2026-07-10 19:46:43, Eric Biggers wrote:
> On Fri, Jul 10, 2026 at 10:52:34AM +0200, Andrey Albershteyn wrote:
> > When fsverity is enabled on the file, with FS_IOC_ENABLE_VERITY ioctl(),
> > it checks if file has DAX enabled and fails if that's true. However, the
> > opposite case is not checked.
> > 
> > Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org>
> > ---
> >  fs/file_attr.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/fs/file_attr.c b/fs/file_attr.c
> > index bfb00d256dd5..5424ec4e3949 100644
> > --- a/fs/file_attr.c
> > +++ b/fs/file_attr.c
> > @@ -246,6 +246,11 @@ static int fileattr_set_prepare(struct inode *inode,
> >  	if (fa->fsx_cowextsize == 0)
> >  		fa->fsx_xflags &= ~FS_XFLAG_COWEXTSIZE;
> >  
> > +	/* Can not enable DAX on fsverity file */
> > +	if ((old_ma->fsx_xflags & FS_XFLAG_VERITY) &&
> > +			fa->fsx_xflags & FS_XFLAG_DAX)
> > +		return -EINVAL;
> > +
> 
> This sounds like a bug fix.  But actually ext4 already checks this in
> dax_compatible(), and the other filesystems that already supported
> fsverity (f2fs and btrfs) don't support DAX.  So I guess this is really
> lifting that to common code?  

yes

> But the existing check is still being left
> in place because it's still needed for ext4 specific flags anyway?

The flag mask seems to be used only in dax_compatible(), but I
suppose this's fine to leave verity flag if EXT4_DAX_MUT_EXCL will
be used elsewhere in future.

-- 
- Andrey

