Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B85A3603E9;
	Wed,  7 Oct 2026 06:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791354794; cv=none; b=hPUVxAhfDWAtFAOZfHqRj/bFMwhTr0/iJm0P9OiMXHppk+hauEBRkefPrNLHBs7g2APPduExvyoHcm7ScLkfEZq04TFLcEx3i0qOEjHSt3SUYdmWQ0mSavl8PxkkbqlxHJrS/XRP0opJO91Tyjgnjq3S+/ryxwJq/do/pMsvJ+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791354794; c=relaxed/simple;
	bh=8zsTyxUcYYNR+2MhcdEoxX7o6LKvhO2PADWUPOIyc8M=;
	h=Subject:To:Cc:From:Date:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type; b=D6W9HPUQLgMcxIo5/k/s7KOM9ORgEEQtjXH/ynEp/IKfdkcGdSByhRJng0r/bPo4aeIBs8UliregizixlT/Q+6JINBhv/vuTBbNInzHw3uB+QELjr1AYt9CLOfSbvKylR2Qvk993TYLVz+3gW03hzszt4KQOv2cEb24tN4XcFX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Z8xqW/6H; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Z8xqW/6H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4B1A1F0089B;
	Wed,  7 Oct 2026 06:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1791354791;
	bh=uVnCi9o2ekyBVkSXl2xE+RBkiu5IiHhnxvG3GYEh8YE=;
	h=Subject:To:Cc:From:Date:In-Reply-To;
	b=Z8xqW/6HB9+sfkP0TmjU8fk4ldnjTcUEXPOI3ndSZgSubYQPZqHNqkdYgmxdsdIXJ
	 n8PvPB3bxz09W1gLiauGAIYb/zWJIDp7/Cy8AKbQNqB072PKMj78A6yFq3kRbxgsTy
	 21mLYNgkOv9/M+bIaJ9mvfSs49+myDSghpoLquK8=
Subject: Patch "fsverity: add dependency on 64K or smaller pages" has been added to the 6.18-stable tree
To: ebiggers@kernel.org,fsverity@lists.linux.dev,gregkh@linuxfoundation.org,hch@lst.de,tytso@mit.edu
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Wed, 07 Oct 2026 08:32:55 +0200
In-Reply-To: <20261006214137.50903-1-ebiggers@kernel.org>
Message-ID: <2026100754-provider-subdued-5560@gregkh>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore


This is a note to let you know that I've just added the patch titled

    fsverity: add dependency on 64K or smaller pages

to the 6.18-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     fsverity-add-dependency-on-64k-or-smaller-pages.patch
and it can be found in the queue-6.18 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From stable+bounces-352125-greg=kroah.com@vger.kernel.org Tue Oct  6 23:42:57 2026
From: Eric Biggers <ebiggers@kernel.org>
Date: Tue,  6 Oct 2026 23:41:37 +0200
Subject: fsverity: add dependency on 64K or smaller pages
To: stable@vger.kernel.org
Cc: fsverity@lists.linux.dev, Eric Biggers <ebiggers@kernel.org>, Christoph Hellwig <hch@lst.de>, Theodore Ts'o <tytso@mit.edu>
Message-ID: <20261006214137.50903-1-ebiggers@kernel.org>

From: Eric Biggers <ebiggers@kernel.org>

commit a300000233a9ff842e2fb450fb9a79f7827a586d upstream.

Currently, all filesystems that support fsverity (ext4, f2fs, and btrfs)
cache the Merkle tree in the pagecache at a 64K aligned offset after the
end of the file data.  This offset needs to be a multiple of the page
size, which is guaranteed only when the page size is 64K or smaller.

64K was chosen to be the "largest reasonable page size".  But it isn't
the largest *possible* page size: the hexagon and powerpc ports of Linux
support 256K pages, though that configuration is rarely used.

For now, just disable support for FS_VERITY in these odd configurations
to ensure it isn't used in cases where it would have incorrect behavior.

Fixes: 671e67b47e9f ("fs-verity: add Kconfig and the helper functions for hashing")
Reported-by: Christoph Hellwig <hch@lst.de>
Closes: https://lore.kernel.org/r/20260119063349.GA643@lst.de
Reviewed-by: Theodore Ts'o <tytso@mit.edu>
Link: https://lore.kernel.org/r/20260221204525.30426-1-ebiggers@kernel.org
Signed-off-by: Eric Biggers <ebiggers@kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 fs/verity/Kconfig |    3 +++
 1 file changed, 3 insertions(+)

--- a/fs/verity/Kconfig
+++ b/fs/verity/Kconfig
@@ -2,6 +2,9 @@
 
 config FS_VERITY
 	bool "FS Verity (read-only file-based authenticity protection)"
+	# Filesystems cache the Merkle tree at a 64K aligned offset in the
+	# pagecache.  That approach assumes the page size is at most 64K.
+	depends on PAGE_SHIFT <= 16
 	select CRYPTO_HASH_INFO
 	select CRYPTO_LIB_SHA256
 	select CRYPTO_LIB_SHA512


Patches currently in stable-queue which might be from ebiggers@kernel.org are

queue-6.18/fs-fsverity-reject-size-changes-on-fsverity-files-in-setattr_prepare.patch
queue-6.18/fs-fsverity-remove-check-for-fsverity-being-enabled-in-setattr_prepare.patch
queue-6.18/fsverity-add-dependency-on-64k-or-smaller-pages.patch
queue-6.18/crypto-x86-aes-gcm-fix-always-true-check-for-last-aad-segment.patch
