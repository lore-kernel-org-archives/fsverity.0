Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76ED12D97BF
	for <fsverity@lists.linux.dev>; Mon, 12 Jan 2026 14:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768229450; cv=none; b=nYMPgM0sjoTLTt+Fxk9D3yUTL5lLqXLP9pCs7cYrpZuM5Z254FVQe/moZhP3dMWiP7jGDrtM/fgmSHwyQSivwwtwfStYX0Zm4iChuyLciQBJ+/PuAV7nrfUXIxRsrrrZF35kmoxkEbcIhzYQxtzItDp12zsEIVbMz9Jm/jolzH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768229450; c=relaxed/simple;
	bh=XXRH7b/0i4ueWjWQWLdmXozm6ynpX7HcGCIutMaFY1A=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=a5JbwhHvzaXA1kb19KDf9fWCsx8vn5YjxlhWJL9e4mKlW0cBOWwz8gEz9baPvY/krnJOsYPNeUaeYY9BiVSMf5uMdWqmSs2UPD9hvHtzwWMYa4Cv2Io/8PW2PbJrKdV3Oy5pBnoGBSNIpTPN8y1zm6+8YggFGpTJ80JXIXJ69gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=brI6kvHS; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="brI6kvHS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768229448;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Nb5UIQxqvdSkHiFjYiKVV8nmw/xrhaJumJsBcf3A06Q=;
	b=brI6kvHSASiJsiIhDo60/QNjZHYg/ynOX5nelvB+u+1cyxBVk5RqM0C8/7jCiQ1ih/x1FF
	fqxne+Vae+kMFa64V7TyaVPC3OPoW7VLHa37E1oVNB8iAh8RBcryQQ8sWygOsfAwAdIJoI
	/Qz3SqmoL5+bp2XLs7vnvLE8WWpm3lk=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-655-pcnocLkcPdSCqYgcCAlJsA-1; Mon, 12 Jan 2026 09:50:36 -0500
X-MC-Unique: pcnocLkcPdSCqYgcCAlJsA-1
X-Mimecast-MFC-AGG-ID: pcnocLkcPdSCqYgcCAlJsA_1768229435
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-b872c97a2a2so88073866b.1
        for <fsverity@lists.linux.dev>; Mon, 12 Jan 2026 06:50:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768229435; x=1768834235;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nb5UIQxqvdSkHiFjYiKVV8nmw/xrhaJumJsBcf3A06Q=;
        b=k17ZHsvb0ZAWUcQRuzX+ntea1OZwzzaVep6wCqVjNThqyBssKYHl1h0wnyr0+nmc2v
         nnroCgaLcY0SpW2PMqwr03oelH7hO0UIFbOPa68H7DOtOgaeaEQjvn30dtba32rBgvRL
         rFaaOo/FNkCOpkuYwtrx9tCndsrj/cs+tV3mEsop5rroPVLBziD/VynLCHRqQC012v5m
         hVgEzdrJVRp56V5UQ7ZHAPETzmkDmqdHc/XzhOifNndhYQahJt5WMONlFNWwcXEmBCmP
         woR8Rae5Oct387jY5kmjdOjh6QF89p0JcKa/77u6Fjn0dExU1gmTPyHZWGJTcgN1e761
         YSTQ==
X-Gm-Message-State: AOJu0YwmMCsq1cpnC/NRKPe3R2tJNejm5mlmZfGpABfp1aP8RoPxmjrh
	W0WFMWy8E+DlH4sKZgTxZ4Gxiphx9cFf1jWdG3TjskhNqkUrb2b+tq9YD3Hm3Rc6mcn0SbONwg6
	UztJmofHsOSLfSGmiUw+wwr6O7roAR9yW013+ngPo+SA+pFcAXjAu92EkakOK95vw3AqzrBhifq
	K1689Z93/MU2iRxBy3I7SWrcdEa5MAWYrCE4Xqzp1eZ8I=
X-Gm-Gg: AY/fxX6r0PqQGR6SAMA1GI2ZajoDVVjw0c3FbUeI6qetMx9SfSxKRckR7lMvnWlgVrZ
	H31zXWC99c5Y5lg/0LO0tKmwPXfs4rPuQ9l556jrjKxzOuLk7bBWMg0vOphlvBQfm89va6cb7oK
	qxjb0o/Pm+A7pKuDvQE9DnFh0F41DxwsbxNH34F/tfeVDjhST7NhbOHyNzCe3d0wXFGb+y0xjxT
	vY0yjnEaObejBU2Q0FLMunixGOaw667xYSmIQyFB7oMgiSaEYNAlCHesWm5o5ADT7dbqFDlfwSi
	TCggQrpMQEbaDIeZL/7j38mQSTG45x+VftIVpMdpJ+j4rcvFGbzog7BcHFq30Gn63FjcwC5YbIQ
	=
X-Received: by 2002:a17:906:7954:b0:b87:2579:b6cf with SMTP id a640c23a62f3a-b872579ba1bmr222392466b.41.1768229434556;
        Mon, 12 Jan 2026 06:50:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF8SWwB/AxOY3cZ8kcTpvTO2S7OPJFMdg+l1YvrGvLC8boRfcE7EDzI5F+ztUGlqqU65b2z6g==
X-Received: by 2002:a17:906:7954:b0:b87:2579:b6cf with SMTP id a640c23a62f3a-b872579ba1bmr222386566b.41.1768229433922;
        Mon, 12 Jan 2026 06:50:33 -0800 (PST)
Received: from thinky ([217.30.74.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b86ebfd08b2sm774184166b.25.2026.01.12.06.50.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 06:50:33 -0800 (PST)
From: Andrey Albershteyn <aalbersh@redhat.com>
X-Google-Original-From: Andrey Albershteyn <aalbersh@kernel.org>
Date: Mon, 12 Jan 2026 15:50:32 +0100
To: fsverity@lists.linux.dev, linux-xfs@vger.kernel.org, 
	ebiggers@kernel.org, linux-fsdevel@vger.kernel.org, aalbersh@kernel.org, 
	aalbersh@redhat.com, djwong@kernel.org
Cc: djwong@kernel.org, david@fromorbit.com, hch@lst.de
Subject: [PATCH v2 6/22] xfs: add fs-verity ro-compat flag
Message-ID: <ra57w2n33ipx73jt5ah6avoa3piadlrhu6spwr6cf3ke7mbwit@a2b3rnvxtu3h>
References: <cover.1768229271.patch-series@thinky>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <cover.1768229271.patch-series@thinky>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: cvnE8Gn9XUoXVdpIzi79ngTles1svca8OdW2oJV-8Bw_1768229435
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

To mark inodes with fs-verity enabled the new XFS_DIFLAG2_VERITY flag
will be added in further patch. This requires ro-compat flag to let
older kernels know that fs with fs-verity can not be modified.

Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org>
Reviewed-by: Darrick J. Wong <djwong@kernel.org>
Signed-off-by: Darrick J. Wong <djwong@kernel.org>
---
 fs/xfs/libxfs/xfs_format.h | 1 +
 fs/xfs/libxfs/xfs_sb.c     | 2 ++
 fs/xfs/xfs_mount.h         | 2 ++
 3 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/fs/xfs/libxfs/xfs_format.h b/fs/xfs/libxfs/xfs_format.h
index 779dac59b1..64c2acd1cf 100644
--- a/fs/xfs/libxfs/xfs_format.h
+++ b/fs/xfs/libxfs/xfs_format.h
@@ -374,6 +374,7 @@
 #define XFS_SB_FEAT_RO_COMPAT_RMAPBT   (1 << 1)		/* reverse map btree */
 #define XFS_SB_FEAT_RO_COMPAT_REFLINK  (1 << 2)		/* reflinked files */
 #define XFS_SB_FEAT_RO_COMPAT_INOBTCNT (1 << 3)		/* inobt block counts */
+#define XFS_SB_FEAT_RO_COMPAT_VERITY   (1 << 4)		/* fs-verity */
 #define XFS_SB_FEAT_RO_COMPAT_ALL \
 		(XFS_SB_FEAT_RO_COMPAT_FINOBT | \
 		 XFS_SB_FEAT_RO_COMPAT_RMAPBT | \
diff --git a/fs/xfs/libxfs/xfs_sb.c b/fs/xfs/libxfs/xfs_sb.c
index 94c272a2ae..744bd8480b 100644
--- a/fs/xfs/libxfs/xfs_sb.c
+++ b/fs/xfs/libxfs/xfs_sb.c
@@ -165,6 +165,8 @@
 		features |= XFS_FEAT_REFLINK;
 	if (sbp->sb_features_ro_compat & XFS_SB_FEAT_RO_COMPAT_INOBTCNT)
 		features |= XFS_FEAT_INOBTCNT;
+	if (sbp->sb_features_ro_compat & XFS_SB_FEAT_RO_COMPAT_VERITY)
+		features |= XFS_FEAT_VERITY;
 	if (sbp->sb_features_incompat & XFS_SB_FEAT_INCOMPAT_FTYPE)
 		features |= XFS_FEAT_FTYPE;
 	if (sbp->sb_features_incompat & XFS_SB_FEAT_INCOMPAT_SPINODES)
diff --git a/fs/xfs/xfs_mount.h b/fs/xfs/xfs_mount.h
index b871dfde37..8ef7fea8b3 100644
--- a/fs/xfs/xfs_mount.h
+++ b/fs/xfs/xfs_mount.h
@@ -381,6 +381,7 @@
 #define XFS_FEAT_EXCHANGE_RANGE	(1ULL << 27)	/* exchange range */
 #define XFS_FEAT_METADIR	(1ULL << 28)	/* metadata directory tree */
 #define XFS_FEAT_ZONED		(1ULL << 29)	/* zoned RT device */
+#define XFS_FEAT_VERITY		(1ULL << 30)	/* fs-verity */
 
 /* Mount features */
 #define XFS_FEAT_NOLIFETIME	(1ULL << 47)	/* disable lifetime hints */
@@ -438,6 +439,7 @@
 __XFS_HAS_FEAT(metadir, METADIR)
 __XFS_HAS_FEAT(zoned, ZONED)
 __XFS_HAS_FEAT(nolifetime, NOLIFETIME)
+__XFS_HAS_FEAT(verity, VERITY)
 
 static inline bool xfs_has_rtgroups(const struct xfs_mount *mp)
 {

-- 
- Andrey

