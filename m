Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76ADE3D56B
	for <fsverity@lists.linux.dev>; Mon, 12 Feb 2024 17:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707757206; cv=none; b=MluZp0m1bTEHAh5xhRiwA0NdrvO8H35AXYXRZoYd1TMFs/SDtolkzb79D+mEadDd7tHS/A4100wxfNHV4MjOAOaZz+Eh3c3RAxF4ny0iSVLUNE7FzQchFADwR054F4AJWg/jcOrMKCvQIbwVXMhGTQoEhUDF00/XR9J3SbaexhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707757206; c=relaxed/simple;
	bh=wpwwkUMQQ1oCVKokCsM4qLWIq0nv9cKIzEH2+0qCgCE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q37hwoFeSK9GOjrmjoVfrRG6oRlde3LP9Ii6aW8ytZ8VXjwB/N9oAJ8kMxer67VeGMEVNwbzWBw+joSpTK26SC25bJnTfwbJk7IL8tTOApaqV+WjNVnVtbh+DgwdeJh4gDSSWKdkeGX1RyRIrk/ZlB42RlHYnXNrsCrF2IyBifU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=A2KcEnUD; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="A2KcEnUD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707757203;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OS1TTVXUwoueTLFTvYK+vY3u9o7lEMipfR1U95f36dE=;
	b=A2KcEnUDp/O4Dhf9j1MmI836GH18TMEqEEk8xnXt7qmxVSArwrZtB1u4VJPsXPgLCHBcaj
	idieYgZQTaUxcGyp9IxPbEKm7lwZFmBmkULvngV+8+mi9UNWb5I90HQZCoVxy6ox+oUrSK
	OKgfoyvd8FmtvW0JfjzFWDUo2PHa810=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-130-I0NlhmgqOWGf4-Gic13YTg-1; Mon, 12 Feb 2024 12:00:01 -0500
X-MC-Unique: I0NlhmgqOWGf4-Gic13YTg-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-560f41972easo1934658a12.0
        for <fsverity@lists.linux.dev>; Mon, 12 Feb 2024 09:00:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707757200; x=1708362000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OS1TTVXUwoueTLFTvYK+vY3u9o7lEMipfR1U95f36dE=;
        b=heuMZ4ClECtRBthWaJwG1ygAyjnwHFCPTsvySsQrkrV5MeEMMjURfmBy5KHCdeKkMP
         lmQbkecT7nKl1z2piX/7X3d31jArl1QWI49gPIGEE7/EPNDtRLTuUxdfZOmxLHgqiDOo
         1/W7drF9HNV2OTn0HSo1oxr0rW7nTeS2VCIyjEfO+YfXCYw/ci81dCNIiF3dOzP3fte+
         7pBX6ca+1NLKCTjbyiAm3bvGqXDCW+JhUyIvapCZKNrk42fHUBdsYOS5ZrwRa54DbZ6i
         dOlahHGvvWpxi/9J4ggJxH5hK1/gSdSYaWHkGtnbYWkRaEDRQe+e+D8g1fTeAJLgcouN
         YFMQ==
X-Gm-Message-State: AOJu0YzNsrh93z2T0j9wk117hWNKZHltTaLOfmCwuJgOPfr+MM9se0I2
	Bhqk4dkvQf+t7pRWLiNRz3CEukSTIF/2wwZ4v7DzlaL483oNTcaW3JHPKNBAYzOfX8Vu2L2qyuR
	6jU2BoVnNQzEMKpUVu3dIHiJNPHb9gJNomcqZrBBEb0MP6iPPftB/wf5Cng7wExeaykpC3ohE6A
	WoWkL4EHgcV/KLvjRuOJad2B8yBDVW7nK5Wl+NfoI=
X-Received: by 2002:a05:6402:340a:b0:560:d8f:7def with SMTP id k10-20020a056402340a00b005600d8f7defmr4952874edc.17.1707757200201;
        Mon, 12 Feb 2024 09:00:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFXs4sVH479tj2ZtRasutF5KZELjjn6nPEsO6+MLMpUqOCGNpWr46bM8IgDBprWb0bvFS6oAQ==
X-Received: by 2002:a05:6402:340a:b0:560:d8f:7def with SMTP id k10-20020a056402340a00b005600d8f7defmr4952856edc.17.1707757199839;
        Mon, 12 Feb 2024 08:59:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX54n73+DMnZitQfTasX1dPQoZeopMMHvZHa+36is0tgm/fSeiwsLtpwj1J6UOZOo536zkHYgsslO4Qku0W9vVQXMzosV85pKyfKmah9GXD9tBY6bat7QItE1BveRvKIv4c60LeD6raZ+h07EBVXT6zMdwYkwSej4BYGiJCFa06ANz5vPJUol+eqA3YRdCbVaCX9LEhOgI9hV0DJTZr/hynSgC8tHQmKx3o
Received: from thinky.redhat.com ([109.183.6.197])
        by smtp.gmail.com with ESMTPSA id 14-20020a0564021f4e00b0056176e95a88sm2620261edz.32.2024.02.12.08.59.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 08:59:58 -0800 (PST)
From: Andrey Albershteyn <aalbersh@redhat.com>
To: fsverity@lists.linux.dev,
	linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	chandan.babu@oracle.com,
	djwong@kernel.org,
	ebiggers@kernel.org
Cc: Andrey Albershteyn <aalbersh@redhat.com>
Subject: [PATCH v4 09/25] fsverity: add tracepoints
Date: Mon, 12 Feb 2024 17:58:06 +0100
Message-Id: <20240212165821.1901300-10-aalbersh@redhat.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240212165821.1901300-1-aalbersh@redhat.com>
References: <20240212165821.1901300-1-aalbersh@redhat.com>
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

fs-verity previously had debug printk but it was removed. This patch
adds trace points to the same places where printk were used (with a
few additional ones).

Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
---
 fs/verity/enable.c              |   3 +
 fs/verity/fsverity_private.h    |   2 +
 fs/verity/init.c                |   1 +
 fs/verity/signature.c           |   2 +
 fs/verity/verify.c              |  10 ++
 include/trace/events/fsverity.h | 184 ++++++++++++++++++++++++++++++++
 6 files changed, 202 insertions(+)
 create mode 100644 include/trace/events/fsverity.h

diff --git a/fs/verity/enable.c b/fs/verity/enable.c
index 04e060880b79..945eba0092ab 100644
--- a/fs/verity/enable.c
+++ b/fs/verity/enable.c
@@ -227,6 +227,8 @@ static int enable_verity(struct file *filp,
 	if (err)
 		goto out;
 
+	trace_fsverity_enable(inode, desc, &params);
+
 	/*
 	 * Start enabling verity on this file, serialized by the inode lock.
 	 * Fail if verity is already enabled or is already being enabled.
@@ -255,6 +257,7 @@ static int enable_verity(struct file *filp,
 		fsverity_err(inode, "Error %d building Merkle tree", err);
 		goto rollback;
 	}
+	trace_fsverity_tree_done(inode, desc, &params);
 
 	/*
 	 * Create the fsverity_info.  Don't bother trying to save work by
diff --git a/fs/verity/fsverity_private.h b/fs/verity/fsverity_private.h
index 2bf1f94d437c..4ac9786235b5 100644
--- a/fs/verity/fsverity_private.h
+++ b/fs/verity/fsverity_private.h
@@ -181,4 +181,6 @@ int fsverity_read_merkle_tree_block(struct inode *inode,
 				    unsigned int log_blocksize,
 				    u64 ra_bytes);
 
+#include <trace/events/fsverity.h>
+
 #endif /* _FSVERITY_PRIVATE_H */
diff --git a/fs/verity/init.c b/fs/verity/init.c
index cb2c9aac61ed..3769d2dc9e3b 100644
--- a/fs/verity/init.c
+++ b/fs/verity/init.c
@@ -5,6 +5,7 @@
  * Copyright 2019 Google LLC
  */
 
+#define CREATE_TRACE_POINTS
 #include "fsverity_private.h"
 
 #include <linux/ratelimit.h>
diff --git a/fs/verity/signature.c b/fs/verity/signature.c
index 90c07573dd77..c1f08bb32ed1 100644
--- a/fs/verity/signature.c
+++ b/fs/verity/signature.c
@@ -53,6 +53,8 @@ int fsverity_verify_signature(const struct fsverity_info *vi,
 	struct fsverity_formatted_digest *d;
 	int err;
 
+	trace_fsverity_verify_signature(inode, signature, sig_size);
+
 	if (sig_size == 0) {
 		if (fsverity_require_signatures) {
 			fsverity_err(inode,
diff --git a/fs/verity/verify.c b/fs/verity/verify.c
index 6f4ff420c075..4375b0cd176e 100644
--- a/fs/verity/verify.c
+++ b/fs/verity/verify.c
@@ -57,6 +57,7 @@ verify_data_block(struct inode *inode, struct fsverity_info *vi,
 		/* Byte offset of the wanted hash relative to @addr */
 		unsigned int hoffset;
 	} hblocks[FS_VERITY_MAX_LEVELS];
+	trace_fsverity_verify_block(inode, data_pos);
 	/*
 	 * The index of the previous level's block within that level; also the
 	 * index of that block's hash within the current level.
@@ -129,6 +130,9 @@ verify_data_block(struct inode *inode, struct fsverity_info *vi,
 		if (is_hash_block_verified(vi, block, hblock_idx)) {
 			memcpy(_want_hash, block->kaddr + hoffset, hsize);
 			want_hash = _want_hash;
+			trace_fsverity_merkle_tree_block_verified(inode,
+					hblock_idx,
+					FSVERITY_TRACE_DIR_ASCEND);
 			fsverity_drop_block(inode, block);
 			goto descend;
 		}
@@ -160,6 +164,8 @@ verify_data_block(struct inode *inode, struct fsverity_info *vi,
 		block->verified = true;
 		memcpy(_want_hash, haddr + hoffset, hsize);
 		want_hash = _want_hash;
+		trace_fsverity_merkle_tree_block_verified(inode, hblock_idx,
+				FSVERITY_TRACE_DIR_DESCEND);
 		fsverity_drop_block(inode, block);
 	}
 
@@ -334,6 +340,8 @@ void fsverity_invalidate_range(struct inode *inode, loff_t offset,
 		return;
 	}
 
+	trace_fsverity_invalidate_blocks(inode, index, blocks);
+
 	for (i = 0; i < blocks; i++)
 		clear_bit(index + i, vi->hash_block_verified);
 }
@@ -440,6 +448,8 @@ int fsverity_read_merkle_tree_block(struct inode *inode,
 	int err = 0;
 	unsigned long index = pos >> PAGE_SHIFT;
 
+	trace_fsverity_read_merkle_tree_block(inode, pos, log_blocksize);
+
 	if (inode->i_sb->s_vop->read_merkle_tree_block)
 		return inode->i_sb->s_vop->read_merkle_tree_block(
 			inode, pos, block, log_blocksize, ra_bytes);
diff --git a/include/trace/events/fsverity.h b/include/trace/events/fsverity.h
new file mode 100644
index 000000000000..3cc429d21443
--- /dev/null
+++ b/include/trace/events/fsverity.h
@@ -0,0 +1,184 @@
+// SPDX-License-Identifier: GPL-2.0
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM fsverity
+
+#if !defined(_TRACE_FSVERITY_H) || defined(TRACE_HEADER_MULTI_READ)
+#define _TRACE_FSVERITY_H
+
+#include <linux/tracepoint.h>
+
+struct fsverity_descriptor;
+struct merkle_tree_params;
+struct fsverity_info;
+
+#define FSVERITY_TRACE_DIR_ASCEND	(1ul << 0)
+#define FSVERITY_TRACE_DIR_DESCEND	(1ul << 1)
+#define FSVERITY_HASH_SHOWN_LEN		20
+
+TRACE_EVENT(fsverity_enable,
+	TP_PROTO(struct inode *inode, struct fsverity_descriptor *desc,
+		struct merkle_tree_params *params),
+	TP_ARGS(inode, desc, params),
+	TP_STRUCT__entry(
+		__field(ino_t, ino)
+		__field(u64, data_size)
+		__field(unsigned int, block_size)
+		__field(unsigned int, num_levels)
+		__field(u64, tree_size)
+	),
+	TP_fast_assign(
+		__entry->ino = inode->i_ino;
+		__entry->data_size = desc->data_size;
+		__entry->block_size = params->block_size;
+		__entry->num_levels = params->num_levels;
+		__entry->tree_size = params->tree_size;
+	),
+	TP_printk("ino %lu data size %llu tree size %llu block size %u levels %u",
+		(unsigned long) __entry->ino,
+		__entry->data_size,
+		__entry->tree_size,
+		__entry->block_size,
+		__entry->num_levels)
+);
+
+TRACE_EVENT(fsverity_tree_done,
+	TP_PROTO(struct inode *inode, struct fsverity_descriptor *desc,
+		struct merkle_tree_params *params),
+	TP_ARGS(inode, desc, params),
+	TP_STRUCT__entry(
+		__field(ino_t, ino)
+		__field(unsigned int, levels)
+		__field(unsigned int, tree_blocks)
+		__field(u64, tree_size)
+		__array(u8, tree_hash, 64)
+	),
+	TP_fast_assign(
+		__entry->ino = inode->i_ino;
+		__entry->levels = params->num_levels;
+		__entry->tree_blocks =
+			params->tree_size >> params->log_blocksize;
+		__entry->tree_size = params->tree_size;
+		memcpy(__entry->tree_hash, desc->root_hash, 64);
+	),
+	TP_printk("ino %lu levels %d tree_blocks %d tree_size %lld root_hash %s",
+		(unsigned long) __entry->ino,
+		__entry->levels,
+		__entry->tree_blocks,
+		__entry->tree_size,
+		__print_hex(__entry->tree_hash, 64))
+);
+
+TRACE_EVENT(fsverity_verify_block,
+	TP_PROTO(struct inode *inode, u64 offset),
+	TP_ARGS(inode, offset),
+	TP_STRUCT__entry(
+		__field(ino_t, ino)
+		__field(u64, offset)
+		__field(unsigned int, block_size)
+	),
+	TP_fast_assign(
+		__entry->ino = inode->i_ino;
+		__entry->offset = offset;
+		__entry->block_size =
+			inode->i_verity_info->tree_params.block_size;
+	),
+	TP_printk("ino %lu data offset %lld data block size %u",
+		(unsigned long) __entry->ino,
+		__entry->offset,
+		__entry->block_size)
+);
+
+TRACE_EVENT(fsverity_merkle_tree_block_verified,
+	TP_PROTO(struct inode *inode, u64 index, u8 direction),
+	TP_ARGS(inode, index, direction),
+	TP_STRUCT__entry(
+		__field(ino_t, ino)
+		__field(u64, index)
+		__field(u8, direction)
+	),
+	TP_fast_assign(
+		__entry->ino = inode->i_ino;
+		__entry->index = index;
+		__entry->direction = direction;
+	),
+	TP_printk("ino %lu block index %llu %s",
+		(unsigned long) __entry->ino,
+		__entry->index,
+		__entry->direction == 0 ? "ascend" : "descend")
+);
+
+TRACE_EVENT(fsverity_invalidate_blocks,
+	TP_PROTO(struct inode *inode, u64 index, size_t blocks),
+	TP_ARGS(inode, index, blocks),
+	TP_STRUCT__entry(
+		__field(ino_t, ino)
+		__field(unsigned int, block_size)
+		__field(u64, offset)
+		__field(u64, index)
+		__field(size_t, blocks)
+	),
+	TP_fast_assign(
+		__entry->ino = inode->i_ino;
+		__entry->block_size = inode->i_verity_info->tree_params.log_blocksize;
+		__entry->offset = index << __entry->block_size;
+		__entry->index = index;
+		__entry->blocks = blocks;
+	),
+	TP_printk("ino %lu tree offset %llu block index %llu num blocks %zx",
+		(unsigned long) __entry->ino,
+		__entry->offset,
+		__entry->index,
+		__entry->blocks)
+);
+
+TRACE_EVENT(fsverity_read_merkle_tree_block,
+	TP_PROTO(struct inode *inode, u64 offset, unsigned int log_blocksize),
+	TP_ARGS(inode, offset, log_blocksize),
+	TP_STRUCT__entry(
+		__field(ino_t, ino)
+		__field(u64, offset)
+		__field(u64, index)
+		__field(unsigned int, block_size)
+	),
+	TP_fast_assign(
+		__entry->ino = inode->i_ino;
+		__entry->offset = offset;
+		__entry->index = offset >> log_blocksize;
+		__entry->block_size = 1 << log_blocksize;
+	),
+	TP_printk("ino %lu tree offset %llu block index %llu block hize %u",
+		(unsigned long) __entry->ino,
+		__entry->offset,
+		__entry->index,
+		__entry->block_size)
+);
+
+TRACE_EVENT(fsverity_verify_signature,
+	TP_PROTO(const struct inode *inode, const u8 *signature, size_t sig_size),
+	TP_ARGS(inode, signature, sig_size),
+	TP_STRUCT__entry(
+		__field(ino_t, ino)
+		__dynamic_array(u8, signature, sig_size)
+		__field(size_t, sig_size)
+		__field(size_t, sig_size_show)
+	),
+	TP_fast_assign(
+		__entry->ino = inode->i_ino;
+		memcpy(__get_dynamic_array(signature), signature, sig_size);
+		__entry->sig_size = sig_size;
+		__entry->sig_size_show = (sig_size > FSVERITY_HASH_SHOWN_LEN ?
+			FSVERITY_HASH_SHOWN_LEN : sig_size);
+	),
+	TP_printk("ino %lu sig_size %lu %s%s%s",
+		(unsigned long) __entry->ino,
+		__entry->sig_size,
+		(__entry->sig_size ? "sig " : ""),
+		__print_hex(__get_dynamic_array(signature),
+			__entry->sig_size_show),
+		(__entry->sig_size ? "..." : ""))
+);
+
+#endif /* _TRACE_FSVERITY_H */
+
+/* This part must be outside protection */
+#include <trace/define_trace.h>
-- 
2.42.0

