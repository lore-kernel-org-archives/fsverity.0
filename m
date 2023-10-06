Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88AD028DCF
	for <fsverity@lists.linux.dev>; Fri,  6 Oct 2023 18:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JFOFJ+cU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1696618371;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=etHlCA8T/PaxWUxEWZ1DvVJeeVyrnJ0a0ek/fvsTpN8=;
	b=JFOFJ+cUNEk/pFasWM8HxEKKB6ru9mh0eQbcLnmNw7vpnQWWd+qBiHalp+cTd6WFrs9O6O
	/h3PO/a3dxRUetwue81v4QYtdVifd13W5zZxB+7brBQPwJ0f9RsfoZLgVzs1FdtA3+ta8n
	fZZo1dx3JfmPjT4gteiejNMNbCwNFpc=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-623-I8pxdDUrPteJ-l_E-z_EAA-1; Fri, 06 Oct 2023 14:52:40 -0400
X-MC-Unique: I8pxdDUrPteJ-l_E-z_EAA-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-9ae0bf9c0a9so189229966b.3
        for <fsverity@lists.linux.dev>; Fri, 06 Oct 2023 11:52:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696618359; x=1697223159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=etHlCA8T/PaxWUxEWZ1DvVJeeVyrnJ0a0ek/fvsTpN8=;
        b=QsqH3tWpMXb4yEvdfmLJaP/9TrCUUkLiS+H6XCCDdYEff5PtUHEGTcE9r2irJyT44J
         TMwE6Ol52Hg1lbX/PgMigmBvPjl81LhhMTx0cK7TpocYeqeRwGnQ2xg2yWvO5FOQUhzo
         fT5Ptk/w3saME/xmkSxYVUp3C7YKIFnydHsImTjfsK2PX9cteT/g4iYV8b+RYJGHf5X4
         KFBsYLe3eQjCGagIsNfpkZ2x+toevY54p8NAXGxD5VcHKZ9iF3Pk8QNTYpuwp9mD9NGB
         gE4rFTM9JJCJ3j/Ir3o39oww0NadVB1YecyuzWdszCvvSKqPuXS6agK0OVed2shTAxGa
         vyUg==
X-Gm-Message-State: AOJu0Yy5ByzFG1SdGNsufjLIyp/mZMBvRBXwJYcpvtWnS+U6tL/AtxwS
	6jFMk4aAL5tFsLl4RoUoGcSiXjCqm6TZgl9GfT6P7vCw105uPEIQwIOEoMdcwBhudc7ZtVQVoqH
	LGdFcpbVRbAD6TFJq8Q==
X-Received: by 2002:a17:906:cc53:b0:9ae:5523:3f8e with SMTP id mm19-20020a170906cc5300b009ae55233f8emr8487893ejb.63.1696618359276;
        Fri, 06 Oct 2023 11:52:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF73s7VGFatKV6LUYuO61TYbYu4BE1wLl/SWf4Vq8QcPJ6yV/S+GMfoQzJ3iL6XWu4mnlQgEg==
X-Received: by 2002:a17:906:cc53:b0:9ae:5523:3f8e with SMTP id mm19-20020a170906cc5300b009ae55233f8emr8487881ejb.63.1696618359073;
        Fri, 06 Oct 2023 11:52:39 -0700 (PDT)
Received: from localhost.localdomain ([109.183.6.197])
        by smtp.gmail.com with ESMTPSA id os5-20020a170906af6500b009b947f81c4asm3304741ejb.155.2023.10.06.11.52.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 11:52:38 -0700 (PDT)
From: Andrey Albershteyn <aalbersh@redhat.com>
To: linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	fsverity@lists.linux.dev
Cc: djwong@kernel.org,
	ebiggers@kernel.org,
	david@fromorbit.com,
	dchinner@redhat.com,
	Andrey Albershteyn <aalbersh@redhat.com>
Subject: [PATCH v3 22/28] xfs: initialize fs-verity on file open and cleanup on inode destruction
Date: Fri,  6 Oct 2023 20:49:16 +0200
Message-Id: <20231006184922.252188-23-aalbersh@redhat.com>
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

fs-verity will read and attach metadata (not the tree itself) from
a disk for those inodes which already have fs-verity enabled.

Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
---
 fs/xfs/xfs_file.c  | 8 ++++++++
 fs/xfs/xfs_super.c | 2 ++
 2 files changed, 10 insertions(+)

diff --git a/fs/xfs/xfs_file.c b/fs/xfs/xfs_file.c
index 203700278ddb..a92c8197c26a 100644
--- a/fs/xfs/xfs_file.c
+++ b/fs/xfs/xfs_file.c
@@ -31,6 +31,7 @@
 #include <linux/mman.h>
 #include <linux/fadvise.h>
 #include <linux/mount.h>
+#include <linux/fsverity.h>
 
 static const struct vm_operations_struct xfs_file_vm_ops;
 
@@ -1191,10 +1192,17 @@ xfs_file_open(
 	struct inode	*inode,
 	struct file	*file)
 {
+	int		error = 0;
+
 	if (xfs_is_shutdown(XFS_M(inode->i_sb)))
 		return -EIO;
 	file->f_mode |= FMODE_NOWAIT | FMODE_BUF_RASYNC | FMODE_BUF_WASYNC |
 			FMODE_DIO_PARALLEL_WRITE | FMODE_CAN_ODIRECT;
+
+	error = fsverity_file_open(inode, file);
+	if (error)
+		return error;
+
 	return generic_file_open(inode, file);
 }
 
diff --git a/fs/xfs/xfs_super.c b/fs/xfs/xfs_super.c
index 3cdb642961f4..6a3b5285044a 100644
--- a/fs/xfs/xfs_super.c
+++ b/fs/xfs/xfs_super.c
@@ -47,6 +47,7 @@
 #include <linux/magic.h>
 #include <linux/fs_context.h>
 #include <linux/fs_parser.h>
+#include <linux/fsverity.h>
 
 static const struct super_operations xfs_super_operations;
 
@@ -673,6 +674,7 @@ xfs_fs_destroy_inode(
 	ASSERT(!rwsem_is_locked(&inode->i_rwsem));
 	XFS_STATS_INC(ip->i_mount, vn_rele);
 	XFS_STATS_INC(ip->i_mount, vn_remove);
+	fsverity_cleanup_inode(inode);
 	xfs_inode_mark_reclaimable(ip);
 }
 
-- 
2.40.1

