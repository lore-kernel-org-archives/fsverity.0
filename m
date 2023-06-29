Received: from box.fidei.email (box.fidei.email [71.19.144.250])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE9BFC1A
	for <fsverity@lists.linux.dev>; Thu, 29 Jun 2023 22:17:40 +0000 (UTC)
Received: from authenticated-user (box.fidei.email [71.19.144.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by box.fidei.email (Postfix) with ESMTPSA id 0CC9F80914;
	Thu, 29 Jun 2023 18:17:39 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dorminy.me; s=mail;
	t=1688077060; bh=hRco+aZiR6zV/s62lKw1LnEYYKOCoUoqvQXPvj2ZlrQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vuIqxToMglK02MrFL5y+Xub1vxVFFnOM/mHIMHpYxkgQda0MTneevXKyRbPrrDS4N
	 Lz+V+NO8tBpJk+snLq3c7rQWOoWW9mZHaAUE9o4iVOKAjapqucZWzX8DMMCnS5R5vz
	 a5JcLghZjjZeDfaQNkDZRsS0euBp843nKK3Te+5uC3cvHU02FWHD22awLeh5oEILfg
	 vZOerJtCOQDjzzcdRN/6hkpsZGlVK3hRYluryWhrgafYZ2DT74Pz6youFA8cat/QtX
	 aNckrX1erchgaDwp50zVEI0XIdTg5G8T82+3L7iJEamDVSJEAJJcouT+c0iPwDF495
	 1vTyAvhKEFWRQ==
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
Subject: [RFC PATCH 5/8] generic/613: write some actual data for btrfs
Date: Thu, 29 Jun 2023 18:17:20 -0400
Message-Id: <548d104df621ba7532ff1b4ba2076cd3a24a98a0.1688076612.git.sweettea-kernel@dorminy.me>
In-Reply-To: <cover.1688076612.git.sweettea-kernel@dorminy.me>
References: <cover.1688076612.git.sweettea-kernel@dorminy.me>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, the test touches a file and assumes that that is sufficient
to generate a new nonce to test for that file. However, btrfs doesn't
store an encryption context for a leaf inode, and doesn't store an
encryption context for data within a leaf inode until data is actually
written. Thus, merely touching the file on btrfs doesn't actually
generate a testable nonce.

Instead, write a trivial bit of data to each file, which provokes btrfs
to generate a encryption context for the data and thus a testable nonce.

Signed-off-by: Sweet Tea Dorminy <sweettea-kernel@dorminy.me>
---
 tests/generic/613 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/generic/613 b/tests/generic/613
index 279b1bfb..11f28c74 100755
--- a/tests/generic/613
+++ b/tests/generic/613
@@ -53,11 +53,11 @@ for i in {1..50}; do
 done
 for i in {1..50}; do
 	file=$SCRATCH_MNT/v1_policy_dir_1/$i
-	touch $file
+	echo "0" > $file
 	inodes+=("$(stat -c %i $file)")
 
 	file=$SCRATCH_MNT/v2_policy_dir_1/$i
-	touch $file
+	echo "0" > $file
 	inodes+=("$(stat -c %i $file)")
 done
 _scratch_unmount
-- 
2.40.1

