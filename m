Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795192583;
	b=cmLbZ8HpbZmsAByvmVZuWUMst2k3Aco3TcbTMxVj5vH8k6eRVBgZo/gAOQYCasW1gLVs
	 42F7Oukmk/+XAdSyJBugFgfjrp716Apjxt3anF6KHTTQKyP4dKph2Q2oaPIy5ZVtboK4H
	 Q7xkAIV5b1JUWG+o7qHMB9RQPNqKKG1UeLCtUGq0VdkloX2dYKUzY1XnXHD/NW1fvSoFu
	 BejMMGeTiU9d9ezBq6gZyJaNtrjF551Gn4XmUSX0NemdvA5Dnz2+ZIu0+hgDwgLNmwhXK
	 uWrPWkef8w5G/viSl2ay/xOEkcCVwjbYqb2OUz676uDZtzUzcQ4L8cwdygV+A2m0Pmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795192583;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ddxYPK/BJZos2GF0DlxCOVpaDu359GK2hangyOfh66k=;
	b=I2TZCoseudrpXsAWjEX2Hb+YOzJll2efVKHW77gq6H8kmn/eQV3vhSe2aJZmzboU62lq
	 Qwea1RTKUpwE3amjnX8lPEbIWzHKQcduxr5/1pE/ZBxKefmulkxl8ObtM1hn2Q/65zqgo
	 MDg7gBkYtKYtpqQ1z0nsmWcJqY5PNBR8oxmlXWs7/epXFPBazxrhLN0dKCUO2PFqxGYzs
	 t+sjUE9ds+R6qJnWTVA6r6aE63eiBydaJVcWyyxrC5dnK2Hj1UWXY0Jgk//Z7CmWy0hWR
	 983+26PFrfmzjJ4tS9qTzMR9iQ4eMs/GG14n+ury+73wU/6Hu0GaAOvzh4BuM7lNvQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=glt1aM0j;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4903A606A33D
	for <fsverity@lists.linux.dev>; Fri, 20 Nov 2026 16:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=glt1aM0j
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D3541F01564;
	Fri, 20 Nov 2026 16:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795192582;
	bh=ddxYPK/BJZos2GF0DlxCOVpaDu359GK2hangyOfh66k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=glt1aM0jdUrw0thBLzBK58S3H2Mzsqpu0RDoJa0l5zWSB8gE9RHu3dJHD0+/08DEc
	 cPgOyWevifCSpPj84BIRftO+cC4GcosgK5Vpk7zENtavT+rhdI2LAkMIIvfi398i0C
	 eZQVYs+R3pUp10aP4EmbLG693iZrj89fVxz/ulq4Hn3O5Sgelv+piwguBi7WQnC0Uc
	 876EvocpuHlml2kzdBw1YY4oMLF5wiaBo3ybal8SdnSQ5G6yzKDreLjuxxydElGwGw
	 1S6QUaMX8SukMOsMmFGAPhEJ/5Ao2rv2BWjOR4gKBnPWaLPGl6sTAdtm1ypbqF5MHQ
	 L55aPsCBXZLCQ==
Message-ID: <sashiko-outbox-225577@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v19 14/15] xfs: introduce health state for corrupted
 fsverity metadata
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andrey Albershteyn" <aalbersh@kernel.org>, "Eric Biggers" <ebiggers@kernel.org>, "Christoph
 Hellwig" <hch@lst.de>, "Carlos Maiolino" <cem@kernel.org>, fsverity <fsverity@lists.linux.dev>
Cc: david@fromorbit.com, "Darrick J. Wong" <djwong@kernel.org>
In-Reply-To: <20261120155752.192025-15-aalbersh@kernel.org>
References: <20261120155752.192025-1-aalbersh@kernel.org>
 <20261120155752.192025-15-aalbersh@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 16:36:22 +0000
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Post: <mailto:fsverity@lists.linux.dev>
List-Help: <mailto:fsverity+help@lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fsverity+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] xfs: XFS_SICK_INO_FSVERITY is never cleared by online scrub
  or repair
- [Medium] xfs: race and stale XFS_SICK_INO_FSVERITY in
  xfs_fsverity_get_descriptor()
--

commit d3eed7a2ba01498b4bc83bae6fcdf5fb68591bb5
Author: Andrey Albershteyn <aalbersh@kernel.org>

xfs: introduce health state for corrupted fsverity metadata

This commit adds the XFS_SICK_INO_FSVERITY health flag (exposed to
userspace via bulkstat as XFS_BS_SICK_FSVERITY) and marks inodes sick
when xfs_fsverity_get_descriptor() detects corrupted fsverity metadata.

> diff --git a/fs/xfs/libxfs/xfs_health.h b/fs/xfs/libxfs/xfs_health.h
> index 1d45cf5789e86..932b447190da7 100644
> --- a/fs/xfs/libxfs/xfs_health.h
> +++ b/fs/xfs/libxfs/xfs_health.h
> @@ -104,6 +104,7 @@ struct xfs_rtgroup;
>  /* Don't propagate sick status to ag health summary during inactivation =
*/
>  #define XFS_SICK_INO_FORGET	(1 << 12)
>  #define XFS_SICK_INO_DIRTREE	(1 << 13)  /* directory tree structure */
> +#define XFS_SICK_INO_FSVERITY	(1 << 14)  /* fsverity metadata */
> =20
>  /* Primary evidence of health problems in a given group. */
>  #define XFS_SICK_FS_PRIMARY	(XFS_SICK_FS_COUNTERS | \
> @@ -140,7 +141,8 @@ struct xfs_rtgroup;
>  				 XFS_SICK_INO_XATTR | \
>  				 XFS_SICK_INO_SYMLINK | \
>  				 XFS_SICK_INO_PARENT | \
> -				 XFS_SICK_INO_DIRTREE)
> +				 XFS_SICK_INO_DIRTREE | \
> +				 XFS_SICK_INO_FSVERITY)

[Severity: Medium]
Does online scrub or repair ever clear XFS_SICK_INO_FSVERITY once it is
set?

When xchk_prepare_iscrub() runs xchk_inode_setup_verity() on an inode
with broken verity metadata, xfs_fsverity_get_descriptor() sets
XFS_SICK_INO_FSVERITY on ip->i_sick.  However, type_to_health_flag for
XFS_SCRUB_TYPE_INODE only tracks XFS_SICK_INO_CORE, and neither
xchk_inode() nor xrep_inode_verity() adds XFS_SICK_INO_FSVERITY to
sc->sick_mask or sc->healthy_mask.

After xrep_inode_verity() repairs the inode and the post-repair re-scrub
pass calls xchk_update_health(), xfs_inode_mark_healthy() clears
XFS_SICK_INO_CORE and XFS_SICK_INO_FORGET while leaving
XFS_SICK_INO_FSVERITY set on ip->i_sick.  The repaired inode continues
to report XFS_BS_SICK_FSVERITY in bulkstat, cannot be reclaimed by
xfs_reclaim_igrab(), and causes xfs_inactive_health() to falsely mark
the AG sick with XFS_SICK_AG_INODES when inactivated.

> diff --git a/fs/xfs/xfs_fsverity.c b/fs/xfs/xfs_fsverity.c
> index ec4006729e757..36520a187a2c7 100644
> --- a/fs/xfs/xfs_fsverity.c
> +++ b/fs/xfs/xfs_fsverity.c
> @@ -98,8 +98,10 @@ xfs_fsverity_get_descriptor(
>  	if (error)
>  		return error;
> =20
> -	if (is_empty)
> +	if (is_empty) {
> +		xfs_inode_mark_sick(XFS_I(inode), XFS_SICK_INO_FSVERITY);
>  		return -ENODATA;
> +	}
> =20
>  	/*
>  	 * Make sure we can open large file on a 32-bit kernel
> @@ -110,8 +112,10 @@ xfs_fsverity_get_descriptor(
> =20
>  	last_block_offset =3D
>  		XFS_FSB_TO_B(mp, rec.br_startoff + rec.br_blockcount);
> -	if (last_block_offset <=3D xfs_fsverity_metadata_offset(ip))
> +	if (last_block_offset <=3D xfs_fsverity_metadata_offset(ip)) {
> +		xfs_inode_mark_sick(XFS_I(inode), XFS_SICK_INO_FSVERITY);
>  		return -ENODATA;
> +	}
> =20
>  	desc_size_pos =3D last_block_offset - sizeof(__be32);
>  	error =3D fsverity_pagecache_read(inode, (char *)&d_desc_size,
> @@ -120,20 +124,29 @@ xfs_fsverity_get_descriptor(
>  		return error;
> =20
>  	desc_size =3D be32_to_cpu(d_desc_size);
> -	if (XFS_IS_CORRUPT(mp, desc_size > FS_VERITY_MAX_DESCRIPTOR_SIZE))
> +	if (XFS_IS_CORRUPT(mp, desc_size > FS_VERITY_MAX_DESCRIPTOR_SIZE)) {
> +		xfs_inode_mark_sick(XFS_I(inode), XFS_SICK_INO_FSVERITY);
>  		return -ERANGE;
> -	if (XFS_IS_CORRUPT(mp, desc_size > desc_size_pos))
> +	}

[Severity: Medium]
Can an in-flight xfs_fsverity_get_descriptor() race with online repair
and mark the inode sick after S_VERITY has already been cleared?

xfs_fsverity_get_descriptor() checks S_VERITY and reads the last extent
under XFS_ILOCK_EXCL, then drops XFS_ILOCK_EXCL before reading from the
pagecache and validating the descriptor without holding XFS_IOLOCK or
XFS_MMAPLOCK:

CPU0                                  CPU1
xfs_file_open()
  ...
  xfs_fsverity_get_descriptor()
    xfs_ilock(ip, XFS_ILOCK_EXCL)
    /* sees S_VERITY set */
    xfs_bmap_last_extent(...)
    xfs_iunlock(ip, XFS_ILOCK_EXCL)
                                      xchk_prepare_iscrub()
                                        xchk_ilock(sc, XFS_IOLOCK_EXCL)
                                        xchk_ilock(sc, XFS_MMAPLOCK_EXCL)
                                        truncate_inode_pages(..., isize)
                                        xchk_ilock(sc, XFS_ILOCK_EXCL)
                                      xrep_inode()
                                        xrep_inode_verity()
                                          xfs_bunmapi_range(...)
                                          inode_set_flags(..., 0, S_VERITY)
                                      xchk_teardown_inode()
    fsverity_pagecache_read(...)
    xfs_inode_mark_sick(ip,
        XFS_SICK_INO_FSVERITY)  <-- marks repaired inode sick

Besides marking the already-repaired inode sick, if CPU0 runs
fsverity_pagecache_read() between truncate_inode_pages() and
xfs_bunmapi_range(), it can also repopulate post-EOF folios in the
pagecache because read_mapping_folio() does not acquire XFS_MMAPLOCK.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120155752.1920=
25-1-aalbersh@kernel.org?part=3D14
