Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C30B219EA0
	for <fsverity@lists.linux.dev>; Mon, 17 Feb 2025 19:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739820944; cv=none; b=D57YX8PchYCeXf7rH7J0fao2ILyKvU1zbAqd6dscDN913Etdhh/YWRbsEaLenWTvpW6lpWYpSUno9e9UShd8oTqJIlYF9nFcnbe0j9l/Y6LZd2xfqYsRDmUJmAobAtJiB1G2PeAfT3H9jFzV2A3/TxBjkX9J7SpwJf1vbfLq41k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739820944; c=relaxed/simple;
	bh=wrr3H9N0l4EcCax0+hDzsNaKqe38GgSjqGGIAQWWGG0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rUWU4IuRp8OgjG10073GybWbjd90qTqvOoYrUQQAvCzd9PRXZ4SqqEFXEJhKHrlM6NbihiWK8lAGoQ5EfSWus5RnPSPiIzVy74ppyV7tQsl6ATOcWj2tDob+mhWT9ICUDzgqUTL1UBpb5obsS/ReRhskGxhyFaca70ksNzfLkfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h2VgLuhs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h2VgLuhs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CE9EC4CED1;
	Mon, 17 Feb 2025 19:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739820943;
	bh=wrr3H9N0l4EcCax0+hDzsNaKqe38GgSjqGGIAQWWGG0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h2VgLuhscMwkGOg/nVgx57z8PTDlO2t8Os4uPnkrQihvCoBD2vmq3yfOIuu/2FhrU
	 2vKCKlVQN6rnY3It+EFUmXdE/rFXbU/MHBbAYfqx5YjUpFzZJ4dEJoO0eRiuirCSvZ
	 LZyU0TMhV/t8X/TWj/2T/EhiSgzquLVuIMKHfavnW3HKNzAIWO0Cw6daztQwnSF+z4
	 H2/ZBZigF28IxqlPmzt4ruWZxXt7WF9OVPy1Fu7JDs6DAJZrNhiH77/M1+AOx1u4lt
	 9W6D3f9O0UYVoE2lfT7SyG0quaUjFVE7Emaupe/c4Q1GnUvISNBbvQSgYLP2RN8p2g
	 9rwqNnn4BVJag==
Date: Mon, 17 Feb 2025 11:35:41 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Allison Karlitskaya <allison.karlitskaya@redhat.com>
Cc: "Theodore Y . Ts'o" <tytso@mit.edu>, fsverity@lists.linux.dev
Subject: Re: [PATCH] Documentation: add a usecase for
 FS_IOC_READ_VERITY_METADATA
Message-ID: <20250217193541.GD1258@sol.localdomain>
References: <20241126023313.GA3095319@google.com>
 <20241126084833.70538-1-allison.karlitskaya@redhat.com>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241126084833.70538-1-allison.karlitskaya@redhat.com>

On Tue, Nov 26, 2024 at 09:48:33AM +0100, Allison Karlitskaya wrote:
> Mention another potential usecase for FS_IOC_READ_VERITY_METADATA:
> creating filesystem images which contain fs-verity-enabled files,
> without having to redo all of the work in userspace.
> 
> Signed-off-by: Allison Karlitskaya <allison.karlitskaya@redhat.com>
> ---
>  Documentation/filesystems/fsverity.rst | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)

Applied to https://git.kernel.org/pub/scm/fs/fsverity/linux.git/.  Thanks!

- Eric
