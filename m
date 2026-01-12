Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B5F72BE058
	for <fsverity@lists.linux.dev>; Mon, 12 Jan 2026 14:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768229541; cv=none; b=fraXC6XZjni6GP4mqndek++l5asMoeIKdXbE0ACrcPDoKuE2BV0ge2SUVP3d00yxKXethq2EvtGL56AFZUNltQTGv5wyJ7sPNBtqksDYyA4cbOohxnsv/x7Ok3hQLX+YcL+B5nSTqz9yUTZy9WCZaWpThG6VGqASjY/3moBOrck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768229541; c=relaxed/simple;
	bh=DqGbPHihgvouI+HlmdtnScxnStrH4+HE2WznQSyP4j4=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=pD/rJt1db2lFAydqqNbzsre2cThjW6NvnjrlqZYHuOLmYc87pmi3txx1c7Sa7Bw0Q1ucuB2CzVkouGNa5jpFcemtFUrub7WVrJXMBz5z0iexlEDcKMgSVY2lIc6yO3QpZpSrKkWd85YxA5eangs2890wVXs7JNq3nR3DDnbY7Fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ajpV80lu; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ajpV80lu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768229539;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xPYPAB6be13BNA+rNTQIlJZgdC6UYp82gudM/SKVgcg=;
	b=ajpV80lupQygZrFxp2+p1dlsz/8KjwhggJTUDHNr/zvCJBe0cc0gkaispRvhj8pNCK15Bx
	zyffd9Ohe1+vUtWlqd3igfPXkMsM8ix9W0UTLaagEDG90nrkdA2OeKQdNTb33h2iWH5n1O
	g9OyAbUjH2px70t29VpQBWk6uUN6qm4=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-207-8vakJkCxM-uPbZPXHyE19A-1; Mon, 12 Jan 2026 09:52:18 -0500
X-MC-Unique: 8vakJkCxM-uPbZPXHyE19A-1
X-Mimecast-MFC-AGG-ID: 8vakJkCxM-uPbZPXHyE19A_1768229536
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-b801784f406so828784966b.0
        for <fsverity@lists.linux.dev>; Mon, 12 Jan 2026 06:52:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768229536; x=1768834336;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xPYPAB6be13BNA+rNTQIlJZgdC6UYp82gudM/SKVgcg=;
        b=EiTbS9vfVJDpZucCOAKt//95Rn5JIkO7diSnHtbtT08GoLNQbrvwITkvsZX2ZIdc/T
         Oj94A4wzvmeHOgAWquGtVRZry7BcOr21gKXhisDy36FVYCWrXRrhnDRk9qxqnnWVIh9M
         F9Ntj17uxUGwzHBTVG73AMfRSwjVi7TXxVbsNrui64I5AbBY/d4xqM81LRLipgEZ6NRn
         QCOGVN7U17xYqqZRLSKvsOjxOZEcxgUAzxL48N5+0dNxfIYqLu4CW6FuPB7y9cRfmLuB
         SQzx2NcsGg4lpOU8QvGOJN/HacxFt/OO2QvBF+GzKT1rzi71e1X1kHkhsoyBCk/EWMQl
         4lWQ==
X-Gm-Message-State: AOJu0YwznV0vCP0sHD3jcYoHX1cA0KuUBSYZEG73lYvHSFa0Uq95FBvV
	TMF7SH8WoNdp15m+LPA5kaN4AXtRCHmNgdMN8MzzDNxH011mZmEJiudXcgg5rhIzRb7JK3+ZgG9
	lN4rjYCTswsIUCF/6cP9QXYJuSjdMLRSn8UTZm3k9lONhMHXFARbEjhfBYNT91JajuK6guBusOI
	scacyMFXOluUMRw1k4CkOZ63MmSnIbzZ3emTIMaYImvRM=
X-Gm-Gg: AY/fxX79XZYtBO5o+D/yag8VAXivtzZiYRIxO3HndnX53VvPrzmn/ky9A1ZhqXjdXa0
	0KtZmasiwtT0wbmHeIAUbwTdNp8XeXCg6JwkI6wYCxT5xbXDxcyTy6ikCkh0a7zi4xNZEsp/737
	KtYH58zdv7ADZvP6UtHpsh5/l0g8aQM5zy0cZy74hzdL2vAqg86DySINGp6QnC5yXpbx6DVb9Te
	kuLoUe89sBB6FWq4JtiyDxAaV79wOiO5yJmNWp3lqRHxhYX9CtpuaWvu2dioW3fc14Lz88dnw15
	OXzaHlLseEiosiYrA1mTis/hP2Xmm45AZRWmGiRAViO0W3OBA1aP2exTvi/c917Pz6ggOl3P
X-Received: by 2002:a17:907:841:b0:b83:9767:c8ba with SMTP id a640c23a62f3a-b84451b5d1dmr1635825666b.17.1768229535927;
        Mon, 12 Jan 2026 06:52:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH+AXG1fXAqNi7crMM7QiDNAwZR8bNUqqDvj5BznuxA4nKTk8GLk6KKY85CmsHuZWbeWD797w==
X-Received: by 2002:a17:907:841:b0:b83:9767:c8ba with SMTP id a640c23a62f3a-b84451b5d1dmr1635820866b.17.1768229535247;
        Mon, 12 Jan 2026 06:52:15 -0800 (PST)
Received: from thinky ([217.30.74.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8429fdf4e7sm1985599466b.0.2026.01.12.06.52.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 06:52:14 -0800 (PST)
From: "Darrick J. Wong" <aalbersh@redhat.com>
X-Google-Original-From: "Darrick J. Wong" <djwong@kernel.org>
Date: Mon, 12 Jan 2026 15:52:13 +0100
To: fsverity@lists.linux.dev, linux-xfs@vger.kernel.org, 
	ebiggers@kernel.org, linux-fsdevel@vger.kernel.org, aalbersh@kernel.org, 
	aalbersh@redhat.com, djwong@kernel.org
Cc: djwong@kernel.org, david@fromorbit.com, hch@lst.de
Subject: [PATCH v2 20/22] xfs: report verity failures through the health
 system
Message-ID: <i4tsa4dqqhjfutocdlk6mqm6ovvzea7ki2w32j6mcew66aegay@tsllwgeogm3f>
References: <cover.1768229271.patch-series@thinky>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <cover.1768229271.patch-series@thinky>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: PUlnDSelKFIE3G6BnDKizFHStojhHXKM7LNGTjh2vrk_1768229536
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Record verity failures and report them through the health system.

Signed-off-by: Darrick J. Wong <djwong@kernel.org>
Reviewed-by: Andrey Albershteyn <aalbersh@redhat.com>
Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org>
---
 fs/xfs/libxfs/xfs_fs.h     |  1 +
 fs/xfs/libxfs/xfs_health.h |  4 +++-
 fs/xfs/xfs_fsverity.c      | 11 +++++++++++
 fs/xfs/xfs_health.c        |  1 +
 4 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/fs/xfs/libxfs/xfs_fs.h b/fs/xfs/libxfs/xfs_fs.h
index 3db9beb579..b82fef9a1f 100644
--- a/fs/xfs/libxfs/xfs_fs.h
+++ b/fs/xfs/libxfs/xfs_fs.h
@@ -422,6 +422,7 @@
 #define XFS_BS_SICK_SYMLINK	(1 << 6)  /* symbolic link remote target */
 #define XFS_BS_SICK_PARENT	(1 << 7)  /* parent pointers */
 #define XFS_BS_SICK_DIRTREE	(1 << 8)  /* directory tree structure */
+#define XFS_BS_SICK_DATA	(1 << 9)  /* file data */
 
 /*
  * Project quota id helpers (previously projid was 16bit only
diff --git a/fs/xfs/libxfs/xfs_health.h b/fs/xfs/libxfs/xfs_health.h
index b31000f719..fa91916ad0 100644
--- a/fs/xfs/libxfs/xfs_health.h
+++ b/fs/xfs/libxfs/xfs_health.h
@@ -104,6 +104,7 @@
 /* Don't propagate sick status to ag health summary during inactivation */
 #define XFS_SICK_INO_FORGET	(1 << 12)
 #define XFS_SICK_INO_DIRTREE	(1 << 13)  /* directory tree structure */
+#define XFS_SICK_INO_DATA	(1 << 14)  /* file data */
 
 /* Primary evidence of health problems in a given group. */
 #define XFS_SICK_FS_PRIMARY	(XFS_SICK_FS_COUNTERS | \
@@ -140,7 +141,8 @@
 				 XFS_SICK_INO_XATTR | \
 				 XFS_SICK_INO_SYMLINK | \
 				 XFS_SICK_INO_PARENT | \
-				 XFS_SICK_INO_DIRTREE)
+				 XFS_SICK_INO_DIRTREE | \
+				 XFS_SICK_INO_DATA)
 
 #define XFS_SICK_INO_ZAPPED	(XFS_SICK_INO_BMBTD_ZAPPED | \
 				 XFS_SICK_INO_BMBTA_ZAPPED | \
diff --git a/fs/xfs/xfs_fsverity.c b/fs/xfs/xfs_fsverity.c
index 691dc60778..f53a404578 100644
--- a/fs/xfs/xfs_fsverity.c
+++ b/fs/xfs/xfs_fsverity.c
@@ -18,6 +18,7 @@
 #include "xfs_quota.h"
 #include "xfs_fsverity.h"
 #include "xfs_iomap.h"
+#include "xfs_health.h"
 #include <linux/fsverity.h>
 #include <linux/pagemap.h>
 
@@ -363,6 +364,15 @@
 	return xfs_fsverity_write(ip, position, size, buf);
 }
 
+static void
+xfs_fsverity_file_corrupt(
+	struct inode		*inode,
+	loff_t			pos,
+	size_t			len)
+{
+	xfs_inode_mark_sick(XFS_I(inode), XFS_SICK_INO_DATA);
+}
+
 const ptrdiff_t info_offs = (int)offsetof(struct xfs_inode, i_verity_info) -
 			    (int)offsetof(struct xfs_inode, i_vnode);
 
@@ -373,4 +383,5 @@
 	.get_verity_descriptor		= xfs_fsverity_get_descriptor,
 	.read_merkle_tree_page		= xfs_fsverity_read_merkle,
 	.write_merkle_tree_block	= xfs_fsverity_write_merkle,
+	.file_corrupt			= xfs_fsverity_file_corrupt,
 };
diff --git a/fs/xfs/xfs_health.c b/fs/xfs/xfs_health.c
index 3c1557fb1c..b851651c02 100644
--- a/fs/xfs/xfs_health.c
+++ b/fs/xfs/xfs_health.c
@@ -487,6 +487,7 @@
 	{ XFS_SICK_INO_DIR_ZAPPED,	XFS_BS_SICK_DIR },
 	{ XFS_SICK_INO_SYMLINK_ZAPPED,	XFS_BS_SICK_SYMLINK },
 	{ XFS_SICK_INO_DIRTREE,	XFS_BS_SICK_DIRTREE },
+	{ XFS_SICK_INO_DATA,	XFS_BS_SICK_DATA },
 };
 
 /* Fill out bulkstat health info. */

-- 
- Andrey

