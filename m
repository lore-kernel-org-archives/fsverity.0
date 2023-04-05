Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B3C7653
	for <fsverity@lists.linux.dev>; Wed,  5 Apr 2023 10:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680691010;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8hFqrvNZsn86teCYjqs2wVJUMFZmHeavzTexdU+dVHw=;
	b=ccCG7nTXb1/1ej0Laf9Vh/R/4XTtROvhrW+TT0tyvb2ogDWHgnGy0ajOCN438/wTyqWxBu
	td/a7bL5Be0awf1Ss8AS/soY/mxmyh4zdByrGPNKgdjKJMFMAuyeLgxv8zHNtVbWUUmDbS
	XwidgRsjWrMlFl+5JhH5TTwzuY+Noko=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-466-pydkJYQCOnSYmfec9tP8FA-1; Wed, 05 Apr 2023 06:36:48 -0400
X-MC-Unique: pydkJYQCOnSYmfec9tP8FA-1
Received: by mail-qt1-f199.google.com with SMTP id l13-20020a05622a174d00b003e4df699997so21884151qtk.20
        for <fsverity@lists.linux.dev>; Wed, 05 Apr 2023 03:36:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680691008;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8hFqrvNZsn86teCYjqs2wVJUMFZmHeavzTexdU+dVHw=;
        b=Tg3fo4CBQV/vHMIMFu+4lUf50nb2UbMR+DTkLE1zEK+K1UqjzcgmYMvzAkcWXYW8iD
         0/BF1eit5odrC1mcBD32kPOCypiwHvvmf91cVE5UhWSOQoDh693HzUS/z6WtIUJAhYBS
         Ezwli/5bj7zJCR54kf9gNcha5fCUDaI2j0ftzTlK4mwWYYpv30zTkN0ck7X2uPFgWz6Z
         aXEi95eboPajfefU+2SfgxW1p0FH0xt5vgrjEWJVn4OjYmluXBXz80lONxZTSpo/Zq5a
         NHvFzcsC/dDeXDkMcgz3BkXITLgvH43RkDBKGn1Q1lt7KCDF7ZmB9Nq28j+1L2BjpI7r
         QJJQ==
X-Gm-Message-State: AAQBX9fA/mD9ULqONXoLU9nei3WWD7sL+t3qkbwQyVttGylFhwEVnHo7
	uybEC0TKQl8dXkwTcNRDU40Fbp/sE0WZ49sCP2p+GnsPW7oNGtGLhYNEvt8FNVOri1HQDIMkRz7
	QLpj0fQp2j7CHklJBOw==
X-Received: by 2002:a05:622a:181c:b0:3da:aa9b:105a with SMTP id t28-20020a05622a181c00b003daaa9b105amr4016627qtc.17.1680691008082;
        Wed, 05 Apr 2023 03:36:48 -0700 (PDT)
X-Google-Smtp-Source: AKy350Yray4mqL/DA63FufP2W8G+Q2vCv/dEYqnAM/OkHjKwnv430c/AiUDk3FXiS3P6h8ilen17Eg==
X-Received: by 2002:a05:622a:181c:b0:3da:aa9b:105a with SMTP id t28-20020a05622a181c00b003daaa9b105amr4016592qtc.17.1680691007736;
        Wed, 05 Apr 2023 03:36:47 -0700 (PDT)
Received: from aalbersh.remote.csb ([109.183.6.197])
        by smtp.gmail.com with ESMTPSA id i2-20020ac84882000000b003d5aae2182dsm3911845qtq.29.2023.04.05.03.36.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 03:36:47 -0700 (PDT)
Date: Wed, 5 Apr 2023 12:36:42 +0200
From: Andrey Albershteyn <aalbersh@redhat.com>
To: Christoph Hellwig <hch@infradead.org>
Cc: djwong@kernel.org, dchinner@redhat.com, ebiggers@kernel.org,
	linux-xfs@vger.kernel.org, fsverity@lists.linux.dev,
	rpeterso@redhat.com, agruenba@redhat.com, xiang@kernel.org,
	chao@kernel.org, damien.lemoal@opensource.wdc.com, jth@kernel.org,
	linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org,
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	cluster-devel@redhat.com
Subject: Re: [PATCH v2 05/23] fsverity: make fsverity_verify_folio() accept
 folio's offset and size
Message-ID: <20230405103642.ykmgjgb7yi7htphf@aalbersh.remote.csb>
References: <20230404145319.2057051-1-aalbersh@redhat.com>
 <20230404145319.2057051-6-aalbersh@redhat.com>
 <ZCxCnC2lM9N9qtCc@infradead.org>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <ZCxCnC2lM9N9qtCc@infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Christoph,

On Tue, Apr 04, 2023 at 08:30:36AM -0700, Christoph Hellwig wrote:
> On Tue, Apr 04, 2023 at 04:53:01PM +0200, Andrey Albershteyn wrote:
> > Not the whole folio always need to be verified by fs-verity (e.g.
> > with 1k blocks). Use passed folio's offset and size.
> 
> Why can't those callers just call fsverity_verify_blocks directly?
> 

They can. Calling _verify_folio with explicit offset; size appeared
more clear to me. But I'm ok with dropping this patch to have full
folio verify function.

-- 
- Andrey

