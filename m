Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C23FC0E
	for <fsverity@lists.linux.dev>; Wed, 21 Jun 2023 11:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687346331;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=baEB8SFr5XmkqSog/87DNGoOof8ryDCan+YiIoUGM/Q=;
	b=cfWSwyOmxlH7C/5kUzTzelyFb5g8pfG1DstcGi7GC8sx91PL1pdmwlGV8vh58/tbjBL628
	DzpucFFSPUogibAac2vZ8uvqTPx/hoqPZzVlvzGWhZqr5n5pYE4fyjhfxlfwAwBoLe5nxd
	SIsqv/d94S9ZN1AwEPH9y70gqB8iL+o=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-456-WT0gYUgzM_Kw8oeGzOIAcg-1; Wed, 21 Jun 2023 07:18:49 -0400
X-MC-Unique: WT0gYUgzM_Kw8oeGzOIAcg-1
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-4edc7406cbaso4501376e87.2
        for <fsverity@lists.linux.dev>; Wed, 21 Jun 2023 04:18:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687346328; x=1689938328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=baEB8SFr5XmkqSog/87DNGoOof8ryDCan+YiIoUGM/Q=;
        b=hxl5L278ukKwDmYkjCHZQtNukk5KBpdJ4+hL2Q3CbcVs/4FqqzG6K3Kq/uBO0a0vBl
         ANJSpgcXRF/28R7rUbu4xNTUzA9Mi8jysIEGQA0cj93zIzIccBWsEYmm1nXMysvthMGr
         0EtL/Heu5P96zE3jQd2kijAN9XY2AnM41ifbAA5JjXa1lN/H7BQ6krctLgSMFZb48hL8
         3PZDhq99vMVwKmJ5xf/f1mWuf6RIs/qldeM0DTcbTg80DtPA9Gz+5ZVisOwpLfXljTGU
         LwhdTK7RUgZRss1vxAYvVfvMZiA9jCFfnC2EoUSEVw2zkABVUhmxvxRxZsptpP67w8xp
         12AA==
X-Gm-Message-State: AC+VfDyoZY0L6RKOPhtBzzatKSyyp/cD7weA+Z0C8YOx0Av8disbfdi/
	0WSCJOZ7/EVa7U1fu0rEekk5WdN5T6nv2b+g6Is0Fl+a6efsFdnxuxdA25J/QQSJ0TfPEggP0QQ
	zck05IDMJqZelIprqabw=
X-Received: by 2002:a2e:95c4:0:b0:2b4:6a20:f12d with SMTP id y4-20020a2e95c4000000b002b46a20f12dmr7851552ljh.43.1687346328165;
        Wed, 21 Jun 2023 04:18:48 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5MN8FKocPJuJbfQI7I14mRobJ/26QLR1UZUG/uuIlZQ36wK95bo08ig3IUW2Cib9RymMfe6g==
X-Received: by 2002:a2e:95c4:0:b0:2b4:6a20:f12d with SMTP id y4-20020a2e95c4000000b002b46a20f12dmr7851537ljh.43.1687346327936;
        Wed, 21 Jun 2023 04:18:47 -0700 (PDT)
Received: from localhost.localdomain (c-e6a5e255.022-110-73746f36.bbcust.telenor.se. [85.226.165.230])
        by smtp.googlemail.com with ESMTPSA id 3-20020a05651c00c300b002b31ec01c97sm864436ljr.15.2023.06.21.04.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 04:18:47 -0700 (PDT)
From: Alexander Larsson <alexl@redhat.com>
To: miklos@szeredi.hu
Cc: linux-unionfs@vger.kernel.org,
	amir73il@gmail.com,
	ebiggers@kernel.org,
	tytso@mit.edu,
	fsverity@lists.linux.dev,
	Alexander Larsson <alexl@redhat.com>
Subject: [PATCH v4 2/4] ovl: Add versioned header for overlay.metacopy xattr
Date: Wed, 21 Jun 2023 13:18:26 +0200
Message-Id: <b7a2dfb80e35dda04edd942ad715dc88b784c218.1687345663.git.alexl@redhat.com>
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

Historically overlay.metacopy was a zero-size xattr, and it's
existence marked a metacopy file. This change adds a versioned header
with a flag field, a length and a digest. The initial use-case of this
will be for validating a fs-verity digest, but the flags field could
also be used later for other new features.

ovl_check_metacopy_xattr() now returns the size of the xattr,
emulating a size of OVL_METACOPY_MIN_SIZE for empty xattrs to
distinguish it from the no-xattr case.

Signed-off-by: Alexander Larsson <alexl@redhat.com>
---
 fs/overlayfs/namei.c     | 10 +++++-----
 fs/overlayfs/overlayfs.h | 24 +++++++++++++++++++++++-
 fs/overlayfs/util.c      | 37 +++++++++++++++++++++++++++++++++----
 3 files changed, 61 insertions(+), 10 deletions(-)

diff --git a/fs/overlayfs/namei.c b/fs/overlayfs/namei.c
index 57adf911735f..3dd480253710 100644
--- a/fs/overlayfs/namei.c
+++ b/fs/overlayfs/namei.c
@@ -25,7 +25,7 @@ struct ovl_lookup_data {
 	bool stop;
 	bool last;
 	char *redirect;
-	bool metacopy;
+	int metacopy;
 	/* Referring to last redirect xattr */
 	bool absolute_redirect;
 };
@@ -270,7 +270,7 @@ static int ovl_lookup_single(struct dentry *base, struct ovl_lookup_data *d,
 			d->stop = true;
 			goto put_and_out;
 		}
-		err = ovl_check_metacopy_xattr(OVL_FS(d->sb), &path);
+		err = ovl_check_metacopy_xattr(OVL_FS(d->sb), &path, NULL);
 		if (err < 0)
 			goto out_err;
 
@@ -963,7 +963,7 @@ struct dentry *ovl_lookup(struct inode *dir, struct dentry *dentry,
 		.stop = false,
 		.last = ovl_redirect_follow(ofs) ? false : !ovl_numlower(poe),
 		.redirect = NULL,
-		.metacopy = false,
+		.metacopy = 0,
 	};
 
 	if (dentry->d_name.len > ofs->namelen)
@@ -1120,7 +1120,7 @@ struct dentry *ovl_lookup(struct inode *dir, struct dentry *dentry,
 
 	/* Defer lookup of lowerdata in data-only layers to first access */
 	if (d.metacopy && ctr && ofs->numdatalayer && d.absolute_redirect) {
-		d.metacopy = false;
+		d.metacopy = 0;
 		ctr++;
 	}
 
@@ -1211,7 +1211,7 @@ struct dentry *ovl_lookup(struct inode *dir, struct dentry *dentry,
 			upperredirect = NULL;
 			goto out_free_oe;
 		}
-		err = ovl_check_metacopy_xattr(ofs, &upperpath);
+		err = ovl_check_metacopy_xattr(ofs, &upperpath, NULL);
 		if (err < 0)
 			goto out_free_oe;
 		uppermetacopy = err;
diff --git a/fs/overlayfs/overlayfs.h b/fs/overlayfs/overlayfs.h
index cf92a9aaf934..6d4e08df0dfe 100644
--- a/fs/overlayfs/overlayfs.h
+++ b/fs/overlayfs/overlayfs.h
@@ -7,6 +7,7 @@
 #include <linux/kernel.h>
 #include <linux/uuid.h>
 #include <linux/fs.h>
+#include <linux/fsverity.h>
 #include <linux/namei.h>
 #include <linux/posix_acl.h>
 #include <linux/posix_acl_xattr.h>
@@ -140,6 +141,26 @@ struct ovl_fh {
 #define OVL_FH_FID_OFFSET	(OVL_FH_WIRE_OFFSET + \
 				 offsetof(struct ovl_fb, fid))
 
+/* On-disk format for "metacopy" xattr (if non-zero size) */
+struct ovl_metacopy {
+	u8 version;	/* 0 */
+	u8 len;         /* size of this header + used digest bytes */
+	u8 flags;
+	u8 digest_algo;	/* FS_VERITY_HASH_ALG_* constant, 0 for no digest */
+	u8 digest[FS_VERITY_MAX_DIGEST_SIZE];  /* Only the used part on disk */
+} __packed;
+
+#define OVL_METACOPY_MAX_SIZE (sizeof(struct ovl_metacopy))
+#define OVL_METACOPY_MIN_SIZE (OVL_METACOPY_MAX_SIZE - FS_VERITY_MAX_DIGEST_SIZE)
+#define OVL_METACOPY_INIT { 0, OVL_METACOPY_MIN_SIZE }
+
+static inline int ovl_metadata_digest_size(const struct ovl_metacopy *metacopy)
+{
+	if (metacopy->len < OVL_METACOPY_MIN_SIZE)
+		return 0;
+	return (int)metacopy->len - OVL_METACOPY_MIN_SIZE;
+}
+
 extern const char *const ovl_xattr_table[][2];
 static inline const char *ovl_xattr(struct ovl_fs *ofs, enum ovl_xattr ox)
 {
@@ -490,7 +511,8 @@ bool ovl_need_index(struct dentry *dentry);
 int ovl_nlink_start(struct dentry *dentry);
 void ovl_nlink_end(struct dentry *dentry);
 int ovl_lock_rename_workdir(struct dentry *workdir, struct dentry *upperdir);
-int ovl_check_metacopy_xattr(struct ovl_fs *ofs, const struct path *path);
+int ovl_check_metacopy_xattr(struct ovl_fs *ofs, const struct path *path,
+			     struct ovl_metacopy *data);
 bool ovl_is_metacopy_dentry(struct dentry *dentry);
 char *ovl_get_redirect_xattr(struct ovl_fs *ofs, const struct path *path, int padding);
 int ovl_sync_status(struct ovl_fs *ofs);
diff --git a/fs/overlayfs/util.c b/fs/overlayfs/util.c
index 7ef9e13c404a..921747223991 100644
--- a/fs/overlayfs/util.c
+++ b/fs/overlayfs/util.c
@@ -1054,8 +1054,12 @@ int ovl_lock_rename_workdir(struct dentry *workdir, struct dentry *upperdir)
 	return -EIO;
 }
 
-/* err < 0, 0 if no metacopy xattr, 1 if metacopy xattr found */
-int ovl_check_metacopy_xattr(struct ovl_fs *ofs, const struct path *path)
+/*
+ * err < 0, 0 if no metacopy xattr, metacopy data size if xattr found.
+ * an empty xattr returns OVL_METACOPY_MIN_SIZE to distinguish from no xattr value.
+ */
+int ovl_check_metacopy_xattr(struct ovl_fs *ofs, const struct path *path,
+			     struct ovl_metacopy *data)
 {
 	int res;
 
@@ -1063,7 +1067,8 @@ int ovl_check_metacopy_xattr(struct ovl_fs *ofs, const struct path *path)
 	if (!S_ISREG(d_inode(path->dentry)->i_mode))
 		return 0;
 
-	res = ovl_path_getxattr(ofs, path, OVL_XATTR_METACOPY, NULL, 0);
+	res = ovl_path_getxattr(ofs, path, OVL_XATTR_METACOPY,
+				data, data ? OVL_METACOPY_MAX_SIZE : 0);
 	if (res < 0) {
 		if (res == -ENODATA || res == -EOPNOTSUPP)
 			return 0;
@@ -1077,7 +1082,31 @@ int ovl_check_metacopy_xattr(struct ovl_fs *ofs, const struct path *path)
 		goto out;
 	}
 
-	return 1;
+	if (res == 0) {
+		/* Emulate empty data for zero size metacopy xattr */
+		res = OVL_METACOPY_MIN_SIZE;
+		if (data) {
+			memset(data, 0, res);
+			data->len = res;
+		}
+	} else if (res < OVL_METACOPY_MIN_SIZE) {
+		pr_warn_ratelimited("metacopy file '%pd' has too small xattr\n",
+				    path->dentry);
+		return -EIO;
+	} else if (data) {
+		if (data->version != 0) {
+			pr_warn_ratelimited("metacopy file '%pd' has unsupported version\n",
+					    path->dentry);
+			return -EIO;
+		}
+		if (res != data->len) {
+			pr_warn_ratelimited("metacopy file '%pd' has invalid xattr size\n",
+					    path->dentry);
+			return -EIO;
+		}
+	}
+
+	return res;
 out:
 	pr_warn_ratelimited("failed to get metacopy (%i)\n", res);
 	return res;
-- 
2.40.1

