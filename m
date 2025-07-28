Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C99B27F003
	for <fsverity@lists.linux.dev>; Mon, 28 Jul 2025 20:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753734701; cv=none; b=r4ysbcbYdtnJeJ8jwcIPGcRw8e9DO+B6rVGUM7IY0Rz1JmaJUtd1Uaa4bR1NNYyCoXDzcEwkAsdRHseLSxo8n5/bcaevWSFPhQLifETOCTHeS+xED3WURenaKqgoO/dnicsoo/BaY+A+AtoWS+tYOfJtiEO0zkFtJ8khydXqI2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753734701; c=relaxed/simple;
	bh=7y2AFsFUtHlKUtMlN3bWkhMdtdvOCRb36aeVqGybfmI=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=Kb98dpTEGBza14kFTTYTkb9eF537u9pVZmZl58IMa+BcZ1/TUNM4vGDZ0wXERd4x7Vu2KZh7v9QIJeAZibxLFIDnQy5jFYElaDKCdcJalS6Oben3rPI6CRbYeX93Jce4XvV4lrQKZPRt+01RvUcGnRzlpb9g7zalq52Gs/j9aiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fh6M79Eh; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fh6M79Eh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753734699;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7i2vN8r2qGAStJwd2XHOVZqln7AWQXVAdnWk945Mkc8=;
	b=fh6M79Ehi8GteMJJVNlCZk5nWNw2yyy1Gzp/NJxcYmYQd977VJXJWFa4xWc5ESaS2fzeFv
	zujWCQv8SRRzfhMD4WwjN9jFr60zPwI4iObqQQ/cR+sPBWxoRIIpAzCzXVO8bUq3mBv5IG
	ohIOMqbYJb/URENbzKdE8YmL7cvpLU8=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-125-WohFBLpMOcqMjoigC_kCSw-1; Mon, 28 Jul 2025 16:31:37 -0400
X-MC-Unique: WohFBLpMOcqMjoigC_kCSw-1
X-Mimecast-MFC-AGG-ID: WohFBLpMOcqMjoigC_kCSw_1753734697
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-61543f038dbso852996a12.1
        for <fsverity@lists.linux.dev>; Mon, 28 Jul 2025 13:31:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753734696; x=1754339496;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7i2vN8r2qGAStJwd2XHOVZqln7AWQXVAdnWk945Mkc8=;
        b=QELKOaDmGW7BUE6cCUBelDVGsYxNySvA/mzvy4V83b6/Dcsb/eyv0ipJGZB+xkvp5w
         lEp+muSUOIkzq276++cyL7UXBo7GcqRIQO6gonQSwdCgwH8LSZwT2FFruFj+rGlgVW4X
         sWWV9gH2Vd0F2Rdw3hGm44ZQ1P+NN+bWQuxkCDpj6PQe3qYNPeZAEFYb73l4CqqQ3t7c
         sudsZe3Q1TnE2eok7FJIDsIHK2z2xO7DGuZDNUWRNPICE7dKwd4qUiMnid0ifYvQ8zFd
         kBuen60sZc4JZmoydeMii8Sbd22uDxPGYX+yMoYXHtJAw2PRpDOFfBHBUb4h5L3INszR
         /64g==
X-Gm-Message-State: AOJu0Yx6KRId7hdPyS+YCf+Ik9bNWonAZD4xRqfMTHiD37EVur7lVkvO
	N6z//agpJxut6uUzhYXRWuHWu1nStL7lIveUlBfTzJsL36NFCkZgaCfs2wlFF5CDCY8gP/yiga5
	9ts72aqEjPu2tc9YTjBi0uZv/I8hDLk4AwrlhjtCn54EoL7JINzTKR8EBUw0=
X-Gm-Gg: ASbGncuTp1tZv6DMImp5kcYWZLNOf+3LOFD6RnBijpXj66dIXvVmotcUr3Y28FkSGSV
	sD/HfypI1FNIkZycFDaYNmICoE18hJEN26b14Hz4ZHSf15/7LJeIMAo9hZt6rva+uRCNfftPLB4
	QEek3AeXd3IUGZLJXPYkFec3wIpIndUHVVKyur/VY80RtYymb1TlU8inkhxDffF9LWHxE2Qxrsc
	6GFXTF9RvCypqgNPHCO4QuXduGttgt3UCi6puICa492igF/LbqItKsGdC9ZNatxmkP0BpPkTK+s
	wOidriqPHhLiBzeuIxsAtLRc1eIwOv5zeNVr7RZA04R57w==
X-Received: by 2002:a05:6402:2810:b0:612:9e3b:ff99 with SMTP id 4fb4d7f45d1cf-614f1bdd0ccmr10731748a12.9.1753734696471;
        Mon, 28 Jul 2025 13:31:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGaC0c3MpMoqnbG8xUhTGHoaDuL73lZSJnL7cBsHhGP48c/lcInjGrmBMSkIob2Ujz9GQVRNA==
X-Received: by 2002:a05:6402:2810:b0:612:9e3b:ff99 with SMTP id 4fb4d7f45d1cf-614f1bdd0ccmr10731731a12.9.1753734695990;
        Mon, 28 Jul 2025 13:31:35 -0700 (PDT)
Received: from [127.0.0.2] (ip-217-030-074-039.aim-net.cz. [217.30.74.39])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615226558d3sm2730656a12.45.2025.07.28.13.31.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 13:31:35 -0700 (PDT)
From: Andrey Albershteyn <aalbersh@redhat.com>
X-Google-Original-From: Andrey Albershteyn <aalbersh@kernel.org>
Date: Mon, 28 Jul 2025 22:30:19 +0200
Subject: [PATCH RFC 15/29] xfs: add fs-verity ro-compat flag
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <20250728-fsverity-v1-15-9e5443af0e34@kernel.org>
References: <20250728-fsverity-v1-0-9e5443af0e34@kernel.org>
In-Reply-To: <20250728-fsverity-v1-0-9e5443af0e34@kernel.org>
To: fsverity@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
 linux-xfs@vger.kernel.org, david@fromorbit.com, djwong@kernel.org, 
 ebiggers@kernel.org, hch@lst.de
Cc: Andrey Albershteyn <aalbersh@redhat.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2599; i=aalbersh@kernel.org;
 h=from:subject:message-id; bh=UGW6IC+hs9WqEi7Nb4NFJ3Osu82F6RaLqbhdO6XoOf8=;
 b=owJ4nJvAy8zAJea2/JXEGuOHHIyn1ZIYMtrvSfhpf0mPer5hQuG1Sve9oS1L3cIb671rXlVX2
 vO0fbszOaijlIVBjItBVkyRZZ201tSkIqn8IwY18jBzWJlAhjBwcQrARFL3MTIst1bOv6RX+MFu
 Y3zRx+eXtX7li8q+y1tkM+26nueWLJFahr+S3wrVcs5PWrh4v4zjCuGyFaFXT9XtvdI5w6xxSkt
 122Z2ALthSck=
X-Developer-Key: i=aalbersh@kernel.org; a=openpgp;
 fpr=AE1B2A9562721A6FC4307C1F46A7EA18AC33E108
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BUyod34KHOOlCScU2rcf3HH-8ZnNGNB3vuTC8YF4tDA_1753734697
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

From: Andrey Albershteyn <aalbersh@redhat.com>

To mark inodes with fs-verity enabled the new XFS_DIFLAG2_VERITY flag
will be added in further patch. This requires ro-compat flag to let
older kernels know that fs with fs-verity can not be modified.

Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
Reviewed-by: Darrick J. Wong <djwong@kernel.org>
Signed-off-by: Darrick J. Wong <djwong@kernel.org>
---
 fs/xfs/libxfs/xfs_format.h | 1 +
 fs/xfs/libxfs/xfs_sb.c     | 2 ++
 fs/xfs/xfs_mount.h         | 2 ++
 3 files changed, 5 insertions(+)

diff --git a/fs/xfs/libxfs/xfs_format.h b/fs/xfs/libxfs/xfs_format.h
index 9566a7623365..3a8c43541dd9 100644
--- a/fs/xfs/libxfs/xfs_format.h
+++ b/fs/xfs/libxfs/xfs_format.h
@@ -374,6 +374,7 @@ xfs_sb_has_compat_feature(
 #define XFS_SB_FEAT_RO_COMPAT_RMAPBT   (1 << 1)		/* reverse map btree */
 #define XFS_SB_FEAT_RO_COMPAT_REFLINK  (1 << 2)		/* reflinked files */
 #define XFS_SB_FEAT_RO_COMPAT_INOBTCNT (1 << 3)		/* inobt block counts */
+#define XFS_SB_FEAT_RO_COMPAT_VERITY   (1 << 4)		/* fs-verity */
 #define XFS_SB_FEAT_RO_COMPAT_ALL \
 		(XFS_SB_FEAT_RO_COMPAT_FINOBT | \
 		 XFS_SB_FEAT_RO_COMPAT_RMAPBT | \
diff --git a/fs/xfs/libxfs/xfs_sb.c b/fs/xfs/libxfs/xfs_sb.c
index 711e180f9ebb..e32cd2874bcd 100644
--- a/fs/xfs/libxfs/xfs_sb.c
+++ b/fs/xfs/libxfs/xfs_sb.c
@@ -167,6 +167,8 @@ xfs_sb_version_to_features(
 		features |= XFS_FEAT_REFLINK;
 	if (sbp->sb_features_ro_compat & XFS_SB_FEAT_RO_COMPAT_INOBTCNT)
 		features |= XFS_FEAT_INOBTCNT;
+	if (sbp->sb_features_ro_compat & XFS_SB_FEAT_RO_COMPAT_VERITY)
+		features |= XFS_FEAT_VERITY;
 	if (sbp->sb_features_incompat & XFS_SB_FEAT_INCOMPAT_FTYPE)
 		features |= XFS_FEAT_FTYPE;
 	if (sbp->sb_features_incompat & XFS_SB_FEAT_INCOMPAT_SPINODES)
diff --git a/fs/xfs/xfs_mount.h b/fs/xfs/xfs_mount.h
index d85084f9f317..90a4ca0d7a65 100644
--- a/fs/xfs/xfs_mount.h
+++ b/fs/xfs/xfs_mount.h
@@ -383,6 +383,7 @@ typedef struct xfs_mount {
 #define XFS_FEAT_EXCHANGE_RANGE	(1ULL << 27)	/* exchange range */
 #define XFS_FEAT_METADIR	(1ULL << 28)	/* metadata directory tree */
 #define XFS_FEAT_ZONED		(1ULL << 29)	/* zoned RT device */
+#define XFS_FEAT_VERITY		(1ULL << 30)	/* fs-verity */
 
 /* Mount features */
 #define XFS_FEAT_NOLIFETIME	(1ULL << 47)	/* disable lifetime hints */
@@ -442,6 +443,7 @@ __XFS_HAS_FEAT(exchange_range, EXCHANGE_RANGE)
 __XFS_HAS_FEAT(metadir, METADIR)
 __XFS_HAS_FEAT(zoned, ZONED)
 __XFS_HAS_FEAT(nolifetime, NOLIFETIME)
+__XFS_HAS_FEAT(verity, VERITY)
 
 static inline bool xfs_has_rtgroups(const struct xfs_mount *mp)
 {

-- 
2.50.0

