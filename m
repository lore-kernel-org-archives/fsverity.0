Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3880F38F93
	for <fsverity@lists.linux.dev>; Fri,  6 Oct 2023 18:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TeYI+aDZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1696618362;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xavYdX/wZ0RnKLfU/MnqAKGW0flPB1iaCT9iprzm3zc=;
	b=TeYI+aDZJFBjip7SsDUQ5zyithcGc3lpZIUYdHbn7najvT5xIoJ+uqoASVHAsLqVb3CRrZ
	rkgnJ1N6aHMjsKjSgk3pkqjhZEdiXjZlQpaJIgiCp6btIxYqR+cuOL2plDlCgDNaIX1F/r
	2k1IeLaGa8R5pEwsTqrGMr38q2dto+w=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-205-D34BomSpPTWw0HmUe_5Oxg-1; Fri, 06 Oct 2023 14:52:41 -0400
X-MC-Unique: D34BomSpPTWw0HmUe_5Oxg-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-9a62adedadbso211234766b.1
        for <fsverity@lists.linux.dev>; Fri, 06 Oct 2023 11:52:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696618360; x=1697223160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xavYdX/wZ0RnKLfU/MnqAKGW0flPB1iaCT9iprzm3zc=;
        b=qA6d8XcEfVqQpnRqWmOLYn5rhWcxnE+It8/ZZNdnmHCj8nVNCGoDhFXdcs66+Xl3/+
         75OhZpQbOmDcfrJ4hlPqhUozbrM//jdJK7sTkFBxkGAVvCJPmfXtjO+rcG2W+fBd7wlW
         Lx0Gj+0pKxyDAQwIkNQ9o1j/TMwwAmSmTBWzNAQX8x/v3MbA24jvmHIQuIeFOXmswQk8
         dRxtauvln+8LIc3K+zUkluGfnCCgJIBNcfPKjId8JKFcU4UU0e5zXyHAbZ2nxFWYVzYY
         PrTJdfV5S5rS4e1kH8G2As/hTmT7MDHB3YCWYoAKQWy/1JGD+e7eQ6IIXFjHNLTrUu9Z
         +xNQ==
X-Gm-Message-State: AOJu0YyFJm7gmfpOphQWzTTF36A5y418h57dr83KB3A+WRdXqL0wslNe
	QZ/Nz4+hfHkJbG0P7lWD7CzMGFb/W2aggCGQZLfc9awItUWG+EwHJu+j6LN2wEPrihpAcgDdLnW
	KUuHUfLWThqtr9feTKg==
X-Received: by 2002:a17:907:75f7:b0:9ae:658f:a80a with SMTP id jz23-20020a17090775f700b009ae658fa80amr7985137ejc.48.1696618360156;
        Fri, 06 Oct 2023 11:52:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG7SK73SUKTlwsNFT0YwN9JhYvDJYdu/UT4rHQhvxh32fN6Ie3lbiMgVmY+qoDZrohiyXJoFw==
X-Received: by 2002:a17:907:75f7:b0:9ae:658f:a80a with SMTP id jz23-20020a17090775f700b009ae658fa80amr7985129ejc.48.1696618359925;
        Fri, 06 Oct 2023 11:52:39 -0700 (PDT)
Received: from localhost.localdomain ([109.183.6.197])
        by smtp.gmail.com with ESMTPSA id os5-20020a170906af6500b009b947f81c4asm3304741ejb.155.2023.10.06.11.52.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 11:52:39 -0700 (PDT)
From: Andrey Albershteyn <aalbersh@redhat.com>
To: linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	fsverity@lists.linux.dev
Cc: djwong@kernel.org,
	ebiggers@kernel.org,
	david@fromorbit.com,
	dchinner@redhat.com,
	Andrey Albershteyn <aalbersh@redhat.com>
Subject: [PATCH v3 23/28] xfs: don't allow to enable DAX on fs-verity sealsed inode
Date: Fri,  6 Oct 2023 20:49:17 +0200
Message-Id: <20231006184922.252188-24-aalbersh@redhat.com>
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

fs-verity doesn't support DAX. Forbid filesystem to enable DAX on
inodes which already have fs-verity enabled. The opposite is checked
when fs-verity is enabled, it won't be enabled if DAX is.

Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
---
 fs/xfs/xfs_iops.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/xfs/xfs_iops.c b/fs/xfs/xfs_iops.c
index 9f2d5c2505ae..3153767f0d6f 100644
--- a/fs/xfs/xfs_iops.c
+++ b/fs/xfs/xfs_iops.c
@@ -1209,6 +1209,8 @@ xfs_inode_should_enable_dax(
 		return false;
 	if (!xfs_inode_supports_dax(ip))
 		return false;
+	if (ip->i_diflags2 & XFS_DIFLAG2_VERITY)
+		return false;
 	if (xfs_has_dax_always(ip->i_mount))
 		return true;
 	if (ip->i_diflags2 & XFS_DIFLAG2_DAX)
-- 
2.40.1

