Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050EC7C094
	for <fsverity@lists.linux.dev>; Mon,  4 Mar 2024 19:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709579551; cv=none; b=CSsd83o8ekECWKezVlWrD5Gd6JJSvazrdSnOP+vSt2hN/mHQLaceon9kYBCFeCOiPHHq146REkmt3Pt+AUG1/dGpTE5hpIIeXHjqqGCFot04XR3bp9ZxA9FQT3+iJR8AlgYT9tX/WI4eXPHOVrfi6mWEtJCX5uPs23nHkxDD16U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709579551; c=relaxed/simple;
	bh=o9W4znw5NysKxZeHeBecA5SEITer/EW1DME955Sy8Po=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ARaW+ECAScSFMFMZd/sh1rOBSqLpDYeAihARTu/fi0Cj3nv5ot4S5BG+WbIBv7kwffvEu1UB56dI4FFEXP4l5oOGFXch07pA/NcL3yZXAyaA/wjmYLTQFE7Gv/uCbPSEbl5bHtQ9+mLELnJpYbFyCrDAA7rXVb68Z1gZkrGswiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WhyBNRW/; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WhyBNRW/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709579548;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Tg5FMjI6Vh1hHz8JgRcKgKGDcYt6qlitx1KNeKNRQZY=;
	b=WhyBNRW/DbjCYqGvow9ZVOXHvU+8pqSeIEyb9cp24PLGee6EPUzWxRqJKwiBWXyxj11+0F
	fYq2aF1X8dW45rKgiuf2BTKJzB8cL1QEaoMxRMdda1/Evtq/dd5Fo3sy8gvj1V0t+RCxk9
	AWzMURWyd0oJMIxzZNaypn9WGRnvm14=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-678-4bE_t49nNtOsLMAld3qo2Q-1; Mon, 04 Mar 2024 14:12:27 -0500
X-MC-Unique: 4bE_t49nNtOsLMAld3qo2Q-1
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-5134251ef6eso2260001e87.2
        for <fsverity@lists.linux.dev>; Mon, 04 Mar 2024 11:12:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709579545; x=1710184345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tg5FMjI6Vh1hHz8JgRcKgKGDcYt6qlitx1KNeKNRQZY=;
        b=eHJKbRfBJu+zXoF/54d/QvN9E8JzAhwecREYk1Ys7LyA+z0h5gYnrpA0U3DNGWg2fM
         efapYM6H1TNqH/cWRw65fnnLb6Gv4HIpAne/0SyL64/dWGG3EpxwkCkdHQg9mgG7TA8y
         X6FqgBPplEYXRsebeP2z84fSGIWhPtZ4ZCDLyAlW0P2/Mt9QnLk7D+oL7QLLd4UXmHOP
         4mgrjA1/cVdZQ1asA7X04FSc8haPSA86q33OO4DKc36U0rAznLq2gq3OYDTmcVijzxfI
         uzWXUv0GxqXyyIEhvQre5UWRljhoxHn5XVO0Z1TF7/2IKzk0BrmjNOw2/wIlg4s22r3m
         j2Wg==
X-Gm-Message-State: AOJu0Yyg5kHhShvrDgubvxyWeXSR6lxcUCeevvOCx6ByZ47oxCy6hCSV
	Wi4bmjlgsq213djYBjR+bAD2bmTib/PII/t6HB4dY0lAEzREJfdYA6sUgKLLe6DY/yHk7HJW6Aw
	yd+ZXLYJC/IoUWVbq7YgjRIvrqKrXIixogYUxIhkAyTDpnxy3bN2AicoXbO9/Odl2u7H6CPr4at
	j2MpHq+7Dketh/0hmCOYBjfGdPW5oo9Gl6JpxlfOE=
X-Received: by 2002:ac2:5593:0:b0:513:23da:9766 with SMTP id v19-20020ac25593000000b0051323da9766mr6540046lfg.55.1709579545538;
        Mon, 04 Mar 2024 11:12:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGhcwdoaV6bOY0QfPY8E83kkcNTDRmjuWUE3Tlj+pjRh88ZfaSKm1Si1pEnq8D5WakLwp7t0g==
X-Received: by 2002:ac2:5593:0:b0:513:23da:9766 with SMTP id v19-20020ac25593000000b0051323da9766mr6540028lfg.55.1709579545252;
        Mon, 04 Mar 2024 11:12:25 -0800 (PST)
Received: from thinky.redhat.com ([109.183.6.197])
        by smtp.gmail.com with ESMTPSA id a11-20020a1709064a4b00b00a44a04aa3cfsm3783319ejv.225.2024.03.04.11.12.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 11:12:24 -0800 (PST)
From: Andrey Albershteyn <aalbersh@redhat.com>
To: fsverity@lists.linux.dev,
	linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	chandan.babu@oracle.com,
	djwong@kernel.org,
	ebiggers@kernel.org
Cc: Andrey Albershteyn <aalbersh@redhat.com>
Subject: [PATCH v5 16/24] xfs: add fs-verity ro-compat flag
Date: Mon,  4 Mar 2024 20:10:39 +0100
Message-ID: <20240304191046.157464-18-aalbersh@redhat.com>
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

To mark inodes with fs-verity enabled the new XFS_DIFLAG2_VERITY flag
will be added in further patch. This requires ro-compat flag to let
older kernels know that fs with fs-verity can not be modified.

Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
Reviewed-by: Darrick J. Wong <djwong@kernel.org>
---
 fs/xfs/libxfs/xfs_format.h | 1 +
 fs/xfs/libxfs/xfs_sb.c     | 2 ++
 fs/xfs/xfs_mount.h         | 2 ++
 3 files changed, 5 insertions(+)

diff --git a/fs/xfs/libxfs/xfs_format.h b/fs/xfs/libxfs/xfs_format.h
index 2b2f9050fbfb..93d280eb8451 100644
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
index a25949843d8d..1c68785e60cc 100644
--- a/fs/xfs/libxfs/xfs_sb.c
+++ b/fs/xfs/libxfs/xfs_sb.c
@@ -163,6 +163,8 @@ xfs_sb_version_to_features(
 		features |= XFS_FEAT_REFLINK;
 	if (sbp->sb_features_ro_compat & XFS_SB_FEAT_RO_COMPAT_INOBTCNT)
 		features |= XFS_FEAT_INOBTCNT;
+	if (sbp->sb_features_ro_compat & XFS_SB_FEAT_RO_COMPAT_VERITY)
+		features |= XFS_FEAT_VERITY;
 	if (sbp->sb_features_incompat & XFS_SB_FEAT_INCOMPAT_FTYPE)
 		features |= XFS_FEAT_FTYPE;
 	if (sbp->sb_features_incompat & XFS_SB_FEAT_INCOMPAT_SPINODES)
diff --git a/fs/xfs/xfs_mount.h b/fs/xfs/xfs_mount.h
index e880aa48de68..f198d7c82552 100644
--- a/fs/xfs/xfs_mount.h
+++ b/fs/xfs/xfs_mount.h
@@ -292,6 +292,7 @@ typedef struct xfs_mount {
 #define XFS_FEAT_BIGTIME	(1ULL << 24)	/* large timestamps */
 #define XFS_FEAT_NEEDSREPAIR	(1ULL << 25)	/* needs xfs_repair */
 #define XFS_FEAT_NREXT64	(1ULL << 26)	/* large extent counters */
+#define XFS_FEAT_VERITY		(1ULL << 27)	/* fs-verity */
 
 /* Mount features */
 #define XFS_FEAT_NOATTR2	(1ULL << 48)	/* disable attr2 creation */
@@ -355,6 +356,7 @@ __XFS_HAS_FEAT(inobtcounts, INOBTCNT)
 __XFS_HAS_FEAT(bigtime, BIGTIME)
 __XFS_HAS_FEAT(needsrepair, NEEDSREPAIR)
 __XFS_HAS_FEAT(large_extent_counts, NREXT64)
+__XFS_HAS_FEAT(verity, VERITY)
 
 /*
  * Mount features
-- 
2.42.0

