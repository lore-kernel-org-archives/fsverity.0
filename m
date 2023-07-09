Received: from box.fidei.email (box.fidei.email [71.19.144.250])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A41A279E0
	for <fsverity@lists.linux.dev>; Sun,  9 Jul 2023 19:11:21 +0000 (UTC)
Received: from authenticated-user (box.fidei.email [71.19.144.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by box.fidei.email (Postfix) with ESMTPSA id B392C804BF;
	Sun,  9 Jul 2023 15:11:20 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dorminy.me; s=mail;
	t=1688929881; bh=Glc1SgrRxVy/DWhD2BYtb2GOsC9vCs2yRmXOeAyo0vc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SR+SeahYZEFd7F79P3H8/+m7lhkQiNIJBpzmT/M9tRlFC8JT7YpCNyZ7qaRY0dxxB
	 1j9KImSbcueRwIFfkox2YuYN2+bTTYsPJHCk5N/W6K/sQmWLl0iMKCLZ0lm7rTsEMB
	 lHFw62LzwKgWBympChOgY6r8SSlCvkJfyQt2yjGLtz8oGbIpPCNpE+S5FBdKzTQnp3
	 FtSFazc41A0GH9JrbRyr7rkIth8cZrU5fEtyoL9zwEoFG42Uk6s5MBhTXp3ZL97yLm
	 Gee9xfZJpf25ZU7GA1x9DH2q8m0Epufi8D3OTQlSL/lxKwxoKezYisEiw6pv8B85X+
	 56wpbHlVihULw==
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
Subject: [RFC PATCH v2 4/8] common/encrypt: enable making a encrypted btrfs filesystem
Date: Sun,  9 Jul 2023 15:11:07 -0400
Message-Id: <ade755dbe4a98c52acaa88fcf9799c7c9976d7ca.1688929294.git.sweettea-kernel@dorminy.me>
In-Reply-To: <cover.1688929294.git.sweettea-kernel@dorminy.me>
References: <cover.1688929294.git.sweettea-kernel@dorminy.me>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Sweet Tea Dorminy <sweettea-kernel@dorminy.me>
---
 common/encrypt | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/common/encrypt b/common/encrypt
index 2c1925da..1372af66 100644
--- a/common/encrypt
+++ b/common/encrypt
@@ -153,6 +153,9 @@ _scratch_mkfs_encrypted()
 		# erase the UBI volume; reformated automatically on next mount
 		$UBIUPDATEVOL_PROG ${SCRATCH_DEV} -t
 		;;
+	btrfs)
+		_scratch_mkfs
+		;;
 	ceph)
 		_scratch_cleanup_files
 		;;
@@ -168,6 +171,9 @@ _scratch_mkfs_sized_encrypted()
 	ext4|f2fs)
 		MKFS_OPTIONS="$MKFS_OPTIONS -O encrypt" _scratch_mkfs_sized $*
 		;;
+	btrfs)
+		_scratch_mkfs_sized $*
+		;;
 	*)
 		_notrun "Filesystem $FSTYP not supported in _scratch_mkfs_sized_encrypted"
 		;;
-- 
2.40.1

