Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2C2279910
	for <fsverity@lists.linux.dev>; Mon, 28 Jul 2025 20:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753734714; cv=none; b=n6X/yLLjT9qN8Ke22cTLURxdE6v4FzFKcFlx4GohlTLNI5OHRb5NSUb5qKo16emEmMmNUfPHtQ7Zp3xgSvcwHSA4RjOY3Sxu0SD86ENRO9VqrjAIWPR+j9SqHuU0X5zdqlKnhntydxFI4bip3+FjYn7KZYvafqP7CySt2PLVRCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753734714; c=relaxed/simple;
	bh=ZoQQOuWpUinU7pFJdbnUgWRTEgO2Zq5/dHaw2LVYG6o=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=itKHxw3Dgv3GqkNPhJZujtAsLddhFH94nViCrtnF88ArZunhrR/HBYORugX8ocId3knYJmRypJ90XGy4SA/sMsxxM5wwC8aT2mVFVhAA9g551wAK3ygnPaTr6K4tuTUh2EOjrZ0KZ0ANoUNX1e9ORaoYAG2f0+q9fdofM77GuJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SubbAkuH; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SubbAkuH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753734711;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kyEV+/w4sIA+/CyhwgIY0Ty4kfdQwpDIEQVJL9PjRC4=;
	b=SubbAkuHJk4ZZ8aWl/7/+UtDV4D9G6U+yXo4aoBaJKAgeI98G3BGrolLPeJy1ACqbbkh8B
	I3R8qxd9FTVHHLQzYblW3U3YB5Fg5wZMkYzD6TNNr2QcS+DcjORTaqZfkmFI5v7H72j8UR
	ozSWRiWk8Fwn7QllW9cJyDLRM4xOiA4=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-350-XMS5JXU2PoKuJhjCeRZqcw-1; Mon, 28 Jul 2025 16:31:50 -0400
X-MC-Unique: XMS5JXU2PoKuJhjCeRZqcw-1
X-Mimecast-MFC-AGG-ID: XMS5JXU2PoKuJhjCeRZqcw_1753734709
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-615427e06e7so1372613a12.2
        for <fsverity@lists.linux.dev>; Mon, 28 Jul 2025 13:31:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753734709; x=1754339509;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kyEV+/w4sIA+/CyhwgIY0Ty4kfdQwpDIEQVJL9PjRC4=;
        b=cm2xRK0GkC0sOFXEh9ZZ6mLZndcvuD5Xixwu+wzWuZ9u+S/ptPETDtToiVxq2rbOyM
         s8B50yUx3KcSCxjQ9tzAE1uaxd/sEgOzYFWBmIuOtcOjVq7+F8+HDeH6F86K75EYDQTH
         r2hwkEAkQMx0Oo51CGJcY5EOEelZlr7lteWQA/VEOd7t866fKFhVHmdhx08dW/Ovr6Hb
         ZOxriZWF7Lt0Wv4F9xcmwjm67Q12FfvuAzuHAGRQsLtloETIRQ/MFqMibm9jHi+eNPB3
         RBJTuYLiQb/2hGfC2gA0xQ63FaLcn5zffTe3HcWBrRIiaEaVE7lCleZHxkUmjBYRBNah
         ZJLA==
X-Gm-Message-State: AOJu0YzVjF/4nwvZZRgJnnn3cAsabkfMnd0bUwGhmPo+8J6X6fPM5CQg
	R4Rx1GrpMHiInNEWKYkpKoQPh5qpMUHHOb/7Bs0zKEK5/R9NSjeueBoFCdomkJqEAF/MF4M1QR5
	/UJ8lEY3vcO1eVPeo0q/r1oq6FuWLWO4vvx/HO7RElTICeqBiBi7XOwBgVHQ=
X-Gm-Gg: ASbGncuGZiFIF85zX+z8NFWzuU6X12d1WJNOW6TLjJriQCnMT+u1MI/bP90o4ix1xQV
	KQHFvKTpkmNCZwFWFHR7kGoJ6SndClLYap8qz0+F3KsCNB+emVCudDERhcT1+aQIpO0B5a2rLkq
	QagJpWJDfLX48DFFANcmXg3sjibsEbMaCPWk0mHE7Y0ZUcLAYvAi+slOhtxKXuFMz+Mlfi1KRig
	lP3q0Q5NzC3MpnoVYn0zAXp4RUvGJN3snd1/AD40dRv0aNX9yPXB0UpMOmtuGuq9lVm/DX+JWmb
	sc5JEWf0kdjhhrI0GkG5EgAv3PJXwEtjobDZIKDs1GEaXA==
X-Received: by 2002:a05:6402:13d0:b0:615:5bec:1df with SMTP id 4fb4d7f45d1cf-6155bec54aemr2083998a12.25.1753734709190;
        Mon, 28 Jul 2025 13:31:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQnyEM1jHy1RMGZTH+4WPcmPCTAED7ChgzLu1he+9bs9Yj3BpmMpGYXCZaT3RwMJUnrzSsSg==
X-Received: by 2002:a05:6402:13d0:b0:615:5bec:1df with SMTP id 4fb4d7f45d1cf-6155bec54aemr2083972a12.25.1753734708781;
        Mon, 28 Jul 2025 13:31:48 -0700 (PDT)
Received: from [127.0.0.2] (ip-217-030-074-039.aim-net.cz. [217.30.74.39])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615226558d3sm2730656a12.45.2025.07.28.13.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 13:31:47 -0700 (PDT)
From: Andrey Albershteyn <aalbersh@redhat.com>
X-Google-Original-From: Andrey Albershteyn <aalbersh@kernel.org>
Date: Mon, 28 Jul 2025 22:30:31 +0200
Subject: [PATCH RFC 27/29] xfs: report verity failures through the health
 system
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <20250728-fsverity-v1-27-9e5443af0e34@kernel.org>
References: <20250728-fsverity-v1-0-9e5443af0e34@kernel.org>
In-Reply-To: <20250728-fsverity-v1-0-9e5443af0e34@kernel.org>
To: fsverity@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
 linux-xfs@vger.kernel.org, david@fromorbit.com, djwong@kernel.org, 
 ebiggers@kernel.org, hch@lst.de
Cc: Andrey Albershteyn <aalbersh@redhat.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3309; i=aalbersh@kernel.org;
 h=from:subject:message-id; bh=cLsMIEE7baasRw1QmHFBJ/VCsW3/PqP8RkNUuoTyM3I=;
 b=owJ4nJvAy8zAJea2/JXEGuOHHIyn1ZIYMtrvSZyOYxC+ICbhsPA165GJMYzeFQ17qstnGG324
 VA56/N688uOUhYGMS4GWTFFlnXSWlOTiqTyjxjUyMPMYWUCGcLAxSkAE9nAz8gwjelSd/f2Y4f+
 Ge9yaF8ql2v1MKPcbf87rw/MFhwGpYf+MzIcd05/duPQEVOZyK8Lbgv4vXvqzpV9/umCdYdnn+I
 TmirMDACMD0dB
X-Developer-Key: i=aalbersh@kernel.org; a=openpgp;
 fpr=AE1B2A9562721A6FC4307C1F46A7EA18AC33E108
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: G8_nbsQTsJ37JK7VOBpfSnndgD0BKDhg5Y_Opj8afvE_1753734709
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

From: "Darrick J. Wong" <djwong@kernel.org>

Record verity failures and report them through the health system.

Signed-off-by: Darrick J. Wong <djwong@kernel.org>
Reviewed-by: Andrey Albershteyn <aalbersh@redhat.com>
---
 fs/xfs/libxfs/xfs_fs.h     |  1 +
 fs/xfs/libxfs/xfs_health.h |  4 +++-
 fs/xfs/xfs_fsverity.c      | 11 +++++++++++
 fs/xfs/xfs_health.c        |  1 +
 4 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/fs/xfs/libxfs/xfs_fs.h b/fs/xfs/libxfs/xfs_fs.h
index 9d07c7872e94..501e4e59c6c9 100644
--- a/fs/xfs/libxfs/xfs_fs.h
+++ b/fs/xfs/libxfs/xfs_fs.h
@@ -422,6 +422,7 @@ struct xfs_bulkstat {
 #define XFS_BS_SICK_SYMLINK	(1 << 6)  /* symbolic link remote target */
 #define XFS_BS_SICK_PARENT	(1 << 7)  /* parent pointers */
 #define XFS_BS_SICK_DIRTREE	(1 << 8)  /* directory tree structure */
+#define XFS_BS_SICK_DATA	(1 << 9)  /* file data */
 
 /*
  * Project quota id helpers (previously projid was 16bit only
diff --git a/fs/xfs/libxfs/xfs_health.h b/fs/xfs/libxfs/xfs_health.h
index b31000f7190c..fa91916ad072 100644
--- a/fs/xfs/libxfs/xfs_health.h
+++ b/fs/xfs/libxfs/xfs_health.h
@@ -104,6 +104,7 @@ struct xfs_rtgroup;
 /* Don't propagate sick status to ag health summary during inactivation */
 #define XFS_SICK_INO_FORGET	(1 << 12)
 #define XFS_SICK_INO_DIRTREE	(1 << 13)  /* directory tree structure */
+#define XFS_SICK_INO_DATA	(1 << 14)  /* file data */
 
 /* Primary evidence of health problems in a given group. */
 #define XFS_SICK_FS_PRIMARY	(XFS_SICK_FS_COUNTERS | \
@@ -140,7 +141,8 @@ struct xfs_rtgroup;
 				 XFS_SICK_INO_XATTR | \
 				 XFS_SICK_INO_SYMLINK | \
 				 XFS_SICK_INO_PARENT | \
-				 XFS_SICK_INO_DIRTREE)
+				 XFS_SICK_INO_DIRTREE | \
+				 XFS_SICK_INO_DATA)
 
 #define XFS_SICK_INO_ZAPPED	(XFS_SICK_INO_BMBTD_ZAPPED | \
 				 XFS_SICK_INO_BMBTA_ZAPPED | \
diff --git a/fs/xfs/xfs_fsverity.c b/fs/xfs/xfs_fsverity.c
index ec7dea4289d5..dfe7b0bcd97e 100644
--- a/fs/xfs/xfs_fsverity.c
+++ b/fs/xfs/xfs_fsverity.c
@@ -21,6 +21,7 @@
 #include "xfs_ag.h"
 #include "xfs_fsverity.h"
 #include "xfs_iomap.h"
+#include "xfs_health.h"
 #include <linux/fsverity.h>
 #include <linux/pagemap.h>
 
@@ -302,10 +303,20 @@ xfs_fsverity_write_merkle(
 	return iomap_write_region(&region);
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
 const struct fsverity_operations xfs_fsverity_ops = {
 	.begin_enable_verity		= xfs_fsverity_begin_enable,
 	.end_enable_verity		= xfs_fsverity_end_enable,
 	.get_verity_descriptor		= xfs_fsverity_get_descriptor,
 	.read_merkle_tree_page		= xfs_fsverity_read_merkle,
 	.write_merkle_tree_block	= xfs_fsverity_write_merkle,
+	.file_corrupt			= xfs_fsverity_file_corrupt,
 };
diff --git a/fs/xfs/xfs_health.c b/fs/xfs/xfs_health.c
index 7c541fb373d5..4202b8441735 100644
--- a/fs/xfs/xfs_health.c
+++ b/fs/xfs/xfs_health.c
@@ -487,6 +487,7 @@ static const struct ioctl_sick_map ino_map[] = {
 	{ XFS_SICK_INO_DIR_ZAPPED,	XFS_BS_SICK_DIR },
 	{ XFS_SICK_INO_SYMLINK_ZAPPED,	XFS_BS_SICK_SYMLINK },
 	{ XFS_SICK_INO_DIRTREE,	XFS_BS_SICK_DIRTREE },
+	{ XFS_SICK_INO_DATA,	XFS_BS_SICK_DATA },
 };
 
 /* Fill out bulkstat health info. */

-- 
2.50.0

