Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 016E738F93
	for <fsverity@lists.linux.dev>; Fri,  6 Oct 2023 18:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gLAevYWP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1696618367;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5rlF0oL9W0zNtBhbjMTbk37IJ/kLdlHiXudCvThRqlI=;
	b=gLAevYWPt0U7u0KSEcMikHPMrL4yOOSGAce6tD1Da2dwuPrPa4iTiqLfro3no2jK77p/dC
	m0CMlpnsy2Ag6J1mc7gqoz+qFhNtn1RpmUhk0x+SJa5T7Ul4ZN3V5Q9yDYhrAuHRjseH00
	MNleKTVUQWhHQyzFDSqG++9WbGmpj8w=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-128-qoEdPN8lM5yQR1AOba53AA-1; Fri, 06 Oct 2023 14:52:45 -0400
X-MC-Unique: qoEdPN8lM5yQR1AOba53AA-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-993c2d9e496so207331066b.0
        for <fsverity@lists.linux.dev>; Fri, 06 Oct 2023 11:52:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696618364; x=1697223164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5rlF0oL9W0zNtBhbjMTbk37IJ/kLdlHiXudCvThRqlI=;
        b=w9PbkNyGn7cDJvIWuLyFfzwnw0OzU5st5tOZ9hjWzRdaof/jyx22ui62kxIi4ayZDU
         dNeyb5KOka1RU6a+xIlks0JWCeZfEtb5Au1iZCyRLUbl3WCluxE/TX6pMuc7RnEBE9zv
         ahrnimV0BwadJpB4A66kJ68OvVgaO8ARPhmbGXTk0prrr38qkWlPzFK+Ti0dzhHwfuKs
         Ttuzm4UuprpqKltv1EuQYyLeyrbGvecxksW7hA14nArqIwZFuT4JuiCXhB9xW3LpuG0J
         ZkZz8qxQQtgc0BcihdX3jo0V6AH3/CWyzlVp++X291zKLcbCvgYwXYcQDcFIkE9Kbklv
         nzSw==
X-Gm-Message-State: AOJu0Yxs9JXJC5pfrpNFbD4Z2N6tz0sfpwkAiohNY9YboT9KHnGCijbD
	3d68B9tx8Hu1fYqRcxRL/CCq0etFrPyFcvewjZqS959t8A4N+fd5FPh0bA+7L9TDV5i0m2osm8V
	Oe7WGUMPPZvwV8G7sBA==
X-Received: by 2002:a17:906:3116:b0:9a9:e4ba:2da7 with SMTP id 22-20020a170906311600b009a9e4ba2da7mr8028683ejx.49.1696618364705;
        Fri, 06 Oct 2023 11:52:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHb5yDWscYNSrW67kJ5zHPToh4J20qlMVNuAtELJzCJW/KwyTT1ZP+ogCVKItFg1sfFvDb1pA==
X-Received: by 2002:a17:906:3116:b0:9a9:e4ba:2da7 with SMTP id 22-20020a170906311600b009a9e4ba2da7mr8028667ejx.49.1696618364456;
        Fri, 06 Oct 2023 11:52:44 -0700 (PDT)
Received: from localhost.localdomain ([109.183.6.197])
        by smtp.gmail.com with ESMTPSA id os5-20020a170906af6500b009b947f81c4asm3304741ejb.155.2023.10.06.11.52.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 11:52:44 -0700 (PDT)
From: Andrey Albershteyn <aalbersh@redhat.com>
To: linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	fsverity@lists.linux.dev
Cc: djwong@kernel.org,
	ebiggers@kernel.org,
	david@fromorbit.com,
	dchinner@redhat.com,
	Andrey Albershteyn <aalbersh@redhat.com>
Subject: [PATCH v3 28/28] xfs: enable ro-compat fs-verity flag
Date: Fri,  6 Oct 2023 20:49:22 +0200
Message-Id: <20231006184922.252188-29-aalbersh@redhat.com>
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

Finalize fs-verity integration in XFS by making kernel fs-verity
aware with ro-compat flag.

Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
---
 fs/xfs/libxfs/xfs_format.h | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/fs/xfs/libxfs/xfs_format.h b/fs/xfs/libxfs/xfs_format.h
index ccb2ae5c2c93..a21612319765 100644
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
2.40.1

