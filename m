Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 678DF22F1E
	for <fsverity@lists.linux.dev>; Fri, 13 Oct 2023 18:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from pps.filterd (m0148460.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39DGtPnw022931
	for <fsverity@lists.linux.dev>; Fri, 13 Oct 2023 11:30:00 -0700
Received: from mail.thefacebook.com ([163.114.132.120])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3tpt25dpe7-7
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <fsverity@lists.linux.dev>; Fri, 13 Oct 2023 11:30:00 -0700
Received: from twshared15247.17.frc2.facebook.com (2620:10d:c085:108::4) by
 mail.thefacebook.com (2620:10d:c085:11d::8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 13 Oct 2023 11:29:38 -0700
Received: by devbig932.frc1.facebook.com (Postfix, from userid 4523)
	id 577FC25F402A4; Fri, 13 Oct 2023 11:27:07 -0700 (PDT)
From: Song Liu <song@kernel.org>
To: <bpf@vger.kernel.org>, <fsverity@lists.linux.dev>
CC: <ast@kernel.org>, <daniel@iogearbox.net>, <andrii@kernel.org>,
        <martin.lau@kernel.org>, <kernel-team@meta.com>, <ebiggers@kernel.org>,
        <tytso@mit.edu>, <roberto.sassu@huaweicloud.com>,
        Song Liu <song@kernel.org>
Subject: [PATCH bpf-next 3/5] selftests/bpf: Sort config in alphabetic order
Date: Fri, 13 Oct 2023 11:26:42 -0700
Message-ID: <20231013182644.2346458-4-song@kernel.org>
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
X-Proofpoint-GUID: zsprJ2hKtVqYJJrTOLjuVdKtYHTJKKI_
X-Proofpoint-ORIG-GUID: zsprJ2hKtVqYJJrTOLjuVdKtYHTJKKI_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-13_09,2023-10-12_01,2023-05-22_02

Move CONFIG_VSOCKETS up, so the CONFIGs are in sorted order.

Signed-off-by: Song Liu <song@kernel.org>
---
 tools/testing/selftests/bpf/config | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/bpf/config b/tools/testing/selftests=
/bpf/config
index 02dd4409200e..09da30be8728 100644
--- a/tools/testing/selftests/bpf/config
+++ b/tools/testing/selftests/bpf/config
@@ -81,7 +81,7 @@ CONFIG_SECURITY=3Dy
 CONFIG_SECURITYFS=3Dy
 CONFIG_TEST_BPF=3Dm
 CONFIG_USERFAULTFD=3Dy
+CONFIG_VSOCKETS=3Dy
 CONFIG_VXLAN=3Dy
 CONFIG_XDP_SOCKETS=3Dy
 CONFIG_XFRM_INTERFACE=3Dy
-CONFIG_VSOCKETS=3Dy
--=20
2.34.1

