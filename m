Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D31E733CEBC
	for <fsverity@lists.linux.dev>; Wed, 18 Feb 2026 09:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771407713; cv=none; b=tCQw5Ph5le50yD7CPspdulLAJwbmqP+GsBKNCa43GuYR4lLKtkKia+k1mkwDR285aE6KK8nfDhUbougHxdONZ/c68DLtMbGHgx8sZxoNo39odzMbQn9ZH0UgOJOnkavImPnpRVDBvoxxOOsyq+aOoHcErgLsqrNx7j/y6IAxDO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771407713; c=relaxed/simple;
	bh=nLFeYwmb82xcBOA7C5mmfsnrhDKKkSDg8i0xcOYxOOM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=RJwagdWsyoJj0nQ/Bt92DXiLQHJO4UquWUYKkuRSCnOvjPLuxOFdoqD+HeJk59DIu2drA7W+byyJBtXD6UCnJOSw4z3kmY/vWu3v5F06RLm8LejmX5qOd5lyVXG+jq/QguuCJBdDKHfx5oDY/gOEsSx6z1HZUqmKCtTTpQkACp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=axoBFtbW; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="axoBFtbW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771407709;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sdmSmWTTSUpeXTOHRqXOhAP2+YOcdNUbOwJVs26WCus=;
	b=axoBFtbWA2iClxdLIA8YLlNxstIb/RXszesNnpBTUP3EN36O1P3oRHZMstU+P/w3i0yEtU
	wUjY2bv4GD40IamQCMgMF7ULkfgOW8NCfN86WA8BBTFEDEvVQpCoxPhVTtxjXEyDlMJcRM
	kI9SB5S4/DkgC+5YwqpsBIyOD5Up+cI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-148-tMMP3NbyMti0l6YKYkc1dw-1; Wed, 18 Feb 2026 04:41:47 -0500
X-MC-Unique: tMMP3NbyMti0l6YKYkc1dw-1
X-Mimecast-MFC-AGG-ID: tMMP3NbyMti0l6YKYkc1dw_1771407706
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-435991d4a3aso3024349f8f.1
        for <fsverity@lists.linux.dev>; Wed, 18 Feb 2026 01:41:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771407706; x=1772012506;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sdmSmWTTSUpeXTOHRqXOhAP2+YOcdNUbOwJVs26WCus=;
        b=gQN+KwTc66sOW+K5va046vzosnbHB+6TW0qRS+YXLwa8iV+7vgCAiIgySmu+Qi4c2J
         Vh6i1+QvEAb1vHdwF0K9uPOYyHqY2jESYiDtQBD0msBGU2Jae9+S5T1pQIMcljA1R9Am
         hymydIjurfRbmC6SAScigFm+Ftqa77SK7zt1JllSW0upzOAQCRBQmEAp9Mnnlf02TJ6n
         /KfNEzCSjqVXkC9tcTRLXkaxelXvhPadbPvmrxWcfxSHrUFBcESNkEQ3dxg2HbPrkgsw
         GlyISNHleRKj+rdXe47HA9ctJ8M/eJ7sxsctiC0ZnEhP9QfN9qn420q/jvTa0jen9n4l
         G2Eg==
X-Forwarded-Encrypted: i=1; AJvYcCX70EvoNJlbr5rd2p4yro6gtNDNcuQTYXIQuOFHbirjzgZysemjmJNRD4/eyIcCZG82rZ+3bcxDWQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzQoC9DzXFP30l1sMbjv7vWI24WQZJw1I5PU1QtpvlTdWeWY41w
	SnRe5yMdL9u0asC1J5zGRVkQdYcQAngbZONDWZfjD4749QArhtyGUh6QHUY5wvCg2SS7oUfI3Yy
	Wz3TjKvyxLoalgBUsFEf5XqdqeC1Hy4qp5EQiMVobxZOgYrgzaNmmha/0yHQ=
X-Gm-Gg: AZuq6aIGOg9pyXRbrY6TKnSTmA1cisVNJ9EG7kZJtlF+7KiGJrUkU4EKsLyvFuAEOfR
	xcraqGPUaIEToFBoD6gufqRLwcNmXiFnorHCKYf+TwgRfhXLcSIx4KEqagSW2it21016D+zxcX8
	f3xc+hiLfCB5E6tCL0Eg4/0k/q/FtCh2QJQSAH1FxeCFn8SrtZKEMILJFYyWQRGr7DPVBbXiZoE
	l4lZDta/LKkJy8JQeZ8bI/OO1F/5YvAMkFyqsQauYC4tGvOqv+wMbQk+16W7i4hmo/15QkiGZWw
	Y1fVexZ7AHmUU5e0UgmC+WJyksZ14pcvVvG/mzwxgCAmjKZ4k/LOy9dsj0QfHvIuSnIH9poXB78
	CKAo/ZXoAATo=
X-Received: by 2002:a05:6000:4383:b0:435:e3bd:5838 with SMTP id ffacd0b85a97d-43958e0ef8fmr2196995f8f.25.1771407706092;
        Wed, 18 Feb 2026 01:41:46 -0800 (PST)
X-Received: by 2002:a05:6000:4383:b0:435:e3bd:5838 with SMTP id ffacd0b85a97d-43958e0ef8fmr2196913f8f.25.1771407705479;
        Wed, 18 Feb 2026 01:41:45 -0800 (PST)
Received: from thinky ([217.30.74.39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796abd259sm42708002f8f.24.2026.02.18.01.41.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 01:41:45 -0800 (PST)
Date: Wed, 18 Feb 2026 10:41:14 +0100
From: Andrey Albershteyn <aalbersh@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Cc: Andrey Albershteyn <aalbersh@kernel.org>, linux-xfs@vger.kernel.org, 
	fsverity@lists.linux.dev, linux-fsdevel@vger.kernel.org, ebiggers@kernel.org, 
	djwong@kernel.org
Subject: Re: [PATCH v3 11/35] iomap: allow filesystem to read fsverity
 metadata beyound EOF
Message-ID: <hfteu6bonpv7djecbf3d6ekh56ktgcl4c2lvtjtrjfetzaq5dw@scsrvxx5rgig>
References: <20260217231937.1183679-1-aalbersh@kernel.org>
 <20260217231937.1183679-12-aalbersh@kernel.org>
 <20260218063606.GD8600@lst.de>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260218063606.GD8600@lst.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: OP1cvqqD3kkjlks9J6PH4GaT-ctLQAojWHO475inzK0_1771407706
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> I've looked at the modifications to iomap_read_folio_iter over the entire
> series.  First comment is that it probably makes sense to have one patch
> modifying this logic instead of multiple. 

Sure, I will merge them

> I also think the final result
> can be improved quite a bit by a better code structure, see the patch
> below against your full series.  I've left three XXX comments with
> questions that are probably easier to ask there in the code then
> separately, I hope this works for you.

Thanks for the patch! This looks better I will change to this

> 
> diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
> index 9468c5d60b23..48c572d549aa 100644
> --- a/fs/iomap/buffered-io.c
> +++ b/fs/iomap/buffered-io.c
> @@ -534,47 +534,53 @@ static int iomap_read_folio_iter(struct iomap_iter *iter,
>  			return 0;
>  
>  		/*
> -		 * We hits this for two case:
> -		 * 1. No need to go further, the hole after fsverity descriptor
> -		 * is the end of the fsverity metadata. No ctx->vi means we are
> -		 * reading folio with descriptor.
> -		 * 2. This folio contains merkle tree blocks which need to be
> -		 * synthesized and fsverity descriptor. Skip these blocks as we
> -		 * don't know how to synthesize them yet.
> +		 * Handling of fsverity "holes". We hits this for two case:
> +		 *   1. No need to go further, the hole after fsverity
> +		 *	descriptor is the end of the fsverity metadata.
> +		 *
> +		 *	No ctx->vi means we are reading a folio with descriptor.
> +		 *	XXX: what does descriptor mean here?  Also how do we
> +		 *	even end up with this case?  I can't see how this can
> +		 *	happe based on the caller?

fsverity descriptor. This is basically the case as for EOF folio.
Descriptor is the end of the fsverity metadata region. If we have 1k
fs blocks (= merkle blocks) we can have [descriptor | hole ] folio.
As we are not limited by i_size here, iomap_block_needs_zeroing()
won't fire to zero this hole. So, this case is to mark this tail as
uptodate.

We have holes in the tree and hole after descriptor. Hole after
descriptor is just a marker of the end of the metadata region. And
holes in the tree need to be synthesized. In both cases
IOMAP_F_FSVERITY is set.

On the first read we treat them both the same - mark uptodate and
continue. We can not synthesize tree holes without descriptor and
aren't interested in post descriptor data.

On the second read we already have descriptor, so this case is only
to mark the rest of the descriptor's folio as uptodate.

I think this could be split into two cases by checking if (poff +
plen) cover everything to the folio end. This means that we didn't
get the case with tree holes and descriptor in one folio.

1k fs blocks, 4k page:
[merkle block | tree hole | tree hole | descriptor]

> +		 *
> +		 *   2. This folio contains merkle tree blocks which need to be
> +		 *	synthesized and fsverity descriptor.
>  		 */
>  		if ((iomap->flags & IOMAP_F_FSVERITY) &&
> -		    (iomap->type == IOMAP_HOLE) &&
> -		    !(ctx->vi)) {
> -			iomap_set_range_uptodate(folio, poff, plen);
> -			return iomap_iter_advance(iter, plen);
> -		}
> +		    iomap->type == IOMAP_HOLE) {
> +		    	if (!ctx->vi) {
> +				iomap_set_range_uptodate(folio, poff, plen);
> +				/*
> +				 * XXX: why return to the caller early here?
> +				 */

To not hit hole in the tree (which means synthesize the block). The
fsverity_folio_zero_hash() case.

> +				return iomap_iter_advance(iter, plen);
> +			}
>  
> -		/* zero post-eof blocks as the page may be mapped */
> -		if (iomap_block_needs_zeroing(iter, pos) &&
> -		    !(iomap->flags & IOMAP_F_FSVERITY)) {
> +			/*
> +			 * Synthesize the hash value for a zeroed folio if we
> +			 * are reading merkle tree blocks.
> +			 */
> +			fsverity_folio_zero_hash(folio, poff, plen, ctx->vi);
> +			iomap_set_range_uptodate(folio, poff, plen);
> +		} else if (iomap_block_needs_zeroing(iter, pos) &&
> +			   /*
> +			    * XXX: do we still need the IOMAP_F_FSVERITY check
> +			    * here, or is this all covered by the above one?
> +			    */

Yes, this seems to be not necessary anymore

> +			   !(iomap->flags & IOMAP_F_FSVERITY)) {
> +			/* zero post-eof blocks as the page may be mapped */
>  			folio_zero_range(folio, poff, plen);
>  			if (fsverity_active(iter->inode) &&
>  			    !fsverity_verify_blocks(ctx->vi, folio, plen, poff))
>  				return -EIO;
>  			iomap_set_range_uptodate(folio, poff, plen);

-- 
- Andrey

