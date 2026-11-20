Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795192129;
	b=1fleWQyksqqFAmlLvc72bRnvQUpwryoWS1oaqVV8PUWO4H7V8Utfobrk/coSy0xXmHeE
	 TrMAxgYzdcz3Tn3T7EqOwGeS/pPQGzfv8WstB0VO6BBpcl7eKDNPybrWdzwFIFuAftrBm
	 oespFJKXc6/qxlxEF6uNYJjbMY5tHbQlV/zVQMnkS94UoA6gC34tzjE08tnVhOl+R5U3T
	 Xq5LrDORT1NC0okgOfGT95ERJUdajsHj6W7M3LrNP+dYySuh54glLPqt5XUU3qdWr0FX/
	 pIJmRj6ZJMNGh3JaaLN+xEjzAyCSbP0+5BfUK27CUQAQ5leIvKPDKI/QcQZGfceDfuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795192129;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=slA9JOyxFkS54VfpysoUh098svGKSZCaCUgkgKEGu5w=;
	b=OmPDAjVxkYeD8jn+80TViZN4GpT/UHFTBgf8pESsGeLndrP2xkTOnfn+PyACScFx4a+b
	 0YWpF96y/XeqHUx7K8fjMWITPo9rR5QpFejEt9389C9FzLgO1L0FiLZOiV5qmt50BqZ6T
	 jtH6mNhG0S6O3Ly4Ry8E6htCMzAf+TvSePgehaJCf7ZPG9wsgLfEKqwfHrMPv76aLQSIY
	 RP47dc19j0rzh1f/kHScd8viQTwewjqUGQmBuxXpZuLzSk9zCOYFjPJrjPeDCKO/iwqGi
	 PTs1AxD8I6jjfm+bGogM7tWjIusEP0VMzOM7VclgYOvx/TQ6E2zAja38i0t11ImcwmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CdAL1THH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D19606A325
	for <fsverity@lists.linux.dev>; Fri, 20 Nov 2026 16:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CdAL1THH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98A651F000C4;
	Fri, 20 Nov 2026 16:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795192129;
	bh=slA9JOyxFkS54VfpysoUh098svGKSZCaCUgkgKEGu5w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CdAL1THHtV6oktrou3Iwt0hYa2dbvzDN/pWjnYAETiVd2Sinh0XuK/USqHbs666Q+
	 4y45NHuhry8T4UpAA8+HRaFlPKzt2ZFL8EoLToM1hYziAMqdrdEmI2Z8WHPpz4ptFr
	 quXe4l8rpzhtodP0rKqv7q97AeD8uFCCwXlz/8SMsSmtPaA7mlf2rlZUwqMxLadYK4
	 X79PfXVSYdY5O0HlcFGgvyMJIt2fKQeYSnc2plbbkjU3wBqsRJlxJbMgDpN4fkr95L
	 n6+JOqfUhMZCjIwS3bkGn3jx4kou3iuBgnZrja5kEnq83puEIZs1wiIOvPBcoU3/m2
	 0irCBiFRTfwZQ==
Message-ID: <sashiko-outbox-225569@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v19 13/15] xfs: check and repair the verity inode flag
 state
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andrey Albershteyn" <aalbersh@kernel.org>, "Eric Biggers" <ebiggers@kernel.org>, "Christoph
 Hellwig" <hch@lst.de>, "Carlos Maiolino" <cem@kernel.org>, fsverity <fsverity@lists.linux.dev>
Cc: david@fromorbit.com, "Darrick J. Wong" <djwong@kernel.org>
In-Reply-To: <20261120155752.192025-14-aalbersh@kernel.org>
References: <20261120155752.192025-1-aalbersh@kernel.org>
 <20261120155752.192025-14-aalbersh@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 16:28:48 +0000
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Post: <mailto:fsverity@lists.linux.dev>
List-Help: <mailto:fsverity+help@lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fsverity+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 6 potential
issues to consider:
- [High] xfs: unhandled verity validation error codes in
  xchk_inode_setup_verity()
- [Medium] xfs: missing realtime extent size check for verity in
  xrep_dinode_flags()
- [Medium] xfs: missing post-EOF pagecache truncation in
  xrep_dinode_core()
- [Medium] xfs: verity scrub and repair mishandle corrupt or zapped data
  forks
- [Low] xfs: xfs_reflink_clear_inode_flag() runs before
  xrep_inode_verity()
- [Low] xfs: xchk_inode() passes sm_ino instead of I_INO(sc->ip) on
  broken verity
--

commit 900d4ad794cd099d5e6c56defb28f056e4bd90b5
Author: Darrick J. Wong <djwong@kernel.org>

xfs: check and repair the verity inode flag state

This commit adds scrub and repair logic to activate fsverity on inodes
with the verity flag set, clearing the flag and unmapping post-EOF
Merkle tree extents if fsverity metadata validation fails.

> diff --git a/fs/xfs/scrub/common.c b/fs/xfs/scrub/common.c
> index cbfe5e6f779df..fb0ae227df54a 100644
> --- a/fs/xfs/scrub/common.c
> +++ b/fs/xfs/scrub/common.c
[ ... ]
> @@ -1765,3 +1767,54 @@ xchk_inode_count_blocks(
>  	return xfs_bmap_count_blocks(sc->tp, sc->ip, whichfork, nextents,
>  			count);
>  }
> +
> +/*
> + * If this inode has S_VERITY set on it, read the verity info. If the re=
ading
> + * fails with anything other than ENOMEM, the file is corrupt, which we =
can
> + * detect later with fsverity_active.
> + *
> + * Callers must hold the IOLOCK and must not hold the ILOCK of sc->ip be=
cause
> + * activation reads inode data.
> + */
> +int
> +xchk_inode_setup_verity(
> +	struct xfs_scrub	*sc)
> +{
> +	int			error;
> +
> +	if (!fsverity_active(VFS_I(sc->ip)))
> +		return 0;
> +
> +	error =3D fsverity_ensure_verity_info(VFS_I(sc->ip));
> +	switch (error) {
> +	case 0:
> +		/* fsverity is active */
> +		break;
> +	case -ENODATA:
> +	case -EMSGSIZE:
> +	case -EFSCORRUPTED:
> +	case -ERANGE:
> +	case -EBADMSG:
> +		/*
> +		 * The nonzero errno codes above are the error codes that can
> +		 * be returned from fsverity on metadata validation errors.
> +		 */
> +		return 0;
> +	default:
> +		/* runtime errors */
> +		return error;
> +	}
> +
> +	return 0;
> +}

[Severity: High]
Does xchk_inode_setup_verity() miss validation errors such as -EINVAL
and -EFBIG from fsverity_ensure_verity_info()?

In fs/verity/open.c, validate_fsverity_descriptor() returns -EINVAL when
descriptor fields (such as version, hash algorithm, log_blocksize, or
data_size !=3D inode->i_size) are invalid, and
fsverity_init_merkle_tree_params() returns -EINVAL or -EFBIG on invalid
Merkle tree parameters.  xfs_fsverity_get_descriptor() can also return
-EFBIG or -EFSBADCRC, and signature verification can return
-EKEYREJECTED, -ENOKEY, -EPERM, or -ENOPKG.

Because these error codes hit the default branch, xchk_prepare_iscrub()
and xrep_dinode_core() abort the scrub ioctl with a runtime error before
xchk_inode() can mark the inode corrupt or xrep_inode_verity() can clear
the broken verity state.

> diff --git a/fs/xfs/scrub/inode.c b/fs/xfs/scrub/inode.c
> index bb8d2bc008e01..931c677d7ac8d 100644
> --- a/fs/xfs/scrub/inode.c
> +++ b/fs/xfs/scrub/inode.c
[ ... ]
> @@ -833,6 +852,9 @@ xchk_inode(
>  	if (S_ISREG(VFS_I(sc->ip)->i_mode))
>  		xchk_inode_check_reflink_iflag(sc, I_INO(sc->ip));
> =20
> +	if (xchk_inode_verity_broken(sc->ip))
> +		xchk_ino_set_corrupt(sc, sc->sm->sm_ino);
> +
>  	xchk_inode_check_unlinked(sc);
> =20
>  	xchk_inode_xref(sc, I_INO(sc->ip), &di);

[Severity: Low]
Should this pass I_INO(sc->ip) instead of sc->sm->sm_ino to
xchk_ino_set_corrupt(), like the surrounding checks in xchk_inode()?
When scrubbing by open file descriptor with sm_ino =3D=3D 0, passing
sc->sm->sm_ino logs inode 0x0 in trace_xchk_ino_error().

> diff --git a/fs/xfs/scrub/inode_repair.c b/fs/xfs/scrub/inode_repair.c
> index a9ccf763c0596..ddf3c3dce2f93 100644
> --- a/fs/xfs/scrub/inode_repair.c
> +++ b/fs/xfs/scrub/inode_repair.c
> @@ -577,6 +577,8 @@ xrep_dinode_flags(
>  		dip->di_nrext64_pad =3D 0;
>  	else if (dip->di_version >=3D 3)
>  		dip->di_v3_pad =3D 0;
> +	if (!xfs_has_verity(mp) || !S_ISREG(mode))
> +		flags2 &=3D ~XFS_DIFLAG2_VERITY;

[Severity: Medium]
Should xrep_dinode_flags() also clear XFS_DIFLAG2_VERITY when
(flags & XFS_DIFLAG_REALTIME) && mp->m_sb.sb_rextsize > 1?

xfs_dinode_verify() rejects dinodes that have both XFS_DIFLAG2_VERITY
and XFS_DIFLAG_REALTIME set when sb_rextsize > 1:

fs/xfs/libxfs/xfs_inode_buf.c:xfs_dinode_verify() {
    ...
	if (flags2 & XFS_DIFLAG2_VERITY) {
		if (!xfs_has_verity(mp))
			return __this_address;
		if (!S_ISREG(mode))
			return __this_address;
		...
		if ((flags & XFS_DIFLAG_REALTIME) && mp->m_sb.sb_rextsize > 1)
			return __this_address;
	}
    ...
}

If a corrupt dinode has realtime extents and XFS_DIFLAG2_VERITY on a
filesystem with sb_rextsize > 1, xrep_dinode_core() logs the dinode
buffer with both flags still set, fails xchk_iget() with -EFSCORRUPTED,
and commits the dirty inode cluster buffer, which will fail
xfs_inode_buf_verify() on writeback and shut down the filesystem.

> @@ -1659,6 +1661,10 @@ xrep_dinode_core(
>  	if (iget_error)
>  		return iget_error;
> =20
> +	error =3D xchk_inode_setup_verity(sc);
> +	if (error)
> +		return error;
> +
>  	error =3D xchk_trans_alloc(sc, 0);
>  	if (error)
>  		return error;

[Severity: Medium]
Does xrep_dinode_core() need to lock XFS_MMAPLOCK_EXCL and call
truncate_inode_pages(VFS_I(sc->ip)->i_mapping, XFS_ISIZE(sc->ip)) when
xchk_inode_verity_broken(sc->ip) is true, just as xchk_prepare_iscrub()
does?

When an inode initially fails xfs_iget() and is repaired via
xrep_dinode_core(), xchk_prepare_iscrub() does not run before
xrep_inode().  xchk_inode_setup_verity() populates uptodate post-EOF
pagecache folios while reading the descriptor, and xrep_inode_verity()
then unmaps the post-EOF extents and clears S_VERITY without
truncating those folios, leaving stale Merkle tree pages over a hole
that can be exposed by a later extending write or truncate.

> @@ -2198,6 +2204,40 @@ xrep_inode_reset_dquots(
>  # define xrep_inode_reset_dquots(sc)		(0)
>  #endif
> =20
> +/*
> + * If this file is a fsverity file, xchk_prepare_iscrub or xrep_dinode_c=
ore
> + * should have activated it.  If it's still not active, then there's som=
ething
> + * wrong with the verity descriptor, so turn verity off and free the orp=
haned
> + * Merkle tree that XFS keeps in extents beyond EOF.
> + */
> +STATIC int
> +xrep_inode_verity(
> +	struct xfs_scrub	*sc)
> +{
> +	struct inode		*inode =3D VFS_I(sc->ip);
> +	struct xfs_mount	*mp =3D sc->mp;
> +	int			error;
> +
> +	if (!xchk_inode_verity_broken(sc->ip))
> +		return 0;
> +
> +	/*
> +	 * The fsverity descriptor cannot be activated, so disable verity and
> +	 * free the Merkle tree, which XFS stores in beyond EOF. The stale
> +	 * Merkle tree page cache was already dropped during scrub setup.
> +	 */
> +	error =3D xfs_bunmapi_range(&sc->tp, sc->ip, 0,
> +			XFS_B_TO_FSB(mp, XFS_ISIZE(sc->ip)), XFS_MAX_FILEOFF);
> +	if (error)
> +		return error;
> +
> +	sc->ip->i_diflags2 &=3D ~XFS_DIFLAG2_VERITY;
> +	inode_set_flags(inode, 0, S_VERITY);
> +
> +	xfs_trans_log_inode(sc->tp, sc->ip, XFS_ILOG_CORE);
> +	return 0;
> +}

[Severity: Medium]
What happens if the inode's data fork was zapped by
xrep_dinode_zap_dfork() in xrep_dinode_core(), or if its out-of-line
data fork BMBT is corrupt?

If xrep_dinode_zap_dfork() zapped the data fork to 0 extents (setting
ri->ino_sick_mask |=3D XFS_SICK_INO_BMBTD_ZAPPED so BMAPBTD repair will
rebuild it from rmapbt later), xchk_inode_setup_verity() runs on the
empty fork and fails with -ENODATA.  xrep_inode_verity() then runs
xfs_bunmapi_range() as a no-op on the empty fork and clears
XFS_DIFLAG2_VERITY and S_VERITY; when xrep_bmap_data() later rebuilds
the data fork from rmapbt, it will reattach the post-EOF Merkle tree
extents onto a non-verity file.

Conversely, if the dinode core is valid but the out-of-line data fork
BMBT is corrupt, xchk_inode_setup_verity() swallows -EFSCORRUPTED from
xfs_iread_extents(), causing xchk_inode() to mark the inode core corrupt
and xrep_inode() to fail with -EFSCORRUPTED before XFS_SCRUB_TYPE_BMAPBTD
can repair the data fork.

> @@ -2247,6 +2287,15 @@ xrep_inode(
>  			return error;
>  	}
> =20
> +	/*
> +	 * Disable fsverity if it cannot be activated.  Activation failure
> +	 * prohibits the file from being opened, so there cannot be another
> +	 * program with an open fd to what it thinks is a verity file.
> +	 */
> +	error =3D xrep_inode_verity(sc);
> +	if (error)
> +		return error;
> +
>  	/* Reconnect incore unlinked list */
>  	error =3D xrep_inode_unlinked(sc);
>  	if (error)

[Severity: Low]
Should xrep_inode_verity() run before xfs_reflink_clear_inode_flag()?

xfs_reflink_inode_has_shared_extents() scans the entire data fork up to
XFS_MAX_FILEOFF.  If a broken verity inode only had shared extents in
the post-EOF Merkle tree region, running xfs_reflink_clear_inode_flag()
before xrep_inode_verity() unmaps those extents leaves
XFS_DIFLAG2_REFLINK set, causing the post-repair recheck in
xchk_inode_check_reflink_iflag() to flag XFS_SCRUB_OFLAG_PREEN.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120155752.1920=
25-1-aalbersh@kernel.org?part=3D13
