Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 245F73D0BE7
	for <fsverity@lists.linux.dev>; Thu, 28 May 2026 14:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779979854; cv=none; b=ny7ckAuy9KmW5UUPRUaCTyZxWtUJj2AmyuF0A4wNrZxuzJKlTmTBaQoDA7VfxAISfRqgyJomhDN35wpVDtAHmMctxAhP5xwuIa4+ejiRmYDCQNL88XpiwTEpExMLfunmeepyh83uSP/C1KxPbV5jWTwB03ZYG2q8CAN8L23zSxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779979854; c=relaxed/simple;
	bh=XTdh+SCtDlOb+7DDE8GqAquXCqeELh5PH2AOrxbg70Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=MYtVEC4dEPi1CVYMzCGg4T2CivSGgcgZuSJR9MR7A/qVl9XQtPk+Kc/S8fOaSKJjw6l75/LYZ7ecWrAwRnM6mUjUsgglGE6dzWvUXC9ZokJLPN3BGzKys02MLx2s+LDKEt7OLH0YYMTPbVEspQs3tSCXfMmZXRpchwwbMgwQfNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=c2CDlTx5; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="c2CDlTx5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779979852;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UBtkZg2KzsdpXCtGBF+S9Fg8Iz8UrMjxsxZEct4ck8E=;
	b=c2CDlTx5cHqF7Qp4RqWsCV6ozyS6Kn7fNPeYjPJRWXejmnFQ85HCWCgZklCakly/jqPNY4
	Lfd1WvREbbE0JM1lD2pbP85TrZVIGo6IfONmzLM2D/1++6J/rZL1EeIwz+SAThZpjk9EIx
	VcrSiByqq/3yWMxWawycpglgGAafuHs=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-606-1392rb_gNt-s-ygD-OdMEQ-1; Thu, 28 May 2026 10:50:50 -0400
X-MC-Unique: 1392rb_gNt-s-ygD-OdMEQ-1
X-Mimecast-MFC-AGG-ID: 1392rb_gNt-s-ygD-OdMEQ_1779979849
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-44a52d5e572so8947788f8f.3
        for <fsverity@lists.linux.dev>; Thu, 28 May 2026 07:50:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779979849; x=1780584649;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UBtkZg2KzsdpXCtGBF+S9Fg8Iz8UrMjxsxZEct4ck8E=;
        b=HZBPjsdnQhG9H5tDd+23NWCHLoCL1SSD3VuRiNaXIuSPlQJSCIS6CSk6OCRDMMoAPJ
         KZgjZzlPc/HD1sN0hAkeyBcI362PcNi5sgwCiQ1525C4dYXW4JBcoWkLTrcLlN6LCaWN
         XCipy4mV3UnAyep9HRy3g0qS3zFPwG5FDy9u13cIPdP92dcLH6ZRdTEUDMy16jetwohm
         fv2KMDV3jskTIu47zpU7NL6pJ4U21jPXHXaK1B6ZXCLdmgxtXuUdfKr7GQty2zlXIxYQ
         iIlNi4WHSbs1rBQW/PuJhvG6r5YMUov54r48lwImpg/BFYNaVMXIGS5T8jLoYlLjeHDH
         WHyA==
X-Forwarded-Encrypted: i=1; AFNElJ/xjJdgaQJsi4zUTKMPagRmwRKMHyF0pl9JU3L3cEzZthShyIc4r3ifsbaU/OWt1tCLBEijHaGCJg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxG7wQ3Ds9ge+NKF9BG0+hj3gykFeZxGECmiDEauI/y/EHSaKtv
	j/KfG3ZheF7IemfgF6cPGubKZOwp65scwhB13hV3yV4FDmgEH7U0omcMSAUVUF4+xcfMpcPMCd6
	VEH4Ra3wCpsmCToD2sbMFMXzkNFRTnbJdYKzYgCg6b0SYbcPGF9k9m+WFnzs=
X-Gm-Gg: Acq92OErAcN2xOfGLRCth36WO1xw/pxEkT4FAWRQCooSg/2i3ch6W06wR6YzpQyFq5x
	u41I3F1lLhQvmOYL79wLMFOeZo4Q55mjXlw0q7ilOR7zXqPPxRhbHTe/bg4wuP+3R08Qv10UZeW
	oMoeqWCteEUdQM+DuTOhVawYlWIklcAK+1IQ2WmkX31JHUMS9C4qNtsILuaJkQG/EhxEhCr0mfk
	vmwcQxtU18TmT1k3Ix//GtaScG9QbFJsbkH36Nc880wcr+wJC39kvIki6JI5+PGg/xsWHSb9yHq
	iO9qw0MUPe68vMlRK0+7JBgChic8gauGlgbiSg2oMgTmAVTFEuJcf9AsONI0jmGOnkels+kEFSL
	QaNLp+TIezmcQj+jgiiDaKb6xMhF+flrVrzuTjJRowmhVAQqTPU7jTZxtW5lwZo7Myg==
X-Received: by 2002:a05:6000:26c1:b0:44d:1338:46b4 with SMTP id ffacd0b85a97d-45eb36731d0mr47511222f8f.9.1779979848943;
        Thu, 28 May 2026 07:50:48 -0700 (PDT)
X-Received: by 2002:a05:6000:26c1:b0:44d:1338:46b4 with SMTP id ffacd0b85a97d-45eb36731d0mr47511162f8f.9.1779979848360;
        Thu, 28 May 2026 07:50:48 -0700 (PDT)
Received: from thinky (178-221-68-189.dynamic.isp.telekom.rs. [178.221.68.189])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eeb36c40asm3352619f8f.13.2026.05.28.07.50.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 07:50:47 -0700 (PDT)
Date: Thu, 28 May 2026 16:50:45 +0200
From: Andrey Albershteyn <aalbersh@redhat.com>
To: Christian Brauner <brauner@kernel.org>
Cc: Carlos Maiolino <cem@kernel.org>, Christoph Hellwig <hch@lst.de>, 
	Andrey Albershteyn <aalbersh@kernel.org>, linux-xfs@vger.kernel.org, fsverity@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, ebiggers@kernel.org, linux-ext4@vger.kernel.org, 
	linux-f2fs-devel@lists.sourceforge.net, linux-btrfs@vger.kernel.org, linux-unionfs@vger.kernel.org, 
	djwong@kernel.org, david@fromorbit.com
Subject: Re: [PATCH v10 00/22] fs-verity support for XFS with post EOF merkle
 tree
Message-ID: <fjdfwhwi4aogyiaoijwvw6w4npuu5mbt6ua6fkhwcp5ajlm543@ume2fkxg36cb>
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
X-Mimecast-MFC-PROC-ID: s6AtcNXGTmQM9BZhat8WO0jivxRK6WIvTTT59Y58dfI_1779979849
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

hmm do you mean this branch?
https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git/log/?h=vfs-7.2.iomap

patches 07..09 seems to apply cleanly. The only conflict I see is in
the overlayfs patch 03. This is because [1] (is in -rc5) is missing
in vfs-7.2.iomap.

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/fs/overlayfs/util.c?h=v7.1-rc5&id=0c8c88b8eb82a2a41bec5f17c076d6312dc40316

-- 
- Andrey

