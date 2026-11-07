Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794079558;
	b=ZsziNcYlhenHFNEWhs4PdSHqPKbgF2lXqNha6iHDtTAZUBq1Q2J0ZgpZqpOrt16MnirO
	 cDSAurxgeopJfB5hgpvYAA6+A0g/YKUp/g51MAJWWq2jpM0YjozTjaXyi0cfEfWWLxBkK
	 bTl/bvgUMSUM720evtnxC+c0b9XIarm+pK3e0NziRQPxAsB5vUWif/n5u3HANj4wuE4wy
	 IJjGxYRdOuQKhrH1Xhi3rMmo392yK/gOG6jA8pvXQlfxDFcpx74DJoly1hIqyQ0iN+2hy
	 5zD2G4i1omesZ4xuBPPSGYtw/mfpzqyWKigsTVKP9WSSxVDNFuu23X6cP7omeDH3duA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794079558;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=BCmeYqz8ISq3xLhbD9eBRJCwVcGkoCgusO2QRT6Vnfw=;
	b=J69rmOtO6rCJXKjhC8QUVqb1EsXYHmQvU1Rtp6t9t2fRzrgWpK4OrFVSy2If0bu3DcFB
	 7XXL4kCEzi0dGVNDns8dDbeRWN9s58BCHzJ5jSyLTtxx3aj6Q7mXvjvL0Y/r1LocIKmP0
	 +TgEDqs6FO3qr7z7bohULU/gaCeR1N+xgxtOnnz9fjzQY+8h0ZgBcxoWNu8YJpwoCZoj4
	 ZZv5XYh2yNvrAPC5GIdn98OJyiTn5I8lbWnFb4XmS0P7zVB2sWTcTkITRMUMEgYPQtcv6
	 G/UKQIM4W5EZR/lkBCu/Oen3oHu42Jx3G0XnwnBs0jkB9n4EAlUrXFA+mADhZcuEfTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W3wKpdEH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163E0606A326;
	Sat,  7 Nov 2026 19:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W3wKpdEH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F5311F0089F;
	Sat,  7 Nov 2026 19:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794079557;
	bh=BCmeYqz8ISq3xLhbD9eBRJCwVcGkoCgusO2QRT6Vnfw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=W3wKpdEHsaJiZzmrXxCz6TPjkj5Npg7mGHogFhxionubMUwLImUDz7g/YGRBKEqbp
	 8NgfFmnsYDVuhQyu63LpZQy80i5nSwhGWi3jAoWGLBh/Rw8zJQVPy6mOGzyVTbdvuU
	 nZKUdjSi3wuQolpOEEaoBuwapCtG4L/Aa189mfHR3CdB5eh9Sm0TlE/tiNwNNn5tpx
	 r5UV1uSwGhzD8/kebcw72/p976EuHxTxGKTh8Zx9pmcG9o6e1/hnbvXH38uVnVhJmp
	 qd62zzeaux9akdk3bbDuEdfp1fVEOJI7ZaOSzPOmfGaFLqNz3wzT5bITss4jZ2SHQB
	 HUZ8f9zcJvY6w==
Date: Sat, 7 Nov 2026 11:25:56 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: fsverity@lists.linux.dev, Andrey Albershteyn <aalbersh@kernel.org>
Subject: Re: [PATCH 6.1] fsverity: Explicitly require FMODE_READ to retrieve
 hashes
Message-ID: <20261107192556.GC6049@quark>
References: <20261107191050.25921-1-ebiggers@kernel.org>
 <sashiko-outbox-203203@kernel.org>
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Post: <mailto:fsverity@lists.linux.dev>
List-Help: <mailto:fsverity+help@lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fsverity+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-203203@kernel.org>

On Sat, Nov 07, 2026 at 07:21:27PM +0000, sashiko-bot@kernel.org wrote:
> [Severity: Medium]
> Does fsverity_ioctl_enable() also need an explicit FMODE_READ check in this
> branch?
> 
> In mainline, fsverity_ioctl_enable() gained a check for FMODE_READ when
> Merkle tree construction was converted to use __kernel_read().  That
> change is not in this tree, where fsverity_ioctl_enable() only checks
> file_permission(filp, MAY_WRITE) and deny_write_access(filp), and
> build_merkle_tree_level() reads directly from the page cache via
> read_file_data_page().

I'll consider backporting 04839139213c ("fsverity: reject
FS_IOC_ENABLE_VERITY on mode 3 fds") separately.  It is independent of
this patch.

- Eric
