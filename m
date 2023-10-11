Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 422381DA58
	for <fsverity@lists.linux.dev>; Wed, 11 Oct 2023 11:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XG+c8Z1e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697022563;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/7i0TJFI9d4XbjTdESSdpldcYJIKaHsNys5HjyA4API=;
	b=XG+c8Z1ePB7bjB+wvPI1kK3mjmQhW7LzLFkQ0y3JAuDdBZBtPr4C3//NA7HROtyBqvBqPL
	/aXGYkT3CNgMsctY7yrRp0jheRAc4cU+hcxrTmWHkb0u494GKbpXo3k+bZqUhQWfP0Lg/F
	YwpX0Mg0UmaOQCo4xEoRfta722UCY9U=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-287-7f06zRvpNLitdIqKS__sgw-1; Wed, 11 Oct 2023 07:09:21 -0400
X-MC-Unique: 7f06zRvpNLitdIqKS__sgw-1
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-5042eca54a4so6116547e87.2
        for <fsverity@lists.linux.dev>; Wed, 11 Oct 2023 04:09:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697022560; x=1697627360;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/7i0TJFI9d4XbjTdESSdpldcYJIKaHsNys5HjyA4API=;
        b=JHM8QC1GlVnXmL87+Cs/11EnU4xE8+uAISq5eSCJizfy2/k1o7dOn3JMqwBeLtEYiH
         miWtDidr8KG49e+iK1jfhTGc4iEde3zaLhHcUz7dRwaqPWxhnWIf8L9pNrFCnOiDWLXH
         wDsK+Io+aJDigg2flt2fUzJB7hrnU/RQt4qce+tH+OyB1MMZvgg3ibMvxDjxmNO1RlN+
         YJmc+aUAb3Z3ccTUw7rK42b5zOmr3GpwtCuf/da00seCu2Vk3C0qAkSAItI+LiL1fIAl
         6YR+Sd5yvLYsklP/0QO/tow8gR7PMAf4NQLXBPFqENdDqCNGTocn2JqDgnhRw6yAFMkk
         y/ig==
X-Gm-Message-State: AOJu0YxY/yb9Sw/OskaMk0c44BNduZb6ja8hFy9HkK8Ey4My3S0d+WuA
	XdH57QminnQ3N37mvDGFXLFq6EYiNrFux9m3BkkCB0HlCxlLyvklQx3b7MuQ/8h7QFfzWgpTHB/
	WQ1EGWb9Iux4T+EIf8w==
X-Received: by 2002:a05:6512:131b:b0:503:3421:4ebd with SMTP id x27-20020a056512131b00b0050334214ebdmr17941168lfu.63.1697022560042;
        Wed, 11 Oct 2023 04:09:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFrllkG05Ach5liC9J7rG6Cgh0JKuFlyZ1Ps6tj2NTHIqGbPHXOS23Vt7t0IiuUT2NNIcszvQ==
X-Received: by 2002:a05:6512:131b:b0:503:3421:4ebd with SMTP id x27-20020a056512131b00b0050334214ebdmr17941144lfu.63.1697022559604;
        Wed, 11 Oct 2023 04:09:19 -0700 (PDT)
Received: from thinky ([109.183.6.197])
        by smtp.gmail.com with ESMTPSA id l21-20020aa7d955000000b00537f44827a8sm8753240eds.64.2023.10.11.04.09.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 04:09:19 -0700 (PDT)
Date: Wed, 11 Oct 2023 13:09:18 +0200
From: Andrey Albershteyn <aalbersh@redhat.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	fsverity@lists.linux.dev, ebiggers@kernel.org, david@fromorbit.com, dchinner@redhat.com, 
	Allison Henderson <allison.henderson@oracle.com>
Subject: Re: [PATCH v3 04/28] xfs: Add xfs_verify_pptr
Message-ID: <6g3pgk5lne5otglajnnt6badujg2x45uwevv63j5hxngnomqmr@6clv7xn6x2zd>
References: <20231006184922.252188-1-aalbersh@redhat.com>
 <20231006184922.252188-5-aalbersh@redhat.com>
 <20231011010143.GH21298@frogsfrogsfrogs>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20231011010143.GH21298@frogsfrogsfrogs>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2023-10-10 18:01:43, Darrick J. Wong wrote:
> Could you take a look at the latest revision of the parent pointers
> patchset, please?  Your version and mine have drifted very far apart
> over the summer...
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git/log/?h=pptrs-fsck
> 

Sure thing, sorry, haven't checked if they changed.

-- 
- Andrey

