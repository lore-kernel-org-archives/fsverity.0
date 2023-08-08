Received: from box.fidei.email (box.fidei.email [71.19.144.250])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 266D314A9C
	for <fsverity@lists.linux.dev>; Tue,  8 Aug 2023 17:22:19 +0000 (UTC)
Received: from authenticated-user (box.fidei.email [71.19.144.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by box.fidei.email (Postfix) with ESMTPSA id 705CC83548;
	Tue,  8 Aug 2023 13:22:19 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dorminy.me; s=mail;
	t=1691515339; bh=3QofvkrzEbKIE7kiT4biu6yi+YODuBy1obePJtOF1UE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ox+m8WtBmbG7cZnsJbBcOj/l0/QHDpBcImOeWhZSNbacQkiGW8tQgicKq0STZoI3l
	 qjCu16zKNyQZ5JpTTwme80vD81hqFWgaCaRD+Pa/2t5fpcEXBlSt4I9Fb62gD3EBx1
	 fhNyPQVEzCKIrxWzg1GI3YHyuT9AR+3aPOybW2iJhkAe8EzD/SeokMgb4ZrN6Ed/Zt
	 hFMTo/+lVMedyMELC7KBo2AslcmI3MU8Ymj+898PEEUaAfldb5+XMJWWjADq0C9fyb
	 DKKc4Nu4AoyUaSIlOsWsnl58SKYNVCZYpPQuvhDFGqkZ94uPoOSxuMxzPKGxAf7CN+
	 GnyQJrRkGY0MA==
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
Subject: [RFC PATCH v3 8/9] btrfs: add simple test of reflink of encrypted data
Date: Tue,  8 Aug 2023 13:21:27 -0400
Message-ID: <df2e27704eafd0ffe5d7826933294580c8fcdea5.1691530000.git.sweettea-kernel@dorminy.me>
In-Reply-To: <cover.1691530000.git.sweettea-kernel@dorminy.me>
References: <cover.1691530000.git.sweettea-kernel@dorminy.me>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make sure that we succeed at reflinking encrypted data.

Test deliberately numbered with a high number so it won't conflict with
tests between now and merge.
---
 tests/btrfs/613     | 59 +++++++++++++++++++++++++++++++++++++++++++++
 tests/btrfs/613.out | 13 ++++++++++
 2 files changed, 72 insertions(+)
 create mode 100755 tests/btrfs/613
 create mode 100644 tests/btrfs/613.out

diff --git a/tests/btrfs/613 b/tests/btrfs/613
new file mode 100755
index 00000000..0288016e
--- /dev/null
+++ b/tests/btrfs/613
@@ -0,0 +1,59 @@
+#! /bin/bash
+# SPDX-License-Identifier: GPL-2.0
+# Copyright (c) 2023 Meta Platforms, Inc.  All Rights Reserved.
+#
+# FS QA Test 613
+#
+# Check if reflinking one encrypted file on btrfs succeeds.
+#
+. ./common/preamble
+_begin_fstest auto encrypt
+
+# Import common functions.
+. ./common/encrypt
+. ./common/filter
+. ./common/reflink
+
+# real QA test starts here
+
+# Modify as appropriate.
+_supported_fs btrfs
+
+_require_test
+_require_scratch
+_require_cp_reflink
+_require_scratch_encryption -v 2
+_require_command "$KEYCTL_PROG" keyctl
+
+_scratch_mkfs_encrypted &>> $seqres.full
+_scratch_mount
+
+dir=$SCRATCH_MNT/dir
+mkdir $dir
+_set_encpolicy $dir $TEST_KEY_IDENTIFIER
+_add_enckey $SCRATCH_MNT "$TEST_RAW_KEY"
+echo "Creating and reflinking a file"
+$XFS_IO_PROG -t -f -c "pwrite 0 33k" $dir/test > /dev/null
+cp --reflink=always $dir/test $dir/test2
+
+echo "Can't reflink encrypted and unencrypted"
+cp --reflink=always $dir/test $SCRATCH_MNT/fail |& _filter_scratch
+
+echo "Diffing the file and its copy"
+diff $dir/test $dir/test2
+
+echo "Verifying the files are reflinked"
+_verify_reflink $dir/test $dir/test2
+
+echo "Diffing the files after remount"
+_scratch_cycle_mount
+_add_enckey $SCRATCH_MNT "$TEST_RAW_KEY"
+diff $dir/test $dir/test2
+
+echo "Diffing the files after key remove"
+_rm_enckey $SCRATCH_MNT $TEST_KEY_IDENTIFIER
+diff $dir/test $dir/test2 |& _filter_scratch
+
+# success, all done
+status=0
+exit
diff --git a/tests/btrfs/613.out b/tests/btrfs/613.out
new file mode 100644
index 00000000..4895d6dd
--- /dev/null
+++ b/tests/btrfs/613.out
@@ -0,0 +1,13 @@
+QA output created by 613
+Added encryption key with identifier 69b2f6edeee720cce0577937eb8a6751
+Creating and reflinking a file
+Can't reflink encrypted and unencrypted
+cp: failed to clone 'SCRATCH_MNT/fail' from 'SCRATCH_MNT/dir/test': Invalid argument
+Diffing the file and its copy
+Verifying the files are reflinked
+Diffing the files after remount
+Added encryption key with identifier 69b2f6edeee720cce0577937eb8a6751
+Diffing the files after key remove
+Removed encryption key with identifier 69b2f6edeee720cce0577937eb8a6751
+diff: SCRATCH_MNT/dir/test: No such file or directory
+diff: SCRATCH_MNT/dir/test2: No such file or directory
-- 
2.41.0

