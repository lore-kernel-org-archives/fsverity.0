Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6387815B54A
	for <fsverity@lists.linux.dev>; Mon, 17 Feb 2025 08:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.6.53.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739781178; cv=none; b=W84qXZO+eVrX/HDLWiv5m1tdBPPhtHCXlkASk5LjHplH9Qdp5jWU21Ts48kCHwxTxu9Ubh7xDVV35Sx9RzcFQJkBVkc+WfxA7HM8zo0Dwa8w7ovb2LFFSh3wFBSbXuzpTKUItDSifZKybcu5+4zYpQewcQQN6k8jjIknb5VMbXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739781178; c=relaxed/simple;
	bh=O4BW+W6ORu7k/zg3WnTyDqVVqUqpZG8gbakbLM/gsrY=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cn1DHEJdqIRuf13L3MUY7P9oaLw4FTZii8Aph89YehmZme4NEPDj/LGodnwDKO9SaoBk4k1pTWZVmGY+bi29z5XDH93DPAnwUT3SThAnSY1V9nxUTKJDlBBeaiG4Lod5167VV0cWfxDTNavtubQP0qPg4dy9Oyh37LP4L6f2RDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b=mV6pLIM+; arc=none smtp.client-ip=144.6.53.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b="mV6pLIM+"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=Content-Type:MIME-Version:Message-ID:Subject:To:From:Date:
	Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=I9fHg/zLYkt57q7/dHO5mCkw2yzaFjQaaXTkV+HFN58=; b=mV6pLIM+qu3YKem85W7Mh8pCE2
	CcoP1z5wMvUQaq5KnwsrM/8ZW1QYCFBnxeEERwjY3y6y23hVThq++ZMF63F+JStVr/KAhr5zKk1fa
	ZHlr6Yki9+BonfcuvY8fxNXaK6vhp0deAT2Fu3bGh7hcJuCf5SbRzqPRzNn/8Gd3zS4E2Alj7bk4f
	UzQ/uyKlhhYGdJhtTc+dmrMrKEwjWDRHLyffOmU5bKfbANP9ycDaqoSn4pxticTQrah7uX6S/u3l5
	EVVCQ+bWkJIP6rIcI7aXK9U0nn7nB1FZkuzA+TB3zMisGMTF5rTVeEX93hinkgLqaYqOApsh2kwbO
	TXeZnPog==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1tjwLY-000ubj-0q;
	Mon, 17 Feb 2025 16:32:42 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Mon, 17 Feb 2025 16:32:41 +0800
Date: Mon, 17 Feb 2025 16:32:41 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Eric Biggers <ebiggers@kernel.org>, "Theodore Y. Ts'o" <tytso@mit.edu>,
	fsverity@lists.linux.dev
Subject: [PATCH] fsverity: Select CRYPTO_HASH
Message-ID: <Z7L0KTq1iI0paFmX@gondor.apana.org.au>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Explicitly select CRYPTO_HASH as it is possible for the CRYPTO API
to be enabled without hashing.

Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>

diff --git a/fs/verity/Kconfig b/fs/verity/Kconfig
index e1036e535352..d4a05d5b1286 100644
--- a/fs/verity/Kconfig
+++ b/fs/verity/Kconfig
@@ -3,6 +3,7 @@
 config FS_VERITY
 	bool "FS Verity (read-only file-based authenticity protection)"
 	select CRYPTO
+	select CRYPTO_HASH
 	select CRYPTO_HASH_INFO
 	# SHA-256 is implied as it's intended to be the default hash algorithm.
 	# To avoid bloat, other wanted algorithms must be selected explicitly.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
