Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D74323754
	for <fsverity@lists.linux.dev>; Fri, 13 Oct 2023 18:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39DGthK2009156
	for <fsverity@lists.linux.dev>; Fri, 13 Oct 2023 11:29:36 -0700
Received: from maileast.thefacebook.com ([163.114.130.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3tq4q6c3ud-8
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <fsverity@lists.linux.dev>; Fri, 13 Oct 2023 11:29:35 -0700
Received: from twshared17786.35.frc1.facebook.com (2620:10d:c0a8:1b::30) by
 mail.thefacebook.com (2620:10d:c0a8:83::8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 13 Oct 2023 11:29:35 -0700
Received: by devbig932.frc1.facebook.com (Postfix, from userid 4523)
	id 41A0525F40264; Fri, 13 Oct 2023 11:27:02 -0700 (PDT)
From: Song Liu <song@kernel.org>
To: <bpf@vger.kernel.org>, <fsverity@lists.linux.dev>
CC: <ast@kernel.org>, <daniel@iogearbox.net>, <andrii@kernel.org>,
        <martin.lau@kernel.org>, <kernel-team@meta.com>, <ebiggers@kernel.org>,
        <tytso@mit.edu>, <roberto.sassu@huaweicloud.com>,
        Song Liu <song@kernel.org>
Subject: [PATCH bpf-next 1/5] bpf: Add kfunc bpf_get_file_xattr
Date: Fri, 13 Oct 2023 11:26:40 -0700
Message-ID: <20231013182644.2346458-2-song@kernel.org>
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
X-Proofpoint-ORIG-GUID: afUWUEH3s3UjrSJEKPn70E0Fb2ItrVPU
X-Proofpoint-GUID: afUWUEH3s3UjrSJEKPn70E0Fb2ItrVPU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-13_09,2023-10-12_01,2023-05-22_02

This kfunc can be used to read xattr of a file.

Since vfs_getxattr() requires null-terminated string as input "name", a n=
ew
helper bpf_dynptr_is_string() is added to check the input before calling
vfs_getxattr().

Signed-off-by: Song Liu <song@kernel.org>
---
 include/linux/bpf.h      | 12 +++++++++++
 kernel/trace/bpf_trace.c | 44 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 56 insertions(+)

diff --git a/include/linux/bpf.h b/include/linux/bpf.h
index 61bde4520f5c..f14fae45e13d 100644
--- a/include/linux/bpf.h
+++ b/include/linux/bpf.h
@@ -2472,6 +2472,13 @@ static inline bool has_current_bpf_ctx(void)
 	return !!current->bpf_ctx;
 }
=20
+static inline bool bpf_dynptr_is_string(struct bpf_dynptr_kern *ptr)
+{
+	char *str =3D ptr->data;
+
+	return str[__bpf_dynptr_size(ptr) - 1] =3D=3D '\0';
+}
+
 void notrace bpf_prog_inc_misses_counter(struct bpf_prog *prog);
=20
 void bpf_dynptr_init(struct bpf_dynptr_kern *ptr, void *data,
@@ -2708,6 +2715,11 @@ static inline bool has_current_bpf_ctx(void)
 	return false;
 }
=20
+static inline bool bpf_dynptr_is_string(struct bpf_dynptr_kern *ptr)
+{
+	return false;
+}
+
 static inline void bpf_prog_inc_misses_counter(struct bpf_prog *prog)
 {
 }
diff --git a/kernel/trace/bpf_trace.c b/kernel/trace/bpf_trace.c
index df697c74d519..946268574e05 100644
--- a/kernel/trace/bpf_trace.c
+++ b/kernel/trace/bpf_trace.c
@@ -24,6 +24,7 @@
 #include <linux/key.h>
 #include <linux/verification.h>
 #include <linux/namei.h>
+#include <linux/fileattr.h>
=20
 #include <net/bpf_sk_storage.h>
=20
@@ -1429,6 +1430,49 @@ static int __init bpf_key_sig_kfuncs_init(void)
 late_initcall(bpf_key_sig_kfuncs_init);
 #endif /* CONFIG_KEYS */
=20
+/* filesystem kfuncs */
+__diag_push();
+__diag_ignore_all("-Wmissing-prototypes",
+		  "kfuncs which will be used in BPF programs");
+
+/**
+ * bpf_get_file_xattr - get xattr of a file
+ * @name_ptr: name of the xattr
+ * @value_ptr: output buffer of the xattr value
+ *
+ * Get xattr *name_ptr* of *file* and store the output in *value_ptr*.
+ *
+ * Return: 0 on success, a negative value on error.
+ */
+__bpf_kfunc int bpf_get_file_xattr(struct file *file, struct bpf_dynptr_=
kern *name_ptr,
+				   struct bpf_dynptr_kern *value_ptr)
+{
+	if (!bpf_dynptr_is_string(name_ptr))
+		return -EINVAL;
+
+	return vfs_getxattr(mnt_idmap(file->f_path.mnt), file_dentry(file), nam=
e_ptr->data,
+			    value_ptr->data, __bpf_dynptr_size(value_ptr));
+}
+
+__diag_pop();
+
+BTF_SET8_START(fs_kfunc_set)
+BTF_ID_FLAGS(func, bpf_get_file_xattr, KF_SLEEPABLE)
+BTF_SET8_END(fs_kfunc_set)
+
+const struct btf_kfunc_id_set bpf_fs_kfunc_set =3D {
+	.owner =3D THIS_MODULE,
+	.set =3D &fs_kfunc_set,
+};
+
+static int __init bpf_fs_kfuncs_init(void)
+{
+	return register_btf_kfunc_id_set(BPF_PROG_TYPE_TRACING,
+					 &bpf_fs_kfunc_set);
+}
+
+late_initcall(bpf_fs_kfuncs_init);
+
 static const struct bpf_func_proto *
 bpf_tracing_func_proto(enum bpf_func_id func_id, const struct bpf_prog *=
prog)
 {
--=20
2.34.1

