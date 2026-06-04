Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC564266A5
	for <fsverity@lists.linux.dev>; Thu,  4 Jun 2026 12:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780574832; cv=none; b=APIfPGvPPjISTIRIsNXQymd4fP0RvvtXFxPQxxuFflWBYOcIRAl5Gt2E/RHeMAFhZ/kuzFIIf45/z9iNBBcIc4tO3TTiG4yVXla4Ncxsd1e4U7KzS6POgETXmyD9zCgYyGCnU36lDU7Lm0jfs/6IsQT8kfXOvEgkA65mN1CByWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780574832; c=relaxed/simple;
	bh=gwabwTh1oLc7n50t8M1tLL3SFy7kBT1az2bJBNlBnfs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=ey6wPFxAZkhiMVIcNseG3QAF7m4lgcWkfQC04ayF4icnA0O4Bny4ufa8LnqHkmM/up+wMqmUxXcdUSA19+vvnDM2HYhcHyF+DYofa68J2i2t7LR6GuFaEPEUeyIS+decTXxUYUTdivioqQhNe/cRjFdNXXBYOc6PcbW0u7icH0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OaWAQgbl; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OaWAQgbl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780574830;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Vez+3z7s+CL1O/+Z7LdAw9UEUl93TBeC4vinR18yFpA=;
	b=OaWAQgbly5wzEzm+917PMhKB+0Dh1F2awjuGmstUuBmZWaXW8sjQONVh5PZu6BJxgn70vS
	qaKB+N/8cr0oPZb1fSQRPer86usv5JCggN7wwx9ISL7TW6rOP8fPAoLTgo05EQEMeBy8NH
	UIsP97cvSB47TwtSlIlI1KN/lzMOIEM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-128-sYKBQLMONrW-73blDFgKuA-1; Thu, 04 Jun 2026 08:07:08 -0400
X-MC-Unique: sYKBQLMONrW-73blDFgKuA-1
X-Mimecast-MFC-AGG-ID: sYKBQLMONrW-73blDFgKuA_1780574827
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-45efa2f7009so407838f8f.3
        for <fsverity@lists.linux.dev>; Thu, 04 Jun 2026 05:07:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780574827; x=1781179627;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vez+3z7s+CL1O/+Z7LdAw9UEUl93TBeC4vinR18yFpA=;
        b=ZC2Hoq+CvCRo7qvehKT0JK21uwQTjRTL9uSznEwuO0nDy4rbrTAHCtVix4q1erVYyf
         F1rcv3xhoLIyFiOc95me0T+ES62HB2xmpMaDQcdRqR4EJAVqUhXRL3b0TMPUU+k9OU7g
         gmKbdt/CGn/fZTYWz5KaVDfVPiclnbwDa5BKyfuu11Szn/bQrqvNKSwKvUvzSqP1TS5U
         xtQd21s0B+/pRvo2rtHyeb1JKUHCdUQBgVg4DO3dZA9yWbbr6n+x5jAEeU8Tn/6xmkth
         PPctoBDkH6M15Du06u1Nz012n7V+fX3Lek5+2cB9yWepXXE1NalSWs9AUYvHexYRTqqJ
         Pv3g==
X-Forwarded-Encrypted: i=1; AFNElJ+1bs1Z4KOznFejMgQNTvy2cgjCoW6SMrxqJcoFGz5ZknTLwcWQLsaAjfFywI9p/8pksWzNwO6rug==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxa5XdoIlpb/Xki5s/TXVZXaTn7uRw8+9tj+SF6NcNqXYUO8SPK
	3pt7NOokP0zrzRcOPH8VKXWWFPqPbjH8WZlU2Y/zP7UqChmZHSjnRZpZM0zmM+aMvQ+J9Hf4DzB
	CLakWt1G62P7DKEEmq4n7HfxM+MnhKMbFIR5VBDw2MVcAYVngKUAaAaa5UtE=
X-Gm-Gg: Acq92OGLMthvfHhkg3M90cNssnwHh0NQNM9DhEEiu3jcVI/in/JcCqRg4K05Ku3wlOT
	fhgIx6FcJ0sfv6sTGYMuuPhFoc0Mx/vCxlXBlW/PKcW3TPVqb1WP6KTdlaT2xayiBjqpmndckvk
	g04eP7RdxgENdHj0pI2vSvr9PZ/ztg0ucC0Is29xAruUc+WC1JOUcd5RT9xoUbd+u6FEJPRsziV
	dEeMycd5iNx4NIk1TdFIin9UtqzK09rWkJRtiX4XB/hohxsgzmHq+PLxWBp6nSyd2nq4+voW90v
	W83zA63KUtO4GVr8RR2XRm6ALQqPgh7p8rsy/A3BikOvvzckpM4X0Sckuv2Zs/Z6Cwev6s0qL8r
	b22uqgnV2L1xNgZjqxZFWKg==
X-Received: by 2002:a5d:6188:0:b0:45e:ea3a:47d6 with SMTP id ffacd0b85a97d-4602185fed6mr8733086f8f.32.1780574826837;
        Thu, 04 Jun 2026 05:07:06 -0700 (PDT)
X-Received: by 2002:a5d:6188:0:b0:45e:ea3a:47d6 with SMTP id ffacd0b85a97d-4602185fed6mr8733005f8f.32.1780574826279;
        Thu, 04 Jun 2026 05:07:06 -0700 (PDT)
Received: from thinky ([217.30.74.39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2e4004sm15892014f8f.9.2026.06.04.05.07.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 05:07:05 -0700 (PDT)
Date: Thu, 4 Jun 2026 14:07:05 +0200
From: Andrey Albershteyn <aalbersh@redhat.com>
To: Christian Brauner <brauner@kernel.org>
Cc: Carlos Maiolino <cem@kernel.org>, Christoph Hellwig <hch@lst.de>, 
	Andrey Albershteyn <aalbersh@kernel.org>, linux-xfs@vger.kernel.org, fsverity@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, ebiggers@kernel.org, linux-ext4@vger.kernel.org, 
	linux-f2fs-devel@lists.sourceforge.net, linux-btrfs@vger.kernel.org, linux-unionfs@vger.kernel.org, 
	djwong@kernel.org, david@fromorbit.com
Subject: Re: [PATCH v10 00/22] fs-verity support for XFS with post EOF merkle
 tree
Message-ID: <yezqqgowgmbn2z42zvha7cfcprym5vnurb33brdmooab6csdks@a76a7v6rtywn>
References: <20260521090705.GA14254@lst.de>
 <gcw7zcg6p4s2egpufwizfig72g6ren7jfmuz5mqskkpb7xepww@e3v35j7bk7dc>
 <ag7uW7KQ5mVyCGEv@nidhogg.toxiclabs.cc>
 <20260522-unbehagen-baumethode-erlesen-811a4065eeac@brauner>
 <20260522120757.GA21041@lst.de>
 <ahVzkf8JoKP-kSC2@nidhogg.toxiclabs.cc>
 <20260528-offiziell-luftleer-misswirtschaft-3503bda2ad70@brauner>
 <fjdfwhwi4aogyiaoijwvw6w4npuu5mbt6ua6fkhwcp5ajlm543@ume2fkxg36cb>
 <aiE_YQc6SGSdWlcE@aalbersh-thinkpadx1carbongen13.rmtcz.csb>
 <20260604-holen-rundum-ausfechten-2193b39da363@brauner>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260604-holen-rundum-ausfechten-2193b39da363@brauner>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Gm6vzLZjUX9O3WUIXSBoM_7iJ70KoE2J118whzG9Vi8_1780574827
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2026-06-04 14:00:07, Christian Brauner wrote:
> On Thu, Jun 04, 2026 at 11:04:32AM +0200, Andrey Albershteyn wrote:
> > On 2026-05-28 16:50:45, Andrey Albershteyn wrote:
> > > On 2026-05-28 14:20:08, Christian Brauner wrote:
> > > > On Tue, May 26, 2026 at 12:19:43PM +0200, Carlos Maiolino wrote:
> > > > > On Fri, May 22, 2026 at 02:07:57PM +0200, Christoph Hellwig wrote:
> > > > > > On Fri, May 22, 2026 at 12:03:20PM +0200, Christian Brauner wrote:
> > > > > > > > I was expecting this to come through xfs tree too if Eric and Christian
> > > > > > > > agree.
> > > > > > > 
> > > > > > > You may take it through the xfs tree if there are no conflicts with
> > > > > > > vfs-7.2.iomap. If there are I want to add the iomap changes into
> > > > > > > vfs-7.2.iomap that you can pull in.
> > > > > > 
> > > > > > Merging the iomap bits through the iomap branch might make sense, given
> > > > > > that iomap usually tends to see quite a bit of activity.
> > > > > > 
> > > > > 
> > > > > That sounds good to me. If you want to go ahead and pull in the iomap
> > > > > bits, do so, and give me a heads up when you do it so I'll pull your
> > > > > branch locally.
> > > > 
> > > > Great, can the series please be resent based on current vfs-7.2.iomap
> > > > then please? Because the iomap changes in this series don't apply
> > > > cleanly on vfs-7.2.iomap so we already have merge conflicts...
> > > > 
> > > 
> > > hmm do you mean this branch?
> > > https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git/log/?h=vfs-7.2.iomap
> > > 
> > > patches 07..09 seems to apply cleanly. The only conflict I see is in
> > > the overlayfs patch 03. This is because [1] (is in -rc5) is missing
> > > in vfs-7.2.iomap.
> > > 
> > > [1]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/fs/overlayfs/util.c?h=v7.1-rc5&id=0c8c88b8eb82a2a41bec5f17c076d6312dc40316
> > 
> > Christian, ping
> > 
> > Would be nice to have iomap in vfs, so Carlos can pull and test the
> > rest
> 
> Applied but note IOMAP_F_FSVERITY
> changed from (1U << 10) to (1U << 11) since we have another flag
> addition this cycle.

Oh I haven't noticed that, thanks!

-- 
- Andrey

