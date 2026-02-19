Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D03733FE34
	for <fsverity@lists.linux.dev>; Thu, 19 Feb 2026 14:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771511943; cv=none; b=oPUmxNOeHk2EAu4gwvs5ztxlEfsd3Mr5aAvuIovpNPRB+hcb1BhOCY4vvvo1H9C5RYBd19EwSS6Z3KJeZbMzhlTzGGw0IqThAmQaf1AFBkLMKP/e8+LO6n7KX7IW+mzHqlx+OxKFPgI25+9emm5eWUPPDawcv5LUei9cHH5VY6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771511943; c=relaxed/simple;
	bh=hCUdqdVshUNpKJ6Web4N76YggE/6UrANGx8QiLFPLC8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=aHYNbyFigOXUja75806uFxdDJ/X6H8BU4IJhL+KxTD8EQdI9xjPmv44ghhbSi8GaOc3YHV3DYrltQMpnn/P1ndm4iTzN9JjteJa5cmkFqaDvFN1Jun1yKzCv5t1hqteOjKNddDCx0itSQUyo22sC7L4aSOhjuswudKcvK1ZzdhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UrV5OvIL; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UrV5OvIL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771511941;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yOvhpaX9tHlMkNrihwcrkfHtkKySAiNqounN6tlAxUk=;
	b=UrV5OvILmUjaOV1JBoNbAbipz3KfUMi+GhSPsj7ydGMtlqrXFAk+WPa3MkxnMDjnY1vWIP
	bh1xGWRM8K1KBlBRrHnFWi2s4291JfbG/BAAzRO61F7f7zlF20MIqoURG/2i44qG6HjBRf
	OdRVx3AZaEEDmWWt6KoqYt7Jk0u1Da4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-606-e-oCsVH1PEaSDW2qsaXO1g-1; Thu, 19 Feb 2026 09:39:00 -0500
X-MC-Unique: e-oCsVH1PEaSDW2qsaXO1g-1
X-Mimecast-MFC-AGG-ID: e-oCsVH1PEaSDW2qsaXO1g_1771511939
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4836b7c302fso8350895e9.1
        for <fsverity@lists.linux.dev>; Thu, 19 Feb 2026 06:39:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771511939; x=1772116739;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yOvhpaX9tHlMkNrihwcrkfHtkKySAiNqounN6tlAxUk=;
        b=uIRH2lkU1Lb2zNjdLEdhF8I4tv3PFgoRAl+OW1+xBuIYXMFPev92eP5mk8rXjfaW8H
         84Pz0huWQG+RY64g/DoinHlTkOU956U4U5lXCtxcp3jG/B938qc0FZ1aHow+MTdhXvGr
         IhmeVe8/fexbyJqyqSyONdCS5+beVmdcg/+34egrPsDgKy1OfNvnuGUNmLwIfz1zFNEY
         1B6NScyk9xj8u5a4IKK7QJkSfixBtJ6k29WyqrgiD7LHIqgO1nOxmwigKde9L8OzmnJx
         wx5eY6YgODzg4udOe7idenwcaj7uorleT9qlunJ8dsW8Xp6+RSNN+xXZi+2T+0TpZOD3
         +NEg==
X-Forwarded-Encrypted: i=1; AJvYcCVQXz7bFTYyOUyGCohYUbQtZrvAkFSU0aKLsDU50/gXfjkGBhvobLYJ4s0WUVB6TOV9T1lbpCE1vg==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywi0TDRIOECgXrNZJB9zaXkRlVlLkUlXhMz//Ff+4DCRCKclbit
	H0yvJOBokJQ5Wg+/6Ip2O274R8OUq4Su27tsLmg5inv0M/en3xqarTG8jWexSQm0RNqQqofIMgE
	HZ5tT0qfpoHETZ0gWyE4JsAm2dzA1cDJ+rzshh0rSXJ5N2JxuSKrrOlQzWzo=
X-Gm-Gg: AZuq6aJYqbVjlMUhzUQkx059XIDkMBE4SzDqyTslLAbJPaCN4VOAfueCBpsIb2D7W/f
	rG5XfYZNJjH61SPPVoCWA++HY2ajG9HaQ32Je3CiYe4r9ivSe1IUTeO6E3ylAsomd7ewgXiTI3y
	pqkJsBOCvsp/6K1vLGXW9bxeoe/mFdFh3BdCn4c7wa66podQZbGQong45CfmefyQAZJceIan756
	lJVfaFnYMX/9606OwH6dRpabczywEbiqvEaUz5009ebhTYMs+B5ESYlnat6RcPn0TnRGRL7OP/o
	kukfNwDxvF023z0nWzXzw13HCvZ7Im3viqY00NZwn3e1mINV4vIFLTA18mSwAZgsJGSWASSzTnY
	Gf/XWTIv25EQ=
X-Received: by 2002:a05:600c:3b8b:b0:471:14af:c715 with SMTP id 5b1f17b1804b1-4837104307amr424149565e9.3.1771511938912;
        Thu, 19 Feb 2026 06:38:58 -0800 (PST)
X-Received: by 2002:a05:600c:3b8b:b0:471:14af:c715 with SMTP id 5b1f17b1804b1-4837104307amr424148955e9.3.1771511938404;
        Thu, 19 Feb 2026 06:38:58 -0800 (PST)
Received: from thinky ([217.30.74.39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4839e82f8bfsm41235955e9.1.2026.02.19.06.38.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 06:38:58 -0800 (PST)
Date: Thu, 19 Feb 2026 15:38:57 +0100
From: Andrey Albershteyn <aalbersh@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Cc: Andrey Albershteyn <aalbersh@kernel.org>, linux-xfs@vger.kernel.org, 
	fsverity@lists.linux.dev, linux-fsdevel@vger.kernel.org, ebiggers@kernel.org, 
	djwong@kernel.org
Subject: Re: [PATCH v3 28/35] xfs: add fs-verity support
Message-ID: <5ueyigipyfwqvysmx6ejqxpclu3oiy7wwpftnfsnyanu7z2abq@dnceynnumjh3>
References: <20260217231937.1183679-1-aalbersh@kernel.org>
 <20260217231937.1183679-29-aalbersh@kernel.org>
 <20260218064429.GC8768@lst.de>
 <mtnj4ahovgefkl4pexgwkxrreq6fm7hwpk5lgeaihxg7z5zdlz@tpzevymml5qx>
 <20260219061122.GA4091@lst.de>
 <4cmnh4lgygm4fj3fixsgy3b7xp2ayo3jirvspoma6qxusdgluu@nyamffhaurej>
 <20260219134101.GA12139@lst.de>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260219134101.GA12139@lst.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: avGi8BFOy8-WEGNu8AIOhBNdfOZ1Nx03eSrLGnOBXJk_1771511939
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2026-02-19 14:41:01, Christoph Hellwig wrote:
> On Thu, Feb 19, 2026 at 10:51:14AM +0100, Andrey Albershteyn wrote:
> > > > fs block size < PAGE_SIZE when these tree holes are in one folio
> > > > with descriptor. Iomap can not fill them without getting descriptor
> > > > first.
> > > 
> > > Should we just simply not create tree holes for that case?  Anything
> > > involving page cache validation is a pain, so if we have an easy
> > > enough way to avoid it I'd rather do that.
> > 
> > I don't think we can. Any hole at the tree tail which gets into the
> > same folio with descriptor need to be skipped. If we write out
> > hashes instead of the holes for the 4k page then other holes at
> > lower offsets of the tree still can have holes on bigger page
> > system.
> 
> Ok.
> 
> > Adding a bit of space between tree tail and descriptor would
> > probably work but that's also dependent on the page size.
> 
> Well, I guess then the only thing we can do is writes very detailed
> comments explaining all this.
> 

I have a comment right above this function:

+/*
+ * In cases when merkle tree block (1k) == fs block size (1k) and less than
+ * PAGE_SIZE (4k) we can get the following layout in the file:
+ *
+ * [ merkle block | 1k hole | 1k hole | fsverity descriptor]
+ *
+ * These holes are merkle tree blocks which are filled by iomap with hashes of
+ * zeroed data blocks.
+ *
+ * Anything in fsverity starts with reading a descriptor. When iomap reads this
+ * page for the descriptor it doesn't know how to synthesize those merkle tree
+ * blocks. So, those are left with random data and marked uptodate.
+ *
+ * After we're done with reading the descriptor we invalidate the page
+ * containing descriptor. As a descriptor for this inode is already searchable
+ * in the hashtable, iomap can synthesize these blocks when requested again.
+ */
+static int
+xfs_fsverity_drop_descriptor_page(
+	struct inode	*inode,
+	u64		offset)

I will rephrase the first sentence to make it clear that this could
happen for larger page sizes too.

-- 
- Andrey

