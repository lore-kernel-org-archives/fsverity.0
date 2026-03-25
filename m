Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D2D33D525F
	for <fsverity@lists.linux.dev>; Wed, 25 Mar 2026 12:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774442295; cv=none; b=g7Hotd5d47VE7cbj0B+PxqfEqcRAucSc0WrUZG0kGfJ8ddQTiQFmxDZjQ6UITCTFgyf4dS3Pj0JFLg92a/f0pbe9tHlzK9WGRUYDpX/g3of7lhpnMloStR28kVUeUHhlcX1yW8WKFGC6y9so0s4aHOg7OdWd2NMUnEBOLzH+ZqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774442295; c=relaxed/simple;
	bh=B7XEYkMQi5D0EqTXN0etgYXPUL8EADhsGgGCE2iqsCA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=JdQv07lKZzCFRwRZltZ2wqo85awZzFuzLlwZOvwYBUll3xzvjdMSa2UZXUB2T5J/op8qjFAqqkN1SePBrENX3GlVqcWAj9cSrJ6ajnTVKmZsXRTiJiDAlJ2EM7jTjPhgnv/IRgfpxXgLmgKPGjDUlql049WhouJN9mb41nhR6hM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SkCzScCu; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SkCzScCu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774442292;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zq66uLldOzJDWwFuTQSicat9HZ9onClHiQ97FMgB8gk=;
	b=SkCzScCuCdyNL1RUnpfJxBIL5F2VO8pgYLuuZuGNC9Z7wh9ucam59gxfaUWvYHjCDdoC+y
	RRXrtom8b1qSiG/Ppj48o875UHfOfbbJMeJmhANxnVoORpUCS7gtaIhqIe0mXwLjgiLik4
	ddN8iVF7b7wala8rYTxzBWNqM8iGoBQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-116-5Fx9OuP9N7iv9eVkyyshkQ-1; Wed, 25 Mar 2026 08:38:11 -0400
X-MC-Unique: 5Fx9OuP9N7iv9eVkyyshkQ-1
X-Mimecast-MFC-AGG-ID: 5Fx9OuP9N7iv9eVkyyshkQ_1774442290
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-43b46b2b161so5486969f8f.0
        for <fsverity@lists.linux.dev>; Wed, 25 Mar 2026 05:38:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774442290; x=1775047090;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zq66uLldOzJDWwFuTQSicat9HZ9onClHiQ97FMgB8gk=;
        b=l0ltNPi2Rjjf0ycl4zPnDfMvollHcqJ01Z//ywmM4yOmtm6G0q/n5pXfZI6l7uUlsP
         yX5VZfNe1JebsTo4MJh9CgMHfnTykDWMWwF7T7yAnpgC6h3C/pYROdj2hF+ZF3dWMYZL
         n8OR/pxA3bQXfLR1956PBS8VOQdVu99A/9FvYGhSwY/WbaquBYyUIStLwwoEiUAnDeP4
         A4dWGLQUf0CY9tTAQCgTWErwOuzD6q+j5IQLgu0VV4SVWbiKm64MjzDU/RjLes1E5U61
         iiJ7wVwu86V6d1r3xQ5Bl91RcvNBCbBbTE45ZIPvuoSuBiU/fDQ1AIlBV/Oby83106ro
         fxnw==
X-Forwarded-Encrypted: i=1; AJvYcCVCfZ/tR4pveeAhhJd5eBEQakz86oQJcEZ2P/fg2m3m1PR5lWKL6IQ0STsBvRbwnPwuWRDOkjlg5A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzowm0Zx7iazXkae5h0hOBOyyiVDRYjC4o3v2fN0jjzwXdEW3cE
	p3Ge9zHTTorV/weoscTRfFqnEPfKKYekhIfePV4Kk0u5XtwBiA/BWAzjR8jP38bcu7+QGDlYOCJ
	Re2PaOJj792HDIHcJrDq5km8udNB3+GRjtpMxha2HVbpSfJVDnm5fWLLI/lrrfG4U5qKW2A==
X-Gm-Gg: ATEYQzzdwYSfOjIgy+WGVWfZkxwVJMYmMxk1qLRXv1Lt/Bgf4kly2Rf0Otz/R8xxb/u
	mzASNm9T8x61SWmQ0LGxu03OcY/6pYxDymAloSdhOJ42bJ/UtZeVYp9+djOkrqT8N87A0IzhCHR
	+3balSIWZ5/il7+G9mSbjm6bLeEExFOFXLWLmuF6s5jS6I9IOK/t6HxoPdbtep0R3q/ie9vYwkL
	k+iMrtSjwGu9kp+AB0N2sdxagGw7NA6gjysZM2MdSey4Pd7ZnGFhN/wd+aW4ZSAPJZNaXpW/aQa
	kXsyUG/LJ0nS8es/xs+WI357NrvYvxBSBc6gvfBMDkkyfF+Ad4CYaNBmnjSQa06dr+0ydlH0ADN
	WzCa3MwHPRUfHjA==
X-Received: by 2002:a05:600c:3f16:b0:483:6d42:25c6 with SMTP id 5b1f17b1804b1-4871606db4amr51426155e9.23.1774442289647;
        Wed, 25 Mar 2026 05:38:09 -0700 (PDT)
X-Received: by 2002:a05:600c:3f16:b0:483:6d42:25c6 with SMTP id 5b1f17b1804b1-4871606db4amr51425715e9.23.1774442289131;
        Wed, 25 Mar 2026 05:38:09 -0700 (PDT)
Received: from thinky ([91.245.205.131])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487116ee57esm120806865e9.14.2026.03.25.05.38.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 05:38:08 -0700 (PDT)
Date: Wed, 25 Mar 2026 13:38:07 +0100
From: Andrey Albershteyn <aalbersh@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Cc: Andrey Albershteyn <aalbersh@kernel.org>, linux-xfs@vger.kernel.org, 
	fsverity@lists.linux.dev, linux-fsdevel@vger.kernel.org, ebiggers@kernel.org, 
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
	linux-btrfs@vger.kernel.org, djwong@kernel.org
Subject: Re: [PATCH v5 07/25] iomap: introduce IOMAP_F_FSVERITY and teach
 writeback to handle fsverity
Message-ID: <std5dib2mf5nfd2gf3jbrhujvqr2tytczplopwfy4zrxrrmrgj@py7g4alrifbi>
References: <20260319170231.1455553-1-aalbersh@kernel.org>
 <20260319170231.1455553-8-aalbersh@kernel.org>
 <20260325080021.GF952@lst.de>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260325080021.GF952@lst.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xzuKxgYiNfjFgkx8KwYQC2Fp8yHf1Ug_LNR-T7waZiI_1774442290
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2026-03-25 09:00:21, Christoph Hellwig wrote:
> > @@ -353,9 +353,16 @@ static inline bool iomap_block_needs_zeroing(const struct iomap_iter *iter,
> >  {
> >  	const struct iomap *srcmap = iomap_iter_srcmap(iter);
> >  
> > -	return srcmap->type != IOMAP_MAPPED ||
> > -		(srcmap->flags & IOMAP_F_NEW) ||
> > -		pos >= i_size_read(iter->inode);
> > +	if (srcmap->type != IOMAP_MAPPED)
> > +		return true;
> > +
> > +	if (srcmap->flags & IOMAP_F_NEW)
> > +		return true;
> > +
> > +	if (srcmap->flags & IOMAP_F_FSVERITY)
> > +		return false;
> > +
> > +	return pos >= i_size_read(iter->inode);
> 
> This might be a good time to document the various reasons for needing
> zeroing.

something like this?

--- a/fs/iomap/buffered-io.c
+++ b/fs/iomap/buffered-io.c
@@ -344,9 +344,27 @@ static inline bool iomap_block_needs_zeroing(const struct iomap_iter *iter,
 {
        const struct iomap *srcmap = iomap_iter_srcmap(iter);
 
-       return srcmap->type != IOMAP_MAPPED ||
-               (srcmap->flags & IOMAP_F_NEW) ||
-               pos >= i_size_read(iter->inode);
+       /*
+        * If this block is not mapped, we don't have any backing blocks to read
+        * yet
+        */
+       if (srcmap->type != IOMAP_MAPPED)
+               return true;
+
+       /*
+        * This block just got allocated and does not contain any meaningful data
+        */
+       if (srcmap->flags & IOMAP_F_NEW)
+               return true;
+
+       /*
+        * fsverity metadata is stored past i_size, we need to read it instead of
+        * zeroing
+        */
+       if (srcmap->flags & IOMAP_F_FSVERITY)
+               return false;
+
+       return pos >= i_size_read(iter->inode);
 }

> 
> > +/*
> > + * IO happens beyond inode EOF, fsverity metadata is stored there
> > + */
> > +#define IOMAP_F_FSVERITY	(1U << 10)
> 
> This comment feels a bit too sparse.  Here is my interpretation of what
> this flag does:
> 
> /*
>  * Indicates reads and writes of fsverity metadata.
>  *
>  * Fsverity metadata is stored after the regular file data and thus beyond
>  * i_size.
>  */

Thanks! I will update it

-- 
- Andrey

