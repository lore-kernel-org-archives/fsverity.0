Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D84626E04
	for <fsverity@lists.linux.dev>; Fri,  6 Oct 2023 18:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BXGcQUmj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1696618384;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y62cirHyxw1nxIK5GngI9l6eX0UynAIUbjFVCcsuark=;
	b=BXGcQUmj9kn69YmziLarC6SGVkSDRYW6GeeK4DjjinP0KssoxVcEApm8UYu/6wmLid8udc
	JomeQ3BK61Dr2IoHeQRIYlP0CMe6g9+cTlqTGIe5bcZENlT6/gpNiBhREpkbGyO54Y8ffA
	SPkV7Ud1Z+7zV0Cq8X8PNcYCs0aNWXk=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-252-Hgf3mnUMPiK-eGGisHyhqA-1; Fri, 06 Oct 2023 14:53:03 -0400
X-MC-Unique: Hgf3mnUMPiK-eGGisHyhqA-1
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-5344aaf2703so2121542a12.0
        for <fsverity@lists.linux.dev>; Fri, 06 Oct 2023 11:53:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696618382; x=1697223182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y62cirHyxw1nxIK5GngI9l6eX0UynAIUbjFVCcsuark=;
        b=J/Zoymwiakh1qY3YUHfJka8P+fylhRGoxpZJtIA+2ExM4n8YxUP8PSfv1Ym5NOISZ8
         /PJ/S4i//LTdjZs8usPktbDZva9C+P+XASDZEjMwOTVOBWsxHbGL2ziMEjxNqThlAXwf
         gCQ7O8ZN/h5z5/oLqHpzfE3mwzy4rVzE2ArX+wF1KtF5yBISc/CE/oIk5LsHotWRe/LW
         lGMPDqRC4WArWJfKy18HSk6Ia88JKBzbVkDGBYQ+FzOIvOst31seMiw4pIWaPjacO7i4
         qJd7JYuJYj9u5E/x/5cACLrgFyHFhRzptiUevMb2fZTYJiLFDks6gJbJzMWlpjyqsX4x
         587Q==
X-Gm-Message-State: AOJu0Yx5JIqtqIEsOjQ607QRqex6u+CU0db2ifDZ8Dxg0CVDm47z1K0O
	Lfpgi1UzDI1FdX2wdU2n7ZRHCuh4P/q8oOENv8ZEtHLG1UhqxtJp8DVjgrv0G31JZjQoUqsjjrt
	QqUQM5P4keKTp4ji10x9qp34DXw==
X-Received: by 2002:a05:6402:344a:b0:523:4025:49f0 with SMTP id l10-20020a056402344a00b00523402549f0mr7657522edc.26.1696618381783;
        Fri, 06 Oct 2023 11:53:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFVZ+8RYyWx/WXsHj7JKes+e1LLF/dLUz0XxHhOXmY4bfEBU5dLyL1gt2j4iCnrrEatFiiqNw==
X-Received: by 2002:a17:906:3ca9:b0:9ba:7f5:3602 with SMTP id b9-20020a1709063ca900b009ba07f53602mr583721ejh.60.1696618360843;
        Fri, 06 Oct 2023 11:52:40 -0700 (PDT)
Received: from localhost.localdomain ([109.183.6.197])
        by smtp.gmail.com with ESMTPSA id os5-20020a170906af6500b009b947f81c4asm3304741ejb.155.2023.10.06.11.52.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 11:52:40 -0700 (PDT)
From: Andrey Albershteyn <aalbersh@redhat.com>
To: linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	fsverity@lists.linux.dev
Cc: djwong@kernel.org,
	ebiggers@kernel.org,
	david@fromorbit.com,
	dchinner@redhat.com,
	Andrey Albershteyn <aalbersh@redhat.com>
Subject: [PATCH v3 24/28] xfs: disable direct read path for fs-verity sealed files
Date: Fri,  6 Oct 2023 20:49:18 +0200
Message-Id: <20231006184922.252188-25-aalbersh@redhat.com>
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

The direct path is not supported on verity files. Attempts to use direct
I/O path on such files should fall back to buffered I/O path.

Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
---
 fs/xfs/xfs_file.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/fs/xfs/xfs_file.c b/fs/xfs/xfs_file.c
index a92c8197c26a..7363cbdff803 100644
--- a/fs/xfs/xfs_file.c
+++ b/fs/xfs/xfs_file.c
@@ -244,7 +244,8 @@ xfs_file_dax_read(
 	struct kiocb		*iocb,
 	struct iov_iter		*to)
 {
-	struct xfs_inode	*ip = XFS_I(iocb->ki_filp->f_mapping->host);
+	struct inode		*inode = iocb->ki_filp->f_mapping->host;
+	struct xfs_inode	*ip = XFS_I(inode);
 	ssize_t			ret = 0;
 
 	trace_xfs_file_dax_read(iocb, to);
@@ -297,10 +298,17 @@ xfs_file_read_iter(
 
 	if (IS_DAX(inode))
 		ret = xfs_file_dax_read(iocb, to);
-	else if (iocb->ki_flags & IOCB_DIRECT)
+	else if (iocb->ki_flags & IOCB_DIRECT && !fsverity_active(inode))
 		ret = xfs_file_dio_read(iocb, to);
-	else
+	else {
+		/*
+		 * In case fs-verity is enabled, we also fallback to the
+		 * buffered read from the direct read path. Therefore,
+		 * IOCB_DIRECT is set and need to be cleared
+		 */
+		iocb->ki_flags &= ~IOCB_DIRECT;
 		ret = xfs_file_buffered_read(iocb, to);
+	}
 
 	if (ret > 0)
 		XFS_STATS_ADD(mp, xs_read_bytes, ret);
-- 
2.40.1

