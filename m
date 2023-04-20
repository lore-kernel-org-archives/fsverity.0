Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 397B12906
	for <fsverity@lists.linux.dev>; Thu, 20 Apr 2023 07:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681976672;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xN6AqEpfmVjYvG0OhUB3hiPDQCXbC+IJ+pstcsNq1Nw=;
	b=WI28zwpPNwGkBfVwiArGAqtdKLBxMm68hd2SucuehOLzZa2PesDIMFwzSVGO/C5kFnpTsQ
	xbIpwadK44uy1gDROCmnBd6X0TwqRNd+jTFuFG1SPGqm9zM81nx2EtvKeN6medkSqrrzUk
	rdZQ7hh+lxWsXfqm5rULWRIMRJQ6awc=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-371-5tt90NRYOfi2vMUPeQ4JoA-1; Thu, 20 Apr 2023 03:44:30 -0400
X-MC-Unique: 5tt90NRYOfi2vMUPeQ4JoA-1
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-2a8b03ec360so1737091fa.1
        for <fsverity@lists.linux.dev>; Thu, 20 Apr 2023 00:44:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681976669; x=1684568669;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xN6AqEpfmVjYvG0OhUB3hiPDQCXbC+IJ+pstcsNq1Nw=;
        b=DxUR1iJBOsl59UsiulTBkZIYcMstCX6+5NG+18LlXUVsZQKExbi4hNHaZYJDZR0NPF
         v9CWiZD2b9m/l1xaZBwas3itVVsXPcV+wu5pOSCO6Cx0GhnXN8710FHSpYS2UJacfxU3
         REdKdNSb2YCd0HTADutFdL92qWtFMVE+X52Hgu+n5TeTgvQc+QtoibaYRJapE2bqUmVF
         C8hpa7c+A5NJqke+Dp95MiBqlkQk87AkbCFhQzMqjFWu19uGohVvSmDKWb/vQ6VhcuBi
         1pdsXfHqAYuAaKBGizJ1NnLZKU7xmaOByPYC0JlsQ6okJ4H28o5WJHH7+KmDR9Ab2fy5
         F7+Q==
X-Gm-Message-State: AAQBX9edHMjPvP7rJABbtXvl/phCf0HeDoFKidkGBtwm/jGcxxq6a7pD
	oU3toeEHEw+fCMNBdSt/tZJXDsqonZb4wrrQjxUFppWPYbpVDwtNBqHrZd5fjQ8v7/mElqtAiK2
	LqLYtybhIuuQgMZ0hPiY=
X-Received: by 2002:ac2:415a:0:b0:4b5:178f:a14c with SMTP id c26-20020ac2415a000000b004b5178fa14cmr141387lfi.16.1681976669389;
        Thu, 20 Apr 2023 00:44:29 -0700 (PDT)
X-Google-Smtp-Source: AKy350Y5TnQWQVXrxaYR7XlAeeWpFAOT4dk0n7uhnsiswCgbwrGDYzd29Nz60slBTRnB2usl6kqryA==
X-Received: by 2002:ac2:415a:0:b0:4b5:178f:a14c with SMTP id c26-20020ac2415a000000b004b5178fa14cmr141381lfi.16.1681976669093;
        Thu, 20 Apr 2023 00:44:29 -0700 (PDT)
Received: from localhost.localdomain (c-e6a5e255.022-110-73746f36.bbcust.telenor.se. [85.226.165.230])
        by smtp.googlemail.com with ESMTPSA id x24-20020ac24898000000b004edc7247778sm129468lfc.79.2023.04.20.00.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Apr 2023 00:44:28 -0700 (PDT)
From: Alexander Larsson <alexl@redhat.com>
To: miklos@szeredi.hu
Cc: linux-unionfs@vger.kernel.org,
	amir73il@gmail.com,
	ebiggers@kernel.org,
	tytso@mit.edu,
	fsverity@lists.linux.dev,
	Alexander Larsson <alexl@redhat.com>
Subject: [PATCH 2/6] ovl: Break out ovl_entry_path_real() from ovl_i_path_real()
Date: Thu, 20 Apr 2023 09:44:01 +0200
Message-Id: <4c5c62c05a00a97dce0ce5fbee020e82ee76c202.1681917551.git.alexl@redhat.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1681917551.git.alexl@redhat.com>
References: <cover.1681917551.git.alexl@redhat.com>
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

This allows us to get the real path from the ovl_entry in ovl_lookup()
before having finished setting up the resulting inode.

Signed-off-by: Alexander Larsson <alexl@redhat.com>
---
 fs/overlayfs/overlayfs.h |  2 ++
 fs/overlayfs/util.c      | 25 ++++++++++++++++++-------
 2 files changed, 20 insertions(+), 7 deletions(-)

diff --git a/fs/overlayfs/overlayfs.h b/fs/overlayfs/overlayfs.h
index 4e327665c316..477008186d18 100644
--- a/fs/overlayfs/overlayfs.h
+++ b/fs/overlayfs/overlayfs.h
@@ -395,6 +395,8 @@ void ovl_path_upper(struct dentry *dentry, struct path *path);
 void ovl_path_lower(struct dentry *dentry, struct path *path);
 void ovl_path_lowerdata(struct dentry *dentry, struct path *path);
 void ovl_i_path_real(struct inode *inode, struct path *path);
+void ovl_entry_path_real(struct ovl_fs *ofs, struct ovl_entry *oe,
+			 struct dentry *upperdentry, struct path *path);
 enum ovl_path_type ovl_path_real(struct dentry *dentry, struct path *path);
 enum ovl_path_type ovl_path_realdata(struct dentry *dentry, struct path *path);
 struct dentry *ovl_dentry_upper(struct dentry *dentry);
diff --git a/fs/overlayfs/util.c b/fs/overlayfs/util.c
index 9a042768013e..77c954591daa 100644
--- a/fs/overlayfs/util.c
+++ b/fs/overlayfs/util.c
@@ -351,19 +351,30 @@ struct dentry *ovl_i_dentry_upper(struct inode *inode)
 	return ovl_upperdentry_dereference(OVL_I(inode));
 }
 
-void ovl_i_path_real(struct inode *inode, struct path *path)
-{
-	struct ovl_path *lowerstack = ovl_lowerstack(OVL_I_E(inode));
+void ovl_entry_path_real(struct ovl_fs *ofs,
+			 struct ovl_entry *oe,
+			 struct dentry *upperdentry,
+			 struct path *path)
+{
+	if (upperdentry) {
+		path->dentry = upperdentry;
+		path->mnt = ovl_upper_mnt(ofs);
+	} else {
+		struct ovl_path *lowerstack = ovl_lowerstack(oe);
 
-	path->dentry = ovl_i_dentry_upper(inode);
-	if (!path->dentry) {
 		path->dentry = lowerstack->dentry;
 		path->mnt = lowerstack->layer->mnt;
-	} else {
-		path->mnt = ovl_upper_mnt(OVL_FS(inode->i_sb));
 	}
 }
 
+void ovl_i_path_real(struct inode *inode, struct path *path)
+{
+	ovl_entry_path_real(OVL_FS(inode->i_sb),
+			    OVL_I_E(inode),
+			    ovl_i_dentry_upper(inode),
+			    path);
+}
+
 struct inode *ovl_inode_upper(struct inode *inode)
 {
 	struct dentry *upperdentry = ovl_i_dentry_upper(inode);
-- 
2.39.2

