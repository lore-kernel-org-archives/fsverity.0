Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B23571ADC65
	for <fsverity@lists.linux.dev>; Thu, 23 Jan 2025 18:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737656678; cv=none; b=Xd5hF8tEorEaYgcdUreOJ/596pET3x8a+qCnuI9f4K4mzkR0jtTuu9/BYY4meYYj1IKO2ZqXZK5VwLC+XIUfQLf4NI9wmVkMfYMswPsolrdlQCZe7Rk88caqGR3pp0MN60oPUsbX7x/2wL0w/Yka5oD1en9O4sqOE78x656Q6fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737656678; c=relaxed/simple;
	bh=WHdoyYXm8T4OpvNhOwTwaj7iM3yfio5EnblObtMBZ/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lT1DZSIQrBAdVn0mVvnxnfeDmgjGXKN1AkTF0iOKeJ8LxuesKuuojR4KDY9Vpw8heVgPgCdZ5JXfD3D1ZX4Pxkfu2Pbn57n0/1vj4rDv+Ib6syJa8BsWagMLw3Vg7SRc/er6utwJTH92pMyvcNh1hAOrkaVdzK1SFSjWxqX7ABg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o0YvpM+H; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o0YvpM+H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FC4DC4CED3;
	Thu, 23 Jan 2025 18:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737656678;
	bh=WHdoyYXm8T4OpvNhOwTwaj7iM3yfio5EnblObtMBZ/g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o0YvpM+HKi8s4P90e4d6PcNLrJLcYlfyRiLx9xk5jmrJjMjcUyPPNv79lS2NBWnOj
	 xByveaAkCJaXPQSwe1j2KnAWj+9E007/S+xnw+NDXlxgGNYDwCPXobdCTMMn4zml2z
	 EnjU8wTDqcySXnPTRsUaXtqEsZuzIceTVDQzyGW6e9liuiZzRzJmiZwsCp4XiMk+7e
	 TXfT9/rGFbBkRj3KH1k+McOlUiYvImz33GaA3PtOs2kQLFm7KO2qFZ7fYiBjtsY9XW
	 PuQgREW6cx9F79yDZoAOXM3OyRDNgeuW4XUl/cTw295r1A7cJTVtEqdgn2arkzO71i
	 IOCophv77Ms4A==
Date: Thu, 23 Jan 2025 18:24:36 +0000
From: Eric Biggers <ebiggers@kernel.org>
To: Disha Goel <disgoel@linux.ibm.com>
Cc: fsverity@lists.linux.dev, Aleksander Adamowski <olo@fb.com>
Subject: Re: OpenSSL engine removal and fsverity-utils compilation issue
Message-ID: <20250123182436.GB2117666@google.com>
References: <d42c3dd4-47b4-4e98-9814-99cd9c1d112d@linux.ibm.com>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d42c3dd4-47b4-4e98-9814-99cd9c1d112d@linux.ibm.com>

On Thu, Jan 23, 2025 at 04:02:46PM +0530, Disha Goel wrote:
> Hi,
> 
> Some distributions have started removing OpenSSL engine support, replacing
> engine.h with an empty dummy header file. As a result, fsverity-utils fails
> to compile with the following error.
> 
> Is there any plan to address this issue and support these distributions?
> 
> Please seehttps://fedoraproject.org/wiki/Changes/OpensslDeprecateEngine for more details.
> 
> # make
>   CC       lib/compute_digest.o
>   CC       lib/enable.o
>   CC       lib/hash_algs.o
>   CC       lib/sign_digest.o
> lib/sign_digest.c: In function ‘load_pkcs11_private_key’:
> lib/sign_digest.c:350:9: error: implicit declaration of function ‘ENGINE_load_dynamic’ [-Wimplicit-function-declaration]
>   350 |         ENGINE_load_dynamic();
>       |         ^~~~~~~~~~~~~~~~~~~

This is my first time hearing about this, but yes this has to be fixed.  Thanks
for reporting it.

It's just the PKCS#11 token feature that is causing problems.  This feature was
contributed by Aleksander Adamowski <olo@fb.com> (Cc'ed) several years ago.  I
don't have much context on how/whether it is still being used.

I'm tempted to just make the PKCS#11 token support conditional on
!defined(OPENSSL_NO_ENGINE) for now.  If someone still cares about PKCS#11 token
support they can look into finding a way to keep it working with latest OpenSSL.

- Eric
