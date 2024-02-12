Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AE2F3FB1E
	for <fsverity@lists.linux.dev>; Mon, 12 Feb 2024 17:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707757221; cv=none; b=geVs5a5opC/YOJKSXDr3IIjcz5fHAp9i4CobWnggNuooER6/BalQO+rjMQf0WIFJkhp2tw/OUc7yqkEra0fqJfFQlWNHrbztbl54szSkhx6gFoem9VhCS20Pm0JTjvzARIEfFJKHwh8pDA7orIO/hJjtZza3TuizkZdNY9VfsUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707757221; c=relaxed/simple;
	bh=5efDprULe6taPXbMIbssh9R9ZTvpV1+LRg5VBOs1ncI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rYDzEuCeY92fGd72UFlIGQ/aL8n/UzD8PrpycwMEO9wHgHH05LBmrwKmDGHdrbjZ+Otxix9TXlSsFZm9PwfNMYhJ4zA4uGYcVpOYlY8b11NZbdzPML/og0LGcKPJwK5xJG2Ij2nNbGUKQFFEvERbQF7vA0KdQFwH9ZbG3yrmf0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AfmU0LjR; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AfmU0LjR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707757219;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JU0n6o39Qx9ylv78PJjsl41s62AUUJ55j4stQvjouKk=;
	b=AfmU0LjRjreOyTIWqWD3onJOqur3roHyTNDVQwFTkzbQS8gAPuhV+eYd6MQIcgqUEDmlcO
	oOw1WeFX5CU79UPS8ereCv7D/rvuFHSlyu+6iWd5mDV1LADqRACMU2HryjTvjtD5LxjTBn
	kqy22ATtDEbw+RgtqdBPmCRPGVGTLGM=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-425-6vkU4-lYPNq2EZfbWgskpw-1; Mon, 12 Feb 2024 12:00:17 -0500
X-MC-Unique: 6vkU4-lYPNq2EZfbWgskpw-1
Received: by mail-lj1-f200.google.com with SMTP id 38308e7fff4ca-2d0c647f8ddso36267561fa.3
        for <fsverity@lists.linux.dev>; Mon, 12 Feb 2024 09:00:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707757216; x=1708362016;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JU0n6o39Qx9ylv78PJjsl41s62AUUJ55j4stQvjouKk=;
        b=ZZmED631liHVYCXAi5dr3dKG2G9wAVZlBNU8t7/eZNz1Cc4IE1NBvDoGNy4f2ifEYl
         WH2NkcCUNnL3nskep1gWQjPGylEkVD2ItG9Crwo3zsNk21vikjpmam3CQy71Lu17AiHK
         VmDmVlG0VuZFCvLVqgJjOE4HDs+k6qla2PnWkc4+yBzvAtGlwwCJ4ktHsPt3sjVDm/KP
         eQnDqeEWNGyaaAJGJmDEq1/OgttS5ZCqpI/TBpBOG/vdGUjVt5FzEMXL/ZzXE4utOlx1
         c+Cp4FrgQ9oR5WN2c44QAE3huszYsj/XTTOzmtoe4KnHBZndXOcqdNfOK7ymLXl7Xj7z
         60rw==
X-Gm-Message-State: AOJu0YzKFDTOeLiYHX6OW2K0NBWcWUKdW58TA+j0AclFvD8iZD4liwoR
	u81OoML4THUOocbJNdQy0h70dMudC0Gtv+oblC+sLL8EpUzxbEXC2jdr++T25UacnXfg2FulPWW
	5IZhcGT4oQrZDvTrEeBR1Peb1KD1qDtbogIel1nQS21GclJnu+VsBTa3VaCTO2YpD3kASoYsEki
	eTNASahtXL0lhmHdk7kYdHnue9ng0FFW04sV5DcK4=
X-Received: by 2002:a2e:a586:0:b0:2d0:b758:93a5 with SMTP id m6-20020a2ea586000000b002d0b75893a5mr5900130ljp.18.1707757216170;
        Mon, 12 Feb 2024 09:00:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGWfgm/7xQWafBoXVO5m9B2+ecerqMNgmsVK2YVSO0I9LtMY6feCLDnkZOBYsU2n0tsoz4y0g==
X-Received: by 2002:a2e:a586:0:b0:2d0:b758:93a5 with SMTP id m6-20020a2ea586000000b002d0b75893a5mr5900112ljp.18.1707757215872;
        Mon, 12 Feb 2024 09:00:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVn/DPoAemeqvTkQ5zPfLy0hfJFjk4TKK9KhFtVG/UOJ0tl9rOXnZCBL8KZ35eC5xFC6HRbtaADDRpp9DzBfnmNOnXh/NJJ2tH4savAB+mNHahiaMS1HqsVSp99kIhOulubeOW05Q8flG8Rj8GTfbLcvB7+d6vIzEk3qyIoCg29wS/er+jC/w7fwJlPStbzeOShAmMTlvX7WCihOqzG7zVA6CevqmamhlIf
Received: from thinky.redhat.com ([109.183.6.197])
        by smtp.gmail.com with ESMTPSA id 14-20020a0564021f4e00b0056176e95a88sm2620261edz.32.2024.02.12.09.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 09:00:14 -0800 (PST)
From: Andrey Albershteyn <aalbersh@redhat.com>
To: fsverity@lists.linux.dev,
	linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	chandan.babu@oracle.com,
	djwong@kernel.org,
	ebiggers@kernel.org
Cc: Andrey Albershteyn <aalbersh@redhat.com>
Subject: [PATCH v4 18/25] xfs: add inode on-disk VERITY flag
Date: Mon, 12 Feb 2024 17:58:15 +0100
Message-Id: <20240212165821.1901300-19-aalbersh@redhat.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240212165821.1901300-1-aalbersh@redhat.com>
References: <20240212165821.1901300-1-aalbersh@redhat.com>
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
index e36718c93539..ea78b595aa97 100644
--- a/fs/xfs/libxfs/xfs_format.h
+++ b/fs/xfs/libxfs/xfs_format.h
@@ -1086,16 +1086,18 @@ static inline void xfs_dinode_put_rdev(struct xfs_dinode *dip, xfs_dev_t rdev)
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
index 1fd94958aa97..6289a0c49780 100644
--- a/fs/xfs/xfs_inode.c
+++ b/fs/xfs/xfs_inode.c
@@ -629,6 +629,8 @@ xfs_ip2xflags(
 			flags |= FS_XFLAG_DAX;
 		if (ip->i_diflags2 & XFS_DIFLAG2_COWEXTSIZE)
 			flags |= FS_XFLAG_COWEXTSIZE;
+		if (ip->i_diflags2 & XFS_DIFLAG2_VERITY)
+			flags |= FS_XFLAG_VERITY;
 	}
 
 	if (xfs_inode_has_attr_fork(ip))
diff --git a/fs/xfs/xfs_iops.c b/fs/xfs/xfs_iops.c
index a0d77f5f512e..8972274b8bc0 100644
--- a/fs/xfs/xfs_iops.c
+++ b/fs/xfs/xfs_iops.c
@@ -1242,6 +1242,8 @@ xfs_diflags_to_iflags(
 		flags |= S_NOATIME;
 	if (init && xfs_inode_should_enable_dax(ip))
 		flags |= S_DAX;
+	if (xflags & FS_XFLAG_VERITY)
+		flags |= S_VERITY;
 
 	/*
 	 * S_DAX can only be set during inode initialization and is never set by
-- 
2.42.0

