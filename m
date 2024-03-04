Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C9B7BB14
	for <fsverity@lists.linux.dev>; Mon,  4 Mar 2024 19:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709579553; cv=none; b=Oo1tYWAJ1Gn9heYcykd9M+j4eGBKkoknn50Tg6AkogmXF/ok2mcFRx/0QdS7c0GIfaBcewU28D0e6n6le2q1Se9mGK+mmAcMV2Ha2uQ9ggsJ7302AIFwpPmw9g/t6eJdSgNQ7QYp606hI/DVCkjbXEJRba3+HmVWsHMWmA1Amxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709579553; c=relaxed/simple;
	bh=ERtzRFPdr2VH0zZPj8RxD5cx+rKCLFPSdsv147J2+aI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EPpGWMFt3EgQ2a5duqVVdaf7tZzD+zdQ5Dhse7wpb//rKmMSltAM6WcCq4KYLzUf0t9jlcHi0mvvMW3bD7e+3Rn6lzqdfHR9C2+gyoZXYseEcl2HPYBRwTpATGerTEidbZHeEotOJKlFjaztTi7XYpNVf95+53nE4oNeXDxpw3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QH416ypl; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QH416ypl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709579550;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=krPybzmQrqI1Dp7C5c3ykOUeWIJQjCMl72CpYY79DB8=;
	b=QH416yplPHnN8mk0whs6fLtg2Jr1xH6+e//1VDw4luMfxdmmezmiyK/vYI5eRYa//JJsBx
	qDimbiYlRUjodsDJgonBD2F+A6XCl5J9m8Nxmb1feLeHxy9NYj407SVA53qr6MzAC8TCbM
	lrvqe1mv+G5dxuOlwNhelRs0YpYkKUo=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-272-Mwkv5M2eMIm6-MsCl6nVMA-1; Mon, 04 Mar 2024 14:12:29 -0500
X-MC-Unique: Mwkv5M2eMIm6-MsCl6nVMA-1
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-564901924f4so3067577a12.0
        for <fsverity@lists.linux.dev>; Mon, 04 Mar 2024 11:12:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709579547; x=1710184347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=krPybzmQrqI1Dp7C5c3ykOUeWIJQjCMl72CpYY79DB8=;
        b=tOqFa49qKPjWyR1Mj4kRBuJvx4KncyXJaCXxE8zcRXiaKL43HKRoaDQYqSkhFCL7x+
         Nu5LHb2GSTcTUuJ5r3V/NHg49h/9e6hekIRgL72Ptbq3WMEmpo03YYq7nRmFkF7uv+3y
         2G/IKE63bkikePZ1sQlEHWtYSP1Cdz2kSkDVkUNtci9CrKjMMvGoBP/X+DwnT1cEfOra
         v2/UCXAaxQO7FuzvXuY1mPgIixTiUpLZlr21AudPzQyZsH6V32lUFI9vvf2vaHsHuKgf
         EYrpsmWry8bz1Vr06adJpaWKnfCz/X+gg0chySsV+cnP60rYZ4L3n2dMTZcuH/oleD/y
         RjlQ==
X-Gm-Message-State: AOJu0YxT/ZnqlH+bJkODKF5n9NoNNtMvVJwBHbmV9xcVVbDU96Cv/W6I
	9YDfaItm09prisZR09NFV9jERpkprPHmyfP3jWPQky/1Qj7tkeCiD9EaHlnFKyqCk8LhDPNc0y7
	L+d42LruHUHqAmvlHmJwxSfz0BC+LYrlfm7xUS897jFGTG5ljjFvaBu8BgfoWI/KycCcqHGgbr4
	H2RWQJeX/DQMhOEcPwFuhwdmm0qtUOxEf+763A5qI=
X-Received: by 2002:a17:906:ce26:b0:a44:415d:fa3a with SMTP id sd6-20020a170906ce2600b00a44415dfa3amr7056584ejb.40.1709579547506;
        Mon, 04 Mar 2024 11:12:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEcAC+lTxlNi6h7UWuTBi4wKvqOw70WGSF/a8p/9kdmtD66jYKFg2m1eW60qx48UVYaEc8wIg==
X-Received: by 2002:a17:906:ce26:b0:a44:415d:fa3a with SMTP id sd6-20020a170906ce2600b00a44415dfa3amr7056572ejb.40.1709579547287;
        Mon, 04 Mar 2024 11:12:27 -0800 (PST)
Received: from thinky.redhat.com ([109.183.6.197])
        by smtp.gmail.com with ESMTPSA id a11-20020a1709064a4b00b00a44a04aa3cfsm3783319ejv.225.2024.03.04.11.12.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 11:12:27 -0800 (PST)
From: Andrey Albershteyn <aalbersh@redhat.com>
To: fsverity@lists.linux.dev,
	linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	chandan.babu@oracle.com,
	djwong@kernel.org,
	ebiggers@kernel.org
Cc: Andrey Albershteyn <aalbersh@redhat.com>
Subject: [PATCH v5 18/24] xfs: initialize fs-verity on file open and cleanup on inode destruction
Date: Mon,  4 Mar 2024 20:10:41 +0100
Message-ID: <20240304191046.157464-20-aalbersh@redhat.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240304191046.157464-2-aalbersh@redhat.com>
References: <20240304191046.157464-2-aalbersh@redhat.com>
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
index 632653e00906..17404c2e7e31 100644
--- a/fs/xfs/xfs_file.c
+++ b/fs/xfs/xfs_file.c
@@ -31,6 +31,7 @@
 #include <linux/mman.h>
 #include <linux/fadvise.h>
 #include <linux/mount.h>
+#include <linux/fsverity.h>
 
 static const struct vm_operations_struct xfs_file_vm_ops;
 
@@ -1228,10 +1229,17 @@ xfs_file_open(
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
index afa32bd5e282..9f9c35cff9bf 100644
--- a/fs/xfs/xfs_super.c
+++ b/fs/xfs/xfs_super.c
@@ -49,6 +49,7 @@
 #include <linux/magic.h>
 #include <linux/fs_context.h>
 #include <linux/fs_parser.h>
+#include <linux/fsverity.h>
 
 static const struct super_operations xfs_super_operations;
 
@@ -663,6 +664,7 @@ xfs_fs_destroy_inode(
 	ASSERT(!rwsem_is_locked(&inode->i_rwsem));
 	XFS_STATS_INC(ip->i_mount, vn_rele);
 	XFS_STATS_INC(ip->i_mount, vn_remove);
+	fsverity_cleanup_inode(inode);
 	xfs_inode_mark_reclaimable(ip);
 }
 
-- 
2.42.0

