Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DC2B37B400
	for <fsverity@lists.linux.dev>; Thu, 21 May 2026 09:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779356541; cv=none; b=e4yLiZKXX8rJ0FGzw0VUpZQN4xLqV/z66pCSlcFUm+kXtgd2HOuq1JY5K+PQYtBMrWq4J+lpRbEA1E8XdpfdG09DbpBvWb19W1yZrpAJYPNYHiFBeJtvIQJaK8BrKZh0cxn6unAMAHdULlv2Ju44W4g6OLmQvPgdKNiMS4cAC60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779356541; c=relaxed/simple;
	bh=/n6YuXXsfcsk7J7Yb0y1thOCuPSSvlN7WSB70uhim0c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=TcqWbKZFM/wbkIaoun7eAqW5eLKnpWn+q+wAiKvd/dVa+EGjYDi1cxZ3g2HcBgO29kmiFdMJGB/OyfK/f6hfc7ug7ovLn4zVfhuIYfCYaTfJm0TLYbGyVr3hQoG1H8yNyW5Wc7hcRe3T+U3lYIdZJoFi1xl82wkMcGCKAudWyBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bGcQDpYv; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bGcQDpYv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779356539;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0WzMLsQukLw8E3UhBm+/KFb/Fo3mZZq0u+Zrumr4RyU=;
	b=bGcQDpYvPLEbfBQZC3lTQsyr+3H+rvNlLXE3wyLChrVgz3Apo2altjc2wB8pfFOfDsNfFa
	UadquxiGdIqFnEDcyI2HQZx4+8VlVdn7CmW1otNXES/tIBRVaUSEV1co+/vet7wFiJPgDJ
	a/dekJKAtWfO86M4E3Kz6p0phUb113Y=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-643-AJefaCREOJGr6Goim6_OEw-1; Thu, 21 May 2026 05:42:17 -0400
X-MC-Unique: AJefaCREOJGr6Goim6_OEw-1
X-Mimecast-MFC-AGG-ID: AJefaCREOJGr6Goim6_OEw_1779356536
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-44bf1ac8893so4622836f8f.0
        for <fsverity@lists.linux.dev>; Thu, 21 May 2026 02:42:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779356536; x=1779961336;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0WzMLsQukLw8E3UhBm+/KFb/Fo3mZZq0u+Zrumr4RyU=;
        b=EUkaS1fjnPJG8pU6Rr0bFXrdvI2bcvycpO4TMX4u31KIIYP+ayN5rf4RITVsJcB/oa
         ZYihkg8QLbXcAlodLEjQjLSLHdije+jJqWPqSOrq7dmvhza3y3fsqI5stCFksTAuN2rf
         2sa0qRlHKSboTzg5bGb6Y9BoZzn7uFQd/83ZD1gru1N0kKtHNN4Xg+g72eyVIccESggw
         qrbZd7tGDr0XOK60pFnE63AmlgjkWO7fOhLdta/3wpZrX9ZUyRiQhFiXU/+JsU5IazBb
         erLShaskcpZKmvoLi5uavfWYjT3akhZ3fFzji8XvLm1B8BAMolCpu4wVC7fSKVq21fSg
         MzWg==
X-Forwarded-Encrypted: i=1; AFNElJ8M+glFtO3Om4ClaOvblejSPS3+BzQvdwYcopNCAFjjOZihMUco5nh7sbJZvFIHdDY/o04dmGWEfA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwIsfnGhKoXGCkrtANhr6DgdbBKnQPgl0TBqJD0yuBWNTvxq0/z
	Abxqru2D5lGBiwLP/vvqLWH+o8TRluizHPKTr2b7esSXLVoZUg/cXo9MoMAJ94DOxTKCekg1IRu
	VaIYkx5IC0ztH88nXlsfbB4N2Je+rYdzkdU93gDOKBrDFXQbwSZSVBid1s3XNsf+RTVk9Qw==
X-Gm-Gg: Acq92OF1YLH0VGt9e/QQaA9UEDWAPI7GdfJQA+3iadyEntHUw7XkVNOFS9MtajU2Lve
	YdaHtS05Bj0H7HrLRfDvAcYbheIAxRNPcqCT+oz5PdR+dKDix7rJ36gegrFAxJwsSSpHPzz0OkT
	YsZCpSBuXn7FJXx8LLjKfIa5wVmgWvukMuUsVj0QzofjKbe108Vab+RtZXsVYNOdvtaX4ngOpfL
	JrXQ0gsvVygbTcjPJ76jf1rh1rO2mIeMlSHckN141aMwUXbets6z6f6Bf35J0bp47pWBKvOFspV
	ZbiJULgOpVFy1KgTsvBIFBfjMOYm+gX2w/ED9+5SYFRYNHyTwyPnj6SGeNegATTO3D0eofRrnDj
	QRQbJSDXkylXBY3dvVvIURZhvIfwq9SLUM7V56eJzjefjKM2Q5w2GSHI=
X-Received: by 2002:a05:600c:81c9:b0:490:3cec:52f5 with SMTP id 5b1f17b1804b1-4903cec55f5mr9775905e9.2.1779356536295;
        Thu, 21 May 2026 02:42:16 -0700 (PDT)
X-Received: by 2002:a05:600c:81c9:b0:490:3cec:52f5 with SMTP id 5b1f17b1804b1-4903cec55f5mr9775515e9.2.1779356535822;
        Thu, 21 May 2026 02:42:15 -0700 (PDT)
Received: from thinky (178-221-68-189.dynamic.isp.telekom.rs. [178.221.68.189])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4903c9abbadsm13930015e9.8.2026.05.21.02.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 02:42:15 -0700 (PDT)
Date: Thu, 21 May 2026 11:42:13 +0200
From: Andrey Albershteyn <aalbersh@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Cc: Andrey Albershteyn <aalbersh@kernel.org>, linux-xfs@vger.kernel.org, 
	fsverity@lists.linux.dev, linux-fsdevel@vger.kernel.org, ebiggers@kernel.org, 
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
	linux-btrfs@vger.kernel.org, linux-unionfs@vger.kernel.org, djwong@kernel.org, 
	david@fromorbit.com
Subject: Re: [PATCH v10 00/22] fs-verity support for XFS with post EOF merkle
 tree
Message-ID: <gcw7zcg6p4s2egpufwizfig72g6ren7jfmuz5mqskkpb7xepww@e3v35j7bk7dc>
References: <20260520123722.405752-1-aalbersh@kernel.org>
 <20260521090705.GA14254@lst.de>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260521090705.GA14254@lst.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: RTAkrmgBp-zZRo-aqOGcnBpZlAnDYABZ27P3LRNV-vs_1779356536
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2026-05-21 11:07:05, Christoph Hellwig wrote:
> On Wed, May 20, 2026 at 02:36:58PM +0200, Andrey Albershteyn wrote:
> > This series based on v7.1-rc4.
> 
> How are we going to merge this?  It touches at three subsystem trees
> (fsverity, vfs/iomap, xfs) so some coordination will be needed.

As most of the patches are xfs, it's probably make sense to go
through xfs tree

Carlos, what do you think?

-- 
- Andrey

