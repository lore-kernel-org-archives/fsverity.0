Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E334427C84B
	for <fsverity@lists.linux.dev>; Mon, 28 Jul 2025 20:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753734702; cv=none; b=sPildd1E1wFFA77LJrILkx9sTStvFnVa9wNnwCBKZnFRYQlf0MxmK93ZGIj88RPiO3C1Vd9JLgg4jvVSExK/0O51vsHG8c2unYsjndcZ8oQak7i4KZkynPWRLCIOdWag/dYFDIych9XP0lKlthrKo9Zg2hL142L4BY2+BKPXyMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753734702; c=relaxed/simple;
	bh=x5Nz15KXwUIsABy9dFJxBXLugqrRmEQkQIjmRIGsyMM=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=H1EC1NEMRAx/y3P8cLMEE+Xmd923IpzYy8NHopy7oW58SvaiNHN3MflXJdicHG3SSlkpoUP1h3uxgsY6WXdeb05hwplkO/V27CoApMLL7tgnNqBL+GTuznjaJ05ObD72rnL6FuRjadISSTV7Q3d1QU3Tjc1+YPIWfBhgPD3wU0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=b4STjRBd; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="b4STjRBd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753734700;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zG3xbYkfyqe9KTbJIkVzQy7IvrDkvNxqTUGdcuAb7ck=;
	b=b4STjRBdhwmiUldv9VlqBmc54Z86i3UCZOGYLFvt+MekHzC/NJFIDUbXKjAKWxj2pIBGDW
	3l8GZW9DNDNt5i3A9j2Od1oaC9WiJ4MQnMF40L4ujzr6FzOqk/beMFaOYlc4pGUMG867Pe
	sUVNnHlv1lVSo2/pndxG9HL5SbFieno=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-651-mL1CZHS6PdSn-Y0_E--Oxw-1; Mon, 28 Jul 2025 16:31:37 -0400
X-MC-Unique: mL1CZHS6PdSn-Y0_E--Oxw-1
X-Mimecast-MFC-AGG-ID: mL1CZHS6PdSn-Y0_E--Oxw_1753734696
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-607c91a207dso5409221a12.2
        for <fsverity@lists.linux.dev>; Mon, 28 Jul 2025 13:31:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753734695; x=1754339495;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zG3xbYkfyqe9KTbJIkVzQy7IvrDkvNxqTUGdcuAb7ck=;
        b=fbmU+78TRZgLLyfwI9uCQpgjgky9SmVFHDzbiA/Z2v8Q8aHjDqmcWWA03tSZBRX7HK
         2uF8fiEmo4INh9KUtUterDpjutXW0kOXJt5flMjcQRJLLhG91gJsvrdp2HcT6IjVId1s
         HdjF6iZZ0J0g9UX50BO9vvjowNkZfpRrfoApWNbGE5Ux4vXFSe+T2esAbNy50Rbc6KD4
         rmxNBwvos/cmYV/MsGp7cIEsyEF8rwtsaZpk1mX5lYim8lXTp9P9qqH4SYQrLTSfqOdX
         EJgMc3fbUlzGoD9kH7waHJKWnQ0RfSUJeWwEQbBL2U23Xh8fRu0NVrY2lBqDjKD1iAot
         zZLg==
X-Gm-Message-State: AOJu0YxOEjm+XHHKRvN6SWuwf3lGLNs33M3akP/QhomSrW03WSd7yT69
	HW0Czm8brfq7IRX4G/9zG5OXwvqdaob5WEJmg2xH7h6ULAsmitvm9hduXLPP72SNl1JEqo9gi01
	inMP0UMBH7zvcb+9SHhdbdWPLIRB8EKFc3Qmy4S4wxKBxaaf8xKHyPRXSPTxOuDS1LLA=
X-Gm-Gg: ASbGncuYmad6Rbvv7G/hjFU/Hykfy5t60l3ESBxzsEU820EbRHzJWlplivklZ6cG9Mi
	uNrMtRtwyA04pJe00HqCeznvTX/M3mlqsHPoTf6/HmNGyMNFeV9BAxe/sAMpvGD6/DOPFKYiyk/
	mTg1kgbgp9v2RYdnHGrojQMH6n0w8gAdhdhiz/DhYtzLvuyHMcXaj/Bx2Lof4oAXyakNIhobCk2
	BNfscXox4DNavfAfyhrsSWs66/t/JY5+QKWfDjUT5AjjwXH2q7IJS2QHe6eH21rqc5fzZUEQMV7
	oEcWyldkgd89CX5lMZmMj72C+MDAx8AlZyrSGLveW7sEFg==
X-Received: by 2002:a05:6402:358b:b0:601:dc49:a99f with SMTP id 4fb4d7f45d1cf-614f1db598cmr12917547a12.18.1753734695384;
        Mon, 28 Jul 2025 13:31:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGslpLgFD2Wk4HYPGoKY6j2Y+H5h+F7xWmB6k7wiNuq+J2qJjWUKwsn2fyKFE6+B/xOhudYrg==
X-Received: by 2002:a05:6402:358b:b0:601:dc49:a99f with SMTP id 4fb4d7f45d1cf-614f1db598cmr12917527a12.18.1753734694935;
        Mon, 28 Jul 2025 13:31:34 -0700 (PDT)
Received: from [127.0.0.2] (ip-217-030-074-039.aim-net.cz. [217.30.74.39])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615226558d3sm2730656a12.45.2025.07.28.13.31.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 13:31:34 -0700 (PDT)
From: Andrey Albershteyn <aalbersh@redhat.com>
X-Google-Original-From: Andrey Albershteyn <aalbersh@kernel.org>
Date: Mon, 28 Jul 2025 22:30:18 +0200
Subject: [PATCH RFC 14/29] xfs: add attribute type for fs-verity
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <20250728-fsverity-v1-14-9e5443af0e34@kernel.org>
References: <20250728-fsverity-v1-0-9e5443af0e34@kernel.org>
In-Reply-To: <20250728-fsverity-v1-0-9e5443af0e34@kernel.org>
To: fsverity@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
 linux-xfs@vger.kernel.org, david@fromorbit.com, djwong@kernel.org, 
 ebiggers@kernel.org, hch@lst.de
Cc: Andrey Albershteyn <aalbersh@redhat.com>, 
 Andrey Albershteyn <aalbersh@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3358; i=aalbersh@kernel.org;
 h=from:subject:message-id; bh=Roew8FJKORyBWKNq9tpryFTwDISUNruUQdRNGAZxZLU=;
 b=owJ4nJvAy8zAJea2/JXEGuOHHIyn1ZIYMtrvSXjMj7tmYCRmz+O04+a3zRtsbaoi53Eu82rd6
 HHfc5Vaj3JHKQuDGBeDrJgiyzppralJRVL5Rwxq5GHmsDKBDGHg4hSAiXgtZGTY9DJQ30u/yoar
 Y80ykZmJC0RMvFb1Tfw+ey/ncsGEd39XMvx3SjnI375XeIXoRPslaT8uFzD4nZc+sollxhHOxm9
 35tfwAwAb2UWG
X-Developer-Key: i=aalbersh@kernel.org; a=openpgp;
 fpr=AE1B2A9562721A6FC4307C1F46A7EA18AC33E108
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: gpR_YtBYkjXegX1fyuzd7-OkPfsbZpfpZ-5qKe_cRus_1753734696
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

From: Andrey Albershteyn <aalbersh@redhat.com>

The fsverity descriptor is stored in the extended attributes of the
inode. Add new attribute type for fs-verity metadata. Add
XFS_ATTR_INTERNAL_MASK to skip parent pointer and fs-verity attributes
as those are only for internal use. While we're at it add a few comments
in relevant places that internally visible attributes are not suppose to
be handled via interface defined in xfs_xattr.c.

Reviewed-by: Darrick J. Wong <djwong@kernel.org>
Signed-off-by: Darrick J. Wong <djwong@kernel.org>
Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org>
---
 fs/xfs/libxfs/xfs_da_format.h  | 11 ++++++++---
 fs/xfs/libxfs/xfs_log_format.h |  1 +
 fs/xfs/xfs_trace.h             |  3 ++-
 3 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/fs/xfs/libxfs/xfs_da_format.h b/fs/xfs/libxfs/xfs_da_format.h
index 86de99e2f757..e5274be2fe9c 100644
--- a/fs/xfs/libxfs/xfs_da_format.h
+++ b/fs/xfs/libxfs/xfs_da_format.h
@@ -715,19 +715,23 @@ struct xfs_attr3_leafblock {
 #define	XFS_ATTR_ROOT_BIT	1	/* limit access to trusted attrs */
 #define	XFS_ATTR_SECURE_BIT	2	/* limit access to secure attrs */
 #define	XFS_ATTR_PARENT_BIT	3	/* parent pointer attrs */
+#define	XFS_ATTR_VERITY_BIT	4	/* verity descriptor */
 #define	XFS_ATTR_INCOMPLETE_BIT	7	/* attr in middle of create/delete */
 #define XFS_ATTR_LOCAL		(1u << XFS_ATTR_LOCAL_BIT)
 #define XFS_ATTR_ROOT		(1u << XFS_ATTR_ROOT_BIT)
 #define XFS_ATTR_SECURE		(1u << XFS_ATTR_SECURE_BIT)
 #define XFS_ATTR_PARENT		(1u << XFS_ATTR_PARENT_BIT)
+#define XFS_ATTR_VERITY		(1u << XFS_ATTR_VERITY_BIT)
 #define XFS_ATTR_INCOMPLETE	(1u << XFS_ATTR_INCOMPLETE_BIT)
 
 #define XFS_ATTR_NSP_ONDISK_MASK	(XFS_ATTR_ROOT | \
 					 XFS_ATTR_SECURE | \
-					 XFS_ATTR_PARENT)
+					 XFS_ATTR_PARENT | \
+					 XFS_ATTR_VERITY)
 
 /* Private attr namespaces not exposed to userspace */
-#define XFS_ATTR_PRIVATE_NSP_MASK	(XFS_ATTR_PARENT)
+#define XFS_ATTR_PRIVATE_NSP_MASK	(XFS_ATTR_PARENT | \
+					 XFS_ATTR_VERITY)
 
 #define XFS_ATTR_ONDISK_MASK	(XFS_ATTR_NSP_ONDISK_MASK | \
 				 XFS_ATTR_LOCAL | \
@@ -737,7 +741,8 @@ struct xfs_attr3_leafblock {
 	{ XFS_ATTR_LOCAL,	"local" }, \
 	{ XFS_ATTR_ROOT,	"root" }, \
 	{ XFS_ATTR_SECURE,	"secure" }, \
-	{ XFS_ATTR_PARENT,	"parent" }
+	{ XFS_ATTR_PARENT,	"parent" }, \
+	{ XFS_ATTR_VERITY,	"verity" }
 
 /*
  * Alignment for namelist and valuelist entries (since they are mixed
diff --git a/fs/xfs/libxfs/xfs_log_format.h b/fs/xfs/libxfs/xfs_log_format.h
index 0d637c276db0..57721f092c80 100644
--- a/fs/xfs/libxfs/xfs_log_format.h
+++ b/fs/xfs/libxfs/xfs_log_format.h
@@ -1051,6 +1051,7 @@ struct xfs_icreate_log {
 #define XFS_ATTRI_FILTER_MASK		(XFS_ATTR_ROOT | \
 					 XFS_ATTR_SECURE | \
 					 XFS_ATTR_PARENT | \
+					 XFS_ATTR_VERITY | \
 					 XFS_ATTR_INCOMPLETE)
 
 /*
diff --git a/fs/xfs/xfs_trace.h b/fs/xfs/xfs_trace.h
index ba45d801df1c..50034c059e8c 100644
--- a/fs/xfs/xfs_trace.h
+++ b/fs/xfs/xfs_trace.h
@@ -108,7 +108,8 @@ struct xfs_open_zone;
 	{ XFS_ATTR_ROOT,	"ROOT" }, \
 	{ XFS_ATTR_SECURE,	"SECURE" }, \
 	{ XFS_ATTR_INCOMPLETE,	"INCOMPLETE" }, \
-	{ XFS_ATTR_PARENT,	"PARENT" }
+	{ XFS_ATTR_PARENT,	"PARENT" }, \
+	{ XFS_ATTR_VERITY,	"VERITY" }
 
 DECLARE_EVENT_CLASS(xfs_attr_list_class,
 	TP_PROTO(struct xfs_attr_list_context *ctx),

-- 
2.50.0

