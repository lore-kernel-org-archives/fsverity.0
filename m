Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D67C2DA77F
	for <fsverity@lists.linux.dev>; Mon, 12 Jan 2026 14:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768229454; cv=none; b=J/af94zAAkyDqMa0IWgcsAFhFFQ6beHpvJvVSaSgIEcS/IxdbrBFxv7187Mo0XzjloCVBtnyb6wlZ2+FygF+yofM9wm1DJENAfoxBRe5Uo0zSqPCSbFgN4/WOfCS/fpxvRf67CJlyRS0ENbp/3TtzoeLcmGv6akYE3y5qNbfKmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768229454; c=relaxed/simple;
	bh=zUe+u05Ji70egxnDu2vRJL+W32xXvgDxlQ06l0qTwQ0=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=YJ//oscNxy0I+zRQY8jiWduJrlzd6s1GwaI21j1ToifhT5A91OjC5eVbgwZ1ZRMxHD71LbLfWmlReyjF5jKl5BC9zT1rRRD64oZRNdk9k9uihuJTkD1XNJNWZdSekWLAZmIORHV5X3gGdAP5tsE+cOhaztRcmYQxpYSWXNupksk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ip1baVrB; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ip1baVrB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768229452;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZFITs97XcCADGQCmQX9tBpBI7bVy5Dx+q3IqNAqa92M=;
	b=ip1baVrB71ZEa8AekAXmarMC1JAWN88/fi7FbmnUlpt8e2udG3jBUFFFN4JpNRAPxu30tU
	RHTn9Vbg/ASnXR3YVf3MTlA+bCl8efctSs9FL/qSdThT6maB8I1JPN9+T8CFFmaIYXFt5J
	EML1lOL26nof1s9xeTF7zLsdCGx+pZI=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-653-9PCWvTQqNBWfln_gx_DgFg-1; Mon, 12 Jan 2026 09:50:50 -0500
X-MC-Unique: 9PCWvTQqNBWfln_gx_DgFg-1
X-Mimecast-MFC-AGG-ID: 9PCWvTQqNBWfln_gx_DgFg_1768229449
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-64d1982d980so8559336a12.2
        for <fsverity@lists.linux.dev>; Mon, 12 Jan 2026 06:50:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768229449; x=1768834249;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZFITs97XcCADGQCmQX9tBpBI7bVy5Dx+q3IqNAqa92M=;
        b=DU9VDy/yqFZX8fUvdBTpYxY8GfqvRHXrVbaCsUblx6zArm4ONWTIn3ENC14WsPst1V
         hotUp4+M0osjRWFSGud4xvL3rTeGTi1BJBmmAMCPHGP8sRS/nHbMEKedIWr/OFfwSwLS
         +4JnMuvlcTgb1pHsXdx6muokAVIdJ2h5zIv74zsiOpjY4j8K2il+j27BuKMtrebtaBff
         5NlsQ1hcMXQiG2/K86CjPJZph3cePiUaB9fldQ8zLoLBuYnpeRl0lig5jKIwVcWbFzvK
         HC/aSO2/13aU9Ot7qO+7Q+sry2pIKfuNCPhtC1z/NnjX8Nrs+bXOEKC/KVXffP6p682G
         oZtA==
X-Gm-Message-State: AOJu0YwyZFypS47wIhv5xybPnp2k/w2LR7Pn4Ox2g+PoOJdiRAMOFmgl
	saAgOR1whXkw9SfI4lz3QKvZCzezWFJj8fmmvbR7DPlDTb28eX13mRBjrLJxigdRtF/4nE7sX6+
	qp4bZaI6ap7pSXueCvmYfNCWTcX2Kz73UGAjGY4h/GR37CDRClUQl4D2DNBFkOiiBrKgygfzGHp
	Cx7VjKCsMlOf2ZkF39PzQ4uXDTyO4OT1GaL6x0kMF4nN8=
X-Gm-Gg: AY/fxX56KXWsQu2WLLoTHGd7OQuDcQa5oOlW63BiLvs1grV1p1d/afTJQ4WNfdZr5gm
	ZrfVn8nmK/q3n0gYk76XDE5gXN1Brhhi4JMcIKVTTa3ZqTPmzeTi4SN3WCTmodkP7sBQKXb8xCx
	IQ5FL/pv9AXh2DFz8+Pn25dgM4+Ey0+1iCAPSFlMFbLuloZfWyDj+A2mszVJgD8dYU2wqpfMJqx
	AAnq18eYe6Olv6HionCjR2b6MHyoP7uV3K7D7P3WtIdg/LoWPXMfihvkbCBwiJ3Mq0OV8oZ+J6I
	Q1OBqs/KEu2k8UIwKhu5V9+F18yYxN8LKvfdFebCEZ+Z/OoMxeOSO1FrmB+gUb7Lb8VtCSEK+RE
	=
X-Received: by 2002:a05:6402:4492:b0:650:8563:fdbe with SMTP id 4fb4d7f45d1cf-65097e5af32mr15189051a12.23.1768229448787;
        Mon, 12 Jan 2026 06:50:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGFm1BBLk3K8B25WecjEZzInMYPlViDE/uDnc7pMiIiyegJFjXo23wj95dH4bSVilJP1fmQnQ==
X-Received: by 2002:a05:6402:4492:b0:650:8563:fdbe with SMTP id 4fb4d7f45d1cf-65097e5af32mr15189021a12.23.1768229448364;
        Mon, 12 Jan 2026 06:50:48 -0800 (PST)
Received: from thinky ([217.30.74.39])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507b9d4ed5sm17536558a12.11.2026.01.12.06.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 06:50:47 -0800 (PST)
From: Andrey Albershteyn <aalbersh@redhat.com>
X-Google-Original-From: Andrey Albershteyn <aalbersh@kernel.org>
Date: Mon, 12 Jan 2026 15:50:47 +0100
To: fsverity@lists.linux.dev, linux-xfs@vger.kernel.org, 
	ebiggers@kernel.org, linux-fsdevel@vger.kernel.org, aalbersh@kernel.org, 
	aalbersh@redhat.com, djwong@kernel.org
Cc: djwong@kernel.org, david@fromorbit.com, hch@lst.de
Subject: [PATCH v2 8/22] xfs: initialize fs-verity on file open and cleanup
 on inode destruction
Message-ID: <5rckitbnj3eqpeeiaw7u2jfvyk72lfkylg2r7mdtxmlu3qp7dx@t3pn5oelmkxe>
References: <cover.1768229271.patch-series@thinky>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <cover.1768229271.patch-series@thinky>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xBYwiqereUNgJV5BpVKTZniqtRMHTx9OmEsmjkXV8vI_1768229449
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

fs-verity will read and attach metadata (not the tree itself) from
a disk for those inodes which already have fs-verity enabled.

Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org>
Reviewed-by: Darrick J. Wong <djwong@kernel.org>
Signed-off-by: Darrick J. Wong <djwong@kernel.org>
---
 fs/xfs/xfs_file.c  | 8 ++++++++
 fs/xfs/xfs_super.c | 2 ++
 2 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/fs/xfs/xfs_file.c b/fs/xfs/xfs_file.c
index 7874cf745a..0c234ab449 100644
--- a/fs/xfs/xfs_file.c
+++ b/fs/xfs/xfs_file.c
@@ -36,6 +36,7 @@
 #include <linux/mman.h>
 #include <linux/fadvise.h>
 #include <linux/mount.h>
+#include <linux/fsverity.h>
 
 static const struct vm_operations_struct xfs_file_vm_ops;
 
@@ -1604,11 +1605,18 @@
 	struct inode	*inode,
 	struct file	*file)
 {
+	int		error;
+
 	if (xfs_is_shutdown(XFS_M(inode->i_sb)))
 		return -EIO;
 	file->f_mode |= FMODE_NOWAIT | FMODE_CAN_ODIRECT;
 	if (xfs_get_atomic_write_min(XFS_I(inode)) > 0)
 		file->f_mode |= FMODE_CAN_ATOMIC_WRITE;
+
+	error = fsverity_file_open(inode, file);
+	if (error)
+		return error;
+
 	return generic_file_open(inode, file);
 }
 
diff --git a/fs/xfs/xfs_super.c b/fs/xfs/xfs_super.c
index bc71aa9dce..10c6fc8d20 100644
--- a/fs/xfs/xfs_super.c
+++ b/fs/xfs/xfs_super.c
@@ -53,6 +53,7 @@
 #include <linux/magic.h>
 #include <linux/fs_context.h>
 #include <linux/fs_parser.h>
+#include <linux/fsverity.h>
 
 static const struct super_operations xfs_super_operations;
 
@@ -709,6 +710,7 @@
 	ASSERT(!rwsem_is_locked(&inode->i_rwsem));
 	XFS_STATS_INC(ip->i_mount, vn_rele);
 	XFS_STATS_INC(ip->i_mount, vn_remove);
+	fsverity_cleanup_inode(inode);
 	xfs_inode_mark_reclaimable(ip);
 }
 

-- 
- Andrey

