Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C00A1E8320
	for <fsverity@lists.linux.dev>; Thu, 19 Feb 2026 09:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771494682; cv=none; b=j54oRise/rjveKWsR7IEKLiqw5Znv79gDtnzrDD8hmWqBQMj/WJnZiSMzOjf9PuSOc8hrah8zHXhNRblJKSU0ojHwCUFdmm6oWZyfoeclj9MRKx+4lZV1b74D3t8fifmctnTBwJXoKwQGvxgy47jnK+NutBr/GqYE0k4o3nSOuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771494682; c=relaxed/simple;
	bh=qzaET1Zy37x+a+KIo6FvgZb076ajIH6u8Jf7ivmPbBg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=r8ZCiO2XXunOq9H572gN1/9NfTg7golq3OxtQzX4uiwFY29m3/qvlPHy9AMiaLaOVJIS3Cx+/xNxu3BNlIpkOWpkRa575hrSxR8agt9H2iuCEeDFYWvWx7S6a2Xoh5dxbAdu8qSTJIi1ktUxfnKQqrit0wq/tB6NEWh6G8UQnzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bhZJ/7cS; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bhZJ/7cS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771494680;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=K33V4rOOwYLW15X+o+vqv2I81VqZ2aMaDFF+pr+8/b4=;
	b=bhZJ/7cSgPXWyGg9KwJVlOqhyXBp9Y+PPEFgeHWjNIdXXVW1RgCKDqoeBNxPluxJ7c/Q/R
	Js38Yealt6Cw3CPWBmWeiTb7CA8v9jQJacDnoJauORmVDw3eanuvQHxbhsXhygXkOqVo9S
	8FvXwFuodoriAVrGp/woSNg25dhaD2o=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-54-9rJ8V1CpOKWMvyx9sZmEXw-1; Thu, 19 Feb 2026 04:51:18 -0500
X-MC-Unique: 9rJ8V1CpOKWMvyx9sZmEXw-1
X-Mimecast-MFC-AGG-ID: 9rJ8V1CpOKWMvyx9sZmEXw_1771494678
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-435a11575ecso807481f8f.2
        for <fsverity@lists.linux.dev>; Thu, 19 Feb 2026 01:51:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771494677; x=1772099477;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K33V4rOOwYLW15X+o+vqv2I81VqZ2aMaDFF+pr+8/b4=;
        b=beAOmsBl1N+b0wgINmzoJS4ZqnLISuHEOU8Ij3BXz1tv4Vc+tXKkokrIzq/1anah6B
         rnml3nAKrGa0AVmceTPWqqykcRSZdFQUr9Z3ODeoUP/I2G6UsdHGGkkRwvbTfQoaA16X
         p7EEsGgzTvxlkZ9UZ4oYPJc4AIa7VuG/Palvwq6e6Zk7LyeIsiKvt/2yMMBm8BInRN9i
         iabrgybdqwnReN6auiiw9os4SUF6y30/JINrClCJTKcHqlH0ebAcYbbkJs0lPZI6XXAJ
         X/sHPP7yZqOjw5QsvwuKvkzMKQOuvUOQBC3nhSaXzzO/p5jy9iWtfUUUOvCtzObg3gt9
         RKlw==
X-Forwarded-Encrypted: i=1; AJvYcCV19SjXms3cR9aHrvY+C2PNNGNUmsIV/+7CP4j5EZjvyweg0Bbp68QPrHBbINibVVTarjeiMJfgTQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxdinoNWiZeFzJ5nbnStS8lOx/IRIgjjSD4qWbLXrRPtbXtGaDu
	4WInmQM2+r43RbEvZK3TsaQyPgl3JttIF2Xe1Ef9T+vpDmfSSgAErMiQaHtZsFC1DE+kVCacgxk
	uuENeOHGiEYFxR9mmYvcn/3DOA1R4kCXadwDsp2FMPwydSp13g1L5DE2D9so=
X-Gm-Gg: AZuq6aK1hESPiOoV/RMFNdfF2a7fx/cL4WybfOjPTLTx53O1cqzmZKflUFeNqsfc/k8
	urZedeP3oFnSgD7rq5cRxIcGw87Vd/mTONjir3XfneGc3FxM3HqwgfRJANWATVeEk/RNlKIPpFq
	jwPxULxmnmOIyrCYngg+7l1bDRbxgHyDq+MwMLaBnRxluHtblRnAeaeVXndZS31mfYB0O5H25RR
	UXhV8fH5PB7rK41AP4uomjB7fJEOTJu6vNMgEzbSy6uOEIZ7XSIxlB+60vSpHHpYXVqVV8NQVVU
	Qo8A7nj0IgCG+rXHdJsYWlycM5sT2O6K3UX3naYrLqZiOWDvNivlL2S2U/MYv5EgAprIPVh5HJa
	nwYrIHgvqRZg=
X-Received: by 2002:a05:6000:40dc:b0:437:7010:1d0b with SMTP id ffacd0b85a97d-43958df17a3mr7223989f8f.6.1771494677308;
        Thu, 19 Feb 2026 01:51:17 -0800 (PST)
X-Received: by 2002:a05:6000:40dc:b0:437:7010:1d0b with SMTP id ffacd0b85a97d-43958df17a3mr7223941f8f.6.1771494676703;
        Thu, 19 Feb 2026 01:51:16 -0800 (PST)
Received: from thinky ([217.30.74.39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796a5b07fsm48227142f8f.2.2026.02.19.01.51.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 01:51:16 -0800 (PST)
Date: Thu, 19 Feb 2026 10:51:14 +0100
From: Andrey Albershteyn <aalbersh@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Cc: Andrey Albershteyn <aalbersh@kernel.org>, linux-xfs@vger.kernel.org, 
	fsverity@lists.linux.dev, linux-fsdevel@vger.kernel.org, ebiggers@kernel.org, 
	djwong@kernel.org
Subject: Re: [PATCH v3 28/35] xfs: add fs-verity support
Message-ID: <4cmnh4lgygm4fj3fixsgy3b7xp2ayo3jirvspoma6qxusdgluu@nyamffhaurej>
References: <20260217231937.1183679-1-aalbersh@kernel.org>
 <20260217231937.1183679-29-aalbersh@kernel.org>
 <20260218064429.GC8768@lst.de>
 <mtnj4ahovgefkl4pexgwkxrreq6fm7hwpk5lgeaihxg7z5zdlz@tpzevymml5qx>
 <20260219061122.GA4091@lst.de>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260219061122.GA4091@lst.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Y-T42Yw6JCaAjNME6PmWAD2LRdaeDiX40A48yDJDp24_1771494678
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2026-02-19 07:11:22, Christoph Hellwig wrote:
> On Wed, Feb 18, 2026 at 10:57:35AM +0100, Andrey Albershteyn wrote:
> > > > +static int
> > > > +xfs_fsverity_drop_descriptor_page(
> > > > +	struct inode	*inode,
> > > > +	u64		offset)
> > > > +{
> > > > +	pgoff_t index = offset >> PAGE_SHIFT;
> > > > +
> > > > +	return invalidate_inode_pages2_range(inode->i_mapping, index, index);
> > > > +}
> > > 
> > > What is the rationale for this?  Why do ext4 and f2fs get away without
> > > it?
> > 
> > They don't skip blocks full of zero hashes and then synthesize them.
> > XFS has holes in the tree and this is handling for the case
> > fs block size < PAGE_SIZE when these tree holes are in one folio
> > with descriptor. Iomap can not fill them without getting descriptor
> > first.
> 
> Should we just simply not create tree holes for that case?  Anything
> involving page cache validation is a pain, so if we have an easy
> enough way to avoid it I'd rather do that.

I don't think we can. Any hole at the tree tail which gets into the
same folio with descriptor need to be skipped. If we write out
hashes instead of the holes for the 4k page then other holes at
lower offsets of the tree still can have holes on bigger page
system.

Adding a bit of space between tree tail and descriptor would
probably work but that's also dependent on the page size.

-- 
- Andrey

