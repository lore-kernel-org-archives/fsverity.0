Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 548BC2EA468
	for <fsverity@lists.linux.dev>; Thu, 19 Feb 2026 12:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771504077; cv=none; b=NEPAbEIeTkWvpATOwjgkhPhF/Wcqb52oENqvbEtsaPxTEZy/1KUoizj661vKxZ9ur8HzIeOabIiTrBtw4pSqRcgxNSCY7cTWVD1H5tEsrfJWiw9L0GbMywibKZ19t2OgkhPDL2Qj1xpQn4uoMVWtcPcQri5EuOigr5eVmTC7oqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771504077; c=relaxed/simple;
	bh=EDx8FryHxIAZRwRNlicUl1+uu9x6LbeOBuYZocMQ30I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=Yu3cnb/Oh0dkSCCLNU0WlrrE+kPt14bKMUzPyUtMJtcJeWIGcHUc+rNSAmFizFE7hy+XUzX/bRZKqppc6zuly80v3L1EbMJObDjyNY59Kh4JNFNlm/SJR0ifJxIbZyTsMJb3I2cAJ4lONFhoy/H10QCfG3kHywDZpg+Z4z2P7V8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NuVIh1LF; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NuVIh1LF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771504075;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LCXhggTxc1o7a68agx3rWoCqxTRmf4Yj32SklYi3Ezs=;
	b=NuVIh1LF3INVOhDu7ub+SLf4HZk31F32gMpnLMO/1mMNU0mU9vX2YogcGuyzef4FS7nIta
	0wSumR2zgYdpQTj7sEMkwg2ueGCz7Lzweb1Ji6nB+huVYHYg4owcGJ37u/BKsOVVqYA5h3
	BG1ViygKF18/QV9fOFKPG3mLoJuvLnI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-101-aDHawTwSMY67inJetfzjjg-1; Thu, 19 Feb 2026 07:27:54 -0500
X-MC-Unique: aDHawTwSMY67inJetfzjjg-1
X-Mimecast-MFC-AGG-ID: aDHawTwSMY67inJetfzjjg_1771504073
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-483a2db68caso1120725e9.0
        for <fsverity@lists.linux.dev>; Thu, 19 Feb 2026 04:27:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771504073; x=1772108873;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LCXhggTxc1o7a68agx3rWoCqxTRmf4Yj32SklYi3Ezs=;
        b=kery/Kj3mf45CuzpoWWxp7meBc2BTEvdZ6nX6+RBnqftWEExv+NkA+THLKSqFyAOvj
         amWdiWHnqelCd2Mz5WK4NxNfZbgH1JWi+1P/DhOO+q0ehNqj7ozmsRnW1Aa5LhPaQG5Y
         jq2R0v41hdB4BqFfkSs+MQ03/rgTqT0lYOrFuRXJeYawYeiil/k8PTXv50JjgS1UuOKU
         tWQ16jACcYqvfamPNoFuq6z8I9seiM7j1OfV1bhrysUrcRPiKh08PwiFdtcsimUZtOcq
         AWr190VoPcOJGk3bBk4W3JfeH5jLunYaovNEUcinxyrbBzyEX9E2BK5kYVCX3XmsdI2X
         pJKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbQEsVK6r7W1VAuAa3DKHbXaiqpB2sO5MPzLLeB1tTroCJx0MI1LxYVhb92EduNuBT50Y5S1Muew==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyi+AcqMK1VFkI8aUL+QlTchclOEAXseQ0RuftoSRedgA4fj58H
	x+sRKY3g7xvCI5ag/GkSRwzWuXAxVseRx3e50ugyFjBJXVaLAvI9e1SI4HoTurRplVRAetON6yK
	ZPvL7kiHZ/Yz4n9GGBBPsrg1LdcRysiGXq06ylSvMBv/qf3NC26sZXvi7kSk=
X-Gm-Gg: AZuq6aJTFeh6uTxUT6fbtuUeZtt3A3rqWEqXfaLSeo+oCRsEjigm4wB6jqRnwwQL3pX
	ItWqWdD6CxNf0FcSv/B43Nd3ydehqlcW82zCbwwK0hFIl6LMrakSNy1kgMWq2RyA05iWIrkCTi3
	N/0P9O3TUaIFZWGXxbAygi3AoRfrMnnryV2AZX4jvq5LZwQ39XME4FD1eI8w5Odo77kv9E6PSKG
	RehHaeHuAsFjy94hnlxZyb9W+udXcV6P4CKKNT84PzfYoy3ynIpVd5AAaPNfwzGZP6/qEzVk2xX
	JMqf/mf7ZlcVQuNx5hzTdgiowVhmHOwzyXnbFrwgpMWN2+vPnIg5Ys4ESRxI4uxsVXppQGc7Zwx
	M6qmxvXb9iGA=
X-Received: by 2002:a05:600c:3f0e:b0:47a:7fd0:9eea with SMTP id 5b1f17b1804b1-48398a42840mr90767045e9.3.1771504072827;
        Thu, 19 Feb 2026 04:27:52 -0800 (PST)
X-Received: by 2002:a05:600c:3f0e:b0:47a:7fd0:9eea with SMTP id 5b1f17b1804b1-48398a42840mr90766495e9.3.1771504072258;
        Thu, 19 Feb 2026 04:27:52 -0800 (PST)
Received: from thinky ([217.30.74.39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4839f985e4asm17268675e9.20.2026.02.19.04.27.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 04:27:51 -0800 (PST)
Date: Thu, 19 Feb 2026 13:27:51 +0100
From: Andrey Albershteyn <aalbersh@redhat.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: Andrey Albershteyn <aalbersh@kernel.org>, linux-xfs@vger.kernel.org, 
	fsverity@lists.linux.dev, linux-fsdevel@vger.kernel.org, ebiggers@kernel.org, hch@lst.de
Subject: Re: [PATCH v3 08/35] iomap: don't limit fsverity metadata by EOF in
 writeback
Message-ID: <oecxvzv56qk5qnlf2e4dwaaeyeyvpautlqfqnozurplikewopw@q7y6toosmyed>
References: <20260217231937.1183679-1-aalbersh@kernel.org>
 <20260217231937.1183679-9-aalbersh@kernel.org>
 <20260218230504.GG6467@frogsfrogsfrogs>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260218230504.GG6467@frogsfrogsfrogs>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: yVv1pUn_sK90N73gni1tXLd1L0AEKwHMQqBQmzbx9lg_1771504073
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2026-02-18 15:05:04, Darrick J. Wong wrote:
> On Wed, Feb 18, 2026 at 12:19:08AM +0100, Andrey Albershteyn wrote:
> > fsverity metadata is stored at the next folio after largest folio
> > containing EOF.
> > 
> > Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org>
> 
> I think this should be in the previous patch since writeback is part of
> pagecache writes.

ok, sure

> 
> Also, should there be a (debug) check somewhere that an IOMAP_F_FSVERITY
> mapping gets mapped to a folio that's entirely above EOF?

I rewrote it as below and added 
	WARN_ON_ONCE(folio_pos(folio) < isize)

-- 
- Andrey

diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
index 4cf9d0991dc1..ef9a5f542354 100644
--- a/fs/iomap/buffered-io.c
+++ b/fs/iomap/buffered-io.c
@@ -1746,13 +1746,21 @@ static int iomap_writeback_range(struct iomap_writepage_ctx *wpc,
  * Check interaction of the folio with the file end.
  *
  * If the folio is entirely beyond i_size, return false.  If it straddles
- * i_size, adjust end_pos and zero all data beyond i_size.
+ * i_size, adjust end_pos and zero all data beyond i_size. Don't skip fsverity
+ * folios as those are beyond i_size.
  */
-static bool iomap_writeback_handle_eof(struct folio *folio, struct inode *inode,
-               u64 *end_pos)
+static bool iomap_writeback_handle_eof(struct folio *folio,
+                                      struct iomap_writepage_ctx *wpc,
+                                      u64 *end_pos)
 {
+       struct inode *inode = wpc->inode;
        u64 isize = i_size_read(inode);
 
+       if (wpc->iomap.flags & IOMAP_F_FSVERITY) {
+               WARN_ON_ONCE(folio_pos(folio) < isize);
+               return true;
+       }
+
        if (*end_pos > isize) {
                size_t poff = offset_in_folio(folio, isize);
                pgoff_t end_index = isize >> PAGE_SHIFT;
@@ -1817,7 +1825,7 @@ int iomap_writeback_folio(struct iomap_writepage_ctx *wpc, struct folio *folio)
 
        trace_iomap_writeback_folio(inode, pos, folio_size(folio));
 
-       if (!iomap_writeback_handle_eof(folio, inode, &end_pos))
+       if (!iomap_writeback_handle_eof(folio, wpc, &end_pos))
                return 0;
        WARN_ON_ONCE(end_pos <= pos);

