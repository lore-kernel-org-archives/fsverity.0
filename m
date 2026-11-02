Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793633283;
	b=iwvPnsa4O59OlunqG0rYqBb1TWRoUD4etonwDexdWkie8K0UXDRQSx90Vm3jD048pcHQ
	 AKML9CClhtTwoFDYV3yU1qNZDFG3klXtqH4jg/0pMjElaQgUfvAa0ZBB5WwaFsUNaruwN
	 rpRQu0GNGZGLb8kNKPPk+F86IcmTNsnIaNI9+MSyeANDgFCjrQLSet70fskGmZ8bzEeMc
	 RXLIwpRJNNf4S/RW4u8TUkrf4zZHEKw6EIUmfESMBZVGn6zD+0yshJKONiOoMExV7lxHf
	 UEpBkCm7LpsTLeFGaSWyCKCWXQTQ6c+BbGUS+51hmoJLDwda8IFK+WM+sMCU9P8Lg3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793633283;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=M6t0EnKXFQDRWra9tW5zj09dOhThP3lvs8kDsexWN4c=;
	b=rpWRqLPmysV7XuZl2xAAqrq6OZHj9RKUo84M7WPzPSs+Qz5i/Z8V60SYxUhaQWxLnNIR
	 UxaLHpg9ftl55K56Absc4S9jj93f1c3tHYUPzxSXMUTcdFyRlIgAJSiEiO/IYdBtI1itg
	 WLS6+GdlHgcPNejPTc1rQes7o4YWb2LjF4HEikr7SGkWfJEZHOPYvHcmx0nGgPebeRhhk
	 El9ZHO6ovGTcesNuB9AYfJIrBSfXl6xEECeH/ylnaPJQzP7LtnIdxQnfl09sHXS9i1w0Y
	 e9BT80co26a8xA38BGk/Jdc7l39vUaUoFjwp4/aWARWscmJBWsTZV5PnbhkA1Oe4WSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KcJTGv1p;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7189608441D
	for <fsverity@lists.linux.dev>; Mon,  2 Nov 2026 15:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KcJTGv1p
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D46741F00A1E;
	Mon,  2 Nov 2026 15:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793633282;
	bh=M6t0EnKXFQDRWra9tW5zj09dOhThP3lvs8kDsexWN4c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KcJTGv1pYQMlww/gxWmCV9DPDyVj8HuK2wa9sJuPQqDWiY3KRpfvYeayYis94Lls8
	 b3neAeB4gW02c/km+WuK/qR9i35dHNeZ2Uzek41eqMEGIKM+7WjEftqfRg1ttnYU7p
	 /viygae7Fz0UYFi/UlIOhUEalmVb+nx1lyGvIsKd04UXwsbZ4d8rP5RFRs/OFvuvSq
	 OquSQVAncj05golR4FwvZkyGxaEYfdS1HADpF/p6fSY2LbUh3/E3EeGs9kCpp2OFuk
	 7uqwt3f2Wei3WEWkrnLsB7erDAtoctqFmMNQEnldN3xtmbCjBL/9CHscrR3cK7eBaW
	 4Tln6anJ8PAjg==
Message-ID: <sashiko-outbox-193661@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v18 13/15] xfs: check and repair the verity inode flag
 state
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andrey Albershteyn" <aalbersh@kernel.org>, ebiggers@kernel.org, hch@lst.de, "Carlos
 Maiolino" <cem@kernel.org>, fsverity@lists.linux.dev
Cc: david@fromorbit.com, "Darrick J. Wong" <djwong@kernel.org>
In-Reply-To: <20261102144147.2393369-14-aalbersh@kernel.org>
References: <20261102144147.2393369-1-aalbersh@kernel.org>
 <20261102144147.2393369-14-aalbersh@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 15:28:01 +0000
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Post: <mailto:fsverity@lists.linux.dev>
List-Help: <mailto:fsverity+help@lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fsverity+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] xfs: unhandled verity validation errors in xchk_inode_setup_verity=
()
- [High] xfs: leftover post-EOF folios and extents in xrep_inode_verity()
- [Medium] xfs: verity scrub/repair conflicts with corrupt or zapped data f=
ork
- [Low] xfs: wrong inode number passed to xchk_ino_set_corrupt() in xchk_in=
ode()
--

commit 448cf76ee21f3e490894016a838e5f7f0e7783af
Author: Darrick J. Wong <djwong@kernel.org>

xfs: check and repair the verity inode flag state

This commit adds scrub and repair checks for inodes with the fsverity flag
set, attempting to activate fsverity during setup and clearing the verity
flags if activation fails due to a metadata validation error.

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

[Severity: High]
Does this switch statement miss several error codes returned by
fsverity_ensure_verity_info() on metadata validation failures, causing
xchk_prepare_iscrub() and xrep_dinode_core() to abort with a runtime error
instead of flagging or repairing the inode?

In fs/verity/open.c, fsverity_get_descriptor() returns -EINVAL when
validate_fsverity_descriptor() fails (for example, unrecognized version,
non-zero reserved bytes, invalid salt_size or sig_size, or when
desc->data_size does not match inode->i_size, including after
xrep_dinode_size() modifies di_size):

	if (!validate_fsverity_descriptor(inode, desc, size)) {
		kfree(desc);
		return -EINVAL;
	}

Similarly, fsverity_create_info() -> fsverity_init_merkle_tree_params()
returns -EINVAL for an unsupported hash algorithm or log_blocksize, and
returns -EFBIG when the Merkle tree depth or hash block count exceeds the
maximum bounds. In addition, xfs_fsverity_get_descriptor() can return
-EFSBADCRC on a block checksum failure, and fsverity_verify_signature() can
return signature verification error codes such as -EKEYREJECTED, -ENOKEY,
-EPERM, or -ENOPKG.

Since those error codes hit the default branch here, won't scrub and repair
abort during setup before xchk_inode() or xrep_inode_verity() can run?

[ ... ]
> diff --git a/fs/xfs/scrub/inode.c b/fs/xfs/scrub/inode.c
> index bb8d2bc008e01..1d21758e0df06 100644
> --- a/fs/xfs/scrub/inode.c
> +++ b/fs/xfs/scrub/inode.c
[ ... ]
> @@ -833,6 +837,9 @@ xchk_inode(
>  	if (S_ISREG(VFS_I(sc->ip)->i_mode))
>  		xchk_inode_check_reflink_iflag(sc, I_INO(sc->ip));
> =20
> +	if (xchk_inode_verity_broken(sc->ip))
> +		xchk_ino_set_corrupt(sc, sc->sm->sm_ino);

[Severity: Low]
Should this pass I_INO(sc->ip) instead of sc->sm->sm_ino to
xchk_ino_set_corrupt()?

When scrubbing an open file where the caller passed sc->sm->sm_ino =3D=3D 0,
xchk_setup_inode() installs the live inode into sc->ip without updating
sc->sm->sm_ino, so passing sc->sm->sm_ino logs inode 0 in
trace_xchk_ino_error().

> diff --git a/fs/xfs/scrub/inode_repair.c b/fs/xfs/scrub/inode_repair.c
> index a9ccf763c0596..e84eaa8178dc7 100644
> --- a/fs/xfs/scrub/inode_repair.c
> +++ b/fs/xfs/scrub/inode_repair.c
[ ... ]
> @@ -1659,6 +1661,10 @@ xrep_dinode_core(
>  	if (iget_error)
>  		return iget_error;
> =20
> +	error =3D xchk_inode_setup_verity(sc);
> +	if (error)
> +		return error;

[Severity: Medium]
What happens if the inode's data fork BMBT is corrupt, or if
xrep_dinode_core() just zapped the data fork via xrep_dinode_zap_forks()?

First, if a verity inode has a valid dinode core but a corrupt out-of-line
data fork BMBT (XFS_DINODE_FMT_BTREE), xchk_prepare_iscrub() ->
xchk_inode_setup_verity() -> xfs_fsverity_get_descriptor() ->
xfs_bmap_last_extent() -> xfs_iread_extents() fails with -EFSCORRUPTED.
xchk_inode_setup_verity() swallows that error, and xchk_inode() then marks
XFS_SCRUB_TYPE_INODE corrupt via xchk_ino_set_corrupt(). When xrep_inode()
Subsequently runs, it sees XFS_SCRUB_OFLAG_CORRUPT and calls
xrep_inode_problems() -> xrep_inode_blockcounts() ->
xchk_inode_count_blocks() before reaching xrep_inode_verity(), which hits
-EFSCORRUPTED again in xfs_iread_extents() and fails the repair before
XFS_SCRUB_TYPE_BMAPBTD can repair the data fork.

Second, if xrep_dinode_core() had to zap the data fork in
xrep_dinode_zap_forks() (setting XFS_SICK_INO_BMBTD_ZAPPED so that
XFS_SCRUB_TYPE_BMAPBTD can later rebuild it from rmapbt), calling
xchk_inode_setup_verity() here on the newly emptied data fork will fail with
-ENODATA, causing xrep_inode_verity() to clear XFS_DIFLAG2_VERITY before
xrep_bmap_data() has a chance to rebuild the data fork.

> @@ -2198,6 +2204,27 @@ xrep_inode_reset_dquots(
>  # define xrep_inode_reset_dquots(sc)		(0)
>  #endif
> =20
> +/*
> + * If this file is a fsverity file, xchk_prepare_iscrub or xrep_dinode_c=
ore
> + * should have activated it.  If it's still not active, then there's som=
ething
> + * wrong with the verity descriptor and we should turn it off.
> + */
> +STATIC int
> +xrep_inode_verity(
> +	struct xfs_scrub	*sc)
> +{
> +	struct inode		*inode =3D VFS_I(sc->ip);
> +
> +	if (xchk_inode_verity_broken(sc->ip)) {
> +		sc->ip->i_diflags2 &=3D ~XFS_DIFLAG2_VERITY;
> +		inode_set_flags(inode, 0, S_VERITY);
> +
> +		xfs_trans_log_inode(sc->tp, sc->ip, XFS_ILOG_CORE);
> +	}
> +
> +	return 0;
> +}

[Severity: High]
When xrep_inode_verity() clears XFS_DIFLAG2_VERITY and S_VERITY, does it
also need to invalidate post-EOF pagecache folios and truncate the post-EOF
fsverity metadata extents, similar to xfs_fsverity_delete_metadata()?

During setup, xchk_inode_setup_verity() -> fsverity_ensure_verity_info() ->
xfs_fsverity_get_descriptor() -> fsverity_pagecache_read() reads the
post-EOF Merkle tree and descriptor blocks into inode->i_mapping while
S_VERITY is still set, leaving uptodate folios and written (XFS_EXT_NORM)
extents beyond i_size.

Once XFS_DIFLAG2_VERITY and S_VERITY are cleared without removing those
post-EOF folios and written extents:

1. If the file is later opened for writing and extended via truncate() or
   write(), xfs_zero_range() -> iomap_zero_range() sees IOMAP_MAPPED for the
   post-EOF written extent while inode->i_size is still at the old EOF,
   triggering WARN_ON_ONCE(folio_pos(folio) > iter->inode->i_size) in
   iomap_zero_iter().

2. If xfs_free_eofblocks() frees the post-EOF extents first (for example on
   file close), the uptodate post-EOF folios populated by
   fsverity_pagecache_read() remain in inode->i_mapping over the resulting
   IOMAP_HOLE, so a subsequent extending truncate() or write() can expose t=
he
   stale fsverity metadata bytes as file data.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102144147.2393=
369-1-aalbersh@kernel.org?part=3D13
