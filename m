Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF393E487
	for <fsverity@lists.linux.dev>; Mon, 12 Feb 2024 17:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707757202; cv=none; b=rKufShnpotSrtTokpe8K3Rb1yRTcalPxTgZhywR2KjudO8UYef4wMpgi89EoSmpnl6sXtdsFN9x8ZUVhte7yLnBmgIxswXoLsJAbudJXNbQA58QFQaY4KUz/Bgc7fGke07JxPOhf+SKiy/UB3miZJwEVyRpED42OFZfTFk+NvFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707757202; c=relaxed/simple;
	bh=J8eqmJ+xrgEjOXP2VKM/OiQv88UWMfaFDCsYsiGjLNY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Kx8UgGYmXs6QJHwwg7XMpzKGwhfM+5+CnzD+dasxan3RzQxmHm6vPX/NV58X+oyq1aet4Qo4qmfQMsbKC8HYEVa+m6MozS3vo5d4K12yf+JjhDrMylM1CEnchpoBcCBU3hkr5iDTyFkTyU5jyWKkclAGAPLiKewCgZtKXtuVWmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KMpX+AW3; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KMpX+AW3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707757199;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Tj+M9muz5Mq0wRvQVjpVNnfnNXBZ0GExMp5ECK241aI=;
	b=KMpX+AW3k0iqxb+VAgtT3loxvnOumkeJGH2ghIsNRBd1jewvQuuGguBc87p9me4ruz5jdx
	oD6z3QpW5sbDA1s1Io7XbbDfOmCiIYonL3RNjzMcHKqUk5rml2vDkTVzTKx7RG8mIh8Lci
	caeIpquHdKucNgKxOKSE5ENgrOdAHEE=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-394-ybcRP213PGWqX3ZcZ_klqQ-1; Mon, 12 Feb 2024 11:59:58 -0500
X-MC-Unique: ybcRP213PGWqX3ZcZ_klqQ-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-55ffcfed2ffso4899111a12.0
        for <fsverity@lists.linux.dev>; Mon, 12 Feb 2024 08:59:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707757196; x=1708361996;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tj+M9muz5Mq0wRvQVjpVNnfnNXBZ0GExMp5ECK241aI=;
        b=qiyw/HNeOyMcleKQdZfOx3KVsXcFwzbJa02+RB9orCHZ3dxAB4u3y4PgUChHSDN+e9
         uZuoH5YXcT/+UEba9jcgniB/4wXKQG2M36d0DJBOZ6LkPT/TtVQ07/EdTG0+W+kvlT63
         Byhy9dlmf8hFrX4SPfp0ruYjGHHINPgGfSXbwwD776LXoaegfsZiaVyS4hD6o+j1Fs0j
         G6QvcSLWZOO7Mud3uMBqA3WB98X9WWeXRD48eKi3u7vBQh6OlaCpsfQ4kukGhDqLZugl
         w4n47VtMtgUEuvYZb4mxYLa2iahAYOB/r4Zumxe5IuvTZEgMQLwktruOmYUV6/9sTnXC
         Iwzg==
X-Gm-Message-State: AOJu0Yw+rc/XShAcLAmQaErZKfcbP1pPXBgEdAv5DXfQoxQ1nOBoHzXB
	oJukwVWFi3LRFTmaSegd4pa5yGu7At9ZKV3UDYXpWxuFO+Yifs57IxRI0dixnj8siHXEvxtvKN7
	+nluRQWtD3hrOjIgqjyYxDcDHgliSaEUSaPxari5F5jJZDL+888rg6otnuFE/R2S3DdFrKXd2pC
	xUw3vhT40qCb0ROxZSPSp36Uybh4wmhWiG0EfmQFY=
X-Received: by 2002:a05:6402:643:b0:561:a278:db1d with SMTP id u3-20020a056402064300b00561a278db1dmr67929edx.6.1707757196616;
        Mon, 12 Feb 2024 08:59:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEtqgz4uDExeajTYum89SlbgYY0K3Z01N1uVXi9SYRLiSvtRtku9Z+tCv2eTqpRFWJ/gbf9fg==
X-Received: by 2002:a05:6402:643:b0:561:a278:db1d with SMTP id u3-20020a056402064300b00561a278db1dmr67909edx.6.1707757196375;
        Mon, 12 Feb 2024 08:59:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXd8xaYpRWEUrz+josrTDL3E9m0a+PSI6wgXDuVhsf3ik78yVwT2Ddbg3N5a663Pq2+tpp6LpEMQlBz08yajX0H7kOwxBeuZdhVdQPzfxc+WqGEDp4BbZLcDH7J/vo26O5JT9BJQYaQ5GHeJmXRxLSTy9tSrH3cdl3PvAgFyDxa7FiOozrc3PfBWwJFQdz6ZJWpICF6sP79f5bYix07U88Jvt8Gejd0cC7N
Received: from thinky.redhat.com ([109.183.6.197])
        by smtp.gmail.com with ESMTPSA id 14-20020a0564021f4e00b0056176e95a88sm2620261edz.32.2024.02.12.08.59.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 08:59:55 -0800 (PST)
From: Andrey Albershteyn <aalbersh@redhat.com>
To: fsverity@lists.linux.dev,
	linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	chandan.babu@oracle.com,
	djwong@kernel.org,
	ebiggers@kernel.org
Cc: Andrey Albershteyn <aalbersh@redhat.com>
Subject: [PATCH v4 06/25] fsverity: pass log_blocksize to end_enable_verity()
Date: Mon, 12 Feb 2024 17:58:03 +0100
Message-Id: <20240212165821.1901300-7-aalbersh@redhat.com>
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

XFS will need to know log_blocksize to remove the tree in case of an
error. The size is needed to calculate offsets of particular Merkle
tree blocks.

Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
---
 fs/btrfs/verity.c        | 4 +++-
 fs/ext4/verity.c         | 3 ++-
 fs/f2fs/verity.c         | 3 ++-
 fs/verity/enable.c       | 6 ++++--
 include/linux/fsverity.h | 4 +++-
 5 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/fs/btrfs/verity.c b/fs/btrfs/verity.c
index 66e2270b0dae..84e9b1480241 100644
--- a/fs/btrfs/verity.c
+++ b/fs/btrfs/verity.c
@@ -621,6 +621,7 @@ static int btrfs_begin_enable_verity(struct file *filp)
  * @desc:              verity descriptor to write out (NULL in error conditions)
  * @desc_size:         size of the verity descriptor (variable with signatures)
  * @merkle_tree_size:  size of the merkle tree in bytes
+ * @tree_blocksize:    size of the Merkle tree block
  *
  * If desc is null, then VFS is signaling an error occurred during verity
  * enable, and we should try to rollback. Otherwise, attempt to finish verity.
@@ -628,7 +629,8 @@ static int btrfs_begin_enable_verity(struct file *filp)
  * Returns 0 on success, negative error code on error.
  */
 static int btrfs_end_enable_verity(struct file *filp, const void *desc,
-				   size_t desc_size, u64 merkle_tree_size)
+				   size_t desc_size, u64 merkle_tree_size,
+				   unsigned int tree_blocksize)
 {
 	struct btrfs_inode *inode = BTRFS_I(file_inode(filp));
 	int ret = 0;
diff --git a/fs/ext4/verity.c b/fs/ext4/verity.c
index 2f37e1ea3955..da2095a81349 100644
--- a/fs/ext4/verity.c
+++ b/fs/ext4/verity.c
@@ -189,7 +189,8 @@ static int ext4_write_verity_descriptor(struct inode *inode, const void *desc,
 }
 
 static int ext4_end_enable_verity(struct file *filp, const void *desc,
-				  size_t desc_size, u64 merkle_tree_size)
+				  size_t desc_size, u64 merkle_tree_size,
+				  unsigned int tree_blocksize)
 {
 	struct inode *inode = file_inode(filp);
 	const int credits = 2; /* superblock and inode for ext4_orphan_del() */
diff --git a/fs/f2fs/verity.c b/fs/f2fs/verity.c
index 4fc95f353a7a..b4461b9f47a3 100644
--- a/fs/f2fs/verity.c
+++ b/fs/f2fs/verity.c
@@ -144,7 +144,8 @@ static int f2fs_begin_enable_verity(struct file *filp)
 }
 
 static int f2fs_end_enable_verity(struct file *filp, const void *desc,
-				  size_t desc_size, u64 merkle_tree_size)
+				  size_t desc_size, u64 merkle_tree_size,
+				  unsigned int tree_blocksize)
 {
 	struct inode *inode = file_inode(filp);
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
diff --git a/fs/verity/enable.c b/fs/verity/enable.c
index c284f46d1b53..04e060880b79 100644
--- a/fs/verity/enable.c
+++ b/fs/verity/enable.c
@@ -274,7 +274,8 @@ static int enable_verity(struct file *filp,
 	 * Serialized with ->begin_enable_verity() by the inode lock.
 	 */
 	inode_lock(inode);
-	err = vops->end_enable_verity(filp, desc, desc_size, params.tree_size);
+	err = vops->end_enable_verity(filp, desc, desc_size, params.tree_size,
+				      params.block_size);
 	inode_unlock(inode);
 	if (err) {
 		fsverity_err(inode, "%ps() failed with err %d",
@@ -300,7 +301,8 @@ static int enable_verity(struct file *filp,
 
 rollback:
 	inode_lock(inode);
-	(void)vops->end_enable_verity(filp, NULL, 0, params.tree_size);
+	(void)vops->end_enable_verity(filp, NULL, 0, params.tree_size,
+				      params.block_size);
 	inode_unlock(inode);
 	goto out;
 }
diff --git a/include/linux/fsverity.h b/include/linux/fsverity.h
index 1eb7eae580be..ab7b0772899b 100644
--- a/include/linux/fsverity.h
+++ b/include/linux/fsverity.h
@@ -51,6 +51,7 @@ struct fsverity_operations {
 	 * @desc: the verity descriptor to write, or NULL on failure
 	 * @desc_size: size of verity descriptor, or 0 on failure
 	 * @merkle_tree_size: total bytes the Merkle tree took up
+	 * @tree_blocksize: size of the Merkle tree block
 	 *
 	 * If desc == NULL, then enabling verity failed and the filesystem only
 	 * must do any necessary cleanups.  Else, it must also store the given
@@ -65,7 +66,8 @@ struct fsverity_operations {
 	 * Return: 0 on success, -errno on failure
 	 */
 	int (*end_enable_verity)(struct file *filp, const void *desc,
-				 size_t desc_size, u64 merkle_tree_size);
+				 size_t desc_size, u64 merkle_tree_size,
+				 unsigned int tree_blocksize);
 
 	/**
 	 * Get the verity descriptor of the given inode.
-- 
2.42.0

