Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 915032E92D4
	for <fsverity@lists.linux.dev>; Tue, 10 Mar 2026 14:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773153780; cv=none; b=FbFtx9zYjVt1VS2yO6I6J38H6hOOMfmzSlJMvoOX+e+GAB3fHGjV0/Y7Y8vpa59MgDm/Wc1ViHLGzc2t2Fh74b9/AQF+bsj1prrROML0dP9Oe5GZSvcPaURD4fFds0jsgtsjcnj/LBypujbbDGaQ4xOp8Fwf8dgACokLkVD34RQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773153780; c=relaxed/simple;
	bh=ulN49Zz6Uvce5EQ9S9G5wrSA/FkX6ZfXtBj/b3XcPks=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=ZRrxTPYQvYwQbpjtVh8pSOTYf6dejnCiWvkJPHZkrkReFZZD1lQSTXOwSofNCHpfhpfz1m/zp0+zdN9L4tMFmCmPgAQ6D12VHaeiJmtzyC/ae8yXdmqUPqXeyzu9IcjECgdeFR9ou/QLNGs0HZioRbFs3ez+IwIuG+nC4jS1dLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Wu6auwHR; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Wu6auwHR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773153778;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BMpkjIBAlArWoSNA1cagHtqrYddD4BAtLIKx0zMiI/c=;
	b=Wu6auwHR35+CvewBNjz4Y2soT3YOiRe29xV2QAAMRWj9PiGDJlsxAAZaH5fGBHFNdl1IKR
	q9KQc53P0Rc8iySp3DxwSVVP9xiXv30K+31Z1DLJM2lUkC+6hjpO2ixSBua24aGGPWQ4ro
	qR2NWFS6iW3AxnmukJ3sK6SFcZqC1SE=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-225-b034V7gGNUuXxn101l0t-Q-1; Tue, 10 Mar 2026 10:42:57 -0400
X-MC-Unique: b034V7gGNUuXxn101l0t-Q-1
X-Mimecast-MFC-AGG-ID: b034V7gGNUuXxn101l0t-Q_1773153776
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-b94062e85f9so588134866b.2
        for <fsverity@lists.linux.dev>; Tue, 10 Mar 2026 07:42:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773153776; x=1773758576;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BMpkjIBAlArWoSNA1cagHtqrYddD4BAtLIKx0zMiI/c=;
        b=YNKbOi8YjriTpQ6ddp98V3KRMiSX1u8jsx+8HyEhp1OgCbkKFtLN/Zf8nP3UBcT0Rf
         eyMJ1uF4arSXnl8slr8uItTZvjSU/jOUv94p/LCxGDdBgW/wSaVKDdzdb1KRGI8cHPfE
         PJl4V+36tDDazlcj4/Z1sadH9VRfd3yFdf+mTJE+0FjfyZnFBr7hFF3XVIcA1GRYgKpE
         SQvIveMi1copCQqNHmR9f8CyltZ4kk0TFhtF6XVfnfVxng9H48f7uWcqmtcFyQWD/TwX
         hkRDKOYPwQ/9/BD0U08ctDBM8g8vmjMkEC71Ysf+rogyjtYt6gTnhb4LozzD5u8dNaWL
         k9uw==
X-Forwarded-Encrypted: i=1; AJvYcCVV/G13mc1n4y1PJ7++EYrCfItkystgp3VccPBS+RteQuP/x5u0AscanjLMc0BsHbySHeR9MZtMAQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzqfqbq2WeXLJoxdjRK1jsch5/uulglXzJMoEdZrPuWPnDpjF3q
	aneUNuk/aO5Dq/8TJe/DSumRirajwj5gfYCzalRDZo/UgENUcwVD7hHm0eabsr62Ug8pRpDSjT1
	2K7fvuRzSVpLqKmQIbME6N/Rhfy4Qu4nEUwT6j4Esin2UBidqRkT5TM+VZFU=
X-Gm-Gg: ATEYQzzZzZk12vfNKvFRRnmwK47YEF2B4AJ6QBqjAIRVgo7v4A3juM/pq7gEhbxmNtV
	+A4lCQvd8K+07dGzB5A0vDEhf4z1T+wioZLgOm+vAmGePLEZGOcbXKZL7fNy/FbtO+GXRlFSiDI
	CT6StZ7zeKbm5eip/rs0Wg3Zfti3S5QOUxmjP8ghfUQoDKGm3Y+++1LD2BRCkZm8gj/H1p04c+S
	QBkHc48l8TTt0NEmW/C5bkFfHXvZpbCBpur43hgePZ9K6J0k7tQuRjb65/Qm1wwqXBQWK0lswqm
	dmWqFWT08HolC0+jip1yu+dt6LtX4bc7MA2cRDRWjQlwOT2IaxuJ8MPEWdnk03fRyij2hJ5Rzm+
	pjDQUOfihuWE=
X-Received: by 2002:a17:907:98d:b0:b93:edc0:e2e8 with SMTP id a640c23a62f3a-b942e02c34cmr869671666b.48.1773153776099;
        Tue, 10 Mar 2026 07:42:56 -0700 (PDT)
X-Received: by 2002:a17:907:98d:b0:b93:edc0:e2e8 with SMTP id a640c23a62f3a-b942e02c34cmr869668766b.48.1773153775426;
        Tue, 10 Mar 2026 07:42:55 -0700 (PDT)
Received: from thinky ([217.30.74.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b94dad4271esm420956866b.32.2026.03.10.07.42.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 07:42:55 -0700 (PDT)
Date: Tue, 10 Mar 2026 15:42:54 +0100
From: Andrey Albershteyn <aalbersh@redhat.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: Andrey Albershteyn <aalbersh@kernel.org>, linux-xfs@vger.kernel.org, 
	fsverity@lists.linux.dev, linux-fsdevel@vger.kernel.org, ebiggers@kernel.org, hch@lst.de, 
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
	linux-btrfs@vger.kernel.org
Subject: Re: [PATCH v4 10/25] iomap: teach iomap to handle fsverity holes and
 verify data holes
Message-ID: <usl6wrms76zioxpq7xqzo26plpvw642pqrb2zxe4nysnmipm2o@ntl5ml3okjyq>
References: <20260309192355.176980-1-aalbersh@kernel.org>
 <20260309192355.176980-11-aalbersh@kernel.org>
 <20260310010502.GB1105363@frogsfrogsfrogs>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260310010502.GB1105363@frogsfrogsfrogs>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Lyb8b_M5priSe5Wp4IIiqsSJMCuUrmSKur84pDEv4RI_1773153776
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2026-03-09 18:05:02, Darrick J. Wong wrote:
> > +		/*
> > +		 * Handling of fsverity "holes". We hit this for two case:
> > +		 *   1. No need to go further, the hole after fsverity
> > +		 *	descriptor is the end of the fsverity metadata.
> > +		 *
> > +		 *   2. This folio contains merkle tree blocks which need to be
> > +		 *	synthesized. If we already have fsverity info (ctx->vi)
> > +		 *	synthesize these blocks.
> > +		 */
> > +		if ((iomap->flags & IOMAP_F_FSVERITY) &&
> > +		    iomap->type == IOMAP_HOLE) {
> > +			/*
> > +			 * Don't cause lookup if we already have fsverity
> > +			 * context from the previous tree hole
> > +			 */
> > +			if (!ctx->vi)
> > +				ctx->vi = fsverity_get_info(iter->inode);
> > +			if (ctx->vi)
> 
> Is it an error if ctx->vi isn't set here? 

no

> We won't fill the folio
> with the zerohash, but we'll set uptodate anyway...
> 
> > +				fsverity_folio_zero_hash(folio, poff, plen,
> > +							 ctx->vi);
> > +			iomap_set_range_uptodate(folio, poff, plen);
> 
> ...though I suppose it's the case that the uninitialized folio contents
> will most likely cause fsverity to report data corruption so at least
> it's obvious.
> 
> OTOH it does seem a little strange to set uptodate having not
> initialized the folio contents.

This the first case described in the comment above:

+		 * Handling of fsverity "holes". We hit this for two case:
+		 *   1. No need to go further, the hole after fsverity
+		 *	descriptor is the end of the fsverity metadata.

fsverity will not read this part of the folio. I think this can be
zeroed, but I don't really see the point to do so as no one will
read it and we use this folio once, for reading the descriptor.

-- 
- Andrey

