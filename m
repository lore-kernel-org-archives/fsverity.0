Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D8CE33D6FD
	for <fsverity@lists.linux.dev>; Thu, 19 Feb 2026 11:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771499486; cv=none; b=bBaKOYv8U9hpMQlY4LxY5xvB+FrkKwtu24W8tuT4YVyXkYMGbhejsHoaPgT+ukmvxQrbDo56tI98hLVk7mOUZSUVJD55CMCohErwxgWe87Q/6rP4w6NlI0wNbkhR3lvIT4Yg+UbCXtDmnoI2ACOt0bjJDwshMOsw89xn2ulkT+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771499486; c=relaxed/simple;
	bh=nB0bTsF21LZ1FMr3dpBbHwJVzpYmVbgqeukyG/vW3pQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=RtaaXziLoJaVoTDk6+2xjlYw5tdCnPjV8/0LiklWHl+asTSPSkbK10u1dgbj+RkeEDKCnSNteDzOIa+TCwM6u0GRK7XFfF+oF61Y9dSAf8bQtQfXlUciVv774hB0i+jxkWyANXLEbE/h4u1a77zLMBbJW4KKDy4ZdElSon7Sn+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OoJxr3nA; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OoJxr3nA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771499483;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A5XAF0Aaeg8lBO1DxOELBnxRYVsQIoZJWshuHqIQFsA=;
	b=OoJxr3nAk8mt79VOnD/zFDxB/Uxw2wm7yOY+AonZeeEeueK6q5O2Vd3R/J04ScrJaewSIZ
	tK6vagIHhgzkkZEPiYzfmcK2rbbbnxK1KAlrpt03TPN9rk1GfTthP7AftqFQdkNN0BwwxG
	D0h+ni027/KWB/lYxaXNKTBCNl84TE8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-504-zvaxPxkWNXesdLFWmEp7vQ-1; Thu, 19 Feb 2026 06:11:22 -0500
X-MC-Unique: zvaxPxkWNXesdLFWmEp7vQ-1
X-Mimecast-MFC-AGG-ID: zvaxPxkWNXesdLFWmEp7vQ_1771499481
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4839fc4cef6so4105355e9.0
        for <fsverity@lists.linux.dev>; Thu, 19 Feb 2026 03:11:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771499481; x=1772104281;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A5XAF0Aaeg8lBO1DxOELBnxRYVsQIoZJWshuHqIQFsA=;
        b=O9eGyAgmiYfdgNZBTPuEpXq9FqbWHpKfG8vnTf5GNbkdssvKThoA9xtpdNk9OFtLga
         r9bnMOTReFKmr67Z1zHmM0pYh9ArzCEZFsUTMWHhURe3I8aZDEbP8Tn5oXjQ4NfKnk0n
         F900LihWfFd5Gb78yoJG8vIts0hKAUDptjrlBPii6+QU0tYnIWiFVa5YKRdVm//JHS5w
         hVbIjQXZk9qiHOTLtCTOYnQXtQGH8YP5HwG6WEHpc61vsMCoJUgtdxtQEEchbBIzBnbN
         iiqflUdQs7Asj2zNpObT7pOzTzLlTwm+7sggRqOBJmMonGL4lIvjJAi3jaSrj/fxF5QG
         OipQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyh3wHRoNc1WVL1ccuu9LXCU1KKZbx1Cb3qgu0B8NBZzrGh4P9hnje9uFSYac9+apu50Cy1ge2Vg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyVQSgehvrKW/ULgrcRCcw+CeWC3GbtT/7CaRMtz84qeL6T7Ten
	C/x3YdQ6MOwtdFsA6PYuQHvGVrqSf9pL1y7gOR1In7VXKSzLKHdmdY2hEF4VBAioXezonCPMx1f
	R8H3RiqqaCF1ovsaUpPdIf/oTaVJFeLo/btizix1KmiIlKDBpC0G3tSszVUwbUgCmZec=
X-Gm-Gg: AZuq6aLYVNydDDP46EqmdlIwjyiwKBHIT25FrTv3LcfIgUTzHStGbr1eyCv9gqjB6KR
	kwRkP1eEqwHoipeEtEn38t6dnxBt48XqKAn5R4n1IMa8cb+Pgs/CZsk951ebVSVNQiNJz9YBBmg
	cQEs/FlD2DM1xo6auDD5uMUd5MnraRkuu9mZDFpfxwS7GeCLsg+s2vDpIc+RTy2wuvMZlyDnIT4
	Eg4Hmxn9h2VK5lcmn4JCBQ5ZIv2udrKtpfsIR1HwMNF4xz9G+cBoPo53v2xi7DAUwEfbC/cIcyM
	7mwTlzOJdPIZiAsImh06/8aszFb3RQk+Yc6TRUwSTOi83uGhgBGshr/n2EAin097mOurp3202rP
	mnep5Gmdw8ng=
X-Received: by 2002:a05:600c:3b22:b0:477:9a61:fd06 with SMTP id 5b1f17b1804b1-4839fe97501mr21343375e9.8.1771499480403;
        Thu, 19 Feb 2026 03:11:20 -0800 (PST)
X-Received: by 2002:a05:600c:3b22:b0:477:9a61:fd06 with SMTP id 5b1f17b1804b1-4839fe97501mr21342205e9.8.1771499479443;
        Thu, 19 Feb 2026 03:11:19 -0800 (PST)
Received: from thinky ([217.30.74.39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4839f90c27fsm32768655e9.2.2026.02.19.03.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 03:11:19 -0800 (PST)
Date: Thu, 19 Feb 2026 12:11:18 +0100
From: Andrey Albershteyn <aalbersh@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Cc: Andrey Albershteyn <aalbersh@kernel.org>, linux-xfs@vger.kernel.org, 
	fsverity@lists.linux.dev, linux-fsdevel@vger.kernel.org, ebiggers@kernel.org, 
	djwong@kernel.org
Subject: Re: [PATCH v3 11/35] iomap: allow filesystem to read fsverity
 metadata beyound EOF
Message-ID: <qheg77kxcl4ecqdrsnmz4acfvszjlamlb7ilgxxyf3pmt4r7ah@5fzzmcpurdfp>
References: <20260217231937.1183679-1-aalbersh@kernel.org>
 <20260217231937.1183679-12-aalbersh@kernel.org>
 <20260218063606.GD8600@lst.de>
 <hfteu6bonpv7djecbf3d6ekh56ktgcl4c2lvtjtrjfetzaq5dw@scsrvxx5rgig>
 <20260219060420.GC3739@lst.de>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260219060420.GC3739@lst.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: RKhlCqp6djDFN1iKO6cIAixfgTQ7MoPxJP5bcef5TtI_1771499481
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On 2026-02-19 07:04:20, Christoph Hellwig wrote:
> On Wed, Feb 18, 2026 at 10:41:14AM +0100, Andrey Albershteyn wrote:
> > > +		 * Handling of fsverity "holes". We hits this for two case:
> > > +		 *   1. No need to go further, the hole after fsverity
> > > +		 *	descriptor is the end of the fsverity metadata.
> > > +		 *
> > > +		 *	No ctx->vi means we are reading a folio with descriptor.
> > > +		 *	XXX: what does descriptor mean here?  Also how do we
> > > +		 *	even end up with this case?  I can't see how this can
> > > +		 *	happe based on the caller?
> > 
> > fsverity descriptor. This is basically the case as for EOF folio.
> > Descriptor is the end of the fsverity metadata region. If we have 1k
> > fs blocks (= merkle blocks) we can have [descriptor | hole ] folio.
> > As we are not limited by i_size here, iomap_block_needs_zeroing()
> > won't fire to zero this hole. So, this case is to mark this tail as
> > uptodate.
> 
> How do we end up in that without ctx->vi set?

We're reading it

> 
> > I think this could be split into two cases by checking if (poff +
> > plen) cover everything to the folio end. This means that we didn't
> > get the case with tree holes and descriptor in one folio.
> 
> That might be more clear.
> 
> > > +		    	if (!ctx->vi) {
> > > +				iomap_set_range_uptodate(folio, poff, plen);
> > > +				/*
> > > +				 * XXX: why return to the caller early here?
> > > +				 */
> > 
> > To not hit hole in the tree (which means synthesize the block). The
> > fsverity_folio_zero_hash() case.
> 
> Well, I mean return early from the function and not just move on
> to the next loop iteration (which based on everything else you
> wrote would then terminate anyway), і.e., why is this not:
> 
> 		if (!ctx->vi)
> 			fsverity_folio_zero_hash(folio, poff, plen, ctx->vi)
> 		iomap_set_range_uptodate(folio, poff, plen);
> 	} else if ...

yes this would work

I've attached the current patch, with all the changes.

+               } else if (iomap_block_needs_zeroing(iter, pos) &&
+                          !(iomap->flags & IOMAP_F_FSVERITY)) {

This check is still needed as we should not hit it when we're
reading normal merkle tree block. iomap_block_needs_zeroing is
checking if offset is beyond i_size and will fire here for merkle
blocks.

Let me know if you prefer to split the first case further, or the
current patch is good enough.

-- 
- Andrey

diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
index 47356c763744..af7b79073879 100644
--- a/fs/iomap/buffered-io.c
+++ b/fs/iomap/buffered-io.c
@@ -533,10 +533,31 @@ static int iomap_read_folio_iter(struct iomap_iter *iter,
                if (plen == 0)
                        return 0;
 
-               /* zero post-eof blocks as the page may be mapped */
-               if (iomap_block_needs_zeroing(iter, pos) &&
-                   !(iomap->flags & IOMAP_F_FSVERITY)) {
+               /*
+                * Handling of fsverity "holes". We hits this for two case:
+                *   1. No need to go further, the hole after fsverity
+                *      descriptor is the end of the fsverity metadata.
+                *
+                *   2. This folio contains merkle tree blocks which need to be
+                *      synthesized and fsverity descriptor.
+                */
+               if ((iomap->flags & IOMAP_F_FSVERITY) &&
+                   iomap->type == IOMAP_HOLE) {
+                       /*
+                        * Synthesize the hash value for a zeroed folio if we
+                        * are reading merkle tree blocks.
+                        */
+                       if (ctx->vi)
+                               fsverity_folio_zero_hash(folio, poff, plen,
+                                                        ctx->vi);
+                       iomap_set_range_uptodate(folio, poff, plen);
+               } else if (iomap_block_needs_zeroing(iter, pos) &&
+                          !(iomap->flags & IOMAP_F_FSVERITY)) {
+                       /* zero post-eof blocks as the page may be mapped */
                        folio_zero_range(folio, poff, plen);
+                       if (fsverity_active(iter->inode) &&
+                           !fsverity_verify_blocks(ctx->vi, folio, plen, poff))
+                               return -EIO;
                        iomap_set_range_uptodate(folio, poff, plen);
                } else {
                        if (!*bytes_submitted)

