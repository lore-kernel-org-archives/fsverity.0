Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD2810E7
	for <fsverity@lists.linux.dev>; Wed, 25 Jan 2023 20:30:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 724C4C433D2
	for <fsverity@lists.linux.dev>; Wed, 25 Jan 2023 20:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674678644;
	bh=FlFQ0Vy8y+if2J6CiX1BgcQRMewqc1rRwlzWHn0D3i4=;
	h=From:To:Subject:Date:From;
	b=dPQNFWI4Irb0Etn+OfWuniQq96/qem8wk9I17vvHsAXvRXgg7fIph/1e91RyA1gmQ
	 1U8g7cr1AJQa01UVbRbKRFP1dJbiQOOdz4CWJrHIUpdlXxzutG5RXPSygOcElN9haa
	 OqJgzuUJMVA8nT6G2pFNyccgbFSsVbsSVRK/KWkiNyd4MHdnJQlb6kXOqyLkhbQ6Eu
	 umtqWbKDDBHF0ED4xeyfVM76X2XANxx1uu4tTwjfLprm06MNKiwdfny7UXxRtdBmL7
	 aktO2TZNkbuN/YRxXa8zMX608r/EQWLsqwSDyzrubQd5DqCfow6epBx39AT6ETiZer
	 R4k9cVG8+ZBrw==
From: Eric Biggers <ebiggers@kernel.org>
To: fsverity@lists.linux.dev
Subject: [PATCH] fsverity.rst: update git repo URL for fsverity-utils
Date: Wed, 25 Jan 2023 12:30:25 -0800
Message-Id: <20230125203025.28187-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.39.1
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Eric Biggers <ebiggers@google.com>

The fsverity-utils git repo is moving out of my personal directory;
see the announcement at
https://lore.kernel.org/r/Y9GKm+hcm70myZkr@sol.localdomain.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 Documentation/filesystems/fsverity.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/filesystems/fsverity.rst b/Documentation/filesystems/fsverity.rst
index c0c8a25b41bb8..2d9ef906aa2a3 100644
--- a/Documentation/filesystems/fsverity.rst
+++ b/Documentation/filesystems/fsverity.rst
@@ -642,7 +642,7 @@ Userspace utility
 This document focuses on the kernel, but a userspace utility for
 fs-verity can be found at:
 
-	https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/fsverity-utils.git
+	https://git.kernel.org/pub/scm/fs/fsverity/fsverity-utils.git
 
 See the README.md file in the fsverity-utils source tree for details,
 including examples of setting up fs-verity protected files.

base-commit: db85d14dc5c566879a01c4928b2f6f4d5cf0f939
-- 
2.39.1

