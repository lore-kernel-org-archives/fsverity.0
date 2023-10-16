Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B11273E9
	for <fsverity@lists.linux.dev>; Mon, 16 Oct 2023 12:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fgtkUBqW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697459836;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Su8yaNN6gleYsl9c5NRTrh5jb8id9qjQrOt8Qy4EQT8=;
	b=fgtkUBqWajvxpA0bTEPyOVw87UuR+Go4t5HGvlpjL53OiU2KUcNxoUs4DIqADlUQIjU5aP
	4eAqk7SmnEdi4V8ZzSzv2WSxDLnob72K51IiqIjjAaxAkP1+zyA3P2DohRgs/BaqASebS+
	CeTrrpworRslKqpq9jGwl0WR2FxAKZE=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-130-g_FHSM4IO9m1rGlZeSpl_A-1; Mon, 16 Oct 2023 08:37:14 -0400
X-MC-Unique: g_FHSM4IO9m1rGlZeSpl_A-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-9b2e030e4caso579206966b.1
        for <fsverity@lists.linux.dev>; Mon, 16 Oct 2023 05:37:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697459833; x=1698064633;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Su8yaNN6gleYsl9c5NRTrh5jb8id9qjQrOt8Qy4EQT8=;
        b=pwJPpwumcxsHX2OOVurI6Ofzbtx5GNI8igG49OJKuvJNHWrR18wiYWx6hS3+2ge4wv
         KEfvygfhZES2U4qREnuboYwVasMoAY80kOOmFviy9f7iZ1siT7SKdL/e0ZfYYhH6iQ9l
         qs8HiQ+dRy3tLngNfF8s4jqLJqoR+Bn3YBGl8IcNWwK0o/lOUeHo7N41PbOvHUrUVdG2
         ZkBZP7LLxISrz8qQjlI5+SwVnAKPYfmP3RDDTNkHnVK5gCxEZ1jg25IAx74b8r7vpfAD
         NSfN+xPRu4fdF8bpC2xF0JTazbuUaGcPM1K05aoTSHCvg+DUBtR10Q2k1OmGeOhnYomz
         DxSQ==
X-Gm-Message-State: AOJu0YwrRnJnBOazoUpCi2DjYYLlsG0pNk7OK9B2gt60ngd3pSsjjwOm
	zCEuIfpJZktRim8JE5MR7mLfp+pmkvd375SyJdpdKiNuRUz8k7quLah2st6m1erPk0Ss6aNqjGP
	COgVx7e7WXvlo/wwdvg==
X-Received: by 2002:a17:907:7ea7:b0:9ad:cbc0:9f47 with SMTP id qb39-20020a1709077ea700b009adcbc09f47mr6137028ejc.12.1697459833629;
        Mon, 16 Oct 2023 05:37:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGTeQ/M+ycZkOVQebj4aUcWiSA9VpuBVUaM9K8JgYaF1bg0BBb1USApDPF/nmxRKtrWDQwtMg==
X-Received: by 2002:a17:907:7ea7:b0:9ad:cbc0:9f47 with SMTP id qb39-20020a1709077ea700b009adcbc09f47mr6137016ejc.12.1697459833363;
        Mon, 16 Oct 2023 05:37:13 -0700 (PDT)
Received: from thinky ([109.183.6.197])
        by smtp.gmail.com with ESMTPSA id ck22-20020a170906c45600b009b2d46425absm3979682ejb.85.2023.10.16.05.37.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 05:37:12 -0700 (PDT)
Date: Mon, 16 Oct 2023 14:37:12 +0200
From: Andrey Albershteyn <aalbersh@redhat.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	fsverity@lists.linux.dev, ebiggers@kernel.org, david@fromorbit.com, dchinner@redhat.com
Subject: Re: [PATCH v3 15/28] xfs: introduce workqueue for post read IO work
Message-ID: <skhqdob6wt3azlx64ndumvk3mxd2bxrbvqxho6ykf3otwed5vj@5bzi44xmh7vs>
References: <20231006184922.252188-1-aalbersh@redhat.com>
 <20231006184922.252188-16-aalbersh@redhat.com>
 <20231011185558.GS21298@frogsfrogsfrogs>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20231011185558.GS21298@frogsfrogsfrogs>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2023-10-11 11:55:58, Darrick J. Wong wrote:
> On Fri, Oct 06, 2023 at 08:49:09PM +0200, Andrey Albershteyn wrote:
> > As noted by Dave there are two problems with using fs-verity's
> > workqueue in XFS:
> > 
> > 1. High priority workqueues are used within XFS to ensure that data
> >    IO completion cannot stall processing of journal IO completions.
> >    Hence using a WQ_HIGHPRI workqueue directly in the user data IO
> >    path is a potential filesystem livelock/deadlock vector.
> > 
> > 2. The fsverity workqueue is global - it creates a cross-filesystem
> >    contention point.
> > 
> > This patch adds per-filesystem, per-cpu workqueue for fsverity
> > work.
> 
> If we ever want to implement compression and/or fscrypt, can we use this
> pread workqueue for that too?

I think yes.

> Sounds good to me...
> Reviewed-by: Darrick J. Wong <djwong@kernel.org>

Thanks!

-- 
- Andrey

