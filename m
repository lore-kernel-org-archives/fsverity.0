Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 594D3352007
	for <fsverity@lists.linux.dev>; Sat, 18 Jul 2026 19:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784402161; cv=none; b=CEMGBS9Z9ebRCfQd3mux7rPB/ER/ERXcjaMHHHzVB+c2uL4g//sLuMWyg+kVO4C1QwV/pIvgUBfz0gJfFWXpDBUWhZG3N5toD5pTb6pwCayJdOUg8yCv/nkQAIu5judX8FaNRffvBlkjPkN3nNKYkCxUlq+uNZTyCgmqjAlR2v4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784402161; c=relaxed/simple;
	bh=JaIyalHpyLApnPkNPXoy+faaGxYp0kiUgkaXuqNN+a8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kI0TzRyaLF/cfa7AFRaiHR0SWPUygdlNm/vYTorTO69fV4eGo6tQcbmWK1db6ErBIPpR07pNBRZMtfHGFQTIj3MWJaxZSNgU8d6dr26bLgVSjGRgLhh4H6FNfmMuBAvZiROZbvstYN55qNqi53uxU9d6S5/i90zYWP0ns77IW5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XxV4A0ey; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XxV4A0ey"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-495437bb891so17623415e9.1
        for <fsverity@lists.linux.dev>; Sat, 18 Jul 2026 12:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784402158; x=1785006958; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n/RuzzR56AKowWPeBaHkPa2me5UyA+I6b2NoNXGG3tc=;
        b=XxV4A0eyoB3QuB5tsInLXw7QjiviVH+D4AWJvFb3b4wSXzS6/zTQjELkbcmtiNWyRO
         gAEcd2u4rFn417BoOX1AaY/jVngLiRGlF9bawCE2808NVuhM+3nVDX4ALM+xJ2VbNSGE
         uMuVAqM3i9vEOUoEdvrG5r0KQQAGP7hCfGefG7A6WkDeGp7w12gfIPTpZeRyG65Ueblv
         eRZgObfKkC8PuR+93rqZbIdHkoMUZkZiMY8qUEYOFWDaf5lzcgbjrdpDbjviYs0QudZK
         JJgx8wcDcE9P8A/Y04cocmxwbywO8NDMBqQ7wNF/hRdiv2P7mqo7MEOoBwaQ9cnLmZnZ
         E16Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784402158; x=1785006958;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=n/RuzzR56AKowWPeBaHkPa2me5UyA+I6b2NoNXGG3tc=;
        b=JmDyWdNi3Jy7xV7xDMhTPq/OkDDhsk5Pt+XqhttYmYldfXafNee3wGKFdTSD7xE2yf
         ZAAaK7/QuTQ7Iw5MX0Z1t91iKjsXqnPEo2SM6+cmb+O648CfjMpuMQbLMAGyTmrky1Hh
         ublhgi41lu9g+ql9AIPgVCmA3AwnqtcNdPivaDizKF+0hItOjY7L4rL+Gw0di3x9yylj
         zXZgLRNH1cZsk6j2xTMi72+cxRKYIMH7xlWgtOX+JKRwpDefJWs3303tdgU33WO7AnHr
         4vpC/YEYu4+jAw0xY4pGzdfJ7jgsn7rY16xt2KsdEuHzcq2Ml4EdR8DpLl9dedD1UxUm
         pzAA==
X-Forwarded-Encrypted: i=1; AHgh+Row/p+vmMyz3F1lEe7yEqcYDhqrY4k275PzDDaNIQo6UA21mMbn+rN3O2ergfifl9ClCJ5ZiZ7O3Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YwQTKHvZ0ceKEcn7wAEBNj2Gsvr9p8++EwELkJwu+LxDkI6LJk4
	idS7Szr0GfyqEbSBiar0e3gr1tX/jVS8No2Bi3W93JD495/6TMZzJJkA
X-Gm-Gg: AfdE7cnJgqaXG0USejjutqbMaQA/t0OpyOQ6e9aOJrLk5ZvA3RYTQVutCpC88/tKjjt
	q4BhITy1KkrsNGgIpKbN74I/Mjhg7WC4G1XX80Jm7piiDJsClDwb7m6Fg9d38TGG4ZUIwyJIDAn
	0R/S0g8tIelsdSoG7Z2cIebJ+XcPN1n5X0zXhdPFSv49dtGKSAgNcoeSfFGgX1m9/m0TmmM6ZXv
	bUrsfN4ORpwehpZZvJm17wvuzDuvwZc8D/W9kfwlfsVgVnHstYxVD22P6jvonsj1eBWMa7bbJYd
	tittCUJKZMH2dZs6x/beMMm3LYf5/jRo4aSNNUYcAVBuzdRXiwH1t6gonX1XV3ikRDcgzfP6ALV
	98KS1fm6r53XKdc5Sl1HsNz9F5hTOvq13HciPf3Mr5eFQE3uRcVKySBJXogYz3dGyV96kk9Lmeh
	HEvaHqhw==
X-Received: by 2002:a05:600c:4e8b:b0:495:501a:fcf8 with SMTP id 5b1f17b1804b1-495501afdc8mr41543145e9.9.1784402157300;
        Sat, 18 Jul 2026 12:15:57 -0700 (PDT)
Received: from spark.Home ([2001:8a0:7280:4000:c2b:a5ab:a31c:e0a5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2e8529sm140037005e9.11.2026.07.18.12.15.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 12:15:56 -0700 (PDT)
From: Eric Curtin <ericcurtin17@gmail.com>
To: Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>
Cc: Jan Kara <jack@suse.cz>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Eric Biggers <ebiggers@kernel.org>,
	"Theodore Y . Ts'o" <tytso@mit.edu>,
	Gao Xiang <xiang@kernel.org>,
	Chao Yu <chao@kernel.org>,
	fsverity@lists.linux.dev,
	linux-erofs@lists.ozlabs.org,
	linux-fsdevel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Eric Curtin <ericcurtin17@gmail.com>
Subject: [RFC PATCH 2/2] init: support pinning the root image's fsverity digest
Date: Sat, 18 Jul 2026 20:15:51 +0100
Message-ID: <20260718191551.1703670-3-ericcurtin17@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260718191551.1703670-1-ericcurtin17@gmail.com>
References: <20260718191551.1703670-1-ericcurtin17@gmail.com>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the root filesystem is mounted from an image file with rootimage=,
the carrier filesystem holding the image is typically writable and
therefore untrusted.  Systems that seal their root images with fsverity
currently need an initramfs for the sole purpose of checking that the
image carries the expected fsverity digest before mounting it.

Add rootimageverity=<hash algorithm>:<hex digest>, which requires the
rootimage= file to have fsverity enabled with exactly this file digest
and fails the boot otherwise, using the same fsverity_get_digest()
interface that IMA and overlayfs already use for digest pinning.

Combined with a trusted kernel command line (e.g. a signed unified
kernel image, or a TPM-measured bootloader configuration), this extends
the chain of trust to every byte of the root filesystem without any
userspace boot stage: the digest pins the image's Merkle tree, and
fsverity keeps verifying all data read from the image against it at
runtime, so post-boot tampering with the carrier filesystem is detected
as well.  It is the file-backed counterpart of setting up a dm-verity
target for a partition-backed root via dm-mod.create=.

Verification is done on the file the kernel is about to mount: it is
opened before mounting (which also loads the fsverity information) and
kept open across the mount, and no userspace exists yet that could race
a replacement in between.

Assisted-by: opencode:claude-fable-5
Signed-off-by: Eric Curtin <ericcurtin17@gmail.com>
---
 .../admin-guide/kernel-parameters.txt         | 13 ++++
 init/do_mounts.c                              | 63 +++++++++++++++++++
 2 files changed, 76 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 5dbd56098..105ebb171 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -6728,6 +6728,19 @@ Kernel parameters
 			root=) is moved to, instead of detaching it.  Used
 			together with rootimage=.
 
+	rootimageverity= [KNL] Require the root image specified by
+			rootimage= to have fsverity enabled with this file
+			digest, given as <hash algorithm>:<hex digest>,
+			e.g. sha256:dd1b3fa9...  The boot is aborted if the
+			image carries no or a different fsverity digest.
+			Because fsverity keeps verifying data read from the
+			image against its Merkle tree at runtime, a trusted
+			(e.g. signed or TPM-measured) kernel command line
+			extends the chain of trust to the complete root
+			filesystem contents without an initramfs.  Requires
+			CONFIG_FS_VERITY and a carrier filesystem with
+			fsverity support.
+
 	rootwait	[KNL] Wait (indefinitely) for root device to show up.
 			Useful for devices that are detected asynchronously
 			(e.g. USB and MMC devices).
diff --git a/init/do_mounts.c b/init/do_mounts.c
index 1b96ef30b..4eb792b27 100644
--- a/init/do_mounts.c
+++ b/init/do_mounts.c
@@ -24,6 +24,9 @@
 #include <linux/nfs_fs_sb.h>
 #include <linux/nfs_mount.h>
 #include <linux/raid/detect.h>
+#include <linux/fsverity.h>
+#include <linux/hex.h>
+#include <crypto/hash_info.h>
 #include <uapi/linux/mount.h>
 
 #include "do_mounts.h"
@@ -155,10 +158,18 @@ static int __init root_image_srcdir_setup(char *str)
 	return 1;
 }
 
+static char * __initdata root_image_verity;
+static int __init root_image_verity_setup(char *str)
+{
+	root_image_verity = str;
+	return 1;
+}
+
 __setup("rootimage=", root_image_setup);
 __setup("rootimagefstype=", root_image_fs_names_setup);
 __setup("rootimageflags=", root_image_data_setup);
 __setup("rootimagesrcdir=", root_image_srcdir_setup);
+__setup("rootimageverity=", root_image_verity_setup);
 
 /* This can return zero length strings. Caller should check */
 static int __init split_fs_names(char *page, size_t size, char *names)
@@ -442,6 +453,55 @@ void __init mount_root(char *root_device_name)
 	}
 }
 
+#ifdef CONFIG_FS_VERITY
+/*
+ * Require the root image to carry the fsverity file digest given by
+ * rootimageverity=<hash algorithm>:<hex digest>.  @file must have been
+ * opened so that its fsverity information is loaded.  Any deviation
+ * fails the boot: with a trusted command line this pins the complete
+ * image contents, which fsverity keeps verifying against the image's
+ * Merkle tree as they are read.
+ */
+static void __init verify_root_image(struct file *file)
+{
+	u8 want[FS_VERITY_MAX_DIGEST_SIZE], got[FS_VERITY_MAX_DIGEST_SIZE];
+	enum hash_algo want_algo, got_algo;
+	int want_size, got_size, i;
+	char *hex;
+
+	hex = strchr(root_image_verity, ':');
+	if (!hex)
+		panic("VFS: rootimageverity= expects <algorithm>:<hex digest>");
+	*hex++ = '\0';
+	i = match_string(hash_algo_name, HASH_ALGO__LAST, root_image_verity);
+	if (i < 0)
+		panic("VFS: rootimageverity=: unknown hash algorithm \"%s\"",
+		      root_image_verity);
+	want_algo = i;
+	want_size = hash_digest_size[want_algo];
+	if (strlen(hex) != 2 * want_size || hex2bin(want, hex, want_size))
+		panic("VFS: rootimageverity=: expected %d-byte hex digest",
+		      want_size);
+
+	got_size = fsverity_get_digest(file_inode(file), got, NULL, &got_algo);
+	if (!got_size)
+		panic("VFS: root image does not have fsverity enabled");
+	if (got_algo != want_algo || got_size != want_size ||
+	    memcmp(want, got, want_size))
+		panic("VFS: root image fsverity digest mismatch: expected %s:%*phN, got %s:%*phN",
+		      hash_algo_name[want_algo], want_size, want,
+		      hash_algo_name[got_algo], got_size, got);
+
+	pr_info("VFS: verified root image fsverity digest %s:%*phN\n",
+		hash_algo_name[want_algo], want_size, want);
+}
+#else /* !CONFIG_FS_VERITY */
+static void __init verify_root_image(struct file *file)
+{
+	panic("VFS: rootimageverity= requires CONFIG_FS_VERITY");
+}
+#endif /* !CONFIG_FS_VERITY */
+
 /*
  * Mount the actual root filesystem from the image file rootimage= on the
  * filesystem that was just mounted from root= (the "carrier"), so that
@@ -481,6 +541,9 @@ static void __init mount_root_image(void)
 		panic("VFS: unable to open root image %s: error %ld",
 		      root_image, PTR_ERR(file));
 
+	if (root_image_verity)
+		verify_root_image(file);
+
 	err = init_mkdir("/image", 0700);
 	if (err < 0 && err != -EEXIST)
 		panic("VFS: unable to create /image: error %d", err);
-- 
2.43.0

