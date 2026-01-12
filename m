Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2142D061C
	for <fsverity@lists.linux.dev>; Mon, 12 Jan 2026 14:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768229412; cv=none; b=OMuAMFDG1/OKSyA75YkFXa0ht8aIDnTWBJ72QNUUCDndVrlubgtwk/3xHTiyVeJMeG+NmQOCsxsuq2GlDDrIcd8UsD6yONOr782udxvvqIwWpQyM4lnfepaENLYpKJmiIj4RK0szdwIzHP/Y5pZrGajX7pLbsIjqIqd8WDGbZnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768229412; c=relaxed/simple;
	bh=lB7wBAy3M3z8P6ED/Qvh7FHLytVcPytGJfFQJNDXzlw=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=fqv9rsVrgyoANrRwCzbG+9CK+GDnl/wZHeCDfhsOkXqbp06Rp3uURAqAUV4Us8AtjE96XCqOyNTynNWB61rlRsyCK2QqQ/F5Gb5sLArn+0fWj3bKuZBm0S3fK4AG4lEsIMXEUyqvzBGPqJlCUByLB6zyYA9Y140Rs0g64GpRdks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GRDC+P2Y; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GRDC+P2Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768229410;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=H9nqGXF7VZB/t40lccwLaOeVR9kiIu9hGxW7Aiixpys=;
	b=GRDC+P2YQpzL2dQSL4DEXV8PggJBTcpzcZ9UxLrTpAy1TQyyVUb4iDth8kYjazGe4bZG8P
	dfhRTBt76FBw0oBrsCc6kCZSbhW6B0PcPQktrqXWgHDQ1LgcxF0J3/lkJvvRcjLxGQn3Ak
	JmZ7oYmWuv9ZvKCLfQhDafb38NwL+pk=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-515-n-Fs-5ZXOKu7BdehvTn5Ow-1; Mon, 12 Jan 2026 09:50:09 -0500
X-MC-Unique: n-Fs-5ZXOKu7BdehvTn5Ow-1
X-Mimecast-MFC-AGG-ID: n-Fs-5ZXOKu7BdehvTn5Ow_1768229408
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-b7cea4b3f15so880872866b.3
        for <fsverity@lists.linux.dev>; Mon, 12 Jan 2026 06:50:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768229408; x=1768834208;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H9nqGXF7VZB/t40lccwLaOeVR9kiIu9hGxW7Aiixpys=;
        b=mNCK2ZJ1tbLc8ltHZ8KanOVJwYdnDKGK5BSRSXdUmLFLLHfEdzTN9xPWTH+qmqINqg
         QEwnCOotT8mGYWRbmLmTUYmpGoMHG7Blvzt6CXzOD+jdYqTn1jwVqVjop/InEtOoxvyG
         sqzOGttKP/Gykz65pBqqpKllrzRrXLEe+kmoU0fg0dipJSNr1EIB/aqH/iTt9q7XHA6g
         ZIuCJoHq+BuQ/POhUCYeJRQRATTKWX9eL16kM9dYI3BrDe96Wx8eSRQZAcjxAhi+5Li7
         R/EeAYW+206H2YG+FiI/J2ZllmWdz3QtoMYywfednuubpPz6xDPn1vGGGpCS/54GtFG9
         U7iQ==
X-Gm-Message-State: AOJu0YxVxcNNdHLzmnoVPhzPRgAZDihgPk5eHrwXC6TLClqFPr9Sp8Xa
	rHgb8gqIgNuC7bBwCCtlsX9lXBzIIvb2Z2fSVR2xc2TELy41nUr/cMhwxpqB3pRnmIl53Wi4Sfm
	06irxdIqRTcXWjNgdbNCcgfwYfdhTbsxxh5+iCXzs/qsMg9mTLFqAsqjiQXaKnexyFup1CK8nOk
	Cqpj8yRDZSCLJUCSUw0r1KkpRoyNcMY6N8bQ67QOeg+Zs=
X-Gm-Gg: AY/fxX4/ZzxIOoVUkawt2WvEqva0U8fTJ6sJa9TL+hRg/LUr1yLts5czZKtNhnROEgF
	HsiTj6DmMO7yZt5W0nr164ghmn78h9lZzzCEH6XJ4VQqjavJrNdwr3YYbusUvzyelSY0ZY8ZnD+
	zQAanMtMIzhUon4XLQ7z9e3I4Yv1QBfnJfkSgTTgFXHJ4ZKGQdwFaupZPntqMSLeMPXG40z9674
	PAhgwpM0CMoUDjSgAdtTZaD+oIf7DB9XtD+8crOkB/4vpAlpyyC/MvRab56aKK4eNDYAzwezr+y
	1c3U4+iJuWuUSMgEPCGZL2R2VT9z8F+eWMAR8TWd/9MVVCbTZxVEVn5bJ8yha8zOIBD49OmAsbc
	=
X-Received: by 2002:a17:907:3f8d:b0:b87:117f:b6ed with SMTP id a640c23a62f3a-b87117fc7e0mr436716766b.21.1768229407990;
        Mon, 12 Jan 2026 06:50:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEqMxLNiTQozzXuSioBg+1XMgAdT8qg+RoHIsG2zDVIHtJhfMKwuQp3tBwxWEI5jhYze2cXDg==
X-Received: by 2002:a17:907:3f8d:b0:b87:117f:b6ed with SMTP id a640c23a62f3a-b87117fc7e0mr436712466b.21.1768229407405;
        Mon, 12 Jan 2026 06:50:07 -0800 (PST)
Received: from thinky ([217.30.74.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a27cc6bsm1966748766b.23.2026.01.12.06.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 06:50:07 -0800 (PST)
From: Andrey Albershteyn <aalbersh@redhat.com>
X-Google-Original-From: Andrey Albershteyn <aalbersh@kernel.org>
Date: Mon, 12 Jan 2026 15:50:05 +0100
To: fsverity@lists.linux.dev, linux-xfs@vger.kernel.org, 
	ebiggers@kernel.org, linux-fsdevel@vger.kernel.org, aalbersh@kernel.org, 
	aalbersh@redhat.com, djwong@kernel.org
Cc: djwong@kernel.org, david@fromorbit.com, hch@lst.de
Subject: [PATCH v2 3/22] iomap: introduce IOMAP_F_BEYOND_EOF
Message-ID: <d5fc72ldfwyzbgiypzlhn5diiqyijxaicpa3w6obx4iismuko3@kttpcgqjy6i5>
References: <cover.1768229271.patch-series@thinky>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <cover.1768229271.patch-series@thinky>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: MM4IQl0tuys2m0KWd7W2NynWUU146dxetPyl9UaYGag_1768229408
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Flag to indicate to iomap that read/write is happening beyond EOF and no
isize checks/update is needed.

Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org>
---
 fs/iomap/buffered-io.c | 13 ++++++++-----
 fs/iomap/trace.h       |  3 ++-
 include/linux/iomap.h  |  5 +++++
 3 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
index e5c1ca440d..cc1cbf2a4c 100644
--- a/fs/iomap/buffered-io.c
+++ b/fs/iomap/buffered-io.c
@@ -533,7 +533,8 @@
 			return 0;
 
 		/* zero post-eof blocks as the page may be mapped */
-		if (iomap_block_needs_zeroing(iter, pos)) {
+		if (iomap_block_needs_zeroing(iter, pos) &&
+		    !(iomap->flags & IOMAP_F_BEYOND_EOF)) {
 			folio_zero_range(folio, poff, plen);
 			iomap_set_range_uptodate(folio, poff, plen);
 		} else {
@@ -1130,13 +1131,14 @@
 		 * unlock and release the folio.
 		 */
 		old_size = iter->inode->i_size;
-		if (pos + written > old_size) {
+		if (pos + written > old_size &&
+		    !(iter->flags & IOMAP_F_BEYOND_EOF)) {
 			i_size_write(iter->inode, pos + written);
 			iter->iomap.flags |= IOMAP_F_SIZE_CHANGED;
 		}
 		__iomap_put_folio(iter, write_ops, written, folio);
 
-		if (old_size < pos)
+		if (old_size < pos && !(iter->flags & IOMAP_F_BEYOND_EOF))
 			pagecache_isize_extended(iter->inode, old_size, pos);
 
 		cond_resched();
@@ -1815,8 +1817,9 @@
 
 	trace_iomap_writeback_folio(inode, pos, folio_size(folio));
 
-	if (!iomap_writeback_handle_eof(folio, inode, &end_pos))
-		return 0;
+	if (!(wpc->iomap.flags & IOMAP_F_BEYOND_EOF) &&
+	    !iomap_writeback_handle_eof(folio, inode, &end_pos))
+ 		return 0;
 	WARN_ON_ONCE(end_pos <= pos);
 
 	if (i_blocks_per_folio(inode, folio) > 1) {
diff --git a/fs/iomap/trace.h b/fs/iomap/trace.h
index 532787277b..f1895f7ae5 100644
--- a/fs/iomap/trace.h
+++ b/fs/iomap/trace.h
@@ -118,7 +118,8 @@
 	{ IOMAP_F_ATOMIC_BIO,	"ATOMIC_BIO" }, \
 	{ IOMAP_F_PRIVATE,	"PRIVATE" }, \
 	{ IOMAP_F_SIZE_CHANGED,	"SIZE_CHANGED" }, \
-	{ IOMAP_F_STALE,	"STALE" }
+	{ IOMAP_F_STALE,	"STALE" }, \
+	{ IOMAP_F_BEYOND_EOF,	"BEYOND_EOF" }
 
 
 #define IOMAP_DIO_STRINGS \
diff --git a/include/linux/iomap.h b/include/linux/iomap.h
index 520e967cb5..7a7e31c499 100644
--- a/include/linux/iomap.h
+++ b/include/linux/iomap.h
@@ -86,6 +86,11 @@
 #define IOMAP_F_PRIVATE		(1U << 12)
 
 /*
+ * IO happens beyound inode EOF
+ */
+#define IOMAP_F_BEYOND_EOF	(1U << 13)
+
+/*
  * Flags set by the core iomap code during operations:
  *
  * IOMAP_F_SIZE_CHANGED indicates to the iomap_end method that the file size

-- 
- Andrey

