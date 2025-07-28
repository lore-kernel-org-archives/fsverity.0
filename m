Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A5B327C154
	for <fsverity@lists.linux.dev>; Mon, 28 Jul 2025 20:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753734698; cv=none; b=jNMmqA1Uw2uyP10/RbNulhjcBO40Dl0jAY7wpHWjAAdOZQZbU32x6Wha1nXW3xsds/+w15BKZLjZfIDSI1/HhFQwo1qPDyVd62wglWl8tpTM2Q2oYK+RFRWwgNMZ9aiK5UOQ6M2TfSghQX4bpvbHAE5oLBN0dN5uJSpITfawNAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753734698; c=relaxed/simple;
	bh=FmQY0utR3EJKnbdnl2kWXdJsHs06S3lSSo5C32WL97Y=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Content-Type; b=I952HE/1ttowJ4/m4NpeVqc1z/1SmFPC5+4ZdwVFZx6Sq/DUYz/j9Ju5euOcipeiH5VO9sIuwAn2SKomTvzED+fBYUsr401GmQFlsS5yWzWkTEcoX2j5TXB4kjTkMisHUckkFYYyzxFoObyQb5K4hDelkr1xui0PZBjIj36BYNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NCHfXx4O; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NCHfXx4O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753734696;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nJrJhTiKWZWizCb5vgJDR1e4Y3d90lblUc5COXR2wnU=;
	b=NCHfXx4OLcDwdk3WPc1Uz8UNMwQBuESdvj1USyC2mE+4tUmkPQmXNmqNypLhUaSEbBQ/gG
	i3L+dTbgMVbuOlF7M2nlt2wOGG0XCwt4UL/duEmMaaXh30raa1pO9On5mNwbYlgvC3g4Pp
	X8XtaGyJtuC/hO8aN2yHgrlD177dQ6I=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-577-gl5vhpqVMnadfv9X_VEXTA-1; Mon, 28 Jul 2025 16:31:34 -0400
X-MC-Unique: gl5vhpqVMnadfv9X_VEXTA-1
X-Mimecast-MFC-AGG-ID: gl5vhpqVMnadfv9X_VEXTA_1753734693
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-6149374a4c8so226410a12.0
        for <fsverity@lists.linux.dev>; Mon, 28 Jul 2025 13:31:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753734693; x=1754339493;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nJrJhTiKWZWizCb5vgJDR1e4Y3d90lblUc5COXR2wnU=;
        b=XbytdWm5fqGBaHefh508Bfp5cXWesNBNCM7V8jM3Dms+y2+/uWvnX/YQNM3EhE+rZq
         rAH9oQWB5XSsX2P9IzRD2gKV0XsLczTd//LizUVcrUwg4QAKi2VpAZVgU+0ilWmERdnF
         R8whigcmw8BpiMewfOzJ2mTQIcEelxeh7+0saCftBRJYT3V8/alslmQYNzp1OItQH96k
         LYQgl2Ivtp6GavUerdBS6J9IZhBbRE88o4AqTHu1IIzUwYgGPTZJXjvxj2DVzhAK9ak1
         84uy7mowdVJWS6nnEQlQ6Wc+70SZGSL1oyj4mJIGWbvou4iWqvM9EcWlk1KNWETjfkz+
         wwQA==
X-Gm-Message-State: AOJu0Yzj+V6T71YKsaPWZ8NBnmiWTclr+0cyRjGwOSkC5OsCESR9+S36
	fFVwNyuOe6GOdLOSN2h++vgew1n8upzBX2VrqAqRGdVMlIf0Pt6LXmZp9MyHZX/2yyQ9clwQsTS
	a2hGtMZtakwKICbFtuKJ+mTpbN8Ln/n5sdM1HB9BucIUGv5alETkj7OE5zxY=
X-Gm-Gg: ASbGncv8wz+CTh30MD/naoKwM+bSCFJMWFt+OielKUwhJubJkUim8TuV0lvqde0mnZ5
	fJnSgMpiMnWvzD1HGDWyFy0MhT+UHFOIe+sG184Bau7XTTvXJrihX22KS5hyG0grrX/BtnFIZ+o
	w/hQyjK+YQ7dNb4UZXJ+YN7PYzYdlAlhq5tGeY7Al+OsiD+U1aIe/X7MyiKztOQUMQ7qIUwun7G
	Z+El2sxcYUV7KadJjzo+8UuC4us0ojaGqOdrH0KdbgUSRBDo68S3qIW+SIzAVrAwEAXWwa94cpx
	t9zlwtRB5sJ2EL69s5DwmkzCqg6rOt0ktp6bmFB62Dfp/g==
X-Received: by 2002:a05:6402:26d2:b0:607:35d:9fb4 with SMTP id 4fb4d7f45d1cf-61564414146mr767655a12.15.1753734693248;
        Mon, 28 Jul 2025 13:31:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEA5UBDZv2tek/WX1R6Rvm8MNzw4SMmyDGLfo9kmuBsv5oxLO/xwY0iTeJo5s1xCMBhuaSJhg==
X-Received: by 2002:a05:6402:26d2:b0:607:35d:9fb4 with SMTP id 4fb4d7f45d1cf-61564414146mr767638a12.15.1753734692828;
        Mon, 28 Jul 2025 13:31:32 -0700 (PDT)
Received: from [127.0.0.2] (ip-217-030-074-039.aim-net.cz. [217.30.74.39])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615226558d3sm2730656a12.45.2025.07.28.13.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 13:31:31 -0700 (PDT)
From: Andrey Albershteyn <aalbersh@redhat.com>
X-Google-Original-From: Andrey Albershteyn <aalbersh@kernel.org>
Date: Mon, 28 Jul 2025 22:30:16 +0200
Subject: [PATCH RFC 12/29] fsverity: expose merkle tree geometry to callers
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <20250728-fsverity-v1-12-9e5443af0e34@kernel.org>
References: <20250728-fsverity-v1-0-9e5443af0e34@kernel.org>
In-Reply-To: <20250728-fsverity-v1-0-9e5443af0e34@kernel.org>
To: fsverity@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
 linux-xfs@vger.kernel.org, david@fromorbit.com, djwong@kernel.org, 
 ebiggers@kernel.org, hch@lst.de
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2959; i=aalbersh@kernel.org;
 h=from:subject:message-id; bh=hpvpUPXPy1PD+AbFvGEt6YZjB0rOC9HnWhC0HEKd4jM=;
 b=owJ4nJvAy8zAJea2/JXEGuOHHIyn1ZIYMtrvSeh1ljJs/hUucvPQjYw7y/pYvD9w7BOeNivVZ
 W1r1cRtoUs7SlkYxLgYZMUUWdZJa01NKpLKP2JQIw8zh5UJZAgDF6cATGT1CkaGWffPnqz4d8dV
 vzNez2FCk5DZrOt6922Dg3I6piqL/onkYvhfF7HsvMK6c2w3+ENMc8pjl1TlKaw89TilxlL+d1G
 wEhsjAHAWRkA=
X-Developer-Key: i=aalbersh@kernel.org; a=openpgp;
 fpr=AE1B2A9562721A6FC4307C1F46A7EA18AC33E108
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: R4KlGzwczcoLsJZfTLFAss_StPJZEjuDPooVIBNIG40_1753734693
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

From: "Darrick J. Wong" <djwong@kernel.org>

Create a function that will return selected information about the
geometry of the merkle tree.  Online fsck for XFS will need this piece
to perform basic checks of the merkle tree.

Signed-off-by: Darrick J. Wong <djwong@kernel.org>
---
 fs/verity/open.c         | 37 +++++++++++++++++++++++++++++++++++++
 include/linux/fsverity.h | 11 +++++++++++
 2 files changed, 48 insertions(+)

diff --git a/fs/verity/open.c b/fs/verity/open.c
index fdeb95eca3af..de1d0bd6e703 100644
--- a/fs/verity/open.c
+++ b/fs/verity/open.c
@@ -407,6 +407,43 @@ void __fsverity_cleanup_inode(struct inode *inode)
 }
 EXPORT_SYMBOL_GPL(__fsverity_cleanup_inode);
 
+/**
+ * fsverity_merkle_tree_geometry() - return Merkle tree geometry
+ * @inode: the inode to query
+ * @block_size: will be set to the log2 of the size of a merkle tree block
+ * @block_size: will be set to the size of a merkle tree block, in bytes
+ * @tree_size: will be set to the size of the merkle tree, in bytes
+ *
+ * Callers are not required to have opened the file.
+ *
+ * Return: 0 for success, -ENODATA if verity is not enabled, or any of the
+ * error codes that can result from loading verity information while opening a
+ * file.
+ */
+int fsverity_merkle_tree_geometry(struct inode *inode, u8 *log_blocksize,
+				  unsigned int *block_size, u64 *tree_size)
+{
+	struct fsverity_info *vi;
+	int error;
+
+	if (!IS_VERITY(inode))
+		return -ENODATA;
+
+	error = ensure_verity_info(inode);
+	if (error)
+		return error;
+
+	vi = inode->i_verity_info;
+	if (log_blocksize)
+		*log_blocksize = vi->tree_params.log_blocksize;
+	if (block_size)
+		*block_size = vi->tree_params.block_size;
+	if (tree_size)
+		*tree_size = vi->tree_params.tree_size;
+	return 0;
+}
+EXPORT_SYMBOL_GPL(fsverity_merkle_tree_geometry);
+
 void __init fsverity_init_info_cache(void)
 {
 	fsverity_info_cachep = KMEM_CACHE_USERCOPY(
diff --git a/include/linux/fsverity.h b/include/linux/fsverity.h
index 8155407a7e4c..f10e9493ffa7 100644
--- a/include/linux/fsverity.h
+++ b/include/linux/fsverity.h
@@ -166,6 +166,9 @@ int __fsverity_file_open(struct inode *inode, struct file *filp);
 int __fsverity_prepare_setattr(struct dentry *dentry, struct iattr *attr);
 void __fsverity_cleanup_inode(struct inode *inode);
 
+int fsverity_merkle_tree_geometry(struct inode *inode, u8 *log_blocksize,
+				  unsigned int *block_size, u64 *tree_size);
+
 /**
  * fsverity_cleanup_inode() - free the inode's verity info, if present
  * @inode: an inode being evicted
@@ -250,6 +253,14 @@ static inline void fsverity_cleanup_inode(struct inode *inode)
 {
 }
 
+static inline int fsverity_merkle_tree_geometry(struct inode *inode,
+						u8 *log_blocksize,
+						unsigned int *block_size,
+						u64 *tree_size)
+{
+	return -EOPNOTSUPP;
+}
+
 /* read_metadata.c */
 
 static inline int fsverity_ioctl_read_metadata(struct file *filp,

-- 
2.50.0

