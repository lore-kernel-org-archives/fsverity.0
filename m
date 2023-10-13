Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31B7523751
	for <fsverity@lists.linux.dev>; Fri, 13 Oct 2023 18:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39DGtL6W019115
	for <fsverity@lists.linux.dev>; Fri, 13 Oct 2023 11:29:44 -0700
Received: from maileast.thefacebook.com ([163.114.130.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3tq8kd9uxr-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <fsverity@lists.linux.dev>; Fri, 13 Oct 2023 11:29:44 -0700
Received: from twshared32169.15.frc2.facebook.com (2620:10d:c0a8:1c::11) by
 mail.thefacebook.com (2620:10d:c0a8:83::8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 13 Oct 2023 11:29:41 -0700
Received: by devbig932.frc1.facebook.com (Postfix, from userid 4523)
	id 32E1225F40286; Fri, 13 Oct 2023 11:27:05 -0700 (PDT)
From: Song Liu <song@kernel.org>
To: <bpf@vger.kernel.org>, <fsverity@lists.linux.dev>
CC: <ast@kernel.org>, <daniel@iogearbox.net>, <andrii@kernel.org>,
        <martin.lau@kernel.org>, <kernel-team@meta.com>, <ebiggers@kernel.org>,
        <tytso@mit.edu>, <roberto.sassu@huaweicloud.com>,
        Song Liu <song@kernel.org>
Subject: [PATCH bpf-next 2/5] bpf, fsverity: Add kfunc bpf_get_fsverity_digest
Date: Fri, 13 Oct 2023 11:26:41 -0700
Message-ID: <20231013182644.2346458-3-song@kernel.org>
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
X-Proofpoint-GUID: LgNcTpG_SmocJq4nB4XKKBbb39TWUwmh
X-Proofpoint-ORIG-GUID: LgNcTpG_SmocJq4nB4XKKBbb39TWUwmh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-13_09,2023-10-12_01,2023-05-22_02

The kfunc can be used to read fsverity_digest, so that we can verify
signature in BPF LSM.

This kfunc is added to fs/verity/measure.c because some data structure us=
ed
in the function is private to fsverity (fs/verity/fsverity_private.h).

Signed-off-by: Song Liu <song@kernel.org>
---
 fs/verity/measure.c | 66 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/fs/verity/measure.c b/fs/verity/measure.c
index eec5956141da..2d4b2e6f5a5d 100644
--- a/fs/verity/measure.c
+++ b/fs/verity/measure.c
@@ -8,6 +8,8 @@
 #include "fsverity_private.h"
=20
 #include <linux/uaccess.h>
+#include <linux/bpf.h>
+#include <linux/btf.h>
=20
 /**
  * fsverity_ioctl_measure() - get a verity file's digest
@@ -100,3 +102,67 @@ int fsverity_get_digest(struct inode *inode,
 	return hash_alg->digest_size;
 }
 EXPORT_SYMBOL_GPL(fsverity_get_digest);
+
+/* bpf kfuncs */
+__diag_push();
+__diag_ignore_all("-Wmissing-prototypes",
+		  "kfuncs which will be used in BPF programs");
+
+/**
+ * bpf_get_fsverity_digest: read fsverity digest of file
+ * @file: file to get digest from
+ * @digest_ptr: (out) dynptr for struct fsverity_digest
+ *
+ * Read fsverity_digest of *file* into *digest_ptr*.
+ *
+ * Return: 0 on success, a negative value on error.
+ */
+__bpf_kfunc int bpf_get_fsverity_digest(struct file *file, struct bpf_dy=
nptr_kern *digest_ptr)
+{
+	const struct inode *inode =3D file_inode(file);
+	struct fsverity_digest *arg =3D digest_ptr->data;
+	const struct fsverity_info *vi;
+	const struct fsverity_hash_alg *hash_alg;
+	int out_digest_sz;
+
+	if (__bpf_dynptr_size(digest_ptr) < sizeof(struct fsverity_digest))
+		return -EINVAL;
+
+	vi =3D fsverity_get_info(inode);
+	if (!vi)
+		return -ENODATA; /* not a verity file */
+
+	hash_alg =3D vi->tree_params.hash_alg;
+
+	arg->digest_algorithm =3D hash_alg - fsverity_hash_algs;
+	arg->digest_size =3D hash_alg->digest_size;
+
+	out_digest_sz =3D __bpf_dynptr_size(digest_ptr) - sizeof(struct fsverit=
y_digest);
+
+	/* copy digest */
+	memcpy(arg->digest, vi->file_digest,  min_t(int, hash_alg->digest_size,=
 out_digest_sz));
+
+	/* fill the extra buffer with zeros */
+	memset(arg->digest + arg->digest_size, 0, out_digest_sz - hash_alg->dig=
est_size);
+
+	return 0;
+}
+
+__diag_pop();
+
+BTF_SET8_START(fsverity_set)
+BTF_ID_FLAGS(func, bpf_get_fsverity_digest, KF_SLEEPABLE)
+BTF_SET8_END(fsverity_set)
+
+const struct btf_kfunc_id_set bpf_fsverity_set =3D {
+	.owner =3D THIS_MODULE,
+	.set =3D &fsverity_set,
+};
+
+static int __init bpf_fsverity_init(void)
+{
+	return register_btf_kfunc_id_set(BPF_PROG_TYPE_TRACING,
+					 &bpf_fsverity_set);
+}
+
+late_initcall(bpf_fsverity_init);
--=20
2.34.1

