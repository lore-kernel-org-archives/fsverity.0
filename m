Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE47723751
	for <fsverity@lists.linux.dev>; Fri, 13 Oct 2023 18:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39DGthJx009156
	for <fsverity@lists.linux.dev>; Fri, 13 Oct 2023 11:29:34 -0700
Received: from maileast.thefacebook.com ([163.114.130.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3tq4q6c3ud-6
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <fsverity@lists.linux.dev>; Fri, 13 Oct 2023 11:29:34 -0700
Received: from twshared29562.14.frc2.facebook.com (2620:10d:c0a8:1b::2d) by
 mail.thefacebook.com (2620:10d:c0a8:83::8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 13 Oct 2023 11:29:31 -0700
Received: by devbig932.frc1.facebook.com (Postfix, from userid 4523)
	id 1EAEB25F40253; Fri, 13 Oct 2023 11:27:01 -0700 (PDT)
From: Song Liu <song@kernel.org>
To: <bpf@vger.kernel.org>, <fsverity@lists.linux.dev>
CC: <ast@kernel.org>, <daniel@iogearbox.net>, <andrii@kernel.org>,
        <martin.lau@kernel.org>, <kernel-team@meta.com>, <ebiggers@kernel.org>,
        <tytso@mit.edu>, <roberto.sassu@huaweicloud.com>,
        Song Liu <song@kernel.org>
Subject: [PATCH bpf-next 0/5] bpf: file verification with LSM and fsverity
Date: Fri, 13 Oct 2023 11:26:39 -0700
Message-ID: <20231013182644.2346458-1-song@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-FB-Internal: Safe
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: EDbrec2ucuYp8F8hmca6wx2DI1oIGPgu
X-Proofpoint-GUID: EDbrec2ucuYp8F8hmca6wx2DI1oIGPgu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-13_09,2023-10-12_01,2023-05-22_02

This set enables file verification with BPF LSM and fsverity.

In this solution, fsverity is used to provide reliable and efficient hash
of files; and BPF LSM is used to implement signature verification (agains=
t
asymmetric keys), and to enforce access control.

This solution can be used to implement access control in complicated case=
s.
For example: only signed python binary and signed python script and acces=
s
special files/devices/ports.

Thanks,
Song

Song Liu (5):
  bpf: Add kfunc bpf_get_file_xattr
  bpf, fsverity: Add kfunc bpf_get_fsverity_digest
  selftests/bpf: Sort config in alphabetic order
  selftests/bpf: Add tests for filesystem kfuncs
  selftests/bpf: Add test that use fsverity and xattr to sign a file

 fs/verity/measure.c                           |  66 +++++++
 include/linux/bpf.h                           |  12 ++
 kernel/trace/bpf_trace.c                      |  44 +++++
 tools/testing/selftests/bpf/bpf_kfuncs.h      |  10 ++
 tools/testing/selftests/bpf/config            |   3 +-
 .../selftests/bpf/prog_tests/fs_kfuncs.c      | 132 ++++++++++++++
 .../bpf/prog_tests/verify_pkcs7_sig.c         | 163 +++++++++++++++++-
 .../selftests/bpf/progs/test_fsverity.c       |  46 +++++
 .../selftests/bpf/progs/test_get_xattr.c      |  39 +++++
 .../selftests/bpf/progs/test_sig_in_xattr.c   |  84 +++++++++
 .../bpf/progs/test_verify_pkcs7_sig.c         |   8 +-
 .../testing/selftests/bpf/verify_sig_setup.sh |  25 +++
 12 files changed, 623 insertions(+), 9 deletions(-)
 create mode 100644 tools/testing/selftests/bpf/prog_tests/fs_kfuncs.c
 create mode 100644 tools/testing/selftests/bpf/progs/test_fsverity.c
 create mode 100644 tools/testing/selftests/bpf/progs/test_get_xattr.c
 create mode 100644 tools/testing/selftests/bpf/progs/test_sig_in_xattr.c

--
2.34.1
