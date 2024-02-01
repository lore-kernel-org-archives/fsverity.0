Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A4129403
	for <fsverity@lists.linux.dev>; Thu,  1 Feb 2024 05:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706765555; cv=none; b=kOzFqDjAxIiwRf0brtKYiW7cqsQUEUTR2bMr1IaDuts1JyeBdqT7TJJ/CkDjrOCrlnR2USQKaKC6b+JtlrUOcapOwmqvhKzcLkLsQMezBdXO2zqlo1HWxapQAXRQzRRaJLJgaUIQCHsiKNrW0NUYdnjp19qq/KYZkyUB66oOCrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706765555; c=relaxed/simple;
	bh=RHXa4EjhTUynw9xTBt9q45sPv436q/EZJtlZyyjRR14=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XcjKxkQ7oirSlHTQ1rhz9mFmkKiMSmRsDhDMfGnwP5HCUfBMeoOJqm4IS3SE+zSlxcA36Oq1q8ZtvFHj4fE3dY2hz3/irJlcLlEIkFxPw7in9fBx31fdubqLRxjnslPdDEFDFwn6oh28kv9oHx2bUXq35H0ZaTSF/BXP6l2yNZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=syZW1YWj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="syZW1YWj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 255B0C433F1;
	Thu,  1 Feb 2024 05:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706765555;
	bh=RHXa4EjhTUynw9xTBt9q45sPv436q/EZJtlZyyjRR14=;
	h=From:To:Cc:Subject:Date:From;
	b=syZW1YWjMQKzezscakZ//qjtygg52e7yGm2nprP8Pn0GTyt/9wzk9ZgrTNJwEMgre
	 /4yXxzRyiRlX9O1c4ixW2DBYQhYpR1Wcu2mQEHpv0yP08IkxIGxf6j+yjYUE2kE4Jt
	 veQ5CuG3Gt+QvtqI84zkPMvmzGHiatjCNb5las/tEVfvASTO9riLmaNMCSO0oWR74w
	 EzBkL31ViYtOprccJg27WdRzxVCnBGs0fErdG1GH4O5BI6tRDSpHp/VyzMaCaFDp/S
	 QQP+HikjQBKbsd2r58fSosQK9VU4DvBqZl1AKUXYMJGkIkzC7YgXAbWjCzcof49HPj
	 ZxaxwGsG9/1mQ==
From: Eric Biggers <ebiggers@kernel.org>
To: fsverity@lists.linux.dev
Cc: Andrey Albershteyn <aalbersh@redhat.com>
Subject: [PATCH v2] fsverity: remove hash page spin lock
Date: Wed, 31 Jan 2024 21:28:13 -0800
Message-ID: <20240201052813.68380-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Andrey Albershteyn <aalbersh@redhat.com>

The spin lock is not necessary here as it can be replaced with
memory barrier which should be better performance-wise.

When Merkle tree block size differs from page size, in
is_hash_block_verified() two things are modified during check - a
bitmap and PG_checked flag of the page.

Each bit in the bitmap represent verification status of the Merkle
tree blocks. PG_checked flag tells if page was just re-instantiated
or was in pagecache. Both of this states are shared between
verification threads. Page which was re-instantiated can not have
already verified blocks (bit set in bitmap).

The spin lock was used to allow only one thread to modify both of
these states and keep order of operations. The only requirement here
is that PG_Checked is set strictly after bitmap is updated.
This way other threads which see that PG_Checked=1 (page cached)
knows that bitmap is up-to-date. Otherwise, if PG_Checked is set
before bitmap is cleared, other threads can see bit=1 and therefore
will not perform verification of that Merkle tree block.

However, there's still the case when one thread is setting a bit in
verify_data_block() and other thread is clearing it in
is_hash_block_verified(). This can happen if two threads get to
!PageChecked branch and one of the threads is rescheduled before
resetting the bitmap. This is fine as at worst blocks are
re-verified in each thread.

Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
[ebiggers: improved the comment and removed the 'verified' variable]
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/verity/fsverity_private.h |  1 -
 fs/verity/open.c             |  1 -
 fs/verity/verify.c           | 48 ++++++++++++++++++------------------
 3 files changed, 24 insertions(+), 26 deletions(-)

diff --git a/fs/verity/fsverity_private.h b/fs/verity/fsverity_private.h
index a6a6b27492414..b3506f56e180b 100644
--- a/fs/verity/fsverity_private.h
+++ b/fs/verity/fsverity_private.h
@@ -62,21 +62,20 @@ struct merkle_tree_params {
  * caches information about the Merkle tree that's needed to efficiently verify
  * data read from the file.  It also caches the file digest.  The Merkle tree
  * pages themselves are not cached here, but the filesystem may cache them.
  */
 struct fsverity_info {
 	struct merkle_tree_params tree_params;
 	u8 root_hash[FS_VERITY_MAX_DIGEST_SIZE];
 	u8 file_digest[FS_VERITY_MAX_DIGEST_SIZE];
 	const struct inode *inode;
 	unsigned long *hash_block_verified;
-	spinlock_t hash_page_init_lock;
 };
 
 #define FS_VERITY_MAX_SIGNATURE_SIZE	(FS_VERITY_MAX_DESCRIPTOR_SIZE - \
 					 sizeof(struct fsverity_descriptor))
 
 /* hash_algs.c */
 
 extern struct fsverity_hash_alg fsverity_hash_algs[];
 
 const struct fsverity_hash_alg *fsverity_get_hash_alg(const struct inode *inode,
diff --git a/fs/verity/open.c b/fs/verity/open.c
index 6c31a871b84bc..fdeb95eca3af3 100644
--- a/fs/verity/open.c
+++ b/fs/verity/open.c
@@ -232,21 +232,20 @@ struct fsverity_info *fsverity_create_info(const struct inode *inode,
 			vi->tree_params.tree_pages <<
 			vi->tree_params.log_blocks_per_page;
 
 		vi->hash_block_verified = kvcalloc(BITS_TO_LONGS(num_bits),
 						   sizeof(unsigned long),
 						   GFP_KERNEL);
 		if (!vi->hash_block_verified) {
 			err = -ENOMEM;
 			goto fail;
 		}
-		spin_lock_init(&vi->hash_page_init_lock);
 	}
 
 	return vi;
 
 fail:
 	fsverity_free_info(vi);
 	return ERR_PTR(err);
 }
 
 void fsverity_set_info(struct inode *inode, struct fsverity_info *vi)
diff --git a/fs/verity/verify.c b/fs/verity/verify.c
index 904ccd7e8e162..4fcad0825a120 100644
--- a/fs/verity/verify.c
+++ b/fs/verity/verify.c
@@ -12,21 +12,20 @@
 
 static struct workqueue_struct *fsverity_read_workqueue;
 
 /*
  * Returns true if the hash block with index @hblock_idx in the tree, located in
  * @hpage, has already been verified.
  */
 static bool is_hash_block_verified(struct fsverity_info *vi, struct page *hpage,
 				   unsigned long hblock_idx)
 {
-	bool verified;
 	unsigned int blocks_per_page;
 	unsigned int i;
 
 	/*
 	 * When the Merkle tree block size and page size are the same, then the
 	 * ->hash_block_verified bitmap isn't allocated, and we use PG_checked
 	 * to directly indicate whether the page's block has been verified.
 	 *
 	 * Using PG_checked also guarantees that we re-verify hash pages that
 	 * get evicted and re-instantiated from the backing storage, as new
@@ -36,53 +35,54 @@ static bool is_hash_block_verified(struct fsverity_info *vi, struct page *hpage,
 		return PageChecked(hpage);
 
 	/*
 	 * When the Merkle tree block size and page size differ, we use a bitmap
 	 * to indicate whether each hash block has been verified.
 	 *
 	 * However, we still need to ensure that hash pages that get evicted and
 	 * re-instantiated from the backing storage are re-verified.  To do
 	 * this, we use PG_checked again, but now it doesn't really mean
 	 * "checked".  Instead, now it just serves as an indicator for whether
-	 * the hash page is newly instantiated or not.
+	 * the hash page is newly instantiated or not.  If the page is new, as
+	 * indicated by PG_checked=0, we clear the bitmap bits for the page's
+	 * blocks since they are untrustworthy, then set PG_checked=1.
+	 * Otherwise we return the bitmap bit for the requested block.
 	 *
-	 * The first thread that sees PG_checked=0 must clear the corresponding
-	 * bitmap bits, then set PG_checked=1.  This requires a spinlock.  To
-	 * avoid having to take this spinlock in the common case of
-	 * PG_checked=1, we start with an opportunistic lockless read.
+	 * Multiple threads may execute this code concurrently on the same page.
+	 * This is safe because we use memory barriers to ensure that if a
+	 * thread sees PG_checked=1, then it also sees the associated bitmap
+	 * clearing to have occurred.  Also, all writes and their corresponding
+	 * reads are atomic, and all writes are safe to repeat in the event that
+	 * multiple threads get into the PG_checked=0 section.  (Clearing a
+	 * bitmap bit again at worst causes a hash block to be verified
+	 * redundantly.  That event should be very rare, so it's not worth using
+	 * a lock to avoid.  Setting PG_checked again has no effect.)
 	 */
 	if (PageChecked(hpage)) {
 		/*
 		 * A read memory barrier is needed here to give ACQUIRE
 		 * semantics to the above PageChecked() test.
 		 */
 		smp_rmb();
 		return test_bit(hblock_idx, vi->hash_block_verified);
 	}
-	spin_lock(&vi->hash_page_init_lock);
-	if (PageChecked(hpage)) {
-		verified = test_bit(hblock_idx, vi->hash_block_verified);
-	} else {
-		blocks_per_page = vi->tree_params.blocks_per_page;
-		hblock_idx = round_down(hblock_idx, blocks_per_page);
-		for (i = 0; i < blocks_per_page; i++)
-			clear_bit(hblock_idx + i, vi->hash_block_verified);
-		/*
-		 * A write memory barrier is needed here to give RELEASE
-		 * semantics to the below SetPageChecked() operation.
-		 */
-		smp_wmb();
-		SetPageChecked(hpage);
-		verified = false;
-	}
-	spin_unlock(&vi->hash_page_init_lock);
-	return verified;
+	blocks_per_page = vi->tree_params.blocks_per_page;
+	hblock_idx = round_down(hblock_idx, blocks_per_page);
+	for (i = 0; i < blocks_per_page; i++)
+		clear_bit(hblock_idx + i, vi->hash_block_verified);
+	/*
+	 * A write memory barrier is needed here to give RELEASE semantics to
+	 * the below SetPageChecked() operation.
+	 */
+	smp_wmb();
+	SetPageChecked(hpage);
+	return false;
 }
 
 /*
  * Verify a single data block against the file's Merkle tree.
  *
  * In principle, we need to verify the entire path to the root node.  However,
  * for efficiency the filesystem may cache the hash blocks.  Therefore we need
  * only ascend the tree until an already-verified hash block is seen, and then
  * verify the path to that block.
  *

base-commit: 41bccc98fb7931d63d03f326a746ac4d429c1dd3
-- 
2.43.0

