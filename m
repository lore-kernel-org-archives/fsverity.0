Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8B972DEA7A
	for <fsverity@lists.linux.dev>; Mon, 12 Jan 2026 14:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768229434; cv=none; b=NwtFd92TK1lMY6uhSYm7fkRmHBXcgA2yeuPk70YVdtkKwB/hScu9ziMCeYUYM+xDr5O/oOxKt5UGifJHY8CjARs2fgNJWvMdn8aMs0HfOKqFR6VTWUBYKmmFLNnxlxpS+IoY4aZdkJ91+7QX0pd9ULJQOv3fPTS4A7A72esEz98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768229434; c=relaxed/simple;
	bh=3384MX6zXSIApStU5JP/fZm7FYVREy8tDDE1SfwQbZ0=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=J+tLxPSMDWpr3sRFBpe55Kz2rf0n9WoK94Mm/NSr+VdCKW8FHWOuScqNKcTlywkY7y4thtYTnSkBd7FVP+K6vZaOWzJ4FG6g56CUURCtROpanChfkoRNoUEUlJLJ9xhkP1YFTPYYfB9qqIGp3LP+Tv243k7oZxblsaFF2ldagyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cXTXWuSH; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cXTXWuSH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768229432;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LD1s0aFQaY6k/iWg5eXUZs+8qWPLWbjMvZxwOxc5JxY=;
	b=cXTXWuSHZ5rIKR8zjRTBaXwRwNLs4xFKyhnulCbf7MtpvnJ83twuvGQQKn4X3w3T36mS01
	gbGtKIl8Eb66arrRIY20ONgg1oc5UBSNeWT6oEAmA8sx1CfeLW/gBxFvAwSvkZBTU/YrRg
	OdWuwW+D39xoXIVEqtRW6438s84DfaI=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-296-pBjQXxRHPceE2-2IL1YiaA-1; Mon, 12 Jan 2026 09:50:30 -0500
X-MC-Unique: pBjQXxRHPceE2-2IL1YiaA-1
X-Mimecast-MFC-AGG-ID: pBjQXxRHPceE2-2IL1YiaA_1768229428
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-b8715782415so150545466b.0
        for <fsverity@lists.linux.dev>; Mon, 12 Jan 2026 06:50:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768229428; x=1768834228;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LD1s0aFQaY6k/iWg5eXUZs+8qWPLWbjMvZxwOxc5JxY=;
        b=SJ3Twtufg1zelUftfHWhF8eAmbnN34HcsGmwbQtPf0w/Xk4coEANYfW+HWfSsO8Mph
         Fa5qzzNBL8GtDJsz6vXiPWOP03E35ckMv76/cT2xTfjzzEdFe/PaYaTazZ9hXk4BWsmW
         q36Le94C6/+IaEfOCv3mr43WPT3P/jBfXCDGh2D0a+tOM/NZKJaP0nSuxCsoXTJ/U98E
         45eVPfckXX9IifnXvgyj2HQsYvC/fGJK3VeVpQNNi7rxPYDAITI2K4O5xlDsyMErNQGW
         jaG7wdq99lBg1KmndjR2IP64kArJ36PQvSTp5CJsGbpYLTpXqwN9lOWnxcD62XyCNubh
         6cng==
X-Gm-Message-State: AOJu0Yyrhyox5c7FprgrezdF6D543Yqe9z0fQOqOVmwZOioQ6SzKOd9q
	ZP7OLFLr/pJbZd0DL9lfkksXRP9eWxHLLALzDnrH4/pAZMhlZdCMBFHcED9qwDfb5sGWTDTj/iC
	xo4b2AVDlh6nJrXOMI5XONezlT6gjX4LctIe+bJr1Ft9CgvBBIOXHiCPBQo3Zpmdulj5s3ozEvr
	VFWtDLHo12RS7QXbXVeYdXWm6qgjfq/E9wMN+1WVbKEaM=
X-Gm-Gg: AY/fxX5MP4DrMQvPV/5OIzPQ8hS58TYogoFSLmqUlOUrcDyMsqD4EheT429LJ9AnivI
	blKmYLkuAreDiC3ldPu5seAI099z8e1XSIVpU2ruPvxoK12mig237I992+qEaPeqn971BRMVY8I
	FHu9R4S1Rux5Zxvtgu5R99FhwVoKJ6y2rJKiKTF9c86De77pCGJ6a0RWE6o6nw17wtPcQPVYZnj
	z/efuXe3mQ5UNXa7OowNS7nVL85dRB2OHHsicszY9ju2+CG+SGvitBR4PnRs8xFhHewWSQRtKRb
	fV1CdOf9T8HeKBqpoDN2QwxQ7L1C3CGmI8cuwPE3pDXEnmqnttnRuU4A1TAyTlds2cnYHIN6B6k
	=
X-Received: by 2002:a17:906:d54d:b0:b84:200d:15b5 with SMTP id a640c23a62f3a-b8445179fd0mr2009471966b.31.1768229427911;
        Mon, 12 Jan 2026 06:50:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHgf2rNb0nwbU234Uvl4tcrsdm0xI956tFs+HVTMG9EpCfOOEbkI00Z9C9XD5sHcMxrpH/5KA==
X-Received: by 2002:a17:906:d54d:b0:b84:200d:15b5 with SMTP id a640c23a62f3a-b8445179fd0mr2009467166b.31.1768229427158;
        Mon, 12 Jan 2026 06:50:27 -0800 (PST)
Received: from thinky ([217.30.74.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b86f61d2774sm723855366b.41.2026.01.12.06.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 06:50:26 -0800 (PST)
From: Andrey Albershteyn <aalbersh@redhat.com>
X-Google-Original-From: Andrey Albershteyn <aalbersh@kernel.org>
Date: Mon, 12 Jan 2026 15:50:26 +0100
To: fsverity@lists.linux.dev, linux-xfs@vger.kernel.org, 
	ebiggers@kernel.org, linux-fsdevel@vger.kernel.org, aalbersh@kernel.org, 
	aalbersh@redhat.com, djwong@kernel.org
Cc: djwong@kernel.org, david@fromorbit.com, hch@lst.de
Subject: [PATCH v2 5/22] iomap: integrate fs-verity verification into iomap's
 read path
Message-ID: <fm6mhsjqpa4tgpubffqp6rdeinvjkp6ugdmpafzelydx6sxep2@vriwphnloylb>
References: <cover.1768229271.patch-series@thinky>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <cover.1768229271.patch-series@thinky>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: X3Vu0QjcsayFIABDUw0za3iRl_zsAJzssqeaelFSnpY_1768229428
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This patch adds fs-verity verification into iomap's read path. After
BIO's io operation is complete the data are verified against
fs-verity's Merkle tree. Verification work is done in a separate
workqueue.

The read path ioend iomap_read_ioend are stored side by side with
BIOs if FS_VERITY is enabled.

Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org>
---
 fs/iomap/bio.c         | 66 ++++++++++++++++++++++++++++++++++++++++++++++++----
 fs/iomap/buffered-io.c | 12 ++++++++-
 fs/iomap/ioend.c       | 41 +++++++++++++++++++++++++++++++-
 include/linux/iomap.h  | 11 ++++++++
 4 files changed, 123 insertions(+), 7 deletions(-)

diff --git a/fs/iomap/bio.c b/fs/iomap/bio.c
index fc045f2e4c..ac6c16b1f8 100644
--- a/fs/iomap/bio.c
+++ b/fs/iomap/bio.c
@@ -5,6 +5,7 @@
  */
 #include <linux/iomap.h>
 #include <linux/pagemap.h>
+#include <linux/fsverity.h>
 #include "internal.h"
 #include "trace.h"
 
@@ -18,6 +19,60 @@
 	bio_put(bio);
 }
 
+#ifdef CONFIG_FS_VERITY
+static void
+iomap_read_fsverify_end_io_work(struct work_struct *work)
+{
+	struct iomap_fsverity_bio *fbio =
+		container_of(work, struct iomap_fsverity_bio, work);
+
+	fsverity_verify_bio(&fbio->bio);
+	iomap_read_end_io(&fbio->bio);
+}
+
+static void
+iomap_read_fsverity_end_io(struct bio *bio)
+{
+	struct iomap_fsverity_bio *fbio =
+		container_of(bio, struct iomap_fsverity_bio, bio);
+
+	INIT_WORK(&fbio->work, iomap_read_fsverify_end_io_work);
+	fsverity_enqueue_verify_work(&fbio->work);
+}
+
+static struct bio *
+iomap_fsverity_read_bio_alloc(struct inode *inode, struct block_device *bdev,
+			    int nr_vecs, gfp_t gfp)
+{
+	struct bio *bio;
+
+	bio = bio_alloc_bioset(bdev, nr_vecs, REQ_OP_READ, gfp,
+			iomap_fsverity_bioset);
+	if (bio)
+		bio->bi_end_io = iomap_read_fsverity_end_io;
+	return bio;
+}
+
+#else
+# define iomap_fsverity_read_bio_alloc(...)	(NULL)
+# define iomap_fsverity_tree_end_align(...)	(false)
+#endif /* CONFIG_FS_VERITY */
+
+static struct bio *iomap_read_bio_alloc(struct inode *inode,
+		const struct iomap *iomap, int nr_vecs, gfp_t gfp)
+{
+	struct bio *bio;
+	struct block_device *bdev = iomap->bdev;
+
+	if (!(iomap->flags & IOMAP_F_BEYOND_EOF) && fsverity_active(inode))
+		return iomap_fsverity_read_bio_alloc(inode, bdev, nr_vecs, gfp);
+
+	bio = bio_alloc(bdev, nr_vecs, REQ_OP_READ, gfp);
+	if (bio)
+		bio->bi_end_io = iomap_read_end_io;
+	return bio;
+}
+
 static void iomap_bio_submit_read(struct iomap_read_folio_ctx *ctx)
 {
 	struct bio *bio = ctx->read_ctx;
@@ -42,26 +97,27 @@
 	    !bio_add_folio(bio, folio, plen, poff)) {
 		gfp_t gfp = mapping_gfp_constraint(folio->mapping, GFP_KERNEL);
 		gfp_t orig_gfp = gfp;
-		unsigned int nr_vecs = DIV_ROUND_UP(length, PAGE_SIZE);
 
 		if (bio)
 			submit_bio(bio);
 
 		if (ctx->rac) /* same as readahead_gfp_mask */
 			gfp |= __GFP_NORETRY | __GFP_NOWARN;
-		bio = bio_alloc(iomap->bdev, bio_max_segs(nr_vecs), REQ_OP_READ,
-				     gfp);
+		bio = iomap_read_bio_alloc(iter->inode, iomap,
+				bio_max_segs(DIV_ROUND_UP(length, PAGE_SIZE)),
+				gfp);
+
 		/*
 		 * If the bio_alloc fails, try it again for a single page to
 		 * avoid having to deal with partial page reads.  This emulates
 		 * what do_mpage_read_folio does.
 		 */
 		if (!bio)
-			bio = bio_alloc(iomap->bdev, 1, REQ_OP_READ, orig_gfp);
+			bio = iomap_read_bio_alloc(iter->inode, iomap, 1,
+						   orig_gfp);
 		if (ctx->rac)
 			bio->bi_opf |= REQ_RAHEAD;
 		bio->bi_iter.bi_sector = sector;
-		bio->bi_end_io = iomap_read_end_io;
 		bio_add_folio_nofail(bio, folio, plen, poff);
 		ctx->read_ctx = bio;
 	}
diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
index 79d1c97f02..481f7e1cff 100644
--- a/fs/iomap/buffered-io.c
+++ b/fs/iomap/buffered-io.c
@@ -8,6 +8,7 @@
 #include <linux/writeback.h>
 #include <linux/swap.h>
 #include <linux/migrate.h>
+#include <linux/fsverity.h>
 #include "internal.h"
 #include "trace.h"
 
@@ -532,10 +533,19 @@
 		if (plen == 0)
 			return 0;
 
+		/* end of fs-verity region*/
+		if ((iomap->flags & IOMAP_F_BEYOND_EOF) && (iomap->type == IOMAP_HOLE)) {
+			folio_zero_range(folio, poff, plen);
+			iomap_set_range_uptodate(folio, poff, plen);
+		}
 		/* zero post-eof blocks as the page may be mapped */
-		if (iomap_block_needs_zeroing(iter, pos) &&
+		else if (iomap_block_needs_zeroing(iter, pos) &&
 		    !(iomap->flags & IOMAP_F_BEYOND_EOF)) {
 			folio_zero_range(folio, poff, plen);
+			if (fsverity_active(iter->inode) &&
+			    !fsverity_verify_blocks(folio, plen, poff)) {
+				return -EIO;
+			}
 			iomap_set_range_uptodate(folio, poff, plen);
 		} else {
 			if (!*bytes_submitted)
diff --git a/fs/iomap/ioend.c b/fs/iomap/ioend.c
index 86f44922ed..30c0de3c75 100644
--- a/fs/iomap/ioend.c
+++ b/fs/iomap/ioend.c
@@ -9,6 +9,8 @@
 #include "internal.h"
 #include "trace.h"
 
+#define IOMAP_POOL_SIZE		(4 * (PAGE_SIZE / SECTOR_SIZE))
+
 struct bio_set iomap_ioend_bioset;
 EXPORT_SYMBOL_GPL(iomap_ioend_bioset);
 
@@ -423,9 +425,46 @@
 }
 EXPORT_SYMBOL_GPL(iomap_split_ioend);
 
+#ifdef CONFIG_FS_VERITY
+struct bio_set *iomap_fsverity_bioset;
+EXPORT_SYMBOL_GPL(iomap_fsverity_bioset);
+int iomap_fsverity_init_bioset(void)
+{
+	struct bio_set *bs, *old;
+	int error;
+
+	bs = kzalloc(sizeof(*bs), GFP_KERNEL);
+	if (!bs)
+		return -ENOMEM;
+
+	error = bioset_init(bs, IOMAP_POOL_SIZE,
+			    offsetof(struct iomap_fsverity_bio, bio),
+			    BIOSET_NEED_BVECS);
+	if (error) {
+		kfree(bs);
+		return error;
+	}
+
+	/*
+	 * This has to be atomic as readaheads can race to create the
+	 * bioset.  If someone set the pointer before us, we drop ours.
+	 */
+	old = cmpxchg(&iomap_fsverity_bioset, NULL, bs);
+	if (old) {
+		bioset_exit(bs);
+		kfree(bs);
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(iomap_fsverity_init_bioset);
+#else
+# define iomap_fsverity_init_bioset(...)	(-EOPNOTSUPP)
+#endif
+
 static int __init iomap_ioend_init(void)
 {
-	return bioset_init(&iomap_ioend_bioset, 4 * (PAGE_SIZE / SECTOR_SIZE),
+	return bioset_init(&iomap_ioend_bioset, IOMAP_POOL_SIZE,
 			   offsetof(struct iomap_ioend, io_bio),
 			   BIOSET_NEED_BVECS);
 }
diff --git a/include/linux/iomap.h b/include/linux/iomap.h
index 7a7e31c499..b451ab3426 100644
--- a/include/linux/iomap.h
+++ b/include/linux/iomap.h
@@ -342,6 +342,17 @@
 		iter->srcmap.type == IOMAP_MAPPED;
 }
 
+#ifdef CONFIG_FS_VERITY
+extern struct bio_set *iomap_fsverity_bioset;
+
+struct iomap_fsverity_bio {
+	struct work_struct	work;
+	struct bio		bio;
+};
+
+int iomap_fsverity_init_bioset(void);
+#endif
+
 ssize_t iomap_file_buffered_write(struct kiocb *iocb, struct iov_iter *from,
 		const struct iomap_ops *ops,
 		const struct iomap_write_ops *write_ops, void *private);

-- 
- Andrey

