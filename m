Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794079390;
	b=uadzUktPsZfWxh8J2WRMgedczvCokg5Uf1yjW3fqoU1BXIdYvwfdpny9vn/T+28+uCH6
	 zun735F0Tkct5MSyfALhv7VlgADSz7c7tkHOKMm3GMqVjpsg5HOITFn1zIwo8NQNbeTPV
	 hxfP7Up1o2tBBfbFvBuMP36SDyPv7TxU1f9wWDO9uhurjJ/YCBBHex8k9TkavdXKr6Z5c
	 i14+QCjaRIgFtfEH8Lod9OiM/+xamZ1CzRPYUIlV9CIqCN7RluT6qx8n7VSN9Wxxf4FFj
	 M8OfGgFzNL7JjzJWkPuHmjw6xL/y/au2OrU7cy0iyyAVaWGDGXfN9rfcLHXLU5xixxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794079390;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=x4OzxHPNP8A4inFSVHQERmO+FWfKiSeYenMVl1a7jzY=;
	b=U+H7YjHemplgT63JIIH1fkUNRRlTs7Vr76edZIPpNeygr+FDGaxXaT0q23S/9Vo0HXq5
	 YSrdU0k7PqYOJtRC6EbH8mP39INp224Q9lyyfYaUByGeG51ldxLKOEmmMegTeirEjuO16
	 wYXbB5etVQGqYcbTIfoQvEfhvzCAYFYUWVnJiucfbc5pC4xV5cukcHf6L0Xc97rg8MzMb
	 v/lz1bZnj7Ji5086yVIhFT9Emg/xeumlgRj8zIu+CL+MmTFoqMa69kv/ovT00F9EG0NIH
	 0ge94HqUunCHjYJCYi/KdCLEMolQGo23Q796l6HtNdBSHPNBxuFfRTNZnPIPehos7qA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hARONUQi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 134D5606A32E
	for <fsverity@lists.linux.dev>; Sat,  7 Nov 2026 19:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hARONUQi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CE581F0089F;
	Sat,  7 Nov 2026 19:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794079389;
	bh=x4OzxHPNP8A4inFSVHQERmO+FWfKiSeYenMVl1a7jzY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hARONUQiMEzAzD8Nq0nGCiPfKazbUL32nPcFRaJOsB71YrnKtsSKtEpjiIUvTrZZZ
	 Y95d1UL+/PfEX1fJNKxlSl0oomsCgE+Cfgee06zoAfyhdqLxkpoN1hx9uJqa/+Llzl
	 2Vv4Zx6bJgTHsU99qkgOA1C8az1LApSPkvKCeJrHjt4C2CHdvjr6IGWejnNUxfCsfZ
	 QS5nulV1QYtU4UrqCMxUJK3gykGw+5bLNDAe3ccy30SzrcgLFjnPADk4evUe+wCImY
	 +ukrlJUjCEbidlSFJubpw3trMOksQw+0gmhjgsa+cpEKKJCbkvRdumxF9ql1iPdO4h
	 Gw1P1FPyAWdlA==
Message-ID: <sashiko-outbox-203204@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5.10] fsverity: Explicitly require FMODE_READ to
 retrieve hashes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Eric Biggers" <ebiggers@kernel.org>
Cc: fsverity@lists.linux.dev, "Andrey Albershteyn" <aalbersh@kernel.org>
In-Reply-To: <20261107191408.43437-1-ebiggers@kernel.org>
References: <20261107191408.43437-1-ebiggers@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 19:23:09 +0000
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
  on 5.10
--

commit 4872a24e7ea173685e43d575a8bbd21a70702f93
Author: Eric Biggers <ebiggers@kernel.org>

fsverity: Explicitly require FMODE_READ to retrieve hashes

This commit backports the FMODE_READ requirement for FS_IOC_MEASURE_VERITY
and updates the fs-verity documentation for EBADF error returns.

Link: https://patch.msgid.link/20261022211522.1489943-1-ebiggers@kernel.org

> diff --git a/Documentation/filesystems/fsverity.rst b/Documentation/files=
ystems/fsverity.rst
> index 895e9711ed881..4bd6f25e1a4b3 100644
> --- a/Documentation/filesystems/fsverity.rst
> +++ b/Documentation/filesystems/fsverity.rst
> @@ -146,6 +146,7 @@ fatal signal), no changes are made to the file.
>  FS_IOC_ENABLE_VERITY can fail with the following errors:
> =20
>  - ``EACCES``: the process does not have write access to the file
> +- ``EBADF``: the file descriptor is not open for reading

[Severity: Medium]
Does fsverity_ioctl_enable() actually check FMODE_READ or return -EBADF in
5.10?

Upstream commit 04839139213c ("fsverity: reject FS_IOC_ENABLE_VERITY on
mode 3 fds"), which added the FMODE_READ check to fsverity_ioctl_enable(),
has not been backported to 5.10:

fs/verity/enable.c:fsverity_ioctl_enable() {
	...
	err =3D file_permission(filp, MAY_WRITE);
	if (err)
		return err;
	...
	err =3D deny_write_access(filp);
	if (err) /* -ETXTBSY */
		goto out_drop_write;

	err =3D enable_verity(filp, &arg);
	...
}

Without that commit, FS_IOC_ENABLE_VERITY fails with -ETXTBSY rather than
-EBADF on writable file descriptors, and still allows ioctl-only (access
mode 3) file descriptors to proceed without FMODE_READ.  Consequently, an
ioctl-only fd opened without LSM read/write checks in security_file_open()
can still read the file contents to build the Merkle tree and enable
verity on the file.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261107191408.4343=
7-1-ebiggers@kernel.org?part=3D1
