Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F235B26E04
	for <fsverity@lists.linux.dev>; Fri,  6 Oct 2023 18:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QFzEF1i8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1696618359;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E/AveBNSqmjIJtYI3+6LuAlhQmhnFexTVHM7C0k2E9s=;
	b=QFzEF1i8PVsDHVwkUgcqZgGMnvmFZvGq8v0OTQhF5TDYe1eG2Lm/Rfcbpa4E2DDD7iau7v
	/KgIHKmFM0IMo4W0w3ZPyZmTTu+uGjLEE8b0F15bpaGqOJ7I+b4fPktfzz7aZ1Ks9BqVG3
	pAZB6JKA/yTmQkP0GaJ+NvADJ9pfoj4=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-113-5j1lzD_-Mda-3lFJ5aA0gQ-1; Fri, 06 Oct 2023 14:52:36 -0400
X-MC-Unique: 5j1lzD_-Mda-3lFJ5aA0gQ-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-9adad8f306fso197848666b.0
        for <fsverity@lists.linux.dev>; Fri, 06 Oct 2023 11:52:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696618355; x=1697223155;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E/AveBNSqmjIJtYI3+6LuAlhQmhnFexTVHM7C0k2E9s=;
        b=AzgIAxsd/bWaUSLMBCF1vR73bO/4qslYKWGVJGlSIH9qP7s1YtxG+dEw/+bYJTd3qc
         gAtb/1kqcbjt+wR2ILjfv/svy89yO+qDkGh1jHRB+G3b0QVNO/NdQnvGwADE0PL/WCok
         RXESRd4lyop54rPbiRLQ0M8ohhH6eNFwNDeBo/Sr1tLAJgGUvpBkUB4y+h127/ylM4vv
         qw9anaKrUT4LwLqKZDWKEQ+EZhw2dnvy2mAam6NZV0kLaHjOzlC99rrTmkwtO10+HwIq
         +cFOB3o6t3NRWWewOfdl/sKSQdc6eavzbVLM6K2LLVAwMoPfiLigSpXLwb+UrExv4m+/
         dnNw==
X-Gm-Message-State: AOJu0Yxefg4IvL9GKXJfv12u0l3SpWpmUITAPlPyNmeK7kECnpNSsl1u
	KaXVaDIRO5GvGNxCXL2jYNe36zVNSPUvJYL7lljFzO7bWL+T+sni+moDVw3+ynuYTA6Uw02/U4p
	/JsoKEz/b/9ecq5hKoBsmNGyL+Q==
X-Received: by 2002:a17:906:9c1:b0:9ae:5aa4:9fa with SMTP id r1-20020a17090609c100b009ae5aa409famr8090644eje.42.1696618355318;
        Fri, 06 Oct 2023 11:52:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHOVx3rLvVBE5QUfisMFkx2Pla6kAmWa2HIAK3od296Wuq43rVklqeW33wJg0+k4bCeT0eC3A==
X-Received: by 2002:a17:906:9c1:b0:9ae:5aa4:9fa with SMTP id r1-20020a17090609c100b009ae5aa409famr8090638eje.42.1696618355160;
        Fri, 06 Oct 2023 11:52:35 -0700 (PDT)
Received: from localhost.localdomain ([109.183.6.197])
        by smtp.gmail.com with ESMTPSA id os5-20020a170906af6500b009b947f81c4asm3304741ejb.155.2023.10.06.11.52.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 11:52:34 -0700 (PDT)
From: Andrey Albershteyn <aalbersh@redhat.com>
To: linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	fsverity@lists.linux.dev
Cc: djwong@kernel.org,
	ebiggers@kernel.org,
	david@fromorbit.com,
	dchinner@redhat.com,
	Andrey Albershteyn <aalbersh@redhat.com>
Subject: [PATCH v3 18/28] xfs: make xfs_buf_get() to take XBF_* flags
Date: Fri,  6 Oct 2023 20:49:12 +0200
Message-Id: <20231006184922.252188-19-aalbersh@redhat.com>
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

Allow passing XBF_* buffer flags from xfs_buf_get(). This will allow
fs-verity to specify flag for increased buffer size.

Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
---
 fs/xfs/libxfs/xfs_attr_remote.c | 2 +-
 fs/xfs/libxfs/xfs_sb.c          | 2 +-
 fs/xfs/xfs_buf.h                | 3 ++-
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/fs/xfs/libxfs/xfs_attr_remote.c b/fs/xfs/libxfs/xfs_attr_remote.c
index 72908e0e1c86..5762135dc2a6 100644
--- a/fs/xfs/libxfs/xfs_attr_remote.c
+++ b/fs/xfs/libxfs/xfs_attr_remote.c
@@ -521,7 +521,7 @@ xfs_attr_rmtval_set_value(
 		dblkno = XFS_FSB_TO_DADDR(mp, map.br_startblock),
 		dblkcnt = XFS_FSB_TO_BB(mp, map.br_blockcount);
 
-		error = xfs_buf_get(mp->m_ddev_targp, dblkno, dblkcnt, &bp);
+		error = xfs_buf_get(mp->m_ddev_targp, dblkno, dblkcnt, 0, &bp);
 		if (error)
 			return error;
 		bp->b_ops = &xfs_attr3_rmt_buf_ops;
diff --git a/fs/xfs/libxfs/xfs_sb.c b/fs/xfs/libxfs/xfs_sb.c
index 6264daaab37b..4191da4fb669 100644
--- a/fs/xfs/libxfs/xfs_sb.c
+++ b/fs/xfs/libxfs/xfs_sb.c
@@ -1096,7 +1096,7 @@ xfs_update_secondary_sbs(
 
 		error = xfs_buf_get(mp->m_ddev_targp,
 				 XFS_AG_DADDR(mp, pag->pag_agno, XFS_SB_DADDR),
-				 XFS_FSS_TO_BB(mp, 1), &bp);
+				 XFS_FSS_TO_BB(mp, 1), 0, &bp);
 		/*
 		 * If we get an error reading or writing alternate superblocks,
 		 * continue.  xfs_repair chooses the "best" superblock based
diff --git a/fs/xfs/xfs_buf.h b/fs/xfs/xfs_buf.h
index d0fadb6d4b59..e79bfe548952 100644
--- a/fs/xfs/xfs_buf.h
+++ b/fs/xfs/xfs_buf.h
@@ -243,11 +243,12 @@ xfs_buf_get(
 	struct xfs_buftarg	*target,
 	xfs_daddr_t		blkno,
 	size_t			numblks,
+	xfs_buf_flags_t		flags,
 	struct xfs_buf		**bpp)
 {
 	DEFINE_SINGLE_BUF_MAP(map, blkno, numblks);
 
-	return xfs_buf_get_map(target, &map, 1, 0, bpp);
+	return xfs_buf_get_map(target, &map, 1, flags, bpp);
 }
 
 static inline int
-- 
2.40.1

