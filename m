Received: from mail-vs1-f73.google.com (mail-vs1-f73.google.com [209.85.217.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F3AC941
	for <fsverity@lists.linux.dev>; Thu,  9 Mar 2023 21:38:01 +0000 (UTC)
Received: by mail-vs1-f73.google.com with SMTP id w9-20020a67f749000000b0041ec573a9a4so1187505vso.20
        for <fsverity@lists.linux.dev>; Thu, 09 Mar 2023 13:38:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1678397881;
        h=cc:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CjVCnK2+PbOEo6iotAw4ZlEJBJGbRLCsJRiwiC573nQ=;
        b=iDcGqwWXeOsrMo3PN2YChvdaLFVn6SiHlk8xRG5mOVvc/jBmkFrCIToFxSQkpuoTlb
         4zw6bqgh0sJ3WMiMxFTsjoVrB3KafRWn7wOlEkVbTaNV7mMEClflIEE6i5VrFtbvYLtb
         oshsajQGUkkfRDx4ynUr9lz5lwkiXFh6xK+TJI0VLKx9QgIAuQp74oyqPoQ7KwCKREZ+
         +DVqswVM1NBcGpDdnHFQydNnRZpgVwA/6f9V3iq8RmcoVGzk/Kpf5o68tDFWT1fuV+tl
         sWvq0dnI/r/uHI0N7IixYAy4mO/NhrUQGLHY3YLe8Vi7TliNmBxZoW8tP7DPDv8nCN2/
         aq2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678397881;
        h=cc:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CjVCnK2+PbOEo6iotAw4ZlEJBJGbRLCsJRiwiC573nQ=;
        b=I9xeTsAouEIKbnva6jau9xqUXIp3oBn6MzoUyPVybIoj4F6ieJ5zAwgd7XJLwpELng
         3TkgbxjAq9wLWPTEuUD0HHnwKR7ueaER8Pziny+w8pynN8GWzvFUn+MmDsGcXRtDMAc+
         8q2OAt6qukEmLHI2DBc80Rd2e9Tr6JnXDXs4YOXcYO+AllLJhZ2AZW8RBx2rAZVwgAcw
         Mpz/2PaekZJzxbPIr3vN/DTOvT7H/CkVdPh5GHaKNWKm8gowUcCwDUr5vhcxzqOGjnAd
         YR8WlYasvbelTnhJvUsTx66bsvK2UnBiouP7CSf9X+n/PZTOYGO/A4HoGr6BbCz2No2n
         xGlA==
X-Gm-Message-State: AO0yUKVVs3n7gw2/lJfVvBwZcxGPTPPi84TDoktw/fEf2+Y6Uzo/R6Y7
	ehJR04rP0cS0X9BEHobf59zALt8thQ==
X-Google-Smtp-Source: AK7set/3xwbqPZOVKcj1jnhlEuaFuyYb20cAVkbFpCLioY4Jn4WxHw12DhUrdl/Zy4Ont1x5IyWefzt/QQ==
X-Received: from nhuck.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:39cc])
 (user=nhuck job=sendgmr) by 2002:a67:e94c:0:b0:421:c4a7:872b with SMTP id
 p12-20020a67e94c000000b00421c4a7872bmr13271594vso.6.1678397880952; Thu, 09
 Mar 2023 13:38:00 -0800 (PST)
Date: Thu,  9 Mar 2023 13:37:41 -0800
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.40.0.rc1.284.g88254d51c5-goog
Message-ID: <20230309213742.572091-1-nhuck@google.com>
Subject: [PATCH] fsverity: Remove WQ_UNBOUND from fsverity read workqueue
From: Nathan Huckleberry <nhuck@google.com>
Cc: Nathan Huckleberry <nhuck@google.com>, Eric Biggers <ebiggers@kernel.org>, 
	"Theodore Y. Ts'o" <tytso@mit.edu>, fsverity@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

WQ_UNBOUND causes significant scheduler latency on ARM64/Android.  This
is problematic for latency sensitive workloads like I/O post-processing.

Removing WQ_UNBOUND gives a 96% reduction in fsverity workqueue related
scheduler latency and improves app cold startup times by ~30ms.

This code was tested by running Android app startup benchmarks and
measuring how long the fsverity workqueue spent in the ready queue.

Before
Total workqueue scheduler latency: 553800us
After
Total workqueue scheduler latency: 18962us

Change-Id: I693efee541757851ed6d229430111cd763d39067
Signed-off-by: Nathan Huckleberry <nhuck@google.com>
---
 fs/verity/verify.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/verity/verify.c b/fs/verity/verify.c
index f50e3b5b52c9..e8ec37774d63 100644
--- a/fs/verity/verify.c
+++ b/fs/verity/verify.c
@@ -395,7 +395,7 @@ int __init fsverity_init_workqueue(void)
 	 * which blocks reads from completing, over regular application tasks.
 	 */
 	fsverity_read_workqueue = alloc_workqueue("fsverity_read_queue",
-						  WQ_UNBOUND | WQ_HIGHPRI,
+						  WQ_HIGHPRI,
 						  num_online_cpus());
 	if (!fsverity_read_workqueue)
 		return -ENOMEM;
-- 
2.40.0.rc1.284.g88254d51c5-goog

