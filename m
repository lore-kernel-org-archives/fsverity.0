Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDB36377009
	for <fsverity@lists.linux.dev>; Thu, 28 May 2026 14:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779978341; cv=none; b=V6/FMZ785YyU2didNfyMidvd+MdEqD3bzmsyhs7LeCoj2sUMGZAIsLIyS2bvxQafqEZ27ltSUS7tTolpv/ujALBJiDecwMUHIsjxLz1HGbdkZj4HooRfNHju2fNWyJtgVQuenAkfCs7A6gTHFoMgX5vRzyCpvVSBcXDgbRY5eu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779978341; c=relaxed/simple;
	bh=BpsvskD5wGtm+fNEsmdCh201ROnQWZkcNYuNK4LTV6U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=nFeliQnZHQktRBep3eYJAeQ2XqMVnHW8kJlBi6el7HsuiJm7nmS+rNVzd40FJJVVO1iZG2xh7dZ6DbbwAxS+1YZdMuPA/bCNj/51d/NF2KfXJKgvgK+n9ZOBX/NGOt7hIKW3kWsGnQ1xwKvlU9n+lBT+ZDUqbV9lyF8y2MWzDSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iB8WnxHE; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iB8WnxHE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779978338;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dETrkfkZjpOGKeS3HifTKOdzV7lpxcD3Cmea947aREg=;
	b=iB8WnxHEI8QXvvXyW3rHWT0BF5xvB0R8AZT7ohcZOeb/3pYx9DmVRG4SIsZqkTEAdXEPi8
	leucwv89QfaqG7BNab1JrgG+u24y49jtXr3MziASCDrDNUQjaM8Kpn1tu/1tIIZaQ5D7db
	okDXADzCsngFaJ/FhARi3jylRvpPDCc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-364-twPmoLtyOE2hM7HRuFFDnA-1; Thu, 28 May 2026 10:25:37 -0400
X-MC-Unique: twPmoLtyOE2hM7HRuFFDnA-1
X-Mimecast-MFC-AGG-ID: twPmoLtyOE2hM7HRuFFDnA_1779978336
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-48fed2519daso61505345e9.0
        for <fsverity@lists.linux.dev>; Thu, 28 May 2026 07:25:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779978336; x=1780583136;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dETrkfkZjpOGKeS3HifTKOdzV7lpxcD3Cmea947aREg=;
        b=CVoJxDn5Lh/nYNf4kUMKde7qblWdjj5x26xY64W9ztESObhcBqR9puS+Rwyngu2u7h
         HcuqM236fWy6aLl2JCGZefRlOsxaOAcJ2ob9jWREFum20wx20xrmJ331ugPKE4cYd66o
         Fi+0y+OftNHIK0mpCADLAEJjbdQuWiAz9zzAdMPCfoXaX37VsMxN0FDBz0Pl0dUC/Wzi
         Qe1sYWWrF/bFLYj+J9ND1wjYES8MFh/27gEMq9MFMnIFHrdMuYp0wF3LP/MDbilylDI/
         iv+ArUx7xnoZhprlRcw4L7MZ4JuxBlkeilY9V8sbZ8ozPWW2le40kxM367612aP5QwXM
         13sg==
X-Forwarded-Encrypted: i=1; AFNElJ+e/w5GuTf4moUxHIMyPZywaLcSEfmggOX3/sorl6i4tNwfp9DmTeeTlzmaeClYKillXeJdPZC3zQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwVUvh6uzWSQredLezGjsD4IHQntiNdl3SfdsACKcIlsoBREH+T
	8EL6baiKpiz7L+MkEZpU1hU+4y09iAPs+NEeEFupBQevEHCtsKVvPxCiWNWutg7DGdVIHQkHCil
	MRSPTXdsC9PhpNzC8Mw309gUNTWqJ21Ggvo2TXH8vSUgiaUL58hPe4+Kx0Sc=
X-Gm-Gg: Acq92OH4l/TgoCx+TXSnjd2BX71Isi7o8pdYROnL0Gga1lNOlPRJFTnMfhs1maKCHTm
	5NBoNTHCgwpPXpCEVGkhLRbFH9kGbwLHuibePGSC2oreYbWyU7n/XXoXLZNPTz9ZYKm0LP6nC7c
	5U2YdyoZUdTMplg5QD12a28T7PYCb40AYZrmeoNJ5WTzESrkEWCpnBm5iqMh7Zez91b/21DqISb
	p5OH7WvQIOmn61dA8nBMYmnJSP/XTBXtIOQtc/oEUdpv0ZdTBuHhd0SG9/4s8XLbqCjFNdwZGQC
	nMedM4R+dqoVXE706ES7pgMG1SdEIwLyEYhBt31gd34XlVCI2y+7F3+6FR147oqDYUEQjdrkOhU
	pVXHbXTxaWHk/z+oqySNLnCoG0o7J+EjaoCVWdNXOQ18PjAHGWd9N+gfHFogf/3lg+g==
X-Received: by 2002:a05:600c:8207:b0:490:688b:ece5 with SMTP id 5b1f17b1804b1-490688bedbamr260601835e9.30.1779978336137;
        Thu, 28 May 2026 07:25:36 -0700 (PDT)
X-Received: by 2002:a05:600c:8207:b0:490:688b:ece5 with SMTP id 5b1f17b1804b1-490688bedbamr260600915e9.30.1779978335469;
        Thu, 28 May 2026 07:25:35 -0700 (PDT)
Received: from thinky (178-221-68-189.dynamic.isp.telekom.rs. [178.221.68.189])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49092a925acsm77606985e9.14.2026.05.28.07.25.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 07:25:34 -0700 (PDT)
Date: Thu, 28 May 2026 16:25:32 +0200
From: Andrey Albershteyn <aalbersh@redhat.com>
To: Christian Brauner <brauner@kernel.org>
Cc: Carlos Maiolino <cem@kernel.org>, Christoph Hellwig <hch@lst.de>, 
	Andrey Albershteyn <aalbersh@kernel.org>, linux-xfs@vger.kernel.org, fsverity@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, ebiggers@kernel.org, linux-ext4@vger.kernel.org, 
	linux-f2fs-devel@lists.sourceforge.net, linux-btrfs@vger.kernel.org, linux-unionfs@vger.kernel.org, 
	djwong@kernel.org, david@fromorbit.com
Subject: Re: [PATCH v10 00/22] fs-verity support for XFS with post EOF merkle
 tree
Message-ID: <k2g674gytgm23ef6jfhfikckpnnw4evuobkxxhn2quwgr7dplx@432kdgezw6nu>
References: <20260520123722.405752-1-aalbersh@kernel.org>
 <20260521090705.GA14254@lst.de>
 <gcw7zcg6p4s2egpufwizfig72g6ren7jfmuz5mqskkpb7xepww@e3v35j7bk7dc>
 <ag7uW7KQ5mVyCGEv@nidhogg.toxiclabs.cc>
 <20260522-unbehagen-baumethode-erlesen-811a4065eeac@brauner>
 <20260522120757.GA21041@lst.de>
 <ahVzkf8JoKP-kSC2@nidhogg.toxiclabs.cc>
 <20260528-offiziell-luftleer-misswirtschaft-3503bda2ad70@brauner>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260528-offiziell-luftleer-misswirtschaft-3503bda2ad70@brauner>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: q5gcCr9b8lmj-1If4QjCCRkHq9tM3LCirt8XLe1B9H8_1779978336
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2026-05-28 14:20:08, Christian Brauner wrote:
> On Tue, May 26, 2026 at 12:19:43PM +0200, Carlos Maiolino wrote:
> > On Fri, May 22, 2026 at 02:07:57PM +0200, Christoph Hellwig wrote:
> > > On Fri, May 22, 2026 at 12:03:20PM +0200, Christian Brauner wrote:
> > > > > I was expecting this to come through xfs tree too if Eric and Christian
> > > > > agree.
> > > > 
> > > > You may take it through the xfs tree if there are no conflicts with
> > > > vfs-7.2.iomap. If there are I want to add the iomap changes into
> > > > vfs-7.2.iomap that you can pull in.
> > > 
> > > Merging the iomap bits through the iomap branch might make sense, given
> > > that iomap usually tends to see quite a bit of activity.
> > > 
> > 
> > That sounds good to me. If you want to go ahead and pull in the iomap
> > bits, do so, and give me a heads up when you do it so I'll pull your
> > branch locally.
> 
> Great, can the series please be resent based on current vfs-7.2.iomap
> then please? Because the iomap changes in this series don't apply
> cleanly on vfs-7.2.iomap so we already have merge conflicts...
> 

Sure, I will resend soon.

-- 
- Andrey

