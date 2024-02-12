Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC833F9EC
	for <fsverity@lists.linux.dev>; Mon, 12 Feb 2024 17:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707757216; cv=none; b=RwCHanKKsXX+r9G42dE59U2CpQifOtwIbFk4NkR1f6G5LNZ0bmvm5zBk4+36Jr3BboHjobTg0/iNdAE7bAFMCDa3IhZXwCOIKKuQNFfEDGjUCIN/KnbMMzcK+P93cg4BsBJiK/0Q++AWmArvOU2F5RA1FogRX9yDGpN5yzR1muU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707757216; c=relaxed/simple;
	bh=hmR+S5AY0nRCFeAH5bAxDWzUXlpVSiwnk6LNs/KSvyE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZgCZOH51e7JG6dyULyF+F0osuXqYVhLgElLylYrl2BPryDZvgok6MYHpBsMnlX2GIedzxVHshwMJVGOsyDzJU9l8Mel0SwZnzmaGyAsFkj92SwQxrg8TMZ0T1AddddR4gfcr06VKE3y0/5zH7jA6ni6oeuhWlUIpHmOGV77kg2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TR9y+Ilp; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TR9y+Ilp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707757213;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AmNNlJPhUFaXIob1BwyjdQcuVkHPCpZ8IwBssOpb1Po=;
	b=TR9y+IlpjMKAtbJoS9x36pctDndSxvK/PMPRqV4HUcjgOSqxNtIgCOGpxYyziRwqZFWad6
	KReveKXMbOHe4ayz9Mjh/nARKJgSwZbmPRSxVittfqBNgivRhGhE3fEjTqqor/8HkEgGD4
	cozCe4OFAZ6oGr2xE1WjGl+/9zMzjGE=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-266-pXe2IapyNCyF2Qj942sR8Q-1; Mon, 12 Feb 2024 12:00:09 -0500
X-MC-Unique: pXe2IapyNCyF2Qj942sR8Q-1
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-2d055407fa4so32378401fa.0
        for <fsverity@lists.linux.dev>; Mon, 12 Feb 2024 09:00:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707757207; x=1708362007;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AmNNlJPhUFaXIob1BwyjdQcuVkHPCpZ8IwBssOpb1Po=;
        b=TMt/Z/lmIoIYBsCPdliQZ5HhtCZfJ8z/rzbhMR9+4vMOJXty6HeCREJXipXfx37Apa
         KZ5eHEW9xAgWl3+b5a+ubs0YeWyhCzhh3sL1+pwNkCHfK3RTpWn0bSpKisqghx6C4hWS
         gx5bDfKC06jKNI7Ukouniw9zbei+Uyr7eDasxGfiCT03C5eMdBgaqqjsWYKf11SoZj8G
         0Rp6AE+jnfY/wnwSovcA1m/V4SjjSTCrPK3DrYvgkJN723PAAjBwMjauNvJ6RniMsHi9
         shYEL2HYS86xB4VcVd/Kut51C9B8LOoCs05njJNDldf2E63JID3ky3gKDwsAv3DJUxNT
         Fvlw==
X-Gm-Message-State: AOJu0YzSHs0iKjEXM7qyhTN2Q33tNHdU1/5324CYV66TLvjvKA8GpB79
	VqXr3SjIC8zyQu6Z8lMccDd2NeDNogcKr5mU8v+IflwosA0f+G2THELTj45xsI4VKsBWPicbCBZ
	B+OIu/UzdGPpbd4G3ucZ3B/Cz4uJufshW9kAShNmWP4pO27BTlX/YEGrL4hdTXlq6ibp87k+YeX
	3vZHAbprah/SNoSbrw8OF7oVNYb9/ONVpHrB85zQo=
X-Received: by 2002:a05:651c:cf:b0:2d0:cf14:c190 with SMTP id 15-20020a05651c00cf00b002d0cf14c190mr4346987ljr.50.1707757207124;
        Mon, 12 Feb 2024 09:00:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHyrud5wesvlVfmqztFwgue5DmNAK+DEbeWoNwqXMq50tEhnxQmKL0df6lGsY5NyQZ3shEGHw==
X-Received: by 2002:a05:651c:cf:b0:2d0:cf14:c190 with SMTP id 15-20020a05651c00cf00b002d0cf14c190mr4346969ljr.50.1707757206827;
        Mon, 12 Feb 2024 09:00:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWJTI843yXTJ0emfk+epBVW2Le2UXrN5BlrF0Bou7qm6A8KahxOqRBQllpGfPzXBzdoSauxL9r6u49ZS1kbiVX9NrgbkiV5CEXwk+11AVv9RHcJQVy+m4zL/XoXw+eNTH+a9VZoNpjdQfgdrvg9ZwU+YsvEBTPGfZG1m0DDZnEv4O3CXY70pYIHx8DTC6DQG25L7O5IP5wjNRbPzB0pEw7YGYCtNqXRWlTA
Received: from thinky.redhat.com ([109.183.6.197])
        by smtp.gmail.com with ESMTPSA id 14-20020a0564021f4e00b0056176e95a88sm2620261edz.32.2024.02.12.09.00.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 09:00:06 -0800 (PST)
From: Andrey Albershteyn <aalbersh@redhat.com>
To: fsverity@lists.linux.dev,
	linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	chandan.babu@oracle.com,
	djwong@kernel.org,
	ebiggers@kernel.org
Cc: Andrey Albershteyn <aalbersh@redhat.com>
Subject: [PATCH v4 13/25] xfs: introduce workqueue for post read IO work
Date: Mon, 12 Feb 2024 17:58:10 +0100
Message-Id: <20240212165821.1901300-14-aalbersh@redhat.com>
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
 fs/xfs/xfs_aops.c  | 15 +++++++++++++--
 fs/xfs/xfs_linux.h |  1 +
 fs/xfs/xfs_mount.h |  1 +
 fs/xfs/xfs_super.c |  9 +++++++++
 4 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/fs/xfs/xfs_aops.c b/fs/xfs/xfs_aops.c
index 7a6627404160..70e444c151b2 100644
--- a/fs/xfs/xfs_aops.c
+++ b/fs/xfs/xfs_aops.c
@@ -548,19 +548,30 @@ xfs_vm_bmap(
 	return iomap_bmap(mapping, block, &xfs_read_iomap_ops);
 }
 
+static inline struct workqueue_struct *
+xfs_fsverity_wq(
+	struct address_space	*mapping)
+{
+	if (fsverity_active(mapping->host))
+		return XFS_I(mapping->host)->i_mount->m_postread_workqueue;
+	return NULL;
+}
+
 STATIC int
 xfs_vm_read_folio(
 	struct file		*unused,
 	struct folio		*folio)
 {
-	return iomap_read_folio(folio, &xfs_read_iomap_ops, NULL);
+	return iomap_read_folio(folio, &xfs_read_iomap_ops,
+				xfs_fsverity_wq(folio->mapping));
 }
 
 STATIC void
 xfs_vm_readahead(
 	struct readahead_control	*rac)
 {
-	iomap_readahead(rac, &xfs_read_iomap_ops, NULL);
+	iomap_readahead(rac, &xfs_read_iomap_ops,
+			xfs_fsverity_wq(rac->mapping));
 }
 
 static int
diff --git a/fs/xfs/xfs_linux.h b/fs/xfs/xfs_linux.h
index d7873e0360f0..9c76e025b5d8 100644
--- a/fs/xfs/xfs_linux.h
+++ b/fs/xfs/xfs_linux.h
@@ -64,6 +64,7 @@ typedef __u32			xfs_nlink_t;
 #include <linux/xattr.h>
 #include <linux/mnt_idmapping.h>
 #include <linux/debugfs.h>
+#include <linux/fsverity.h>
 
 #include <asm/page.h>
 #include <asm/div64.h>
diff --git a/fs/xfs/xfs_mount.h b/fs/xfs/xfs_mount.h
index 503fe3c7edbf..f64bf75f50d6 100644
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
index 5a2512d20bd0..b2b6c1f24c42 100644
--- a/fs/xfs/xfs_super.c
+++ b/fs/xfs/xfs_super.c
@@ -553,6 +553,12 @@ xfs_init_mount_workqueues(
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
@@ -586,6 +592,8 @@ xfs_init_mount_workqueues(
 	destroy_workqueue(mp->m_reclaim_workqueue);
 out_destroy_unwritten:
 	destroy_workqueue(mp->m_unwritten_workqueue);
+out_destroy_postread:
+	destroy_workqueue(mp->m_postread_workqueue);
 out_destroy_buf:
 	destroy_workqueue(mp->m_buf_workqueue);
 out:
@@ -601,6 +609,7 @@ xfs_destroy_mount_workqueues(
 	destroy_workqueue(mp->m_inodegc_wq);
 	destroy_workqueue(mp->m_reclaim_workqueue);
 	destroy_workqueue(mp->m_unwritten_workqueue);
+	destroy_workqueue(mp->m_postread_workqueue);
 	destroy_workqueue(mp->m_buf_workqueue);
 }
 
-- 
2.42.0

