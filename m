Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E5A32BF3DB
	for <fsverity@lists.linux.dev>; Mon, 12 Jan 2026 14:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768229398; cv=none; b=hwy3ns1GH6TtaU0/6w57171J4cHewl1WhxQNobdv4QI3aUDaDiu7r8VRzaZgMUKMEFSeKCi4kNRkSCSz80TaHBTkIG+ZSeYM5pwRVjUlJryfcRvhAOF8kno0lAFaHfKQpLxvGuItDOK+ifVQvHpCAU59DmhFSZZ29+tH5ATvVyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768229398; c=relaxed/simple;
	bh=4pIvem8pTEBLg0KjsB8Rdb+YjFU50+kOccXs+aqTA3g=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=NNgboUkZOL5W4bHnUpY64lOgIJzLu+A1uCzWF4HhQZOltCC7Mk5WVWuLGJCnQVYDCtDpRKNcNRK2GOSSDo/MHQivQdZXuwHCUNZdmNAW3y2fh/p9RwZBm7vkuTZCd2ebQ14UaMswudW44/RTk4xLHQ5/b9fOE4ltbiXiKDz7Xms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hKBEKRDl; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hKBEKRDl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768229395;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=W1J1NsEeqAiSWKeOnLnnShK9Aap7A5is4sYRY8AfigM=;
	b=hKBEKRDl15pHO9/qkx4F+C3lV+0Q3RpO4UUdArqZ9OAX46F2LagKS73eEbPRhiEGHRj45s
	KqI42mDCEXGqdI523q75gc3I+1UyoJsuFFCcN6Piu6aqjij+jJqzFsgk0vGJ/9efLa7ATq
	wLPJIpIBN0RCzjzZw5KcFVE/GZrYIvc=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-22-4fTIE8_zNu-ZCZ9FxztcPg-1; Mon, 12 Jan 2026 09:49:54 -0500
X-MC-Unique: 4fTIE8_zNu-ZCZ9FxztcPg-1
X-Mimecast-MFC-AGG-ID: 4fTIE8_zNu-ZCZ9FxztcPg_1768229393
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-64d29b6e198so6792312a12.0
        for <fsverity@lists.linux.dev>; Mon, 12 Jan 2026 06:49:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768229393; x=1768834193;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W1J1NsEeqAiSWKeOnLnnShK9Aap7A5is4sYRY8AfigM=;
        b=g/8SnkLi/PDi3FJonTWw2LMJfXqacvk0TF3AgcnyQZmh18nmSnrf/f6N0FLs9F/k8v
         6ChoW/U1/U32N0uLLuOYOS/O+gtUqnPQ4jk+FOUh2YwA37hD9+zFqFuFz/LNGFvGLxrN
         KROE8vaeqZE9AfizPIftz6H4OHQ7Qs/1n85I6HyC3tI/mSenlhW0QDXxy/SUaW84k+QU
         OPHTsyhebEeyd4/YU4NJXcFmLodnRKiJR6qfe9luVd6AFkCZH1tu72Ol4uXvDZ8klCkk
         VF19Qu65TwKNzvQJXCIGKupHnQ29rtiT7KQi22swfsfiqa4dIXEQKDZXABe99IRutJlP
         +aww==
X-Gm-Message-State: AOJu0Yx/AkW9yDO+bSXGPU2J5IO4ppwnTie3tR1/BVAMxir9Aflsfxss
	Sd+66leaHhTdva4ckJplW9SVqzK/XxuTbioyImg6l+pbr53K9inqfMUunjDe8gyYCwnf3lh2wOE
	29ZtqxMAt3lsYQUZTLkkBvy1xiqQ010j+f0w27IrpN8BkeA3GqzVcr2jQbtURkvdY24jY7mzyfh
	O+RAMehhWb/EPAa5WbQMnclqOW7aMMbXAjEDEGr61HUaQ=
X-Gm-Gg: AY/fxX6vFFWO7Og1qM5p7gyJbUXDGMdFtZUS/VH28FWFon72NwRF2KYimDfqMWQBX5D
	QJ2neYDvGkGhYru+GAs1oUeJWMKaa+MR4z0r6Vv532Hl4Xw6qgMKNku/btUdjzSdSf3WK41bf7Q
	WM1u3UJ8w4xKLqYHmtLJmFad14IrDflMZaKZvQDC8TW2+fhdB+sMQ5uGMKVFTKdcjlUzVIdasRe
	eA4+LD1Rtt1I8x5Lh3w9dpY1kEJHuVSC/aAwb8w3uQszAQ+nWwU7c8DxSODYDWAWR6ZYIBVWCoa
	cqNiX0KQgzoKesQB4V7jhH5iiRbx1m0d29plxOfXkW83X0jvKerJLWIxZqbRuGkrhvO1R6l1
X-Received: by 2002:aa7:df83:0:b0:64b:5771:8fbd with SMTP id 4fb4d7f45d1cf-6507bc6074dmr15225868a12.5.1768229392614;
        Mon, 12 Jan 2026 06:49:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFg3PYG3ssKkijdwkuNYFR4RE+iz8xuOvUCCQ6SXhVaANeWsiyZJ3Lv3ASL045hcT/Z291XKA==
X-Received: by 2002:aa7:df83:0:b0:64b:5771:8fbd with SMTP id 4fb4d7f45d1cf-6507bc6074dmr15225841a12.5.1768229392054;
        Mon, 12 Jan 2026 06:49:52 -0800 (PST)
Received: from thinky ([217.30.74.39])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507bf6648fsm17707771a12.28.2026.01.12.06.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 06:49:51 -0800 (PST)
From: "Darrick J. Wong" <aalbersh@redhat.com>
X-Google-Original-From: "Darrick J. Wong" <djwong@kernel.org>
Date: Mon, 12 Jan 2026 15:49:50 +0100
To: fsverity@lists.linux.dev, linux-xfs@vger.kernel.org, 
	ebiggers@kernel.org, linux-fsdevel@vger.kernel.org, aalbersh@kernel.org, 
	aalbersh@redhat.com, djwong@kernel.org
Cc: djwong@kernel.org, david@fromorbit.com, hch@lst.de
Subject: [PATCH v2 1/22] fsverity: report validation errors back to the
 filesystem
Message-ID: <dx6z2f5lrnevosqoqr4a2aa5bmxldmishn6ln22hvdkuxxmjqa@rddd4kri6bce>
References: <cover.1768229271.patch-series@thinky>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <cover.1768229271.patch-series@thinky>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: YUzZ59H9k7zm-ct9KvA7MMa_z1Y2qBkB8jAQoFxFpgQ_1768229393
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Provide a new function call so that validation errors can be reported
back to the filesystem.

Signed-off-by: Darrick J. Wong <djwong@kernel.org>
Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org>
---
 fs/verity/verify.c              |  4 ++++
 include/linux/fsverity.h        | 14 ++++++++++++++
 include/trace/events/fsverity.h | 19 +++++++++++++++++++
 3 files changed, 37 insertions(+), 0 deletions(-)

diff --git a/fs/verity/verify.c b/fs/verity/verify.c
index 47a66f088f..ef411cf5d8 100644
--- a/fs/verity/verify.c
+++ b/fs/verity/verify.c
@@ -271,6 +271,10 @@
 		data_pos, level - 1, params->hash_alg->name, hsize, want_hash,
 		params->hash_alg->name, hsize,
 		level == 0 ? dblock->real_hash : real_hash);
+	trace_fsverity_file_corrupt(inode, data_pos, params->block_size);
+	if (inode->i_sb->s_vop->file_corrupt)
+		inode->i_sb->s_vop->file_corrupt(inode, data_pos,
+						 params->block_size);
 error:
 	for (; level > 0; level--) {
 		kunmap_local(hblocks[level - 1].addr);
diff --git a/include/linux/fsverity.h b/include/linux/fsverity.h
index 5bc7280425..b75e232890 100644
--- a/include/linux/fsverity.h
+++ b/include/linux/fsverity.h
@@ -128,6 +128,20 @@
 	 */
 	int (*write_merkle_tree_block)(struct inode *inode, const void *buf,
 				       u64 pos, unsigned int size);
+
+	/**
+	 * Notify the filesystem that file data is corrupt.
+	 *
+	 * @inode: the inode being validated
+	 * @pos: the file position of the invalid data
+	 * @len: the length of the invalid data
+	 *
+	 * This function is called when fs-verity detects that a portion of a
+	 * file's data is inconsistent with the Merkle tree, or a Merkle tree
+	 * block needed to validate the data is inconsistent with the level
+	 * above it.
+	 */
+	void (*file_corrupt)(struct inode *inode, loff_t pos, size_t len);
 };
 
 #ifdef CONFIG_FS_VERITY
diff --git a/include/trace/events/fsverity.h b/include/trace/events/fsverity.h
index dab220884b..375fdddac6 100644
--- a/include/trace/events/fsverity.h
+++ b/include/trace/events/fsverity.h
@@ -137,6 +137,25 @@
 		__entry->hidx)
 );
 
+TRACE_EVENT(fsverity_file_corrupt,
+	TP_PROTO(const struct inode *inode, loff_t pos, size_t len),
+	TP_ARGS(inode, pos, len),
+	TP_STRUCT__entry(
+		__field(ino_t, ino)
+		__field(loff_t, pos)
+		__field(size_t, len)
+	),
+	TP_fast_assign(
+		__entry->ino = inode->i_ino;
+		__entry->pos = pos;
+		__entry->len = len;
+	),
+	TP_printk("ino %lu pos %llu len %zu",
+		(unsigned long) __entry->ino,
+		__entry->pos,
+		__entry->len)
+);
+
 #endif /* _TRACE_FSVERITY_H */
 
 /* This part must be outside protection */

-- 
- Andrey

