Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8976D17C8
	for <fsverity@lists.linux.dev>; Sun,  4 Jun 2023 02:23:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E134FC433D2
	for <fsverity@lists.linux.dev>; Sun,  4 Jun 2023 02:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685845414;
	bh=rqL+9lb7QdrGmRjHJgGD66ZY8fM4bjvb6Ck50A9LS9w=;
	h=From:To:Subject:Date:From;
	b=dm/nXDUVQjjuf2hXA80ynsV1CoV5atP095YfALhBvTI5hh6U/k8fh5E8MY1GHYrGx
	 K7GMbd3PycN21UIDIImkXQzqgnzdphVo8vkDW2MqnXiqRgQAljtZksRcPo6ZL/IKVU
	 nQUTP5dMzgI47dmgFxIj/KsO8KFbfRHr8Yc1uadbbWajCB6TeeAL8zMnWaZ7SWRxJb
	 TF2C99rTCvXMMRr71GZt62uN070Gs0pP0v0Yx69s60FKfTs+Ye3h4A0e8pxVbl9bwQ
	 aO93vMyXuCs6YrKEm8FZXyWNUIm1ZgeKq/F/sznGHH1u+0Yp2z8Wp7+mQit7OMUdag
	 YL3vx9KFfUZZQ==
From: Eric Biggers <ebiggers@kernel.org>
To: fsverity@lists.linux.dev
Subject: [PATCH] fsverity: simplify error handling in verify_data_block()
Date: Sat,  3 Jun 2023 19:23:12 -0700
Message-ID: <20230604022312.48532-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Eric Biggers <ebiggers@google.com>

Clean up the error handling in verify_data_block() to (a) eliminate the
'err' variable which has caused some confusion because the function
actually returns a bool, (b) reduce the compiled code size slightly, and
(c) execute one fewer branch in the success case.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/verity/verify.c | 55 ++++++++++++++++++----------------------------
 1 file changed, 21 insertions(+), 34 deletions(-)

diff --git a/fs/verity/verify.c b/fs/verity/verify.c
index 702500ef1f348..48b8040750dda 100644
--- a/fs/verity/verify.c
+++ b/fs/verity/verify.c
@@ -12,23 +12,6 @@
 
 static struct workqueue_struct *fsverity_read_workqueue;
 
-static inline int cmp_hashes(const struct fsverity_info *vi,
-			     const u8 *want_hash, const u8 *real_hash,
-			     u64 data_pos, int level)
-{
-	const unsigned int hsize = vi->tree_params.digest_size;
-
-	if (memcmp(want_hash, real_hash, hsize) == 0)
-		return 0;
-
-	fsverity_err(vi->inode,
-		     "FILE CORRUPTED! pos=%llu, level=%d, want_hash=%s:%*phN, real_hash=%s:%*phN",
-		     data_pos, level,
-		     vi->tree_params.hash_alg->name, hsize, want_hash,
-		     vi->tree_params.hash_alg->name, hsize, real_hash);
-	return -EBADMSG;
-}
-
 /*
  * Returns true if the hash block with index @hblock_idx in the tree, located in
  * @hpage, has already been verified.
@@ -131,7 +114,6 @@ verify_data_block(struct inode *inode, struct fsverity_info *vi,
 	 * index of that block's hash within the current level.
 	 */
 	u64 hidx = data_pos >> params->log_blocksize;
-	int err;
 
 	/* Up to 1 + FS_VERITY_MAX_LEVELS pages may be mapped at once */
 	BUILD_BUG_ON(1 + FS_VERITY_MAX_LEVELS > KM_MAX_IDX);
@@ -191,11 +173,10 @@ verify_data_block(struct inode *inode, struct fsverity_info *vi,
 				hpage_idx, level == 0 ? min(max_ra_pages,
 					params->tree_pages - hpage_idx) : 0);
 		if (IS_ERR(hpage)) {
-			err = PTR_ERR(hpage);
 			fsverity_err(inode,
-				     "Error %d reading Merkle tree page %lu",
-				     err, hpage_idx);
-			goto out;
+				     "Error %ld reading Merkle tree page %lu",
+				     PTR_ERR(hpage), hpage_idx);
+			goto error;
 		}
 		haddr = kmap_local_page(hpage) + hblock_offset_in_page;
 		if (is_hash_block_verified(vi, hpage, hblock_idx)) {
@@ -221,12 +202,10 @@ verify_data_block(struct inode *inode, struct fsverity_info *vi,
 		unsigned long hblock_idx = hblocks[level - 1].index;
 		unsigned int hoffset = hblocks[level - 1].hoffset;
 
-		err = fsverity_hash_block(params, inode, haddr, real_hash);
-		if (err)
-			goto out;
-		err = cmp_hashes(vi, want_hash, real_hash, data_pos, level - 1);
-		if (err)
-			goto out;
+		if (fsverity_hash_block(params, inode, haddr, real_hash) != 0)
+			goto error;
+		if (memcmp(want_hash, real_hash, hsize) != 0)
+			goto corrupted;
 		/*
 		 * Mark the hash block as verified.  This must be atomic and
 		 * idempotent, as the same hash block might be verified by
@@ -243,16 +222,24 @@ verify_data_block(struct inode *inode, struct fsverity_info *vi,
 	}
 
 	/* Finally, verify the data block. */
-	err = fsverity_hash_block(params, inode, data, real_hash);
-	if (err)
-		goto out;
-	err = cmp_hashes(vi, want_hash, real_hash, data_pos, -1);
-out:
+	if (fsverity_hash_block(params, inode, data, real_hash) != 0)
+		goto error;
+	if (memcmp(want_hash, real_hash, hsize) != 0)
+		goto corrupted;
+	return true;
+
+corrupted:
+	fsverity_err(inode,
+		     "FILE CORRUPTED! pos=%llu, level=%d, want_hash=%s:%*phN, real_hash=%s:%*phN",
+		     data_pos, level - 1,
+		     params->hash_alg->name, hsize, want_hash,
+		     params->hash_alg->name, hsize, real_hash);
+error:
 	for (; level > 0; level--) {
 		kunmap_local(hblocks[level - 1].addr);
 		put_page(hblocks[level - 1].page);
 	}
-	return err == 0;
+	return false;
 }
 
 static bool

base-commit: c61c38330e582e664fdb97bcb9faf9fa0e4ee175
-- 
2.41.0

