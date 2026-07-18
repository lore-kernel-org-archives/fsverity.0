Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3ED03242DF
	for <fsverity@lists.linux.dev>; Sat, 18 Jul 2026 19:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784402158; cv=none; b=oguznZsU+ePyKeZblHJId7KabJHpB5l044OqNwAb6YykycRIw0ivhtNxqdy7YGoUrvySu65wKTIUAvHGyEcPymyyAm7PD2Ndea6RXCl/nJ9o9HgbGx37ofit7tpl7gbWI96rdZj4LtILETaRW+6GDO9hPIBYwNDwr/t7WIauVuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784402158; c=relaxed/simple;
	bh=NqNDtqGqbSZhJrGGc5At7ACd4vos50f5lT1ji/vXXxI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P5jQIThONXLjQkV4m4KiXquiaOBGeX1VakNR0fSv1+BbhIiK34imGYAnTv9T0Hi/vEq4hD6ZSq7jvERJ2PX4rbEE0EogazsBKslxJSN/XUtb7Ogjn/LUD4HmdiTiS20BZTwM9g7ASB2sQNMTVbwQicLJaynBAaAntgsfuMs0a44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o+Gxabkk; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o+Gxabkk"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4954c9f380bso9999235e9.0
        for <fsverity@lists.linux.dev>; Sat, 18 Jul 2026 12:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784402155; x=1785006955; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iYUDcKkoJkhlHxJ16Bnz94ZFULLiEQmAk5z7Yu5ywFE=;
        b=o+GxabkkNaeUCbvHuCfv5Dd1cZgvN2UyiqtDpvaruKQQ2mJu6KXwwXXewdVdEkwWdE
         R0zr60PugEVvWRwTwVqvuCNyvasGUfHo10a+4HnuL8FYaz+prYPO5ZCNWfrA7jhD2VGh
         GN+dPOBRQyFzTFqoDmipOWCA2zaRPEWDUqkSRhkUZjxU2lur9GKfwNvHC8UmEgjH+v8e
         Y7mo15027s0+VASBUNbo5gVR/Bq8eS0HP7zq9F6fGXDUZmFLOaKYBCjkoKlH5JZUamxg
         uQUuEvxQ+K47MFtG1ctl/gNqKsvG+NiXAnsHUb4oY0+8bqBGrE2NAZxi42GFVkhOBOnj
         FbWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784402155; x=1785006955;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iYUDcKkoJkhlHxJ16Bnz94ZFULLiEQmAk5z7Yu5ywFE=;
        b=aMnFFNSVHkGilkiSUHDik2MzkgG0QxiWWdxULsR9XoWx1Er4/O21ar21fXKtUNp28r
         COEwn9qSRQ+IQwU1U7HUxCoT9HELtm29iA2ug2IrDi2uWrCmcU/TQFAOR5NOmGdATEiM
         hPkUHqBvyE0MQZoHdRqvUrqHVhjFy+YdiJW0B+HR0xVU7dyrvVpTyWJwOWpN7u4wqxeN
         c9UbU2un+Ke9EK7+YxRNY5N6gVUxygt2ryOf7niKD6uB1KThyC85fHcixKn0HunWvLTE
         VwzBskepYE8UY2rMAdNaEt2Q8NcCyG/m6XT+oPCY+ychE/CVasQwJAvwDZ6gc/R9NnkV
         Ua4g==
X-Forwarded-Encrypted: i=1; AHgh+RoYV/1i5mwvrlYYzpmJzk9FULA0CPIPuapuoONshP6KPYvWIRUw5fSOw1b9FMkyCZRoTpS4jpebYg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxXggsVcOIKa4C+GmkGOFQUKE85HWp97T+7uHAdTnpq8zGjdnAh
	YBIWUxVw9s2rvz4ej2gWVKREWvuC9E/E23NfO5Swff5rv3SGRRHc1ogg
X-Gm-Gg: AfdE7clzDHhxVSK7+/fOZhgwWaiLhol7X3NuLm0dJNhk4oSPA+yAyXhwC5xGWKgB1CW
	sGSwW7CISYxCH1G7W4u/8fS69DpjSJIXcK6Vj5rif2bnKwP6R9DJAOgnkPiaIIvofIo3l6YnLCJ
	KlCGOH9yA+bMESnfmmz9sb9WEHGUbOcr4p0nly5nC+Yqzfua006uHEWa5RjHjbgXhxn3p74uWZd
	q93amLWbBl2/T6bhQQhSRoa6wYhwhMIFdHrqwQXkOI1o+VB+7ACoKGY+cDqCe0BUdL3oBv6UnCw
	D5CPbu4p8ggf0kGvc7OW+Sck3FhoctaxkUe9ttKCnjMnZQfI6GSpveb1xJMmuITQxlLNhrORnnN
	SfbRB8Nj4ZdxgAHqus9CQea9WhfM+Cp25Y4rIWx6BTu1VMcl8bX7BZlT6NwEvAoM7whGoGbSEdk
	VS1OhXEESaffssS0yT
X-Received: by 2002:a05:600c:a42:b0:493:e983:806e with SMTP id 5b1f17b1804b1-4954a3ee98emr90669215e9.3.1784402154743;
        Sat, 18 Jul 2026 12:15:54 -0700 (PDT)
Received: from spark.Home ([2001:8a0:7280:4000:c2b:a5ab:a31c:e0a5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2e8529sm140037005e9.11.2026.07.18.12.15.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 12:15:53 -0700 (PDT)
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
Subject: [RFC PATCH 0/2] init: boot image-based systems without an initramfs (rootimage=)
Date: Sat, 18 Jul 2026 20:15:49 +0100
Message-ID: <20260718191551.1703670-1-ericcurtin17@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Image-based Linux systems (bootc-style OS updaters, ChromeOS/Android-like
A/B schemes, embedded appliances) keep one or more immutable root
filesystem images as sealed files on a writable filesystem and pick one
at boot.  Booting such a system today always requires an initramfs, even
when that initramfs has nothing else to do; its only jobs are to parse
the kernel command line, mount the state filesystem, verify the image,
loop-mount it and switch_root into it.

This series teaches the kernel to do all of that directly:

  root=PARTUUID=... rootimage=/deploy/a/root.erofs rootimagefstype=erofs \
      rootimageverity=sha256:a9548f4c... rootimagesrcdir=/var/state

Patch 1 adds rootimage= (plus rootimagefstype=/rootimageflags=/
rootimagesrcdir=): root= then merely names the "carrier" filesystem.
The image file on it is mounted read-only through the filesystem's
file-backed mount support (available in erofs since v6.12), so no loop
device is involved, and it becomes the root that prepare_namespace()
pivots into.  The carrier mount is detached by default, or moved to
rootimagesrcdir= inside the new root, which image-based systems
practically always want since the carrier holds their writable state.

Patch 2 adds rootimageverity=, which requires the image to carry a
specific fsverity file digest, reusing the fsverity_get_digest()
interface that IMA and overlayfs already use for digest pinning.  With
a signed or measured command line (e.g. a unified kernel image), the
chain of trust extends to every byte of the root filesystem with no
userspace boot stage: the pinned digest authenticates the image's
Merkle tree root, and fsverity keeps verifying reads against it at
runtime, so later tampering with the carrier is caught as well.

This is the file-backed analogue of dm-mod.create= (CONFIG_DM_INIT),
which moved the equivalent block-device setup out of the initramfs for
verity-partition layouts back in v5.1.  For file-based deployment
layouts nothing similar exists, so distributions ship a dracut stack
whose only purpose is the five steps above, and which remains the
largest and most failure-prone moving part of an otherwise fully
image-defined boot.

Tested on arm64 (qemu -M virt with KVM), with no initrd= at any point:

 - control: plain ext4 root boots as before
 - rootimage=: an erofs image file on ext4 is mounted as /, the carrier
   ends up on /var/state, PID 1 runs from the image ~0.18s after kernel
   entry
 - rootimageverity= with the correct digest: boots, digest logged
 - rootimageverity= with a wrong digest: panics with expected-vs-got
 - build: defconfig and allnoconfig (!CONFIG_FS_VERITY, !CONFIG_BLOCK),
   both with W=1, no warnings

Open questions for review:

 - Should the carrier always be detached, dropping rootimagesrcdir=?
   The image mount pins the carrier superblock either way, so userspace
   can re-mount it, but a conflicting ro/rw state then needs a remount
   dance.
 - Should this be behind a Kconfig option like CONFIG_DM_INIT is?  All
   added code is __init and freed after boot.
 - Naming: rootimage= vs. extending root= syntax (e.g. root=image:...).

This series was developed with AI assistance (see the Assisted-by tags
and Documentation/process/coding-assistants.rst).

Eric Curtin (2):
  init: support mounting the root filesystem from an image file
  init: support pinning the root image's fsverity digest

 .../admin-guide/kernel-parameters.txt         |  42 ++++
 init/do_mounts.c                              | 221 ++++++++++++++++--
 2 files changed, 250 insertions(+), 13 deletions(-)

-- 
2.43.0

