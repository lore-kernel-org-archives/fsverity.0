Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F02A273F4
	for <fsverity@lists.linux.dev>; Mon, 16 Oct 2023 12:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Wvr2vPST"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697459551;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tLG//EhK9I8o7cV+2JFGlMWf+fyb5KvdWdST0xQgYhY=;
	b=Wvr2vPST+aPkF+PVxmk84KuhkXfnM7D5GfoLZ5bo08AfItjVGFs5xECPXoY7U3/MwpmedI
	RnCaDKoT7W1Rwg3CF0A98xzUoOrzr5KV+KN/FaRaAQuecPyEIQ1eTY4UGAP70VtHn/dEtu
	+1pnBE54ei5g/SbPZlNkKCejlqCDGBo=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-668-EcpZLfYANPCcg_ahUW69TA-1; Mon, 16 Oct 2023 08:32:28 -0400
X-MC-Unique: EcpZLfYANPCcg_ahUW69TA-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-9ba247e03aeso307122266b.1
        for <fsverity@lists.linux.dev>; Mon, 16 Oct 2023 05:32:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697459547; x=1698064347;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tLG//EhK9I8o7cV+2JFGlMWf+fyb5KvdWdST0xQgYhY=;
        b=c/4Az0vihnau7lkYX1tRT92JCHaKjtPaHH3tatA9F6xRLi+8pCiIq3gR0KbAXtlbRw
         nUVpfXe826c4+rN6znP6ieuFNJ4AKYTi6c36ETSEt+3UoVL9FahH9qPKQPZFmCoW2AOO
         2SgZSU2y4oqD0kVFNWRxDBas/tNeMb5+L16UEVhJ2YWyToStnVHQcPKwOO/5Kx7QJ5VV
         vBKFAkOXG1w7MzxwiB8zfinpE7I7FG5BR2ibYS6PCfJsm2k5a22rX6lq8JXK+oXrrU8K
         C40g+zdTZuCtVWvSObJV/gg6URV4+J1rRyBzdhk1+dl7UUpyULBOVhI/wnmfH+1Xmuo8
         nt5Q==
X-Gm-Message-State: AOJu0YxwjWulE6irANa9isEMrnnUekkc7JO4dwyG1oeg4+SxcFTvn3Ya
	4n9aI6CmzBSGNdxJFdy6kMnVQWB6sflUE+ComAbr6HuZr9nqJ9gr845wIoH7sgX4Hs6fEn6PQRl
	SXfQV7Pg5sRKWKaPsJg==
X-Received: by 2002:a17:907:d24:b0:9bf:697b:8f44 with SMTP id gn36-20020a1709070d2400b009bf697b8f44mr5569182ejc.6.1697459547463;
        Mon, 16 Oct 2023 05:32:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGB7qmw8VW3+nswiOyGckEp+ZRTcyaKDpWkU2ZIQBuNuhNhMfbhluSMuibOxhIeC+aBVGt8lg==
X-Received: by 2002:a17:907:d24:b0:9bf:697b:8f44 with SMTP id gn36-20020a1709070d2400b009bf697b8f44mr5569163ejc.6.1697459547155;
        Mon, 16 Oct 2023 05:32:27 -0700 (PDT)
Received: from thinky ([109.183.6.197])
        by smtp.gmail.com with ESMTPSA id u26-20020a50951a000000b0053ecef8786asm1641132eda.75.2023.10.16.05.32.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 05:32:26 -0700 (PDT)
Date: Mon, 16 Oct 2023 14:32:25 +0200
From: Andrey Albershteyn <aalbersh@redhat.com>
To: Christoph Hellwig <hch@infradead.org>
Cc: linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	fsverity@lists.linux.dev, djwong@kernel.org, ebiggers@kernel.org, david@fromorbit.com, 
	dchinner@redhat.com
Subject: Re: [PATCH v3 11/28] iomap: pass readpage operation to read path
Message-ID: <xic2dogypvli45ku7nasuuszslvv55tadj6etpl7r3gubvw2o6@hms55yjiqsiq>
References: <20231006184922.252188-1-aalbersh@redhat.com>
 <20231006184922.252188-12-aalbersh@redhat.com>
 <ZSz/FLK+tNIQzOA/@infradead.org>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <ZSz/FLK+tNIQzOA/@infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2023-10-16 02:15:00, Christoph Hellwig wrote:
> Looking at the entire series, it seems like the only XFS-specific
> part of the fsverity processing in iomap is the per-sb workqueue
> now that the fsverity interfaces were cleaned up.
> 
> Based on that it seems like we'd be much better just doing all the
> work inside iomap, and just allow XFS to pass the workqueue to
> iomap_read_folio and iomap_readahead.  The patch below does that
> as an untested WIP on top of your branch.
> 
> If we go down that way I suspect the better interface would be
> to allocate the iomap_readpage_ctx in the callers of these functions
> instead of passing an extra argument, but I'm not entirely sure
> about that yet.

From the discussion in v2 [1] I understood that btrfs would like to
have this bio_set/submit_io interface for iomap transition; and any
other filesystem deferrals would also be possible. Is it no more the
case with btrfs? Would fs-verity verification in iomap_read_end_io
combine both solutions (fs-verity verification in iomap +
submit_io/bio_set interface).

[1]: https://lore.kernel.org/linux-xfs/ZCxEHkWayQyGqnxL@infradead.org/#t

-- 
- Andrey

