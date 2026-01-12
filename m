Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A043317A316
	for <fsverity@lists.linux.dev>; Mon, 12 Jan 2026 12:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768220139; cv=none; b=dyXasvcaehKgWPZp9rLI6rshd3Hp5CoMQzr2bRpfjlinARK4MBuhJyI5a+mGq2X8qC5gmFXVZCVMV+RADS8FMDGqkrhzTRnSLL0Y9hyNdK+9LLXRotmuBRTeABmf3Nz9xOWl1otdGPVCaOASjzSbjKH+SuCECfyYuzrcL9bWZqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768220139; c=relaxed/simple;
	bh=JT7xRoBLtj5HTSgSJslaJHrCun1fvX+y8nYCCJjnrco=;
	h=From:Date:To:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=kojaozFzqvwQCs7f2/ftQou8UpO7MjmBxdCQ76tmEUKOJfRG8jzP0M1Rt0KJ7eCkFZpze2qWqeop/yQ+Ejvo6lBHSxeh8bkYof7ztVKSYdMUvDmtOaIPcEWOidzxMT1YNkSCimj8Qiqhcpf9WXXqbAp6oHV3TQfIH2+EonEIz2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=a8W1t3ty; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="a8W1t3ty"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768220136;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MGzjn7F3M1XyxebamMNDGoUPZtVv0ac71yzsaVc26F4=;
	b=a8W1t3tyJu/9pvSaWXvtHGoN678SWK2dDPPZ+d/9R1aXqKIJS1xvNqlSRtMbeT09hyUtP+
	+qfCnDC9Pj/fJNuFqC2nV/bxds/d4OTWJAcAS8Ki+tzGQZknOnTemym72fhfyNi2Fyq6Mm
	5xh5ueqKliD5EEjSd7p1B+S9KjjxKrQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-621-G0GBApbWO2aYBzo6EFM_zw-1; Mon, 12 Jan 2026 07:15:35 -0500
X-MC-Unique: G0GBApbWO2aYBzo6EFM_zw-1
X-Mimecast-MFC-AGG-ID: G0GBApbWO2aYBzo6EFM_zw_1768220134
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-47d3ffa98fcso41928855e9.3
        for <fsverity@lists.linux.dev>; Mon, 12 Jan 2026 04:15:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768220134; x=1768824934;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MGzjn7F3M1XyxebamMNDGoUPZtVv0ac71yzsaVc26F4=;
        b=Jw1mjie3ZrW55zmyjQkjfHUGVc8nM+sD7argSYGwAIIihst8vyjzVJYxBwtGIhfvQj
         L0hS8L004Hz8iIvgrfsd2pgbCYvMHeDS1iZxnB9w3tkCPM0Q0STjRM2nUGKc+s3dI5TB
         UCY4P0Xhh196ecOhbIaCHeVqpyj/wRRHNUK5Jk0af/jjnhocdld9Fczj2YpLhIKveZzd
         Np8n8A7UIUmHxhqSSmxjvV0h4WMEjDQN9juKDq1I7vw8M9Xft1X63wKuXM74FLp9B4h7
         52wp+dn7eggsxPndGFqu6/u8nPI4iTxwh5IxSe+xalSDLTXdrfcmtrtjvvr+ZXtCHCtq
         u3fw==
X-Gm-Message-State: AOJu0YyVIKELZuk2YCRKwAWPoWbYENhgVZ9rjf7CIEkIbGmebhmkVTKj
	n3y7nPuSQ3PiQd49E1fWPpMWCxHXXco9JIfV64LkTb06ENh4n2/ErhNSUzvrJm/FlRf7dfKSITw
	r9RCXDmLmH5L5QpZWyOaRpqKIwgfff8BsZcxnFqnjhldq7bJrGZ4NA2Wm68gYVrJrtZ5F2/UVfC
	idGF8KWLhjcu/t0bQdqRSeEkBj1o1OmFgH7GGbGwYaYso=
X-Gm-Gg: AY/fxX4gs0ADV3ps37AzbnHGLGY92X4OFZxUOCKAYHWXd659izED1qOLp9JJrZdBd+Q
	X++BrWUcUt6xKXEkNvGvn7TbnVAaI7HuviRyy69TaLIUkOuNZworic2/G9rzvAdJE5nWGt0W96C
	i4IfvUef7dxnmNP1kmbZ+FssBG+jnNfyA8bDh83MSs68ip8qfo/bJ6ftdIkNaJwhX7trLg01i6T
	GBmycOP8yrVk5UaDHAvMp6kd1qVtA/8KDE39YKk9aOcBAMwiyg8mP6hJSqI9/y6hvNns+LFSnQ3
	k2q2d+46QR00yCwPPRnNdPZX73ga5jC+EomxiD8bIR/rDvS/VHvLp81Lh6IOlk7PqDpFVOQXhWg
	=
X-Received: by 2002:a05:600c:83c9:b0:471:114e:5894 with SMTP id 5b1f17b1804b1-47d84b3bc10mr187072615e9.25.1768220133918;
        Mon, 12 Jan 2026 04:15:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGMBumc6bhDB9rCwvHAddvFQlO90hB2gB790Sx6vDpw3aWQj9IhlfphWjs30LISDfCSeseuag==
X-Received: by 2002:a05:600c:83c9:b0:471:114e:5894 with SMTP id 5b1f17b1804b1-47d84b3bc10mr187072145e9.25.1768220133368;
        Mon, 12 Jan 2026 04:15:33 -0800 (PST)
Received: from thinky ([217.30.74.39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d87166d0csm134690425e9.6.2026.01.12.04.15.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 04:15:33 -0800 (PST)
From: Andrey Albershteyn <aalbersh@redhat.com>
X-Google-Original-From: Andrey Albershteyn <aalbersh@kernel.org>
Date: Mon, 12 Jan 2026 13:15:02 +0100
To: fsverity@lists.linux.dev, ebiggers@kernel.org, aalbersh@kernel.org, 
	djwong@kernel.org
Subject: [PATCH 2/2] fsverity: add tracepoints
Message-ID: <3wrdpbzuximevxhielsz5kjzwkbdxhk6dhgzwug4dbj6c3r4ek@dvngy452w2jt>
References: <cover.1768219885.patch-series@thinky>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <cover.1768219885.patch-series@thinky>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 1naR3bc-gMmMaOC0Rn4O-kJKH8M5nt39wAu9-LBpCzw_1768220134
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

fs-verity previously had debug printk but it was removed. This patch
adds trace points to the same places where printk were used (with a
few additional ones).

Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org>
Reviewed-by: Darrick J. Wong <djwong@kernel.org>
[djwong: fix formatting]
Signed-off-by: Darrick J. Wong <djwong@kernel.org>
---
 MAINTAINERS                     |   1 +
 fs/verity/enable.c              |   4 +
 fs/verity/fsverity_private.h    |   2 +
 fs/verity/init.c                |   1 +
 fs/verity/verify.c              |   9 ++
 include/trace/events/fsverity.h | 143 ++++++++++++++++++++++++++++++++++++++++++
 6 files changed, 160 insertions(+), 0 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 12f49de7fe..17607340df 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10311,6 +10311,7 @@
 F:	Documentation/filesystems/fsverity.rst
 F:	fs/verity/
 F:	include/linux/fsverity.h
+F:	include/trace/events/fsverity.h
 F:	include/uapi/linux/fsverity.h
 
 FT260 FTDI USB-HID TO I2C BRIDGE DRIVER
diff --git a/fs/verity/enable.c b/fs/verity/enable.c
index 95ec42b847..8718d943b4 100644
--- a/fs/verity/enable.c
+++ b/fs/verity/enable.c
@@ -222,6 +222,8 @@
 	if (err)
 		goto out;
 
+	trace_fsverity_enable(inode, &params);
+
 	/*
 	 * Start enabling verity on this file, serialized by the inode lock.
 	 * Fail if verity is already enabled or is already being enabled.
@@ -264,6 +266,8 @@
 		goto rollback;
 	}
 
+	trace_fsverity_tree_done(inode, vi, &params);
+
 	/*
 	 * Tell the filesystem to finish enabling verity on the file.
 	 * Serialized with ->begin_enable_verity() by the inode lock.
diff --git a/fs/verity/fsverity_private.h b/fs/verity/fsverity_private.h
index dd20b138d4..4b7ae1748f 100644
--- a/fs/verity/fsverity_private.h
+++ b/fs/verity/fsverity_private.h
@@ -161,4 +161,6 @@
 
 void __init fsverity_init_workqueue(void);
 
+#include <trace/events/fsverity.h>
+
 #endif /* _FSVERITY_PRIVATE_H */
diff --git a/fs/verity/init.c b/fs/verity/init.c
index 6e8d33b502..d652066085 100644
--- a/fs/verity/init.c
+++ b/fs/verity/init.c
@@ -5,6 +5,7 @@
  * Copyright 2019 Google LLC
  */
 
+#define CREATE_TRACE_POINTS
 #include "fsverity_private.h"
 
 #include <linux/ratelimit.h>
diff --git a/fs/verity/verify.c b/fs/verity/verify.c
index 86067c8b40..47a66f088f 100644
--- a/fs/verity/verify.c
+++ b/fs/verity/verify.c
@@ -135,6 +135,9 @@
 		/* Byte offset of the wanted hash relative to @addr */
 		unsigned int hoffset;
 	} hblocks[FS_VERITY_MAX_LEVELS];
+
+	trace_fsverity_verify_data_block(inode, params, data_pos);
+
 	/*
 	 * The index of the previous level's block within that level; also the
 	 * index of that block's hash within the current level.
@@ -214,6 +217,9 @@
 			want_hash = _want_hash;
 			kunmap_local(haddr);
 			put_page(hpage);
+			trace_fsverity_merkle_hit(inode, data_pos, hblock_idx,
+					level,
+					hoffset >> params->log_digestsize);
 			goto descend;
 		}
 		hblocks[level].page = hpage;
@@ -248,6 +254,9 @@
 		want_hash = _want_hash;
 		kunmap_local(haddr);
 		put_page(hpage);
+		trace_fsverity_verify_merkle_block(inode,
+				hblock_idx << params->log_blocksize,
+				level, hoffset >> params->log_digestsize);
 	}
 
 	/* Finally, verify the hash of the data block. */
diff --git a/include/trace/events/fsverity.h b/include/trace/events/fsverity.h
new file mode 100644
index 0000000000..dab220884b
--- /dev/null
+++ b/include/trace/events/fsverity.h
@@ -0,0 +1,143 @@
+/* SPDX-License-Identifier: GPL-2.0 */
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
+TRACE_EVENT(fsverity_enable,
+	TP_PROTO(const struct inode *inode,
+		 const struct merkle_tree_params *params),
+	TP_ARGS(inode, params),
+	TP_STRUCT__entry(
+		__field(ino_t, ino)
+		__field(u64, data_size)
+		__field(unsigned int, block_size)
+		__field(unsigned int, num_levels)
+		__field(u64, tree_size)
+	),
+	TP_fast_assign(
+		__entry->ino = inode->i_ino;
+		__entry->data_size = i_size_read(inode);
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
+	TP_PROTO(const struct inode *inode, const struct fsverity_info *vi,
+		 const struct merkle_tree_params *params),
+	TP_ARGS(inode, vi, params),
+	TP_STRUCT__entry(
+		__field(ino_t, ino)
+		__field(unsigned int, levels)
+		__field(unsigned int, block_size)
+		__field(u64, tree_size)
+		__dynamic_array(u8, root_hash, params->digest_size)
+		__dynamic_array(u8, file_digest, params->digest_size)
+	),
+	TP_fast_assign(
+		__entry->ino = inode->i_ino;
+		__entry->levels = params->num_levels;
+		__entry->block_size = params->block_size;
+		__entry->tree_size = params->tree_size;
+		memcpy(__get_dynamic_array(root_hash), vi->root_hash, __get_dynamic_array_len(root_hash));
+		memcpy(__get_dynamic_array(file_digest), vi->file_digest, __get_dynamic_array_len(file_digest));
+	),
+	TP_printk("ino %lu levels %d block_size %d tree_size %lld root_hash %s digest %s",
+		(unsigned long) __entry->ino,
+		__entry->levels,
+		__entry->block_size,
+		__entry->tree_size,
+		__print_hex_str(__get_dynamic_array(root_hash), __get_dynamic_array_len(root_hash)),
+		__print_hex_str(__get_dynamic_array(file_digest), __get_dynamic_array_len(file_digest)))
+);
+
+TRACE_EVENT(fsverity_verify_data_block,
+	TP_PROTO(const struct inode *inode,
+		 const struct merkle_tree_params *params,
+		 u64 data_pos),
+	TP_ARGS(inode, params, data_pos),
+	TP_STRUCT__entry(
+		__field(ino_t, ino)
+		__field(u64, data_pos)
+		__field(unsigned int, block_size)
+	),
+	TP_fast_assign(
+		__entry->ino = inode->i_ino;
+		__entry->data_pos = data_pos;
+		__entry->block_size = params->block_size;
+	),
+	TP_printk("ino %lu pos %lld merkle_blocksize %u",
+		(unsigned long) __entry->ino,
+		__entry->data_pos,
+		__entry->block_size)
+);
+
+TRACE_EVENT(fsverity_merkle_hit,
+	TP_PROTO(const struct inode *inode, u64 data_pos,
+		 unsigned long hblock_idx, unsigned int level,
+		 unsigned int hidx),
+	TP_ARGS(inode, data_pos, hblock_idx, level, hidx),
+	TP_STRUCT__entry(
+		__field(ino_t, ino)
+		__field(u64, data_pos)
+		__field(unsigned long, hblock_idx)
+		__field(unsigned int, level)
+		__field(unsigned int, hidx)
+	),
+	TP_fast_assign(
+		__entry->ino = inode->i_ino;
+		__entry->data_pos = data_pos;
+		__entry->hblock_idx = hblock_idx;
+		__entry->level = level;
+		__entry->hidx = hidx;
+	),
+	TP_printk("ino %lu data_pos %llu hblock_idx %lu level %u hidx %u",
+		(unsigned long) __entry->ino,
+		__entry->data_pos,
+		__entry->hblock_idx,
+		__entry->level,
+		__entry->hidx)
+);
+
+TRACE_EVENT(fsverity_verify_merkle_block,
+	TP_PROTO(const struct inode *inode, unsigned long index,
+		 unsigned int level, unsigned int hidx),
+	TP_ARGS(inode, index, level, hidx),
+	TP_STRUCT__entry(
+		__field(ino_t, ino)
+		__field(unsigned long, index)
+		__field(unsigned int, level)
+		__field(unsigned int, hidx)
+	),
+	TP_fast_assign(
+		__entry->ino = inode->i_ino;
+		__entry->index = index;
+		__entry->level = level;
+		__entry->hidx = hidx;
+	),
+	TP_printk("ino %lu index %lu level %u hidx %u",
+		(unsigned long) __entry->ino,
+		__entry->index,
+		__entry->level,
+		__entry->hidx)
+);
+
+#endif /* _TRACE_FSVERITY_H */
+
+/* This part must be outside protection */
+#include <trace/define_trace.h>

-- 
- Andrey

