Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCCD328468C
	for <fsverity@lists.linux.dev>; Mon, 28 Jul 2025 20:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753734711; cv=none; b=uQMX9pXtON8G4+0r/l+JurpGZe/yj2HylS4xICyyWrPoyH2BkVl7k2CAxfpOPcwDoClCZJOTYB5xh0wWRwZsgkAevZNoDiz6rHyr4oQAtDiGDPjjDBgdZd+edIlcWHzuA0BS3L4cRKoW5fqrzsKmPFiz2Shx+X0Rijpo05osx24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753734711; c=relaxed/simple;
	bh=Gxk0sEzaoSe6VlllYrbpg0OQx06bmUypx376lLazOAg=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=KXWIgA9PeNwyeLPOJeK8ATpNJmfLdaeRzMhtjdeQwSObAAmGwa4YkIx+MGAaOFSY76djABF2kgxZFAtviSOySok8zL+wi4KQ/KNtYh9SWVmJSTB77w0rz0RDbIB8Y80pbrkCcqQDMZCC7dxz68ax+sHAMoKh4mVfMmrSPEKZ1BY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=F6pUlHPK; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="F6pUlHPK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753734709;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kadtEc6XcQ4iDH67DyLSEX0+QliysQnNpS7dMO0XPTo=;
	b=F6pUlHPK80qE6gWJTbMB+eO57ccm+5Cj0zgv8yhqICTBqp7cAS9AnSeQGXKchZDf9WenUd
	vqoIIBeBOtMlj24W/SlyBwo4SGP/zVBgMATUQsjYNzCjBvtsDY1YxMOVLBmetIk4i0Ag49
	FEgYNavGm1qkxvyyl+jZ7d/gG1ZySm0=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-271-TsBogLpyN5uE_wJBlU5VXg-1; Mon, 28 Jul 2025 16:31:47 -0400
X-MC-Unique: TsBogLpyN5uE_wJBlU5VXg-1
X-Mimecast-MFC-AGG-ID: TsBogLpyN5uE_wJBlU5VXg_1753734706
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-adb33457610so619406866b.3
        for <fsverity@lists.linux.dev>; Mon, 28 Jul 2025 13:31:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753734706; x=1754339506;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kadtEc6XcQ4iDH67DyLSEX0+QliysQnNpS7dMO0XPTo=;
        b=gB5zGNZsDCr8JSYFPJseE5AjR37B93QmQ7F7yyKemgntMR2T1Wsa553hlbOfiDvBln
         5Ff+LG2sfGBgMc9WaF4xpS3a5h8X19aIGj/BcBSlM1XshM6yqo5B+ww7JpxXi1nQeB+/
         J1691ES4FzfIq27dkOrUbhlUUMvJbBSi6mrbAZLdJR0lgkgr7+kXwUHHHcQKO9QilMd5
         dk9k+xm9UZuACK/Zx4Vef7IBEeInjN9wv6ImdyNL/lLILQjUoe65DvWzAYaTiiI4wmDQ
         7RwwYv51mhAFFGWoAOVhQSAE7y7lcIc7gRZ2rT9qG36J80CpLvVK1SiGFSdiapWQVG3h
         S5Cg==
X-Gm-Message-State: AOJu0YyDA+etEJo5m892Jtx11jBmWDWCTAuUWbp6FTDOTx9UHNptYOym
	d0r7/+EXcKGFTPiXwWu8BsDzM4iUHKmrN8smoe5iTJ34GvfM/OZ3a34+W+tq3NsbDo45o8qsKNP
	rt9jNfhPed2NBYjaIlDn/2Ft0rMMKNxd3QobqIC/nRBINKJ0sfeRv7kWHK/M=
X-Gm-Gg: ASbGncvulXYzqrC937V6Zjc0voq0viPduqDFbyyq3Ds+taEsksemA2c+MHKwUr7W9Uq
	Bk6AfM92oRBpFs65YQ3mhLRpU3seGM5KhSVM9KOPx9lIy5YYcgeu8vVMDdEXybrJ+IkA2wGtg9P
	DlL8wr5WWxdIAr2DSCxP3mHXaKSc0Ev+fR8qip1SHWKPQzZTMimyhxUaFkqPmOPdttMF96pik//
	aOGQALRk5KP4LFqD6W80VnewgFZbRpCUCi9kCbsqH24NOg+JqLDU7nOyzZdsRzbNUisryL6C1ph
	2kLfQu0wADc9RJup2FTzxbyB9wqFpXu7TiK0O75JmmTZeA==
X-Received: by 2002:a05:6402:5192:b0:615:5353:5e2c with SMTP id 4fb4d7f45d1cf-61553535e94mr3299446a12.19.1753734705935;
        Mon, 28 Jul 2025 13:31:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF3EwyequldE0yYkC1LWl4McATzdbfZq53i6FBVks/dB/ZeKteI7CUgbwJVMwJBiBKyVNXP/g==
X-Received: by 2002:a05:6402:5192:b0:615:5353:5e2c with SMTP id 4fb4d7f45d1cf-61553535e94mr3299415a12.19.1753734705480;
        Mon, 28 Jul 2025 13:31:45 -0700 (PDT)
Received: from [127.0.0.2] (ip-217-030-074-039.aim-net.cz. [217.30.74.39])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615226558d3sm2730656a12.45.2025.07.28.13.31.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 13:31:45 -0700 (PDT)
From: Andrey Albershteyn <aalbersh@redhat.com>
X-Google-Original-From: Andrey Albershteyn <aalbersh@kernel.org>
Date: Mon, 28 Jul 2025 22:30:28 +0200
Subject: [PATCH RFC 24/29] xfs: advertise fs-verity being available on
 filesystem
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <20250728-fsverity-v1-24-9e5443af0e34@kernel.org>
References: <20250728-fsverity-v1-0-9e5443af0e34@kernel.org>
In-Reply-To: <20250728-fsverity-v1-0-9e5443af0e34@kernel.org>
To: fsverity@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
 linux-xfs@vger.kernel.org, david@fromorbit.com, djwong@kernel.org, 
 ebiggers@kernel.org, hch@lst.de
Cc: Andrey Albershteyn <aalbersh@redhat.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1332; i=aalbersh@kernel.org;
 h=from:subject:message-id; bh=be/wykvZj9niA0ffxchNInZGSfvYSVY4KIFdLfTfwME=;
 b=owJ4nJvAy8zAJea2/JXEGuOHHIyn1ZIYMtrvSYRrfQqvnTzJc5kOT/JrS84vL0XmhAgsfH5pq
 8F5meCH/Zs7SlkYxLgYZMUUWdZJa01NKpLKP2JQIw8zh5UJZAgDF6cATGRrCiPDLTc2e0bHNdE+
 ZTv3y03+6GC6vfw5Y0DUwsuTXHYarsj5wciwmf3qDcFU7373qwYy2uUMDF1nvy9wPP6tYMf9+lU
 917awAwDOlUbj
X-Developer-Key: i=aalbersh@kernel.org; a=openpgp;
 fpr=AE1B2A9562721A6FC4307C1F46A7EA18AC33E108
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NoY6vwkQTH9d_TZGfzdupOvjz3UVjKw-NJE0oZ92eI4_1753734706
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

From: "Darrick J. Wong" <djwong@kernel.org>

Advertise that this filesystem supports fsverity.

Signed-off-by: Darrick J. Wong <djwong@kernel.org>
Reviewed-by: Andrey Albershteyn <aalbersh@redhat.com>
---
 fs/xfs/libxfs/xfs_fs.h | 1 +
 fs/xfs/libxfs/xfs_sb.c | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/fs/xfs/libxfs/xfs_fs.h b/fs/xfs/libxfs/xfs_fs.h
index 12463ba766da..9d07c7872e94 100644
--- a/fs/xfs/libxfs/xfs_fs.h
+++ b/fs/xfs/libxfs/xfs_fs.h
@@ -250,6 +250,7 @@ typedef struct xfs_fsop_resblks {
 #define XFS_FSOP_GEOM_FLAGS_PARENT	(1 << 25) /* linux parent pointers */
 #define XFS_FSOP_GEOM_FLAGS_METADIR	(1 << 26) /* metadata directories */
 #define XFS_FSOP_GEOM_FLAGS_ZONED	(1 << 27) /* zoned rt device */
+#define XFS_FSOP_GEOM_FLAGS_VERITY	(1 << 28) /* fs-verity */
 
 /*
  * Minimum and maximum sizes need for growth checks.
diff --git a/fs/xfs/libxfs/xfs_sb.c b/fs/xfs/libxfs/xfs_sb.c
index e32cd2874bcd..7507518a1c72 100644
--- a/fs/xfs/libxfs/xfs_sb.c
+++ b/fs/xfs/libxfs/xfs_sb.c
@@ -1575,6 +1575,8 @@ xfs_fs_geometry(
 		geo->flags |= XFS_FSOP_GEOM_FLAGS_METADIR;
 	if (xfs_has_zoned(mp))
 		geo->flags |= XFS_FSOP_GEOM_FLAGS_ZONED;
+	if (xfs_has_verity(mp))
+		geo->flags |= XFS_FSOP_GEOM_FLAGS_VERITY;
 	geo->rtsectsize = sbp->sb_blocksize;
 	geo->dirblocksize = xfs_dir2_dirblock_bytes(sbp);
 

-- 
2.50.0

