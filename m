Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EAA27D083
	for <fsverity@lists.linux.dev>; Mon,  4 Mar 2024 19:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709579553; cv=none; b=T2NzhASP+TWY4LId11s4ZXcoQyG/ap8n6wmks+pK6watQbhvCAJ82/bGLz/QzCgcOi7wCJ9eTrNL6q9CIjG5wGrSpxOy/cCWttFh6EL9z5mkZaCIudAVlV8JxE33WAmvkAKFIp4S9qAbCJHDVnwe42Z+PvonpIXDY29fwtHcTts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709579553; c=relaxed/simple;
	bh=iCYfKJ0kFYzgtrazzboyA1nOY5OMP0Y0MHu/TR1n9Eg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ETVp9QZf3ccPvj+HM2RgsBl7xJHOIq+dEd7IiOJCandA9CUGZ8J8snILAhX9FgtlSySwRIj3H+UnTTphghpPU3Gjyu3fF9e+zREMzsezcTHtanxSX7ER91m7g6TaG9TVM2hE4R7pJvDb3sTgbFHmZQleofe3TWwlRZJO+jEecDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=No8ZAafi; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="No8ZAafi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709579550;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XIjyGj3ThYRh+HmmhdifsZuAaDeDolxvDOaonPSFEQw=;
	b=No8ZAafiTvlGjiJn1mI5/0Iz3rUQBT7PfOqEPFhj3pDIJsYufhEUZ+rebeJpjE3hJ45iCw
	JkU2Y7fsRe9eG39L+6aZE7gSAp0Ek/ix0M+bPu3Z4KFEeNG8xIKcWWYre7L/4hkd7plDzE
	oZvWYC8gRAehmY/JhytK7opD4dwI0kk=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-655-nbflCjcaPtmI9xhqtMxfmw-1; Mon, 04 Mar 2024 14:12:29 -0500
X-MC-Unique: nbflCjcaPtmI9xhqtMxfmw-1
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-5133f0f1b9bso1694280e87.2
        for <fsverity@lists.linux.dev>; Mon, 04 Mar 2024 11:12:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709579547; x=1710184347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XIjyGj3ThYRh+HmmhdifsZuAaDeDolxvDOaonPSFEQw=;
        b=XVDjRaP2YGiUqxbBCUE4lFuUE7wg8B5cEj99ttle0jEmjBjHuavn7bZuevUqt9AwDP
         uhQ3u3BRgoYlSirLO/kHJaI+TGa64hJDtBilwgxF4orezHJEoYKz2Adhke27utX/5hJg
         3Nm66ZUVZ7A+dHGoZ1E1XbDVXu9sT/1i1U0HMPVAs4bi4YzTxE5cLI7fCnb3Ok53tgEX
         PGWXhzkMEc2oBbq30k3BoQoTrQadEfnbIlYvsltegMoFiCfRB01G5kvnGMo7xp2F8sMv
         teq+LrpmP8ur0v9avIsWxagVVUt1c6Cf5Zd+MrHFs9R8RhbSInWcdwDju4Vf3usIxZOs
         CmFA==
X-Gm-Message-State: AOJu0YympdjN4myu5vKv1v6W/2DU4gAftKd1L2+fteo9G4a02FrvORlP
	FNwEgMsAT53E1YsSti+5WnpqgWJAIb467dIs5L8HuoPI2HezapXe9Nd3FiYQLyVlDZN3yYB+NFA
	5AodYHVlkFIalF8YxddRMFDJ9qmX0wIErpWJbB5MloNvUq/UNdVCklxd4J7A1RYlY/dcGdpgjYA
	Xh+HoLC6J3KubVMlRHXDM7kv/+qlZ7QnuKvHr5Opw=
X-Received: by 2002:ac2:55bc:0:b0:512:bb33:2eab with SMTP id y28-20020ac255bc000000b00512bb332eabmr6263988lfg.58.1709579546760;
        Mon, 04 Mar 2024 11:12:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFsWhH2n6f8sGCcVRKP+Ql2DOsPvlPsXH0xMAYeWcoI/5BOIZnj57KeeBn8GBeEsExnNwHY0A==
X-Received: by 2002:ac2:55bc:0:b0:512:bb33:2eab with SMTP id y28-20020ac255bc000000b00512bb332eabmr6263977lfg.58.1709579546458;
        Mon, 04 Mar 2024 11:12:26 -0800 (PST)
Received: from thinky.redhat.com ([109.183.6.197])
        by smtp.gmail.com with ESMTPSA id a11-20020a1709064a4b00b00a44a04aa3cfsm3783319ejv.225.2024.03.04.11.12.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 11:12:25 -0800 (PST)
From: Andrey Albershteyn <aalbersh@redhat.com>
To: fsverity@lists.linux.dev,
	linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	chandan.babu@oracle.com,
	djwong@kernel.org,
	ebiggers@kernel.org
Cc: Andrey Albershteyn <aalbersh@redhat.com>
Subject: [PATCH v5 17/24] xfs: add inode on-disk VERITY flag
Date: Mon,  4 Mar 2024 20:10:40 +0100
Message-ID: <20240304191046.157464-19-aalbersh@redhat.com>
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

Add flag to mark inodes which have fs-verity enabled on them (i.e.
descriptor exist and tree is built).

Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
---
 fs/xfs/libxfs/xfs_format.h | 4 +++-
 fs/xfs/xfs_inode.c         | 2 ++
 fs/xfs/xfs_iops.c          | 2 ++
 3 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/fs/xfs/libxfs/xfs_format.h b/fs/xfs/libxfs/xfs_format.h
index 93d280eb8451..3ce2902101bc 100644
--- a/fs/xfs/libxfs/xfs_format.h
+++ b/fs/xfs/libxfs/xfs_format.h
@@ -1085,16 +1085,18 @@ static inline void xfs_dinode_put_rdev(struct xfs_dinode *dip, xfs_dev_t rdev)
 #define XFS_DIFLAG2_COWEXTSIZE_BIT   2  /* copy on write extent size hint */
 #define XFS_DIFLAG2_BIGTIME_BIT	3	/* big timestamps */
 #define XFS_DIFLAG2_NREXT64_BIT 4	/* large extent counters */
+#define XFS_DIFLAG2_VERITY_BIT	5	/* inode sealed by fsverity */
 
 #define XFS_DIFLAG2_DAX		(1 << XFS_DIFLAG2_DAX_BIT)
 #define XFS_DIFLAG2_REFLINK     (1 << XFS_DIFLAG2_REFLINK_BIT)
 #define XFS_DIFLAG2_COWEXTSIZE  (1 << XFS_DIFLAG2_COWEXTSIZE_BIT)
 #define XFS_DIFLAG2_BIGTIME	(1 << XFS_DIFLAG2_BIGTIME_BIT)
 #define XFS_DIFLAG2_NREXT64	(1 << XFS_DIFLAG2_NREXT64_BIT)
+#define XFS_DIFLAG2_VERITY	(1 << XFS_DIFLAG2_VERITY_BIT)
 
 #define XFS_DIFLAG2_ANY \
 	(XFS_DIFLAG2_DAX | XFS_DIFLAG2_REFLINK | XFS_DIFLAG2_COWEXTSIZE | \
-	 XFS_DIFLAG2_BIGTIME | XFS_DIFLAG2_NREXT64)
+	 XFS_DIFLAG2_BIGTIME | XFS_DIFLAG2_NREXT64 | XFS_DIFLAG2_VERITY)
 
 static inline bool xfs_dinode_has_bigtime(const struct xfs_dinode *dip)
 {
diff --git a/fs/xfs/xfs_inode.c b/fs/xfs/xfs_inode.c
index ea48774f6b76..59446e9e1719 100644
--- a/fs/xfs/xfs_inode.c
+++ b/fs/xfs/xfs_inode.c
@@ -607,6 +607,8 @@ xfs_ip2xflags(
 			flags |= FS_XFLAG_DAX;
 		if (ip->i_diflags2 & XFS_DIFLAG2_COWEXTSIZE)
 			flags |= FS_XFLAG_COWEXTSIZE;
+		if (ip->i_diflags2 & XFS_DIFLAG2_VERITY)
+			flags |= FS_XFLAG_VERITY;
 	}
 
 	if (xfs_inode_has_attr_fork(ip))
diff --git a/fs/xfs/xfs_iops.c b/fs/xfs/xfs_iops.c
index 66f8c47642e8..0e5cdb82b231 100644
--- a/fs/xfs/xfs_iops.c
+++ b/fs/xfs/xfs_iops.c
@@ -1241,6 +1241,8 @@ xfs_diflags_to_iflags(
 		flags |= S_NOATIME;
 	if (init && xfs_inode_should_enable_dax(ip))
 		flags |= S_DAX;
+	if (xflags & FS_XFLAG_VERITY)
+		flags |= S_VERITY;
 
 	/*
 	 * S_DAX can only be set during inode initialization and is never set by
-- 
2.42.0

