Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF7BDF5C
	for <fsverity@lists.linux.dev>; Wed, 21 Jun 2023 11:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687346334;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oOUnohaMXefRhkI4iyZGMnRzQ4QyShTyqNghobmvALI=;
	b=jMN+DRvSfllYAftsanLQC/vJpleUpD1i0Lbu8WM8oaabTC2OD0Yth7imU+7yy8PlJfuh0N
	1WNhwhhnWoKD5EF/XE18oNhaHubdijESp+onqcDXQ9R+WZWBUfY0xLdkNHo0DC3dTwRos2
	WG0X8lG6XsYB9zR5/HQlfmr9ZOr12PA=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-453-3hF0KDLLMkGxTiRUBRF0nQ-1; Wed, 21 Jun 2023 07:18:53 -0400
X-MC-Unique: 3hF0KDLLMkGxTiRUBRF0nQ-1
Received: by mail-lj1-f199.google.com with SMTP id 38308e7fff4ca-2b477057d95so27117831fa.3
        for <fsverity@lists.linux.dev>; Wed, 21 Jun 2023 04:18:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687346332; x=1689938332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oOUnohaMXefRhkI4iyZGMnRzQ4QyShTyqNghobmvALI=;
        b=j4hHlkiDpee/Lp0js3moha0SWRuitFbmYIdNQGzXgHwPunVRJgaAsY8mEYRyhfK4eM
         arsHcc1FVc9PLq2HJKoA1/PUm7Ere1DHcwVW8W0x+g50yJp46FpntDiiv2vNYG4NnEl3
         H+BmsY7uVP+x6YoMQIkKVlYKp65p8H+SCQe1NVB25QBXBQNQY4tMb9Zk1cnnhaltzBHn
         WGJFBitCQvno32fvuh9EbjjTIk/ORtTbiy1KrPXD94r7rQpZhRf7IVqSPmiQrHNcfg9Q
         pbYGxJzxjAoKTBXqz1JPsiqSlde/PCoRxTWKnMNsXTxgiP9fu9vpfZnGZ0ypNd3J2Jf6
         S6OQ==
X-Gm-Message-State: AC+VfDz/ZYjDOv4BxMkFe1chRRbasC3mQlYDb99CfoOP5QNrnuxei+df
	QVAfP8q0fnFNtTHo6UZkdjhivVKyjykYQvsSFAG46h8KTlUk1UsBj2nP2LSZRz9rJ8t6Izln+Kw
	RidecXf4btAoC8XH9elE=
X-Received: by 2002:a2e:888f:0:b0:2b4:85d1:e299 with SMTP id k15-20020a2e888f000000b002b485d1e299mr3885351lji.5.1687346331824;
        Wed, 21 Jun 2023 04:18:51 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7mDgx4/rXl3EP8KFgYC8B1RJgfoSNPso3A7CQxIOB+JxEl7ZVWS4zkTAcsHrCwWAIPagrNdA==
X-Received: by 2002:a2e:888f:0:b0:2b4:85d1:e299 with SMTP id k15-20020a2e888f000000b002b485d1e299mr3885343lji.5.1687346331607;
        Wed, 21 Jun 2023 04:18:51 -0700 (PDT)
Received: from localhost.localdomain (c-e6a5e255.022-110-73746f36.bbcust.telenor.se. [85.226.165.230])
        by smtp.googlemail.com with ESMTPSA id 3-20020a05651c00c300b002b31ec01c97sm864436ljr.15.2023.06.21.04.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 04:18:51 -0700 (PDT)
From: Alexander Larsson <alexl@redhat.com>
To: miklos@szeredi.hu
Cc: linux-unionfs@vger.kernel.org,
	amir73il@gmail.com,
	ebiggers@kernel.org,
	tytso@mit.edu,
	fsverity@lists.linux.dev,
	Alexander Larsson <alexl@redhat.com>
Subject: [PATCH v4 4/4] ovl: Handle verity during copy-up
Date: Wed, 21 Jun 2023 13:18:28 +0200
Message-Id: <8771725be2a8b7d65ea6c50a69bb6392b9e903aa.1687345663.git.alexl@redhat.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <cover.1687345663.git.alexl@redhat.com>
References: <cover.1687345663.git.alexl@redhat.com>
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

During regular metacopy, if lowerdata file has fs-verity enabled, and
the verity option is enabled, we add the digest to the metacopy xattr.

If verity is required, and lowerdata does not have fs-verity enabled,
fall back to full copy-up (or the generated metacopy would not
validate).

Signed-off-by: Alexander Larsson <alexl@redhat.com>
---
 fs/overlayfs/copy_up.c   | 45 ++++++++++++++++++++++++++++++++++++++--
 fs/overlayfs/overlayfs.h |  3 +++
 fs/overlayfs/util.c      | 33 ++++++++++++++++++++++++++++-
 3 files changed, 78 insertions(+), 3 deletions(-)

diff --git a/fs/overlayfs/copy_up.c b/fs/overlayfs/copy_up.c
index 68f01fd7f211..fce7d048673c 100644
--- a/fs/overlayfs/copy_up.c
+++ b/fs/overlayfs/copy_up.c
@@ -544,6 +544,7 @@ struct ovl_copy_up_ctx {
 	bool origin;
 	bool indexed;
 	bool metacopy;
+	bool metacopy_digest;
 };
 
 static int ovl_link_up(struct ovl_copy_up_ctx *c)
@@ -641,8 +642,21 @@ static int ovl_copy_up_metadata(struct ovl_copy_up_ctx *c, struct dentry *temp)
 	}
 
 	if (c->metacopy) {
-		err = ovl_check_setxattr(ofs, temp, OVL_XATTR_METACOPY,
-					 NULL, 0, -EOPNOTSUPP);
+		struct path lowerdatapath;
+		struct ovl_metacopy metacopy_data = OVL_METACOPY_INIT;
+
+		ovl_path_lowerdata(c->dentry, &lowerdatapath);
+		if (WARN_ON_ONCE(lowerdatapath.dentry == NULL))
+			err = -EIO;
+		else
+			err = ovl_set_verity_xattr_from(ofs, &lowerdatapath, &metacopy_data);
+
+		if (metacopy_data.digest_algo)
+			c->metacopy_digest = true;
+
+		if (!err)
+			err = ovl_set_metacopy_xattr(ofs, temp, &metacopy_data);
+
 		if (err)
 			return err;
 	}
@@ -751,6 +765,12 @@ static int ovl_copy_up_workdir(struct ovl_copy_up_ctx *c)
 	if (err)
 		goto cleanup;
 
+	if (c->metacopy_digest)
+		ovl_set_flag(OVL_HAS_DIGEST, d_inode(c->dentry));
+	else
+		ovl_clear_flag(OVL_HAS_DIGEST, d_inode(c->dentry));
+	ovl_clear_flag(OVL_VERIFIED_DIGEST, d_inode(c->dentry));
+
 	if (!c->metacopy)
 		ovl_set_upperdata(d_inode(c->dentry));
 	inode = d_inode(c->dentry);
@@ -813,6 +833,12 @@ static int ovl_copy_up_tmpfile(struct ovl_copy_up_ctx *c)
 	if (err)
 		goto out_fput;
 
+	if (c->metacopy_digest)
+		ovl_set_flag(OVL_HAS_DIGEST, d_inode(c->dentry));
+	else
+		ovl_clear_flag(OVL_HAS_DIGEST, d_inode(c->dentry));
+	ovl_clear_flag(OVL_VERIFIED_DIGEST, d_inode(c->dentry));
+
 	if (!c->metacopy)
 		ovl_set_upperdata(d_inode(c->dentry));
 	ovl_inode_update(d_inode(c->dentry), dget(temp));
@@ -918,6 +944,19 @@ static bool ovl_need_meta_copy_up(struct dentry *dentry, umode_t mode,
 	if (flags && ((OPEN_FMODE(flags) & FMODE_WRITE) || (flags & O_TRUNC)))
 		return false;
 
+	/* Fall back to full copy if no fsverity on source data and we require verity */
+	if (ofs->config.verity_mode == OVL_VERITY_REQUIRE) {
+		struct path lowerdata;
+
+		ovl_path_lowerdata(dentry, &lowerdata);
+
+		if (WARN_ON_ONCE(lowerdata.dentry == NULL) ||
+		    ovl_ensure_verity_loaded(&lowerdata) ||
+		    !fsverity_get_info(d_inode(lowerdata.dentry))) {
+			return false;
+		}
+	}
+
 	return true;
 }
 
@@ -984,6 +1023,8 @@ static int ovl_copy_up_meta_inode_data(struct ovl_copy_up_ctx *c)
 	if (err)
 		goto out_free;
 
+	ovl_clear_flag(OVL_HAS_DIGEST, d_inode(c->dentry));
+	ovl_clear_flag(OVL_VERIFIED_DIGEST, d_inode(c->dentry));
 	ovl_set_upperdata(d_inode(c->dentry));
 out_free:
 	kfree(capability);
diff --git a/fs/overlayfs/overlayfs.h b/fs/overlayfs/overlayfs.h
index 9fbbc077643b..e728360c66ff 100644
--- a/fs/overlayfs/overlayfs.h
+++ b/fs/overlayfs/overlayfs.h
@@ -519,11 +519,14 @@ int ovl_set_metacopy_xattr(struct ovl_fs *ofs, struct dentry *d,
 			   struct ovl_metacopy *metacopy);
 bool ovl_is_metacopy_dentry(struct dentry *dentry);
 char *ovl_get_redirect_xattr(struct ovl_fs *ofs, const struct path *path, int padding);
+int ovl_ensure_verity_loaded(struct path *path);
 int ovl_get_verity_xattr(struct ovl_fs *ofs, const struct path *path,
 			 u8 *digest_buf, int *buf_length);
 int ovl_validate_verity(struct ovl_fs *ofs,
 			struct path *metapath,
 			struct path *datapath);
+int ovl_set_verity_xattr_from(struct ovl_fs *ofs, struct path *src,
+			      struct ovl_metacopy *metacopy);
 int ovl_sync_status(struct ovl_fs *ofs);
 
 static inline void ovl_set_flag(unsigned long flag, struct inode *inode)
diff --git a/fs/overlayfs/util.c b/fs/overlayfs/util.c
index 927a1133859d..439e23496713 100644
--- a/fs/overlayfs/util.c
+++ b/fs/overlayfs/util.c
@@ -1188,7 +1188,7 @@ char *ovl_get_redirect_xattr(struct ovl_fs *ofs, const struct path *path, int pa
 }
 
 /* Call with mounter creds as it may open the file */
-static int ovl_ensure_verity_loaded(struct path *datapath)
+int ovl_ensure_verity_loaded(struct path *datapath)
 {
 	struct inode *inode = d_inode(datapath->dentry);
 	const struct fsverity_info *vi;
@@ -1264,6 +1264,37 @@ int ovl_validate_verity(struct ovl_fs *ofs,
 	return 0;
 }
 
+int ovl_set_verity_xattr_from(struct ovl_fs *ofs, struct path *src,
+			      struct ovl_metacopy *metacopy)
+{
+	int err, digest_size;
+
+	if (!ofs->config.verity_mode || !S_ISREG(d_inode(src->dentry)->i_mode))
+		return 0;
+
+	err = ovl_ensure_verity_loaded(src);
+	if (err < 0) {
+		pr_warn_ratelimited("lower file '%pd' failed to load fs-verity info\n",
+				    src->dentry);
+		return -EIO;
+	}
+
+	digest_size = fsverity_get_digest(d_inode(src->dentry),
+					  metacopy->digest, &metacopy->digest_algo, NULL);
+	if (digest_size == 0 ||
+	    WARN_ON_ONCE(digest_size > FS_VERITY_MAX_DIGEST_SIZE)) {
+		if (ofs->config.verity_mode == OVL_VERITY_REQUIRE) {
+			pr_warn_ratelimited("lower file '%pd' has no fs-verity digest\n",
+					    src->dentry);
+			return -EIO;
+		}
+		return 0;
+	}
+
+	metacopy->len += digest_size;
+	return 0;
+}
+
 /*
  * ovl_sync_status() - Check fs sync status for volatile mounts
  *
-- 
2.40.1

