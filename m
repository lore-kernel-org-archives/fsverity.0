Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792699173;
	b=zAEhD9xD3KNg6AuzaZv54EL8z9YLV7slmgic1RBd2f0/a7n6lWkwa1Ak70mvjtVGYv1X
	 YBeySklOEyn02YNMZ28yguVIl1rM68VP50wCmkZ/xXUblO9byjjtoTNp+CpCqEKXB/sya
	 JUspFyMMOyN1U9KFGQEpPWlO0bQt1hm4Ar4daOYTpgs6M4YUt3d52I2g2X8QzaZIMF0RA
	 4psH/lX0/xhxXojSnm3mFCVwRYepaq5zaSgRa+OcjeDBqUqraGSl/OG/23x0s+EjhzdNq
	 fOkLMoqqTAkgInibAzL9NM1rTWBxRxpkeHCtb7WCW5FOT3+OdIBDwRdjmp9L482uwCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792699173;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=s5uzVWIK+WqictzDs1N5dALE8X7R7QzbQULvx1sAdf8=;
	b=VGWz8AiJ7NbCRo6z5ETwZVNlNkzWDF5GhOJgz118LIpNv+5ZiXSg3wl7Rm7oXaB734qF
	 GutHd5687sdp9pvyKzUD9DjStAyUnhSVxZEQ78iK84DlNe8LbWxKprPgfDIhFGwQNSA57
	 fl4vrK5Xo390bsAnz8dvJeuqo19VXIXAtqOLJXSruHBEw9s1kUcqqJJDjZtx0ULHhlTJh
	 v7tJfnjDae3x8wVuEo+MVKaNbJA0fYopgz3A9qmL+EtnxGzEu1mLVwz8dJ8WQeAx2lcsV
	 4cJ2XgYKud/L2mBA7p78Q8USqz6HhJe9pxaAa13/WVo1hbS4Se5yYjgja9vORpCLJhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iTSSPUpw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA7E606A319
	for <fsverity@lists.linux.dev>; Thu, 22 Oct 2026 19:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iTSSPUpw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81AAD1F01825;
	Thu, 22 Oct 2026 19:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792699172;
	bh=s5uzVWIK+WqictzDs1N5dALE8X7R7QzbQULvx1sAdf8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iTSSPUpwvZIKmrFe4k7Yxmh1gUz84W4z95qdHOjFwykB1osHj8FWyHOyI8+NRut1z
	 4TCmAOJll+IN0BcPKoqsk8BVe+4w90m40TaZIuISH6fBnfket+tpzRmlfAaNo/LG3v
	 LbKYJwWmhGaal+AgEx953FJfwcjf9CQLuDYPx7ebw8jDcM2mHQVyXUX7Xj4fkTzvx3
	 /9ZC8VdBctHTH3Cdsgjv9HRKtowR+TPkreIma2XJIQwjKQnEY/pwDL952Y0vp4eadm
	 p/KgPPGESvdkpvw8xGrDXYn0guWX1kNSA7aDK86Pd2gGtUUBB7g363SVezBeYRdddW
	 srOtzU5NajYxg==
Date: Thu, 22 Oct 2026 19:59:30 +0000
From: Eric Biggers <ebiggers@kernel.org>
To: Andrey Albershteyn <aalbersh@kernel.org>
Cc: fsverity@lists.linux.dev
Subject: Re: [PATCH] fsverity: Update misleading comment in
 fsverity_ioctl_read_metadata()
Message-ID: <20261022195930.GA1383716@google.com>
References: <20261021224030.2346074-1-ebiggers@kernel.org>
 <atnUhNPNf651wjw7@aalbersh-thinkpadx1carbongen13.rmtcz.csb>
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
In-Reply-To: <atnUhNPNf651wjw7@aalbersh-thinkpadx1carbongen13.rmtcz.csb>

On Thu, Oct 22, 2026 at 11:17:26AM +0200, Andrey Albershteyn wrote:
> On 2026-10-21 22:40:30, Eric Biggers wrote:
> > The comment in fsverity_ioctl_read_metadata(), which justifies not
> > checking for FMODE_READ, doesn't consider that the nonstandard access
> > mode 3 (ioctl-only) exists.
> > 
> > It's reasonable to continue to allow this ioctl in that case, since this
> > *is* an ioctl, and opening a file with mode 3 checks for read (and
> > write) access.  However, adjust the comment to not be misleading.
> > 
> > Signed-off-by: Eric Biggers <ebiggers@kernel.org>
> 
> Looks good to me
> Reviewed-by: Andrey Albershteyn <aalbersh@kernel.org>

Thanks.  I'm actually reconsidering this patch, though:

* This ioctl returns hashes of file contents blocks, which reveal
  information that normally a read would be needed for.

* "opening a file with mode 3 checks for read (and write) access"
  is true for the DAC permissions, but it's not true for some LSMs such
  as Landlock where it bypasses their read permission check.

So requiring FMODE_READ for this might be the way to go.

- Eric
