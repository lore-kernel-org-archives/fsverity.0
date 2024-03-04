Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A9377BB19
	for <fsverity@lists.linux.dev>; Mon,  4 Mar 2024 19:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709579549; cv=none; b=M15bUxiDV3nQvGJctZYnWrC4N2Omf5rC9j2eX5cgLi/UBarR3qRJFMjdz4fHwZwOB6n01EcWLpM2sCINgcY26FLh4Bthznqe3MKbJ5pFTj57HC6D05nyzcjYxa+EW/aqZcRBRkjWTh1znxi7OtnIsgAN1RrPA+JEavLxHfU1GIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709579549; c=relaxed/simple;
	bh=R4yx8qPBsT6oFy9V3t0TmLDLaTl9LfPwUZGazsRbRmc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b6jMssSULj3qW/jbnTPCIEeRU0++ax1mbMa3MUfMuDRH6W6nFCpzPb7uxAHgxKF9Z8b2DF2mRWQj/C9IuaeC7hgkWw0r92JuQY1XePWjUxC2kGqXsJFrzuEUDUVMr32chmD1Wnv4biUymgzoXWcgSYQIGF8MrS2APpuF9+CBs2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=emyBnvTG; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="emyBnvTG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709579547;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y/DVvRiqyNvnHobA7Dl65jX1eWvv52XzmYNOVCQE0Ls=;
	b=emyBnvTGa6PSYnZEAvd02u3gpRKrGSlvkHiLKGbkKwClt+mBDmhP+6oM/zYeuWxb0dVcAk
	Bmm7eZJJxECR3EPRMzPJB0AZCQUSBLhMzq3YrQfDUXN1ffq9qxQQic3ytP59x2fUgpwwng
	o1Fye5coXCOIQTPbPaEmF+UURnjjrNE=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-394-6YK3nOECNByv_tr2Ecvs0A-1; Mon, 04 Mar 2024 14:12:26 -0500
X-MC-Unique: 6YK3nOECNByv_tr2Ecvs0A-1
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-513182f4018so3373348e87.1
        for <fsverity@lists.linux.dev>; Mon, 04 Mar 2024 11:12:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709579544; x=1710184344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y/DVvRiqyNvnHobA7Dl65jX1eWvv52XzmYNOVCQE0Ls=;
        b=QDWQRGKnGqfknR9c6nBY8Ew9khD0Q68ExyAYSBx7zJiIVSFGyzRzp9qtvr44xZKbBy
         HeioqFLdxJOOdpE17VfoMv78bYU7hPqdEo5JBz9ZLLJezc+vWHnGrgYgMuti6WH2tJ3H
         QWMjwts9ffs+ChtsuriVfF0uimqMrVYqQ8vdSSDN4OfvotdH7xnI0pVELVkUG09MEIVJ
         2f3LrJyRb53GF+vv5JLRMZpuKCcMOOZPhq589S8DYKz+lmU1rryXXWZijAhtqbg+VCAV
         FOR/AKT2qv4s9bf4rcCLwiMAg8FJErnsHrHf4StFqibR8uFne590TXV4eiHBy9055ryP
         VEJQ==
X-Gm-Message-State: AOJu0YzqwSZxOh9K5mp45mIcwLGbv3RyghWIy/MoZOxdepqHFRGkWtA8
	QihQ1uUj8pPhBvwjNm9/Ag7IVhdGNNfNpi3XFTo2Dxa5WT6BLiH9LChqrsR/ACeulashWGWLwL2
	Za5Iw/S2AAum+P0ntyhVraDB5vGhInbVj4Z6MWOcHGU87dyI1c3aNaGxW+K0fcAsQ8J7tfG12jC
	51h76Sq8YNfUuMCJ9lMHAl7vgwgxfwMkBEh1CHtoY=
X-Received: by 2002:a05:6512:118d:b0:513:40eb:b422 with SMTP id g13-20020a056512118d00b0051340ebb422mr4082418lfr.34.1709579544339;
        Mon, 04 Mar 2024 11:12:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEBr8j2SGz5TnSfldxisRXVuJY3n+1hKwwCgX1qbv2Q/ubk3JHEqnyRHDsd0ZjF4pdMmuBcCA==
X-Received: by 2002:a05:6512:118d:b0:513:40eb:b422 with SMTP id g13-20020a056512118d00b0051340ebb422mr4082391lfr.34.1709579543671;
        Mon, 04 Mar 2024 11:12:23 -0800 (PST)
Received: from thinky.redhat.com ([109.183.6.197])
        by smtp.gmail.com with ESMTPSA id a11-20020a1709064a4b00b00a44a04aa3cfsm3783319ejv.225.2024.03.04.11.12.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 11:12:23 -0800 (PST)
From: Andrey Albershteyn <aalbersh@redhat.com>
To: fsverity@lists.linux.dev,
	linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	chandan.babu@oracle.com,
	djwong@kernel.org,
	ebiggers@kernel.org
Cc: Andrey Albershteyn <aalbersh@redhat.com>
Subject: [PATCH v5 14/24] xfs: make xfs_buf_get() to take XBF_* flags
Date: Mon,  4 Mar 2024 20:10:37 +0100
Message-ID: <20240304191046.157464-16-aalbersh@redhat.com>
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

Allow passing XBF_* buffer flags from xfs_buf_get(). This will allow
fs-verity to specify flag for increased buffer size.

Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
---
 fs/xfs/libxfs/xfs_attr_remote.c | 2 +-
 fs/xfs/libxfs/xfs_btree_mem.c   | 2 +-
 fs/xfs/libxfs/xfs_sb.c          | 2 +-
 fs/xfs/xfs_buf.h                | 3 ++-
 4 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/fs/xfs/libxfs/xfs_attr_remote.c b/fs/xfs/libxfs/xfs_attr_remote.c
index 4b44866479dc..f15350e99d66 100644
--- a/fs/xfs/libxfs/xfs_attr_remote.c
+++ b/fs/xfs/libxfs/xfs_attr_remote.c
@@ -526,7 +526,7 @@ xfs_attr_rmtval_set_value(
 		dblkno = XFS_FSB_TO_DADDR(mp, map.br_startblock),
 		dblkcnt = XFS_FSB_TO_BB(mp, map.br_blockcount);
 
-		error = xfs_buf_get(mp->m_ddev_targp, dblkno, dblkcnt, &bp);
+		error = xfs_buf_get(mp->m_ddev_targp, dblkno, dblkcnt, 0, &bp);
 		if (error)
 			return error;
 		bp->b_ops = &xfs_attr3_rmt_buf_ops;
diff --git a/fs/xfs/libxfs/xfs_btree_mem.c b/fs/xfs/libxfs/xfs_btree_mem.c
index 036061fe32cc..07df43decce7 100644
--- a/fs/xfs/libxfs/xfs_btree_mem.c
+++ b/fs/xfs/libxfs/xfs_btree_mem.c
@@ -92,7 +92,7 @@ xfbtree_init_leaf_block(
 	xfbno_t				bno = xfbt->highest_bno++;
 	int				error;
 
-	error = xfs_buf_get(xfbt->target, xfbno_to_daddr(bno), XFBNO_BBSIZE,
+	error = xfs_buf_get(xfbt->target, xfbno_to_daddr(bno), XFBNO_BBSIZE, 0,
 			&bp);
 	if (error)
 		return error;
diff --git a/fs/xfs/libxfs/xfs_sb.c b/fs/xfs/libxfs/xfs_sb.c
index d991eec05436..a25949843d8d 100644
--- a/fs/xfs/libxfs/xfs_sb.c
+++ b/fs/xfs/libxfs/xfs_sb.c
@@ -1100,7 +1100,7 @@ xfs_update_secondary_sbs(
 
 		error = xfs_buf_get(mp->m_ddev_targp,
 				 XFS_AG_DADDR(mp, pag->pag_agno, XFS_SB_DADDR),
-				 XFS_FSS_TO_BB(mp, 1), &bp);
+				 XFS_FSS_TO_BB(mp, 1), 0, &bp);
 		/*
 		 * If we get an error reading or writing alternate superblocks,
 		 * continue.  xfs_repair chooses the "best" superblock based
diff --git a/fs/xfs/xfs_buf.h b/fs/xfs/xfs_buf.h
index 2a73918193ba..b5c58287c663 100644
--- a/fs/xfs/xfs_buf.h
+++ b/fs/xfs/xfs_buf.h
@@ -257,11 +257,12 @@ xfs_buf_get(
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
2.42.0

