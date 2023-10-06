Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA4D838F98
	for <fsverity@lists.linux.dev>; Fri,  6 Oct 2023 18:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TnxNjZ8J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1696618361;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wcRVHX8JFurBwxht+2exa+IxBRQV9tLkRgSIzCgziEo=;
	b=TnxNjZ8JIXrRtwe/qT13q56gEkiXZDpgPOk8YdoZXPxB7nCzx5437dFK3iEAsjNPZ5X36J
	6FsLaSytQhVJneTxdMbkgYsAhTnm9a76X1Wj1yT/5ajMEm5rK4hs2c0zfknBI47vJ+wSRG
	7Q55n4VXe5zadc+i7s6vzioxiPvxODI=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-169-nd2YAfIBNyC5Y9dbSJm0bQ-1; Fri, 06 Oct 2023 14:52:37 -0400
X-MC-Unique: nd2YAfIBNyC5Y9dbSJm0bQ-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-9ae0601d689so190822266b.0
        for <fsverity@lists.linux.dev>; Fri, 06 Oct 2023 11:52:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696618356; x=1697223156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wcRVHX8JFurBwxht+2exa+IxBRQV9tLkRgSIzCgziEo=;
        b=U810zCrDQe0ASVnv8wActnktE9j/jenBNo8F5/EDNBBI1ZZgyyWa/08wzRMLpzbMvV
         oIRgrR985yZlBVtqZ0Ejub1kNCHX1IG3uyb2n3AjrTBQvOVyGZdYwATbvy8Zd6WMJ3Sd
         N06OlFKtwNzMmSDk/HYQ/9eSKDQd7ve5Wm3LmjVlJANDOwBnr1iUp5bzaLbfDoYQrbGE
         M+H6mu5m3iOHxM4QzNelmhjUFoXQdTs7i5Lo7AX06e3TU2JGJawL0xHSDFjHS27UuW13
         SLf+RPSEbUKRC8vkQcv+/LRL+0lwwfbXyTNfvX/72OW5Zts/+VwrWar2lX4YHCmaU/SH
         gVag==
X-Gm-Message-State: AOJu0YzBtxRpC3melreA0wgEjFujhRy+ijoiLlz0M82NTvsFGAhCaY8J
	TJjYy6MuxUBJgdsc8DOwr/ZSDswFcTaMIrVGj+S5Wjht5G0AOGBrdk9U4tBaWr0Y+J/CgU4/1hP
	taBy/tR4S0tTwSLqeww==
X-Received: by 2002:a17:907:77c9:b0:9b2:6d09:847c with SMTP id kz9-20020a17090777c900b009b26d09847cmr7386274ejc.10.1696618356603;
        Fri, 06 Oct 2023 11:52:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGrIQk7NnCDbZwY+PjQ3U9MlJNLuObcZuXDq08LQZ7kco8xmXaUKZy2GLL1ssPfQnC1xSPWLQ==
X-Received: by 2002:a17:907:77c9:b0:9b2:6d09:847c with SMTP id kz9-20020a17090777c900b009b26d09847cmr7386255ejc.10.1696618356021;
        Fri, 06 Oct 2023 11:52:36 -0700 (PDT)
Received: from localhost.localdomain ([109.183.6.197])
        by smtp.gmail.com with ESMTPSA id os5-20020a170906af6500b009b947f81c4asm3304741ejb.155.2023.10.06.11.52.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 11:52:35 -0700 (PDT)
From: Andrey Albershteyn <aalbersh@redhat.com>
To: linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	fsverity@lists.linux.dev
Cc: djwong@kernel.org,
	ebiggers@kernel.org,
	david@fromorbit.com,
	dchinner@redhat.com,
	Andrey Albershteyn <aalbersh@redhat.com>
Subject: [PATCH v3 19/28] xfs: add XBF_DOUBLE_ALLOC to increase size of the buffer
Date: Fri,  6 Oct 2023 20:49:13 +0200
Message-Id: <20231006184922.252188-20-aalbersh@redhat.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231006184922.252188-1-aalbersh@redhat.com>
References: <20231006184922.252188-1-aalbersh@redhat.com>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

For fs-verity integration, XFS needs to supply kaddr'es of Merkle
tree blocks to fs-verity core and track which blocks are already
verified. One way to track verified status is to set xfs_buf flag
(previously added XBF_VERITY_CHECKED). When xfs_buf is evicted from
memory we loose verified status. Otherwise, fs-verity hits the
xfs_buf which is still in cache and contains already verified blocks.

However, the leaf blocks which are read to the xfs_buf contains leaf
headers. xfs_attr_get() allocates new pages and copies out the data
without header. Those newly allocated pages with extended attribute
data are not attached to the buffer anymore.

Add new XBF_DOUBLE_ALLOC which makes xfs_buf allocates x2 memory for
the buffer. Additional memory will be used for a copy of the
attribute data but without any headers. Also, make
xfs_attr_rmtval_get() to copy data to the buffer itself if XFS asked
for fs-verity block.

Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
---
 fs/xfs/libxfs/xfs_attr_remote.c | 27 +++++++++++++++++++++++++--
 fs/xfs/xfs_buf.c                |  7 ++++++-
 fs/xfs/xfs_buf.h                |  1 +
 3 files changed, 32 insertions(+), 3 deletions(-)

diff --git a/fs/xfs/libxfs/xfs_attr_remote.c b/fs/xfs/libxfs/xfs_attr_remote.c
index 5762135dc2a6..7657daf7cff3 100644
--- a/fs/xfs/libxfs/xfs_attr_remote.c
+++ b/fs/xfs/libxfs/xfs_attr_remote.c
@@ -392,12 +392,22 @@ xfs_attr_rmtval_get(
 	int			blkcnt = args->rmtblkcnt;
 	int			i;
 	int			offset = 0;
+	int			flags = 0;
+	void			*addr;
 
 	trace_xfs_attr_rmtval_get(args);
 
 	ASSERT(args->valuelen != 0);
 	ASSERT(args->rmtvaluelen == args->valuelen);
 
+	/*
+	 * We also check for _OP_BUFFER as we want to trigger on
+	 * verity blocks only, not on verity_descriptor
+	 */
+	if (args->attr_filter & XFS_ATTR_VERITY &&
+			args->op_flags & XFS_DA_OP_BUFFER)
+		flags = XBF_DOUBLE_ALLOC;
+
 	valuelen = args->rmtvaluelen;
 	while (valuelen > 0) {
 		nmap = ATTR_RMTVALUE_MAPSIZE;
@@ -417,13 +427,25 @@ xfs_attr_rmtval_get(
 			dblkno = XFS_FSB_TO_DADDR(mp, map[i].br_startblock);
 			dblkcnt = XFS_FSB_TO_BB(mp, map[i].br_blockcount);
 			error = xfs_buf_read(mp->m_ddev_targp, dblkno, dblkcnt,
-					0, &bp, &xfs_attr3_rmt_buf_ops);
+					flags, &bp, &xfs_attr3_rmt_buf_ops);
 			if (error)
 				return error;
 
+			/*
+			 * For fs-verity we allocated more space. That space is
+			 * filled with the same xattr data but without leaf
+			 * headers. Point args->value to that data
+			 */
+			if (flags & XBF_DOUBLE_ALLOC) {
+				addr = xfs_buf_offset(bp, BBTOB(bp->b_length));
+				args->value = addr;
+				dst = addr;
+			}
+
 			error = xfs_attr_rmtval_copyout(mp, bp, args->dp->i_ino,
 							&offset, &valuelen,
 							&dst);
+
 			xfs_buf_unlock(bp);
 			/* must be released by the caller */
 			if (args->op_flags & XFS_DA_OP_BUFFER)
@@ -521,7 +543,8 @@ xfs_attr_rmtval_set_value(
 		dblkno = XFS_FSB_TO_DADDR(mp, map.br_startblock),
 		dblkcnt = XFS_FSB_TO_BB(mp, map.br_blockcount);
 
-		error = xfs_buf_get(mp->m_ddev_targp, dblkno, dblkcnt, 0, &bp);
+		error = xfs_buf_get(mp->m_ddev_targp, dblkno, dblkcnt,
+				XBF_DOUBLE_ALLOC, &bp);
 		if (error)
 			return error;
 		bp->b_ops = &xfs_attr3_rmt_buf_ops;
diff --git a/fs/xfs/xfs_buf.c b/fs/xfs/xfs_buf.c
index c1ece4a08ff4..c5071a970596 100644
--- a/fs/xfs/xfs_buf.c
+++ b/fs/xfs/xfs_buf.c
@@ -328,6 +328,9 @@ xfs_buf_alloc_kmem(
 	xfs_km_flags_t	kmflag_mask = KM_NOFS;
 	size_t		size = BBTOB(bp->b_length);
 
+	if (flags & XBF_DOUBLE_ALLOC)
+		size *= 2;
+
 	/* Assure zeroed buffer for non-read cases. */
 	if (!(flags & XBF_READ))
 		kmflag_mask |= KM_ZERO;
@@ -358,6 +361,7 @@ xfs_buf_alloc_pages(
 {
 	gfp_t		gfp_mask = __GFP_NOWARN;
 	long		filled = 0;
+	int		mul = (flags & XBF_DOUBLE_ALLOC) ? 2 : 1;
 
 	if (flags & XBF_READ_AHEAD)
 		gfp_mask |= __GFP_NORETRY;
@@ -365,7 +369,8 @@ xfs_buf_alloc_pages(
 		gfp_mask |= GFP_NOFS;
 
 	/* Make sure that we have a page list */
-	bp->b_page_count = DIV_ROUND_UP(BBTOB(bp->b_length), PAGE_SIZE);
+	bp->b_page_count = DIV_ROUND_UP(BBTOB(bp->b_length*mul), PAGE_SIZE);
+
 	if (bp->b_page_count <= XB_PAGES) {
 		bp->b_pages = bp->b_page_array;
 	} else {
diff --git a/fs/xfs/xfs_buf.h b/fs/xfs/xfs_buf.h
index e79bfe548952..8e3272fb6e65 100644
--- a/fs/xfs/xfs_buf.h
+++ b/fs/xfs/xfs_buf.h
@@ -33,6 +33,7 @@ struct xfs_buf;
 #define XBF_STALE		(1u << 6) /* buffer has been staled, do not find it */
 #define XBF_WRITE_FAIL		(1u << 7) /* async writes have failed on this buffer */
 #define XBF_VERITY_CHECKED	(1u << 8) /* buffer was verified by fs-verity*/
+#define XBF_DOUBLE_ALLOC	(1u << 9) /* double allocated space */
 
 /* buffer type flags for write callbacks */
 #define _XBF_INODES	 (1u << 16)/* inode buffer */
-- 
2.40.1

