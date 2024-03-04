Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6AF07BB00
	for <fsverity@lists.linux.dev>; Mon,  4 Mar 2024 19:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709579548; cv=none; b=pvUun97oTtJBNfE8VYwUtVQfNVEZMv8CVZR0w4Uq3oWEYUFgwO1yGKb83fNvX6i6BdymKBANwwyu9eUjlghGohjDPSWRzuSMoMxQPpmBzNX6W0iHk0jfrIL24Ba59jTnuXqOgRgX4jl0+LtmvVAQj+qI5qdfPnRw6dn4ECrieFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709579548; c=relaxed/simple;
	bh=XHcQPQykxWC7s2kFvNi66STYRWcCMuM23D2106/ZIcs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Dt+M6zQ8KzTUoK/ZABEv6RQrfumMyNtLBSargVP4PfOxeGL+9PVQJA1UzrzUjwDV/sDHcsS2XHhqDF6qHOLHtwr3aIRuW0x7XowGhC1/579DX/+O3PyCdzkvjSyHYtJBbR+PPOpEhaAcxP2IND4B+Y6AEstH1xijW3h4CkFzLtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HjXNlKN0; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HjXNlKN0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709579546;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VZR5eTtljpGatStmm+GdRj3kRnj54o9FoI5mU15Gslw=;
	b=HjXNlKN0M9E1ZK8KLAOrLdazmUt0F0cAMw2ozany17HmLS3QvAPZ/rLVAawY0pbvyxmLj5
	UcX0yZ1YLdSuFsBqJgufThi3HBDOKieuoG6xeEiUpn6vdCA7+RFrPdxct+dyfhy0mALjD4
	PxYteZ6nJLINI7sUyclg2KT88iWzqQs=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-314-CoBg3Bj7OdeXB6t5ANC-Lw-1; Mon, 04 Mar 2024 14:12:24 -0500
X-MC-Unique: CoBg3Bj7OdeXB6t5ANC-Lw-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a30f9374db7so615125866b.0
        for <fsverity@lists.linux.dev>; Mon, 04 Mar 2024 11:12:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709579543; x=1710184343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VZR5eTtljpGatStmm+GdRj3kRnj54o9FoI5mU15Gslw=;
        b=OZsYViB2Fx654flhi0gA1kxDC8e4mn+NQ8mnHut4HhTZST3bPC1QU1gh5By9/Za2Ty
         W9kMIBNT3jJGqb8TFHl8RVzKJZfOQKf3Fn1duPUd/VmkE1ZYt+ZVODS5jaOyh3Sr6lEo
         vDRyHfgsBnoQ8KH1WbQBaA0yOxymtR2yAvsOnNdEOkPCamniiR6PwelXnOGImnx68ic4
         gPIvx6tv/wWpan5uP+YjWA6zY6lm3XON/anyGvs6qnA8PjfoI/hN/FG7gO9Nxu1M/D0V
         QI9sH2Ck/RHJ3gOBnjJZnRbG8i2Ufo7CfPnR2r0lChqJjAJ9b/ZoUadyg6v+3xOUm6Jq
         QwyQ==
X-Gm-Message-State: AOJu0YxT5VQcShqvvTMCkGbpGq9SDKTVJe/lNvLuHzrYWbGeaqcx0aIU
	LtnINb+Meu3boVG/x0rbG0CqIvnDA1diikuDawX3P1FL77tqkt4luH8retIVXy8WWoNS4HEU5Jw
	MzRLOQGOqZ4ybTgrnPhgB4qTlMMOWIsA/ZdqPkae6CruIpFCwp1/3K9gR1eBMAi3Jyjek6VW/iP
	gAJeCr/X1aCJ8iHoYYsIpNY4Nc7mglz81+9ILgoGY=
X-Received: by 2002:a17:906:b00b:b0:a45:84e7:b25a with SMTP id v11-20020a170906b00b00b00a4584e7b25amr398488ejy.12.1709579543336;
        Mon, 04 Mar 2024 11:12:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHaiOmDDptgsHTrDI8+xi/tHowlOhstTJgfFsYNplwiDI8lks5bXwfuu81Boid8d7CYPav+Ow==
X-Received: by 2002:a17:906:b00b:b0:a45:84e7:b25a with SMTP id v11-20020a170906b00b00b00a4584e7b25amr398444ejy.12.1709579542728;
        Mon, 04 Mar 2024 11:12:22 -0800 (PST)
Received: from thinky.redhat.com ([109.183.6.197])
        by smtp.gmail.com with ESMTPSA id a11-20020a1709064a4b00b00a44a04aa3cfsm3783319ejv.225.2024.03.04.11.12.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 11:12:22 -0800 (PST)
From: Andrey Albershteyn <aalbersh@redhat.com>
To: fsverity@lists.linux.dev,
	linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	chandan.babu@oracle.com,
	djwong@kernel.org,
	ebiggers@kernel.org
Cc: Andrey Albershteyn <aalbersh@redhat.com>
Subject: [PATCH v5 13/24] xfs: add attribute type for fs-verity
Date: Mon,  4 Mar 2024 20:10:36 +0100
Message-ID: <20240304191046.157464-15-aalbersh@redhat.com>
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

The Merkle tree blocks and descriptor are stored in the extended
attributes of the inode. Add new attribute type for fs-verity
metadata. Add XFS_ATTR_INTERNAL_MASK to skip parent pointer and
fs-verity attributes as those are only for internal use. While we're
at it add a few comments in relevant places that internally visible
attributes are not suppose to be handled via interface defined in
xfs_xattr.c.

Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
Reviewed-by: Darrick J. Wong <djwong@kernel.org>
---
 fs/xfs/libxfs/xfs_da_format.h  | 10 +++++++++-
 fs/xfs/libxfs/xfs_log_format.h |  1 +
 fs/xfs/xfs_ioctl.c             |  5 +++++
 fs/xfs/xfs_trace.h             |  3 ++-
 fs/xfs/xfs_xattr.c             | 10 ++++++++++
 5 files changed, 27 insertions(+), 2 deletions(-)

diff --git a/fs/xfs/libxfs/xfs_da_format.h b/fs/xfs/libxfs/xfs_da_format.h
index 839df0e5401b..28d4ac6fa156 100644
--- a/fs/xfs/libxfs/xfs_da_format.h
+++ b/fs/xfs/libxfs/xfs_da_format.h
@@ -715,14 +715,22 @@ struct xfs_attr3_leafblock {
 #define	XFS_ATTR_ROOT_BIT	1	/* limit access to trusted attrs */
 #define	XFS_ATTR_SECURE_BIT	2	/* limit access to secure attrs */
 #define	XFS_ATTR_PARENT_BIT	3	/* parent pointer attrs */
+#define	XFS_ATTR_VERITY_BIT	4	/* verity merkle tree and descriptor */
 #define	XFS_ATTR_INCOMPLETE_BIT	7	/* attr in middle of create/delete */
 #define XFS_ATTR_LOCAL		(1u << XFS_ATTR_LOCAL_BIT)
 #define XFS_ATTR_ROOT		(1u << XFS_ATTR_ROOT_BIT)
 #define XFS_ATTR_SECURE		(1u << XFS_ATTR_SECURE_BIT)
 #define XFS_ATTR_PARENT		(1u << XFS_ATTR_PARENT_BIT)
+#define XFS_ATTR_VERITY		(1u << XFS_ATTR_VERITY_BIT)
 #define XFS_ATTR_INCOMPLETE	(1u << XFS_ATTR_INCOMPLETE_BIT)
 #define XFS_ATTR_NSP_ONDISK_MASK \
-			(XFS_ATTR_ROOT | XFS_ATTR_SECURE | XFS_ATTR_PARENT)
+			(XFS_ATTR_ROOT | XFS_ATTR_SECURE | XFS_ATTR_PARENT | \
+			 XFS_ATTR_VERITY)
+
+/*
+ * Internal attributes not exposed to the user
+ */
+#define XFS_ATTR_INTERNAL_MASK (XFS_ATTR_PARENT | XFS_ATTR_VERITY)
 
 /*
  * Alignment for namelist and valuelist entries (since they are mixed
diff --git a/fs/xfs/libxfs/xfs_log_format.h b/fs/xfs/libxfs/xfs_log_format.h
index 9cbcba4bd363..407fadfb5c06 100644
--- a/fs/xfs/libxfs/xfs_log_format.h
+++ b/fs/xfs/libxfs/xfs_log_format.h
@@ -975,6 +975,7 @@ struct xfs_icreate_log {
 #define XFS_ATTRI_FILTER_MASK		(XFS_ATTR_ROOT | \
 					 XFS_ATTR_SECURE | \
 					 XFS_ATTR_PARENT | \
+					 XFS_ATTR_VERITY | \
 					 XFS_ATTR_INCOMPLETE)
 
 /*
diff --git a/fs/xfs/xfs_ioctl.c b/fs/xfs/xfs_ioctl.c
index d0e2cec6210d..ab61d7d552fb 100644
--- a/fs/xfs/xfs_ioctl.c
+++ b/fs/xfs/xfs_ioctl.c
@@ -352,6 +352,11 @@ static unsigned int
 xfs_attr_filter(
 	u32			ioc_flags)
 {
+	/*
+	 * Only externally visible attributes should be specified here.
+	 * Internally used attributes (such as parent pointers or fs-verity)
+	 * should not be exposed to userspace.
+	 */
 	if (ioc_flags & XFS_IOC_ATTR_ROOT)
 		return XFS_ATTR_ROOT;
 	if (ioc_flags & XFS_IOC_ATTR_SECURE)
diff --git a/fs/xfs/xfs_trace.h b/fs/xfs/xfs_trace.h
index d4f1b2da21e7..9d4ae05abfc8 100644
--- a/fs/xfs/xfs_trace.h
+++ b/fs/xfs/xfs_trace.h
@@ -87,7 +87,8 @@ struct xfs_bmap_intent;
 	{ XFS_ATTR_ROOT,	"ROOT" }, \
 	{ XFS_ATTR_SECURE,	"SECURE" }, \
 	{ XFS_ATTR_INCOMPLETE,	"INCOMPLETE" }, \
-	{ XFS_ATTR_PARENT,	"PARENT" }
+	{ XFS_ATTR_PARENT,	"PARENT" }, \
+	{ XFS_ATTR_VERITY,	"VERITY" }
 
 DECLARE_EVENT_CLASS(xfs_attr_list_class,
 	TP_PROTO(struct xfs_attr_list_context *ctx),
diff --git a/fs/xfs/xfs_xattr.c b/fs/xfs/xfs_xattr.c
index 364104e1b38a..e4c88dde4e44 100644
--- a/fs/xfs/xfs_xattr.c
+++ b/fs/xfs/xfs_xattr.c
@@ -20,6 +20,13 @@
 
 #include <linux/posix_acl_xattr.h>
 
+/*
+ * This file defines interface to work with externally visible extended
+ * attributes, such as those in user, system or security namespaces. This
+ * interface should not be used for internally used attributes (consider
+ * xfs_attr.c).
+ */
+
 /*
  * Get permission to use log-assisted atomic exchange of file extents.
  *
@@ -244,6 +251,9 @@ xfs_xattr_put_listent(
 
 	ASSERT(context->count >= 0);
 
+	if (flags & XFS_ATTR_INTERNAL_MASK)
+		return;
+
 	if (flags & XFS_ATTR_ROOT) {
 #ifdef CONFIG_XFS_POSIX_ACL
 		if (namelen == SGI_ACL_FILE_SIZE &&
-- 
2.42.0

