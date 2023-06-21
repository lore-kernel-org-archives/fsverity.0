Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B39DF5C
	for <fsverity@lists.linux.dev>; Wed, 21 Jun 2023 11:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687346338;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Rjo399+wcuyE2zVId1qURGU7w+RhUWmDcqipWvpFaXU=;
	b=SEP9TDO56KN7MMBni52aeIuzrg1ZpAoXs6GdlaORhmx9vdLT2OrdK+huncuBZ+s1uTiQob
	6y4rQxmbIKEdF1cejPm1BOOsi4HLZXtaviUAZyB3+RXIJclLpzHQkpwiGwjxYFkojxTegj
	vT5yMeGnJS6RRXgKjKcLHUxLwlmwuRA=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-526-nL5GOCR0MX2MnR8bW2tPhA-1; Wed, 21 Jun 2023 07:18:51 -0400
X-MC-Unique: nL5GOCR0MX2MnR8bW2tPhA-1
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-2b1d8fa4629so45130211fa.0
        for <fsverity@lists.linux.dev>; Wed, 21 Jun 2023 04:18:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687346330; x=1689938330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rjo399+wcuyE2zVId1qURGU7w+RhUWmDcqipWvpFaXU=;
        b=BLoTeD4yZ1/vypv7M/z//qcDH8JoeOxuj0YOuxUXRND7/JMQxOltRRFBOmkdxyI27K
         Z5RtH7j4KMTzVnxOnU9lyxSClGUHmDtak98tU6PSSEfNyY4iq9af56eALqE9/RvocTx/
         lt7/36kH1KxVfWy0jAqWWuyZNa070Ts9BYSGrY8AiXScF+VdOX2osoqOjDCcpP4IcybQ
         t/W3Qk47uBJcpfXSOi0FMjATdevX9HZaCIAlPwE1ADee9xrzkpXSVUA3AhHtA36MwVGM
         TNmSgoQ5P4YPQ4X2SzsOnbvogkG8q/VFnLxfQFzYcGaNjpsnR147aHV+WfNy9wjyYYMo
         o1Vw==
X-Gm-Message-State: AC+VfDxt/wfaKAJW3jcMGk1LakkD6rAeU/wgXUSZpDoPjzEgstQe9Uzm
	ZPuHX6LBY0zFcyCHbBHQ1j8sm1pjP5wBRta7Jxu40+ykGP5zyu4+NISmvYqhb2nvAhpbf7+e03v
	VSQlS2IkjMNC28O0hnDU=
X-Received: by 2002:a2e:8805:0:b0:2b5:7fea:b361 with SMTP id x5-20020a2e8805000000b002b57feab361mr2464192ljh.40.1687346329955;
        Wed, 21 Jun 2023 04:18:49 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4WCAYHA7FAlWXrEc4skfJmABBcHqB/G5vEsf7aHbox0fd6sL2lkE0d62IgOIEV+R2abbQ84g==
X-Received: by 2002:a2e:8805:0:b0:2b5:7fea:b361 with SMTP id x5-20020a2e8805000000b002b57feab361mr2464183ljh.40.1687346329578;
        Wed, 21 Jun 2023 04:18:49 -0700 (PDT)
Received: from localhost.localdomain (c-e6a5e255.022-110-73746f36.bbcust.telenor.se. [85.226.165.230])
        by smtp.googlemail.com with ESMTPSA id 3-20020a05651c00c300b002b31ec01c97sm864436ljr.15.2023.06.21.04.18.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 04:18:49 -0700 (PDT)
From: Alexander Larsson <alexl@redhat.com>
To: miklos@szeredi.hu
Cc: linux-unionfs@vger.kernel.org,
	amir73il@gmail.com,
	ebiggers@kernel.org,
	tytso@mit.edu,
	fsverity@lists.linux.dev,
	Alexander Larsson <alexl@redhat.com>
Subject: [PATCH v4 3/4] ovl: Validate verity xattr when resolving lowerdata
Date: Wed, 21 Jun 2023 13:18:27 +0200
Message-Id: <5dfdecee8f0260729c4a8e8150587f128a731ccb.1687345663.git.alexl@redhat.com>
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

The new digest field in the metacopy xattr is used during lookup to
record whether the header contained a digest in the OVL_HAS_DIGEST
flags.

When accessing file data the first time, if OVL_HAS_DIGEST is set, we
reload the metadata and check that the source lowerdata inode matches
the specified digest in it (according to the enabled verity
options). If the verity check passes we store this info in the inode
flags as OVL_VERIFIED_DIGEST, so that we can avoid doing it again if
the inode remains in memory.

The verification is done in ovl_maybe_validate_verity() which needs to
be called in the same places as ovl_maybe_lookup_lowerdata(), so there
is a new ovl_verify_lowerdata() helper that calls these in the right
order, and all current callers of ovl_maybe_lookup_lowerdata() are
changed to call it instead.

Signed-off-by: Alexander Larsson <alexl@redhat.com>
---
 fs/overlayfs/copy_up.c   |  2 +-
 fs/overlayfs/file.c      |  8 ++--
 fs/overlayfs/namei.c     | 72 +++++++++++++++++++++++++++++++-
 fs/overlayfs/overlayfs.h | 11 ++++-
 fs/overlayfs/super.c     |  5 ++-
 fs/overlayfs/util.c      | 90 ++++++++++++++++++++++++++++++++++++++++
 6 files changed, 180 insertions(+), 8 deletions(-)

diff --git a/fs/overlayfs/copy_up.c b/fs/overlayfs/copy_up.c
index 568f743a5584..68f01fd7f211 100644
--- a/fs/overlayfs/copy_up.c
+++ b/fs/overlayfs/copy_up.c
@@ -1078,7 +1078,7 @@ static int ovl_copy_up_flags(struct dentry *dentry, int flags)
 	 * not very important to optimize this case, so do lazy lowerdata lookup
 	 * before any copy up, so we can do it before taking ovl_inode_lock().
 	 */
-	err = ovl_maybe_lookup_lowerdata(dentry);
+	err = ovl_verify_lowerdata(dentry);
 	if (err)
 		return err;
 
diff --git a/fs/overlayfs/file.c b/fs/overlayfs/file.c
index cb53c84108fc..859a833c1035 100644
--- a/fs/overlayfs/file.c
+++ b/fs/overlayfs/file.c
@@ -115,8 +115,8 @@ static int ovl_real_fdget_meta(const struct file *file, struct fd *real,
 	if (allow_meta) {
 		ovl_path_real(dentry, &realpath);
 	} else {
-		/* lazy lookup of lowerdata */
-		err = ovl_maybe_lookup_lowerdata(dentry);
+		/* lazy lookup and verify of lowerdata */
+		err = ovl_verify_lowerdata(dentry);
 		if (err)
 			return err;
 
@@ -159,8 +159,8 @@ static int ovl_open(struct inode *inode, struct file *file)
 	struct path realpath;
 	int err;
 
-	/* lazy lookup of lowerdata */
-	err = ovl_maybe_lookup_lowerdata(dentry);
+	/* lazy lookup and verify lowerdata */
+	err = ovl_verify_lowerdata(dentry);
 	if (err)
 		return err;
 
diff --git a/fs/overlayfs/namei.c b/fs/overlayfs/namei.c
index 3dd480253710..d00ec43f2376 100644
--- a/fs/overlayfs/namei.c
+++ b/fs/overlayfs/namei.c
@@ -889,8 +889,58 @@ static int ovl_fix_origin(struct ovl_fs *ofs, struct dentry *dentry,
 	return err;
 }
 
+static int ovl_maybe_validate_verity(struct dentry *dentry)
+{
+	struct ovl_fs *ofs = dentry->d_sb->s_fs_info;
+	struct inode *inode = d_inode(dentry);
+	struct path datapath, metapath;
+	int err;
+
+	if (!ofs->config.verity_mode ||
+	    !ovl_is_metacopy_dentry(dentry) ||
+	    ovl_test_flag(OVL_VERIFIED_DIGEST, inode))
+		return 0;
+
+	if (!ovl_test_flag(OVL_HAS_DIGEST, inode)) {
+		if (ofs->config.verity_mode == OVL_VERITY_REQUIRE) {
+			pr_warn_ratelimited("metacopy file '%pd' has no digest specified\n",
+					    dentry);
+			return -EIO;
+		}
+		return 0;
+	}
+
+	ovl_path_lowerdata(dentry, &datapath);
+	if (!datapath.dentry)
+		return -EIO;
+
+	ovl_path_real(dentry, &metapath);
+	if (!metapath.dentry)
+		return -EIO;
+
+	err = ovl_inode_lock_interruptible(inode);
+	if (err)
+		return err;
+
+	if (!ovl_test_flag(OVL_VERIFIED_DIGEST, inode)) {
+		const struct cred *old_cred;
+
+		old_cred = ovl_override_creds(dentry->d_sb);
+
+		err = ovl_validate_verity(ofs, &metapath, &datapath);
+		if (err == 0)
+			ovl_set_flag(OVL_VERIFIED_DIGEST, inode);
+
+		revert_creds(old_cred);
+	}
+
+	ovl_inode_unlock(inode);
+
+	return err;
+}
+
 /* Lazy lookup of lowerdata */
-int ovl_maybe_lookup_lowerdata(struct dentry *dentry)
+static int ovl_maybe_lookup_lowerdata(struct dentry *dentry)
 {
 	struct inode *inode = d_inode(dentry);
 	const char *redirect = ovl_lowerdata_redirect(inode);
@@ -935,6 +985,17 @@ int ovl_maybe_lookup_lowerdata(struct dentry *dentry)
 	goto out;
 }
 
+int ovl_verify_lowerdata(struct dentry *dentry)
+{
+	int err;
+
+	err = ovl_maybe_lookup_lowerdata(dentry);
+	if (err)
+		return err;
+
+	return ovl_maybe_validate_verity(dentry);
+}
+
 struct dentry *ovl_lookup(struct inode *dir, struct dentry *dentry,
 			  unsigned int flags)
 {
@@ -955,6 +1016,7 @@ struct dentry *ovl_lookup(struct inode *dir, struct dentry *dentry,
 	unsigned int i;
 	int err;
 	bool uppermetacopy = false;
+	int metacopy_size = 0;
 	struct ovl_lookup_data d = {
 		.sb = dentry->d_sb,
 		.name = dentry->d_name,
@@ -999,6 +1061,7 @@ struct dentry *ovl_lookup(struct inode *dir, struct dentry *dentry,
 
 			if (d.metacopy)
 				uppermetacopy = true;
+			metacopy_size = d.metacopy;
 		}
 
 		if (d.redirect) {
@@ -1076,6 +1139,9 @@ struct dentry *ovl_lookup(struct inode *dir, struct dentry *dentry,
 			origin = this;
 		}
 
+		if (!upperdentry && !d.is_dir && !ctr && d.metacopy)
+			metacopy_size = d.metacopy;
+
 		if (d.metacopy && ctr) {
 			/*
 			 * Do not store intermediate metacopy dentries in
@@ -1215,6 +1281,7 @@ struct dentry *ovl_lookup(struct inode *dir, struct dentry *dentry,
 		if (err < 0)
 			goto out_free_oe;
 		uppermetacopy = err;
+		metacopy_size = err;
 	}
 
 	if (upperdentry || ctr) {
@@ -1236,6 +1303,9 @@ struct dentry *ovl_lookup(struct inode *dir, struct dentry *dentry,
 			goto out_free_oe;
 		if (upperdentry && !uppermetacopy)
 			ovl_set_flag(OVL_UPPERDATA, inode);
+
+		if (metacopy_size > OVL_METACOPY_MIN_SIZE)
+			ovl_set_flag(OVL_HAS_DIGEST, inode);
 	}
 
 	ovl_dentry_init_reval(dentry, upperdentry, OVL_I_E(inode));
diff --git a/fs/overlayfs/overlayfs.h b/fs/overlayfs/overlayfs.h
index 6d4e08df0dfe..9fbbc077643b 100644
--- a/fs/overlayfs/overlayfs.h
+++ b/fs/overlayfs/overlayfs.h
@@ -50,6 +50,8 @@ enum ovl_inode_flag {
 	OVL_UPPERDATA,
 	/* Inode number will remain constant over copy up. */
 	OVL_CONST_INO,
+	OVL_HAS_DIGEST,
+	OVL_VERIFIED_DIGEST,
 };
 
 enum ovl_entry_flag {
@@ -513,8 +515,15 @@ void ovl_nlink_end(struct dentry *dentry);
 int ovl_lock_rename_workdir(struct dentry *workdir, struct dentry *upperdir);
 int ovl_check_metacopy_xattr(struct ovl_fs *ofs, const struct path *path,
 			     struct ovl_metacopy *data);
+int ovl_set_metacopy_xattr(struct ovl_fs *ofs, struct dentry *d,
+			   struct ovl_metacopy *metacopy);
 bool ovl_is_metacopy_dentry(struct dentry *dentry);
 char *ovl_get_redirect_xattr(struct ovl_fs *ofs, const struct path *path, int padding);
+int ovl_get_verity_xattr(struct ovl_fs *ofs, const struct path *path,
+			 u8 *digest_buf, int *buf_length);
+int ovl_validate_verity(struct ovl_fs *ofs,
+			struct path *metapath,
+			struct path *datapath);
 int ovl_sync_status(struct ovl_fs *ofs);
 
 static inline void ovl_set_flag(unsigned long flag, struct inode *inode)
@@ -634,7 +643,7 @@ struct dentry *ovl_get_index_fh(struct ovl_fs *ofs, struct ovl_fh *fh);
 struct dentry *ovl_lookup_index(struct ovl_fs *ofs, struct dentry *upper,
 				struct dentry *origin, bool verify);
 int ovl_path_next(int idx, struct dentry *dentry, struct path *path);
-int ovl_maybe_lookup_lowerdata(struct dentry *dentry);
+int ovl_verify_lowerdata(struct dentry *dentry);
 struct dentry *ovl_lookup(struct inode *dir, struct dentry *dentry,
 			  unsigned int flags);
 bool ovl_lower_positive(struct dentry *dentry);
diff --git a/fs/overlayfs/super.c b/fs/overlayfs/super.c
index a4eb9abd4b52..457a5bc439cb 100644
--- a/fs/overlayfs/super.c
+++ b/fs/overlayfs/super.c
@@ -63,6 +63,7 @@ static struct dentry *ovl_d_real(struct dentry *dentry,
 				 const struct inode *inode)
 {
 	struct dentry *real = NULL, *lower;
+	int err;
 
 	/* It's an overlay file */
 	if (inode && d_inode(dentry) == inode)
@@ -89,7 +90,9 @@ static struct dentry *ovl_d_real(struct dentry *dentry,
 	 * uprobes on offset within the file, so lowerdata should be available
 	 * when setting the uprobe.
 	 */
-	ovl_maybe_lookup_lowerdata(dentry);
+	err = ovl_verify_lowerdata(dentry);
+	if (err)
+		goto bug;
 	lower = ovl_dentry_lowerdata(dentry);
 	if (!lower)
 		goto bug;
diff --git a/fs/overlayfs/util.c b/fs/overlayfs/util.c
index 921747223991..927a1133859d 100644
--- a/fs/overlayfs/util.c
+++ b/fs/overlayfs/util.c
@@ -10,6 +10,7 @@
 #include <linux/cred.h>
 #include <linux/xattr.h>
 #include <linux/exportfs.h>
+#include <linux/file.h>
 #include <linux/fileattr.h>
 #include <linux/uuid.h>
 #include <linux/namei.h>
@@ -1112,6 +1113,18 @@ int ovl_check_metacopy_xattr(struct ovl_fs *ofs, const struct path *path,
 	return res;
 }
 
+int ovl_set_metacopy_xattr(struct ovl_fs *ofs, struct dentry *d, struct ovl_metacopy *metacopy)
+{
+	size_t len = metacopy->len;
+
+	/* If no flags or digest fall back to empty metacopy file */
+	if (metacopy->version == 0 && metacopy->flags == 0 && metacopy->digest_algo == 0)
+		len = 0;
+
+	return ovl_check_setxattr(ofs, d, OVL_XATTR_METACOPY,
+				  metacopy, len, -EOPNOTSUPP);
+}
+
 bool ovl_is_metacopy_dentry(struct dentry *dentry)
 {
 	struct ovl_entry *oe = OVL_E(dentry);
@@ -1174,6 +1187,83 @@ char *ovl_get_redirect_xattr(struct ovl_fs *ofs, const struct path *path, int pa
 	return ERR_PTR(res);
 }
 
+/* Call with mounter creds as it may open the file */
+static int ovl_ensure_verity_loaded(struct path *datapath)
+{
+	struct inode *inode = d_inode(datapath->dentry);
+	const struct fsverity_info *vi;
+	struct file *filp;
+
+	vi = fsverity_get_info(inode);
+	if (vi == NULL && IS_VERITY(inode)) {
+		/*
+		 * If this inode was not yet opened, the verity info hasn't been
+		 * loaded yet, so we need to do that here to force it into memory.
+		 */
+		filp = kernel_file_open(datapath, O_RDONLY, inode, current_cred());
+		if (IS_ERR(filp))
+			return PTR_ERR(filp);
+		fput(filp);
+	}
+
+	return 0;
+}
+
+int ovl_validate_verity(struct ovl_fs *ofs,
+			struct path *metapath,
+			struct path *datapath)
+{
+	struct ovl_metacopy metacopy_data;
+	u8 actual_digest[FS_VERITY_MAX_DIGEST_SIZE];
+	int xattr_digest_size, digest_size;
+	int xattr_size, err;
+	u8 verity_algo;
+
+	if (!ofs->config.verity_mode ||
+	    /* Verity only works on regular files */
+	    !S_ISREG(d_inode(metapath->dentry)->i_mode))
+		return 0;
+
+	xattr_size = ovl_check_metacopy_xattr(ofs, metapath, &metacopy_data);
+	if (xattr_size < 0)
+		return xattr_size;
+
+	if (!xattr_size || !metacopy_data.digest_algo) {
+		if (ofs->config.verity_mode == OVL_VERITY_REQUIRE) {
+			pr_warn_ratelimited("metacopy file '%pd' has no digest specified\n",
+					    metapath->dentry);
+			return -EIO;
+		}
+		return 0;
+	}
+
+	xattr_digest_size = ovl_metadata_digest_size(&metacopy_data);
+
+	err = ovl_ensure_verity_loaded(datapath);
+	if (err < 0) {
+		pr_warn_ratelimited("lower file '%pd' failed to load fs-verity info\n",
+				    datapath->dentry);
+		return -EIO;
+	}
+
+	digest_size = fsverity_get_digest(d_inode(datapath->dentry), actual_digest,
+					  &verity_algo, NULL);
+	if (digest_size == 0) {
+		pr_warn_ratelimited("lower file '%pd' has no fs-verity digest\n", datapath->dentry);
+		return -EIO;
+	}
+
+	if (xattr_digest_size != digest_size ||
+	    metacopy_data.digest_algo != verity_algo ||
+	    memcmp(metacopy_data.digest, actual_digest, xattr_digest_size) != 0) {
+		pr_warn_ratelimited("lower file '%pd' has the wrong fs-verity digest\n",
+				    datapath->dentry);
+		return -EIO;
+	}
+
+	return 0;
+}
+
 /*
  * ovl_sync_status() - Check fs sync status for volatile mounts
  *
-- 
2.40.1

