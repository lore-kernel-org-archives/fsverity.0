Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B7223753
	for <fsverity@lists.linux.dev>; Fri, 13 Oct 2023 18:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39DGtJ7U018865
	for <fsverity@lists.linux.dev>; Fri, 13 Oct 2023 11:30:06 -0700
Received: from maileast.thefacebook.com ([163.114.130.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3tq8kd9v38-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <fsverity@lists.linux.dev>; Fri, 13 Oct 2023 11:30:06 -0700
Received: from twshared22837.17.frc2.facebook.com (2620:10d:c0a8:1b::30) by
 mail.thefacebook.com (2620:10d:c0a8:82::b) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 13 Oct 2023 11:29:44 -0700
Received: by devbig932.frc1.facebook.com (Postfix, from userid 4523)
	id 24A6325F402B4; Fri, 13 Oct 2023 11:27:09 -0700 (PDT)
From: Song Liu <song@kernel.org>
To: <bpf@vger.kernel.org>, <fsverity@lists.linux.dev>
CC: <ast@kernel.org>, <daniel@iogearbox.net>, <andrii@kernel.org>,
        <martin.lau@kernel.org>, <kernel-team@meta.com>, <ebiggers@kernel.org>,
        <tytso@mit.edu>, <roberto.sassu@huaweicloud.com>,
        Song Liu <song@kernel.org>
Subject: [PATCH bpf-next 4/5] selftests/bpf: Add tests for filesystem kfuncs
Date: Fri, 13 Oct 2023 11:26:43 -0700
Message-ID: <20231013182644.2346458-5-song@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231013182644.2346458-1-song@kernel.org>
References: <20231013182644.2346458-1-song@kernel.org>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-FB-Internal: Safe
Content-Type: text/plain
X-Proofpoint-GUID: K7SGWElbZ-icyWkgAuEABC47Mt7v55iE
X-Proofpoint-ORIG-GUID: K7SGWElbZ-icyWkgAuEABC47Mt7v55iE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-13_09,2023-10-12_01,2023-05-22_02

Add selftests for two new filesystem kfuncs:
  1. bpf_get_file_xattr
  2. bpf_get_fsverity_digest

These tests simply make sure the two kfuncs work.

CONFIG_FS_VERITY is added to selftests config. However, this is not
sufficient to garantee bpf_get_fsverity_digest works. This is because
fsverity need to be enabled at file system level (for example, with tune2=
fs
on ext4). If local file system doesn't have this feature enabled, just sk=
ip
the test.

Signed-off-by: Song Liu <song@kernel.org>
---
 tools/testing/selftests/bpf/bpf_kfuncs.h      |   3 +
 tools/testing/selftests/bpf/config            |   1 +
 .../selftests/bpf/prog_tests/fs_kfuncs.c      | 132 ++++++++++++++++++
 .../selftests/bpf/progs/test_fsverity.c       |  46 ++++++
 .../selftests/bpf/progs/test_get_xattr.c      |  39 ++++++
 5 files changed, 221 insertions(+)
 create mode 100644 tools/testing/selftests/bpf/prog_tests/fs_kfuncs.c
 create mode 100644 tools/testing/selftests/bpf/progs/test_fsverity.c
 create mode 100644 tools/testing/selftests/bpf/progs/test_get_xattr.c

diff --git a/tools/testing/selftests/bpf/bpf_kfuncs.h b/tools/testing/sel=
ftests/bpf/bpf_kfuncs.h
index 5ca68ff0b59f..ce27b0f3ffc0 100644
--- a/tools/testing/selftests/bpf/bpf_kfuncs.h
+++ b/tools/testing/selftests/bpf/bpf_kfuncs.h
@@ -55,4 +55,7 @@ void *bpf_cast_to_kern_ctx(void *) __ksym;
=20
 void *bpf_rdonly_cast(void *obj, __u32 btf_id) __ksym;
=20
+extern int bpf_get_file_xattr(struct file *file, struct bpf_dynptr *name=
_ptr,
+			      struct bpf_dynptr *value_ptr) __ksym;
+extern int bpf_get_fsverity_digest(struct file *file, struct bpf_dynptr =
*digest_ptr) __ksym;
 #endif
diff --git a/tools/testing/selftests/bpf/config b/tools/testing/selftests=
/bpf/config
index 09da30be8728..4534a913e46c 100644
--- a/tools/testing/selftests/bpf/config
+++ b/tools/testing/selftests/bpf/config
@@ -23,6 +23,7 @@ CONFIG_FPROBE=3Dy
 CONFIG_FTRACE_SYSCALLS=3Dy
 CONFIG_FUNCTION_ERROR_INJECTION=3Dy
 CONFIG_FUNCTION_TRACER=3Dy
+CONFIG_FS_VERITY=3Dy
 CONFIG_GENEVE=3Dy
 CONFIG_IKCONFIG=3Dy
 CONFIG_IKCONFIG_PROC=3Dy
diff --git a/tools/testing/selftests/bpf/prog_tests/fs_kfuncs.c b/tools/t=
esting/selftests/bpf/prog_tests/fs_kfuncs.c
new file mode 100644
index 000000000000..3084872ad1f4
--- /dev/null
+++ b/tools/testing/selftests/bpf/prog_tests/fs_kfuncs.c
@@ -0,0 +1,132 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (c) 2023 Meta Platforms, Inc. and affiliates. */
+
+#include <stdlib.h>
+#include <sys/types.h>
+#include <sys/xattr.h>
+#include <linux/fsverity.h>
+#include <unistd.h>
+#include <test_progs.h>
+#include "test_get_xattr.skel.h"
+#include "test_fsverity.skel.h"
+
+static const char testfile[] =3D "/tmp/test_progs_fs_kfuncs";
+
+static void test_xattr(void)
+{
+	struct test_get_xattr *skel =3D NULL;
+	int fd =3D -1, err;
+
+	fd =3D open(testfile, O_CREAT | O_RDONLY, 0644);
+	if (!ASSERT_GE(fd, 0, "create_file"))
+		return;
+
+	close(fd);
+	fd =3D -1;
+
+	err =3D setxattr(testfile, "user.kfuncs", "hello", sizeof("hello"), 0);
+	if (!ASSERT_OK(err, "setxattr"))
+		goto out;
+
+	skel =3D test_get_xattr__open_and_load();
+	if (!ASSERT_OK_PTR(skel, "test_get_xattr__open_and_load"))
+		goto out;
+
+	skel->bss->monitored_pid =3D getpid();
+	err =3D test_get_xattr__attach(skel);
+
+	if (!ASSERT_OK(err, "test_get_xattr__attach"))
+		goto out;
+
+	fd =3D open(testfile, O_RDONLY, 0644);
+	if (!ASSERT_GE(fd, 0, "open_file"))
+		goto out;
+
+	ASSERT_EQ(skel->bss->found_xattr, 1, "found_xattr");
+
+out:
+	close(fd);
+	test_get_xattr__destroy(skel);
+	remove(testfile);
+}
+
+#ifndef SHA256_DIGEST_SIZE
+#define SHA256_DIGEST_SIZE      32
+#endif
+
+static void test_fsverity(void)
+{
+	struct fsverity_enable_arg arg =3D {0};
+	struct test_fsverity *skel =3D NULL;
+	struct fsverity_digest *d;
+	int fd, err;
+	char buffer[4096];
+
+	fd =3D open(testfile, O_CREAT | O_RDWR, 0644);
+	if (!ASSERT_GE(fd, 0, "create_file"))
+		return;
+
+	/* Write random buffer, so the file is not empty */
+	err =3D write(fd, buffer, 4096);
+	if (!ASSERT_EQ(err, 4096, "write_file"))
+		goto out;
+	close(fd);
+
+	/* Reopen read-only, otherwise FS_IOC_ENABLE_VERITY will fail */
+	fd =3D open(testfile, O_RDONLY, 0644);
+	if (!ASSERT_GE(fd, 0, "open_file1"))
+		return;
+
+	/* Enable fsverity for the file.
+	 * If the file system doesn't support verity, this will fail. Skip
+	 * the test in such case.
+	 */
+	arg.version =3D 1;
+	arg.hash_algorithm =3D FS_VERITY_HASH_ALG_SHA256;
+	arg.block_size =3D 4096;
+	err =3D ioctl(fd, FS_IOC_ENABLE_VERITY, &arg);
+	if (err) {
+		printf("%s:SKIP:local fs doesn't support fsverity (%d)\n", __func__, e=
rrno);
+		test__skip();
+		goto out;
+	}
+
+	skel =3D test_fsverity__open_and_load();
+	if (!ASSERT_OK_PTR(skel, "test_fsverity__open_and_load"))
+		goto out;
+
+	/* Get fsverity_digest from ioctl */
+	d =3D (struct fsverity_digest *)skel->bss->expected_digest;
+	d->digest_algorithm =3D FS_VERITY_HASH_ALG_SHA256;
+	d->digest_size =3D SHA256_DIGEST_SIZE;
+	err =3D ioctl(fd, FS_IOC_MEASURE_VERITY, skel->bss->expected_digest);
+	if (!ASSERT_OK(err, "ioctl_FS_IOC_MEASURE_VERITY"))
+		goto out;
+
+	skel->bss->monitored_pid =3D getpid();
+	err =3D test_fsverity__attach(skel);
+	if (!ASSERT_OK(err, "test_fsverity__attach"))
+		goto out;
+
+	/* Reopen the file to trigger the program */
+	close(fd);
+	fd =3D open(testfile, O_RDONLY);
+	if (!ASSERT_GE(fd, 0, "open_file2"))
+		goto out;
+
+	ASSERT_EQ(skel->bss->got_fsverity, 1, "got_fsverity");
+	ASSERT_EQ(skel->bss->digest_matches, 1, "digest_matches");
+out:
+	close(fd);
+	test_fsverity__destroy(skel);
+	remove(testfile);
+}
+
+void test_fs_kfuncs(void)
+{
+	if (test__start_subtest("xattr"))
+		test_xattr();
+
+	if (test__start_subtest("fsverity"))
+		test_fsverity();
+}
diff --git a/tools/testing/selftests/bpf/progs/test_fsverity.c b/tools/te=
sting/selftests/bpf/progs/test_fsverity.c
new file mode 100644
index 000000000000..ddba2edc8e7a
--- /dev/null
+++ b/tools/testing/selftests/bpf/progs/test_fsverity.c
@@ -0,0 +1,46 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (c) 2023 Meta Platforms, Inc. and affiliates. */
+
+#include "vmlinux.h"
+#include <bpf/bpf_helpers.h>
+#include <bpf/bpf_tracing.h>
+#include "bpf_kfuncs.h"
+
+char _license[] SEC("license") =3D "GPL";
+
+#ifndef SHA256_DIGEST_SIZE
+#define SHA256_DIGEST_SIZE      32
+#endif
+
+__u32 monitored_pid;
+char expected_digest[sizeof(struct fsverity_digest) + SHA256_DIGEST_SIZE=
];
+char digest[sizeof(struct fsverity_digest) + SHA256_DIGEST_SIZE];
+__u32 got_fsverity;
+__u32 digest_matches;
+
+SEC("lsm.s/file_open")
+int BPF_PROG(test_file_open, struct file *f)
+{
+	struct bpf_dynptr digest_ptr;
+	__u32 pid;
+	int ret;
+	int i;
+
+	pid =3D bpf_get_current_pid_tgid() >> 32;
+	if (pid !=3D monitored_pid)
+		return 0;
+
+	bpf_dynptr_from_mem(digest, sizeof(digest), 0, &digest_ptr);
+	ret =3D bpf_get_fsverity_digest(f, &digest_ptr);
+	if (ret < 0)
+		return 0;
+	got_fsverity =3D 1;
+
+	for (i =3D 0; i < sizeof(digest); i++) {
+		if (digest[i] !=3D expected_digest[i])
+			return 0;
+	}
+
+	digest_matches =3D 1;
+	return 0;
+}
diff --git a/tools/testing/selftests/bpf/progs/test_get_xattr.c b/tools/t=
esting/selftests/bpf/progs/test_get_xattr.c
new file mode 100644
index 000000000000..dc018877526f
--- /dev/null
+++ b/tools/testing/selftests/bpf/progs/test_get_xattr.c
@@ -0,0 +1,39 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (c) 2023 Meta Platforms, Inc. and affiliates. */
+
+#include "vmlinux.h"
+#include <bpf/bpf_helpers.h>
+#include <bpf/bpf_tracing.h>
+#include "bpf_kfuncs.h"
+
+char _license[] SEC("license") =3D "GPL";
+
+__u32 monitored_pid;
+__u32 found_xattr;
+
+char key[] =3D "user.kfuncs";
+static const char expected_value[] =3D "hello";
+char value[32];
+
+SEC("lsm.s/file_open")
+int BPF_PROG(test_file_open, struct file *f)
+{
+	struct bpf_dynptr key_ptr, value_ptr;
+	__u32 pid;
+	int ret;
+
+	pid =3D bpf_get_current_pid_tgid() >> 32;
+	if (pid !=3D monitored_pid)
+		return 0;
+
+	bpf_dynptr_from_mem(key, sizeof(key), 0, &key_ptr);
+	bpf_dynptr_from_mem(value, sizeof(value), 0, &value_ptr);
+
+	ret =3D bpf_get_file_xattr(f, &key_ptr, &value_ptr);
+	if (ret !=3D sizeof(expected_value))
+		return 0;
+	if (bpf_strncmp(value, ret, expected_value))
+		return 0;
+	found_xattr =3D 1;
+	return 0;
+}
--=20
2.34.1

