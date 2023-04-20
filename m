Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2739728F6
	for <fsverity@lists.linux.dev>; Thu, 20 Apr 2023 07:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681976673;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Yc2lxZULYn58CenUOYwswV8KGcYdtVrFtOMSzwTPoS8=;
	b=MRFyX74qZmlwuma4TjjpwzeVpxqMMb9UXhurDWHRq5LMXUdpofucm/pJzz56+RM/LL6JL5
	M2k43/P5q8TT9on8vFfmYq83HIvaCn8cGk0kJe+eIxudsMSevwzC7M5JSg5jvLnBH0nQ+w
	PCdRp7aMfAJfgZBbqq5pkgKPKdbs+T8=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-341-inAmFDqAPYGCvuPgmMuGMw-1; Thu, 20 Apr 2023 03:44:31 -0400
X-MC-Unique: inAmFDqAPYGCvuPgmMuGMw-1
Received: by mail-lf1-f70.google.com with SMTP id 2adb3069b0e04-4ec81706fc9so166008e87.2
        for <fsverity@lists.linux.dev>; Thu, 20 Apr 2023 00:44:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681976670; x=1684568670;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yc2lxZULYn58CenUOYwswV8KGcYdtVrFtOMSzwTPoS8=;
        b=GIqcBdzLcMfqE15J6YxY5VJl38z8SnnwL8YOLTrNsH6rpa7FBZV94vB+3m7VJq8/DT
         Jk1FVWxX7VqofGaS7OwWG+Ggbdo5vpUmCsEcuTe7AcE2JvTvk206orWBXKx/NDK8qbd9
         cqQv0KZ5gtwK+9AOI4rUD5BC5cjaxopTxWz6Hge4FoYcEbXhUv+qjNIoe5QU3MJqqEGY
         U/aAsv2uWJD9DrI2bnAP3W6JDzjxsKyNhq0RHg+ccp1X+4l5A9LvefqhFHVzX8EDPKgf
         gPMPpR++IRJzI6ysf3eYOrzgPT2vKGCuzcFTogxZlt+GV4YpB7VE+a4nl4IkYihGY01q
         zDYg==
X-Gm-Message-State: AAQBX9fIcl2xV4e5rt4HAYE8l4zJTvfdMVmguNoamsLheg4pro2Fe0PB
	gKNtheOWATWAfECAmG0iX1+Ra9KcfknJFZLuyddDmz9Wpz9JztvEp+/d2Aiq8Fz3xSMYk7HLvnF
	G5A+uGxlhONivLPqcKjE=
X-Received: by 2002:ac2:5231:0:b0:4ea:e799:59f9 with SMTP id i17-20020ac25231000000b004eae79959f9mr170852lfl.66.1681976670526;
        Thu, 20 Apr 2023 00:44:30 -0700 (PDT)
X-Google-Smtp-Source: AKy350aoNzxZprcxhPPngcf/ZeL3H2MJGJoqA+CYT6LwBxAbI+PaQ610752uc86MLaXt4Egzkfz1wg==
X-Received: by 2002:ac2:5231:0:b0:4ea:e799:59f9 with SMTP id i17-20020ac25231000000b004eae79959f9mr170844lfl.66.1681976670252;
        Thu, 20 Apr 2023 00:44:30 -0700 (PDT)
Received: from localhost.localdomain (c-e6a5e255.022-110-73746f36.bbcust.telenor.se. [85.226.165.230])
        by smtp.googlemail.com with ESMTPSA id x24-20020ac24898000000b004edc7247778sm129468lfc.79.2023.04.20.00.44.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Apr 2023 00:44:29 -0700 (PDT)
From: Alexander Larsson <alexl@redhat.com>
To: miklos@szeredi.hu
Cc: linux-unionfs@vger.kernel.org,
	amir73il@gmail.com,
	ebiggers@kernel.org,
	tytso@mit.edu,
	fsverity@lists.linux.dev,
	Alexander Larsson <alexl@redhat.com>
Subject: [PATCH 3/6] ovl: Break out ovl_entry_path_lowerdata() from ovl_path_lowerdata()
Date: Thu, 20 Apr 2023 09:44:02 +0200
Message-Id: <69fa1af45ee0f51b50c1ff8a386a57d2842379c9.1681917551.git.alexl@redhat.com>
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

This will be needed later when getting the lowerdata path from the
ovl_entry in ovl_lookup() before the dentry is set up.

Signed-off-by: Alexander Larsson <alexl@redhat.com>
---
 fs/overlayfs/overlayfs.h |  1 +
 fs/overlayfs/util.c      | 11 +++++++++--
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/fs/overlayfs/overlayfs.h b/fs/overlayfs/overlayfs.h
index 477008186d18..3d14770dc711 100644
--- a/fs/overlayfs/overlayfs.h
+++ b/fs/overlayfs/overlayfs.h
@@ -395,6 +395,7 @@ void ovl_path_upper(struct dentry *dentry, struct path *path);
 void ovl_path_lower(struct dentry *dentry, struct path *path);
 void ovl_path_lowerdata(struct dentry *dentry, struct path *path);
 void ovl_i_path_real(struct inode *inode, struct path *path);
+void ovl_entry_path_lowerdata(struct ovl_entry *oe, struct path *path);
 void ovl_entry_path_real(struct ovl_fs *ofs, struct ovl_entry *oe,
 			 struct dentry *upperdentry, struct path *path);
 enum ovl_path_type ovl_path_real(struct dentry *dentry, struct path *path);
diff --git a/fs/overlayfs/util.c b/fs/overlayfs/util.c
index 77c954591daa..17eff3e31239 100644
--- a/fs/overlayfs/util.c
+++ b/fs/overlayfs/util.c
@@ -242,9 +242,9 @@ void ovl_path_lower(struct dentry *dentry, struct path *path)
 	}
 }
 
-void ovl_path_lowerdata(struct dentry *dentry, struct path *path)
+void ovl_entry_path_lowerdata(struct ovl_entry *oe,
+			      struct path *path)
 {
-	struct ovl_entry *oe = OVL_E(dentry);
 	struct ovl_path *lowerdata = ovl_lowerdata(oe);
 	struct dentry *lowerdata_dentry = ovl_lowerdata_dentry(oe);
 
@@ -262,6 +262,13 @@ void ovl_path_lowerdata(struct dentry *dentry, struct path *path)
 	}
 }
 
+void ovl_path_lowerdata(struct dentry *dentry, struct path *path)
+{
+	struct ovl_entry *oe = OVL_E(dentry);
+
+	return ovl_entry_path_lowerdata(oe, path);
+}
+
 enum ovl_path_type ovl_path_real(struct dentry *dentry, struct path *path)
 {
 	enum ovl_path_type type = ovl_path_type(dentry);
-- 
2.39.2

