Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0034A2DB79E
	for <fsverity@lists.linux.dev>; Mon, 12 Jan 2026 14:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768229547; cv=none; b=lp3qOvNVKqbxQU8ILNt0Pd7uopjoKDlf6+t2yJZhJdasowXN2Y8aK/vBHoFU6MULbvyasqEryMa6vCws9tFACSy9VUe5TloryLmMnBFY0mHbTeMjvMFN4IR7SnJ1+DPbkqBuomJgJGjJdT5cabGBGYtmSj/igiHrKzXPJnLeNak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768229547; c=relaxed/simple;
	bh=OQm+dEOLwCOaBZFuA5nZqimBMgAHXvnADpLM7rK/i+I=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=DoBOsMiJ8L8Cko4B58NV388XcnN81dE3Z9qgAAIWy1jbDTufWPhkQk+oCC8vcSJmTICCyns7u4Qaq5qO1IQmxjuOSAncjaQCpwq5TOA/ImUH5ZwivUm7yrz8qf+jBZYfEjt7U41/rjnE7XTz53ctavpChWoZGgi1fw67lLOdAHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=d6ydY7io; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="d6ydY7io"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768229545;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TWmDG1ER0LR9GL8XgLI8QAK75PZeybk5fg0A4H3Djn4=;
	b=d6ydY7ioS7eFKErdyMQDbS0BOhwSCuFiFbjCt+MkRMkVKrVLNnz5llucB0xzb8iwIiuf/t
	AuQ6q0kk5BeEuIDhVdz5ITG23ZrHZC4xNNNhotT7SjCX6PdzAYYBMxjQEhUBsE+en55pTU
	6C1KUZVawGo/Pt93BAhpKirCfH4IqHc=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-528-aLspi7TKPNSrW0REuS49fA-1; Mon, 12 Jan 2026 09:52:24 -0500
X-MC-Unique: aLspi7TKPNSrW0REuS49fA-1
X-Mimecast-MFC-AGG-ID: aLspi7TKPNSrW0REuS49fA_1768229543
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-b8709d4ff20so151144166b.0
        for <fsverity@lists.linux.dev>; Mon, 12 Jan 2026 06:52:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768229543; x=1768834343;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TWmDG1ER0LR9GL8XgLI8QAK75PZeybk5fg0A4H3Djn4=;
        b=fBLiLeE79H2B2LC8Fg5S+kGMzCIHvBvy2Wbk2wB+gxYbxSY4lUzepupKYIxlXdh9GP
         4vgCjV4K66MqfhbxwUNGmUY266IM7hGjjpnbaWdwxfz3dPaHwwnGpV0dtESpm0Mgma1I
         v4O9JdHKuuz4GlLR+RltiTLaq0wObzpThnNr6EKW8JnpXgFzNjw4JsXlOVmGteMoWa11
         BjOq7cpO/F7iXvsoLkpdnP1XrEc4exrsUVC6QOTpQhBijFfQva9MFyZkv4lQxPP10CL2
         69H7UoBUefO0/A+IcSXMgUDU2aWzMrO0GMOXM1oT2Glf9atnhcsmxkhs3+3zwYv1pZZi
         ZMOw==
X-Gm-Message-State: AOJu0Yxmrzi3drwg3dK4OquiwF8BR0NweaQ2u32nOuMWpYG1f9oa1Fed
	smxfNnamJV+JP8bCe0LmN12hHTaAKf37QhazEuGfU73CYDY+yAPYC1IAfLXYvBuzrJZvzgxIHlv
	dspNP9M5eG9MWIoH/+frn2UijjdbrA+29yNcpSf22xYawhiNKeR7Z6Hk/4kdKh88k4SgijPh8NB
	yXlldr+tRdAQELNwBy2/AAV+dZt2NQTQgU6NS50Qxt4Ks=
X-Gm-Gg: AY/fxX5VsPdvkhqEW7+Nk+1KAxk65NPjZ+QxYELY4wUxwqwZH06Gej7o0L3Hr8tdjTj
	GQebTTLU+o7DQtH6ob8+0/1OGfaLYPu79LDlzbb39mrifreaKOxNUcr609tUtKbhNooc6Tw9tjz
	8BS74zr6V82jxKb6fy10eGW9AKwlSqhFsrSj6b7b7gR3QwSgfAtoXp2YI198ofqH0u5iUsKBqAU
	bWJGspOojBsvUgKaNS/UYZcS8DlSTtsIz3LFT9YVZ3pNFyfi6jfbEZfZYuuHZY4PbHP4qs7K8d/
	hPcwxqq3f78uIHW5E7H4FAqamwoPM1y9unu3QyTmtYNesjGzu3r0liTfOJfc9IvsFmM3YlJJMyY
	=
X-Received: by 2002:a17:906:d555:b0:b87:2b1a:3c55 with SMTP id a640c23a62f3a-b872b1a53a4mr156463166b.39.1768229542555;
        Mon, 12 Jan 2026 06:52:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE+oCOD/RpTBmpg2mx41ExTgddYDgK7ppumJ3iw+DJn3a4n5UKSc4vFU0Z75/VqHP7AW9QvSQ==
X-Received: by 2002:a17:906:d555:b0:b87:2b1a:3c55 with SMTP id a640c23a62f3a-b872b1a53a4mr156458566b.39.1768229541846;
        Mon, 12 Jan 2026 06:52:21 -0800 (PST)
Received: from thinky ([217.30.74.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a4d1c61sm1897888566b.35.2026.01.12.06.52.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 06:52:21 -0800 (PST)
From: Andrey Albershteyn <aalbersh@redhat.com>
X-Google-Original-From: Andrey Albershteyn <aalbersh@kernel.org>
Date: Mon, 12 Jan 2026 15:52:20 +0100
To: fsverity@lists.linux.dev, linux-xfs@vger.kernel.org, 
	ebiggers@kernel.org, linux-fsdevel@vger.kernel.org, aalbersh@kernel.org, 
	aalbersh@redhat.com, djwong@kernel.org
Cc: djwong@kernel.org, david@fromorbit.com, hch@lst.de
Subject: [PATCH v2 21/22] xfs: add fsverity traces
Message-ID: <xvaenghd6d7rd5gnfbfm7zmp5dd4uqa2wchdxcfpxpp2cevp7i@a27fi4opexrk>
References: <cover.1768229271.patch-series@thinky>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <cover.1768229271.patch-series@thinky>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6S-wRSnEWonztIJgesuU8EQ-AEdoPkZdG5YogfJmLyI_1768229543
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Even though fsverity has traces, debugging issues with varying block
sizes could be a bit less transparent without read/write traces.

Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org>
---
 fs/xfs/xfs_fsverity.c |  8 ++++++++
 fs/xfs/xfs_trace.h    | 46 ++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 54 insertions(+), 0 deletions(-)

diff --git a/fs/xfs/xfs_fsverity.c b/fs/xfs/xfs_fsverity.c
index f53a404578..06eac2561b 100644
--- a/fs/xfs/xfs_fsverity.c
+++ b/fs/xfs/xfs_fsverity.c
@@ -102,6 +102,8 @@
 	uint32_t		blocksize = i_blocksize(VFS_I(ip));
 	xfs_fileoff_t		last_block;
 
+	trace_xfs_fsverity_get_descriptor(ip);
+
 	ASSERT(inode->i_flags & S_VERITY);
 	error = xfs_bmap_last_extent(NULL, ip, XFS_DATA_FORK, &rec, &is_empty);
 	if (error)
@@ -330,6 +332,8 @@
 	pgoff_t			offset =
 			index | (XFS_FSVERITY_REGION_START >> PAGE_SHIFT);
 
+	trace_xfs_fsverity_read_merkle(XFS_I(inode), offset, PAGE_SIZE);
+
 	folio = __filemap_get_folio(inode->i_mapping, offset, FGP_ACCESSED, 0);
 	if (IS_ERR(folio) || !folio_test_uptodate(folio)) {
 		DEFINE_READAHEAD(ractl, NULL, NULL, inode->i_mapping, offset);
@@ -358,6 +362,8 @@
 	struct xfs_inode	*ip = XFS_I(inode);
 	loff_t			position = pos | XFS_FSVERITY_REGION_START;
 
+	trace_xfs_fsverity_write_merkle(XFS_I(inode), pos, size);
+
 	if (position + size > inode->i_sb->s_maxbytes)
 		return -EFBIG;
 
@@ -370,6 +376,8 @@
 	loff_t			pos,
 	size_t			len)
 {
+	trace_xfs_fsverity_file_corrupt(XFS_I(inode), pos, len);
+
 	xfs_inode_mark_sick(XFS_I(inode), XFS_SICK_INO_DATA);
 }
 
diff --git a/fs/xfs/xfs_trace.h b/fs/xfs/xfs_trace.h
index f70afbf3cb..1ce4e10b6b 100644
--- a/fs/xfs/xfs_trace.h
+++ b/fs/xfs/xfs_trace.h
@@ -5906,6 +5906,52 @@
 DEFINE_FREEBLOCKS_RESV_EVENT(xfs_freecounter_reserved);
 DEFINE_FREEBLOCKS_RESV_EVENT(xfs_freecounter_enospc);
 
+TRACE_EVENT(xfs_fsverity_get_descriptor,
+	TP_PROTO(struct xfs_inode *ip),
+	TP_ARGS(ip),
+	TP_STRUCT__entry(
+		__field(dev_t, dev)
+		__field(xfs_ino_t, ino)
+	),
+	TP_fast_assign(
+		__entry->dev = VFS_I(ip)->i_sb->s_dev;
+		__entry->ino = ip->i_ino;
+	),
+	TP_printk("dev %d:%d ino 0x%llx",
+		  MAJOR(__entry->dev), MINOR(__entry->dev),
+		  __entry->ino)
+);
+
+DECLARE_EVENT_CLASS(xfs_fsverity_class,
+	TP_PROTO(struct xfs_inode *ip, u64 pos, unsigned int length),
+	TP_ARGS(ip, pos, length),
+	TP_STRUCT__entry(
+		__field(dev_t, dev)
+		__field(xfs_ino_t, ino)
+		__field(u64, pos)
+		__field(unsigned int, length)
+	),
+	TP_fast_assign(
+		__entry->dev = VFS_I(ip)->i_sb->s_dev;
+		__entry->ino = ip->i_ino;
+		__entry->pos = pos;
+		__entry->length = length;
+	),
+	TP_printk("dev %d:%d ino 0x%llx pos %llx length %x",
+		  MAJOR(__entry->dev), MINOR(__entry->dev),
+		  __entry->ino,
+		  __entry->pos,
+		  __entry->length)
+)
+
+#define DEFINE_FSVERITY_EVENT(name) \
+DEFINE_EVENT(xfs_fsverity_class, name, \
+	TP_PROTO(struct xfs_inode *ip, u64 pos, unsigned int length), \
+	TP_ARGS(ip, pos, length))
+DEFINE_FSVERITY_EVENT(xfs_fsverity_read_merkle);
+DEFINE_FSVERITY_EVENT(xfs_fsverity_write_merkle);
+DEFINE_FSVERITY_EVENT(xfs_fsverity_file_corrupt);
+
 #endif /* _TRACE_XFS_H */
 
 #undef TRACE_INCLUDE_PATH

-- 
- Andrey

