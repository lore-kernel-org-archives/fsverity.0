Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF576328BC
	for <fsverity@lists.linux.dev>; Fri,  6 Oct 2023 18:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="e1C5xhuw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1696618360;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Xx+aNRFn5qJ8QRmhEcH9mM/4FZQj9kOynyRUbnfcdkQ=;
	b=e1C5xhuwx+JNMEXKQhneLmUkyX6aX4i9605jcy6CEAARXy1tsuKmbKCKDywW3tw81z+DEV
	8wwM5JO470k79BZouBZWBGHBSauhTET6vpAo4RFysl+OzxfLjyukLu37bWXZnJVQbWrR/P
	337wZ9zCtnRFFDhsOJe66jKT0ipC/nA=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-653-IDudffMwN9uTzClzGASgMQ-1; Fri, 06 Oct 2023 14:52:39 -0400
X-MC-Unique: IDudffMwN9uTzClzGASgMQ-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-9adc78b386cso209868266b.0
        for <fsverity@lists.linux.dev>; Fri, 06 Oct 2023 11:52:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696618358; x=1697223158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xx+aNRFn5qJ8QRmhEcH9mM/4FZQj9kOynyRUbnfcdkQ=;
        b=jyprF+uLyh1hE/6oG3nZ76AFh2/dd3OOe+XhznldkCMgsIsoivZxL7lec8WInzp6OC
         8iRjB74NdwqMpxZSbSqQYDLBCdWFXjxgGaPUvbGiql6ed2BxkOhS2x2KcatVpHg+iUgB
         JJxVX75FpQS4luqjhkQePIN+1hM+zPBY6hFM/8IEkbvlHYubzdbGpMXfCj91F7qzqmfy
         yVmbOI9j8bDb/pqOUCDwh2G5cABf6w2WhT8umDOk20eIh6cKUj4kJr0Zgd/9GmDuTx+s
         fsTBjmGfWo+uDFVvhmTFetJ70UlsJNgflqEpvUBPN3jwzW43boQ1HQ6HMUX62iJobdTL
         Sbag==
X-Gm-Message-State: AOJu0Yxp2+8kIam4L+jbRnq0J9f3sXZz6ZxJzEhZ6f1UIb8VeGLFeX/P
	RyPgGA++UIH0taTaFnUSxAbthf+NOnIJJAlX1RQtFjWD33OzKJ31+jXS0bcuyVzG6aeFSY7Lg5n
	bya7LjYL4CdZ9R5XHELBH63zGZA==
X-Received: by 2002:a17:906:1097:b0:9ae:4878:1172 with SMTP id u23-20020a170906109700b009ae48781172mr8628280eju.7.1696618358350;
        Fri, 06 Oct 2023 11:52:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFCIpHO/nQ4QGByNF0QZHH7zKGeeUDbHAWIZgilZwrqoW03x+wLVxk7wQFjuG4YEzr8Y1U+5A==
X-Received: by 2002:a17:906:1097:b0:9ae:4878:1172 with SMTP id u23-20020a170906109700b009ae48781172mr8628269eju.7.1696618358165;
        Fri, 06 Oct 2023 11:52:38 -0700 (PDT)
Received: from localhost.localdomain ([109.183.6.197])
        by smtp.gmail.com with ESMTPSA id os5-20020a170906af6500b009b947f81c4asm3304741ejb.155.2023.10.06.11.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 11:52:37 -0700 (PDT)
From: Andrey Albershteyn <aalbersh@redhat.com>
To: linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	fsverity@lists.linux.dev
Cc: djwong@kernel.org,
	ebiggers@kernel.org,
	david@fromorbit.com,
	dchinner@redhat.com,
	Andrey Albershteyn <aalbersh@redhat.com>
Subject: [PATCH v3 21/28] xfs: add inode on-disk VERITY flag
Date: Fri,  6 Oct 2023 20:49:15 +0200
Message-Id: <20231006184922.252188-22-aalbersh@redhat.com>
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

Add flag to mark inodes which have fs-verity enabled on them (i.e.
descriptor exist and tree is built).

Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
---
 fs/ioctl.c                 | 4 ++++
 fs/xfs/libxfs/xfs_format.h | 4 +++-
 fs/xfs/xfs_inode.c         | 2 ++
 fs/xfs/xfs_iops.c          | 2 ++
 4 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/fs/ioctl.c b/fs/ioctl.c
index f5fd99d6b0d4..81a69cb8016b 100644
--- a/fs/ioctl.c
+++ b/fs/ioctl.c
@@ -481,6 +481,8 @@ void fileattr_fill_xflags(struct fileattr *fa, u32 xflags)
 		fa->flags |= FS_DAX_FL;
 	if (fa->fsx_xflags & FS_XFLAG_PROJINHERIT)
 		fa->flags |= FS_PROJINHERIT_FL;
+	if (fa->fsx_xflags & FS_XFLAG_VERITY)
+		fa->flags |= FS_VERITY_FL;
 }
 EXPORT_SYMBOL(fileattr_fill_xflags);
 
@@ -511,6 +513,8 @@ void fileattr_fill_flags(struct fileattr *fa, u32 flags)
 		fa->fsx_xflags |= FS_XFLAG_DAX;
 	if (fa->flags & FS_PROJINHERIT_FL)
 		fa->fsx_xflags |= FS_XFLAG_PROJINHERIT;
+	if (fa->flags & FS_VERITY_FL)
+		fa->fsx_xflags |= FS_XFLAG_VERITY;
 }
 EXPORT_SYMBOL(fileattr_fill_flags);
 
diff --git a/fs/xfs/libxfs/xfs_format.h b/fs/xfs/libxfs/xfs_format.h
index ef617be2839c..ccb2ae5c2c93 100644
--- a/fs/xfs/libxfs/xfs_format.h
+++ b/fs/xfs/libxfs/xfs_format.h
@@ -1070,16 +1070,18 @@ static inline void xfs_dinode_put_rdev(struct xfs_dinode *dip, xfs_dev_t rdev)
 #define XFS_DIFLAG2_COWEXTSIZE_BIT   2  /* copy on write extent size hint */
 #define XFS_DIFLAG2_BIGTIME_BIT	3	/* big timestamps */
 #define XFS_DIFLAG2_NREXT64_BIT 4	/* large extent counters */
+#define XFS_DIFLAG2_VERITY_BIT	5	/* inode sealed by fsverity */
 
 #define XFS_DIFLAG2_DAX		(1 << XFS_DIFLAG2_DAX_BIT)
 #define XFS_DIFLAG2_REFLINK     (1 << XFS_DIFLAG2_REFLINK_BIT)
 #define XFS_DIFLAG2_COWEXTSIZE  (1 << XFS_DIFLAG2_COWEXTSIZE_BIT)
 #define XFS_DIFLAG2_BIGTIME	(1 << XFS_DIFLAG2_BIGTIME_BIT)
 #define XFS_DIFLAG2_NREXT64	(1 << XFS_DIFLAG2_NREXT64_BIT)
+#define XFS_DIFLAG2_VERITY	(1 << XFS_DIFLAG2_VERITY_BIT)
 
 #define XFS_DIFLAG2_ANY \
 	(XFS_DIFLAG2_DAX | XFS_DIFLAG2_REFLINK | XFS_DIFLAG2_COWEXTSIZE | \
-	 XFS_DIFLAG2_BIGTIME | XFS_DIFLAG2_NREXT64)
+	 XFS_DIFLAG2_BIGTIME | XFS_DIFLAG2_NREXT64 | XFS_DIFLAG2_VERITY)
 
 static inline bool xfs_dinode_has_bigtime(const struct xfs_dinode *dip)
 {
diff --git a/fs/xfs/xfs_inode.c b/fs/xfs/xfs_inode.c
index 4d55f58d99b7..94eb33abcb8f 100644
--- a/fs/xfs/xfs_inode.c
+++ b/fs/xfs/xfs_inode.c
@@ -634,6 +634,8 @@ xfs_ip2xflags(
 			flags |= FS_XFLAG_DAX;
 		if (ip->i_diflags2 & XFS_DIFLAG2_COWEXTSIZE)
 			flags |= FS_XFLAG_COWEXTSIZE;
+		if (ip->i_diflags2 & XFS_DIFLAG2_VERITY)
+			flags |= FS_XFLAG_VERITY;
 	}
 
 	if (xfs_inode_has_attr_fork(ip))
diff --git a/fs/xfs/xfs_iops.c b/fs/xfs/xfs_iops.c
index 1c1e6171209d..9f2d5c2505ae 100644
--- a/fs/xfs/xfs_iops.c
+++ b/fs/xfs/xfs_iops.c
@@ -1237,6 +1237,8 @@ xfs_diflags_to_iflags(
 		flags |= S_NOATIME;
 	if (init && xfs_inode_should_enable_dax(ip))
 		flags |= S_DAX;
+	if (xflags & FS_XFLAG_VERITY)
+		flags |= S_VERITY;
 
 	/*
 	 * S_DAX can only be set during inode initialization and is never set by
-- 
2.40.1

