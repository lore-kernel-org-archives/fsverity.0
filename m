Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8511D28F6
	for <fsverity@lists.linux.dev>; Thu, 20 Apr 2023 07:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681976675;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E2xTK88Z6XTpdAEx50kafuB7rE4J/sxtqM1IkieGlfw=;
	b=KI8D71e4PVNrzQp9qzDteF5b29KO2pgLwOYlgF0UWg73yrZtmWBjHmthpFx8mK9RZnST2G
	jT5JoOXBZh7IafXQumSFBZgO5HaKKkpYPwCMKaEIx4pHXhVEJnMaklxexlGkDQaODA5zcK
	FRcU0sUQhKfNPtj2aHVt/L3fRogTvKw=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-435-wld4c1P9PSG4Kx8G_f_O4Q-1; Thu, 20 Apr 2023 03:44:34 -0400
X-MC-Unique: wld4c1P9PSG4Kx8G_f_O4Q-1
Received: by mail-lj1-f199.google.com with SMTP id 38308e7fff4ca-2a8c3314d18so1847291fa.0
        for <fsverity@lists.linux.dev>; Thu, 20 Apr 2023 00:44:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681976673; x=1684568673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E2xTK88Z6XTpdAEx50kafuB7rE4J/sxtqM1IkieGlfw=;
        b=FhmmQEVcgPOg1PCeh7w/NH6u3FrluGr/ln+7QDazYH+T+WV9266eRtOe399Km8fWE3
         dcMw4TFv7570usMUxBlO16qPPE1arvpevAob1eRc3SbKMeV4sVW6vBlDA91HMPrwb8nW
         gRTyZOi0lWK0Z9VeuunOpm1xnL+MqjkMyWef423PUmBWtaBvg84ZWgThpnI8y+jw4YJP
         QjO+vWQ7YTVVD+/oPScHmx36yIZyorMrmYluztsWGYRS64VmgEhEk/lvpdfb0sL07JBW
         52G1nGBE4WK22d6v2oQvYs9r8QZt17XJ+opyUtHmwWpthBFT92twEEktcMFCngOk89Oo
         NdfQ==
X-Gm-Message-State: AAQBX9ewFlO8968zYIqzFetTXJ0lG9QnjL1w2UVoH8vEoyaPKxz24K6E
	PTNHL5owWNe3FPBPssMgk/mmRasJ/F+TEE5tH36zeecDSsc3AJBHl5qp5R1SsGQPphhtlI8yslS
	xyxYCKFmoRwGneLKnwINwJ7L1/ug=
X-Received: by 2002:a19:f509:0:b0:4dd:a73f:aede with SMTP id j9-20020a19f509000000b004dda73faedemr139248lfb.10.1681976672868;
        Thu, 20 Apr 2023 00:44:32 -0700 (PDT)
X-Google-Smtp-Source: AKy350Y9ARdyDjdxb9LqyeSwaHAPLrEwd3ZgL8W5BEEdPze3C9+6pDwSAyTrQ8UhxxXbRtZlIkLsew==
X-Received: by 2002:a19:f509:0:b0:4dd:a73f:aede with SMTP id j9-20020a19f509000000b004dda73faedemr139238lfb.10.1681976672689;
        Thu, 20 Apr 2023 00:44:32 -0700 (PDT)
Received: from localhost.localdomain (c-e6a5e255.022-110-73746f36.bbcust.telenor.se. [85.226.165.230])
        by smtp.googlemail.com with ESMTPSA id x24-20020ac24898000000b004edc7247778sm129468lfc.79.2023.04.20.00.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Apr 2023 00:44:32 -0700 (PDT)
From: Alexander Larsson <alexl@redhat.com>
To: miklos@szeredi.hu
Cc: linux-unionfs@vger.kernel.org,
	amir73il@gmail.com,
	ebiggers@kernel.org,
	tytso@mit.edu,
	fsverity@lists.linux.dev,
	Alexander Larsson <alexl@redhat.com>
Subject: [PATCH 5/6] ovl: Validate verity xattr when resolving lowerdata
Date: Thu, 20 Apr 2023 09:44:04 +0200
Message-Id: <df41e9dc96ddad9f9e1e684e39c28f4e097e9d9b.1681917551.git.alexl@redhat.com>
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

When resolving lowerdata (lazily or non-lazily) we chech the
overlay.verity xattr on the metadata inode, and if set verify that the
source lowerdata inode matches it (according to the verity options
enabled).

Signed-off-by: Alexander Larsson <alexl@redhat.com>
---
 fs/overlayfs/namei.c     | 34 ++++++++++++++
 fs/overlayfs/overlayfs.h |  6 +++
 fs/overlayfs/util.c      | 97 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 137 insertions(+)

diff --git a/fs/overlayfs/namei.c b/fs/overlayfs/namei.c
index ba2b156162ca..49f3715c582d 100644
--- a/fs/overlayfs/namei.c
+++ b/fs/overlayfs/namei.c
@@ -892,6 +892,7 @@ static int ovl_fix_origin(struct ovl_fs *ofs, struct dentry *dentry,
 /* Lazy lookup of lowerdata */
 int ovl_maybe_lookup_lowerdata(struct dentry *dentry)
 {
+	struct ovl_fs *ofs = dentry->d_sb->s_fs_info;
 	struct inode *inode = d_inode(dentry);
 	const char *redirect = ovl_lowerdata_redirect(inode);
 	struct ovl_path datapath = {};
@@ -919,6 +920,21 @@ int ovl_maybe_lookup_lowerdata(struct dentry *dentry)
 	if (err)
 		goto out_err;
 
+	if (ofs->config.verity_validate) {
+		struct path data = { .mnt = datapath.layer->mnt, .dentry = datapath.dentry, };
+		struct path metapath = {};
+
+		ovl_path_real(dentry, &metapath);
+		if (!metapath.dentry) {
+			err = -EIO;
+			goto out_err;
+		}
+
+		err = ovl_validate_verity(ofs, &metapath, &data);
+		if (err)
+			goto out_err;
+	}
+
 	err = ovl_dentry_set_lowerdata(dentry, &datapath);
 	if (err)
 		goto out_err;
@@ -1186,6 +1202,24 @@ struct dentry *ovl_lookup(struct inode *dir, struct dentry *dentry,
 	if (err)
 		goto out_put;
 
+	/* Validate verity of lower-data */
+	if (ofs->config.verity_validate &&
+	    !d.is_dir && (uppermetacopy || ctr > 1)) {
+		struct path datapath;
+
+		ovl_entry_path_lowerdata(&oe, &datapath);
+
+		/* Is NULL for lazy lookup, will be verified later */
+		if (datapath.dentry) {
+			struct path metapath;
+
+			ovl_entry_path_real(ofs, &oe, upperdentry, &metapath);
+			err = ovl_validate_verity(ofs, &metapath, &datapath);
+			if (err < 0)
+				goto out_free_oe;
+		}
+	}
+
 	if (upperopaque)
 		ovl_dentry_set_opaque(dentry);
 
diff --git a/fs/overlayfs/overlayfs.h b/fs/overlayfs/overlayfs.h
index 3d14770dc711..b1d639ccd5ac 100644
--- a/fs/overlayfs/overlayfs.h
+++ b/fs/overlayfs/overlayfs.h
@@ -38,6 +38,7 @@ enum ovl_xattr {
 	OVL_XATTR_UPPER,
 	OVL_XATTR_METACOPY,
 	OVL_XATTR_PROTATTR,
+	OVL_XATTR_VERITY,
 };
 
 enum ovl_inode_flag {
@@ -467,6 +468,11 @@ int ovl_lock_rename_workdir(struct dentry *workdir, struct dentry *upperdir);
 int ovl_check_metacopy_xattr(struct ovl_fs *ofs, const struct path *path);
 bool ovl_is_metacopy_dentry(struct dentry *dentry);
 char *ovl_get_redirect_xattr(struct ovl_fs *ofs, const struct path *path, int padding);
+int ovl_get_verity_xattr(struct ovl_fs *ofs, const struct path *path,
+			 u8 *digest_buf, int *buf_length);
+int ovl_validate_verity(struct ovl_fs *ofs,
+			struct path *metapath,
+			struct path *datapath);
 int ovl_sync_status(struct ovl_fs *ofs);
 
 static inline void ovl_set_flag(unsigned long flag, struct inode *inode)
diff --git a/fs/overlayfs/util.c b/fs/overlayfs/util.c
index 17eff3e31239..55e90aa0978a 100644
--- a/fs/overlayfs/util.c
+++ b/fs/overlayfs/util.c
@@ -10,7 +10,9 @@
 #include <linux/cred.h>
 #include <linux/xattr.h>
 #include <linux/exportfs.h>
+#include <linux/file.h>
 #include <linux/fileattr.h>
+#include <linux/fsverity.h>
 #include <linux/uuid.h>
 #include <linux/namei.h>
 #include <linux/ratelimit.h>
@@ -742,6 +744,7 @@ bool ovl_path_check_dir_xattr(struct ovl_fs *ofs, const struct path *path,
 #define OVL_XATTR_UPPER_POSTFIX		"upper"
 #define OVL_XATTR_METACOPY_POSTFIX	"metacopy"
 #define OVL_XATTR_PROTATTR_POSTFIX	"protattr"
+#define OVL_XATTR_VERITY_POSTFIX	"verity"
 
 #define OVL_XATTR_TAB_ENTRY(x) \
 	[x] = { [false] = OVL_XATTR_TRUSTED_PREFIX x ## _POSTFIX, \
@@ -756,6 +759,7 @@ const char *const ovl_xattr_table[][2] = {
 	OVL_XATTR_TAB_ENTRY(OVL_XATTR_UPPER),
 	OVL_XATTR_TAB_ENTRY(OVL_XATTR_METACOPY),
 	OVL_XATTR_TAB_ENTRY(OVL_XATTR_PROTATTR),
+	OVL_XATTR_TAB_ENTRY(OVL_XATTR_VERITY),
 };
 
 int ovl_check_setxattr(struct ovl_fs *ofs, struct dentry *upperdentry,
@@ -1188,6 +1192,99 @@ char *ovl_get_redirect_xattr(struct ovl_fs *ofs, const struct path *path, int pa
 	return ERR_PTR(res);
 }
 
+int ovl_get_verity_xattr(struct ovl_fs *ofs, const struct path *path,
+			 u8 *digest_buf, int *buf_length)
+{
+	int res;
+
+	res = ovl_path_getxattr(ofs, path, OVL_XATTR_VERITY, digest_buf, *buf_length);
+	if (res == -ENODATA || res == -EOPNOTSUPP)
+		return -ENODATA;
+	if (res < 0) {
+		pr_warn_ratelimited("failed to get digest (%i)\n", res);
+		return res;
+	}
+
+	*buf_length = res;
+	return 0;
+}
+
+static int ovl_ensure_verity_loaded(struct ovl_fs *ofs,
+				    struct path *datapath)
+{
+	struct inode *inode = d_inode(datapath->dentry);
+	const struct fsverity_info *vi;
+	const struct cred *old_cred;
+	struct file *filp;
+
+	vi = fsverity_get_info(inode);
+	if (vi == NULL && IS_VERITY(inode)) {
+		/*
+		 * If this inode was not yet opened, the verity info hasn't been
+		 * loaded yet, so we need to do that here to force it into memory.
+		 */
+		old_cred = override_creds(ofs->creator_cred);
+		filp = dentry_open(datapath, O_RDONLY, current_cred());
+		revert_creds(old_cred);
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
+	u8 required_digest[FS_VERITY_MAX_DIGEST_SIZE];
+	u8 actual_digest[FS_VERITY_MAX_DIGEST_SIZE];
+	enum hash_algo verity_algo;
+	int digest_len;
+	int err;
+
+	if (!ofs->config.verity_validate ||
+	    /* Verity only works on regular files */
+	    !S_ISREG(d_inode(metapath->dentry)->i_mode))
+		return 0;
+
+	digest_len = sizeof(required_digest);
+	err = ovl_get_verity_xattr(ofs, metapath, required_digest, &digest_len);
+	if (err == -ENODATA) {
+		if (ofs->config.verity_require) {
+			pr_warn_ratelimited("metacopy file '%pd' has no overlay.verity xattr\n",
+					    metapath->dentry);
+			return -EIO;
+		}
+		return 0;
+	}
+	if (err < 0)
+		return err;
+
+	err = ovl_ensure_verity_loaded(ofs, datapath);
+	if (err < 0) {
+		pr_warn_ratelimited("lower file '%pd' failed to load fs-verity info\n",
+				    datapath->dentry);
+		return -EIO;
+	}
+
+	err = fsverity_get_digest(d_inode(datapath->dentry), actual_digest, &verity_algo);
+	if (err < 0) {
+		pr_warn_ratelimited("lower file '%pd' has no fs-verity digest\n", datapath->dentry);
+		return -EIO;
+	}
+
+	if (digest_len != hash_digest_size[verity_algo] ||
+	    memcmp(required_digest, actual_digest, digest_len) != 0) {
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
2.39.2

