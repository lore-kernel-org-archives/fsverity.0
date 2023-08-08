Received: from box.fidei.email (box.fidei.email [71.19.144.250])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEEA414F6B
	for <fsverity@lists.linux.dev>; Tue,  8 Aug 2023 17:31:27 +0000 (UTC)
Received: from authenticated-user (box.fidei.email [71.19.144.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by box.fidei.email (Postfix) with ESMTPSA id B1571809E9;
	Tue,  8 Aug 2023 13:22:13 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dorminy.me; s=mail;
	t=1691515333; bh=726Inc6P68BCi0kM+SUSni3m2wN66ATgsTZpdV1YXhA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=w2iw0OWh+nUjaKDkhWMKMEaHCUJawApxUAUe/nrDey15oXBcy2yG3RjrFIwfIKt8F
	 pFSpf/AT+avhEWMfnWOmaYswBMTJDEJs18SbdCMKua579tjYZf2FrFFmYYMVHkWVnk
	 Bm1zBhLLx8XlN2lS/V76bO4jUujZTnjpbHYepR13pzH35WA2C/iY4EI0r68FJbV+I8
	 88/poEu/zzBw6nh7rV/UpCJslz70ATeq1Z++e3i3UUWlBZD9ykSXWoLyGoYOWAxlB9
	 gAfxCQHl0feLgtOS5vLV0DsvIzfjz6ICKtvVs87/Zqh04CHZ3CluUSMEKWn3hL4x9a
	 LGzme54L6kTsQ==
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
Subject: [RFC PATCH v3 4/9] common/encrypt: enable making a encrypted btrfs filesystem
Date: Tue,  8 Aug 2023 13:21:23 -0400
Message-ID: <810d879650dd3bd8da1df2e4611d55adaf670ae4.1691530000.git.sweettea-kernel@dorminy.me>
In-Reply-To: <cover.1691530000.git.sweettea-kernel@dorminy.me>
References: <cover.1691530000.git.sweettea-kernel@dorminy.me>
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
2.41.0

