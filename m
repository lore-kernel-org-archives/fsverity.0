Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B95832DB7A1
	for <fsverity@lists.linux.dev>; Mon, 12 Jan 2026 14:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768229503; cv=none; b=RaKz+eXkfVbnC8Skb62EdwJLH9GD9KzeBZUOHgE3pCL9bWELCqKne2dqmEo1HOCXpkP7bnHafpG/bhglIDHLN3wOlHrgA+swlPPfZTxoBh92wqr7S6khEISgytk8sD1SDBkdTPIG7MIHTz7cadVyy1akUTxsWc2X5rs8Gyslp8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768229503; c=relaxed/simple;
	bh=KuVncpruotZd/UsOXvAmuKf4QdktlGEPoHD59smbXrU=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=RhyMu86JLIXOOdowWx/42DUfy1TJ92YrSPmtVAvYjzspSz5tWDZ3GrsJp8PpBPnbzcN9nqpJb6c+1SycO4r2RPmU4pkmOXfO4LEJ3Oe48lrMviVSyy6IdRjcYtdoCfznXH9MqpjCDuaD38OXcNZAaMsrgpjrDxG1xfUMuqNLcPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Fr+GZDEH; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Fr+GZDEH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768229500;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SBkDD6Fi/bpRn7zVUlo8hSmg4I+N+3/I24mCz3Q7/v4=;
	b=Fr+GZDEHhmdiM2k7rcT746cJbqIots/3Z1sr2/D281V3nmePTwO0300cGiZsGZlOyJLnj2
	EpKQiKYUoi4AY07gtF2fYx5BYWaYh68VUqsKXurRAMstH7fGxfnVdUq9V6+B0zDsf/tJqR
	Hlx1xroXrnOFNPHTBiVu3/lhDKDOIVg=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-567-uwBGGxBSPz-Er-EmJ5PSXg-1; Mon, 12 Jan 2026 09:51:39 -0500
X-MC-Unique: uwBGGxBSPz-Er-EmJ5PSXg-1
X-Mimecast-MFC-AGG-ID: uwBGGxBSPz-Er-EmJ5PSXg_1768229498
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-b86fd61e3b4so176853266b.0
        for <fsverity@lists.linux.dev>; Mon, 12 Jan 2026 06:51:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768229498; x=1768834298;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SBkDD6Fi/bpRn7zVUlo8hSmg4I+N+3/I24mCz3Q7/v4=;
        b=DEF104MRQVGtKxSyBj1yhNBgMUAyy6dfJ8CxbE7+pG7T2YczSibwl7897pui9pdptH
         IyF2ceNlCn8MYGlwhfmqI8QnXdH7i/Mg5RBee6vibNmS4+qZJfAIq0s/0/YI2cWfj3ag
         PMHv3tA7eU4m17mQl0NEGuGBx1gbZVQ6XYFOIoK1mQWfvErQA5D0iEfahOKcHBsnc2tO
         hhOruQ++rE2cWDXE14I0BBiWjWdd9ZefA2zt0iVtTxAeTh4Yc2TiQJuyHhRvheBpwmM6
         sDJqxIE7rM1XNVqAClKQT2VV4IPHQEo29qdd08kI7MmDN3AaSbNaPezgqGofx/jbibPM
         tFYg==
X-Gm-Message-State: AOJu0YwazcgDh4zwai2rR8gtgZU1GqjG75ydL85dJqS29VZmjKbCFIXN
	+EfBCnmX5VBnKWjVJcsPhZppfoW6G56G4Rc3ldW3iPH4ivWGrH+FJz0cigoi9A2TnReik0VLDJM
	M5ZNojmrzt4PNqfa2cA52JQ3+KwwfSAhAavU/lD7Vii6L/PZ56mSVIPyGYxNe3dxNanY5xtnmGz
	uD+hVxJJ/xW82rsSJMoHCBimwhzO8ilT3kPqVJoMTq8Yo=
X-Gm-Gg: AY/fxX6JGObkehvYIfj6eSaV8g2hS0M91aZ4u9LNXCPmh1CzIHTs+T2teq7uThaB8J9
	gSmKGL+/fUaHWHS5Ck0v0t72a4qKrEA2Le8DqkBfbUB6qPVFU7+rt3Oo0FaAhZzItsDASFNQQKY
	1nm8jYFPa9r7GOdySRTb7Yw9cZIhH997jlgmse/JuobYRf4/OoT+auiQApT1TuzQ085y+zZP2/c
	sP3Y2vvzu/jIf/nndxJ68igWVuwMwfbF2YgFwq/ZOjXgpBcSW2IHTaRZt7Z+xqP3TkyN6rX0YdU
	tgK3ziVexTLZkc8oqEktn8EpAQHbTqScqC2MwPseo4ZXsbigl6c0BR2ZzCWGi6Hu/f2NUu4EsNs
	=
X-Received: by 2002:a17:906:f599:b0:b83:288a:2bce with SMTP id a640c23a62f3a-b84451f1870mr1947368866b.24.1768229498133;
        Mon, 12 Jan 2026 06:51:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGKhlt85YSYPpY/hF5ITXGpTLxb6PAI0j39GqviSICFmscjl6cOBil351MZnv+wZM9aM3V+qQ==
X-Received: by 2002:a17:906:f599:b0:b83:288a:2bce with SMTP id a640c23a62f3a-b84451f1870mr1947366166b.24.1768229497631;
        Mon, 12 Jan 2026 06:51:37 -0800 (PST)
Received: from thinky ([217.30.74.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8706c2604bsm518177766b.16.2026.01.12.06.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 06:51:37 -0800 (PST)
From: Andrey Albershteyn <aalbersh@redhat.com>
X-Google-Original-From: Andrey Albershteyn <aalbersh@kernel.org>
Date: Mon, 12 Jan 2026 15:51:36 +0100
To: fsverity@lists.linux.dev, linux-xfs@vger.kernel.org, 
	ebiggers@kernel.org, linux-fsdevel@vger.kernel.org, aalbersh@kernel.org, 
	aalbersh@redhat.com, djwong@kernel.org
Cc: djwong@kernel.org, david@fromorbit.com, hch@lst.de
Subject: [PATCH v2 15/22] xfs: add writeback and iomap reading of Merkle tree
 pages
Message-ID: <bkwfiiwnqleh3rr3mcge2fx6uucvvj2qzyl3sbzgb4b4sbjm27@nw2i3bz7xvrr>
References: <cover.1768229271.patch-series@thinky>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <cover.1768229271.patch-series@thinky>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BRYpkYpGIwbqMVvG5Z19RFAWdrLW1dpkBjNE7dbkjkk_1768229498
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In the writeback path use unbound write interface, meaning that inode
size is not updated and none of the file size checks are applied.

In read path let iomap know that data is stored beyond EOF via flag.
This leads to skipping of post EOF zeroing.

Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org>
---
 fs/xfs/xfs_aops.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/fs/xfs/xfs_aops.c b/fs/xfs/xfs_aops.c
index 56a5446384..30e38d5322 100644
--- a/fs/xfs/xfs_aops.c
+++ b/fs/xfs/xfs_aops.c
@@ -22,6 +22,7 @@
 #include "xfs_icache.h"
 #include "xfs_zone_alloc.h"
 #include "xfs_rtgroup.h"
+#include "xfs_fsverity.h"
 
 struct xfs_writepage_ctx {
 	struct iomap_writepage_ctx ctx;
@@ -334,6 +335,7 @@
 	int			retries = 0;
 	int			error = 0;
 	unsigned int		*seq;
+	unsigned int		iomap_flags = 0;
 
 	if (xfs_is_shutdown(mp))
 		return -EIO;
@@ -427,7 +429,9 @@
 	    isnullstartblock(imap.br_startblock))
 		goto allocate_blocks;
 
-	xfs_bmbt_to_iomap(ip, &wpc->iomap, &imap, 0, 0, XFS_WPC(wpc)->data_seq);
+	if (xfs_iflags_test(ip, XFS_VERITY_CONSTRUCTION))
+		iomap_flags |= IOMAP_F_BEYOND_EOF;
+	xfs_bmbt_to_iomap(ip, &wpc->iomap, &imap, 0, iomap_flags, XFS_WPC(wpc)->data_seq);
 	trace_xfs_map_blocks_found(ip, offset, count, whichfork, &imap);
 	return 0;
 allocate_blocks:
@@ -470,6 +474,9 @@
 			wpc->iomap.length = cow_offset - wpc->iomap.offset;
 	}
 
+	if (offset >= XFS_FSVERITY_REGION_START)
+		wpc->iomap.flags |= IOMAP_F_BEYOND_EOF;
+
 	ASSERT(wpc->iomap.offset <= offset);
 	ASSERT(wpc->iomap.offset + wpc->iomap.length > offset);
 	trace_xfs_map_blocks_alloc(ip, offset, count, whichfork, &imap);
@@ -698,6 +705,17 @@
 			},
 		};
 
+		if (xfs_iflags_test(ip, XFS_VERITY_CONSTRUCTION)) {
+			wbc->range_start = XFS_FSVERITY_REGION_START;
+			wbc->range_end = LLONG_MAX;
+			wbc->nr_to_write = LONG_MAX;
+			/*
+			 * Set IOMAP_F_BEYOND_EOF to skip initial EOF check
+			 * The following iomap->flags would be set in
+			 * xfs_map_blocks()
+			 */
+			wpc.ctx.iomap.flags |= IOMAP_F_BEYOND_EOF;
+		}
 		return iomap_writepages(&wpc.ctx);
 	}
 }

-- 
- Andrey

