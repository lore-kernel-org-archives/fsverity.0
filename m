Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAEA5746A
	for <fsverity@lists.linux.dev>; Wed,  3 May 2023 08:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683103921;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sdx7u9NzvBFxo17qe4jZntH5LGYHyD9J9CTeI+9RRrY=;
	b=eX7dgfPeWTQAlRaqed+JF4ywbQwwADrh/eHp7isbA2X6Ihp7hrBrrty1CnuA0LK5CqBNhi
	N7Qg6mX/6/BLEHKl4q3TNqEl+lEi5h6ecBa+8tT4wlBseW44WT6DkqSrwcaKWaLLuuXmgh
	AeXfbIJVYx1i4reL0rasx0LUkNlPIEs=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-642-JlpFMQVdM6Wtk0kCJFDw0A-1; Wed, 03 May 2023 04:52:00 -0400
X-MC-Unique: JlpFMQVdM6Wtk0kCJFDw0A-1
Received: by mail-lf1-f70.google.com with SMTP id 2adb3069b0e04-4edc5526c5eso2852947e87.1
        for <fsverity@lists.linux.dev>; Wed, 03 May 2023 01:52:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683103919; x=1685695919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sdx7u9NzvBFxo17qe4jZntH5LGYHyD9J9CTeI+9RRrY=;
        b=EtlrF3O2yuY7XtbNl/7U5sXp1/y36EcqdTPuQzUMnyYmNS2Np3yXyTusQ9C/LYVa3O
         s3FLVJB9FAqsYxsFa/x4BT2dOi+LTVn+ewoMX2lBCCzWIbYPf8gQDPqLxv2Ij//3Tl0m
         GgLQeDusT9v5O2Ng6tmwyE6oBQvSRJZPeAPKXGj7dGxOAtSXlYEOR0M2r0s3tUF5a/DT
         VBOTe+MH6B74ncd+FecjjEc/CKmh9WYI/UniHeA/AzlQzZyzYjX7CvssudXgoKKibvz4
         2Eg12L2+zJVGD8R6PRFJMhPX/+EIVHJrMIzKpu2TtwWFZnO2cfVHy5EIyifRMJbc6VID
         eG7Q==
X-Gm-Message-State: AC+VfDx5RwF9ZQEW+WMQX8iIkkXeJXy0DhpSjOhip2LrTFSYk9IIPdxQ
	3QIK3eAPYnMtRzwA7Q/LHxfqMdiws8w7Oqnk95nHBzf2e+C9S9MLmW1X2gbEGh2byDtEm6M3s72
	q8+PXYB1X1QczZxsG7o8=
X-Received: by 2002:ac2:43b3:0:b0:4ee:d799:eca with SMTP id t19-20020ac243b3000000b004eed7990ecamr646454lfl.40.1683103918959;
        Wed, 03 May 2023 01:51:58 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5NIfGVITK5YrtjPJMdUmeYqXZbP+pyGos6sDktBtIEOTasfLZZoGs/ClvSugP6G3AFVZekig==
X-Received: by 2002:ac2:43b3:0:b0:4ee:d799:eca with SMTP id t19-20020ac243b3000000b004eed7990ecamr646441lfl.40.1683103918615;
        Wed, 03 May 2023 01:51:58 -0700 (PDT)
Received: from localhost.localdomain (c-e6a5e255.022-110-73746f36.bbcust.telenor.se. [85.226.165.230])
        by smtp.googlemail.com with ESMTPSA id j6-20020ac24546000000b004ed4fa5f20fsm5907089lfm.25.2023.05.03.01.51.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 01:51:57 -0700 (PDT)
From: Alexander Larsson <alexl@redhat.com>
To: miklos@szeredi.hu
Cc: linux-unionfs@vger.kernel.org,
	amir73il@gmail.com,
	ebiggers@kernel.org,
	tytso@mit.edu,
	fsverity@lists.linux.dev,
	Alexander Larsson <alexl@redhat.com>
Subject: [PATCH v2 4/6] ovl: Add framework for verity support
Date: Wed,  3 May 2023 10:51:37 +0200
Message-Id: <0292ade77250a8bb563744f596ecaab5614cbd80.1683102959.git.alexl@redhat.com>
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

This adds the scaffolding (docs, config, mount options) for supporting
for a new overlay xattr "overlay.verity", which contains a fs-verity
digest. This is used for metacopy files, and the actual fs-verity
digest of the lowerdata file needs to match it. The mount option
"verity" specifies how this xattrs is handled.

If you enable verity it ("verity=on") all existing xattrs are
validated before use, and during metacopy we generate verity xattr in
the upper metacopy file if the source file has verity enabled. This
means later accesses can guarantee that the correct data is used.

Additionally you can use "verity=require". In this mode all metacopy
files must have a valid verity xattr. For this to work metadata
copy-up must be able to create a verity xattr (so that later accesses
are validated). Therefore, in this mode, if the lower data file
doesn't have fs-verity enabled we fall back to a full copy rather than
a metacopy.

Actual implementation follows in a separate commit.

Signed-off-by: Alexander Larsson <alexl@redhat.com>
---
 Documentation/filesystems/overlayfs.rst | 27 +++++++++
 fs/overlayfs/ovl_entry.h                |  3 +
 fs/overlayfs/super.c                    | 74 ++++++++++++++++++++++++-
 3 files changed, 102 insertions(+), 2 deletions(-)

diff --git a/Documentation/filesystems/overlayfs.rst b/Documentation/filesystems/overlayfs.rst
index bc95343bafba..7e2b445a4139 100644
--- a/Documentation/filesystems/overlayfs.rst
+++ b/Documentation/filesystems/overlayfs.rst
@@ -407,6 +407,33 @@ when a "metacopy" file in one of the lower layers above it, has a "redirect"
 to the absolute path of the "lower data" file in the "data-only" lower layer.
 
 
+fs-verity support
+----------------------
+
+When metadata copy up is used for a file, then the xattr
+"trusted.overlay.verity" may be set on the metacopy file. This
+specifies the expected fs-verity digest of the lowerdata file. This
+may then be used to verify the content of the source file at the time
+the file is opened. During metacopy copy up overlayfs can also set
+this xattr.
+
+This is controlled by the "verity" mount option, which supports
+these values:
+
+- "off":
+    The verity xattr is never used. This is the default if verity
+    option is not specified.
+- "on":
+    Whenever a metacopy files specifies an expected digest, the
+    corresponding data file must match the specified digest.
+    When generating a metacopy file the verity xattr will be set
+    from the source file fs-verity digest (if it has one).
+- "require":
+    Same as "on", but additionally all metacopy files must specify a
+    verity xattr. This means metadata copy up will only be used if
+    the data file has fs-verity enabled, otherwise a full copy-up is
+    used.
+
 Sharing and copying layers
 --------------------------
 
diff --git a/fs/overlayfs/ovl_entry.h b/fs/overlayfs/ovl_entry.h
index c6c7d09b494e..95464a1cb371 100644
--- a/fs/overlayfs/ovl_entry.h
+++ b/fs/overlayfs/ovl_entry.h
@@ -13,6 +13,9 @@ struct ovl_config {
 	bool redirect_dir;
 	bool redirect_follow;
 	const char *redirect_mode;
+	bool verity;
+	bool require_verity;
+	const char *verity_mode;
 	bool index;
 	bool uuid;
 	bool nfs_export;
diff --git a/fs/overlayfs/super.c b/fs/overlayfs/super.c
index c6209592bb3f..a4662883b619 100644
--- a/fs/overlayfs/super.c
+++ b/fs/overlayfs/super.c
@@ -244,6 +244,7 @@ static void ovl_free_fs(struct ovl_fs *ofs)
 	kfree(ofs->config.upperdir);
 	kfree(ofs->config.workdir);
 	kfree(ofs->config.redirect_mode);
+	kfree(ofs->config.verity_mode);
 	if (ofs->creator_cred)
 		put_cred(ofs->creator_cred);
 	kfree(ofs);
@@ -334,6 +335,11 @@ static const char *ovl_redirect_mode_def(void)
 	return ovl_redirect_dir_def ? "on" : "off";
 }
 
+static const char *ovl_verity_mode_def(void)
+{
+	return "off";
+}
+
 static const char * const ovl_xino_str[] = {
 	"off",
 	"auto",
@@ -383,6 +389,8 @@ static int ovl_show_options(struct seq_file *m, struct dentry *dentry)
 		seq_puts(m, ",volatile");
 	if (ofs->config.userxattr)
 		seq_puts(m, ",userxattr");
+	if (strcmp(ofs->config.verity_mode, ovl_verity_mode_def()) != 0)
+		seq_printf(m, ",verity=%s", ofs->config.verity_mode);
 	return 0;
 }
 
@@ -438,6 +446,7 @@ enum {
 	OPT_METACOPY_ON,
 	OPT_METACOPY_OFF,
 	OPT_VOLATILE,
+	OPT_VERITY,
 	OPT_ERR,
 };
 
@@ -460,6 +469,7 @@ static const match_table_t ovl_tokens = {
 	{OPT_METACOPY_ON,		"metacopy=on"},
 	{OPT_METACOPY_OFF,		"metacopy=off"},
 	{OPT_VOLATILE,			"volatile"},
+	{OPT_VERITY,			"verity=%s"},
 	{OPT_ERR,			NULL}
 };
 
@@ -509,6 +519,21 @@ static int ovl_parse_redirect_mode(struct ovl_config *config, const char *mode)
 	return 0;
 }
 
+static int ovl_parse_verity_mode(struct ovl_config *config, const char *mode)
+{
+	if (strcmp(mode, "on") == 0) {
+		config->verity = true;
+	} else if (strcmp(mode, "require") == 0) {
+		config->verity = true;
+		config->require_verity = true;
+	} else if (strcmp(mode, "off") != 0) {
+		pr_err("bad mount option \"verity=%s\"\n", mode);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int ovl_parse_opt(char *opt, struct ovl_config *config)
 {
 	char *p;
@@ -520,6 +545,10 @@ static int ovl_parse_opt(char *opt, struct ovl_config *config)
 	if (!config->redirect_mode)
 		return -ENOMEM;
 
+	config->verity_mode = kstrdup(ovl_verity_mode_def(), GFP_KERNEL);
+	if (!config->verity_mode)
+		return -ENOMEM;
+
 	while ((p = ovl_next_opt(&opt)) != NULL) {
 		int token;
 		substring_t args[MAX_OPT_ARGS];
@@ -620,6 +649,13 @@ static int ovl_parse_opt(char *opt, struct ovl_config *config)
 			config->userxattr = true;
 			break;
 
+		case OPT_VERITY:
+			kfree(config->verity_mode);
+			config->verity_mode = match_strdup(&args[0]);
+			if (!config->verity_mode)
+				return -ENOMEM;
+			break;
+
 		default:
 			pr_err("unrecognized mount option \"%s\" or missing value\n",
 					p);
@@ -651,6 +687,22 @@ static int ovl_parse_opt(char *opt, struct ovl_config *config)
 	if (err)
 		return err;
 
+	err = ovl_parse_verity_mode(config, config->verity_mode);
+	if (err)
+		return err;
+
+	/* Resolve verity -> metacopy dependency */
+	if (config->verity && !config->metacopy) {
+		/* Don't allow explicit specified conflicting combinations */
+		if (metacopy_opt) {
+			pr_err("conflicting options: metacopy=off,verity=%s\n",
+			       config->verity_mode);
+			return -EINVAL;
+		}
+		/* Otherwise automatically enable metacopy. */
+		config->metacopy = true;
+	}
+
 	/*
 	 * This is to make the logic below simpler.  It doesn't make any other
 	 * difference, since config->redirect_dir is only used for upper.
@@ -665,6 +717,11 @@ static int ovl_parse_opt(char *opt, struct ovl_config *config)
 			       config->redirect_mode);
 			return -EINVAL;
 		}
+		if (config->verity && redirect_opt) {
+			pr_err("conflicting options: verity=%s,redirect_dir=%s\n",
+			       config->verity_mode, config->redirect_mode);
+			return -EINVAL;
+		}
 		if (redirect_opt) {
 			/*
 			 * There was an explicit redirect_dir=... that resulted
@@ -700,7 +757,7 @@ static int ovl_parse_opt(char *opt, struct ovl_config *config)
 		}
 	}
 
-	/* Resolve nfs_export -> !metacopy dependency */
+	/* Resolve nfs_export -> !metacopy && !verity dependency */
 	if (config->nfs_export && config->metacopy) {
 		if (nfs_export_opt && metacopy_opt) {
 			pr_err("conflicting options: nfs_export=on,metacopy=on\n");
@@ -713,6 +770,14 @@ static int ovl_parse_opt(char *opt, struct ovl_config *config)
 			 */
 			pr_info("disabling nfs_export due to metacopy=on\n");
 			config->nfs_export = false;
+		} else if (config->verity) {
+			/*
+			 * There was an explicit verity=.. that resulted
+			 * in this conflict.
+			 */
+			pr_info("disabling nfs_export due to verity=%s\n",
+				config->verity_mode);
+			config->nfs_export = false;
 		} else {
 			/*
 			 * There was an explicit nfs_export=on that resulted
@@ -724,7 +789,7 @@ static int ovl_parse_opt(char *opt, struct ovl_config *config)
 	}
 
 
-	/* Resolve userxattr -> !redirect && !metacopy dependency */
+	/* Resolve userxattr -> !redirect && !metacopy && !verity dependency */
 	if (config->userxattr) {
 		if (config->redirect_follow && redirect_opt) {
 			pr_err("conflicting options: userxattr,redirect_dir=%s\n",
@@ -735,6 +800,11 @@ static int ovl_parse_opt(char *opt, struct ovl_config *config)
 			pr_err("conflicting options: userxattr,metacopy=on\n");
 			return -EINVAL;
 		}
+		if (config->verity) {
+			pr_err("conflicting options: userxattr,verity=%s\n",
+			       config->verity_mode);
+			return -EINVAL;
+		}
 		/*
 		 * Silently disable default setting of redirect and metacopy.
 		 * This shall be the default in the future as well: these
-- 
2.39.2

