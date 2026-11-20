Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795191585;
	b=5GNI5CpYzkBQZFSoL1/FZKpa0El8W+cxMt01Cu+TKIYgsq9sMk2bniv0nSmoxu3PPIRK
	 wGWA4M4w+aX/glkfaxs3lqobGLGm1l4TuO+DFbVC/rY3+q5h2rsxAj/VGCwJgQkUAdeoe
	 gohZOc/nW/ytf5kKv/OxomOVEHQljYHlTrtQBjxU/q7yUQPeUaWq2I8eiASJxC+6AEcr9
	 Rwgt4jBz5tMnEmca9zTdOZltbwWh6OPrLe1kryrwr7MGMR5rLdR8yNtde5FFopq0w6NMx
	 OCfkFUhwjxj2nQgf+UL3nQJ7+HHkKg7PaWfak5Vv9c5wCvM7XZKie6yIMM0ctv6BpsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795191585;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=uEKBz/sIFg/X3KTKu8P0GzHy5Zn4tlzhNTDHHcMnXRY=;
	b=KqbnQNCeqlMAtmFJvooBGSC0oGwAIbdBgKSzwTopOBnmyjmDJjw2jLpIF7oVpEU8zrfc
	 mdgvPHbAxPsx3NwPNAkp70tk6qp7MFQvuabDHM8EZwErGuYPG4fA6lBb85/gqtXlaBlhu
	 MOpd8B7Uw/rp9tg++poB/BY1xUwGMYh+Yc7XTW6PmC0cv7Dy5BrJuXirY+vggCpFbxMn8
	 sU6Aat6MKlOukyX5KPxlio9cah8Sht24A6y+lzMp4y3yvQJDFx70dxE5Myk16wkSHtNlC
	 4kYIxprwG8zIDpUrQ19vWprbQdO8W/32itShmb7Xdpp/lXttoisaKjCE04vUogYyFbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QGwU8Th4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A805606A332
	for <fsverity@lists.linux.dev>; Fri, 20 Nov 2026 16:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QGwU8Th4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C07A1F000CF;
	Fri, 20 Nov 2026 16:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795191584;
	bh=uEKBz/sIFg/X3KTKu8P0GzHy5Zn4tlzhNTDHHcMnXRY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QGwU8Th4DadwzWI7WgDt5O3rzjBrnMZbpg9+17epUy7J2QaEeqs54x9tlOu7S7pQ8
	 asNG2IMJ59yDaOa933DiWpN+bxtiNWcB9+tprD8Ey4L8BaqOWzvpxIm13lbo8enOuQ
	 s0/0JoZ+kY1oQ7F4mkr/5lY5lyoiSweTKLsWIdyg84/ZBsW4+78piNyGZlVR2okNNX
	 O3bwIlxZSkcWNM7oa6CCyz5tLYPDuadI0r3GkIhNa6sl61QvlvFzdtwepExLfbCrOP
	 rMPWNzxWhUffTrw7WFP43uWk2RZ59wMf0c6aBYVXsYvVM0JfNHM9VkEOnV++qQBVtl
	 C2H9gRybKj3Dw==
Message-ID: <sashiko-outbox-225555@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v19 11/15] xfs: add fs-verity ioctls
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andrey Albershteyn" <aalbersh@kernel.org>, "Eric Biggers" <ebiggers@kernel.org>, "Christoph
 Hellwig" <hch@lst.de>, "Carlos Maiolino" <cem@kernel.org>, fsverity <fsverity@lists.linux.dev>
Cc: david@fromorbit.com, "Darrick J. Wong" <djwong@kernel.org>
In-Reply-To: <20261120155752.192025-12-aalbersh@kernel.org>
References: <20261120155752.192025-1-aalbersh@kernel.org>
 <20261120155752.192025-12-aalbersh@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 16:19:44 +0000
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
- [Medium] xfs: xfs_fileattr_set() rejects FS_VERITY_FL during
  FS_IOC_SETFLAGS
--

commit 3fae29a529f78f9a34f0fcaea0d85bd2f887a199
Author: Andrey Albershteyn <aalbersh@kernel.org>

xfs: add fs-verity ioctls

This commit wires up FS_IOC_ENABLE_VERITY, FS_IOC_MEASURE_VERITY, and
FS_IOC_READ_VERITY_METADATA in xfs_file_ioctl().

> diff --git a/fs/xfs/xfs_ioctl.c b/fs/xfs/xfs_ioctl.c
> index 7c7435543051a..2d0a2d37e71cf 100644
> --- a/fs/xfs/xfs_ioctl.c
> +++ b/fs/xfs/xfs_ioctl.c
[ ... ]
> @@ -1594,6 +1595,19 @@ xfs_file_ioctl(
>  	case XFS_IOC_VERIFY_MEDIA:
>  		return xfs_ioc_verify_media(filp, arg);
> =20
> +	case FS_IOC_ENABLE_VERITY:
> +		if (!xfs_has_verity(mp))
> +			return -EOPNOTSUPP;
> +		return fsverity_ioctl_enable(filp, arg);

[Severity: Medium]
Once FS_IOC_ENABLE_VERITY sets XFS_DIFLAG2_VERITY on an inode, will
xfs_fileattr_set() reject FS_IOC_SETFLAGS updates on that file with
-EOPNOTSUPP?

xfs_ip2xflags() reports FS_XFLAG_VERITY, which fileattr_fill_xflags()
maps to FS_VERITY_FL in fa->flags during FS_IOC_GETFLAGS.  When
userspace (such as chattr) modifies another flag and writes the flags
word back via FS_IOC_SETFLAGS, fa->fsx_valid is false and FS_VERITY_FL
remains set in fa->flags, but xfs_fileattr_set() does not include
FS_VERITY_FL in allowed:

fs/xfs/xfs_ioctl.c:xfs_fileattr_set() {
    ...
	if (!fa->fsx_valid) {
		unsigned int allowed =3D FS_IMMUTABLE_FL | FS_APPEND_FL |
				       FS_NOATIME_FL | FS_NODUMP_FL |
				       FS_SYNC_FL | FS_DAX_FL |
				       FS_PROJINHERIT_FL;

		if (xfs_has_asciici(mp))
			allowed |=3D FS_CASEFOLD_FL;

		if (fa->flags & ~allowed)
			return -EOPNOTSUPP;
	}
    ...
}

Allowing FS_VERITY_FL in xfs_fileattr_set() when XFS_DIFLAG2_VERITY is
already set on the inode (or when xfs_has_verity(mp) is enabled, since
vfs_fileattr_set() -> fileattr_set_prepare() already rejects toggling
FS_VERITY_FL) would keep FS_IOC_SETFLAGS working on verity files.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120155752.1920=
25-1-aalbersh@kernel.org?part=3D11
