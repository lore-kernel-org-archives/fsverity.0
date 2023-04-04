Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5AB62FAE
	for <fsverity@lists.linux.dev>; Tue,  4 Apr 2023 14:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680620126;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g1NG2DlOPhECSBoFyURsYJB7f5VQnxxV8rEkg1d1tQc=;
	b=JcVIpQAJvDrdUuqyNsVYLoncjglB0MOHWb63z5op0+StlMVRhPam+GFVYw4LAKTPNbaHrv
	D9hinTozxWlq9yUYQuiZmmLVrCHg9cuuwwYfbCQ+6SQQq1vL/gWV1zMDfldmzVzf1QfaVN
	vWSv/7YYON5GFQA1Qogi4AUMEcj/66s=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-265-VSaCLHlPOmmnjJIYzglKfQ-1; Tue, 04 Apr 2023 10:55:25 -0400
X-MC-Unique: VSaCLHlPOmmnjJIYzglKfQ-1
Received: by mail-qk1-f198.google.com with SMTP id b142-20020ae9eb94000000b007486a8b9ae9so12184555qkg.11
        for <fsverity@lists.linux.dev>; Tue, 04 Apr 2023 07:55:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680620121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g1NG2DlOPhECSBoFyURsYJB7f5VQnxxV8rEkg1d1tQc=;
        b=Hv/gg1DEGr51hYKXFZZp84i2fKumNZmMzKrutWo2PIoioqTTyFJ7AgrwZLpntSwNBu
         f0jsjeB6q5xSMCW5ChvDTX7cpxwtT9pr9PzUydDcv6+wNBY/q7uRJwnS+qnXu20uY3zj
         TdYrmCYNedB70292fo5UYPNun0h10E0buUWrerk20pMcFzIxjXlqQ4iWGUTzydi774Qg
         Sh9xM4R7qAp37t8wPPFjEr1CL4T373mz+YG7a2Mgwh2aEhYNpvvh4QQhkAP8QkgoW1Kj
         LUOMz6UJeinMfv4o9yKpunYhBc3BE4u8RybO37sh+azom6kkvzuAw04Pg7OkF6nUomME
         0ZyQ==
X-Gm-Message-State: AAQBX9cPfYFSFEOmaX7B8FjIAWtwQ7W6kNlqQxoA/7KmiNYkOsWG9Aho
	oqCpI/DwouxeIvQ7I2l9giD76QsIDVbS6xX2lUPUJJOXHtJ0ckR650mSv5gad1/CmEAgNy++QXi
	NvTlVv5njoiDWT6feIQ==
X-Received: by 2002:ac8:5754:0:b0:3d7:960e:5387 with SMTP id 20-20020ac85754000000b003d7960e5387mr3872047qtx.35.1680620121257;
        Tue, 04 Apr 2023 07:55:21 -0700 (PDT)
X-Google-Smtp-Source: AKy350bjyktKoJdi6D9KFFirgwb83MTSe30Fparym5df9UxsVGpZNZWXy1G6A3UC/2iyEvUKlSZpbw==
X-Received: by 2002:ac8:5754:0:b0:3d7:960e:5387 with SMTP id 20-20020ac85754000000b003d7960e5387mr3871997qtx.35.1680620120899;
        Tue, 04 Apr 2023 07:55:20 -0700 (PDT)
Received: from aalbersh.remote.csb ([109.183.6.197])
        by smtp.gmail.com with ESMTPSA id j4-20020ac86644000000b003e6387431dcsm3296539qtp.7.2023.04.04.07.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 07:55:20 -0700 (PDT)
From: Andrey Albershteyn <aalbersh@redhat.com>
To: djwong@kernel.org,
	dchinner@redhat.com,
	ebiggers@kernel.org,
	hch@infradead.org,
	linux-xfs@vger.kernel.org,
	fsverity@lists.linux.dev
Cc: rpeterso@redhat.com,
	agruenba@redhat.com,
	xiang@kernel.org,
	chao@kernel.org,
	damien.lemoal@opensource.wdc.com,
	jth@kernel.org,
	linux-erofs@lists.ozlabs.org,
	linux-btrfs@vger.kernel.org,
	linux-ext4@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	cluster-devel@redhat.com,
	Andrey Albershteyn <aalbersh@redhat.com>
Subject: [PATCH v2 12/23] xfs: introduce workqueue for post read IO work
Date: Tue,  4 Apr 2023 16:53:08 +0200
Message-Id: <20230404145319.2057051-13-aalbersh@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230404145319.2057051-1-aalbersh@redhat.com>
References: <20230404145319.2057051-1-aalbersh@redhat.com>
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

As noted by Dave there are two problems with using fs-verity's
workqueue in XFS:

1. High priority workqueues are used within XFS to ensure that data
   IO completion cannot stall processing of journal IO completions.
   Hence using a WQ_HIGHPRI workqueue directly in the user data IO
   path is a potential filesystem livelock/deadlock vector.

2. The fsverity workqueue is global - it creates a cross-filesystem
   contention point.

This patch adds per-filesystem, per-cpu workqueue for fsverity
work.

Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
---
 fs/xfs/xfs_mount.h | 1 +
 fs/xfs/xfs_super.c | 9 +++++++++
 2 files changed, 10 insertions(+)

diff --git a/fs/xfs/xfs_mount.h b/fs/xfs/xfs_mount.h
index f3269c0626f0..53a4a9304937 100644
--- a/fs/xfs/xfs_mount.h
+++ b/fs/xfs/xfs_mount.h
@@ -107,6 +107,7 @@ typedef struct xfs_mount {
 	struct xfs_mru_cache	*m_filestream;  /* per-mount filestream data */
 	struct workqueue_struct *m_buf_workqueue;
 	struct workqueue_struct	*m_unwritten_workqueue;
+	struct workqueue_struct	*m_postread_workqueue;
 	struct workqueue_struct	*m_reclaim_workqueue;
 	struct workqueue_struct	*m_sync_workqueue;
 	struct workqueue_struct *m_blockgc_wq;
diff --git a/fs/xfs/xfs_super.c b/fs/xfs/xfs_super.c
index 4f814f9e12ab..d6f22cb94ee2 100644
--- a/fs/xfs/xfs_super.c
+++ b/fs/xfs/xfs_super.c
@@ -548,6 +548,12 @@ xfs_init_mount_workqueues(
 	if (!mp->m_unwritten_workqueue)
 		goto out_destroy_buf;
 
+	mp->m_postread_workqueue = alloc_workqueue("xfs-pread/%s",
+			XFS_WQFLAGS(WQ_FREEZABLE | WQ_MEM_RECLAIM),
+			0, mp->m_super->s_id);
+	if (!mp->m_postread_workqueue)
+		goto out_destroy_postread;
+
 	mp->m_reclaim_workqueue = alloc_workqueue("xfs-reclaim/%s",
 			XFS_WQFLAGS(WQ_FREEZABLE | WQ_MEM_RECLAIM),
 			0, mp->m_super->s_id);
@@ -581,6 +587,8 @@ xfs_init_mount_workqueues(
 	destroy_workqueue(mp->m_reclaim_workqueue);
 out_destroy_unwritten:
 	destroy_workqueue(mp->m_unwritten_workqueue);
+out_destroy_postread:
+	destroy_workqueue(mp->m_postread_workqueue);
 out_destroy_buf:
 	destroy_workqueue(mp->m_buf_workqueue);
 out:
@@ -596,6 +604,7 @@ xfs_destroy_mount_workqueues(
 	destroy_workqueue(mp->m_inodegc_wq);
 	destroy_workqueue(mp->m_reclaim_workqueue);
 	destroy_workqueue(mp->m_unwritten_workqueue);
+	destroy_workqueue(mp->m_postread_workqueue);
 	destroy_workqueue(mp->m_buf_workqueue);
 }
 
-- 
2.38.4

