Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06791110C
	for <fsverity@lists.linux.dev>; Wed,  2 Aug 2023 04:15:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 355C8C433C7;
	Wed,  2 Aug 2023 04:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690949722;
	bh=FwYw1Ys6mearw8rtCro8FNVS+u6xf9XdpTbTQekj87g=;
	h=From:To:Cc:Subject:Date:From;
	b=mRdg+NuHMAQD7AwmkHXeiO+PTi0Mx5e7Zk0S0vkZ7vwDNnw7PxJFepqIXyYHYvKgl
	 LtXOf0yCRNyveC9JUWaL2Qqc5RSYwoxWcXpnI+4cgh4/yx3QbgSPWNbsZJvh+dmL3U
	 gxQpBLr3rLOVz8l1EF4ADxzZEh4YFks9xkyrFG6PFG1JW7wZrPXSS1vWiA/mBtws3o
	 2rv1cVEiVU8XeDHUYQaYbetfl0EHbEAz00OVWi01+chP0MkYNa/hhvwSpyQszO+fXv
	 focjhafydkqJOSbOxBMANzudDhkBhREKLXNmxbm/dUn8ZQzXk5KymNZITBIKTZ3IW3
	 4B8lEm+bv263Q==
From: Eric Biggers <ebiggers@kernel.org>
To: fsverity@lists.linux.dev
Cc: keyrings@vger.kernel.org,
	Victor Hsieh <victorhsieh@google.com>,
	stable@vger.kernel.org,
	Jarkko Sakkinen <jarkko@kernel.org>
Subject: [PATCH v2] fsverity: skip PKCS#7 parser when keyring is empty
Date: Tue,  1 Aug 2023 21:15:03 -0700
Message-ID: <20230802041503.11530-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Eric Biggers <ebiggers@google.com>

If an fsverity builtin signature is given for a file but the
".fs-verity" keyring is empty, there's no real reason to run the PKCS#7
parser.  Skip this to avoid the PKCS#7 attack surface when builtin
signature support is configured into the kernel but is not being used.

This is a hardening improvement, not a fix per se, but I've added
Fixes and Cc stable to get it out to more users.

Fixes: 432434c9f8e1 ("fs-verity: support builtin file signatures")
Cc: stable@vger.kernel.org
Acked-by: Jarkko Sakkinen <jarkko@kernel.org>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---

v2: check keyring and return early before allocating formatted digest

 fs/verity/signature.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/fs/verity/signature.c b/fs/verity/signature.c
index b95acae64eac6..8f474702aa249 100644
--- a/fs/verity/signature.c
+++ b/fs/verity/signature.c
@@ -62,6 +62,21 @@ int fsverity_verify_signature(const struct fsverity_info *vi,
 		return 0;
 	}
 
+	if (fsverity_keyring->keys.nr_leaves_on_tree == 0) {
+		/*
+		 * The ".fs-verity" keyring is empty, due to builtin signatures
+		 * being supported by the kernel but not actually being used.
+		 * In this case, verify_pkcs7_signature() would always return an
+		 * error, usually ENOKEY.  It could also be EBADMSG if the
+		 * PKCS#7 is malformed, but that isn't very important to
+		 * distinguish.  So, just skip to ENOKEY to avoid the attack
+		 * surface of the PKCS#7 parser, which would otherwise be
+		 * reachable by any task able to execute FS_IOC_ENABLE_VERITY.
+		 */
+		fsverity_err(inode, "fs-verity keyring is empty");
+		return -ENOKEY;
+	}
+
 	d = kzalloc(sizeof(*d) + hash_alg->digest_size, GFP_KERNEL);
 	if (!d)
 		return -ENOMEM;

base-commit: 456ae5fe9b448f44ebe98b391a3bae9c75df465e
-- 
2.41.0

