Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6E0D7A715
	for <fsverity@lists.linux.dev>; Mon,  4 Mar 2024 19:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709579550; cv=none; b=lEzG/imqNcPr/Wxf1qXmlNnCX96kjD/M1cGlBiYBKZN3z3gGPxrmJZjaGqRcCg4RnoXFQvUJI20519IdnB6g0lXwcEeXJ/g8nGUD6lnhThd26q/5mxiSCC/mraWz+Nb8fqzFzQudEpsAu99MfNgjKtZAdPn1Fo5OvRieT1paSKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709579550; c=relaxed/simple;
	bh=Tz47sSqAAO/Ffyy1uy8RshNmMIkvlbkyB5AdA/WTz+M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ITvPz5gC9usdBrX21PLWnkrH2d1wYUHbUkhEDWvfeL7ShWrnjRpYKjS11l/Tx85yjkW3B+Q0COkdZNkkUh/M9Yr2flA+xgxhlMkBzJbhkdGdDbYInlQNiME19WhFWdEynQnTdwufjtmdrO5zYBH9S8dv9dYOPtC9dsKwVT5BTzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=D9CtkkVU; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D9CtkkVU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709579547;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4MfVHdc6EW417j4NiszFN0p6hApvm4FnbcGOt5t4/Is=;
	b=D9CtkkVUkMeu8/gaOVwduh4fdpu/zG391BGZCkzo0wSWZDCuq6OxzKSFaOlr6NX+QzktjA
	c5hbTl5MqrmLUmmQfI1V7rtAwKSNxXihfGOxBqSSRvGSFsaB/zfEk/DKPEVsBQC7ml25ed
	slApNhTZfj2lDuj1kKQTqw+eXdFGkk4=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-581-Bdq0CNGpPkaeBXI8x0VMcw-1; Mon, 04 Mar 2024 14:12:26 -0500
X-MC-Unique: Bdq0CNGpPkaeBXI8x0VMcw-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a2f71c83b7eso429097066b.1
        for <fsverity@lists.linux.dev>; Mon, 04 Mar 2024 11:12:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709579545; x=1710184345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4MfVHdc6EW417j4NiszFN0p6hApvm4FnbcGOt5t4/Is=;
        b=V7sPnvklWvXJUtlGeqZlOqR0KlPYJT2vVOMgXQNfFypj2bmCG6a8lrHIU829lRU3ZA
         pz4iAtFwNZubxS5529dIvYFJHft9VrP2id4maExPK86q8qv3lQjJDLBOvMXMb992q1p3
         9G8smawtDHJ09nITPICx3zWJPlqLav2y0yoeIU0WzyUwBp1BCohOyRetv9U7NVf3+J4t
         i/o0qAsRklNvs8otBnG0AbjuQRg4Oj1poa/6qqJa6p6EW7qoE94YCnRLIJ2QYbp23xVK
         lNOCeQ1XZckTe2Y6e2XBbMQkpOuTUJxt9rlvuUjX8sYDXhe6w6TWmcuJ7aewMbHMmAgz
         0bxw==
X-Gm-Message-State: AOJu0YzF6w0Yh4FxESjhjXJA8xpzTuuIcOxPgjMz4jwq4WTRaMANf9yP
	VpyOySkDOUJ2kIl3ispgqtm0+zIrLeVcKPscDNvOV1gwHLZKT+occ6DFa6sgIO9KlFoSEVf0NlD
	Lv2WlKrmqWCctGVyvfct2/zPBwz420QobG3vToMVEHH9ACyAPaWJGVxcQ92Ep1l79S4nmEAzqe8
	XkeN8tL2KJ5bHnupoOCjU0Ol20qhdvQLcEXQFBMJM=
X-Received: by 2002:a17:906:c49:b0:a3f:173a:224c with SMTP id t9-20020a1709060c4900b00a3f173a224cmr6051478ejf.51.1709579545128;
        Mon, 04 Mar 2024 11:12:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE2wJQBUPkaSNJnpTE0mFEg++asVSTup2Ot7QfTxewXevpxdm3AJlsdXSnS/6gxCSfey91SdA==
X-Received: by 2002:a17:906:c49:b0:a3f:173a:224c with SMTP id t9-20020a1709060c4900b00a3f173a224cmr6051457ejf.51.1709579544519;
        Mon, 04 Mar 2024 11:12:24 -0800 (PST)
Received: from thinky.redhat.com ([109.183.6.197])
        by smtp.gmail.com with ESMTPSA id a11-20020a1709064a4b00b00a44a04aa3cfsm3783319ejv.225.2024.03.04.11.12.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 11:12:24 -0800 (PST)
From: Andrey Albershteyn <aalbersh@redhat.com>
To: fsverity@lists.linux.dev,
	linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	chandan.babu@oracle.com,
	djwong@kernel.org,
	ebiggers@kernel.org
Cc: Andrey Albershteyn <aalbersh@redhat.com>
Subject: [PATCH v5 15/24] xfs: add XBF_DOUBLE_ALLOC to increase size of the buffer
Date: Mon,  4 Mar 2024 20:10:38 +0100
Message-ID: <20240304191046.157464-17-aalbersh@redhat.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240304191046.157464-2-aalbersh@redhat.com>
References: <20240304191046.157464-2-aalbersh@redhat.com>
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
(previously added XBF_VERITY_SEEN). When xfs_buf is evicted from
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
 fs/xfs/libxfs/xfs_attr_remote.c | 26 ++++++++++++++++++++++++--
 fs/xfs/xfs_buf.c                |  6 +++++-
 fs/xfs/xfs_buf.h                |  2 ++
 3 files changed, 31 insertions(+), 3 deletions(-)

diff --git a/fs/xfs/libxfs/xfs_attr_remote.c b/fs/xfs/libxfs/xfs_attr_remote.c
index f15350e99d66..f1b7842da809 100644
--- a/fs/xfs/libxfs/xfs_attr_remote.c
+++ b/fs/xfs/libxfs/xfs_attr_remote.c
@@ -395,12 +395,22 @@ xfs_attr_rmtval_get(
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
@@ -420,12 +430,23 @@ xfs_attr_rmtval_get(
 			dblkno = XFS_FSB_TO_DADDR(mp, map[i].br_startblock);
 			dblkcnt = XFS_FSB_TO_BB(mp, map[i].br_blockcount);
 			error = xfs_buf_read(mp->m_ddev_targp, dblkno, dblkcnt,
-					0, &bp, &xfs_attr3_rmt_buf_ops);
+					flags, &bp, &xfs_attr3_rmt_buf_ops);
 			if (xfs_metadata_is_sick(error))
 				xfs_dirattr_mark_sick(args->dp, XFS_ATTR_FORK);
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
 			error = xfs_attr_rmtval_copyout(mp, bp, args->dp,
 							&offset, &valuelen,
 							&dst);
@@ -526,7 +547,8 @@ xfs_attr_rmtval_set_value(
 		dblkno = XFS_FSB_TO_DADDR(mp, map.br_startblock),
 		dblkcnt = XFS_FSB_TO_BB(mp, map.br_blockcount);
 
-		error = xfs_buf_get(mp->m_ddev_targp, dblkno, dblkcnt, 0, &bp);
+		error = xfs_buf_get(mp->m_ddev_targp, dblkno, dblkcnt,
+				XBF_DOUBLE_ALLOC, &bp);
 		if (error)
 			return error;
 		bp->b_ops = &xfs_attr3_rmt_buf_ops;
diff --git a/fs/xfs/xfs_buf.c b/fs/xfs/xfs_buf.c
index 7fc26e64368d..d8a478bda865 100644
--- a/fs/xfs/xfs_buf.c
+++ b/fs/xfs/xfs_buf.c
@@ -337,6 +337,9 @@ xfs_buf_alloc_kmem(
 	gfp_t		gfp_mask = GFP_KERNEL | __GFP_NOLOCKDEP | __GFP_NOFAIL;
 	size_t		size = BBTOB(bp->b_length);
 
+	if (flags & XBF_DOUBLE_ALLOC)
+		size *= 2;
+
 	/* Assure zeroed buffer for non-read cases. */
 	if (!(flags & XBF_READ))
 		gfp_mask |= __GFP_ZERO;
@@ -367,12 +370,13 @@ xfs_buf_alloc_pages(
 {
 	gfp_t		gfp_mask = GFP_KERNEL | __GFP_NOLOCKDEP | __GFP_NOWARN;
 	long		filled = 0;
+	int		mul = (bp->b_flags & XBF_DOUBLE_ALLOC) ? 2 : 1;
 
 	if (flags & XBF_READ_AHEAD)
 		gfp_mask |= __GFP_NORETRY;
 
 	/* Make sure that we have a page list */
-	bp->b_page_count = DIV_ROUND_UP(BBTOB(bp->b_length), PAGE_SIZE);
+	bp->b_page_count = DIV_ROUND_UP(BBTOB(bp->b_length*mul), PAGE_SIZE);
 	if (bp->b_page_count <= XB_PAGES) {
 		bp->b_pages = bp->b_page_array;
 	} else {
diff --git a/fs/xfs/xfs_buf.h b/fs/xfs/xfs_buf.h
index b5c58287c663..60b7d58d5da1 100644
--- a/fs/xfs/xfs_buf.h
+++ b/fs/xfs/xfs_buf.h
@@ -33,6 +33,7 @@ struct xfs_buf;
 #define XBF_STALE		(1u << 6) /* buffer has been staled, do not find it */
 #define XBF_WRITE_FAIL		(1u << 7) /* async writes have failed on this buffer */
 #define XBF_VERITY_SEEN		(1u << 8) /* buffer was processed by fs-verity */
+#define XBF_DOUBLE_ALLOC	(1u << 9) /* double allocated space */
 
 /* buffer type flags for write callbacks */
 #define _XBF_INODES	 (1u << 16)/* inode buffer */
@@ -67,6 +68,7 @@ typedef unsigned int xfs_buf_flags_t;
 	{ XBF_STALE,		"STALE" }, \
 	{ XBF_WRITE_FAIL,	"WRITE_FAIL" }, \
 	{ XBF_VERITY_SEEN,	"VERITY_SEEN" }, \
+	{ XBF_DOUBLE_ALLOC,	"DOUBLE_ALLOC" }, \
 	{ _XBF_INODES,		"INODES" }, \
 	{ _XBF_DQUOTS,		"DQUOTS" }, \
 	{ _XBF_LOGRECOVERY,	"LOG_RECOVERY" }, \
-- 
2.42.0

