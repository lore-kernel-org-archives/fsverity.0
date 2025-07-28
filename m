Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B91CA239099
	for <fsverity@lists.linux.dev>; Mon, 28 Jul 2025 20:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753734694; cv=none; b=osVj3KMmQ4rH+1c7bi3Gd9XgUPtYAIMGk4Kti5d+jwyKAXNk3x5wgJMkdoizoCJzg7S2HVfrjYTvhLRqsY/LaSXXNuWbte9g7XrJRcdxF04bShhTcJ62QjM9bWyOQ71UJxmjrS8JDGPIhqE4FwoNk9n+T7mRtezrPbGC0a4EyGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753734694; c=relaxed/simple;
	bh=vtEh005EKDpDotFFI+1Wg203jjL9iXcRk9HDHR9yBro=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=Ir1LcNXXo8uhov7zPmTVmMfzRM1UafZ+bup53IjmMVPfcVIVkmq0fJf3RuOv3B5x2NkFHvP4VlybqP/4M5156zlza3ha0hx2x0sYt11w2UQO5i8JeCsGxddIoGDn2ggt9abohs21XFBPya7SGOcD5HBWMfdPmSwwOmBcI+K2nyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Zjkz+Rld; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Zjkz+Rld"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753734689;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=udEXP1NTqrVTD7aP+UIpVa47Z7hx6S3k4WMP0sChdIY=;
	b=Zjkz+Rld6KhCR/SH/lVvCa86XnIMDMe/wpqEBUMauerbCDqW6JmTnXHlac/pJsSYCxdSr5
	Quss0blMAEXwE17Nba0c7NE2+vbgyYcMu0JcODVK0jfBtLHETtQTBq5FAJqjIbPPT9X8xo
	7wcxsbBAU/6EqwxK5Bh8odNu2QSH6LM=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-649-DL7WrHHBPZm8WfjMts-RBQ-1; Mon, 28 Jul 2025 16:31:28 -0400
X-MC-Unique: DL7WrHHBPZm8WfjMts-RBQ-1
X-Mimecast-MFC-AGG-ID: DL7WrHHBPZm8WfjMts-RBQ_1753734687
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-61544020fdeso998977a12.1
        for <fsverity@lists.linux.dev>; Mon, 28 Jul 2025 13:31:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753734687; x=1754339487;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=udEXP1NTqrVTD7aP+UIpVa47Z7hx6S3k4WMP0sChdIY=;
        b=bbrm7+49PDI8zRhlbLCARg7fcc7AR66X8E3NGkh8+X5Ug/Rc7Pa03LTjiKi9Nq66ID
         EfK3fi60ZQXjIfedN3lplO38OLXiFV2WY8mID1+Tldr2JEH0qw1Bu2DqRCFez84fsKP9
         fOedoDdRt9ABW7NFda9AigiTzejQ5gWobUxe0DpNNUrwtJjvNwCk/YKBPFZG7D6ePb7y
         +wzbeVqkyLuhVZYb3L8lPfoHye8yuV00Rt9Ehlt6b83W/3lg432eU+wOqltATcFkqCdh
         8bZgtWBiqs8OPUEK3JgZLdLP+2KDZdw5OqUslZfLUqgc5Q2jVDfLm+N6ZU7s+ZkvMPf1
         V0zA==
X-Gm-Message-State: AOJu0YwTAtyBRLNzBp3uE4eYjEzxunn4h3hgf+v3xoAIVpXBseFToNO/
	e80p9/ifUzvciKnlB7Xf7c47S3VfHA1vPLI3hjc9TTAfg2mhr4eCAsNZusAc8ugAxmGdPNgNK4l
	XnKAEHr0mN78igvnP9NRb6CWowX1fZBrNcZ9kFaCu2E0sPujCZRMqUQTuBeM=
X-Gm-Gg: ASbGnct9hVEkZQiBIQXTVMIKAhb1KdWphAZNFZdA6S54G/yHntw6y3LTIgQEokBth/2
	BCKWsB+YGiNFaIA3f+CVcLXSjXlEWuB2VKi6fdBV/G1AGubw71jgyuFfFlAw2lcnbqzbGgK4dBY
	nYOAlOuEKh2sAcN1/eam1h/J8WYhOVEPaB39xjXoLzdcoDpBsWYdDCV2ZGsSCTDiu0Kwu26Igra
	8eQ5czBgSSkIXg3xuFVWp5SKuRWhjU9ZZxh33YoPtjJfqf2KK4xatLFZsqp7SVTv3oASJJuwZmz
	1IsXOEtjSD8zxzHmKoC0V0Dg4TGHnLxZQ9sjV9f3BcgyFg==
X-Received: by 2002:a05:6402:358b:b0:614:a23b:4959 with SMTP id 4fb4d7f45d1cf-614f1d1fe53mr12425633a12.10.1753734686864;
        Mon, 28 Jul 2025 13:31:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHaaFKErrXH/4nNMLMgIEdNT/+wVU80xv876D9pn+I+rfx81s2qpSqObxivOn7N4osROcUwzA==
X-Received: by 2002:a05:6402:358b:b0:614:a23b:4959 with SMTP id 4fb4d7f45d1cf-614f1d1fe53mr12425599a12.10.1753734686262;
        Mon, 28 Jul 2025 13:31:26 -0700 (PDT)
Received: from [127.0.0.2] (ip-217-030-074-039.aim-net.cz. [217.30.74.39])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615226558d3sm2730656a12.45.2025.07.28.13.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 13:31:25 -0700 (PDT)
From: Andrey Albershteyn <aalbersh@redhat.com>
X-Google-Original-From: Andrey Albershteyn <aalbersh@kernel.org>
Date: Mon, 28 Jul 2025 22:30:09 +0200
Subject: [PATCH RFC 05/29] fsverity: add tracepoints
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <20250728-fsverity-v1-5-9e5443af0e34@kernel.org>
References: <20250728-fsverity-v1-0-9e5443af0e34@kernel.org>
In-Reply-To: <20250728-fsverity-v1-0-9e5443af0e34@kernel.org>
To: fsverity@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
 linux-xfs@vger.kernel.org, david@fromorbit.com, djwong@kernel.org, 
 ebiggers@kernel.org, hch@lst.de
Cc: Andrey Albershteyn <aalbersh@redhat.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=8381; i=aalbersh@kernel.org;
 h=from:subject:message-id; bh=zHxrqV5/JFTflwqY826/uVnZlU2AiK108yoYvS/c40o=;
 b=owJ4nJvAy8zAJea2/JXEGuOHHIyn1ZIYMtrvic9ZZraiRjnraN3rTWnf85gupKocMTN0fZc5P
 5qRWWS+772OUhYGMS4GWTFFlnXSWlOTiqTyjxjUyMPMYWUCGcLAxSkAE5l/hJHh+tqJIR/X61Y7
 3mv/+FRu41mxoqcTgm/fzNF/2KT1cOvr7Qz/IzKiJNkfbOZb1hKusTFxs+5KiblvfW+q2jx4fNZ
 iod0RfgCBNko9
X-Developer-Key: i=aalbersh@kernel.org; a=openpgp;
 fpr=AE1B2A9562721A6FC4307C1F46A7EA18AC33E108
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: HXCFejbeJJoilhSiEjePBvyDj00pj-rX4JVcaq5SHQ4_1753734687
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

From: Andrey Albershteyn <aalbersh@redhat.com>

fs-verity previously had debug printk but it was removed. This patch
adds trace points to the same places where printk were used (with a
few additional ones).

Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
Reviewed-by: Darrick J. Wong <djwong@kernel.org>
[djwong: fix formatting]
Signed-off-by: Darrick J. Wong <djwong@kernel.org>
---
 MAINTAINERS                     |   1 +
 fs/verity/enable.c              |   4 ++
 fs/verity/fsverity_private.h    |   2 +
 fs/verity/init.c                |   1 +
 fs/verity/verify.c              |   9 +++
 include/trace/events/fsverity.h | 143 ++++++++++++++++++++++++++++++++++++++++
 6 files changed, 160 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 60bba48f5479..64575d2007f2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9851,6 +9851,7 @@ T:	git https://git.kernel.org/pub/scm/fs/fsverity/linux.git
 F:	Documentation/filesystems/fsverity.rst
 F:	fs/verity/
 F:	include/linux/fsverity.h
+F:	include/trace/events/fsverity.h
 F:	include/uapi/linux/fsverity.h
 
 FT260 FTDI USB-HID TO I2C BRIDGE DRIVER
diff --git a/fs/verity/enable.c b/fs/verity/enable.c
index c284f46d1b53..7cf902051b2d 100644
--- a/fs/verity/enable.c
+++ b/fs/verity/enable.c
@@ -227,6 +227,8 @@ static int enable_verity(struct file *filp,
 	if (err)
 		goto out;
 
+	trace_fsverity_enable(inode, &params);
+
 	/*
 	 * Start enabling verity on this file, serialized by the inode lock.
 	 * Fail if verity is already enabled or is already being enabled.
@@ -269,6 +271,8 @@ static int enable_verity(struct file *filp,
 		goto rollback;
 	}
 
+	trace_fsverity_tree_done(inode, vi, &params);
+
 	/*
 	 * Tell the filesystem to finish enabling verity on the file.
 	 * Serialized with ->begin_enable_verity() by the inode lock.
diff --git a/fs/verity/fsverity_private.h b/fs/verity/fsverity_private.h
index b3506f56e180..04dd471d791c 100644
--- a/fs/verity/fsverity_private.h
+++ b/fs/verity/fsverity_private.h
@@ -154,4 +154,6 @@ static inline void fsverity_init_signature(void)
 
 void __init fsverity_init_workqueue(void);
 
+#include <trace/events/fsverity.h>
+
 #endif /* _FSVERITY_PRIVATE_H */
diff --git a/fs/verity/init.c b/fs/verity/init.c
index 6e8d33b50240..d65206608583 100644
--- a/fs/verity/init.c
+++ b/fs/verity/init.c
@@ -5,6 +5,7 @@
  * Copyright 2019 Google LLC
  */
 
+#define CREATE_TRACE_POINTS
 #include "fsverity_private.h"
 
 #include <linux/ratelimit.h>
diff --git a/fs/verity/verify.c b/fs/verity/verify.c
index 30a3f6ada2ad..580486168467 100644
--- a/fs/verity/verify.c
+++ b/fs/verity/verify.c
@@ -109,6 +109,9 @@ verify_data_block(struct inode *inode, struct fsverity_info *vi,
 		/* Byte offset of the wanted hash relative to @addr */
 		unsigned int hoffset;
 	} hblocks[FS_VERITY_MAX_LEVELS];
+
+	trace_fsverity_verify_data_block(inode, params, data_pos);
+
 	/*
 	 * The index of the previous level's block within that level; also the
 	 * index of that block's hash within the current level.
@@ -184,6 +187,9 @@ verify_data_block(struct inode *inode, struct fsverity_info *vi,
 			want_hash = _want_hash;
 			kunmap_local(haddr);
 			put_page(hpage);
+			trace_fsverity_merkle_hit(inode, data_pos, hblock_idx,
+					level,
+					hoffset >> params->log_digestsize);
 			goto descend;
 		}
 		hblocks[level].page = hpage;
@@ -219,6 +225,9 @@ verify_data_block(struct inode *inode, struct fsverity_info *vi,
 		want_hash = _want_hash;
 		kunmap_local(haddr);
 		put_page(hpage);
+		trace_fsverity_verify_merkle_block(inode,
+				hblock_idx << params->log_blocksize,
+				level, hoffset >> params->log_digestsize);
 	}
 
 	/* Finally, verify the data block. */
diff --git a/include/trace/events/fsverity.h b/include/trace/events/fsverity.h
new file mode 100644
index 000000000000..dab220884b89
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
2.50.0

