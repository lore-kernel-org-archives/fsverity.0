Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62CD01DA4E
	for <fsverity@lists.linux.dev>; Wed, 29 Jan 2025 04:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738123458; cv=none; b=q2bIBaKUKH871cQzygdA5f3ZmxOEpkYBMt9w7rZAOdzIdsVwlOKCvSNVMO0uehhC4taPocmTTeNIkU+oOuLhjeopMyH+yHam2KvzqMZbA0Wxln2xOB6yWdlG7evEVPC7s8Gy2ZcFuf6ZU5SEsHPuu7cdrcOF0U+kZb7cGDsAYik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738123458; c=relaxed/simple;
	bh=/2BRx+7k3AMH4tjpfVtA67toYsKBkqeAs1+pigAYko8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MiC8xv0SEZOGRulQsB7hVfDs6e90AJmSP3Bh5gHZ/UKLdqlckrlr+sp+yatOGocsUk+qiQ3Dan/le8FmPmVg5eyiJkWpyz6SrWdNGToSlY3swAx1dBaMh4x1uWiJuxKQ4A3BbPLR8f9WqvPSWMjOI3NIdCbmCD9bK6euSQhzSL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qbxmpitb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qbxmpitb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B35D0C4CED3;
	Wed, 29 Jan 2025 04:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738123457;
	bh=/2BRx+7k3AMH4tjpfVtA67toYsKBkqeAs1+pigAYko8=;
	h=From:To:Cc:Subject:Date:From;
	b=qbxmpitb5PxfiSOQhycoxjQYQwDYPqEJ32xETLUscMo4l5XGG6y9s6UGsoS2wumD6
	 9dUseXcw3D/ZR7oGEgAY1WDQuTEdfuxTK4rahEwOLRGiK2Q5Me/XzThBQlaRCPyoSk
	 qrLcGSQh2RATfFr7tdvRjNsTT2nvhbO2NN770YWwQcrEY2JMqhSujz7l8RTgF1EBkn
	 Adxo9WGthpFzOWRShCGtT5IdBDc6nsP893xZ26ZJg3APsN3fQasP9Hfh0jhtAqRIQg
	 kJdiS/r591qTxbp+DphcsrVK4SBLllbRhrielpjTyapq4r2Ld2i4fE5f/iaR3t9N83
	 pN/7zOrepLqag==
From: Eric Biggers <ebiggers@kernel.org>
To: fsverity@lists.linux.dev
Cc: Disha Goel <disgoel@linux.ibm.com>,
	Aleksander Adamowski <olo@fb.com>
Subject: [fsverity-utils PATCH] lib/sign_digest: disable PKCS#11 support when not available in OpenSSL
Date: Tue, 28 Jan 2025 20:03:01 -0800
Message-ID: <20250129040301.311001-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Eric Biggers <ebiggers@google.com>

This is needed to fix the build on Fedora, due to
https://fedoraproject.org/wiki/Changes/OpensslNoEngine.

There may be a new way to support PKCS#11 tokens, but I'll leave that to
someone who cares about that feature (if anyone still cares about it).

Link: https://lore.kernel.org/r/d42c3dd4-47b4-4e98-9814-99cd9c1d112d@linux.ibm.com
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 lib/sign_digest.c | 24 +++++++++++++-----------
 man/fsverity.1    |  4 ++--
 2 files changed, 15 insertions(+), 13 deletions(-)

diff --git a/lib/sign_digest.c b/lib/sign_digest.c
index d726772..9699671 100644
--- a/lib/sign_digest.c
+++ b/lib/sign_digest.c
@@ -219,19 +219,10 @@ out:
 	OPENSSL_free(name_der);
 	OPENSSL_free(pkcs7_data);
 	return err;
 }
 
-static int
-load_pkcs11_private_key(const struct libfsverity_signature_params *sig_params
-			__attribute__((unused)),
-			EVP_PKEY **pkey_ret __attribute__((unused)))
-{
-	libfsverity_error_msg("BoringSSL doesn't support PKCS#11 tokens");
-	return -EINVAL;
-}
-
 #else /* OPENSSL_IS_BORINGSSL */
 
 static BIO *new_mem_buf(const void *buf, size_t size)
 {
 	BIO *bio;
@@ -331,10 +322,22 @@ out:
 	PKCS7_free(p7);
 	BIO_free(bio);
 	return err;
 }
 
+#endif /* !OPENSSL_IS_BORINGSSL */
+
+#ifdef OPENSSL_NO_ENGINE
+static int
+load_pkcs11_private_key(const struct libfsverity_signature_params *sig_params
+			__attribute__((unused)),
+			EVP_PKEY **pkey_ret __attribute__((unused)))
+{
+	libfsverity_error_msg("libfsverity was linked to a version of OpenSSL that doesn't support PKCS#11 tokens.");
+	return -EINVAL;
+}
+#else
 static int
 load_pkcs11_private_key(const struct libfsverity_signature_params *sig_params,
 			EVP_PKEY **pkey_ret)
 {
 	ENGINE *engine;
@@ -373,12 +376,11 @@ load_pkcs11_private_key(const struct libfsverity_signature_params *sig_params,
 		error_msg_openssl("failed to load private key from PKCS#11 token");
 		return -EINVAL;
 	}
 	return 0;
 }
-
-#endif /* !OPENSSL_IS_BORINGSSL */
+#endif
 
 /* Get a private key, either from disk or from a PKCS#11 token. */
 static int
 get_private_key(const struct libfsverity_signature_params *sig_params,
 		EVP_PKEY **pkey_ret)
diff --git a/man/fsverity.1 b/man/fsverity.1
index 0bb9f01..1214b24 100644
--- a/man/fsverity.1
+++ b/man/fsverity.1
@@ -207,12 +207,12 @@ The signature will be written to \f[I]OUT_SIGFILE\f[R] in PKCS#7 DER format.
 The private key can be specified either by key file or by PKCS#11 token.
 To use a key file, provide \f[B]--key\f[R] and optionally \f[B]--cert\f[R].
 To use a PKCS#11 token, provide \f[B]--pkcs11-engine\f[R],
 \f[B]--pkcs11-module\f[R], \f[B]--cert\f[R], and optionally
 \f[B]--pkcs11-keyid\f[R].
-PKCS#11 token support is unavailable when fsverity-utils was built with
-BoringSSL rather than OpenSSL.
+PKCS#11 token support is unavailable if fsverity-utils was built with a version
+of OpenSSL that does not support PKCS#11 tokens.
 .PP
 \f[B]fsverity sign\f[R] should only be used if you need compatibility with
 fs-verity built-in signatures.
 It is not the only way to do signatures with fs-verity.
 For more information, see the fsverity-utils README.
-- 
2.48.1

