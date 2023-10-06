Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED4F038F93
	for <fsverity@lists.linux.dev>; Fri,  6 Oct 2023 18:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IHT0VwW1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1696618355;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Jjx9VgV/7dT4tZbJ3E3mhAPuVCjLtjMTEsq27X+yTiE=;
	b=IHT0VwW1ubUNyAfuELOLywo1IR/ABz5KgEGjhyLdO1yGR7Nr3vHOuTwu9n+or1C5EDojc4
	l3MjDTRBx8LJVP0why+eUIWY54fKO16t5tOBmUpm2Ug7fVDFGGT7/IG3PeSAMtnh+7MYwj
	ISiB5ZYZcdhZSw0rsycNoqwcchciodE=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-387-L-E-R4ayN4-nvMcgmcYLTA-1; Fri, 06 Oct 2023 14:52:33 -0400
X-MC-Unique: L-E-R4ayN4-nvMcgmcYLTA-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-9b9ecd8c351so183813966b.1
        for <fsverity@lists.linux.dev>; Fri, 06 Oct 2023 11:52:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696618352; x=1697223152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jjx9VgV/7dT4tZbJ3E3mhAPuVCjLtjMTEsq27X+yTiE=;
        b=rxiWGlaJKCos22/voTU71GpI8w5HvN6/NLQwtvSSZDUQXq2OszoIPsf7YrNn68G7O0
         o5t9+9xTiE7jR3C3RcQVfqDHMCWhuIhM0G7Mkn8s2RVqwQQWpHaKHMkIq66NFq3xNRsM
         p4hJh4gMvdyxNa9uRwPzjdSq0vozQJkev9/sdqcTFOuXqESy/GmXQFOqaQ9qA3PSL9A5
         y5oUyi/i3y0cfQDln4KtiHvlvGzVFePfEh2Ere4hMLugErzdyUG8x0zMLYAD3cEaFF6y
         3kHlSnFPewQqGSL4l+A/1Kq/bJY3JIWC+ae+5ckR0ke6FQk9cMrJZj33cfd9QLiBCLJd
         G/8g==
X-Gm-Message-State: AOJu0YxeXfOL4qXM69NbcOJHrAMUXIxhM5RmM2EZeZT7Lzg3usVytWy6
	T9P3FI3UeSRaornhFurBPr+kyWjI8fiQiFVmLyL1oHygiTq9ebsmVe32oSApPj5LiMNt2IC5LLC
	fO1TLXiXMGpDi7ZEX0w==
X-Received: by 2002:a17:906:3116:b0:9a9:e4ba:2da7 with SMTP id 22-20020a170906311600b009a9e4ba2da7mr8028350ejx.49.1696618352616;
        Fri, 06 Oct 2023 11:52:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHDPDtaO2TAQS7SQHAc7X+kA+HXfojdJw5ChBvvTI1/xFzblcVVwt2Q3wqp9BD4yXfaMCDGqw==
X-Received: by 2002:a17:906:3116:b0:9a9:e4ba:2da7 with SMTP id 22-20020a170906311600b009a9e4ba2da7mr8028334ejx.49.1696618352414;
        Fri, 06 Oct 2023 11:52:32 -0700 (PDT)
Received: from localhost.localdomain ([109.183.6.197])
        by smtp.gmail.com with ESMTPSA id os5-20020a170906af6500b009b947f81c4asm3304741ejb.155.2023.10.06.11.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 11:52:32 -0700 (PDT)
From: Andrey Albershteyn <aalbersh@redhat.com>
To: linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	fsverity@lists.linux.dev
Cc: djwong@kernel.org,
	ebiggers@kernel.org,
	david@fromorbit.com,
	dchinner@redhat.com,
	Andrey Albershteyn <aalbersh@redhat.com>
Subject: [PATCH v3 15/28] xfs: introduce workqueue for post read IO work
Date: Fri,  6 Oct 2023 20:49:09 +0200
Message-Id: <20231006184922.252188-16-aalbersh@redhat.com>
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
index d19cca099bc3..3d77844b255e 100644
--- a/fs/xfs/xfs_mount.h
+++ b/fs/xfs/xfs_mount.h
@@ -109,6 +109,7 @@ typedef struct xfs_mount {
 	struct xfs_mru_cache	*m_filestream;  /* per-mount filestream data */
 	struct workqueue_struct *m_buf_workqueue;
 	struct workqueue_struct	*m_unwritten_workqueue;
+	struct workqueue_struct	*m_postread_workqueue;
 	struct workqueue_struct	*m_reclaim_workqueue;
 	struct workqueue_struct	*m_sync_workqueue;
 	struct workqueue_struct *m_blockgc_wq;
diff --git a/fs/xfs/xfs_super.c b/fs/xfs/xfs_super.c
index 819a3568b28f..5e1ec5978176 100644
--- a/fs/xfs/xfs_super.c
+++ b/fs/xfs/xfs_super.c
@@ -554,6 +554,12 @@ xfs_init_mount_workqueues(
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
@@ -587,6 +593,8 @@ xfs_init_mount_workqueues(
 	destroy_workqueue(mp->m_reclaim_workqueue);
 out_destroy_unwritten:
 	destroy_workqueue(mp->m_unwritten_workqueue);
+out_destroy_postread:
+	destroy_workqueue(mp->m_postread_workqueue);
 out_destroy_buf:
 	destroy_workqueue(mp->m_buf_workqueue);
 out:
@@ -602,6 +610,7 @@ xfs_destroy_mount_workqueues(
 	destroy_workqueue(mp->m_inodegc_wq);
 	destroy_workqueue(mp->m_reclaim_workqueue);
 	destroy_workqueue(mp->m_unwritten_workqueue);
+	destroy_workqueue(mp->m_postread_workqueue);
 	destroy_workqueue(mp->m_buf_workqueue);
 }
 
-- 
2.40.1

