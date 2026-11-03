Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793730206;
	b=iZd3JNysi21Qyvl+GzvvfHeSJO/kdKZeBfnFfu0s36pFQrPQmrWVsPq4nBgCiubaiuzO
	 c4gyYwYqvBzMWRykIpOY+dRvG3RKPN+lF+ylio6ZYi5VILZ1wHKzJvDFwKORz3+WJ2PQs
	 sHaK3ohLIMLeosvkPZhMHBK8Zc2qn/NkW524Ee4ppSZ2gY7ePCRkRDghPYoPHMR+rOWbk
	 V7gzh3jiMenzaKD74krbmYVhSPPARe0dXchee8LN7j1vQn9fX6wUAPePgqU6N1am8k3FP
	 yKHjfOJpbACRFsyvK6nvRWg/e1eB9kgN0Mbcu9oP9UVErsbs2b00hZyVFnj7YCkksFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793730206;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=aq6FI6FqlCElDs1CftZJQ41RxvMtJeYFhWtulM96cq0=;
	b=mKoq0/PmE1EK9RmuaQm+HY4+xEzS8kiGeLUyluUBA7oeFEIDhHyYgg5V7zbu3NIF4EGg
	 adJFEWmWBAiccA1ZLHQrG+KqJW0UtGKZyXpLVVyVDmStYQaixehJbgyMlKmXAWcB6wz8O
	 MJusvBGcU2bPCZQ9VWHfBNI/SJR7EnoPyb4uUxzAW/rlQ/wFn3sVZdeMtOattIZm0RNeU
	 peh+/flyCuMP9zR8dnmNtyQ4Q/s/h4/C6laEc//ZsU4nEMC080eZJ8NQbSb/eunmsKrvx
	 2u0fQyBTQ4epEbpYAi6Q0hVdXyEDsR7eY7GSDJ2BEAJEokbW8jjeSLylZ5feO8XXHSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nyNeWxqX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2935606A31B;
	Tue,  3 Nov 2026 18:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nyNeWxqX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80C291F000C1;
	Tue,  3 Nov 2026 18:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793730205;
	bh=aq6FI6FqlCElDs1CftZJQ41RxvMtJeYFhWtulM96cq0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nyNeWxqXyaKvKmz0MB3M25qGYX+8NiTly5JQP0eDyX/7lPEbfl2BCe1F2QgLE0mSx
	 wvFTa32Wn2+bGZZdeWMIArtBDG8ywXO+2R3HjfFoOe5DGD8fh2Ar+zhXswIKbyKF8t
	 DYnZs4O2Z6ockzBQNivweM/+YkG3e9Cg9sBMBc+Jggw6NsrViAbPoVzMGkrJG2Oh9T
	 wqTtKcNmNXAQd95LP00FrJiDmnxPvBjqTEpFc36XXYPBxVV6iYzo2L5nDCMQ4vngto
	 4p51S0aSmFAP0wLX4Dd5orhoYB2IfHJ+rAxsubszqn9azivrZI5Hb0a67WuPogm5kt
	 C/2nvZ+E8MuoQ==
Date: Tue, 3 Nov 2026 18:23:24 +0000
From: Eric Biggers <ebiggers@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Andrey Albershteyn <aalbersh@kernel.org>, hch@lst.de,
	Carlos Maiolino <cem@kernel.org>, fsverity@lists.linux.dev,
	david@fromorbit.com
Subject: Re: [PATCH v18 09/15] xfs: add fs-verity support
Message-ID: <20261103182324.GB2224825@google.com>
References: <20261102144147.2393369-1-aalbersh@kernel.org>
 <20261102144147.2393369-10-aalbersh@kernel.org>
 <sashiko-outbox-193675@kernel.org>
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
In-Reply-To: <sashiko-outbox-193675@kernel.org>

On Mon, Nov 02, 2026 at 03:34:43PM +0000, sashiko-bot@kernel.org wrote:
> Could xfs_free_eofblocks(ip) (or the post-EOF unwritten/delalloc cleanup)
> be performed before setting XFS_DIFLAG2_VERITY and S_VERITY so that
> enabling verity does not have to roll back committed on-disk state and
> published VFS flags?

Yes, S_VERITY needs to be set at the very end of ->end_enable_verity(),
and only on success.  I recently had to fix this for ext4 and btrfs.

- Eric
