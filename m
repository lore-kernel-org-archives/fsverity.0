Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A44C27FB34
	for <fsverity@lists.linux.dev>; Mon, 28 Jul 2025 20:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753734703; cv=none; b=Wl99SQLdPz4JVwy5Qps1/u9OMR2yEH9L4csWjB1U2YY8rVCmtSpSMzoiM2M1yrCHnbYmXEMKxNRF4FJDLsdhjj+uDxZxYw1VbeX69VSf23wRG8xuXcziNNdu+0r1Z4UspYpDAzo4avBnNnHcef7Ovn6tZaMpAyagL3Y+RtYlCpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753734703; c=relaxed/simple;
	bh=g2kUFE2cbPGJe3S5Il4ER1RFhvk8KicxvvkVs0nPlcc=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=SYcIQLNyBBclcdxpAq+ZRg3aW05OZDCon9gcjl1AbT8bTYcchViOvuBzbm64C6cbv8l7b1jfqQqFhyCfk3DJul700gpRI+u456/C07Af9uwp5h+qsxz3qa0L/rCeR2AumG3DCMzHGliMW+gXZOIeealhN8t/GO0KATseYi3nZB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iohnEr7p; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iohnEr7p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753734701;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zZXoaxTDjRg/a/jwd5LEvOIoGKVQe52rJ1WByCglYh4=;
	b=iohnEr7p1vwCgrM+7P9oPfWtB2j2Kxl4Vv7rxStECUGZLg661aPEoB0JCRbXZt/tKt/P1t
	szLVfakUDLzWHRRyxJ3XmaCY5aQRoLSzxa0TumvIU105KoDDJeX8eQo03r5hE3cTl8gxuL
	PbcVrx4G/BA3RcvODl9XRhh7+H/Gbus=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-584-F95xmeSoMOC4vxN-wg14Ig-1; Mon, 28 Jul 2025 16:31:39 -0400
X-MC-Unique: F95xmeSoMOC4vxN-wg14Ig-1
X-Mimecast-MFC-AGG-ID: F95xmeSoMOC4vxN-wg14Ig_1753734698
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-6105223641bso4502176a12.3
        for <fsverity@lists.linux.dev>; Mon, 28 Jul 2025 13:31:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753734698; x=1754339498;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zZXoaxTDjRg/a/jwd5LEvOIoGKVQe52rJ1WByCglYh4=;
        b=GJNI+qNvLgvD38S6ahhVIiUagp6x9p4lrQnsRucrqQeAFNeUu0h5bU3yT1bCabI4gF
         0XgZjOO4JgPiTYkl8SuvXyuREhGydrqUQJc5JEypDi+3oHikWVhbIup/7h/PnHXIulcL
         GotwheCOf8bLbyQX4SJdoEiG7bUd/kuHw3J1v0bSqhz0ircXk6NLsTG2RuS8AQIAz89U
         I/VCYJSPJFT2NeFh5lZRJyMxyutFy/4XFPjQDRa5acgnR4yzAw0+FwRm+/aX/KHOwuE8
         OFLEzepcXsJJ//SWVbEIOWdOUEz0BnKcREfFPmCii6Pj2aZ642Ab0SH21MYM3Ti3Koyx
         Ipww==
X-Gm-Message-State: AOJu0Yzu9pEAE3E3WD+Bx4MVHbDIhixZflg/8ANPamC70hNO5wJmOUdd
	f/ymaeWStY2HZk03x57hFoMkAKagOLOic0zUV0IqJlijUfSIZzeQcNyMfmZ/UG3kiuS0arqK1Kb
	yrqUSkmqkgIiXz5HsmjAdDruKAGC7sjMWyMuHY64Tc8oJXleVuOnl9ZEeEWo=
X-Gm-Gg: ASbGncvjllXQmd+yLJ5fIYm/Nx+pLnc11noNSUcV64t947vwjCD0fNA32wRbelvHG5/
	KXg7iYrvCnwbR9YPItK5hlAKSvlGfjV8mq1qlo4LbNDvspQ7/82Wyyn+TjrxVZ0ETSiJ3ufkoEq
	MdicnHb4Fxa10WFp7DuTiM8vZRCg6NmRIpSofMcBt49DzV2ItADEvc0io+xjRyTImxnveaH0pPn
	TiMxafiTaPlyrvBw4/6y3hfhBIDLZpqX8keL5lqR+zlIBX3y9y+jlsVmB5a4Cej6J7xAafBxllt
	ilLh9b3LF/swWrRGoh9A+tX+yNKquQdMXoEvU/QGBEkvSw==
X-Received: by 2002:a05:6402:42c8:b0:615:4244:8c46 with SMTP id 4fb4d7f45d1cf-61542449868mr4455394a12.28.1753734698106;
        Mon, 28 Jul 2025 13:31:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEIdGe4USzRIJTcsB+22wY5Dcu9XUWv6bWITa5Ihoc1sZZDfH607srcXhtVlDoAzyIrl4/0yg==
X-Received: by 2002:a05:6402:42c8:b0:615:4244:8c46 with SMTP id 4fb4d7f45d1cf-61542449868mr4455370a12.28.1753734697628;
        Mon, 28 Jul 2025 13:31:37 -0700 (PDT)
Received: from [127.0.0.2] (ip-217-030-074-039.aim-net.cz. [217.30.74.39])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615226558d3sm2730656a12.45.2025.07.28.13.31.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 13:31:37 -0700 (PDT)
From: Andrey Albershteyn <aalbersh@redhat.com>
X-Google-Original-From: Andrey Albershteyn <aalbersh@kernel.org>
Date: Mon, 28 Jul 2025 22:30:21 +0200
Subject: [PATCH RFC 17/29] xfs: initialize fs-verity on file open and
 cleanup on inode destruction
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <20250728-fsverity-v1-17-9e5443af0e34@kernel.org>
References: <20250728-fsverity-v1-0-9e5443af0e34@kernel.org>
In-Reply-To: <20250728-fsverity-v1-0-9e5443af0e34@kernel.org>
To: fsverity@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
 linux-xfs@vger.kernel.org, david@fromorbit.com, djwong@kernel.org, 
 ebiggers@kernel.org, hch@lst.de
Cc: Andrey Albershteyn <aalbersh@redhat.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1800; i=aalbersh@kernel.org;
 h=from:subject:message-id; bh=mGQiXL42Qj1BBahuGJXihH0ERFZ0YR469i+3LjqufUY=;
 b=owJ4nJvAy8zAJea2/JXEGuOHHIyn1ZIYMtrvSdgvCnmWomy0fqqu4U75hki2q+/sPI6kbXqlV
 /vztqvWlBcdpSwMYlwMsmKKLOuktaYmFUnlHzGokYeZw8oEMoSBi1MAJrLqNsN/t8ToqqUJzxzK
 hE76r8iQVn6hquGwuqmuoDJO6fr6iJdLGRm+fGe7bVoxZcrD7vnc9Q/bV5/6mJV04O/SE7PVO65
 cn1PLBgBfQ0re
X-Developer-Key: i=aalbersh@kernel.org; a=openpgp;
 fpr=AE1B2A9562721A6FC4307C1F46A7EA18AC33E108
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: pW1-X7eU8VgQ4jYOt3B-N3Irozi7WMsXzfta7Jzs8Nw_1753734698
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

From: Andrey Albershteyn <aalbersh@redhat.com>

fs-verity will read and attach metadata (not the tree itself) from
a disk for those inodes which already have fs-verity enabled.

Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
Reviewed-by: Darrick J. Wong <djwong@kernel.org>
Signed-off-by: Darrick J. Wong <djwong@kernel.org>
---
 fs/xfs/xfs_file.c  | 8 ++++++++
 fs/xfs/xfs_super.c | 2 ++
 2 files changed, 10 insertions(+)

diff --git a/fs/xfs/xfs_file.c b/fs/xfs/xfs_file.c
index 0b41b18debf3..da13162925d9 100644
--- a/fs/xfs/xfs_file.c
+++ b/fs/xfs/xfs_file.c
@@ -34,6 +34,7 @@
 #include <linux/mman.h>
 #include <linux/fadvise.h>
 #include <linux/mount.h>
+#include <linux/fsverity.h>
 
 static const struct vm_operations_struct xfs_file_vm_ops;
 
@@ -1555,11 +1556,18 @@ xfs_file_open(
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
index bb0a82635a77..7b1ace75955c 100644
--- a/fs/xfs/xfs_super.c
+++ b/fs/xfs/xfs_super.c
@@ -53,6 +53,7 @@
 #include <linux/magic.h>
 #include <linux/fs_context.h>
 #include <linux/fs_parser.h>
+#include <linux/fsverity.h>
 
 static const struct super_operations xfs_super_operations;
 
@@ -699,6 +700,7 @@ xfs_fs_destroy_inode(
 	ASSERT(!rwsem_is_locked(&inode->i_rwsem));
 	XFS_STATS_INC(ip->i_mount, vn_rele);
 	XFS_STATS_INC(ip->i_mount, vn_remove);
+	fsverity_cleanup_inode(inode);
 	xfs_inode_mark_reclaimable(ip);
 }
 

-- 
2.50.0

