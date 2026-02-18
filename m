Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B58BF2FCC04
	for <fsverity@lists.linux.dev>; Wed, 18 Feb 2026 10:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771409893; cv=none; b=u6gPRwJXEHjQLHd7Lzkr9/dB/MWvrdmnwk4l7jrxAk4NsuzGY8Wb1vNyOEEbMwvP0L3xUuRJukLzgND2oDAWrBHD94f9e9zdsn9Eg6bZAm0AuZo8Yc9o7kNUd49F5cxgt0/p+KXd/tOw3C2DFVYHPlYMoLqBcmn3jh71d6nRhLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771409893; c=relaxed/simple;
	bh=hEkOYoZ+YvzCIzyqbCCHiW1cU9u4+rx18WM/qq/4Keo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=PiLSU4a/Rd8Mfg5eVoX4OZW2CBZX2iJQSjM3WmNwyjOIHnJreUBhHSN0ZW6zX6Y7+pZEI97471Ly46ks/+xk/Sr4hVb28Z9kBKE/AHqxQmD/6D9LUr3Ra0lFlZkpHQMM3ch99m384Q8FC8Qq7TMbDI3+PlD0mbiT82XKg0rG50w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gYPwRL/e; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gYPwRL/e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771409891;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CdumppwhlBUdillyHNoUIaTpT4tIY7ONjvEdXG67S8c=;
	b=gYPwRL/eQC3579VTDaTlz/58ihryGe7Cg6b1WFO3LarcFb6ivEfB2mGEdt/rN4Sei+Aaas
	UpUCnCrucbkGlIytYN8P+I/dBJTl4TlJ4YSMGX8hqhaMHPJ3eIvZN+ga2EGfTQYz9/51az
	/mub8SFZouPX7cRL+KBwTpP85izvxwc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-50-dsdbZ-5BNCmrsL3MHwbl-w-1; Wed, 18 Feb 2026 05:18:10 -0500
X-MC-Unique: dsdbZ-5BNCmrsL3MHwbl-w-1
X-Mimecast-MFC-AGG-ID: dsdbZ-5BNCmrsL3MHwbl-w_1771409889
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4837b7903f3so45872715e9.2
        for <fsverity@lists.linux.dev>; Wed, 18 Feb 2026 02:18:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771409889; x=1772014689;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CdumppwhlBUdillyHNoUIaTpT4tIY7ONjvEdXG67S8c=;
        b=INsV9W6jBJFDeSXeP5Orzi8dczXvX+gseTtjq9DhjuTYlNYX0zMpChCKxLtjHeMa+i
         eA/bzDZ8wFMUWG8ei/PNPxucRKX7ZTS1h9kq1ZAS0BAcPlW1pvGkDgI6lmJuhO0nrhtY
         Mv3st7hMAOX90Fkkkb0ULwuKSIdiaiJHxPI5f0zh08zDtB/8MA2JCvVkY5fPPWECaYq0
         a5TEvoCQu61zs0ASlnKwkTWyKgqt7L+WA8HdaZsFalll5JMWNz7HQGT7nqRmUQaunQTt
         RODSJ5or+pVE4/WkQNtGq+WdhWeGDJSHIMRnorGQtv9Xig+SFwwM3RODYLxg8EDanjSC
         vYWg==
X-Forwarded-Encrypted: i=1; AJvYcCWSA9+3FrVAwvHiKHylDfASIyFQhr0suxn9ZaRAact1itwo9oF6JIlw0PK8jWBVWf6Ql5j4+xER0w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy74cuLYI14vsNvEvb15dZdKbQS3OvmNth6iZCCT3PDylDL6oDE
	E20Zqzh0DNQ+zDzOfTqw0P5P+Vj3Q8WH2SfcCLsEA5LYJCk5Pgz2DDtC8EMJGUGmBaWReanqN/O
	/jrLkz/ZcA6qO5okmUYoVUEP93Z2x7/aUV6TILUrFxMSML0BVQBIHWESHF0k=
X-Gm-Gg: AZuq6aK6OS1Xtq9Ggd8XO1aYiPvhErtY90jluxLIeqTlqxHxsAnBOB1yKARAmfmCeji
	NQxcjlXrswmPOVjptNFIni96MNlD2QSn6s2vajnd7f3cAyLwR8xYVeldohHEaIj2RSTBmCSbi93
	sWIg6QiWNM97KHt8S+d23sUr2HV3LgaU4fmDRc/csXK8jLMmsAO8VO4ISIifGN3ntFDo81RMRnu
	S24doxVT+CQcII9+hrq2M4WLP0viT5bcjnMRIa87CF/Wm8SUpjiYxy0LZY6UdyWe9IvXP6Dedie
	bWFXElTrFJh06JYuBshUpN5z2l7YoU2CxAbpH08wX0UCapVYbIq1oQIvNVLsHJHgwGDriOliAw9
	RzyJnU8Gp7qU=
X-Received: by 2002:a05:600c:19c6:b0:480:3bba:1ca9 with SMTP id 5b1f17b1804b1-48398a65e5cmr24011375e9.4.1771409888918;
        Wed, 18 Feb 2026 02:18:08 -0800 (PST)
X-Received: by 2002:a05:600c:19c6:b0:480:3bba:1ca9 with SMTP id 5b1f17b1804b1-48398a65e5cmr24010895e9.4.1771409888328;
        Wed, 18 Feb 2026 02:18:08 -0800 (PST)
Received: from thinky ([217.30.74.39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48398244e83sm29376605e9.2.2026.02.18.02.18.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 02:18:08 -0800 (PST)
Date: Wed, 18 Feb 2026 11:18:07 +0100
From: Andrey Albershteyn <aalbersh@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Cc: Andrey Albershteyn <aalbersh@kernel.org>, linux-xfs@vger.kernel.org, 
	fsverity@lists.linux.dev, linux-fsdevel@vger.kernel.org, ebiggers@kernel.org, 
	djwong@kernel.org
Subject: Re: [PATCH v3 22/35] xfs: add iomap write/writeback and reading of
 Merkle tree pages
Message-ID: <zpdrihys2jk2duk3o76ao4tykc4o7adree2lf3dqzuiqggcaka@xnmbkzswbmpz>
References: <20260217231937.1183679-1-aalbersh@kernel.org>
 <20260217231937.1183679-23-aalbersh@kernel.org>
 <20260218063521.GC8600@lst.de>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260218063521.GC8600@lst.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: eB6xBZEqG8Vq5wZiVowX-8dsBj9y6PKup_RlClUTNvM_1771409889
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2026-02-18 07:35:21, Christoph Hellwig wrote:
> > -	xfs_bmbt_to_iomap(ip, &wpc->iomap, &imap, 0, 0, XFS_WPC(wpc)->data_seq);
> > +	xfs_bmbt_to_iomap(ip, &wpc->iomap, &imap, 0, iomap_flags, XFS_WPC(wpc)->data_seq);
> 
> Overly long line.
> 
> > +		if (xfs_iflags_test(ip, XFS_VERITY_CONSTRUCTION)) {
> > +			wbc->range_start = fsverity_metadata_offset(VFS_I(ip));
> > +			wbc->range_end = LLONG_MAX;
> > +			wbc->nr_to_write = LONG_MAX;
> 
> Shouldn't this be taken care of by the caller?

hmm right, I will update filemap_write_and_wait() call in
xfs_fsverity_end_enable(). That the only place writeback of verity
metadata is requested.

> 
> > +			/*
> > +			 * Set IOMAP_F_FSVERITY to skip initial EOF check
> > +			 * The following iomap->flags would be set in
> > +			 * xfs_map_blocks()
> > +			 */
> > +			wpc.ctx.iomap.flags |= IOMAP_F_FSVERITY;
> 
> I'm usually a fan of more comments rather than less, but I don't think
> this adds any value.

Sure, I will rewrite it

-- 
- Andrey

