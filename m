Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051D745013
	for <fsverity@lists.linux.dev>; Mon, 12 Feb 2024 17:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707757231; cv=none; b=K9wkxbSTDU6SmDQ1Ujvuiq3sL9qq8gIH60aGUc4J2mKnPiOAsqOXZLIpuzw/L9ONJpk3KEBJrBiMpkmWvpJ1I8FLuo2ZbNQrawN3/PAwjuxoUbblaBrtAzIax/KL8cpQbtgk9WOnTtrZOU5NUZ2RbwGbIOpthEtAC53hGf/5YPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707757231; c=relaxed/simple;
	bh=YOeOw6KtPMpEfhCDXm/Z9NhM8n2QAyzwIfav1+RaVLc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IKlan81whUEHZY6ez38VgoCdkfhv5bj1IxddQWspV3uSz3NQl8SZkb3xxfQJT7u0YHe8wGVRNL2qllXi/x3zapzj4XCb3yAaih6WIBfqnmawdLDSND52nhWdjbLGCIoiurikAN1R585A0D/AGTsHTEOHOJE10qO3s97yPgFebDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=D8SJIVfV; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D8SJIVfV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707757228;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9e7oB1ZKkqE1/ExZ0FRyhaGlyLumWOw/BjQhwlJ8uVw=;
	b=D8SJIVfVyRBGIqAupBgBX8OPYClhiuWiQBVKKB8VR0AjLRH46qNMYDLQQVdJw545M4xu7o
	e4OW7mvf+5s0kk5guX6Pk+xT6IuxiNGnSZWiOG4TWd+JzmTQriG5Cu8z53c7COM9PEM2Uf
	JehmSz8GlQF7T0j9P1ZhFaOo/iXO/74=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-621-t-VyfkarNEiSMOREYKaUbg-1; Mon, 12 Feb 2024 12:00:26 -0500
X-MC-Unique: t-VyfkarNEiSMOREYKaUbg-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-5613caa5f21so1760428a12.3
        for <fsverity@lists.linux.dev>; Mon, 12 Feb 2024 09:00:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707757225; x=1708362025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9e7oB1ZKkqE1/ExZ0FRyhaGlyLumWOw/BjQhwlJ8uVw=;
        b=kyreZLlTcyBIXqUHIr36jbVc/qzPqaacnMXByMRdOjT1z7+bi0N/nDko6JCyaOBwSq
         T83P3prlnG63gKeNAv/J7izDySo3erXcLI93jkbjknM3VZS4/2VqIHC94pqPOT0oZV5l
         8ovicMMISIgJuw0WhrzBXz7hzuPTJN/dx4zj1vzv5mxphXVWSwG3oKVJXUdWwxvLEgII
         dubsD6AwGxE15XaY2+BMY1ykMZk85x9ncK9AMsTILTmZqPn+54K37L1kfMa7RQBVIQHc
         8xoowQilmy45OJEgj17o7PEbXTuN9I1EKmBCOkSNobLHuTb+p4q9Yx9bsu9LKMYW7be3
         t4GA==
X-Gm-Message-State: AOJu0Yy/o2IWpwd4iO5Wq+LSrUmTmWaWCnupa563zs0bIL3KheTwSCPr
	sbuUTZi9nxLaW/yag/5lZDqAubXWrEwNLJkzLV3YBWhNX5DX2xm9j8aHR82lN7mYDmo4m+0wmap
	nbRmO+X4ce1oxPtsQ0iR3aqhbX4N2G0j4SX+RXOD9A9deZmu4Z/MjGRoxDyL2rEPFXKsmS+USUy
	9g3QXCkAY24ba3lDWSw4bMJxnOEbEcycxDZISMF10=
X-Received: by 2002:a05:6402:b86:b0:561:8bc4:b05f with SMTP id cf6-20020a0564020b8600b005618bc4b05fmr3774687edb.0.1707757225384;
        Mon, 12 Feb 2024 09:00:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFvE/KNVEA8sjxOeGFkeZw+80fBpxWhXZhf/YA0PJnuhaTIDH6fJT1TzvZ1+/5L6O1QV86bRA==
X-Received: by 2002:a05:6402:b86:b0:561:8bc4:b05f with SMTP id cf6-20020a0564020b8600b005618bc4b05fmr3774674edb.0.1707757225103;
        Mon, 12 Feb 2024 09:00:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUxhzEnZsbrIW5ntwlAso9rR1RXR6wMwsKLEZAURItKAlHxOTZpXXk//KErSQyBEO5t4xpAXZ0vDqA8X2RcFIRn9WnYwXDIqu0P7/Uu3jI+3Xltem4uDRgS1XTxukmgySaw5GZN7IDa1Vy6tlSgmkVRkyb2IOkF9bpHxYkammVkHBpqRcckWFuXKg8cP+kXzYsWYvz3HRagDyByWyBO6s3AHde6Xr/froZ0
Received: from thinky.redhat.com ([109.183.6.197])
        by smtp.gmail.com with ESMTPSA id 14-20020a0564021f4e00b0056176e95a88sm2620261edz.32.2024.02.12.09.00.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 09:00:24 -0800 (PST)
From: Andrey Albershteyn <aalbersh@redhat.com>
To: fsverity@lists.linux.dev,
	linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	chandan.babu@oracle.com,
	djwong@kernel.org,
	ebiggers@kernel.org
Cc: Andrey Albershteyn <aalbersh@redhat.com>
Subject: [PATCH v4 25/25] xfs: enable ro-compat fs-verity flag
Date: Mon, 12 Feb 2024 17:58:22 +0100
Message-Id: <20240212165821.1901300-26-aalbersh@redhat.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240212165821.1901300-1-aalbersh@redhat.com>
References: <20240212165821.1901300-1-aalbersh@redhat.com>
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

Finalize fs-verity integration in XFS by making kernel fs-verity
aware with ro-compat flag.

Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
---
 fs/xfs/libxfs/xfs_format.h | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/fs/xfs/libxfs/xfs_format.h b/fs/xfs/libxfs/xfs_format.h
index ea78b595aa97..0cb5bf9142b7 100644
--- a/fs/xfs/libxfs/xfs_format.h
+++ b/fs/xfs/libxfs/xfs_format.h
@@ -355,10 +355,11 @@ xfs_sb_has_compat_feature(
 #define XFS_SB_FEAT_RO_COMPAT_INOBTCNT (1 << 3)		/* inobt block counts */
 #define XFS_SB_FEAT_RO_COMPAT_VERITY   (1 << 4)		/* fs-verity */
 #define XFS_SB_FEAT_RO_COMPAT_ALL \
-		(XFS_SB_FEAT_RO_COMPAT_FINOBT | \
-		 XFS_SB_FEAT_RO_COMPAT_RMAPBT | \
-		 XFS_SB_FEAT_RO_COMPAT_REFLINK| \
-		 XFS_SB_FEAT_RO_COMPAT_INOBTCNT)
+		(XFS_SB_FEAT_RO_COMPAT_FINOBT  | \
+		 XFS_SB_FEAT_RO_COMPAT_RMAPBT  | \
+		 XFS_SB_FEAT_RO_COMPAT_REFLINK | \
+		 XFS_SB_FEAT_RO_COMPAT_INOBTCNT| \
+		 XFS_SB_FEAT_RO_COMPAT_VERITY)
 #define XFS_SB_FEAT_RO_COMPAT_UNKNOWN	~XFS_SB_FEAT_RO_COMPAT_ALL
 static inline bool
 xfs_sb_has_ro_compat_feature(
-- 
2.42.0

