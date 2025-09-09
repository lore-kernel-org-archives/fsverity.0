Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA9AF1E3769
	for <fsverity@lists.linux.dev>; Tue,  9 Sep 2025 12:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757421021; cv=none; b=E6zcHu3/s1ER7kbbTGyttRTEwF+EGsp2zVBpnKBlgqwZIhYfhWtJISEcNYC1Ug3cBYjpq87Hqq333FIhandDVcEabgrUQEX1h7SWFmFx2drh7Wg9K4Zme0xKU9+OKOzO/0hu9u6NWbEUcg70A7H9Tqy/BtnrvHApFlBILj3mF20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757421021; c=relaxed/simple;
	bh=s92S74rkTQygVdBylBjRnsGIqHJ3GyRJ+UufBEDW444=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=Iqgf3MWcaN0wQHJpL5oQnunF6l2V1dHRbXmBciRqSgk7PawxJjylVtbTaPo42LLkdswVjCG3T1BuO4eS0JN6Jf/NXJQjrNaysasFyiPyJDh6vMJUw48nQWPSjhRGPBJIdFRfehh0a6D/6k4P9ahjHOwnMWt3kIM9sVoUelK7+kQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=h59UmyRB; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="h59UmyRB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757421018;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=00MIITktQKpeu4Npo919IC2v222FV9c+T1/KFxmzFFk=;
	b=h59UmyRB75xi7w3nVLnf7EIAh4x0kQpEQhVrHGMXh+Q++u7fHM6y/cefhQ9qUUOlajinzD
	EsBwxnSKA/EaJIm1+MKWgtg65rk/xySfRLN+AHqzGBTEBs1SYo/qfvLbcw8bFt7/UJSYuC
	iHax0b9VOwczJdbAXO+D7odYd3J0Ijw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-128-W28x3_NWMTmtkG2ZzoK9Cg-1; Tue, 09 Sep 2025 08:30:17 -0400
X-MC-Unique: W28x3_NWMTmtkG2ZzoK9Cg-1
X-Mimecast-MFC-AGG-ID: W28x3_NWMTmtkG2ZzoK9Cg_1757421016
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-45cb5dbda9cso34377475e9.2
        for <fsverity@lists.linux.dev>; Tue, 09 Sep 2025 05:30:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757421016; x=1758025816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=00MIITktQKpeu4Npo919IC2v222FV9c+T1/KFxmzFFk=;
        b=aGsUfTfG5dzwdmvuSCY41SbXrrmQVgpNzijP0A0/8784lbe9OjMMhNqMi5vzxwonxy
         DcAvWJk0Ze+NzYajtJXlca1LzPudtLedlaAb+Gx9rxF1DuQKGM9Fo6rMjT614tjRVFoM
         5G9RQVkBhvmPlXMDJhkGgPs1mGbU8gCZN2TwuofXPYuHJi48JugPP1sF48ttZ/LgUHRn
         +RgNk5PlJ0ySVkjUhl6jciKkHWgoqKIprri+VUrtUXtrkui6zxHFZZi4mV8RI/wMF98n
         29AxErsPrC0xpburYZdEjnJTbBbLXXk/Tt4DIsSMcVg/ICyyKLWUEZ90vujc/VqQXtYt
         AaNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWt7pX7UJViNBZ75c49ZyqZQtb3+okfYiA/THxgeenlhJ6e3EO2bxwGHCQ4lESNUgJ2v1BuETMrQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzuA/wfvdqvXyH0ddCoC9HzZ9fdbadLu61czgR3DI8EEYGD5Wvd
	ULm8Ow8ihlRu6qAB4bB3pyPywSN04jViBnp/03q1I5AtVH3ekb/XArdfueyB/WCTsCF7sOfQ38l
	b7rb+1+lCNWivwCuwuBcPX5KUzkp5+bbdVxgfmjEHUGUj/UFBrND5sUY2fm8=
X-Gm-Gg: ASbGncvPbPROu94Zey1oDi2j9+gvum/oPfIeBYg7LxCSpnaruWV15s+QJ/md39Iq/KB
	TlPs0tfMPHimj2eBnC2IaMsfNhKoGAILCt1n/ZRpsdwtiaRmRmfmT9Si2RFTkNK1iiFGpezdBJR
	GvdKKexV9GhQEY+JsCk0vWXje2S4rkVSjx9tQvf43Ti+LuA+npzHpOxnMAWsM3rNnMdIPcMdiBU
	99TH9LFC7z0VeuMlxfZnywMEa0krEmqZ1NxDlSA44/89omeeHeGLAjd4kPG26vlap/ng9HDkGPx
	Ogo2z04vgRT5ejVBiOIbbAFxOgTHbGI7
X-Received: by 2002:a05:600c:1c1b:b0:45b:7185:9e5 with SMTP id 5b1f17b1804b1-45df6334418mr607525e9.5.1757421016406;
        Tue, 09 Sep 2025 05:30:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF90lk9hKimn7/9fXuczdVmK4Oq8YW/IoH85cs4kzzTgo9MhmHaqu+WdCnHoNhq9HRvmfB8fQ==
X-Received: by 2002:a05:600c:1c1b:b0:45b:7185:9e5 with SMTP id 5b1f17b1804b1-45df6334418mr607245e9.5.1757421015994;
        Tue, 09 Sep 2025 05:30:15 -0700 (PDT)
Received: from thinky ([91.245.205.131])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7521bfd8csm2646333f8f.11.2025.09.09.05.30.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 05:30:15 -0700 (PDT)
Date: Tue, 9 Sep 2025 14:30:14 +0200
From: Andrey Albershteyn <aalbersh@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Cc: "Darrick J. Wong" <djwong@kernel.org>, fsverity@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, linux-xfs@vger.kernel.org, david@fromorbit.com, 
	ebiggers@kernel.org, Andrey Albershteyn <aalbersh@kernel.org>
Subject: Re: [PATCH RFC 02/29] iomap: introduce iomap_read/write_region
 interface
Message-ID: <pz7g2o6lo6ef5onkgrn7zsdyo2o3ir5lpvo6d6p2ao5egq33tw@dg7vjdsyu5mh>
References: <20250728-fsverity-v1-0-9e5443af0e34@kernel.org>
 <20250728-fsverity-v1-2-9e5443af0e34@kernel.org>
 <20250729222252.GJ2672049@frogsfrogsfrogs>
 <20250811114337.GA8850@lst.de>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20250811114337.GA8850@lst.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: PPlwM_FviT-RtoJn4nX3h3cbgeZiZeUke8Lu_nFRaSg_1757421016
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2025-08-11 13:43:37, Christoph Hellwig wrote:
> On Tue, Jul 29, 2025 at 03:22:52PM -0700, Darrick J. Wong wrote:
> > ...and these sound a lot like filemap_read and iomap_write_iter.
> > Why not use those?  You'd get readahead for free.  Though I guess
> > filemap_read cuts off at i_size so maybe that's why this is necessary?
> > 
> > (and by extension, is this why the existing fsverity implementations
> > seem to do their own readahead and reading?)
> > 
> > ((and now I guess I see why this isn't done through the regular kiocb
> > interface, because then we'd be exposing post-EOF data hiding to
> > everyone in the system))
> 
> Same thoughts here.  It seems like we should just have a beyond-EOF or
> fsverity flag for ->read_iter / ->write_iter and consolidate all this
> code.  That'll also go along nicely with the flag in the writepage_ctx
> suggested by Joanne.
> 

In addition to being bound by the isize the fiemap_read() copies
data to the iov_iter, which is not really needed for fsverity. Also,
even on fsverity systems this function will not be called on the
fsverity metadata, not sure how much overhead these checks would add
but this is probably not desired anyway.

Is adding something like fiemap_fetch or fiemap_read_unbound to just
call filemap_get_pages() would be better? A filemap_read() without
isize check and copying basically

The write path seems to be fine, adding kiocb->ki_flags and
iomap_iter->flags flag to work beyond EOF to skip inode size updates
in iomap_write_iter() seems to be enough.

-- 
- Andrey

