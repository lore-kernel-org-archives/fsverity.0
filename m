Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794079288;
	b=kHL52XQs+mRnWF1Z2Wd12734n9go7v1QM/M1nYC7okn7uHXC5EFezX92tp6jUOKPPCVS
	 5xq8PSa/UZ/I/nzcF55ju9C/ooBXEY9SfiwxMfVjGO1GbEzYrF58sxrI1PALXZTzbr2nh
	 uEgzK0JFBpCWvyEUFrQKaDcpQrrL8zmca9gQJfHFMFZqNUAlB4x3cn5uvFVhJ6VS1zTfo
	 EriPgANDJUsRoEXQ5iKm+Pn1LbS3qkuahU+vkVI9W4qaVCHmZ+pEwFXQld/NPEyBCu++j
	 L5OLkUtDsrOtcGOWSXa5uaHUuO8iKMsv5GDL5RN7COJODffAQpmyn6KIUTkiP3aa/OQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794079288;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=kQIFPeyxIqp6Yys7tylVmyJXdp+fNNnbFbr6mAqyC/Y=;
	b=eWSw825/sof/Nhmh3syqXPSHC/ZLE1UTkFyxkYnTDsXMx7ELFGa5wHsfF0B31mWYOTjC
	 7r4lx0a19FakHdauPzBJBA1i+vkdnR3MM3LDexaHtir9neqWlrvV6ADBEBQ0aDve3kG9p
	 Ud13icHAQhoSfWvIoVXJ16GNQ2TGGLPcgyON9gqmRgpVRa7jDIBOUhz2HzOVDu5QpEqfY
	 D6OYcCajT5PUeJSp0GC8WQ68pUj2y/2oxPrUJ4cqkh3bAxvPcY2/jhHeVIherske2jpGm
	 mQSOMnhtmcqKGssNaphBE9Xei7PMfNwHlcR/Ti7EI/6l2pSVaXI/KbORm8FMCl1Rg9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iMKrMJnh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F575606A32C
	for <fsverity@lists.linux.dev>; Sat,  7 Nov 2026 19:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iMKrMJnh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D741D1F008A1;
	Sat,  7 Nov 2026 19:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794079288;
	bh=kQIFPeyxIqp6Yys7tylVmyJXdp+fNNnbFbr6mAqyC/Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iMKrMJnhxOCze6zrGBdWjpBAXHxsAHhCoAeu0/vQGgingLNXYlnFWSViPdZelYBVx
	 2cVrVvbTZeul7WjzAHxKW8yiS1qojinDEOUbfM4R2NrBfEuCV+aL4gYfp+5lJjNy4t
	 w57MpsEH9g0a7zO3wbT70aDpBQ6IdwfetbicMa/MGhiStlC6XirVP5WRSAuJSIDpco
	 Nd/coZHZprMRSoRHgrKI2V2c8trlFiGWyiAIn4zESbVZ4hSZXpEYj86iANx/hsULXy
	 X+D/WCqBxwa9cD0NzZZBjxRgHuY4dW3VfSaZbgukFujwWR7Jog/ZkwiwjnGr7lDUSB
	 klrnU9jqXgMEA==
Message-ID: <sashiko-outbox-203203@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 6.1] fsverity: Explicitly require FMODE_READ to retrieve
 hashes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Eric Biggers" <ebiggers@kernel.org>
Cc: fsverity@lists.linux.dev, "Andrey Albershteyn" <aalbersh@kernel.org>
In-Reply-To: <20261107191050.25921-1-ebiggers@kernel.org>
References: <20261107191050.25921-1-ebiggers@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 19:21:27 +0000
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Post: <mailto:fsverity@lists.linux.dev>
List-Help: <mailto:fsverity+help@lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fsverity+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] fsverity: missing FMODE_READ check in fsverity_ioctl_enable()
--

commit ce00f17646315fc0b3de9e3b97325887e3d4a262
Author: Eric Biggers <ebiggers@kernel.org>

fsverity: Explicitly require FMODE_READ to retrieve hashes

This commit backports upstream commit 1acb4fd2d011c4bd6cc961095ae17361c71ff=
61a to require FMODE_READ in fsverity_ioctl_measure() and fsverity_ioctl_re=
ad_metadata(), and documents that FS_IOC_ENABLE_VERITY, FS_IOC_MEASURE_VERI=
TY, and FS_IOC_READ_VERITY_METADATA fail with EBADF when the file descripto=
r is not open for reading.

Link: https://patch.msgid.link/20261022211522.1489943-1-ebiggers@kernel.org

> diff --git a/Documentation/filesystems/fsverity.rst b/Documentation/files=
ystems/fsverity.rst
> index cb8e7573882a1..3c7ddd6790baa 100644
> --- a/Documentation/filesystems/fsverity.rst
> +++ b/Documentation/filesystems/fsverity.rst
> @@ -157,6 +157,7 @@ fatal signal), no changes are made to the file.
>  FS_IOC_ENABLE_VERITY can fail with the following errors:
> =20
>  - ``EACCES``: the process does not have write access to the file
> +- ``EBADF``: the file descriptor is not open for reading
>  - ``EBADMSG``: the signature is malformed
>  - ``EBUSY``: this ioctl is already running on the file
>  - ``EEXIST``: the file already has verity enabled

[Severity: Medium]
Does fsverity_ioctl_enable() also need an explicit FMODE_READ check in this
branch?

In mainline, fsverity_ioctl_enable() gained a check for FMODE_READ when
Merkle tree construction was converted to use __kernel_read().  That
change is not in this tree, where fsverity_ioctl_enable() only checks
file_permission(filp, MAY_WRITE) and deny_write_access(filp), and
build_merkle_tree_level() reads directly from the page cache via
read_file_data_page().

As a result, FS_IOC_ENABLE_VERITY never returns -EBADF when the file
descriptor is not open for reading (returning -ETXTBSY on O_WRONLY fds and
succeeding on mode 3 ioctl-only fds).  A process confined by Landlock or
AppArmor can still open a DAC-writable file with access mode 3 without
passing security_file_open() read/write checks and invoke
FS_IOC_ENABLE_VERITY to hash the file contents and permanently enable
fs-verity.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261107191050.2592=
1-1-ebiggers@kernel.org?part=3D1
