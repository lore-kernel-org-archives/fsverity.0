Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D9E5A21
	for <fsverity@lists.linux.dev>; Tue, 28 Mar 2023 04:15:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2C78C433D2;
	Tue, 28 Mar 2023 04:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679976916;
	bh=puTguuFYzEk83Opa2Z66sNQI7s3p5s0IdgSgA2eg0KE=;
	h=From:To:Subject:Date:From;
	b=uqBb87m0ZjAJRq1lRdWGADqe03p5p1Jljlr6O4ab379LFJOgF0dY/RhYHuUPjyKIm
	 qSagJIzz9cBzuI35UbqZYMPQWdfBHplzZoiAm+ZrmUaPCHWTY4EELyNlIBMiZ0cPmC
	 yvAGeR4au0vMMWU0dJ+zF8NjMoAonKfNP6tiWEidxKSCfz7nsPml4E3w8fw/sAYzQH
	 QYvbRWNBfx76sCwIK/BmIUdEMVpLn53T3HvDNXmrCA2Ub0ez8ZkeuITshmarPdx8WJ
	 MRjd8mcsXCqx7RxIoMmTU3qQNa0GJf7XJNzJwa/E8EBHpu/fgNOUqMGTWA1guVxK+k
	 rOC5buO3plCyQ==
From: Eric Biggers <ebiggers@kernel.org>
To: fsverity@lists.linux.dev,
	linux-fsdevel@vger.kernel.org
Subject: [PATCH] fsverity: explicitly check for buffer overflow in build_merkle_tree()
Date: Mon, 27 Mar 2023 21:15:05 -0700
Message-Id: <20230328041505.110162-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.40.0
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Eric Biggers <ebiggers@google.com>

The new Merkle tree construction algorithm is a bit fragile in that it
may overflow the 'root_hash' array if the tree actually generated does
not match the calculated tree parameters.

This should never happen unless there is a filesystem bug that allows
the file size to change despite deny_write_access(), or a bug in the
Merkle tree logic itself.  Regardless, it's fairly easy to check for
buffer overflow here, so let's do so.

This is a robustness improvement only; this case is not currently known
to be reachable.  I've added a Fixes tag anyway, since I recommend that
this be included in kernels that have the mentioned commit.

Fixes: 56124d6c87fd ("fsverity: support enabling with tree block size < PAGE_SIZE")
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/verity/enable.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/fs/verity/enable.c b/fs/verity/enable.c
index 7a0e3a84d370b..30012e734a77a 100644
--- a/fs/verity/enable.c
+++ b/fs/verity/enable.c
@@ -13,6 +13,7 @@
 
 struct block_buffer {
 	u32 filled;
+	bool is_root_hash;
 	u8 *data;
 };
 
@@ -24,6 +25,14 @@ static int hash_one_block(struct inode *inode,
 	struct block_buffer *next = cur + 1;
 	int err;
 
+	/*
+	 * Safety check to prevent a buffer overflow in case of a filesystem bug
+	 * that allows the file size to change despite deny_write_access(), or a
+	 * bug in the Merkle tree logic itself
+	 */
+	if (WARN_ON_ONCE(next->is_root_hash && next->filled != 0))
+		return -EINVAL;
+
 	/* Zero-pad the block if it's shorter than the block size. */
 	memset(&cur->data[cur->filled], 0, params->block_size - cur->filled);
 
@@ -97,6 +106,7 @@ static int build_merkle_tree(struct file *filp,
 		}
 	}
 	buffers[num_levels].data = root_hash;
+	buffers[num_levels].is_root_hash = true;
 
 	BUILD_BUG_ON(sizeof(level_offset) != sizeof(params->level_start));
 	memcpy(level_offset, params->level_start, sizeof(level_offset));

base-commit: 2da81b8479434c62a9ae189ec24729445f74b6a9
-- 
2.40.0

