Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792660650;
	b=IUe22djiEJi4A0vgWfqiUytDR0epDhgXjDXWOE2NEXaUqPxhLFS+zI600nMFgViw+J2g
	 WY6Oc+/V2o33PK4Ruq87sw0Y/aF5xeoiw81mAMTBYmsXM49V6QJogwKaBl2VYZu7AQrvU
	 t0iMm8PbpMVGgQUVfj6x3ypHF+qXTx/NaC8q3mBjmvhyBeu7ki0fedx7qr3uF+4nqBB+p
	 /PDNa5QFljGinQYvk0WkvegYictf5pP56z3jAPbwnNvFXDJwNd0DRe0yv0ONMlbyd4kyH
	 CPsi1QidDq9l8Yebw7OLciksLiFlcURcq6gaB6bN+SUET6tZmJm8gMz6DnwNayMJlFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792660650;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=E0wc5QCJ03o82tpm2YBm1NXMTEKh4tuvU6xZw4leUS8=;
	b=jOEErczWw7lFJcbfWOjQvXA9noY1GxaSeodw7y57v0QxXLtkD4FNmFmMyOQ4sZijTKWA
	 Wz31dqp89lQ8nJ6PfzScuqwnSD02YFZRng3BcWqlireojGwncYVKRbXbS7j5i0TCrt0xT
	 QTHoIFxn4TVA9/+SgGuPWigchkAY3F/p9VpuwqmpAZe/MSSl9a4tVPuHfpPcmb9jSereP
	 JlKQb55V2ta0nWd3UKGl13MxKa6hdECMHqYCqRr6PlEtzBHJePbiz2c8mxZZ6HPlWxy5T
	 7YwvODriQTEp2umoJqJQ7UQ7L2UTjq8ll7fxExjLaThbnK7OSgYh0slT6omoypOe5mQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=muy6VY2X;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48D2A606A31A
	for <fsverity@lists.linux.dev>; Thu, 22 Oct 2026 09:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=muy6VY2X
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D9871F000C1;
	Thu, 22 Oct 2026 09:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792660649;
	bh=E0wc5QCJ03o82tpm2YBm1NXMTEKh4tuvU6xZw4leUS8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=muy6VY2XsL6TfPRTE01d1H7NpRssr43nwQKZJhRnCQhufxW9O7kjBP1WkfWbT1oaY
	 AuwUnJrluaXQZZVlVKsGsFVeBI1PgmS1xnbgg006PJMFeM8NTKJHH6+IJAiKyUg9AE
	 O0mxOJ0K9CQaewcQ8BeXmUACTMmGApbE6SSSrnMvyhGNAzVACYRIatIYSU3iTj1IKb
	 2IPuC2lyng+iW8Wgc0KZAZZH7fc1g13G5e8WbgHE5eLF6vaEpEsSWPot+ct0W9Eevw
	 pLnwioeyI5uPbn/McHXLfyS5sV6Id1d1Jgah022jSaJeHvh3FOr5MIR1zLg10kCrKf
	 /Vz32Acz4ZL6g==
Date: Thu, 22 Oct 2026 11:17:26 +0200
From: Andrey Albershteyn <aalbersh@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Cc: fsverity@lists.linux.dev
Subject: Re: [PATCH] fsverity: Update misleading comment in
 fsverity_ioctl_read_metadata()
Message-ID: <atnUhNPNf651wjw7@aalbersh-thinkpadx1carbongen13.rmtcz.csb>
References: <20261021224030.2346074-1-ebiggers@kernel.org>
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
In-Reply-To: <20261021224030.2346074-1-ebiggers@kernel.org>

On 2026-10-21 22:40:30, Eric Biggers wrote:
> The comment in fsverity_ioctl_read_metadata(), which justifies not
> checking for FMODE_READ, doesn't consider that the nonstandard access
> mode 3 (ioctl-only) exists.
> 
> It's reasonable to continue to allow this ioctl in that case, since this
> *is* an ioctl, and opening a file with mode 3 checks for read (and
> write) access.  However, adjust the comment to not be misleading.
> 
> Signed-off-by: Eric Biggers <ebiggers@kernel.org>

Looks good to me
Reviewed-by: Andrey Albershteyn <aalbersh@kernel.org>

-- 
- Andrey
