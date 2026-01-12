Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 375EE2D4B68
	for <fsverity@lists.linux.dev>; Mon, 12 Jan 2026 14:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768229452; cv=none; b=u34CBZXIFHwLa9BwnD2HoWcsF5rSiSx0xFiwz3/aHc0hLYhSCdzaZhL+iRZJG6Kp/odZfqgMJXjUCcSibSqdhW8O4gBL01CYoEMxTsHX+KSWqWL6NZlpTzxPLeKkm3Qx29gB1lsFczHQcEHk+xEhpaHp2/Yg3ws0yYzk3GlfhTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768229452; c=relaxed/simple;
	bh=+9KMgGt3/7caMsee+Z5WvgdzDLlVEyt0+rlirmS1zuc=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=iREO4zI+KmHwjTao0HZ68kAwbW0xkBW41nG6UenqGFZP+tQpm13imVjDxBc0gvc7wGK9iapvfFRfGcmG8qbi1ytrKkQTA1jYifBz6u8vWLuSflBBRwTLJsQUrnFla1JruaaFeE0TzEZckQ6NFYgd7Jkjip56RvqhVd3S0gs8ZlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eQDhhjPH; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eQDhhjPH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768229450;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wg9iw92qCFC8ETA0UphY+p99eAf356mavdt9eRroIQw=;
	b=eQDhhjPHgZXNCGtiAOwfzZ2rM3tSRHM6hlW6dkiMC2TGIpMawGMg0O8OfYMjdU75S4GEI0
	Jdf4Chno4PAXJiYoeXVW2QkqYqL65mjLwJb+MJNN5SBmPgW0w3bohC1KRfjYHPt97sblhh
	xz8lJ6U93092Rs/+9uslOy6LQr8ljlA=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-131-8VAri5CGOjOpziUXQn_Usw-1; Mon, 12 Jan 2026 09:50:42 -0500
X-MC-Unique: 8VAri5CGOjOpziUXQn_Usw-1
X-Mimecast-MFC-AGG-ID: 8VAri5CGOjOpziUXQn_Usw_1768229441
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-b86fd61e3b4so176733166b.0
        for <fsverity@lists.linux.dev>; Mon, 12 Jan 2026 06:50:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768229441; x=1768834241;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wg9iw92qCFC8ETA0UphY+p99eAf356mavdt9eRroIQw=;
        b=p1UNUIKW9a3/JLQdJxALLneJBAeOvvk4dMaRw9Yk0+ge4l6Xtz9rcuKi5YDEFnvmJU
         6qXOcg6sJJHBQ4H8b0YcbLR/FOCVJtooaYvwOGsWzBg5hWpWdmcJDQFq1vkTMX+SREox
         uumotzyqqN4FI4pE5N+BuiEfJQprrt9P3p43oCFeTWdAwRFyAXtfHDt3F0d7FrA70UeA
         og9WgR69URFAXJ9K6ak9DKGzBGmtI6nIsylrGTfC0sL5p8PHk4cDMKb7SFjkL6JgokpF
         2PMQTxRMGEMXw65uwRcQHVYw/7JMSxE2JBcSgYVAIZyDaTUdhWPAuT7bmQVh/gitTaO/
         TIjQ==
X-Gm-Message-State: AOJu0YxhVyZRcostLr2TI8uBNSsUOUsFVX211Yz6PtH6D6tJ3BIZm4bb
	U6lg8X978aO14iEVqCQ/Tz0/T/gYaN6vXq0F+ah70KYs/C4NQ2uFwcznst1aBhYt4Y8iisJ6mPp
	wktr4x35dzOSglftHP61YFmIci30SLtwjJkAnkOO/2Q/DhtEmO6bZfMyVV/YtKT/LWJ6i29qmzf
	/ns5TxIZI5twU6omehroi6EvougbRLDHdFMo5VrhRNMZg=
X-Gm-Gg: AY/fxX46O7qteyWsZF6guuoj+9uQHGZAS/plWCtHCKB2r9onm0pONAdLsmc7lewQvT3
	uSBYLnZQ3HyuEJ70tRdD+ZOHQPXQ2nXfOUUChuWwo8SHhk+WQQKW9kIetOydiIhML5b6zJgu1tL
	YVZ0PGgs9BYju9BerVuWKn8wIprezAJDE0FxU2G2WS6eNcZ/Gcon6i3pr6Q1fbCmpkd02GrGIHG
	w6halUmnLa4scnwM2p/54Mg1RZU74vwnW7V0hD/b5eqUSDiDdsFhs+aGYNYXl8l+trfD5qKB+Uv
	S5hEe0A29z5MeuZt0w1G4Qicj/auL0oGu3jO6DNwXRplahw4R3VzIPBjj8FwwOUGf/EIdwOamEs
	=
X-Received: by 2002:a17:907:98d:b0:b77:1a42:d5c0 with SMTP id a640c23a62f3a-b844538b3e4mr1950906666b.43.1768229440675;
        Mon, 12 Jan 2026 06:50:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGH2I2rt33a1ynUI4l9WFzFWdhTqQCngUGOXshJjWZ4QNCMhR7ys+oc7vCzG5OqUt6Hb6NJoQ==
X-Received: by 2002:a17:907:98d:b0:b77:1a42:d5c0 with SMTP id a640c23a62f3a-b844538b3e4mr1950903866b.43.1768229440164;
        Mon, 12 Jan 2026 06:50:40 -0800 (PST)
Received: from thinky ([217.30.74.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b86fc303d7esm712764766b.2.2026.01.12.06.50.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 06:50:39 -0800 (PST)
From: Andrey Albershteyn <aalbersh@redhat.com>
X-Google-Original-From: Andrey Albershteyn <aalbersh@kernel.org>
Date: Mon, 12 Jan 2026 15:50:39 +0100
To: fsverity@lists.linux.dev, linux-xfs@vger.kernel.org, 
	ebiggers@kernel.org, linux-fsdevel@vger.kernel.org, aalbersh@kernel.org, 
	aalbersh@redhat.com, djwong@kernel.org
Cc: djwong@kernel.org, david@fromorbit.com, hch@lst.de
Subject: [PATCH v2 7/22] xfs: add inode on-disk VERITY flag
Message-ID: <2hvx4mnwgcdhzcaoyvi37cn4b5wct6zvsz3cswkjrkrrdh3ngl@udq26gd3dd4h>
References: <cover.1768229271.patch-series@thinky>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <cover.1768229271.patch-series@thinky>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: AvO9ICsaopV_seyVp0tBlITnMN7UqLqbPeUVJKNVED0_1768229441
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Add flag to mark inodes which have fs-verity enabled on them (i.e.
descriptor exist and tree is built).

Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org>
Reviewed-by: Darrick J. Wong <djwong@kernel.org>
Signed-off-by: Darrick J. Wong <djwong@kernel.org>
---
 fs/xfs/libxfs/xfs_format.h     | 7 ++++++-
 fs/xfs/libxfs/xfs_inode_buf.c  | 8 ++++++++
 fs/xfs/libxfs/xfs_inode_util.c | 2 ++
 fs/xfs/xfs_iops.c              | 2 ++
 4 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/fs/xfs/libxfs/xfs_format.h b/fs/xfs/libxfs/xfs_format.h
index 64c2acd1cf..d67b404964 100644
--- a/fs/xfs/libxfs/xfs_format.h
+++ b/fs/xfs/libxfs/xfs_format.h
@@ -1231,16 +1231,21 @@
  */
 #define XFS_DIFLAG2_METADATA_BIT	5
 
+/* inodes sealed with fs-verity */
+#define XFS_DIFLAG2_VERITY_BIT		6
+
 #define XFS_DIFLAG2_DAX		(1ULL << XFS_DIFLAG2_DAX_BIT)
 #define XFS_DIFLAG2_REFLINK	(1ULL << XFS_DIFLAG2_REFLINK_BIT)
 #define XFS_DIFLAG2_COWEXTSIZE	(1ULL << XFS_DIFLAG2_COWEXTSIZE_BIT)
 #define XFS_DIFLAG2_BIGTIME	(1ULL << XFS_DIFLAG2_BIGTIME_BIT)
 #define XFS_DIFLAG2_NREXT64	(1ULL << XFS_DIFLAG2_NREXT64_BIT)
 #define XFS_DIFLAG2_METADATA	(1ULL << XFS_DIFLAG2_METADATA_BIT)
+#define XFS_DIFLAG2_VERITY	(1ULL << XFS_DIFLAG2_VERITY_BIT)
 
 #define XFS_DIFLAG2_ANY \
 	(XFS_DIFLAG2_DAX | XFS_DIFLAG2_REFLINK | XFS_DIFLAG2_COWEXTSIZE | \
-	 XFS_DIFLAG2_BIGTIME | XFS_DIFLAG2_NREXT64 | XFS_DIFLAG2_METADATA)
+	 XFS_DIFLAG2_BIGTIME | XFS_DIFLAG2_NREXT64 | XFS_DIFLAG2_METADATA | \
+	 XFS_DIFLAG2_VERITY)
 
 static inline bool xfs_dinode_has_bigtime(const struct xfs_dinode *dip)
 {
diff --git a/fs/xfs/libxfs/xfs_inode_buf.c b/fs/xfs/libxfs/xfs_inode_buf.c
index b1812b2c3c..c4fff7a34c 100644
--- a/fs/xfs/libxfs/xfs_inode_buf.c
+++ b/fs/xfs/libxfs/xfs_inode_buf.c
@@ -756,6 +756,14 @@
 	    !xfs_has_rtreflink(mp))
 		return __this_address;
 
+	/* only regular files can have fsverity */
+	if (flags2 & XFS_DIFLAG2_VERITY) {
+		if (!xfs_has_verity(mp))
+			return __this_address;
+		if ((mode & S_IFMT) != S_IFREG)
+			return __this_address;
+	}
+
 	if (xfs_has_zoned(mp) &&
 	    dip->di_metatype == cpu_to_be16(XFS_METAFILE_RTRMAP)) {
 		if (be32_to_cpu(dip->di_used_blocks) > mp->m_sb.sb_rgextents)
diff --git a/fs/xfs/libxfs/xfs_inode_util.c b/fs/xfs/libxfs/xfs_inode_util.c
index 309ce6dd55..aaf51207b2 100644
--- a/fs/xfs/libxfs/xfs_inode_util.c
+++ b/fs/xfs/libxfs/xfs_inode_util.c
@@ -126,6 +126,8 @@
 			flags |= FS_XFLAG_DAX;
 		if (ip->i_diflags2 & XFS_DIFLAG2_COWEXTSIZE)
 			flags |= FS_XFLAG_COWEXTSIZE;
+		if (ip->i_diflags2 & XFS_DIFLAG2_VERITY)
+			flags |= FS_XFLAG_VERITY;
 	}
 
 	if (xfs_inode_has_attr_fork(ip))
diff --git a/fs/xfs/xfs_iops.c b/fs/xfs/xfs_iops.c
index ad94fbf550..6b8e4e87ab 100644
--- a/fs/xfs/xfs_iops.c
+++ b/fs/xfs/xfs_iops.c
@@ -1394,6 +1394,8 @@
 		flags |= S_NOATIME;
 	if (init && xfs_inode_should_enable_dax(ip))
 		flags |= S_DAX;
+	if (xflags & FS_XFLAG_VERITY)
+		flags |= S_VERITY;
 
 	/*
 	 * S_DAX can only be set during inode initialization and is never set by

-- 
- Andrey

