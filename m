Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B15628DCF
	for <fsverity@lists.linux.dev>; Fri,  6 Oct 2023 18:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MKhy+B9o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1696618360;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qlegwzOxx57sBL8Xx+R890G6fTt4C0TsMKqp0ENYz8k=;
	b=MKhy+B9oo5KeTgs3T3zdmZ1CPd+DRU1Mgp2KVD+PzbIx11wo2awB3dJUuGhkKTcGna8eht
	9rdm4EWNm6XVAY3+iDMQQGfWlLuoiXy1jPGlcUuV29QTsckoD6sDWjANABaM8wpl+Wi6WC
	3dN1KsnIBSTvkLl1wWt42XRXAf06b5Q=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-319-rettoLj5NtiIGRh5zRkUbA-1; Fri, 06 Oct 2023 14:52:38 -0400
X-MC-Unique: rettoLj5NtiIGRh5zRkUbA-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-9a681c3470fso214819266b.1
        for <fsverity@lists.linux.dev>; Fri, 06 Oct 2023 11:52:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696618357; x=1697223157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qlegwzOxx57sBL8Xx+R890G6fTt4C0TsMKqp0ENYz8k=;
        b=lB/VfmqgWxG7X7q87LDnvl4ox7c6/LRWKu/258URRxGmtaWCXti/J7t/uqxzslaTT+
         f/eWwqW6EHY51gCqDFvKd1cn+Gy4jPuYFZLgnvBhb1sBvA5kebc7FpdBXVFse/UjSfGV
         Qqp4RQYnKWQjl98uhdcHuNyiOosIOHma3ksQpH8LUUi+E4f3W790EEaU9xSuNjGcRrji
         7ZOIOUHykk6ZYeqkYO58f22SNcXGU/cT/96ouXM4eQrfabY+aq7Bjt527kxs6HimPl//
         F8xzjmfIsNFPsYC8Z4P0Dw5lCM2zMLZl0nAf7UltxTOTm1WIYVmiOtqvnrFUwT2+9/xP
         geow==
X-Gm-Message-State: AOJu0YxwLPj9sfDvSZ/nuPbTh3smTm/91F/oyJOouHMx9MaHiN38UtMY
	ecaOgDVzCh+36dxAlMZp0GOfS6wN8wKj53E/aH3I2t53+lYP1yFyHqZrTM1gIACixV54TWaUxM3
	RbfdkNwc2f9u4pJctSA==
X-Received: by 2002:a17:907:6c14:b0:9b6:f0e2:3c00 with SMTP id rl20-20020a1709076c1400b009b6f0e23c00mr6945547ejc.71.1696618357525;
        Fri, 06 Oct 2023 11:52:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFo5vp/wd7qpBKfMbuZSMXz/ISlutAnm5zYJOvUQd8UYNLU/1/w0Jimk88atuRtU9Ktn/yTFQ==
X-Received: by 2002:a17:907:6c14:b0:9b6:f0e2:3c00 with SMTP id rl20-20020a1709076c1400b009b6f0e23c00mr6945540ejc.71.1696618357335;
        Fri, 06 Oct 2023 11:52:37 -0700 (PDT)
Received: from localhost.localdomain ([109.183.6.197])
        by smtp.gmail.com with ESMTPSA id os5-20020a170906af6500b009b947f81c4asm3304741ejb.155.2023.10.06.11.52.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 11:52:36 -0700 (PDT)
From: Andrey Albershteyn <aalbersh@redhat.com>
To: linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	fsverity@lists.linux.dev
Cc: djwong@kernel.org,
	ebiggers@kernel.org,
	david@fromorbit.com,
	dchinner@redhat.com,
	Andrey Albershteyn <aalbersh@redhat.com>
Subject: [PATCH v3 20/28] xfs: add fs-verity ro-compat flag
Date: Fri,  6 Oct 2023 20:49:14 +0200
Message-Id: <20231006184922.252188-21-aalbersh@redhat.com>
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

To mark inodes sealed with fs-verity the new XFS_DIFLAG2_VERITY flag
will be added in further patch. This requires ro-compat flag to let
older kernels know that fs with fs-verity can not be modified.

Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
---
 fs/xfs/libxfs/xfs_format.h | 1 +
 fs/xfs/libxfs/xfs_sb.c     | 2 ++
 fs/xfs/xfs_mount.h         | 2 ++
 3 files changed, 5 insertions(+)

diff --git a/fs/xfs/libxfs/xfs_format.h b/fs/xfs/libxfs/xfs_format.h
index 371dc07233e0..ef617be2839c 100644
--- a/fs/xfs/libxfs/xfs_format.h
+++ b/fs/xfs/libxfs/xfs_format.h
@@ -353,6 +353,7 @@ xfs_sb_has_compat_feature(
 #define XFS_SB_FEAT_RO_COMPAT_RMAPBT   (1 << 1)		/* reverse map btree */
 #define XFS_SB_FEAT_RO_COMPAT_REFLINK  (1 << 2)		/* reflinked files */
 #define XFS_SB_FEAT_RO_COMPAT_INOBTCNT (1 << 3)		/* inobt block counts */
+#define XFS_SB_FEAT_RO_COMPAT_VERITY   (1 << 4)		/* fs-verity */
 #define XFS_SB_FEAT_RO_COMPAT_ALL \
 		(XFS_SB_FEAT_RO_COMPAT_FINOBT | \
 		 XFS_SB_FEAT_RO_COMPAT_RMAPBT | \
diff --git a/fs/xfs/libxfs/xfs_sb.c b/fs/xfs/libxfs/xfs_sb.c
index 4191da4fb669..236f3b833fa4 100644
--- a/fs/xfs/libxfs/xfs_sb.c
+++ b/fs/xfs/libxfs/xfs_sb.c
@@ -162,6 +162,8 @@ xfs_sb_version_to_features(
 		features |= XFS_FEAT_REFLINK;
 	if (sbp->sb_features_ro_compat & XFS_SB_FEAT_RO_COMPAT_INOBTCNT)
 		features |= XFS_FEAT_INOBTCNT;
+	if (sbp->sb_features_ro_compat & XFS_SB_FEAT_RO_COMPAT_VERITY)
+		features |= XFS_FEAT_VERITY;
 	if (sbp->sb_features_incompat & XFS_SB_FEAT_INCOMPAT_FTYPE)
 		features |= XFS_FEAT_FTYPE;
 	if (sbp->sb_features_incompat & XFS_SB_FEAT_INCOMPAT_SPINODES)
diff --git a/fs/xfs/xfs_mount.h b/fs/xfs/xfs_mount.h
index 3d77844b255e..95fba704f60e 100644
--- a/fs/xfs/xfs_mount.h
+++ b/fs/xfs/xfs_mount.h
@@ -288,6 +288,7 @@ typedef struct xfs_mount {
 #define XFS_FEAT_BIGTIME	(1ULL << 24)	/* large timestamps */
 #define XFS_FEAT_NEEDSREPAIR	(1ULL << 25)	/* needs xfs_repair */
 #define XFS_FEAT_NREXT64	(1ULL << 26)	/* large extent counters */
+#define XFS_FEAT_VERITY		(1ULL << 27)	/* fs-verity */
 
 /* Mount features */
 #define XFS_FEAT_NOATTR2	(1ULL << 48)	/* disable attr2 creation */
@@ -351,6 +352,7 @@ __XFS_HAS_FEAT(inobtcounts, INOBTCNT)
 __XFS_HAS_FEAT(bigtime, BIGTIME)
 __XFS_HAS_FEAT(needsrepair, NEEDSREPAIR)
 __XFS_HAS_FEAT(large_extent_counts, NREXT64)
+__XFS_HAS_FEAT(verity, VERITY)
 
 /*
  * Mount features
-- 
2.40.1

