Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F3538F9B
	for <fsverity@lists.linux.dev>; Fri,  6 Oct 2023 18:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CtjVknn8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1696618346;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BlaoLCyuqcY+41bC5MK6wnQeesc3w4fcpuq4w3pEvtE=;
	b=CtjVknn87Xp6pydHOr3HgZGRMvElbtuFxNGXmf4psBDnRtHHlYFeUQO3sj3TtLIIvKLkZW
	EOBWMpKNIAeNwtQAtdTiqXAUlmRMnfZromxUl4qZcN3IPaGVjVRm0popR7oRg0XE+53DZ0
	yNu3AUG1ixDCX5zEY4CYccBl8FvAu3U=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-477-9md5KnpkN9-7JNC8wyygeQ-1; Fri, 06 Oct 2023 14:52:25 -0400
X-MC-Unique: 9md5KnpkN9-7JNC8wyygeQ-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-9b2cf504e3aso207405366b.2
        for <fsverity@lists.linux.dev>; Fri, 06 Oct 2023 11:52:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696618344; x=1697223144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BlaoLCyuqcY+41bC5MK6wnQeesc3w4fcpuq4w3pEvtE=;
        b=LRT2GL1FPL1tI/CeD9uCgr/7emIOIyAB4NoJ5czkJjXStAdhBJ//x2IzuYWB6amxgX
         R2vg/RVgIMM2kKF9C5KP/Bm57lzsgxKASfLQhH9KDBZ0IU6Y8qZvlxjYO4G0mhrj702O
         zKKPWdnEXrD7bT6xaWriQXAt705TZ16jUEdy8mDzplaRcBME2yhxBDignZsCw1750Z+H
         VaOGo/ttHaJKTZ6Us9VSiAdGb4qBwnjh6A1YiLPKyIDJ3yjBEEXk5l6KhFLAA6/soFg9
         mXVNBwDnS4hJie+hq7GanwJuK1v+q+lf64kLvwxNmWszcMIcRP/Rg8zBxwBfJ8insWLB
         PhmQ==
X-Gm-Message-State: AOJu0Yy0VfVHZgl3aMUzv8RJzjGUQJOZRHqoGNjNqgWy2jBKsPjxjGb6
	4jDJLSK0guCfSbW7iJWDk1LHO5E0CDA6ZxF/AFo2WW80oyClhgtJfVFXE2PHugqqzRMsvi/vbUM
	cXupb8OK9MHjpn9f0jgR7cbaetg==
X-Received: by 2002:a17:906:300f:b0:9ae:6a8b:f8aa with SMTP id 15-20020a170906300f00b009ae6a8bf8aamr7747678ejz.26.1696618344135;
        Fri, 06 Oct 2023 11:52:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGEYdkuIsSVenx/4uH2p+mA+oW9MGScE7Z/AddBzQwdbEUsftUik0ThWo7nIT0gm/cImU0pMg==
X-Received: by 2002:a17:906:300f:b0:9ae:6a8b:f8aa with SMTP id 15-20020a170906300f00b009ae6a8bf8aamr7747667ejz.26.1696618343885;
        Fri, 06 Oct 2023 11:52:23 -0700 (PDT)
Received: from localhost.localdomain ([109.183.6.197])
        by smtp.gmail.com with ESMTPSA id os5-20020a170906af6500b009b947f81c4asm3304741ejb.155.2023.10.06.11.52.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 11:52:23 -0700 (PDT)
From: Andrey Albershteyn <aalbersh@redhat.com>
To: linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	fsverity@lists.linux.dev
Cc: djwong@kernel.org,
	ebiggers@kernel.org,
	david@fromorbit.com,
	dchinner@redhat.com,
	Andrey Albershteyn <aalbersh@redhat.com>
Subject: [PATCH v3 06/28] fsverity: add drop_page() callout
Date: Fri,  6 Oct 2023 20:49:00 +0200
Message-Id: <20231006184922.252188-7-aalbersh@redhat.com>
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

Allow filesystem to make additional processing on verified pages
instead of just dropping a reference. This will be used by XFS for
internal buffer cache manipulation in further patches. The btrfs,
ext4, and f2fs just drop the reference.

Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
---
 fs/verity/read_metadata.c |  4 ++--
 fs/verity/verify.c        |  6 +++---
 include/linux/fsverity.h  | 33 +++++++++++++++++++++++++++++++++
 3 files changed, 38 insertions(+), 5 deletions(-)

diff --git a/fs/verity/read_metadata.c b/fs/verity/read_metadata.c
index f58432772d9e..8bd4b29a9a95 100644
--- a/fs/verity/read_metadata.c
+++ b/fs/verity/read_metadata.c
@@ -56,12 +56,12 @@ static int fsverity_read_merkle_tree(struct inode *inode,
 		virt = kmap_local_page(page);
 		if (copy_to_user(buf, virt + offs_in_page, bytes_to_copy)) {
 			kunmap_local(virt);
-			put_page(page);
+			fsverity_drop_page(inode, page);
 			err = -EFAULT;
 			break;
 		}
 		kunmap_local(virt);
-		put_page(page);
+		fsverity_drop_page(inode, page);
 
 		retval += bytes_to_copy;
 		buf += bytes_to_copy;
diff --git a/fs/verity/verify.c b/fs/verity/verify.c
index 904ccd7e8e16..2fe7bd57b16e 100644
--- a/fs/verity/verify.c
+++ b/fs/verity/verify.c
@@ -183,7 +183,7 @@ verify_data_block(struct inode *inode, struct fsverity_info *vi,
 			memcpy(_want_hash, haddr + hoffset, hsize);
 			want_hash = _want_hash;
 			kunmap_local(haddr);
-			put_page(hpage);
+			fsverity_drop_page(inode, hpage);
 			goto descend;
 		}
 		hblocks[level].page = hpage;
@@ -218,7 +218,7 @@ verify_data_block(struct inode *inode, struct fsverity_info *vi,
 		memcpy(_want_hash, haddr + hoffset, hsize);
 		want_hash = _want_hash;
 		kunmap_local(haddr);
-		put_page(hpage);
+		fsverity_drop_page(inode, hpage);
 	}
 
 	/* Finally, verify the data block. */
@@ -237,7 +237,7 @@ verify_data_block(struct inode *inode, struct fsverity_info *vi,
 error:
 	for (; level > 0; level--) {
 		kunmap_local(hblocks[level - 1].addr);
-		put_page(hblocks[level - 1].page);
+		fsverity_drop_page(inode, hblocks[level - 1].page);
 	}
 	return false;
 }
diff --git a/include/linux/fsverity.h b/include/linux/fsverity.h
index 1eb7eae580be..6514ed6b09b4 100644
--- a/include/linux/fsverity.h
+++ b/include/linux/fsverity.h
@@ -120,6 +120,16 @@ struct fsverity_operations {
 	 */
 	int (*write_merkle_tree_block)(struct inode *inode, const void *buf,
 				       u64 pos, unsigned int size);
+
+	/**
+	 * Release the reference to a Merkle tree page
+	 *
+	 * @page: the page to release
+	 *
+	 * This is called when fs-verity is done with a page obtained with
+	 * ->read_merkle_tree_page().
+	 */
+	void (*drop_page)(struct page *page);
 };
 
 #ifdef CONFIG_FS_VERITY
@@ -174,6 +184,24 @@ bool fsverity_verify_blocks(struct folio *folio, size_t len, size_t offset);
 void fsverity_verify_bio(struct bio *bio);
 void fsverity_enqueue_verify_work(struct work_struct *work);
 
+/**
+ * fsverity_drop_page() - drop page obtained with ->read_merkle_tree_page()
+ * @inode: inode in use for verification or metadata reading
+ * @page: page to be dropped
+ *
+ * Generic put_page() method. Calls out back to filesystem if ->drop_page() is
+ * set, otherwise just drops the reference to a page.
+ *
+ */
+static inline void fsverity_drop_page(struct inode *inode, struct page *page)
+{
+	if (inode->i_sb->s_vop->drop_page)
+		inode->i_sb->s_vop->drop_page(page);
+	else
+		put_page(page);
+}
+
+
 #else /* !CONFIG_FS_VERITY */
 
 static inline struct fsverity_info *fsverity_get_info(const struct inode *inode)
@@ -251,6 +279,11 @@ static inline void fsverity_enqueue_verify_work(struct work_struct *work)
 	WARN_ON_ONCE(1);
 }
 
+static inline void fsverity_drop_page(struct inode *inode, struct page *page)
+{
+	WARN_ON_ONCE(1);
+}
+
 #endif	/* !CONFIG_FS_VERITY */
 
 static inline bool fsverity_verify_folio(struct folio *folio)
-- 
2.40.1

