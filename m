Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B185235359
	for <fsverity@lists.linux.dev>; Mon, 17 Feb 2025 18:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739816758; cv=none; b=Xbo1PVdPJUiO6xhXf1soorQTBqZAaWa2DRlESgm5Qa8/o7ZAIhe+Xz6ZUA78/C0b3g4nhJWA0UyPu2uTQebkO15bUyR42tM95KuhjkXRzHsOR63S5zmtTLGbhCgIAbUxG11GACJgQJi6vTLnVUUlDSWvwYroeHR3ynbz3a7nuzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739816758; c=relaxed/simple;
	bh=kkcq1Tk9NoLFSIlbVJpDr+bh3gt2/Xc3CusWYbBXnbw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nUUeJFYSk9ECuZ9eiHWHDqp0GC1M5XdZYA3V6EtiLoopW4nNOK8eHFCBNwmwRQE0qHl0kQHAPhO5HSzY+nHeD9kz4SC8OaMHVF0YAPZCU4lcqN3JGz7tq8nz0U9S99bcnTi3xzS8niGNqkzR4mzl5IymAvFUcJS8ezJG3Z74k38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gZY17KS5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gZY17KS5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E52BC4CED1;
	Mon, 17 Feb 2025 18:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739816757;
	bh=kkcq1Tk9NoLFSIlbVJpDr+bh3gt2/Xc3CusWYbBXnbw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gZY17KS5CJNI8TzXdVPqhCnkbmJQXFwDG2sRvaqcD0MAhBkDMC1dJGYjJaZ765biq
	 0dcdfnvNGsUtecLk1H13iubbWL3rXpiXvBYja35I9UPRifJuy9/oinTLJTCEy0C1OO
	 kmkUL5GbImMOnQ0cQVxZM5Xynn3klFLFrJB5AGGegPfm+XuQX4SBm/5//3KPtjNRYz
	 /dN7KGcIqLoe0/ccfrxpdwoaQYCb4D+3KBDB7dtZP3ZccTOJ2YNxZfQoSIpjWnNrcq
	 h5Cfrh3qteI/ZoEuFoK3e/ONeFvZtq4e+nAvltq3TX8RLfp0+lMRxsMeGalk01kvyV
	 Rj6+2kmpL68vg==
Date: Mon, 17 Feb 2025 10:25:56 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: "Theodore Y. Ts'o" <tytso@mit.edu>, fsverity@lists.linux.dev,
	Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH] fsverity: Select CRYPTO_HASH
Message-ID: <20250217182556.GB1258@sol.localdomain>
References: <Z7L0KTq1iI0paFmX@gondor.apana.org.au>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z7L0KTq1iI0paFmX@gondor.apana.org.au>

On Mon, Feb 17, 2025 at 04:32:41PM +0800, Herbert Xu wrote:
> Explicitly select CRYPTO_HASH as it is possible for the CRYPTO API
> to be enabled without hashing.
> 
> Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>
> 
> diff --git a/fs/verity/Kconfig b/fs/verity/Kconfig
> index e1036e535352..d4a05d5b1286 100644
> --- a/fs/verity/Kconfig
> +++ b/fs/verity/Kconfig
> @@ -3,6 +3,7 @@
>  config FS_VERITY
>  	bool "FS Verity (read-only file-based authenticity protection)"
>  	select CRYPTO
> +	select CRYPTO_HASH
>  	select CRYPTO_HASH_INFO
>  	# SHA-256 is implied as it's intended to be the default hash algorithm.
>  	# To avoid bloat, other wanted algorithms must be selected explicitly.
>  	# Note that CRYPTO_SHA256 denotes the generic C implementation, but
>  	# some architectures provided optimized implementations of the same
>  	# algorithm that may be used instead. In this case, CRYPTO_SHA256 may
>  	# be omitted even if SHA-256 is being used.
>  	imply CRYPTO_SHA256

This only affects the case where someone didn't enable SHA-256, which is broken
anyway.  So I guess you made that configuration mistake, but I've also seen
someone make the equivalent mistake for fscrypt
(https://lore.kernel.org/fstests/1207325.1737387826@warthog.procyon.org.uk/).
So this seems like a problem.  Let's just prevent this by reverting the
following commits:

    commit e3a606f2c544b231f6079c8c5fea451e772e1139
    Author: Ard Biesheuvel <ardb@kernel.org>
    Date:   Wed Apr 21 09:55:11 2021 +0200

        fsverity: relax build time dependency on CRYPTO_SHA256

    commit a0fc20333ee4bac1147c4cf75dea098c26671a2f
    Author: Ard Biesheuvel <ardb@kernel.org>
    Date:   Wed Apr 21 09:55:10 2021 +0200

        fscrypt: relax Kconfig dependencies for crypto API algorithms

The crypto API needs to be fixed to give the expected behavior when selecting an
algorithm: it must enable the arch-optimized implementation if present, and also
the generic implementation *if* the arch-optimized implementation is not
guaranteed to be usable at runtime.  But until that is done, the best that
FS_ENCRYPTION_ALGS and FS_VERITY can do is just select the generic
implementation.  (Well, they could also select the arch-optimized
implementations to work around the Crypto API defect...)

- Eric
