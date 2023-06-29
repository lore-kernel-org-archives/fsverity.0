Received: from box.fidei.email (box.fidei.email [71.19.144.250])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B21C3FC1B
	for <fsverity@lists.linux.dev>; Thu, 29 Jun 2023 22:25:33 +0000 (UTC)
Received: from authenticated-user (box.fidei.email [71.19.144.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by box.fidei.email (Postfix) with ESMTPSA id AE32980702;
	Thu, 29 Jun 2023 18:17:31 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dorminy.me; s=mail;
	t=1688077052; bh=tSjVvle2uSxcOZ/ckvaZRLq6Jdqi0bIN8G3EChW8wBU=;
	h=From:To:Cc:Subject:Date:From;
	b=sEJkDDgR2OCWn0nd0/afpZx/xb8Yo/cGdaIZHU7qg19lsZ+eiFuTpwZwo4rBH1m2h
	 SCabloxgV2GaU6L23WzFX4/qcXSMsthivJGxwH1/aliL+1cNwLoEwcCFulbDegJYCF
	 RLqWLWUTHcQFOYMPl03VTGkFxurdIGIRWW5/7uPej8iDzbcmj1s82n835TPnhrOokW
	 Tfvzas9n11HjFapO3d8/NMPhCa5vUAakCeZ6hTeVlR/Tch1nIUWExIzsNYOYhqRo3m
	 GWCudfjkEZBgtaTxXsRe8j0si5tn5UFrs36fpK6AzxzwH2e7aJXJJxJoD10hET4K5C
	 p0Y2ifVObxE/Q==
From: Sweet Tea Dorminy <sweettea-kernel@dorminy.me>
To: linux-btrfs@vger.kernel.org,
	fstests@vger.kernel.org,
	kernel-team@meta.com,
	ebiggers@google.com,
	anand.jain@oracle.com,
	fdmanana@suse.com,
	linux-fscrypt@vger.kernel.org,
	fsverity@lists.linux.dev,
	zlang@kernel.org
Cc: Sweet Tea Dorminy <sweettea-kernel@dorminy.me>
Subject: [RFC PATCH 0/8] fstests: add btrfs encryption testing
Date: Thu, 29 Jun 2023 18:17:15 -0400
Message-Id: <cover.1688076612.git.sweettea-kernel@dorminy.me>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a preliminary fstests side of the btrfs encryption feature;
more tests are needed, but this gets the existing encryption tests
working with btrfs. This requires the progs and the kernel changes: [1]
[2].

Marked as RFC because they're not ready to merge until all its
dependencies finish landing.

[1] https://lore.kernel.org/linux-btrfs/cover.1688068420.git.sweettea-kernel@dorminy.me/T/#t
[2] https://lore.kernel.org/linux-btrfs/cover.1687988380.git.sweettea-kernel@dorminy.me/T/#t

Sweet Tea Dorminy (8):
  common/encrypt: separate data and inode nonces
  common/encrypt: add btrfs to get_encryption_*nonce
  common/encrypt: add btrfs to get_ciphertext_filename
  common/encrypt: enable making a encrypted btrfs filesystem
  generic/613: write some actual data for btrfs
  tests: adjust encryption tests for extent encryption
  common/verity: explicitly don't allow btrfs encryption
  btrfs: add simple test of reflink of encrypted data

 common/encrypt      | 86 +++++++++++++++++++++++++++++++++++++++++----
 common/verity       |  4 +++
 tests/btrfs/613     | 62 ++++++++++++++++++++++++++++++++
 tests/btrfs/613.out | 13 +++++++
 tests/generic/429   |  6 ++++
 tests/generic/580   |  4 +++
 tests/generic/595   |  4 +++
 tests/generic/613   | 12 ++++---
 8 files changed, 180 insertions(+), 11 deletions(-)
 create mode 100755 tests/btrfs/613
 create mode 100644 tests/btrfs/613.out


base-commit: 87f90a2dae7a4adb7a0a314e27abae9aa1de78fb
-- 
2.40.1

