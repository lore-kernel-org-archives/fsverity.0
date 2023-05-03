Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8830747E
	for <fsverity@lists.linux.dev>; Wed,  3 May 2023 08:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683103919;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QiUYoZhsO38yQi5Z+ZT4TmEZo+0EwfXvmiSU1oG1sMU=;
	b=SGx2L6uqy51eACuC9+q2m2bQPmpmoxYqPMlvUnvHBOLWBs0Qi69pvFBXjBYTMCUOHDxDfz
	c6Q7PgsiGT/JUI+PSM4RwUYlDLnUqpaa4NXNH56bdII/maet5BRE9BKIthVpfMhCnt9aox
	3TNAANJGkgd9+q40e58tIIvQJ/m2dno=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-465-RDHB2hXHNquqwtZz0PeEYw-1; Wed, 03 May 2023 04:51:58 -0400
X-MC-Unique: RDHB2hXHNquqwtZz0PeEYw-1
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-4edd608fa5cso2970843e87.3
        for <fsverity@lists.linux.dev>; Wed, 03 May 2023 01:51:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683103916; x=1685695916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QiUYoZhsO38yQi5Z+ZT4TmEZo+0EwfXvmiSU1oG1sMU=;
        b=g3ijbMkl2kQWoUE7wZAk7ZeSBRRPf8zjzwhMmVigmCfcwvbFRjImQuuhlqsdUh7Xce
         5zAk4r3dwP8bX02rZFlFj5JhMYU/kGW+NnyER31UF6ZU5lCYjvEtIkWp02IGb0/K3UI8
         8wzvWfNukcuG+j5w43SikJe1zpWhvM5w9GUh1g6WNCcGNctmKt1Oef7BlyFHNB1apYFR
         O3U6KHFGusvuS7HimVFjKdwWB9WJ4Zt/oT5zUEMLG9ycBZgN14yzB6Jpzl6GVfCKvPR2
         UabjLxU0LAn6nTtU0NzvqrbG0szGlGmoZjdZ9V6p2+8ERGyRoC8OE4KNAUuk881tOUSA
         dgpw==
X-Gm-Message-State: AC+VfDxGt2oY3VmV+WUHK6flxBkpxcdgW2to2GWMUk9jlIsKmrFeKsRn
	LT6HoSPDwiXcWOn4GBEMuwgca4M51109I8hgQ3Pv80ViIGWSUYzkqMpsn9qqch49HZ0AQYOwQaM
	qGgccMvwANZ+fUiWvWrM=
X-Received: by 2002:a05:6512:3744:b0:4ec:9ef9:e3d with SMTP id a4-20020a056512374400b004ec9ef90e3dmr584537lfs.26.1683103916609;
        Wed, 03 May 2023 01:51:56 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7gg4av5X822rtZVLUAVe8lkkygabGEWSRqdxCBuGCAzot3kNC76Sn92ME672RYhMYqQiFpHg==
X-Received: by 2002:a05:6512:3744:b0:4ec:9ef9:e3d with SMTP id a4-20020a056512374400b004ec9ef90e3dmr584534lfs.26.1683103916372;
        Wed, 03 May 2023 01:51:56 -0700 (PDT)
Received: from localhost.localdomain (c-e6a5e255.022-110-73746f36.bbcust.telenor.se. [85.226.165.230])
        by smtp.googlemail.com with ESMTPSA id j6-20020ac24546000000b004ed4fa5f20fsm5907089lfm.25.2023.05.03.01.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 01:51:55 -0700 (PDT)
From: Alexander Larsson <alexl@redhat.com>
To: miklos@szeredi.hu
Cc: linux-unionfs@vger.kernel.org,
	amir73il@gmail.com,
	ebiggers@kernel.org,
	tytso@mit.edu,
	fsverity@lists.linux.dev,
	Alexander Larsson <alexl@redhat.com>
Subject: [PATCH v2 2/6] ovl: Break out ovl_e_path_real() from ovl_i_path_real()
Date: Wed,  3 May 2023 10:51:35 +0200
Message-Id: <86b9adf5b011a17fc51016fa7a66cb8f87578c0e.1683102959.git.alexl@redhat.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1683102959.git.alexl@redhat.com>
References: <cover.1683102959.git.alexl@redhat.com>
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
Reviewed-by: Amir Goldstein <amir73il@gmail.com>
---
 fs/overlayfs/overlayfs.h |  2 ++
 fs/overlayfs/util.c      | 25 ++++++++++++++++++-------
 2 files changed, 20 insertions(+), 7 deletions(-)

diff --git a/fs/overlayfs/overlayfs.h b/fs/overlayfs/overlayfs.h
index c1233eec2d40..6ce1c7906bb9 100644
--- a/fs/overlayfs/overlayfs.h
+++ b/fs/overlayfs/overlayfs.h
@@ -391,6 +391,8 @@ void ovl_path_upper(struct dentry *dentry, struct path *path);
 void ovl_path_lower(struct dentry *dentry, struct path *path);
 void ovl_path_lowerdata(struct dentry *dentry, struct path *path);
 void ovl_i_path_real(struct inode *inode, struct path *path);
+void ovl_e_path_real(struct ovl_fs *ofs, struct ovl_entry *oe,
+		     struct dentry *upperdentry, struct path *path);
 enum ovl_path_type ovl_path_real(struct dentry *dentry, struct path *path);
 enum ovl_path_type ovl_path_realdata(struct dentry *dentry, struct path *path);
 struct dentry *ovl_dentry_upper(struct dentry *dentry);
diff --git a/fs/overlayfs/util.c b/fs/overlayfs/util.c
index e526ab059872..c32252153e5e 100644
--- a/fs/overlayfs/util.c
+++ b/fs/overlayfs/util.c
@@ -331,19 +331,30 @@ struct dentry *ovl_i_dentry_upper(struct inode *inode)
 	return ovl_upperdentry_dereference(OVL_I(inode));
 }
 
-void ovl_i_path_real(struct inode *inode, struct path *path)
-{
-	struct ovl_path *lowerpath = ovl_lowerpath(OVL_I_E(inode));
+void ovl_e_path_real(struct ovl_fs *ofs,
+		     struct ovl_entry *oe,
+		     struct dentry *upperdentry,
+		     struct path *path)
+{
+	if (upperdentry) {
+		path->dentry = upperdentry;
+		path->mnt = ovl_upper_mnt(ofs);
+	} else {
+		struct ovl_path *lowerpath = ovl_lowerpath(oe);
 
-	path->dentry = ovl_i_dentry_upper(inode);
-	if (!path->dentry) {
 		path->dentry = lowerpath->dentry;
 		path->mnt = lowerpath->layer->mnt;
-	} else {
-		path->mnt = ovl_upper_mnt(OVL_FS(inode->i_sb));
 	}
 }
 
+void ovl_i_path_real(struct inode *inode, struct path *path)
+{
+	ovl_e_path_real(OVL_FS(inode->i_sb),
+			OVL_I_E(inode),
+			ovl_i_dentry_upper(inode),
+			path);
+}
+
 struct inode *ovl_inode_upper(struct inode *inode)
 {
 	struct dentry *upperdentry = ovl_i_dentry_upper(inode);
-- 
2.39.2

