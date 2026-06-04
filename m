Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE6173F5BD1
	for <fsverity@lists.linux.dev>; Thu,  4 Jun 2026 09:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780563879; cv=none; b=uhlyekYwxr6zqYqN0Z4IIf49IMeJ3kwWJfw4+MC6BicfHCPkOrUG10hu3wU+q+kOl3IZvSfi3zwR6y56ZquBx2gR4NER7U3PB8Vjv1zzo6yBvIaBHK1q19RDRgwPfL6+PyEZZDeOf9T91fUrYMeHzJtJPi2I6+XOg0wYwb9IMlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780563879; c=relaxed/simple;
	bh=PDUUSU7kmVZUxeHMY1MJ5BVFtGwJ68ein9IpwK/HpUg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=G6vXSTyUpO7a426IsI6TCeHRzVm/t4i8Mig4SAZZ4vHV6+941rTTfTgsjE3PBoKtJmlvZykraSrks+ybtOXQV0OfM3cXMWkMgy0R9ycWcdc1Y2n2Hv/sGJreMOc+LHILV4wJ4BjYLWDMKjGZnv+k0MPjMWldRth/4m3ePRFdGcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=c6GvCVeU; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="c6GvCVeU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780563877;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2lQs9dI0tAeFPaJ8i1YwQIsal8XYYdyr4lp1F85T2xk=;
	b=c6GvCVeUnhkZHx4BST2s95bSWk4UDnG7oQfmymIAja8QHnomZzWf9Fk1mvWKccCOXf+5f4
	jEIx5VWDpWFRq+wW0Pb0CNb6InXSPR/bqfDUeT9sUmmwvBTarNrBtqTiBYUgxmwdQngDtg
	9oihLHRQqQ4EftErBMQDF3VShLHvFrY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-551-G7MIqEPPOD6bHXWchsmDPQ-1; Thu, 04 Jun 2026 05:04:35 -0400
X-MC-Unique: G7MIqEPPOD6bHXWchsmDPQ-1
X-Mimecast-MFC-AGG-ID: G7MIqEPPOD6bHXWchsmDPQ_1780563874
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-45ef5e38a18so227650f8f.1
        for <fsverity@lists.linux.dev>; Thu, 04 Jun 2026 02:04:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780563874; x=1781168674;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2lQs9dI0tAeFPaJ8i1YwQIsal8XYYdyr4lp1F85T2xk=;
        b=hwxY5Pm4jq1AGwArvxcedHUGUI/XmXpBbBgTW99A4QJE3/cZRlfmMQhY2zmaHWsL3Z
         N6z0JxF7J087M7WoGmp6wKeMQAmzg5yhgUIZFufXXYp0rhTsQ56PoFDaSMZyuHNbq6lR
         cg0X1LmX+zRTNXUrGgfMXwkpx4XFe5RKNtzo8XPmugjug5kXqKHFiEY8uGLBq/JApRzf
         0T5T5KzcEnniMGNeWj0rzkbLMe2oN2ffEpK8dUXcyQGALFC5LOtDajxvzwF1HIia8n5m
         2+FMZANAudyU6Sc3iaUVWmyzp9/CSz45/uyFT/CSicxb7pzguFbTkP2InHcw9VpJ2Jew
         7AJg==
X-Forwarded-Encrypted: i=1; AFNElJ/dsFvBvffaRcTQurR4DsAn9p9lwEHsFxriZLNw2pMr/o8a2xZVzgrERPfjbYh6dSytLotYBu5EcQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyCOrQZxbGM/G7Ib0/3yHPw7B1cv43LPMrsct4RTI4cOmEgFOEZ
	tEZHE+Rx+cNroJGplkn2SvN++21w3Ouepx+hywHshKnCTzAn/uCJnt10kX2DHUUdxuRXrEehd/5
	fxAZaVx7KhOxJ3+MauD9cicdeRAwr85bglWr8VSspR1cPU/cadgDJR59ML28=
X-Gm-Gg: Acq92OFWNTynIamPCBKedBRGbnca0MlCIa0E+k9TBDZgqW+V66bELpRiYl4Ot3Saz9U
	YuhvzPosqFBLhmOOiKYRPzALyVXVIzaEj6NBkfch4Sx1hgWAEG6t8wYtWAhC+jtCS1gweT4GAI0
	qwZtyuALToKgSmU3+jCP9iBLjfvNNT7neJt5z8kIKVuE+H239mQGBcKYRWp0LQ6GTSDNEJPwZzh
	Zic/wYykkSrCMW4enTkPT5bNME7+M3EtYlPA60pkL9ZzWXd7bHaMA2fU7n7Gamp6jvNTzCOhEpF
	bF4WKu59Z71jvR26cSNbyaZ1SnNivbpljX9SJeNh/l0gW5fv1cEqVjyhVN+QRLruz/xYy1bJItN
	PAr/HMYQjbtRQnYsMrRvo9zUH1l3BaQCtngKTpd7xhIClz866Zln4aCyKqMAI3oAjUTE=
X-Received: by 2002:a05:6000:43d4:20b0:460:f36:79b0 with SMTP id ffacd0b85a97d-4602182b90dmr8717137f8f.19.1780563874002;
        Thu, 04 Jun 2026 02:04:34 -0700 (PDT)
X-Received: by 2002:a05:6000:43d4:20b0:460:f36:79b0 with SMTP id ffacd0b85a97d-4602182b90dmr8717074f8f.19.1780563873372;
        Thu, 04 Jun 2026 02:04:33 -0700 (PDT)
Received: from aalbersh-thinkpadx1carbongen13.rmtcz.csb ([217.30.74.39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcde3sm16539954f8f.1.2026.06.04.02.04.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 02:04:32 -0700 (PDT)
Date: Thu, 4 Jun 2026 11:04:32 +0200
From: Andrey Albershteyn <aalbersh@redhat.com>
To: Christian Brauner <brauner@kernel.org>
Cc: Carlos Maiolino <cem@kernel.org>, Christoph Hellwig <hch@lst.de>, 
	Andrey Albershteyn <aalbersh@kernel.org>, linux-xfs@vger.kernel.org, fsverity@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, ebiggers@kernel.org, linux-ext4@vger.kernel.org, 
	linux-f2fs-devel@lists.sourceforge.net, linux-btrfs@vger.kernel.org, linux-unionfs@vger.kernel.org, 
	djwong@kernel.org, david@fromorbit.com
Subject: Re: [PATCH v10 00/22] fs-verity support for XFS with post EOF merkle
 tree
Message-ID: <aiE_YQc6SGSdWlcE@aalbersh-thinkpadx1carbongen13.rmtcz.csb>
References: <20260520123722.405752-1-aalbersh@kernel.org>
 <20260521090705.GA14254@lst.de>
 <gcw7zcg6p4s2egpufwizfig72g6ren7jfmuz5mqskkpb7xepww@e3v35j7bk7dc>
 <ag7uW7KQ5mVyCGEv@nidhogg.toxiclabs.cc>
 <20260522-unbehagen-baumethode-erlesen-811a4065eeac@brauner>
 <20260522120757.GA21041@lst.de>
 <ahVzkf8JoKP-kSC2@nidhogg.toxiclabs.cc>
 <20260528-offiziell-luftleer-misswirtschaft-3503bda2ad70@brauner>
 <fjdfwhwi4aogyiaoijwvw6w4npuu5mbt6ua6fkhwcp5ajlm543@ume2fkxg36cb>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <fjdfwhwi4aogyiaoijwvw6w4npuu5mbt6ua6fkhwcp5ajlm543@ume2fkxg36cb>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: CMZnoxq8f2Zyapye9Gqz2RrwV0mHONwgi5mYuZ3z0us_1780563874
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2026-05-28 16:50:45, Andrey Albershteyn wrote:
> On 2026-05-28 14:20:08, Christian Brauner wrote:
> > On Tue, May 26, 2026 at 12:19:43PM +0200, Carlos Maiolino wrote:
> > > On Fri, May 22, 2026 at 02:07:57PM +0200, Christoph Hellwig wrote:
> > > > On Fri, May 22, 2026 at 12:03:20PM +0200, Christian Brauner wrote:
> > > > > > I was expecting this to come through xfs tree too if Eric and Christian
> > > > > > agree.
> > > > > 
> > > > > You may take it through the xfs tree if there are no conflicts with
> > > > > vfs-7.2.iomap. If there are I want to add the iomap changes into
> > > > > vfs-7.2.iomap that you can pull in.
> > > > 
> > > > Merging the iomap bits through the iomap branch might make sense, given
> > > > that iomap usually tends to see quite a bit of activity.
> > > > 
> > > 
> > > That sounds good to me. If you want to go ahead and pull in the iomap
> > > bits, do so, and give me a heads up when you do it so I'll pull your
> > > branch locally.
> > 
> > Great, can the series please be resent based on current vfs-7.2.iomap
> > then please? Because the iomap changes in this series don't apply
> > cleanly on vfs-7.2.iomap so we already have merge conflicts...
> > 
> 
> hmm do you mean this branch?
> https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git/log/?h=vfs-7.2.iomap
> 
> patches 07..09 seems to apply cleanly. The only conflict I see is in
> the overlayfs patch 03. This is because [1] (is in -rc5) is missing
> in vfs-7.2.iomap.
> 
> [1]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/fs/overlayfs/util.c?h=v7.1-rc5&id=0c8c88b8eb82a2a41bec5f17c076d6312dc40316

Christian, ping

Would be nice to have iomap in vfs, so Carlos can pull and test the
rest

-- 
- Andrey

