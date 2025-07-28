Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E74C2798E5
	for <fsverity@lists.linux.dev>; Mon, 28 Jul 2025 20:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753734695; cv=none; b=OgjbRLEEk9Hf+5sz5pdM8Oo0bSU4AVVsXhj99LFg4JPSrb2V5kgXke11lKkGIoOmM1CmzaTh8dzGnrNR9L+yFW57AuJkILc//Fm1npJvG1kh5TrkAk8shfJif6duBnVklXPIfWelOBBidAG8FoGP53GQkajT6Ji1TMIOHsRZLuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753734695; c=relaxed/simple;
	bh=Cc8jfD9UXHnTL28T91p6u/Kf5oNqaZTP/JPhzrOnvHE=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Content-Type; b=rEqxCR9pnKvEX+jmh260+DTnQj0GNcKvMgOibEgqh1f4XbhLpKMs76tAM4hHW9OGmuL1ep56+7538glNqPKiy9VVeO/z8nKPDneKezCEV7Gdju9FzmdGIqxgddTMWWfI6Wj//gOKQcve68/jdPRhto+ujDBhwGbJTmVPjLEuWmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GWN2xvXP; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GWN2xvXP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753734691;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gsNqASzsrM4FhxhYhZwqXoEsfSVZFoKy3EvjkkcLH3A=;
	b=GWN2xvXPRaBVb5A5QUoifb2d98Uu/iSID2D/lIgDCk9NOQOuuUHxVnY3/uSavjaLu/JiAH
	XAgt8kmGxkuFNwa3eemS8SCwb8pfHGqHhvqfliLU9oeXRH6FMJeXwBPwcBezxtouMXK1A4
	IOcrM4VSrC+S2TLT8lvIRQH4wk8EV64=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-338-Nt_do2fwPESyH27gzD9pWA-1; Mon, 28 Jul 2025 16:31:30 -0400
X-MC-Unique: Nt_do2fwPESyH27gzD9pWA-1
X-Mimecast-MFC-AGG-ID: Nt_do2fwPESyH27gzD9pWA_1753734689
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-615145b0a00so1382599a12.1
        for <fsverity@lists.linux.dev>; Mon, 28 Jul 2025 13:31:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753734689; x=1754339489;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gsNqASzsrM4FhxhYhZwqXoEsfSVZFoKy3EvjkkcLH3A=;
        b=S6+N4qV7ZkQJOUDcVaEtUKbkoRfrH3GK5nXjss0GiJftDY2v836uV33PKtxdatqmkD
         ebk6qsKBsF/l386NnxYiiFQa9aEbHQOK0fLwXBYifwzM6j4hVmFjMVe6mUSwIwZbEPXG
         bDr65H6vxJDj/vEAyApbefvGY4xT39ynw862Ujrg543Ya3wGmxM72VwfiTxVaaivlhl5
         sneuCkEPxCFiXddD92fvOFRtT1odSIwyeLMKZjVAf7gmRj3yMVRqasA1DX1NkffUeSdK
         +yEfqUVY2izSZCV93JuzOhF1u3np40J4NIs5MgYc5Pz6d/fsuGIFAlBn8rBMOeuebtBu
         U9kQ==
X-Gm-Message-State: AOJu0YxPVlbT5ahJySidMQNv23/Sz5ebUpJZZsz3oUqLHUoQodpFWKeQ
	ACrwYLAlNpmwiUL5Mo5OVFyYb9bz5CSkwMMOhcWaqABhUe+VZxgfXSKrloSCGT/1DPp9EuAY7Jd
	DiBAlm2a3zbEUjiqKzlkUgzfvLMGS8wHCryfnRu48cj82Xf0s3kDhub7A/DI=
X-Gm-Gg: ASbGnctSuly2ch3Pv5Dk/+JcFHOS8e+oyT+BVDmOTujzLwDu6Ivl6XR7TvfVx3D9KSY
	vpdxGjbS+hpOi4Xhojtko9zr4S9CPbq8YrUHZQG41R8BY90RkDIMVjfPTmjU5PcpnSsmhnzl9v3
	4+mgsWPEXkWchRO6RDxBP0hgV3ZiTdBAL/kz7mhlkiL6RU1X7sHqQG1s3399X++y40Ta6TxTA7W
	tNzMYljdh3IOV37Gv3/4KaN5rFDoOR445NrN9+sRRJ5edroIKEZmRxKsz/5qoijA88nVcJdv8by
	lpj3BtfXRH7IYf2MNSUZy6I8A+m5n//TIPWSHSfyORm6Qg==
X-Received: by 2002:a05:6402:518e:b0:615:5799:72eb with SMTP id 4fb4d7f45d1cf-61557997743mr3139595a12.4.1753734688656;
        Mon, 28 Jul 2025 13:31:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHaXCTtgJBVa+Xs6kxiTyulJmF/M7m0cchmWiQmoT0v4y+AxWRRt3r7Xo334Ukqtepms8Dudg==
X-Received: by 2002:a05:6402:518e:b0:615:5799:72eb with SMTP id 4fb4d7f45d1cf-61557997743mr3139564a12.4.1753734688186;
        Mon, 28 Jul 2025 13:31:28 -0700 (PDT)
Received: from [127.0.0.2] (ip-217-030-074-039.aim-net.cz. [217.30.74.39])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615226558d3sm2730656a12.45.2025.07.28.13.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 13:31:27 -0700 (PDT)
From: Andrey Albershteyn <aalbersh@redhat.com>
X-Google-Original-From: Andrey Albershteyn <aalbersh@kernel.org>
Date: Mon, 28 Jul 2025 22:30:11 +0200
Subject: [PATCH RFC 07/29] fsverity: pass super_block to
 fsverity_enqueue_verify_work
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <20250728-fsverity-v1-7-9e5443af0e34@kernel.org>
References: <20250728-fsverity-v1-0-9e5443af0e34@kernel.org>
In-Reply-To: <20250728-fsverity-v1-0-9e5443af0e34@kernel.org>
To: fsverity@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
 linux-xfs@vger.kernel.org, david@fromorbit.com, djwong@kernel.org, 
 ebiggers@kernel.org, hch@lst.de
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=5317; i=aalbersh@kernel.org;
 h=from:subject:message-id; bh=1QRoKp7YVPVu+fLZj5koefoGqFZX89pyv0L/h2jQYGc=;
 b=owJ4nJvAy8zAJea2/JXEGuOHHIyn1ZIYMtrvibdN+/JCpGnfUXNz+X1rPJ8H8bJIuRzTSzsWP
 f2J/47tduEdpSwMYlwMsmKKLOuktaYmFUnlHzGokYeZw8oEMoSBi1MAJhJ7g5GheVdk1ctL5zRD
 7OY0yn0vubOxPpXP2kb/WMdxBt/156PsGBmmGH9eyBBcxbozT8i95Lv6ird39X8e/VNu73FCd9J
 6NmNuAP6WRjs=
X-Developer-Key: i=aalbersh@kernel.org; a=openpgp;
 fpr=AE1B2A9562721A6FC4307C1F46A7EA18AC33E108
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: XPY4mOdSva23g3rm2POJsTM6FijQzKcHsxqKBobpsKk_1753734689
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

From: "Darrick J. Wong" <djwong@kernel.org>

In preparation for having per-superblock fsverity workqueues, pass the
super_block object to fsverity_enqueue_verify_work.

Signed-off-by: Darrick J. Wong <djwong@kernel.org>
---
 fs/buffer.c              | 7 +++++--
 fs/ext4/readpage.c       | 4 +++-
 fs/f2fs/compress.c       | 3 ++-
 fs/f2fs/data.c           | 2 +-
 fs/verity/verify.c       | 6 ++++--
 include/linux/fsverity.h | 6 ++++--
 6 files changed, 19 insertions(+), 9 deletions(-)

diff --git a/fs/buffer.c b/fs/buffer.c
index 8cf4a1dc481e..9d56eb353ced 100644
--- a/fs/buffer.c
+++ b/fs/buffer.c
@@ -336,13 +336,15 @@ static void decrypt_bh(struct work_struct *work)
 	err = fscrypt_decrypt_pagecache_blocks(bh->b_folio, bh->b_size,
 					       bh_offset(bh));
 	if (err == 0 && need_fsverity(bh)) {
+		struct super_block *sb = bh->b_folio->mapping->host->i_sb;
+
 		/*
 		 * We use different work queues for decryption and for verity
 		 * because verity may require reading metadata pages that need
 		 * decryption, and we shouldn't recurse to the same workqueue.
 		 */
 		INIT_WORK(&ctx->work, verify_bh);
-		fsverity_enqueue_verify_work(&ctx->work);
+		fsverity_enqueue_verify_work(sb, &ctx->work);
 		return;
 	}
 	end_buffer_async_read(bh, err == 0);
@@ -371,7 +373,8 @@ static void end_buffer_async_read_io(struct buffer_head *bh, int uptodate)
 				fscrypt_enqueue_decrypt_work(&ctx->work);
 			} else {
 				INIT_WORK(&ctx->work, verify_bh);
-				fsverity_enqueue_verify_work(&ctx->work);
+				fsverity_enqueue_verify_work(inode->i_sb,
+							     &ctx->work);
 			}
 			return;
 		}
diff --git a/fs/ext4/readpage.c b/fs/ext4/readpage.c
index f329daf6e5c7..e9ecfc7830d7 100644
--- a/fs/ext4/readpage.c
+++ b/fs/ext4/readpage.c
@@ -61,6 +61,7 @@ enum bio_post_read_step {
 
 struct bio_post_read_ctx {
 	struct bio *bio;
+	struct super_block *sb;
 	struct work_struct work;
 	unsigned int cur_step;
 	unsigned int enabled_steps;
@@ -132,7 +133,7 @@ static void bio_post_read_processing(struct bio_post_read_ctx *ctx)
 	case STEP_VERITY:
 		if (ctx->enabled_steps & (1 << STEP_VERITY)) {
 			INIT_WORK(&ctx->work, verity_work);
-			fsverity_enqueue_verify_work(&ctx->work);
+			fsverity_enqueue_verify_work(ctx->sb, &ctx->work);
 			return;
 		}
 		ctx->cur_step++;
@@ -195,6 +196,7 @@ static void ext4_set_bio_post_read_ctx(struct bio *bio,
 			mempool_alloc(bio_post_read_ctx_pool, GFP_NOFS);
 
 		ctx->bio = bio;
+		ctx->sb = inode->i_sb;
 		ctx->enabled_steps = post_read_steps;
 		bio->bi_private = ctx;
 	}
diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index b3c1df93a163..31b45abb26b7 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -1839,7 +1839,8 @@ void f2fs_decompress_end_io(struct decompress_io_ctx *dic, bool failed,
 		 * file, and these metadata pages may be compressed.
 		 */
 		INIT_WORK(&dic->verity_work, f2fs_verify_cluster);
-		fsverity_enqueue_verify_work(&dic->verity_work);
+		fsverity_enqueue_verify_work(dic->inode->i_sb,
+					     &dic->verity_work);
 		return;
 	}
 
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 31e892842625..e4e4697ad0d3 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -215,7 +215,7 @@ static void f2fs_verify_and_finish_bio(struct bio *bio, bool in_task)
 
 	if (ctx && (ctx->enabled_steps & STEP_VERITY)) {
 		INIT_WORK(&ctx->work, f2fs_verify_bio);
-		fsverity_enqueue_verify_work(&ctx->work);
+		fsverity_enqueue_verify_work(ctx->sbi->sb, &ctx->work);
 	} else {
 		f2fs_finish_read_bio(bio, in_task);
 	}
diff --git a/fs/verity/verify.c b/fs/verity/verify.c
index 917a5fb5388f..ef5d27039c98 100644
--- a/fs/verity/verify.c
+++ b/fs/verity/verify.c
@@ -363,13 +363,15 @@ EXPORT_SYMBOL_GPL(fsverity_init_wq);
 
 /**
  * fsverity_enqueue_verify_work() - enqueue work on the fs-verity workqueue
+ * @sb: superblock for this filesystem
  * @work: the work to enqueue
  *
  * Enqueue verification work for asynchronous processing.
  */
-void fsverity_enqueue_verify_work(struct work_struct *work)
+void fsverity_enqueue_verify_work(struct super_block *sb,
+				  struct work_struct *work)
 {
-	queue_work(fsverity_read_workqueue, work);
+	queue_work(sb->s_verity_wq ?: fsverity_read_workqueue, work);
 }
 EXPORT_SYMBOL_GPL(fsverity_enqueue_verify_work);
 
diff --git a/include/linux/fsverity.h b/include/linux/fsverity.h
index d263e988bec2..8155407a7e4c 100644
--- a/include/linux/fsverity.h
+++ b/include/linux/fsverity.h
@@ -186,7 +186,8 @@ int fsverity_ioctl_read_metadata(struct file *filp, const void __user *uarg);
 
 bool fsverity_verify_blocks(struct folio *folio, size_t len, size_t offset);
 void fsverity_verify_bio(struct bio *bio);
-void fsverity_enqueue_verify_work(struct work_struct *work);
+void fsverity_enqueue_verify_work(struct super_block *sb,
+				  struct work_struct *work);
 
 int fsverity_init_wq(struct super_block *sb, unsigned int wq_flags,
 		       int max_active);
@@ -271,7 +272,8 @@ static inline void fsverity_verify_bio(struct bio *bio)
 	WARN_ON_ONCE(1);
 }
 
-static inline void fsverity_enqueue_verify_work(struct work_struct *work)
+static inline void fsverity_enqueue_verify_work(struct super_block *sb,
+						struct work_struct *work)
 {
 	WARN_ON_ONCE(1);
 }

-- 
2.50.0

