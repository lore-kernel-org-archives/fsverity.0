Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794079196;
	b=CVQkAUI5HSX0QSef/sso6P9I/LxR5PrJq/FZoUP59QavtWAp6W0iMhlktF4gJiH+wKQi
	 MxBSHuws/Vd3Y65F9wymbc5EKSoioY3Sz6LNwD/ExvXFJap0FOzcLvLQfLBTKMqPIX6vr
	 D1vM5VZ/g5xjmziTJy1/lA31rymvqO87wyCKAi8ubuqswxfqkoqkzkv8Xztq+4el/DFxZ
	 gmoPJqKXdQLgy+HwT50XN23Ir0xcYJf7suDoZWosQhEPHTsgRsOLBLgFqiJXR98BrHPk1
	 G5ZBRiWc2KzIlPcuBp7x68Ll0a30ZJxtT6LsQbGcrs7qBcT6dCO7Pzz0svljwGGQIIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794079196;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=JSXAEFuT4NER3iHuNYhNloVFUGdnvX3jG7WZpgf4Pfk=;
	b=seS/XW7XjCs1KzyP+ASlBZjS5HEQwL+T8T+/7sqGy3nrDL6H6+a/gJcBGVNCACyC4eUi
	 Hv7+0Rm0o50NsZU9FpXwjKYCX0jryaxHrq8ESy1V/37sSceMa/SRTZYuAKFvSD4IWx9DI
	 1ZtMKscp/jUdb8cqSArQJwVl01BugJNApJTE04dkP6ejAo7hkR92gdRbsDkItTQzAc+LC
	 2bAI1dEQr6ZDCSZrOGEzY2E+NwEnsiBliPURYOsijeInAc8W5ANvY5gdV9LvGn5SfLvEA
	 rVs01vEJZM9oLj1LFaOM7mEDQgj8tUlfb8IodfgU9L/+sMEIY9KgznBK4ZNJXB3b2lQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Yqd+nZbW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00487606D83A
	for <fsverity@lists.linux.dev>; Sat,  7 Nov 2026 19:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Yqd+nZbW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BCE31F008A3;
	Sat,  7 Nov 2026 19:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794079195;
	bh=JSXAEFuT4NER3iHuNYhNloVFUGdnvX3jG7WZpgf4Pfk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Yqd+nZbW3jt3Jfcr60vTanCoOVWb6rvkL01RBdHCRCl2HqPzoU2Rsg2SJERC6yel9
	 IX+DPrUDUHK+ohd9ITdNvD6P2k82vGwPFgt38NSY+VRky9TL6NI0BcSKJXjkYqn5xG
	 XtniiVNAGdPsSM4y/6sMwEnFiccZoWd4zISwDyGKlkF6zTsQkQwJgtdT+U1/X1kAw0
	 XWcoeKZTPzBsZklk+BfwfkGVmH8PAAzmC0dwmwuVPwuH4PxtZMZ9RZdnYti3U8jbgs
	 NWoqSVzhKjxLplWL5aXQJjLrWeJv9b0nNEAkWxx9cURFU9c8SaOYWECL9s4LO9qiK7
	 GAcZ21X3dLcBA==
Message-ID: <sashiko-outbox-203202@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5.15] fsverity: Explicitly require FMODE_READ to
 retrieve hashes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Eric Biggers" <ebiggers@kernel.org>
Cc: fsverity@lists.linux.dev, "Andrey Albershteyn" <aalbersh@kernel.org>
In-Reply-To: <20261107191131.30975-1-ebiggers@kernel.org>
References: <20261107191131.30975-1-ebiggers@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 19:19:54 +0000
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

commit 6f42601569a4e27dbe2802c031c26b860ad70602
Author: Eric Biggers <ebiggers@kernel.org>

fsverity: Explicitly require FMODE_READ to retrieve hashes

This commit requires FMODE_READ in fsverity_ioctl_measure() and
fsverity_ioctl_read_metadata() so that ioctl-only file descriptors cannot
be used to retrieve file hashes without passing LSM read-permission
checks, and documents EBADF for the fs-verity ioctls.

Link: https://patch.msgid.link/20261022211522.1489943-1-ebiggers@kernel.org

> diff --git a/Documentation/filesystems/fsverity.rst b/Documentation/files=
ystems/fsverity.rst
> index 1d831e3cbcb33..073bb57334c45 100644
> --- a/Documentation/filesystems/fsverity.rst
> +++ b/Documentation/filesystems/fsverity.rst
> @@ -146,6 +146,7 @@ fatal signal), no changes are made to the file.
>  FS_IOC_ENABLE_VERITY can fail with the following errors:
> =20
>  - ``EACCES``: the process does not have write access to the file
> +- ``EBADF``: the file descriptor is not open for reading
>  - ``EBADMSG``: the signature is malformed
>  - ``EBUSY``: this ioctl is already running on the file
>  - ``EEXIST``: the file already has verity enabled

[Severity: Medium]
Should fsverity_ioctl_enable() also check FMODE_READ in this branch?

This hunk documents EBADF for FS_IOC_ENABLE_VERITY, and the commit message
notes that ioctl-only file descriptors were already disallowed for
FS_IOC_ENABLE_VERITY, but in this branch fsverity_ioctl_enable() only
checks file_permission(filp, MAY_WRITE) and deny_write_access(filp), and
read_file_data_page() reads directly from filp->f_mapping rather than
through __kernel_read():

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

Because an ioctl-only (access mode 3) file descriptor has neither
FMODE_READ nor FMODE_WRITE set and does not increment inode->i_writecount,
FS_IOC_ENABLE_VERITY still succeeds on an ioctl-only fd without passing
security_file_open() read/write checks in LSMs such as Landlock or
AppArmor (and fails with -ETXTBSY rather than -EBADF on a write-only fd).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261107191131.3097=
5-1-ebiggers@kernel.org?part=3D1
