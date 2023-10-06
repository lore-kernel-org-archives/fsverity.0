Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CDD526E04
	for <fsverity@lists.linux.dev>; Fri,  6 Oct 2023 18:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Gumo9pD9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1696618354;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8fJjOgJTOBqTNpGZsppEB438CqzELHcDr88tlE5TL2U=;
	b=Gumo9pD98Z97NknyCB4JoJhVWFtqydhYmoRhkd5pPS5jLI09cCjGX+Qos2y583Q5zbi8ZN
	CaOkTrjAdgHmDLGMXOTbqOq9OLzvw7wlvXb1wnoDcD3seeEfE4k5xG8xQhOX4vk8zffGpU
	6ppLOHxkzjqQoNnpiyxE3lhrRNZKduI=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-529-yZwte05QOqasQuPU-Hv9RQ-1; Fri, 06 Oct 2023 14:52:31 -0400
X-MC-Unique: yZwte05QOqasQuPU-Hv9RQ-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-9b2e030e4caso393342566b.1
        for <fsverity@lists.linux.dev>; Fri, 06 Oct 2023 11:52:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696618350; x=1697223150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8fJjOgJTOBqTNpGZsppEB438CqzELHcDr88tlE5TL2U=;
        b=csl93+1YEI07ichoMrl1792SrLrCZQRQueIqipE6w8Tc4El6iRt5/2HepZ04wEDbOe
         7VOelXQXDRmSsFx0leCiwXiJD9gfTCbmuO0Mx9cyS2eyl8DKa2NWsae7yE4a1cgA3hBE
         ycbvoCUDurMLvG6LwimievBukGosb+tQv7Cm3oJnVBAo3Hbu7m2hzfkxkIHcWyLMv3cn
         t49jS+yQKSNY7/LtNkmoTumdAj7omVTvefEI46nO3fIMg7IZcEzSy3uCXeuWCgS17kXz
         EaFJ+wGdH0dzQa9wXfHsHiPVnWBmIrCxemcFvc0HFB+QeLHOwjeYPx91G+Xvt/yXO++o
         qI9g==
X-Gm-Message-State: AOJu0Yx3S/C/Nzt8PCUPDVNbfJafH+LqkWOJmtts86KLRw6zJfilcBRC
	KDD2zwkDPlg2H1/KlKv83jzyeTjb6FRsNdbF2ihVIaDS9iQwNjgRsoVrSNfSJZtcrHd/SPbsU9t
	lNz78asejJOQCaDrqgzed+MclVg==
X-Received: by 2002:a17:906:31c1:b0:9b6:d20d:8a46 with SMTP id f1-20020a17090631c100b009b6d20d8a46mr5748157ejf.6.1696618349801;
        Fri, 06 Oct 2023 11:52:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJtYnAO2IwdX1h2RvfFSiMYTMaukCGR5jLN6oib6DxFhtgJB+r7zCfde55VfmX4YT5UsZzWg==
X-Received: by 2002:a17:906:31c1:b0:9b6:d20d:8a46 with SMTP id f1-20020a17090631c100b009b6d20d8a46mr5748148ejf.6.1696618349521;
        Fri, 06 Oct 2023 11:52:29 -0700 (PDT)
Received: from localhost.localdomain ([109.183.6.197])
        by smtp.gmail.com with ESMTPSA id os5-20020a170906af6500b009b947f81c4asm3304741ejb.155.2023.10.06.11.52.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 11:52:28 -0700 (PDT)
From: Andrey Albershteyn <aalbersh@redhat.com>
To: linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	fsverity@lists.linux.dev
Cc: djwong@kernel.org,
	ebiggers@kernel.org,
	david@fromorbit.com,
	dchinner@redhat.com,
	Andrey Albershteyn <aalbersh@redhat.com>
Subject: [PATCH v3 12/28] iomap: allow filesystem to implement read path verification
Date: Fri,  6 Oct 2023 20:49:06 +0200
Message-Id: <20231006184922.252188-13-aalbersh@redhat.com>
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

Currently, there is no interface to let filesystem do
post-processing of completed BIO (ioend) in read path. This can be
very handy for fs-verity verification. This patch add a callout to
filesystem provided ->submit_bio to configure BIO completion callout.

The read path ioend iomap_read_ioend are stored side by side with
BIOs allocated from filesystem provided bio_set.

Add IOMAP_F_READ_VERITY which indicates that iomap need to
verify BIO (e.g. fs-verity) after I/O is completed.

Any verification itself happens on filesystem side. The verification
is done when the BIO is processed by calling out ->bi_end_io().

Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
---
 fs/iomap/buffered-io.c | 40 +++++++++++++++++++++++++++++++++-------
 include/linux/iomap.h  | 15 +++++++++++++++
 2 files changed, 48 insertions(+), 7 deletions(-)

diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
index ca78c7f62527..0a1bec91fdf6 100644
--- a/fs/iomap/buffered-io.c
+++ b/fs/iomap/buffered-io.c
@@ -332,6 +332,19 @@ static inline bool iomap_block_needs_zeroing(const struct iomap_iter *iter,
 		pos >= i_size_read(iter->inode);
 }
 
+static void
+iomap_submit_read_io(const struct iomap_iter *iter,
+		struct iomap_readpage_ctx *ctx)
+{
+	if (!ctx->bio)
+		return;
+
+	if (ctx->ops && ctx->ops->submit_io)
+		ctx->ops->submit_io(iter, ctx->bio, iter->pos);
+	else
+		submit_bio(ctx->bio);
+}
+
 static loff_t iomap_readpage_iter(const struct iomap_iter *iter,
 		struct iomap_readpage_ctx *ctx, loff_t offset)
 {
@@ -355,6 +368,13 @@ static loff_t iomap_readpage_iter(const struct iomap_iter *iter,
 
 	if (iomap_block_needs_zeroing(iter, pos)) {
 		folio_zero_range(folio, poff, plen);
+		if (iomap->flags & IOMAP_F_READ_VERITY) {
+			if (ctx->ops->verify_folio(folio, poff, plen)) {
+				folio_set_error(folio);
+				goto done;
+			}
+		}
+
 		iomap_set_range_uptodate(folio, poff, plen);
 		goto done;
 	}
@@ -371,13 +391,20 @@ static loff_t iomap_readpage_iter(const struct iomap_iter *iter,
 		gfp_t orig_gfp = gfp;
 		unsigned int nr_vecs = DIV_ROUND_UP(length, PAGE_SIZE);
 
-		if (ctx->bio)
-			submit_bio(ctx->bio);
+		iomap_submit_read_io(iter, ctx);
 
 		if (ctx->rac) /* same as readahead_gfp_mask */
 			gfp |= __GFP_NORETRY | __GFP_NOWARN;
-		ctx->bio = bio_alloc(iomap->bdev, bio_max_segs(nr_vecs),
-				     REQ_OP_READ, gfp);
+
+		if (ctx->ops && ctx->ops->bio_set)
+			ctx->bio = bio_alloc_bioset(iomap->bdev,
+						    bio_max_segs(nr_vecs),
+						    REQ_OP_READ, GFP_NOFS,
+						    ctx->ops->bio_set);
+		else
+			ctx->bio = bio_alloc(iomap->bdev, bio_max_segs(nr_vecs),
+				REQ_OP_READ, gfp);
+
 		/*
 		 * If the bio_alloc fails, try it again for a single page to
 		 * avoid having to deal with partial page reads.  This emulates
@@ -427,7 +454,7 @@ int iomap_read_folio(struct folio *folio, const struct iomap_ops *ops,
 		folio_set_error(folio);
 
 	if (ctx.bio) {
-		submit_bio(ctx.bio);
+		iomap_submit_read_io(&iter, &ctx);
 		WARN_ON_ONCE(!ctx.cur_folio_in_bio);
 	} else {
 		WARN_ON_ONCE(ctx.cur_folio_in_bio);
@@ -502,8 +529,7 @@ void iomap_readahead(struct readahead_control *rac, const struct iomap_ops *ops,
 	while (iomap_iter(&iter, ops) > 0)
 		iter.processed = iomap_readahead_iter(&iter, &ctx);
 
-	if (ctx.bio)
-		submit_bio(ctx.bio);
+	iomap_submit_read_io(&iter, &ctx);
 	if (ctx.cur_folio) {
 		if (!ctx.cur_folio_in_bio)
 			folio_unlock(ctx.cur_folio);
diff --git a/include/linux/iomap.h b/include/linux/iomap.h
index 3565c449f3c9..8d7206cd2f0f 100644
--- a/include/linux/iomap.h
+++ b/include/linux/iomap.h
@@ -53,6 +53,9 @@ struct vm_fault;
  *
  * IOMAP_F_XATTR indicates that the iomap is for an extended attribute extent
  * rather than a file data extent.
+ *
+ * IOMAP_F_READ_VERITY indicates that the iomap needs verification of read
+ * folios
  */
 #define IOMAP_F_NEW		(1U << 0)
 #define IOMAP_F_DIRTY		(1U << 1)
@@ -64,6 +67,7 @@ struct vm_fault;
 #define IOMAP_F_BUFFER_HEAD	0
 #endif /* CONFIG_BUFFER_HEAD */
 #define IOMAP_F_XATTR		(1U << 5)
+#define IOMAP_F_READ_VERITY	(1U << 6)
 
 /*
  * Flags set by the core iomap code during operations:
@@ -262,7 +266,18 @@ int iomap_file_buffered_write_punch_delalloc(struct inode *inode,
 		struct iomap *iomap, loff_t pos, loff_t length, ssize_t written,
 		int (*punch)(struct inode *inode, loff_t pos, loff_t length));
 
+struct iomap_read_ioend {
+	struct inode		*io_inode;	/* file being read from */
+	struct work_struct	work;		/* post read work (e.g. fs-verity) */
+	struct bio		read_inline_bio;/* MUST BE LAST! */
+};
+
 struct iomap_readpage_ops {
+	/*
+	 * Optional, verify folio when successfully read
+	 */
+	int (*verify_folio)(struct folio *folio, loff_t pos, unsigned int len);
+
 	/*
 	 * Filesystems wishing to attach private information to a direct io bio
 	 * must provide a ->submit_io method that attaches the additional
-- 
2.40.1

