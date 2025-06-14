Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A59A1D52B
	for <fsverity@lists.linux.dev>; Sat, 14 Jun 2025 22:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749939495; cv=none; b=FvO7+FSm/7BdLvjiWZgYc0RqWvzU5FJxEbp/SLWYw50N6hDD16BwRYFIwjGgASzDhdYzsT6m3Nzh00bdCl31vwmqvI09LBPgHLkxOoCs8cTkXpTRho+wPnok7EuOGVyXybghp+j6jZMQ8cxW8zM3SB/YCOtjrbEjvd/Hp6eE3f4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749939495; c=relaxed/simple;
	bh=woPtAtec+zvCw4CS8Ojvb5azEvn5VHDOIgSyXZSwYNU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=mvfxPeARPAcZpRasll1WA1N2Q1nXdrch5x2A8Cyssa8TlSwNRV9sBsVRhGa6tvx70SDAs7nRRreS3zlhB03LQ+JpdVAT3p6lL+lcQDEYox5NOSgmNy9/y/7g3f9Mka+Wb+EX8HK6QazFFRERYJOjCiVD5v+kQNae1+p48E+P/24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ufl9B6ZR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ufl9B6ZR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 884D1C4CEEB
	for <fsverity@lists.linux.dev>; Sat, 14 Jun 2025 22:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749939494;
	bh=woPtAtec+zvCw4CS8Ojvb5azEvn5VHDOIgSyXZSwYNU=;
	h=From:To:Subject:Date:From;
	b=ufl9B6ZRwu9GZoKIzUMusiZ7rPlW/Njr9m3x6B2ipXUgJKd30hl80JNcmmplPtih+
	 HpUkxGsNZL8y3AaNa8X++AkZQA7RjYcy8rDEva5dUD4cdaYtcI3mJp1ePpXqJ1ZwbN
	 iPI7wEyVBNKMZXw9GT4YKBXM++dXQOlBOaQMSYYB3NgoS4mCDmZ9IU96T7B3jSKuBz
	 ueh2NOAq+PXtK+r3rSdEE1XJ8B3v/K/H0fKQVFB2MbjI8HiILGZtqyBbYKeXOsOZCz
	 EQohypTl1SE9/FWAJGqUAaeT5cMr2oTHX0F/4q0PMmK6cOfsja5xJuJW3PG5B+YEoN
	 s7qwqM6DtmEfw==
From: Eric Biggers <ebiggers@kernel.org>
To: fsverity@lists.linux.dev
Subject: [PATCH] fsverity: explicitly include <linux/export.h>
Date: Sat, 14 Jun 2025 15:17:23 -0700
Message-ID: <20250614221723.131827-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Eric Biggers <ebiggers@google.com>

Fix build warnings with W=1 that started appearing after
commit a934a57a42f6 ("scripts/misc-check: check missing #include
<linux/export.h> when W=1").

Signed-off-by: Eric Biggers <ebiggers@google.com>
---

This patch applies to v6.16-rc1 and is targeting fsverity/for-next

 fs/verity/enable.c        | 1 +
 fs/verity/measure.c       | 1 +
 fs/verity/open.c          | 1 +
 fs/verity/read_metadata.c | 1 +
 fs/verity/verify.c        | 1 +
 5 files changed, 5 insertions(+)

diff --git a/fs/verity/enable.c b/fs/verity/enable.c
index c284f46d1b535..9b335bee88a5a 100644
--- a/fs/verity/enable.c
+++ b/fs/verity/enable.c
@@ -6,10 +6,11 @@
  */
 
 #include "fsverity_private.h"
 
 #include <crypto/hash.h>
+#include <linux/export.h>
 #include <linux/mount.h>
 #include <linux/sched/signal.h>
 #include <linux/uaccess.h>
 
 struct block_buffer {
diff --git a/fs/verity/measure.c b/fs/verity/measure.c
index 175d2f1bc0893..388734132f018 100644
--- a/fs/verity/measure.c
+++ b/fs/verity/measure.c
@@ -7,10 +7,11 @@
 
 #include "fsverity_private.h"
 
 #include <linux/bpf.h>
 #include <linux/btf.h>
+#include <linux/export.h>
 #include <linux/uaccess.h>
 
 /**
  * fsverity_ioctl_measure() - get a verity file's digest
  * @filp: file to get digest of
diff --git a/fs/verity/open.c b/fs/verity/open.c
index fdeb95eca3af3..ac2c99fbf37b9 100644
--- a/fs/verity/open.c
+++ b/fs/verity/open.c
@@ -5,10 +5,11 @@
  * Copyright 2019 Google LLC
  */
 
 #include "fsverity_private.h"
 
+#include <linux/export.h>
 #include <linux/mm.h>
 #include <linux/slab.h>
 
 static struct kmem_cache *fsverity_info_cachep;
 
diff --git a/fs/verity/read_metadata.c b/fs/verity/read_metadata.c
index f58432772d9ea..cba5d6af4e04f 100644
--- a/fs/verity/read_metadata.c
+++ b/fs/verity/read_metadata.c
@@ -6,10 +6,11 @@
  */
 
 #include "fsverity_private.h"
 
 #include <linux/backing-dev.h>
+#include <linux/export.h>
 #include <linux/highmem.h>
 #include <linux/sched/signal.h>
 #include <linux/uaccess.h>
 
 static int fsverity_read_merkle_tree(struct inode *inode,
diff --git a/fs/verity/verify.c b/fs/verity/verify.c
index 4fcad0825a120..14520289093ca 100644
--- a/fs/verity/verify.c
+++ b/fs/verity/verify.c
@@ -7,10 +7,11 @@
 
 #include "fsverity_private.h"
 
 #include <crypto/hash.h>
 #include <linux/bio.h>
+#include <linux/export.h>
 
 static struct workqueue_struct *fsverity_read_workqueue;
 
 /*
  * Returns true if the hash block with index @hblock_idx in the tree, located in

base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
-- 
2.49.0

