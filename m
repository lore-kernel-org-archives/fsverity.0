Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C4917C8
	for <fsverity@lists.linux.dev>; Sun,  4 Jun 2023 02:23:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B6F8C433EF
	for <fsverity@lists.linux.dev>; Sun,  4 Jun 2023 02:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685845439;
	bh=nB2rS+Rmql9KmdUvOfLwy0+SNgXnPVimhEbXmWwd+Y0=;
	h=From:To:Subject:Date:From;
	b=UST/fKoRpN7CbiVExFW7vESZMnEPe497ef/+yvyav/r+5fQIyopibxK/p8VPsE0oJ
	 HkW3rNsfeYYv4XFfSCAvulft1kBAQLJ1Ze0Ky/gu/i0cu06qySglE8D0su9RTTg9RQ
	 qyrvMLquYGoQarIFNg3ckbIzORglzKZXTepq2FdaLz32VsTx64HpiD6dkYA6SQeITe
	 9EqBiBvjKpQEcLSpeTQy37eyVxl8GEq+k+YM6rP3j8+UKFuO3q/RDttU9fIQ/jRK/B
	 NWGFs8NjMBotu6zsqibj6azsIDcKCKA5YGrPr9EyHmhhvNSTaactlfBVFsaOjxoH3u
	 TsOxDWu2HcDoQ==
From: Eric Biggers <ebiggers@kernel.org>
To: fsverity@lists.linux.dev
Subject: [PATCH] fsverity: constify fsverity_hash_alg
Date: Sat,  3 Jun 2023 19:23:48 -0700
Message-ID: <20230604022348.48658-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Eric Biggers <ebiggers@google.com>

Now that fsverity_hash_alg doesn't have an embedded mempool, it can be
'const' almost everywhere.  Add it.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/verity/fsverity_private.h | 10 +++++-----
 fs/verity/hash_algs.c        |  8 ++++----
 fs/verity/open.c             |  4 ++--
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/fs/verity/fsverity_private.h b/fs/verity/fsverity_private.h
index 8527beca2a454..49bf3a1eb2a02 100644
--- a/fs/verity/fsverity_private.h
+++ b/fs/verity/fsverity_private.h
@@ -33,7 +33,7 @@ struct fsverity_hash_alg {
 
 /* Merkle tree parameters: hash algorithm, initial hash state, and topology */
 struct merkle_tree_params {
-	struct fsverity_hash_alg *hash_alg; /* the hash algorithm */
+	const struct fsverity_hash_alg *hash_alg; /* the hash algorithm */
 	const u8 *hashstate;		/* initial hash state or NULL */
 	unsigned int digest_size;	/* same as hash_alg->digest_size */
 	unsigned int block_size;	/* size of data and tree blocks */
@@ -79,13 +79,13 @@ struct fsverity_info {
 
 extern struct fsverity_hash_alg fsverity_hash_algs[];
 
-struct fsverity_hash_alg *fsverity_get_hash_alg(const struct inode *inode,
-						unsigned int num);
-const u8 *fsverity_prepare_hash_state(struct fsverity_hash_alg *alg,
+const struct fsverity_hash_alg *fsverity_get_hash_alg(const struct inode *inode,
+						      unsigned int num);
+const u8 *fsverity_prepare_hash_state(const struct fsverity_hash_alg *alg,
 				      const u8 *salt, size_t salt_size);
 int fsverity_hash_block(const struct merkle_tree_params *params,
 			const struct inode *inode, const void *data, u8 *out);
-int fsverity_hash_buffer(struct fsverity_hash_alg *alg,
+int fsverity_hash_buffer(const struct fsverity_hash_alg *alg,
 			 const void *data, size_t size, u8 *out);
 void __init fsverity_check_hash_algs(void);
 
diff --git a/fs/verity/hash_algs.c b/fs/verity/hash_algs.c
index e7e982412e23a..c598d20354763 100644
--- a/fs/verity/hash_algs.c
+++ b/fs/verity/hash_algs.c
@@ -39,8 +39,8 @@ static DEFINE_MUTEX(fsverity_hash_alg_init_mutex);
  *
  * Return: pointer to the hash alg on success, else an ERR_PTR()
  */
-struct fsverity_hash_alg *fsverity_get_hash_alg(const struct inode *inode,
-						unsigned int num)
+const struct fsverity_hash_alg *fsverity_get_hash_alg(const struct inode *inode,
+						      unsigned int num)
 {
 	struct fsverity_hash_alg *alg;
 	struct crypto_shash *tfm;
@@ -108,7 +108,7 @@ struct fsverity_hash_alg *fsverity_get_hash_alg(const struct inode *inode,
  * Return: NULL if the salt is empty, otherwise the kmalloc()'ed precomputed
  *	   initial hash state on success or an ERR_PTR() on failure.
  */
-const u8 *fsverity_prepare_hash_state(struct fsverity_hash_alg *alg,
+const u8 *fsverity_prepare_hash_state(const struct fsverity_hash_alg *alg,
 				      const u8 *salt, size_t salt_size)
 {
 	u8 *hashstate = NULL;
@@ -206,7 +206,7 @@ int fsverity_hash_block(const struct merkle_tree_params *params,
  *
  * Return: 0 on success, -errno on failure
  */
-int fsverity_hash_buffer(struct fsverity_hash_alg *alg,
+int fsverity_hash_buffer(const struct fsverity_hash_alg *alg,
 			 const void *data, size_t size, u8 *out)
 {
 	return crypto_shash_tfm_digest(alg->tfm, data, size, out);
diff --git a/fs/verity/open.c b/fs/verity/open.c
index 52048b7630dcc..f0383bef86eaa 100644
--- a/fs/verity/open.c
+++ b/fs/verity/open.c
@@ -32,7 +32,7 @@ int fsverity_init_merkle_tree_params(struct merkle_tree_params *params,
 				     unsigned int log_blocksize,
 				     const u8 *salt, size_t salt_size)
 {
-	struct fsverity_hash_alg *hash_alg;
+	const struct fsverity_hash_alg *hash_alg;
 	int err;
 	u64 blocks;
 	u64 blocks_in_level[FS_VERITY_MAX_LEVELS];
@@ -158,7 +158,7 @@ int fsverity_init_merkle_tree_params(struct merkle_tree_params *params,
  * Compute the file digest by hashing the fsverity_descriptor excluding the
  * signature and with the sig_size field set to 0.
  */
-static int compute_file_digest(struct fsverity_hash_alg *hash_alg,
+static int compute_file_digest(const struct fsverity_hash_alg *hash_alg,
 			       struct fsverity_descriptor *desc,
 			       u8 *file_digest)
 {

base-commit: c61c38330e582e664fdb97bcb9faf9fa0e4ee175
-- 
2.41.0

