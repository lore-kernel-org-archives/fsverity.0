Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E499DA9D
	for <fsverity@lists.linux.dev>; Fri, 10 Mar 2023 19:33:35 +0000 (UTC)
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-540e3b152a3so5908817b3.2
        for <fsverity@lists.linux.dev>; Fri, 10 Mar 2023 11:33:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1678476814;
        h=cc:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=80aTzTXNxqQ00vS1sVT9ibDfp321VL5ZJhrr00uLlW0=;
        b=N6xBegLEZPOSg1C2qdTuIfVEO+wPD/Ap1kvkcsB90ItjDOV2G0dZ8lQhUFZcDeywCS
         J2s9GTek7pwX09o+qEw05YoiIbeM+qmn20dKMG/Jqqw0na3Huf6TKz2wnK/2jsDWwDPb
         DAkbgr+6iagXAZO21tXmno+3ZSxjJirx0xllzeHUg18soicJclL3MOwK6Zu7d2Bdzyxq
         krFUWawBzVSUYQxw9ONLssQirnNEVM+0VIhqHqqYy14zWkOZrjozm4ZZ+yZ4nU/014LM
         T2yEugy0x281ZY7hQ/+X9F7yEleIOt3327GfFntguqGYNM2m47uGwzBSYXEzU58Wn3CD
         +42Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678476814;
        h=cc:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=80aTzTXNxqQ00vS1sVT9ibDfp321VL5ZJhrr00uLlW0=;
        b=DwHXnv00eQsspBdqP64DVxJvSBNKQDsrewt6szSlZi3UkU1QojvD9zIIg3flo3ocXO
         KVb/sTBH+eeVJNfeBexe3bOVdgkVrudk5f/coWeJgrM5gpR84RBpr+yPUdbZPq7VMORh
         0oDNWyfV6jcXysCi8CzTlNQ8asN2fFrbTuSCSOfK89xTkDumnb1FZrXIVv3ZQx2xQ/H3
         S7Zmw+x+TM4AQTzlSQ8msVTdFxEVD684B8LxK/kZ3JZO72PXiybIh5dPXIuUru1GM8fC
         JqjGu+Uy1ac0jqJ1fCT1WyclNYvj/ife4VsWZgtIetdMcL9q4C7uayk8mFOz96cVFNmB
         aiQA==
X-Gm-Message-State: AO0yUKUtVe9BLd9P4Su40V7wkqC3MKqY5bihBO0cHAN3Srq2Cssw78ys
	uMpkeOR0YwjLZ+tB/cXkeEQS7FllDQ==
X-Google-Smtp-Source: AK7set9v2grUZTAnu6fTO6bylxZxYVU0C+usTdIONobZWRo8uikE+RQewK643w4HbtOrKdC4m8CFOG9FGQ==
X-Received: from nhuck.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:39cc])
 (user=nhuck job=sendgmr) by 2002:a81:4422:0:b0:534:eef8:caa9 with SMTP id
 r34-20020a814422000000b00534eef8caa9mr16520387ywa.8.1678476814674; Fri, 10
 Mar 2023 11:33:34 -0800 (PST)
Date: Fri, 10 Mar 2023 11:33:25 -0800
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.40.0.rc1.284.g88254d51c5-goog
Message-ID: <20230310193325.620493-1-nhuck@google.com>
Subject: [PATCH v2] fsverity: Remove WQ_UNBOUND from fsverity read workqueue
From: Nathan Huckleberry <nhuck@google.com>
Cc: Nathan Huckleberry <nhuck@google.com>, Eric Biggers <ebiggers@kernel.org>, 
	"Theodore Y. Ts'o" <tytso@mit.edu>, fsverity@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

WQ_UNBOUND causes significant scheduler latency on ARM64/Android.  This
is problematic for latency sensitive workloads, like I/O
post-processing.

Removing WQ_UNBOUND gives a 96% reduction in fsverity workqueue related
scheduler latency and improves app cold startup times by ~30ms.
WQ_UNBOUND was also removed from the dm-verity workqueue for the same
reason [1].

This code was tested by running Android app startup benchmarks and
measuring how long the fsverity workqueue spent in the runnable state.

Before
Total workqueue scheduler latency: 553800us
After
Total workqueue scheduler latency: 18962us

[1]: https://lore.kernel.org/all/20230202012348.885402-1-nhuck@google.com/

Signed-off-by: Nathan Huckleberry <nhuck@google.com>
---
Changelog:
v1 -> v2:
- Added comment about WQ_UNBOUND
- Added info about related dm-verity patches in commit message

 fs/verity/verify.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/fs/verity/verify.c b/fs/verity/verify.c
index f50e3b5b52c9..782b8b4a24c1 100644
--- a/fs/verity/verify.c
+++ b/fs/verity/verify.c
@@ -387,15 +387,15 @@ EXPORT_SYMBOL_GPL(fsverity_enqueue_verify_work);
 int __init fsverity_init_workqueue(void)
 {
 	/*
-	 * Use an unbound workqueue to allow bios to be verified in parallel
-	 * even when they happen to complete on the same CPU.  This sacrifices
-	 * locality, but it's worthwhile since hashing is CPU-intensive.
-	 *
 	 * Also use a high-priority workqueue to prioritize verification work,
 	 * which blocks reads from completing, over regular application tasks.
+	 *
+	 * This workqueue is not marked as unbound for performance reasons.
+	 * Using an unbound workqueue for crypto operations causes excessive
+	 * scheduler latency on ARM64.
 	 */
 	fsverity_read_workqueue = alloc_workqueue("fsverity_read_queue",
-						  WQ_UNBOUND | WQ_HIGHPRI,
+						  WQ_HIGHPRI,
 						  num_online_cpus());
 	if (!fsverity_read_workqueue)
 		return -ENOMEM;
-- 
2.40.0.rc1.284.g88254d51c5-goog

