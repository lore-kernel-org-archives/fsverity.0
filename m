Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB05028DCF
	for <fsverity@lists.linux.dev>; Fri,  6 Oct 2023 18:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XoXCiXPN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1696618377;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K2a1ka+tlMbp95iffKcVgauxZIyVgsRitaQM9lBAQcY=;
	b=XoXCiXPNMgVBwMIycxEFcXOLFG1yHu/y595DlIDds5LtI3Q+4iESbbSwq7qra1eRSPMeLw
	kh7eCY6RfqKpwtBmHdBmQVWwfE1nCzVwfuoK/tlNH70FdXNXYqCRiJjooRwk8TbUWGvf5z
	nAY4n3NbBJdP9lw3Hjp0wvgjb6IQV/c=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-669-YSQIavq_Mz-MFe31CEVcVw-1; Fri, 06 Oct 2023 14:52:43 -0400
X-MC-Unique: YSQIavq_Mz-MFe31CEVcVw-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-9ae7663e604so206209566b.3
        for <fsverity@lists.linux.dev>; Fri, 06 Oct 2023 11:52:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696618362; x=1697223162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K2a1ka+tlMbp95iffKcVgauxZIyVgsRitaQM9lBAQcY=;
        b=l6TuxrPDEfal15JXQTxZ/XHG5cPbI4RSogoMQWqEV2UNUNt9hdw8+FfAt1ldoJsYk2
         M1cvdIBgwvgA5ogBfXVs6uf4OVw2SNWTk5ubQQQycbGFRYW5j6X3OoUrFqd64fGvKfgd
         v0rTV5SfPB9EbKepBhUmWR/zbmi71VH5q+YUp/QQtBsUDfDUeORkf8pT0NCMg8sugKBs
         UOjNusisGkj46dvRQhduP3Xkze0NgHtlq9R0qkr/0/Pu1p96DStKDIHf8TZjBnhmujCZ
         JAoySLQvyZyHr6116pWPDhUTZnnOYnXNsHRP2IbAMyPAgpd+k1NCwuT/xy9FVY2IiekP
         WhOQ==
X-Gm-Message-State: AOJu0YzLM/7ANMQ6W8oca/kF6eOjEQ57VRwMG4Wlythlgc4Fyc/CmiQA
	i3y4Gw1bwvOl+wOryrhvxCQK6O2Tb5T/9vhoYm3AXnxloiBZ0Ngd4mnmD3GBCHjT995g2vG8AjL
	cBjj4M329T1XZHX5a+A==
X-Received: by 2002:a17:907:7798:b0:9a9:f14a:22dc with SMTP id ky24-20020a170907779800b009a9f14a22dcmr8537038ejc.8.1696618362045;
        Fri, 06 Oct 2023 11:52:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEDmzO6vSvZU2JTL5iDr5tN04u9LkHfAu6/6JvVyBXYT0/dny1Yfl6boN9GHUcykT+FMFG9xA==
X-Received: by 2002:a17:907:7798:b0:9a9:f14a:22dc with SMTP id ky24-20020a170907779800b009a9f14a22dcmr8537025ejc.8.1696618361731;
        Fri, 06 Oct 2023 11:52:41 -0700 (PDT)
Received: from localhost.localdomain ([109.183.6.197])
        by smtp.gmail.com with ESMTPSA id os5-20020a170906af6500b009b947f81c4asm3304741ejb.155.2023.10.06.11.52.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 11:52:41 -0700 (PDT)
From: Andrey Albershteyn <aalbersh@redhat.com>
To: linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	fsverity@lists.linux.dev
Cc: djwong@kernel.org,
	ebiggers@kernel.org,
	david@fromorbit.com,
	dchinner@redhat.com,
	Andrey Albershteyn <aalbersh@redhat.com>
Subject: [PATCH v3 25/28] xfs: add fs-verity support
Date: Fri,  6 Oct 2023 20:49:19 +0200
Message-Id: <20231006184922.252188-26-aalbersh@redhat.com>
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

Add integration with fs-verity. The XFS store fs-verity metadata in
the extended attributes. The metadata consist of verity descriptor
and Merkle tree blocks.

The descriptor is stored under "verity_descriptor" extended
attribute. The Merkle tree blocks are stored under binary indexes.

When fs-verity is enabled on an inode, the XFS_IVERITY_CONSTRUCTION
flag is set meaning that the Merkle tree is being build. The
initialization ends with storing of verity descriptor and setting
inode on-disk flag (XFS_DIFLAG2_VERITY).

The verification on read is done in iomap. Based on the inode verity
flag the IOMAP_F_READ_VERITY is set in xfs_read_iomap_begin() to let
iomap know that verification is needed.

Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
---
 fs/xfs/Makefile                 |   1 +
 fs/xfs/libxfs/xfs_attr.c        |  13 ++
 fs/xfs/libxfs/xfs_attr_leaf.c   |  17 ++-
 fs/xfs/libxfs/xfs_attr_remote.c |   8 +-
 fs/xfs/libxfs/xfs_da_format.h   |  16 ++
 fs/xfs/xfs_inode.h              |   3 +-
 fs/xfs/xfs_iomap.c              |   3 +
 fs/xfs/xfs_ondisk.h             |   4 +
 fs/xfs/xfs_super.c              |   8 +
 fs/xfs/xfs_verity.c             | 257 ++++++++++++++++++++++++++++++++
 fs/xfs/xfs_verity.h             |  37 +++++
 11 files changed, 360 insertions(+), 7 deletions(-)
 create mode 100644 fs/xfs/xfs_verity.c
 create mode 100644 fs/xfs/xfs_verity.h

diff --git a/fs/xfs/Makefile b/fs/xfs/Makefile
index 7762c01a85cf..c1a58ed8b419 100644
--- a/fs/xfs/Makefile
+++ b/fs/xfs/Makefile
@@ -130,6 +130,7 @@ xfs-$(CONFIG_XFS_POSIX_ACL)	+= xfs_acl.o
 xfs-$(CONFIG_SYSCTL)		+= xfs_sysctl.o
 xfs-$(CONFIG_COMPAT)		+= xfs_ioctl32.o
 xfs-$(CONFIG_EXPORTFS_BLOCK_OPS)	+= xfs_pnfs.o
+xfs-$(CONFIG_FS_VERITY)		+= xfs_verity.o
 
 # notify failure
 ifeq ($(CONFIG_MEMORY_FAILURE),y)
diff --git a/fs/xfs/libxfs/xfs_attr.c b/fs/xfs/libxfs/xfs_attr.c
index 298b74245267..25e1f829e01e 100644
--- a/fs/xfs/libxfs/xfs_attr.c
+++ b/fs/xfs/libxfs/xfs_attr.c
@@ -26,6 +26,7 @@
 #include "xfs_trace.h"
 #include "xfs_attr_item.h"
 #include "xfs_xattr.h"
+#include "xfs_verity.h"
 
 struct kmem_cache		*xfs_attr_intent_cache;
 
@@ -1635,6 +1636,18 @@ xfs_attr_namecheck(
 		return xfs_verify_pptr(mp, (struct xfs_parent_name_rec *)name);
 	}
 
+	if (flags & XFS_ATTR_VERITY) {
+		/* Merkle tree pages are stored under u64 indexes */
+		if (length == sizeof(struct xfs_fsverity_merkle_key))
+			return true;
+
+		/* Verity descriptor blocks are held in a named attribute. */
+		if (length == XFS_VERITY_DESCRIPTOR_NAME_LEN)
+			return true;
+
+		return false;
+	}
+
 	return xfs_str_attr_namecheck(name, length);
 }
 
diff --git a/fs/xfs/libxfs/xfs_attr_leaf.c b/fs/xfs/libxfs/xfs_attr_leaf.c
index a84795d70de1..36d1f88d972f 100644
--- a/fs/xfs/libxfs/xfs_attr_leaf.c
+++ b/fs/xfs/libxfs/xfs_attr_leaf.c
@@ -29,6 +29,7 @@
 #include "xfs_log.h"
 #include "xfs_ag.h"
 #include "xfs_errortag.h"
+#include "xfs_verity.h"
 
 
 /*
@@ -518,7 +519,12 @@ xfs_attr_copy_value(
 		return -ERANGE;
 	}
 
-	if (!args->value) {
+	/*
+	 * We don't want to allocate memory for fs-verity Merkle tree blocks
+	 * (fs-verity descriptor is fine though). They will be stored in
+	 * underlying xfs_buf
+	 */
+	if (!args->value && !xfs_verity_merkle_block(args)) {
 		args->value = kvmalloc(valuelen, GFP_KERNEL | __GFP_NOLOCKDEP);
 		if (!args->value)
 			return -ENOMEM;
@@ -537,7 +543,14 @@ xfs_attr_copy_value(
 	 */
 	if (!value)
 		return -EINVAL;
-	memcpy(args->value, value, valuelen);
+	/*
+	 * We won't copy Merkle tree block to the args->value as we want it be
+	 * in the xfs_buf. And we didn't allocate any memory in args->value.
+	 */
+	if (xfs_verity_merkle_block(args))
+		args->value = value;
+	else
+		memcpy(args->value, value, valuelen);
 	return 0;
 }
 
diff --git a/fs/xfs/libxfs/xfs_attr_remote.c b/fs/xfs/libxfs/xfs_attr_remote.c
index 7657daf7cff3..7b4424e3454b 100644
--- a/fs/xfs/libxfs/xfs_attr_remote.c
+++ b/fs/xfs/libxfs/xfs_attr_remote.c
@@ -22,6 +22,7 @@
 #include "xfs_attr_remote.h"
 #include "xfs_trace.h"
 #include "xfs_error.h"
+#include "xfs_verity.h"
 
 #define ATTR_RMTVALUE_MAPSIZE	1	/* # of map entries at once */
 
@@ -401,11 +402,10 @@ xfs_attr_rmtval_get(
 	ASSERT(args->rmtvaluelen == args->valuelen);
 
 	/*
-	 * We also check for _OP_BUFFER as we want to trigger on
-	 * verity blocks only, not on verity_descriptor
+	 * For fs-verity we want additional space in the xfs_buf. This space is
+	 * used to copy xattr value without leaf headers (crc header).
 	 */
-	if (args->attr_filter & XFS_ATTR_VERITY &&
-			args->op_flags & XFS_DA_OP_BUFFER)
+	if (xfs_verity_merkle_block(args))
 		flags = XBF_DOUBLE_ALLOC;
 
 	valuelen = args->rmtvaluelen;
diff --git a/fs/xfs/libxfs/xfs_da_format.h b/fs/xfs/libxfs/xfs_da_format.h
index b56bdae83563..a678ad5e4a08 100644
--- a/fs/xfs/libxfs/xfs_da_format.h
+++ b/fs/xfs/libxfs/xfs_da_format.h
@@ -903,4 +903,20 @@ struct xfs_parent_name_irec {
 	uint8_t			p_namelen;
 };
 
+/*
+ * fs-verity attribute name format
+ *
+ * Merkle tree blocks are stored under extended attributes of the inode. The
+ * name of the attributes are offsets into merkle tree.
+ */
+struct xfs_fsverity_merkle_key {
+	__be64 merkleoff;
+};
+
+static inline void
+xfs_fsverity_merkle_key_to_disk(struct xfs_fsverity_merkle_key *key, loff_t pos)
+{
+	key->merkleoff = cpu_to_be64(pos);
+}
+
 #endif /* __XFS_DA_FORMAT_H__ */
diff --git a/fs/xfs/xfs_inode.h b/fs/xfs/xfs_inode.h
index 0c5bdb91152e..e6c30a69e8d1 100644
--- a/fs/xfs/xfs_inode.h
+++ b/fs/xfs/xfs_inode.h
@@ -342,7 +342,8 @@ static inline bool xfs_inode_has_large_extent_counts(struct xfs_inode *ip)
  * inactivation completes, both flags will be cleared and the inode is a
  * plain old IRECLAIMABLE inode.
  */
-#define XFS_INACTIVATING	(1 << 13)
+#define XFS_INACTIVATING		(1 << 13)
+#define XFS_IVERITY_CONSTRUCTION	(1 << 14) /* merkle tree construction */
 
 /* Quotacheck is running but inode has not been added to quota counts. */
 #define XFS_IQUOTAUNCHECKED	(1 << 14)
diff --git a/fs/xfs/xfs_iomap.c b/fs/xfs/xfs_iomap.c
index 18c8f168b153..80b249c42067 100644
--- a/fs/xfs/xfs_iomap.c
+++ b/fs/xfs/xfs_iomap.c
@@ -132,6 +132,9 @@ xfs_bmbt_to_iomap(
 	    (ip->i_itemp->ili_fsync_fields & ~XFS_ILOG_TIMESTAMP))
 		iomap->flags |= IOMAP_F_DIRTY;
 
+	if (fsverity_active(VFS_I(ip)))
+		iomap->flags |= IOMAP_F_READ_VERITY;
+
 	iomap->validity_cookie = sequence_cookie;
 	iomap->folio_ops = &xfs_iomap_folio_ops;
 	return 0;
diff --git a/fs/xfs/xfs_ondisk.h b/fs/xfs/xfs_ondisk.h
index c4cc99b70dd3..accbbdeb7624 100644
--- a/fs/xfs/xfs_ondisk.h
+++ b/fs/xfs/xfs_ondisk.h
@@ -190,6 +190,10 @@ xfs_check_ondisk_structs(void)
 	XFS_CHECK_VALUE(XFS_DQ_BIGTIME_EXPIRY_MIN << XFS_DQ_BIGTIME_SHIFT, 4);
 	XFS_CHECK_VALUE(XFS_DQ_BIGTIME_EXPIRY_MAX << XFS_DQ_BIGTIME_SHIFT,
 			16299260424LL);
+
+	/* fs-verity descriptor xattr name */
+	XFS_CHECK_VALUE(strlen(XFS_VERITY_DESCRIPTOR_NAME),
+			XFS_VERITY_DESCRIPTOR_NAME_LEN);
 }
 
 #endif /* __XFS_ONDISK_H */
diff --git a/fs/xfs/xfs_super.c b/fs/xfs/xfs_super.c
index 6a3b5285044a..f32392add622 100644
--- a/fs/xfs/xfs_super.c
+++ b/fs/xfs/xfs_super.c
@@ -30,6 +30,7 @@
 #include "xfs_filestream.h"
 #include "xfs_quota.h"
 #include "xfs_sysfs.h"
+#include "xfs_verity.h"
 #include "xfs_ondisk.h"
 #include "xfs_rmap_item.h"
 #include "xfs_refcount_item.h"
@@ -1526,6 +1527,9 @@ xfs_fs_fill_super(
 	sb->s_quota_types = QTYPE_MASK_USR | QTYPE_MASK_GRP | QTYPE_MASK_PRJ;
 #endif
 	sb->s_op = &xfs_super_operations;
+#ifdef CONFIG_FS_VERITY
+	sb->s_vop = &xfs_verity_ops;
+#endif
 
 	/*
 	 * Delay mount work if the debug hook is set. This is debug
@@ -1735,6 +1739,10 @@ xfs_fs_fill_super(
 		goto out_filestream_unmount;
 	}
 
+	if (xfs_has_verity(mp))
+		xfs_alert(mp,
+	"EXPERIMENTAL fs-verity feature in use. Use at your own risk!");
+
 	error = xfs_mountfs(mp);
 	if (error)
 		goto out_filestream_unmount;
diff --git a/fs/xfs/xfs_verity.c b/fs/xfs/xfs_verity.c
new file mode 100644
index 000000000000..a2db56974122
--- /dev/null
+++ b/fs/xfs/xfs_verity.c
@@ -0,0 +1,257 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2023 Red Hat, Inc.
+ */
+#include "xfs.h"
+#include "xfs_shared.h"
+#include "xfs_format.h"
+#include "xfs_da_format.h"
+#include "xfs_da_btree.h"
+#include "xfs_trans_resv.h"
+#include "xfs_mount.h"
+#include "xfs_inode.h"
+#include "xfs_attr.h"
+#include "xfs_verity.h"
+#include "xfs_bmap_util.h"
+#include "xfs_log_format.h"
+#include "xfs_trans.h"
+
+static int
+xfs_get_verity_descriptor(
+	struct inode		*inode,
+	void			*buf,
+	size_t			buf_size)
+{
+	struct xfs_inode	*ip = XFS_I(inode);
+	int			error = 0;
+	struct xfs_da_args	args = {
+		.dp		= ip,
+		.attr_filter	= XFS_ATTR_VERITY,
+		.name		= (const uint8_t *)XFS_VERITY_DESCRIPTOR_NAME,
+		.namelen	= XFS_VERITY_DESCRIPTOR_NAME_LEN,
+		.value		= buf,
+		.valuelen	= buf_size,
+	};
+
+	/*
+	 * The fact that (returned attribute size) == (provided buf_size) is
+	 * checked by xfs_attr_copy_value() (returns -ERANGE)
+	 */
+	error = xfs_attr_get(&args);
+	if (error)
+		return error;
+
+	return args.valuelen;
+}
+
+static int
+xfs_begin_enable_verity(
+	struct file	    *filp)
+{
+	struct inode	    *inode = file_inode(filp);
+	struct xfs_inode    *ip = XFS_I(inode);
+	int		    error = 0;
+
+	ASSERT(xfs_isilocked(ip, XFS_IOLOCK_EXCL));
+
+	if (IS_DAX(inode))
+		return -EINVAL;
+
+	if (xfs_iflags_test_and_set(ip, XFS_IVERITY_CONSTRUCTION))
+		return -EBUSY;
+
+	return error;
+}
+
+static int
+xfs_drop_merkle_tree(
+	struct xfs_inode	*ip,
+	u64			merkle_tree_size,
+	u8			log_blocksize)
+{
+	struct xfs_fsverity_merkle_key	name;
+	int			error = 0, index;
+	u64			offset = 0;
+	struct xfs_da_args	args = {
+		.dp		= ip,
+		.whichfork	= XFS_ATTR_FORK,
+		.attr_filter	= XFS_ATTR_VERITY,
+		.namelen	= sizeof(struct xfs_fsverity_merkle_key),
+		/* NULL value make xfs_attr_set remove the attr */
+		.value		= NULL,
+	};
+
+	for (index = 1; offset < merkle_tree_size; index++) {
+		xfs_fsverity_merkle_key_to_disk(&name, offset);
+		args.name = (const uint8_t *)&name.merkleoff;
+		args.attr_filter = XFS_ATTR_VERITY;
+		error = xfs_attr_set(&args);
+		offset = index << log_blocksize;
+	}
+
+	args.name = (const uint8_t *)XFS_VERITY_DESCRIPTOR_NAME;
+	args.namelen = XFS_VERITY_DESCRIPTOR_NAME_LEN;
+	args.attr_filter = XFS_ATTR_VERITY;
+	error = xfs_attr_set(&args);
+
+	return error;
+}
+
+static int
+xfs_end_enable_verity(
+	struct file		*filp,
+	const void		*desc,
+	size_t			desc_size,
+	u64			merkle_tree_size,
+	u8			log_blocksize)
+{
+	struct inode		*inode = file_inode(filp);
+	struct xfs_inode	*ip = XFS_I(inode);
+	struct xfs_mount	*mp = ip->i_mount;
+	struct xfs_trans	*tp;
+	struct xfs_da_args	args = {
+		.dp		= ip,
+		.whichfork	= XFS_ATTR_FORK,
+		.attr_filter	= XFS_ATTR_VERITY,
+		.attr_flags	= XATTR_CREATE,
+		.name		= (const uint8_t *)XFS_VERITY_DESCRIPTOR_NAME,
+		.namelen	= XFS_VERITY_DESCRIPTOR_NAME_LEN,
+		.value		= (void *)desc,
+		.valuelen	= desc_size,
+	};
+	int			error = 0;
+
+	ASSERT(xfs_isilocked(ip, XFS_IOLOCK_EXCL));
+
+	/* fs-verity failed, just cleanup */
+	if (desc == NULL)
+		goto out;
+
+	error = xfs_attr_set(&args);
+	if (error)
+		goto out;
+
+	/* Set fsverity inode flag */
+	error = xfs_trans_alloc_inode(ip, &M_RES(mp)->tr_ichange,
+			0, 0, false, &tp);
+	if (error)
+		goto out;
+
+	/*
+	 * Ensure that we've persisted the verity information before we enable
+	 * it on the inode and tell the caller we have sealed the inode.
+	 */
+	ip->i_diflags2 |= XFS_DIFLAG2_VERITY;
+
+	xfs_trans_log_inode(tp, ip, XFS_ILOG_CORE);
+	xfs_trans_set_sync(tp);
+
+	error = xfs_trans_commit(tp);
+	xfs_iunlock(ip, XFS_ILOCK_EXCL);
+
+	if (!error)
+		inode->i_flags |= S_VERITY;
+
+out:
+	if (error)
+		WARN_ON_ONCE(xfs_drop_merkle_tree(ip, merkle_tree_size,
+						  log_blocksize));
+
+	xfs_iflags_clear(ip, XFS_IVERITY_CONSTRUCTION);
+	return error;
+}
+
+int
+xfs_read_merkle_tree_block(
+	struct inode		*inode,
+	unsigned int		pos,
+	struct fsverity_block	*block,
+	unsigned long		num_ra_pages)
+{
+	struct xfs_inode	*ip = XFS_I(inode);
+	struct xfs_fsverity_merkle_key name;
+	int			error = 0;
+	struct xfs_da_args	args = {
+		.dp		= ip,
+		.attr_filter	= XFS_ATTR_VERITY,
+		.namelen	= sizeof(struct xfs_fsverity_merkle_key),
+	};
+	xfs_fsverity_merkle_key_to_disk(&name, pos);
+	args.name = (const uint8_t *)&name.merkleoff;
+
+	error = xfs_attr_get(&args);
+	if (error)
+		goto out;
+
+	WARN_ON_ONCE(!args.valuelen);
+
+	/* now we also want to get underlying xfs_buf */
+	args.op_flags = XFS_DA_OP_BUFFER;
+	error = xfs_attr_get(&args);
+	if (error)
+		goto out;
+
+	block->kaddr = args.value;
+	block->len = args.valuelen;
+	block->cached = args.bp->b_flags & XBF_VERITY_CHECKED;
+	block->context = args.bp;
+
+	return error;
+
+out:
+	kmem_free(args.value);
+	if (args.bp)
+		xfs_buf_rele(args.bp);
+	return error;
+}
+
+static int
+xfs_write_merkle_tree_block(
+	struct inode		*inode,
+	const void		*buf,
+	u64			pos,
+	unsigned int		size)
+{
+	struct xfs_inode	*ip = XFS_I(inode);
+	struct xfs_fsverity_merkle_key	name;
+	struct xfs_da_args	args = {
+		.dp		= ip,
+		.whichfork	= XFS_ATTR_FORK,
+		.attr_filter	= XFS_ATTR_VERITY,
+		.attr_flags	= XATTR_CREATE,
+		.namelen	= sizeof(struct xfs_fsverity_merkle_key),
+		.value		= (void *)buf,
+		.valuelen	= size,
+	};
+
+	xfs_fsverity_merkle_key_to_disk(&name, pos);
+	args.name = (const uint8_t *)&name.merkleoff;
+
+	return xfs_attr_set(&args);
+}
+
+static void
+xfs_drop_block(
+	struct fsverity_block	*block)
+{
+	struct xfs_buf		*buf;
+
+	ASSERT(block != NULL);
+
+	buf = (struct xfs_buf *)block->context;
+
+	if (block->cached)
+		buf->b_flags |= XBF_VERITY_CHECKED;
+	xfs_buf_rele(buf);
+
+	kunmap_local(block->kaddr);
+}
+
+const struct fsverity_operations xfs_verity_ops = {
+	.begin_enable_verity		= &xfs_begin_enable_verity,
+	.end_enable_verity		= &xfs_end_enable_verity,
+	.get_verity_descriptor		= &xfs_get_verity_descriptor,
+	.read_merkle_tree_block		= &xfs_read_merkle_tree_block,
+	.write_merkle_tree_block	= &xfs_write_merkle_tree_block,
+	.drop_block			= &xfs_drop_block,
+};
diff --git a/fs/xfs/xfs_verity.h b/fs/xfs/xfs_verity.h
new file mode 100644
index 000000000000..0f32fd212091
--- /dev/null
+++ b/fs/xfs/xfs_verity.h
@@ -0,0 +1,37 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2022 Red Hat, Inc.
+ */
+#ifndef __XFS_VERITY_H__
+#define __XFS_VERITY_H__
+
+#include "xfs.h"
+#include "xfs_da_format.h"
+#include "xfs_da_btree.h"
+#include <linux/fsverity.h>
+
+#define XFS_VERITY_DESCRIPTOR_NAME "verity_descriptor"
+#define XFS_VERITY_DESCRIPTOR_NAME_LEN 17
+
+static inline bool
+xfs_verity_merkle_block(
+		struct xfs_da_args *args)
+{
+	if (!(args->attr_filter & XFS_ATTR_VERITY))
+		return false;
+
+	if (!(args->op_flags & XFS_DA_OP_BUFFER))
+		return false;
+
+	if (args->valuelen < 1024 || args->valuelen > PAGE_SIZE ||
+			!is_power_of_2(args->valuelen))
+		return false;
+
+	return true;
+}
+
+#ifdef CONFIG_FS_VERITY
+extern const struct fsverity_operations xfs_verity_ops;
+#endif	/* CONFIG_FS_VERITY */
+
+#endif	/* __XFS_VERITY_H__ */
-- 
2.40.1

