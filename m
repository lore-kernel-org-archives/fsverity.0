Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90B313AEF
	for <fsverity@lists.linux.dev>; Wed,  5 Jul 2023 21:17:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56378C433C7
	for <fsverity@lists.linux.dev>; Wed,  5 Jul 2023 21:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688591862;
	bh=wQOdBe47NgAqkfa0QQ19trJOf2lI4xxNvgw3F7idAVA=;
	h=From:To:Subject:Date:From;
	b=cIEYKWqTFOlnQWWFPR/UfviqFmTv/icmLEBErOL+hK42yeLhy4XdHkdmBXYejmlRU
	 XCE3dg6UBTMrZ1VxuoEjaT8s/ihvnnMUSVzMSesEETF9GxcUamVbZbgDb5uGC/f/UE
	 UmpPg7wVntQJ2xBkQS/ltm4gXd+E7+ZGB99DYxj5Q5ThQY9l2FPSgK6f1OWV+mP/ue
	 DSECci1S1pDlGmTJ6Wr+VAu/+O4EIkxlMrEsQEChVLo81MLQf4E+TYJC9XWDc2mvM7
	 CQGCnfQhpzEYGNynPlwZKLBop5LDoSlYxB8Q15Iza434aCOZ0o0J79Aw/wDnvHycK5
	 KarL1SE6nMFrw==
From: Eric Biggers <ebiggers@kernel.org>
To: fsverity@lists.linux.dev
Subject: [PATCH] fsverity: explicitly check that there is no algorithm 0
Date: Wed,  5 Jul 2023 14:17:19 -0700
Message-ID: <20230705211719.37713-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Eric Biggers <ebiggers@google.com>

Since libfsverity and some other code would break if 0 is ever allocated
as an FS_VERITY_HASH_ALG_* value, make fsverity_check_hash_algs()
explicitly check that there is no algorithm 0.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/verity/hash_algs.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/fs/verity/hash_algs.c b/fs/verity/hash_algs.c
index c598d20354763..6b08b1d9a7d7c 100644
--- a/fs/verity/hash_algs.c
+++ b/fs/verity/hash_algs.c
@@ -226,6 +226,14 @@ void __init fsverity_check_hash_algs(void)
 		if (!alg->name)
 			continue;
 
+		/*
+		 * 0 must never be allocated as an FS_VERITY_HASH_ALG_* value,
+		 * as it is reserved for users that use 0 to mean unspecified or
+		 * a default value.  fs/verity/ itself doesn't care and doesn't
+		 * have a default algorithm, but some users make use of this.
+		 */
+		BUG_ON(i == 0);
+
 		BUG_ON(alg->digest_size > FS_VERITY_MAX_DIGEST_SIZE);
 
 		/*

base-commit: ace1ba1c9038b30f29c5759bc4726bbed7748f15
-- 
2.41.0

