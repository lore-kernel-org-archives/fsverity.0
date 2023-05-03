Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6F7ED2
	for <fsverity@lists.linux.dev>; Wed,  3 May 2023 08:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683103920;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DuOxmhHvrADxVqyLcYeijglLSxGFgA8WAfOb+tgiEXI=;
	b=ZIvzK7OabUaix8kWvsG9iwP9neIbLkRQILVCHWRfKUZLTIfJaWeArQtS5gimoX0AxYCXPC
	9T8vwjcpE6ZalmepqElJlmWKiRU6BWJSR4/gOQpop2lpkIMRrsfq2PQyX56mH3wdU6Ii/8
	y8FAKOofv0wcf2cpnr0e7gBXmbgQWY4=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-504-XNn0wzgHP7-5jyyrdlNvmg-1; Wed, 03 May 2023 04:51:59 -0400
X-MC-Unique: XNn0wzgHP7-5jyyrdlNvmg-1
Received: by mail-lj1-f199.google.com with SMTP id 38308e7fff4ca-2a8c3314d18so24112871fa.0
        for <fsverity@lists.linux.dev>; Wed, 03 May 2023 01:51:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683103917; x=1685695917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DuOxmhHvrADxVqyLcYeijglLSxGFgA8WAfOb+tgiEXI=;
        b=FtiWAVFRs8f3MxQS3DV3rRxyZIyJnfXklVfIWp9ga+v9a9Pr0iu6/vY6o3TaPU2S17
         EpMbnAHgXkwkGOWdRkOAwsKzNA3+8xyz8ueaba0xRPO3KX2gPFxn62aroOP8jBEjl9kN
         y1gMvvbR2I6VPjkFExWuYeVDGDPBKTuVP7vGmr1qG5AJuE0V5hOKGCnQMEKAjiMrdoPf
         NiGxRvgUkP8plIQP3qk0yAnddofZzJN/fC/Db/xgmfz8X+yf8J7lmdzSN6bqXJf74mGK
         1Ms+v5rQcdUD9A7JmdvllC5Vy366+SqGVJTYlNQFkBPEzcp6cqMohlQfOakEU/emZz2j
         d8zg==
X-Gm-Message-State: AC+VfDxOYObL5Qk3LPdId/wUHD6m5Fuxv/VfpBjOukc3RysRlLYgHtDW
	8YerPD70xapbjyqVPvOBz9u6bnYwXDg41t8/FQoG8M9vq8zDPS9SrinSuRTuNNU+wu8jhjZj6XY
	+NzBzEaYY0j/j+zPMoas=
X-Received: by 2002:ac2:5a4a:0:b0:4eb:40d4:e0d2 with SMTP id r10-20020ac25a4a000000b004eb40d4e0d2mr685180lfn.38.1683103917773;
        Wed, 03 May 2023 01:51:57 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5yxUM/3BQQGSn7yGWxkPYM3S0JgZW0405lZebJhguwjx/PTKCM5eqVOOxHUxwVFJOgHb0vvA==
X-Received: by 2002:ac2:5a4a:0:b0:4eb:40d4:e0d2 with SMTP id r10-20020ac25a4a000000b004eb40d4e0d2mr685173lfn.38.1683103917595;
        Wed, 03 May 2023 01:51:57 -0700 (PDT)
Received: from localhost.localdomain (c-e6a5e255.022-110-73746f36.bbcust.telenor.se. [85.226.165.230])
        by smtp.googlemail.com with ESMTPSA id j6-20020ac24546000000b004ed4fa5f20fsm5907089lfm.25.2023.05.03.01.51.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 01:51:56 -0700 (PDT)
From: Alexander Larsson <alexl@redhat.com>
To: miklos@szeredi.hu
Cc: linux-unionfs@vger.kernel.org,
	amir73il@gmail.com,
	ebiggers@kernel.org,
	tytso@mit.edu,
	fsverity@lists.linux.dev,
	Alexander Larsson <alexl@redhat.com>
Subject: [PATCH v2 3/6] ovl: Break out ovl_e_path_lowerdata() from ovl_path_lowerdata()
Date: Wed,  3 May 2023 10:51:36 +0200
Message-Id: <53ba3af42c7c9cfeaa7d9557ed2daa9363e6f756.1683102959.git.alexl@redhat.com>
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

This will be needed later when getting the lowerdata path from the
ovl_entry in ovl_lookup() before the dentry is set up.

Signed-off-by: Alexander Larsson <alexl@redhat.com>
Reviewed-by: Amir Goldstein <amir73il@gmail.com>
---
 fs/overlayfs/overlayfs.h | 1 +
 fs/overlayfs/util.c      | 9 +++++++--
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/fs/overlayfs/overlayfs.h b/fs/overlayfs/overlayfs.h
index 6ce1c7906bb9..a4867ff97115 100644
--- a/fs/overlayfs/overlayfs.h
+++ b/fs/overlayfs/overlayfs.h
@@ -391,6 +391,7 @@ void ovl_path_upper(struct dentry *dentry, struct path *path);
 void ovl_path_lower(struct dentry *dentry, struct path *path);
 void ovl_path_lowerdata(struct dentry *dentry, struct path *path);
 void ovl_i_path_real(struct inode *inode, struct path *path);
+void ovl_e_path_lowerdata(struct ovl_entry *oe, struct path *path);
 void ovl_e_path_real(struct ovl_fs *ofs, struct ovl_entry *oe,
 		     struct dentry *upperdentry, struct path *path);
 enum ovl_path_type ovl_path_real(struct dentry *dentry, struct path *path);
diff --git a/fs/overlayfs/util.c b/fs/overlayfs/util.c
index c32252153e5e..74077ef50bb3 100644
--- a/fs/overlayfs/util.c
+++ b/fs/overlayfs/util.c
@@ -222,9 +222,9 @@ void ovl_path_lower(struct dentry *dentry, struct path *path)
 	}
 }
 
-void ovl_path_lowerdata(struct dentry *dentry, struct path *path)
+void ovl_e_path_lowerdata(struct ovl_entry *oe,
+			  struct path *path)
 {
-	struct ovl_entry *oe = OVL_E(dentry);
 	struct ovl_path *lowerdata = ovl_lowerdata(oe);
 	struct dentry *lowerdata_dentry = ovl_lowerdata_dentry(oe);
 
@@ -242,6 +242,11 @@ void ovl_path_lowerdata(struct dentry *dentry, struct path *path)
 	}
 }
 
+void ovl_path_lowerdata(struct dentry *dentry, struct path *path)
+{
+	return ovl_e_path_lowerdata(OVL_E(dentry), path);
+}
+
 enum ovl_path_type ovl_path_real(struct dentry *dentry, struct path *path)
 {
 	enum ovl_path_type type = ovl_path_type(dentry);
-- 
2.39.2

