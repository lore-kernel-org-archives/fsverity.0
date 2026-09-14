Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A25DE48EC8E
	for <fsverity@lists.linux.dev>; Mon, 14 Sep 2026 16:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789404128; cv=none; b=W4knaQ9ioU3FtSh1nvAcqau37kAVnbGeACRc46w2myFnNXudYw/IEUDgoUuj+sK61uCwuZSy9XwgqUbbvJ3GtiSg4AKufoxPFpVWtJiU5thzUfKry5VNxskGb65m8qyX0ik6jKIq3Gb0VZkDc1vdjshyuDa6bfnEwq6CSJsHic8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789404128; c=relaxed/simple;
	bh=zafmxxNjheNFUeJK3AIQJ8pVbd1q5BFmpHhmp6iOmBM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=snAylQ9xFrgcZhrtYz8xI2F+7LkjwXvy33tkyruIG9PG+zJ0lx+3GP53f537Buo9bRevvSxowY4X9kyEZfykFDJLJeZDvfaJEC5/sN1gQy1SuMoe/hJ+aIxBKfiU81j/0BX3D7+i9TFOIgeN/B3ED1PYlgEZToLfZTUKEwJqYJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com; spf=pass smtp.mailfrom=amutable.com; dkim=pass (2048-bit key) header.d=amutable-com.20251104.gappssmtp.com header.i=@amutable-com.20251104.gappssmtp.com header.b=sU07sfnn; arc=none smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20251104.gappssmtp.com header.i=@amutable-com.20251104.gappssmtp.com header.b="sU07sfnn"
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-66e56a1fe3fso1962035d50.3
        for <fsverity@lists.linux.dev>; Mon, 14 Sep 2026 09:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20251104.gappssmtp.com; s=20251104; t=1789404123; x=1790008923; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qFr7b5bBk2c57QN/ffKr2kggj2VzIZRrazmGOtkcSoQ=;
        b=sU07sfnnmMYNEReqbtwTt8Uu1SuT7VGHiNia7Z/EqISKdhuSYJdVtVcnBGqiapP1PU
         BkciqJOpIQtFQkc2jgCNaDHlupSrNW0wE0MJL6ibATaTPllx+62AeZWtuzKMWONr8ihY
         s1JU1QD4Fx8rNpoQctloxr0+fNpGqTLPUXG2Kocsn70yIYBiFF9CW+YI+2LrzRLteP9C
         jTRQsLQGfBeHH12kEUF0FN/kUUuXi/PpYMphN61elkxHF1YKdHfWWu0RKTof6AX8q0f4
         q4EtghhsFiIRti1hEGmUTAsLYY9eVpDTLRLq7ovwyQ634086yH3nB1DzkauHDdcLNotQ
         qbPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789404123; x=1790008923;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qFr7b5bBk2c57QN/ffKr2kggj2VzIZRrazmGOtkcSoQ=;
        b=X1kpkTNeFEXh77QH/JAu8/M0GSbzVHJHwK6opPTgDb1thk0ZabGJyjLJi7xWg57g+u
         gkhmAB/BW86XWXGINZWb5l2aPjrdIKhEvjwGsW+PGz9WqkuIvy5P2JALcrOyxow+FKhJ
         yFRUbgAaJe4cDMmz89Q1uKZoyXuFz5hjueOOtqGhT01iGFviyAPE06PE/+dh91G+NXQZ
         IArSRDDA2E9DoE11TThS2dhnwk3IFsZW9nzDojasbnesz0BlaOEnLN8WNyNheHizJzRm
         c129OMkQ5mjhbfG7/p4Ckfk5uob911UaY83hrjpPuE5DSzw3Bn00LK/3+NF0Cp0xPoVN
         kl5w==
X-Forwarded-Encrypted: i=1; AKwUvBzTKCwE+mjS/z1NMP06E9h/c4XZfGjJO7tLQiT2b/ZxqBwoc11WmcM0BRKkWDdJZB25BiPrt9sYag==@lists.linux.dev
X-Gm-Message-State: AFuF++n5ZDj7Tzp/Ti2K1RkO8t7KVS6LI9LztdmmUzK9z/Vlh+0jy6ag
	bMN/DryLmKkwEmxRkmdTQQyq2AmcaficynV2vni6lLs8HtC8ZK7yETv9+2imgOFbY9wy
X-Gm-Gg: AYBFou2Kkib+hGNFhAZjvbMnh71a81wyg6FrKHu4NaqkclGCXx/ix92CTQGKwggsMSL
	tywDaJKRRLYBzLZezKN4irAbbLsdc7Ij3SB8VMEaQ6/X6Pxou+z3j4CvgilolPRZk/B6z2YCuWG
	aXEUyaDgeBq1SU3c+ThW5KLt0I2rXS4+myxmkBM43Vg8Gee/NADPeeivdja53K86wRtYkyi6qD2
	59sTa7Fb5QqVbQhYBc9o2j0O2CAqesAWzZgQ1Ao2iRmV67IRd0zhwA/WlpwcDy37DZKGlkhZ87f
	eCiVvDduQ17jQDFwQQsDk3PQLQvw7xV41YzwqCwYO2hlfYNZ+2+mo2e5vuoZ9p+S2bpIKETJ8M4
	ar1lYVneKOaLdLbVH8LZwEskqVl1ZQajKojOkfUvJB/bctunTRR+h1ak1me3vaaHSvkanDoVFO/
	3RVRs7rYAVcrxj5v7ftTDZOlUrNorDG0FjgIv/Wf3DRrYl60oDodMaCeAID4fl
X-Received: by 2002:a05:690e:1388:b0:668:1c09:aef1 with SMTP id 956f58d0204a3-6714dfc8bb9mr968611d50.6.1789404122960;
        Mon, 14 Sep 2026 09:42:02 -0700 (PDT)
Received: from [192.168.1.110] ([2600:1700:1ff0:d0ef::d15])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67125df42a8sm4879023d50.8.2026.09.14.09.42.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 09:42:02 -0700 (PDT)
From: Andrew Halaney <andrew@amutable.com>
Date: Mon, 14 Sep 2026 11:41:43 -0500
Subject: [PATCH 2/3] keys: add KEY_SPEC_FS_VERITY_KEYRING
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-ajhalaney-dmverity-key-identifier-v1-2-01922dc1366a@amutable.com>
References: <20260914-ajhalaney-dmverity-key-identifier-v1-0-01922dc1366a@amutable.com>
In-Reply-To: <20260914-ajhalaney-dmverity-key-identifier-v1-0-01922dc1366a@amutable.com>
To: Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>, 
 Mikulas Patocka <mpatocka@redhat.com>, 
 Benjamin Marzinski <bmarzins@redhat.com>, 
 David Howells <dhowells@redhat.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
 Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
 "Serge E. Hallyn" <serge@hallyn.com>, Eric Biggers <ebiggers@kernel.org>, 
 "Theodore Y. Ts'o" <tytso@mit.edu>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: dm-devel@lists.linux.dev, linux-kernel@vger.kernel.org, 
 keyrings@vger.kernel.org, linux-security-module@vger.kernel.org, 
 bpf@vger.kernel.org, fsverity@lists.linux.dev, linux-doc@vger.kernel.org, 
 Andrew Halaney <andrew@amutable.com>, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>
X-Mailer: b4 0.14.3

Same problem as the dm-verity keyring: .fs-verity is allocated unlinked,
so the only way for userspace to name it is to scrape /proc/keys.

Suggested-by: Christian Brauner (Amutable) <brauner@kernel.org>
Signed-off-by: Andrew Halaney <andrew@amutable.com>
---
 fs/verity/signature.c        |  2 ++
 include/linux/key.h          |  1 +
 include/uapi/linux/keyctl.h  |  1 +
 security/keys/process_keys.c | 25 +++++++++++++++++++++++++
 4 files changed, 29 insertions(+)

diff --git a/fs/verity/signature.c b/fs/verity/signature.c
index 0302a4e506ec..07657e913b22 100644
--- a/fs/verity/signature.c
+++ b/fs/verity/signature.c
@@ -135,4 +135,6 @@ void __init fsverity_init_signature(void)
 			      KEY_ALLOC_NOT_IN_QUOTA, NULL, NULL);
 	if (IS_ERR(fsverity_keyring))
 		panic("failed to allocate \".fs-verity\" keyring");
+
+	key_register_fs_verity_keyring(fsverity_keyring);
 }
diff --git a/include/linux/key.h b/include/linux/key.h
index ae8d3314fd93..dd386c56278c 100644
--- a/include/linux/key.h
+++ b/include/linux/key.h
@@ -442,6 +442,7 @@ extern int keyring_restrict(key_ref_t keyring, const char *type,
 
 extern void key_register_bpf_keyring(struct key *keyring);
 extern void key_register_dm_verity_keyring(struct key *keyring);
+extern void key_register_fs_verity_keyring(struct key *keyring);
 
 extern struct key *key_lookup(key_serial_t id);
 
diff --git a/include/uapi/linux/keyctl.h b/include/uapi/linux/keyctl.h
index 75923941f1b3..00cc0942203e 100644
--- a/include/uapi/linux/keyctl.h
+++ b/include/uapi/linux/keyctl.h
@@ -26,6 +26,7 @@
 #define KEY_SPEC_REQUESTOR_KEYRING	-8	/* - key ID for request_key() dest keyring */
 #define KEY_SPEC_BPF_KEYRING		-9	/* - key ID for the BPF-specific keyring */
 #define KEY_SPEC_DM_VERITY_KEYRING	-10	/* - key ID for the .dm-verity keyring */
+#define KEY_SPEC_FS_VERITY_KEYRING	-11	/* - key ID for the .fs-verity keyring */
 
 /* request-key default keyrings */
 #define KEY_REQKEY_DEFL_NO_CHANGE		-1
diff --git a/security/keys/process_keys.c b/security/keys/process_keys.c
index dba3df41638b..655c58a96fcb 100644
--- a/security/keys/process_keys.c
+++ b/security/keys/process_keys.c
@@ -29,6 +29,9 @@ static struct key *bpf_keyring __ro_after_init;
 static struct key *dm_verity_keyring;
 static DEFINE_SPINLOCK(dm_verity_keyring_lock);
 
+/* fs-verity keyring reachable through KEY_SPEC_FS_VERITY_KEYRING */
+static struct key *fs_verity_keyring __ro_after_init;
+
 /* The root user's tracking struct */
 struct key_user root_key_user = {
 	.usage		= REFCOUNT_INIT(3),
@@ -629,6 +632,20 @@ void key_register_dm_verity_keyring(struct key *keyring)
 }
 EXPORT_SYMBOL_GPL(key_register_dm_verity_keyring);
 
+/**
+ * key_register_fs_verity_keyring - Publish the keyring for KEY_SPEC_FS_VERITY_KEYRING
+ * @keyring: The keyring to publish
+ *
+ * Make @keyring reachable by userspace through the KEY_SPEC_FS_VERITY_KEYRING
+ * special key ID, so that provisioning it does not require scraping its
+ * serial out of /proc/keys first. Called once, from an initcall, and never
+ * undone.
+ */
+void key_register_fs_verity_keyring(struct key *keyring)
+{
+	fs_verity_keyring = keyring;
+}
+
 /*
  * Look up a key ID given us by userspace with a given permissions mask to get
  * the key it refers to.
@@ -799,6 +816,14 @@ key_ref_t lookup_user_key(key_serial_t id, unsigned long lflags,
 		key_ref = make_key_ref(key, 0);
 		break;
 
+	case KEY_SPEC_FS_VERITY_KEYRING:
+		key = fs_verity_keyring;
+		if (!key)
+			goto error;
+		__key_get(key);
+		key_ref = make_key_ref(key, 0);
+		break;
+
 	default:
 		key_ref = ERR_PTR(-EINVAL);
 		if (id < 1)

-- 
2.55.0

