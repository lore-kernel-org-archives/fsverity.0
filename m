Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87276134CCF
	for <fsverity@lists.linux.dev>; Tue,  6 Oct 2026 21:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791323222; cv=none; b=GEYmX0ZGbWYXsUW0mR+AjlL78T9IkYyrmb97RvCytAceTcRT+JkZEhkjSRqkXOmK+tcYyu02P58u7vs9Mc8smGcbDLB5bAadgfyHyZuRmbPRadtYZT6cF5M9cx4Bu1pFMXhuywsgdClDOiepsDjjbNMp48/ka5Dmgt6vDTwYjSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791323222; c=relaxed/simple;
	bh=HUEpSGxU6r9RH1o81NbZ/dw15baL2uTIBsJ28OOW8b8=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=sxuTRS7Cm0oK1qyiuBFFW5T2EtFJ1cWKsGVSWpDJym0vrdILbXtMiR8aLKaXsIH/II4R3wGNd3+k7RitGvq751NQVJ+4dQw2Ds2tv5Kqm+4jmgbQ3Ezcms9rFVsmelFl/am6fRgwaWosDpSUb0SpSx3jW2wqUA/IZ2VY5GcYYLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b3n66SlZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b3n66SlZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0447E1F0089B;
	Tue,  6 Oct 2026 21:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791323221;
	bh=O2QX3pJph4Z3mr4uwwAejzqljT/LjxoqlXR5lCIHfyM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=b3n66SlZTXEJLF1WVMO7esII7YGFsJWKYMbcSGgnkPqfIjq7kU+X5NHF5Su7NVOe8
	 M5dGvmYQ0+9G8I4bvr46W0zAKFPLjs2Nlohyf+jLUYq/13NAXR05c6a0HUSA6AbI1M
	 9dweo2f3qCkWC3H4MNtTGDiG/2axD7vR9Y5qyP9KXPb8zUi+3c3PJfKq6Ovp9HVwZP
	 t8uETjkncqV5MYoppO78EenNi0d0JZavSK8M7TNQqq9SY1H8PqjCZChfCaMdAc2da3
	 XYuPW1Uip6qil0+cqm92tb7EDwTIUv9njRsCRHi3dNuf3skDbMZUQvJgRrdYjaujZN
	 efi1YfwrLSHYA==
Message-ID: <sashiko-outbox-162468@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 6.6 1/2] fs,fsverity: reject size changes on fsverity
 files in setattr_prepare
Reply-To: sashiko-reviews@lists.linux.dev
To: "Eric Biggers" <ebiggers@kernel.org>
Cc: fsverity@lists.linux.dev, dsterba@suse.cz
In-Reply-To: <20261006213815.47194-2-ebiggers@kernel.org>
References: <20261006213815.47194-1-ebiggers@kernel.org>
 <20261006213815.47194-2-ebiggers@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 06 Oct 2026 21:47:00 +0000
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] fs: setattr_prepare bypasses fsverity immutability if CONFIG_FS_VE=
RITY=3Dn
--

commit 124beac2c5f385e936a45c9aaf9bc8b5a46a9785
Author: Christoph Hellwig <hch@lst.de>

fs,fsverity: reject size changes on fsverity files in setattr_prepare
   =20
Add the check to reject truncates of fsverity files directly to
setattr_prepare instead of requiring the file system to handle it.
Besides removing boilerplate code, this also fixes the complete lack of
such check in btrfs.

Link: https://lore.kernel.org/r/20260128152630.627409-2-hch@lst.de

> diff --git a/fs/attr.c b/fs/attr.c
> index a8ae5f6d9b167..c2302fc4b3330 100644
> --- a/fs/attr.c
> +++ b/fs/attr.c
> @@ -173,7 +173,17 @@ int setattr_prepare(struct mnt_idmap *idmap, struct =
dentry *dentry,
>  	 * ATTR_FORCE.
>  	 */
>  	if (ia_valid & ATTR_SIZE) {
> -		int error =3D inode_newsize_ok(inode, attr->ia_size);
> +		int error;
> +
> +		/*
> +		 * Verity files are immutable, so deny truncates.  This isn't
> +		 * covered by the open-time check because sys_truncate() takes a
> +		 * path, not an open file.
> +		 */
> +		if (IS_ENABLED(CONFIG_FS_VERITY) && IS_VERITY(inode))
> +			return -EPERM;

[Severity: High]
Is it possible that this IS_ENABLED() guard bypasses the immutability check
when verity is disabled in the kernel?

Ext4 and F2FS previously relied on fsverity_prepare_setattr() which correct=
ly
returned -EOPNOTSUPP on non-verity kernels. By replacing those checks with
this code, if the kernel is compiled without CONFIG_FS_VERITY, this check
evaluates to false and the truncation is allowed to proceed.

Can an unprivileged user with write permissions to a verity file use
sys_truncate() to destroy its contents and cryptographically sealed metadata
on a kernel compiled without CONFIG_FS_VERITY support?

While I noticed this issue is addressed later in the series by commit
0129f7fd3696d1d9b07abe1ecccfcb575dde56d8 ("fs,fsverity: remove check for
fsverity being enabled in setattr_prepare()"), shouldn't this patch be
self-contained and not introduce new regressions?

> +
> +		error =3D inode_newsize_ok(inode, attr->ia_size);
>  		if (error)
>  			return error;
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261006213815.4719=
4-1-ebiggers@kernel.org?part=3D1
