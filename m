Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793632272;
	b=TqFarS4lCPYnZB6pEvW3R5kWJq6w3RDUHrcLTMwm57VaBNAA9ErSk2b+OgBbvEhLMj8H
	 gLpd/4ZunmPXXjUAst2ne53XwaaJFtBsnOCBlMhOgtTN6p8X9Gzvo4IrA1yUm09GWiwQX
	 65JPpjKWbA9uGHJPlsXYsET2z3uBJckXfkqQF7fp8XKl5XYIdtzp3npXs2dpP69u7/vPN
	 tQ0O3iYroUZFP8PcpLYjaBJgvheXqC7y7dhDQfNQixH3o92UqKmmibdou3Vel/XEMIrSs
	 z2ojze+oQLBLO5oC2rrmIE5689yHp7Go2a/m6a6PxBrc182Dx8lvU99vPRBKuF6U24A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793632272;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=bwlfPmYEIt3r9Gb8O2USeU/NmnlDLGs0CshFUhe6BGs=;
	b=BlemGkOWWjDtHs2ziWveuKKvS54nLCRCNKwTVXEOEUavtMGQo4h3KowCzr2C43SZvMUl
	 ZeURDAmfyBG3GngAzmGr3btI/1NOOTdIOuHCbcLKa4IrRNHMdS8MWjRrXb8Sku7IiXimX
	 vUfdSLXdUrm0a5ajX5y+HuRNs953Y8w4wDYyIHEpHmJG4ZyJRbqqUMHTw0IiuHjtUiUpT
	 kMwAgACWc2bCfxi5qhf0KMq5513WfC0WCzn1krBAcSb25i9VDtnwzvVAdVicEPRo7ZPGp
	 d6Jf+zhe1QAzD0YOxSNP8cXkuCWTADPzJCSNCqCLygW/PLMa4sOTeAW6oypyk9CfujQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AN49Doac;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 296166076D85
	for <fsverity@lists.linux.dev>; Mon,  2 Nov 2026 15:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AN49Doac
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58B9D1F00A17;
	Mon,  2 Nov 2026 15:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793632271;
	bh=bwlfPmYEIt3r9Gb8O2USeU/NmnlDLGs0CshFUhe6BGs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AN49DoacLTn38bFOoSsB34t7zIXiBPN6nofSkgQAGZlsZyLc8tXF3EIMiFa1Q1fqH
	 +xTnQARdjpIrMknVN6Mj7B6vtIHW/oUrd544BtAh9l11X/B4j8WPLEK7S6TbwhoVee
	 dhl7pEI3umCuD4u+ZzihjnsITPkvzWkcr1XBbF5irNX4bhL/TsYVGAFJqU7HcI6/Pe
	 vW+xX6OdUzB2sF1L9gpqi+esryiq4HUhnrMrp251POgokbekNtXV+NtG3AoUtkYdJa
	 PSQeMTAh6kTECVxnKvYKz2cFyqfT/UJ5qVr+QGt53tMQ6ezqa25u39yy0pUP4NleF4
	 +b9rGjXGJx18w==
Message-ID: <sashiko-outbox-193639@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v18 08/15] xfs: don't remove written extents past EOF on
 fsverity inodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andrey Albershteyn" <aalbersh@kernel.org>, ebiggers@kernel.org, hch@lst.de, "Carlos
 Maiolino" <cem@kernel.org>, fsverity@lists.linux.dev
Cc: david@fromorbit.com, "Darrick J. Wong" <djwong@kernel.org>
In-Reply-To: <20261102144147.2393369-9-aalbersh@kernel.org>
References: <20261102144147.2393369-1-aalbersh@kernel.org>
 <20261102144147.2393369-9-aalbersh@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 15:11:10 +0000
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Post: <mailto:fsverity@lists.linux.dev>
List-Help: <mailto:fsverity+help@lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fsverity+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] xfs: written verity extents unmapped in xfs_free_eofblocks() on bi=
grtalloc
- [Medium] xfs: fsverity_active() check in xfs_can_free_eofblocks() fails i=
f !VERITY
- [Medium] xfs: premature XFS_IEOFBLOCKS clear in xfs_can_free_eofblocks()
--

commit 2307cc3d64e773ab52b2cf76f7c9b88f364d2957
Author: Andrey Albershteyn <aalbersh@kernel.org>

xfs: don't remove written extents past EOF on fsverity inodes

This commit updates xfs_can_free_eofblocks() to skip active fsverity inodes
and inodes undergoing Merkle tree construction, and modifies
xfs_free_eofblocks() to punch only delalloc and unwritten extents past EOF =
on
fsverity inodes while preserving written metadata extents.

> diff --git a/fs/xfs/xfs_bmap_util.c b/fs/xfs/xfs_bmap_util.c
> index 865aec3ae5ab3..32cec523fd52d 100644
> --- a/fs/xfs/xfs_bmap_util.c
> +++ b/fs/xfs/xfs_bmap_util.c
> @@ -31,6 +31,7 @@
>  #include "xfs_rtbitmap.h"
>  #include "xfs_rtgroup.h"
>  #include "xfs_zone_alloc.h"
> +#include <linux/fsverity.h>
> =20
>  /* Kernel only BMAP related definitions and functions */
> =20
> @@ -553,6 +554,15 @@ xfs_can_free_eofblocks(
>  	if (last_fsb <=3D end_fsb)
>  		return false;
> =20
> +	/*
> +	 * Don't clean fsverity inodes as they already have been cleaned up and
> +	 * are read-only. Skip inodes which have merkle tree being built, the
> +	 * merkle tree is written beyond EOF
> +	 */
> +	if (fsverity_active(VFS_IC(ip)) ||
> +	    xfs_iflags_test(ip, XFS_VERITY_CONSTRUCTION))
> +		return false;

[Severity: Medium]
As reported by Sashiko on v16 [1], in xfs_can_free_eofblocks() in
fs/xfs/xfs_bmap_util.c, does checking fsverity_active(VFS_IC(ip)) instead of
ip->i_diflags2 & XFS_DIFLAG2_VERITY cause sealed fsverity inodes to go
through unnecessary inactivation and tr_itruncate transactions on every VFS
cache eviction when CONFIG_FS_VERITY=3Dn?

The follow-up commit ("xfs: enable ro-compat fs-verity flag") unconditional=
ly
includes XFS_SB_FEAT_RO_COMPAT_VERITY in XFS_SB_FEAT_RO_COMPAT_ALL, allowing
read-write mounts of fsverity filesystems even on kernels built with
CONFIG_FS_VERITY=3Dn. When CONFIG_FS_VERITY=3Dn, fsverity_active() in
include/linux/fsverity.h is a stub returning false:

    static inline bool fsverity_active(const struct inode *inode)
    {
        return false;
    }

Whereas xfs_free_eofblocks() checks:

    bool has_verity =3D ip->i_diflags2 & XFS_DIFLAG2_VERITY;

When a sealed extent-format fsverity inode (with written Merkle tree and
descriptor extents past EOF) is looked up and later evicted on a
CONFIG_FS_VERITY=3Dn kernel:

    xfs_inode_mark_reclaimable()
      -> xfs_inode_needs_inactive()
        -> xfs_can_free_eofblocks()

xfs_can_free_eofblocks() sees fsverity_active() =3D=3D false, finds the pos=
t-EOF
Merkle tree extents via xfs_iext_lookup_extent(), and returns true. This
queues the inode for background inactivation, where xfs_inactive() ->
xfs_free_eofblocks() sees has_verity =3D=3D true, allocates a tr_itruncate
transaction, walks all post-EOF extents with XFS_BMAPI_UNWRITTEN without
freeing the written Merkle tree extents, logs XFS_ILOG_CORE in
xfs_itruncate_extents_flags(), and commits a dirty transaction on every
eviction.

Should xfs_can_free_eofblocks() check ip->i_diflags2 & XFS_DIFLAG2_VERITY (=
or
IS_VERITY(VFS_IC(ip))) to match xfs_free_eofblocks()?

[Severity: Medium]
Also in xfs_can_free_eofblocks() in fs/xfs/xfs_bmap_util.c, can returning
false when XFS_VERITY_CONSTRUCTION is set cause xfs_inode_free_eofblocks() =
to
prematurely clear the XFS_IEOFBLOCKS tag and leak post-EOF speculative
preallocations if Merkle tree construction later fails?

During FS_IOC_ENABLE_VERITY, enable_verity() in fs/verity/enable.c acquires
inode_lock(inode) (XFS_IOLOCK_EXCL), calls ->begin_enable_verity() which se=
ts
XFS_VERITY_CONSTRUCTION, and then drops inode_lock(inode) while calling
build_merkle_tree(). While build_merkle_tree() writes past EOF without
holding XFS_IOLOCK_EXCL:

    xfs_fsverity_write_merkle()
      -> iomap_fsverity_write()
        -> xfs_buffered_write_iomap_begin()
          -> xfs_bmapi_reserve_delalloc()
            -> xfs_inode_set_eofblocks_tag()

If background xfs_blockgc_worker() or a synchronous -ENOSPC/-EDQUOT scan ru=
ns
xfs_inode_free_eofblocks() in fs/xfs/xfs_icache.c while
XFS_VERITY_CONSTRUCTION is set, xfs_ilock_nowait(ip, XFS_IOLOCK_EXCL)
succeeds and xfs_can_free_eofblocks(ip) returns false:

    if (xfs_can_free_eofblocks(ip))
        return xfs_free_eofblocks(ip);

    /* inode could be preallocated */
    trace_xfs_inode_free_eofblocks_invalid(ip);
    xfs_inode_clear_eofblocks_tag(ip);
    return 0;

This removes the inode from the per-AG XFS_ICI_BLOCKGC_TAG radix tree while
post-EOF delalloc and speculative preallocation blocks are still attached. =
If
build_merkle_tree() subsequently fails and enable_verity() invokes the
rollback path ->end_enable_verity(filp, NULL, 0), xfs_fsverity_end_enable()
jumps to out with error =3D=3D 0 and clears XFS_VERITY_CONSTRUCTION without
calling xfs_free_eofblocks() or xfs_fsverity_reset_inode(). Because the file
descriptor for FS_IOC_ENABLE_VERITY is opened O_RDONLY, xfs_release() does
not free post-EOF blocks on close either, leaving the post-EOF blocks
untracked by blockgc until inode eviction.

> =20
>  	/*
>  	 * Check if there is an post-EOF extent to free.  If there are any
> @@ -579,6 +589,9 @@ xfs_free_eofblocks(
>  	struct xfs_trans	*tp;
>  	struct xfs_mount	*mp =3D ip->i_mount;
>  	int			error;
> +	int			bmapi_flags =3D XFS_BMAPI_NODISCARD;
> +	bool			has_verity =3D
> +			ip->i_diflags2 & XFS_DIFLAG2_VERITY;
> =20
>  	/* Attach the dquots to the inode up front. */
>  	error =3D xfs_qm_dqattach(ip);
> @@ -593,15 +606,20 @@ xfs_free_eofblocks(
>  	 *
>  	 * Note that this means we also leave speculative preallocations in
>  	 * place for preallocated files.
> +	 *
> +	 * Clean up delalloc reservations for fsverity too as those won't be
> +	 * used
>  	 */
> -	if (ip->i_diflags & (XFS_DIFLAG_PREALLOC | XFS_DIFLAG_APPEND)) {
> +	if (ip->i_diflags & (XFS_DIFLAG_PREALLOC | XFS_DIFLAG_APPEND) ||
> +			has_verity) {
>  		if (ip->i_delayed_blks) {
>  			xfs_bmap_punch_delalloc_range(ip, XFS_DATA_FORK,
>  				round_up(XFS_ISIZE(ip), mp->m_sb.sb_blocksize),
>  				LLONG_MAX, NULL);
>  		}
>  		xfs_inode_clear_eofblocks_tag(ip);
> -		return 0;
> +		if (!has_verity)
> +			return 0;
>  	}
> =20
>  	error =3D xfs_trans_alloc(mp, &M_RES(mp)->tr_itruncate, 0, 0, 0, &tp);
> @@ -613,6 +631,13 @@ xfs_free_eofblocks(
>  	xfs_ilock(ip, XFS_ILOCK_EXCL);
>  	xfs_trans_ijoin(tp, ip, 0);
> =20
> +	/*
> +	 * While fs-verity writes metadata after EOF, it can leave unwritten
> +	 * preallocations.  Clear all that out.
> +	 */
> +	if (has_verity)
> +		bmapi_flags |=3D XFS_BMAPI_UNWRITTEN;
> +
>  	/*
>  	 * Do not update the on-disk file size.  If we update the on-disk file
>  	 * size and then the system crashes before the contents of the file are
> @@ -620,7 +645,7 @@ xfs_free_eofblocks(
>  	 * bug).
>  	 */
>  	error =3D xfs_itruncate_extents_flags(&tp, ip, XFS_DATA_FORK,
> -				XFS_ISIZE(ip), XFS_BMAPI_NODISCARD);
> +				XFS_ISIZE(ip), bmapi_flags);

[Severity: High]
In xfs_free_eofblocks() in fs/xfs/xfs_bmap_util.c, if an inode has both
XFS_DIFLAG2_VERITY and bigrtalloc (xfs_inode_has_bigrtalloc(ip)), can calli=
ng
xfs_itruncate_extents_flags() with XFS_BMAPI_UNWRITTEN and a 0-block
transaction reservation convert written post-EOF fsverity metadata blocks to
unwritten and unmap them (or trigger an -ENOSPC filesystem shutdown)?

Although xfs_fsverity_begin_enable() in the follow-up patch ("xfs: add
fs-verity support") checks xfs_inode_has_bigrtalloc(ip), enable_verity() in
fs/verity/enable.c drops inode_lock(inode) immediately after
->begin_enable_verity() returns. While inode_lock(inode) is dropped on a fi=
le
with no allocated data blocks yet (where xfs_inode_has_filedata(ip) is fals=
e,
such as an empty or hole-only file before Merkle tree blocks are allocated)=
, a
concurrent FS_IOC_FSSETXATTR / file_setattr() call reaches:

    xfs_fileattr_set()
      -> xfs_ioctl_setattr_xflags()

which does not check XFS_VERITY_CONSTRUCTION or XFS_DIFLAG2_VERITY and allo=
ws
setting XFS_DIFLAG_REALTIME on the inode. In addition, xfs_dinode_verify() =
in
fs/xfs/libxfs/xfs_inode_buf.c does not reject on-disk inodes with both
XFS_DIFLAG2_VERITY and bigrtalloc.

When xfs_fsverity_end_enable() writes the fsverity descriptor on a bigrtall=
oc
inode (sb_rextsize > 1), xfs_buffered_write_iomap_begin() delegates via
xfs_get_extsz_hint() to xfs_direct_write_iomap_begin(), preallocating an
sb_rextsize-aligned unwritten realtime extent and converting only the
written descriptor block(s) to XFS_EXT_NORM, leaving an XFS_EXT_UNWRITTEN
tail in the same realtime extent.

When xfs_free_eofblocks() then calls xfs_itruncate_extents_flags() with
XFS_BMAPI_UNWRITTEN and tp->t_blk_res =3D=3D 0, __xfs_bunmapi() in
fs/xfs/libxfs/xfs_bmap.c hits the unwritten tail of that realtime extent
(where del.br_state =3D=3D XFS_EXT_UNWRITTEN, aligned at the end of the rea=
ltime
extent, but with mod =3D xfs_rtb_to_rtxoff(mp, del.br_startblock) !=3D 0 and
del.br_startoff > start):

    } else if (del.br_state =3D=3D XFS_EXT_UNWRITTEN) {
        struct xfs_bmbt_irec prev;
        xfs_fileoff_t unwrite_start;

        /*
         * This one is already unwritten.
         * It must have a written left neighbor.
         * Unwrite the killed part of that one and
         * try again.
         */
        if (!xfs_iext_prev_extent(ifp, &icur, &prev))
            ASSERT(0);
        ASSERT(prev.br_state =3D=3D XFS_EXT_NORM);

__xfs_bunmapi() converts the written left neighbor prev (containing the
written fsverity metadata) to XFS_EXT_UNWRITTEN via
xfs_bmap_add_extent_unwritten_real() without any block reservation for a bm=
ap
btree split, and then unmaps and frees the entire realtime extent on the ne=
xt
iteration.

[1] https://lore.kernel.org/r/20260918111539.1003439-15-aalbersh@kernel.org

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102144147.2393=
369-1-aalbersh@kernel.org?part=3D8
