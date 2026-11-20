Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795193485;
	b=ynx2mM7gUOKGsKImIBFzMdcQY0MfABP6HSRWhvrLewtcOn2ddog0kvP014DFHLDGez47
	 97XrHD8sgVr0gmY97fcd4HOaKpZprcXfM5g8AWWvpRgotDm8GPtT1V4x9KwNGDjnVnsFQ
	 xVOo23tMzkgvZp7D3CkCmj3udrGKFRr5UdpHSRHbDiiL5dJlVfkvisvvQaNKo2PbHSOxk
	 t0lV+jVn1ub4ebYiZ8U/nMmHpYiHLx1Q7QdTY7JBHbhKYZuvpDM9NkSQrM+UTjL2veQfI
	 qzNroR/0SWwkBK6WT3nq0oz/7aQvdtKuxQc4qIfl2K7M4pag38sVSssEpgv4zxN5fcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795193485;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=5zaeZy2I3Qqz2nv0MfbN4FuSATDzN7p1Q3YeR9EYjvA=;
	b=5KEqccO5nAPCV12kkYiogOpe9CQm18fn/1ODCsBojhnz0gZDM4dGkLV2PRPhi5YKhcOw
	 sR3g2NsilJE0IUpu3eF062vsozW5BuKXsWi/ZO/Ejlnwr+TBO0voR/O0ydx5S6LZW4spA
	 CGU3xo8qLf6hyK7qECO7vHfYJFlmSUWdmdfBeqoxVcPUoMaFqnc13+1QOoA2WxzchUDvX
	 gKfV7bXlrKRKolsYvWSazT0iStBVZEZPCUm/wF06Vz3tkzbpNp0wg68KczXJr1C/rknn0
	 spGwzOTsHlIhPDJQ8phuM2U+1lweDZVvxDOHzMPup/rdYOTWDL9YyOGw6fKyDjYONEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Hkuo0D0O;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B713606A334
	for <fsverity@lists.linux.dev>; Fri, 20 Nov 2026 16:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Hkuo0D0O
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 923CA1F000D1;
	Fri, 20 Nov 2026 16:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795193484;
	bh=5zaeZy2I3Qqz2nv0MfbN4FuSATDzN7p1Q3YeR9EYjvA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Hkuo0D0OZQ4O3ohiJLSf2au7fJ1ov2i23rNO0B0GF7yE0g95ruQGu44qaihYJITib
	 hxPe/EqSxvdm7PeceC0wlFTedlA6fqbikG8ujjv2LfzJ3f3GYzw+hbKeDEAhz+iWPS
	 4bjKOsYKpNV2bLi58parUhCT/Upi2j+Bm7KP/7tfDQ+Qp57S0JX0gfYlegyZ725xzC
	 JZH6FHwwNh2Kq6Bl/VixmVcO9i6CXpsyRUd7ZidiEwur9/jFo5BMrPFtep+WLOVAT4
	 QWZD8lEJQflS3E9Q3eLyFQR6pHLWTuScK2ynKeFVXwBwSlwafpuF/C4fp+JafgMkEJ
	 mNr+swpTA9uwA==
Message-ID: <sashiko-outbox-225600@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v19 09/15] xfs: add fs-verity support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andrey Albershteyn" <aalbersh@kernel.org>, "Eric Biggers" <ebiggers@kernel.org>, "Christoph
 Hellwig" <hch@lst.de>, "Carlos Maiolino" <cem@kernel.org>, fsverity <fsverity@lists.linux.dev>
Cc: david@fromorbit.com
In-Reply-To: <20261120155752.192025-10-aalbersh@kernel.org>
References: <20261120155752.192025-1-aalbersh@kernel.org>
 <20261120155752.192025-10-aalbersh@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 16:51:24 +0000
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Post: <mailto:fsverity@lists.linux.dev>
List-Help: <mailto:fsverity+help@lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fsverity+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 7 potential
issues to consider:
- [High] xfs: skipped post-EOF verity writeback in
  xfs_fsverity_end_enable()
- [High] xfs: undeclared fsverity_is_building() and missing verity
  building state
- [Medium] xfs: missing extent bounds check in
  xfs_fsverity_get_descriptor()
- [Medium] xfs: missing verity di_size check in xfs_dinode_verify()
  causes overflow
- [Medium] xfs: broken error rollback in xfs_fsverity_reset_inode()
- [Low] xfs: bogus corruption check and bounds checks in
  xfs_fsverity_get_descriptor()
- [Low] xfs: duplicate inclusion of xfs_fsverity.h in fs/xfs/xfs_super.c
--

commit e657f01948f31434d0a0fecaa28699dd1636b20c
Author: Andrey Albershteyn <aalbersh@kernel.org>

xfs: add fs-verity support

This commit integrates XFS with fs-verity by implementing the
fsverity_operations callbacks to read and write the Merkle tree and verity
descriptor in the inode data fork past EOF.

> diff --git a/fs/xfs/libxfs/xfs_inode_buf.c b/fs/xfs/libxfs/xfs_inode_buf.c
> index 13042e1eaf351..fdcfc1f3f472b 100644
> --- a/fs/xfs/libxfs/xfs_inode_buf.c
> +++ b/fs/xfs/libxfs/xfs_inode_buf.c
> @@ -764,6 +764,17 @@ xfs_dinode_verify(
>  			return __this_address;
>  		if (!S_ISREG(mode))
>  			return __this_address;
> +		/*
> +		 * fs-verity stores the Merkle tree past EOF, so it cannot
> +		 * coexist with a realtime allocation unit larger than a single
> +		 * filesystem block. This is because we remove any unwritten
> +		 * extents beyond EOF for fs-verity inodes. The realtime inode
> +		 * with larger extents could have EOF in the middle of the
> +		 * extent. Enabling fsverity on such inode could lead to removal
> +		 * of data before EOF.
> +		 */
> +		if ((flags & XFS_DIFLAG_REALTIME) && mp->m_sb.sb_rextsize > 1)
> +			return __this_address;
>  	}

[Severity: Medium]
Should xfs_dinode_verify() also reject XFS_DIFLAG2_VERITY inodes whose
di_size exceeds XFS_FSVERITY_LARGEST_FILE_FSB(mp), matching the check in
xfs_fsverity_begin_enable()?

Without an upper bound check on di_size, an on-disk verity inode with
di_size > LLONG_MAX - XFS_FSVERITY_START_ALIGN + 1 passes verification and
overflows signed loff_t to LLONG_MIN in xfs_fsverity_metadata_offset():

fs/xfs/libxfs/xfs_verity.c:xfs_fsverity_metadata_offset() {
	return round_up(i_size_read(VFS_IC(ip)), XFS_FSVERITY_START_ALIGN);
}

With a negative metadata offset, xfs_fsverity_is_file_data() returns false
and xfs_iomap_is_fsverity_metadata() returns true for all non-negative
file offsets, causing normal file data reads to be treated as unverified
verity metadata.

> diff --git a/fs/xfs/xfs_fsverity.c b/fs/xfs/xfs_fsverity.c
> index 8fc3e763c017b..ec4006729e757 100644
> --- a/fs/xfs/xfs_fsverity.c
> +++ b/fs/xfs/xfs_fsverity.c
[ ... ]
> +static int
> +xfs_fsverity_get_descriptor(
> +	struct inode		*inode,
> +	void			*buf,
> +	size_t			buf_size)
> +{
[ ... ]
> +	/*
> +	 * Make sure we can open large file on a 32-bit kernel
> +	 */
> +	if (rec.br_startoff + rec.br_blockcount >
> +			XFS_B_TO_FSB(mp, inode->i_sb->s_maxbytes))
> +		return -EFBIG;
> +
> +	last_block_offset =3D
> +		XFS_FSB_TO_B(mp, rec.br_startoff + rec.br_blockcount);
> +	if (last_block_offset <=3D xfs_fsverity_metadata_offset(ip))
> +		return -ENODATA;
> +
> +	desc_size_pos =3D last_block_offset - sizeof(__be32);
> +	error =3D fsverity_pagecache_read(inode, (char *)&d_desc_size,
> +			sizeof(d_desc_size), desc_size_pos);
> +	if (error)
> +		return error;
> +
> +	desc_size =3D be32_to_cpu(d_desc_size);
> +	if (XFS_IS_CORRUPT(mp, desc_size > FS_VERITY_MAX_DESCRIPTOR_SIZE))
> +		return -ERANGE;
> +	if (XFS_IS_CORRUPT(mp, desc_size > desc_size_pos))
> +		return -ERANGE;
> +
> +	if (!buf_size)
> +		return desc_size;
> +
> +	if (XFS_IS_CORRUPT(mp, desc_size > buf_size))
> +		return -ERANGE;

[Severity: Low]
Is desc_size > buf_size an on-disk corruption condition?  buf_size is the
caller-supplied buffer length and desc_size has already been checked
against FS_VERITY_MAX_DESCRIPTOR_SIZE, so a caller passing a smaller
buffer triggers a false XFS_IS_CORRUPT() report.

Also, returning early when !buf_size skips the desc_pos >=3D
xfs_fsverity_metadata_offset(ip) check below, so the initial size probe in
fsverity_get_descriptor() accepts a corrupt desc_size that overlaps the
file data region.  Finally, XFS_B_TO_FSB(mp, inode->i_sb->s_maxbytes)
rounds LLONG_MAX up to 1ULL << (63 - sb_blocklog), which overflows signed
xfs_fsize_t in XFS_FSB_TO_B(); using XFS_B_TO_FSBT() avoids that overflow.

> +	desc_pos =3D round_down(desc_size_pos - desc_size, blocksize);
> +	if (desc_pos < xfs_fsverity_metadata_offset(ip))
> +		return -ERANGE;
> +
> +	error =3D fsverity_pagecache_read(inode, buf, desc_size, desc_pos);
> +	if (error)
> +		return error;
> +
> +	return desc_size;
> +}

[Severity: Medium]
Can fsverity_pagecache_read() read across a hole in [desc_pos,
last_block_offset) and expose uninitialized pagecache memory?

xfs_fsverity_get_descriptor() checks desc_pos against
xfs_fsverity_metadata_offset(ip), but does not verify that rec.br_state =3D=
=3D
XFS_EXT_NORM or that desc_pos >=3D XFS_FSB_TO_B(mp, rec.br_startoff) so that
the entire descriptor lives within the last written extent.

When xfs_fsverity_get_descriptor() is called from
fsverity_ensure_verity_info(), S_VERITY is already set on the inode (so
xfs_bmbt_to_iomap() sets IOMAP_F_FSVERITY), while fsverity_get_info(inode)
is still NULL.  If [desc_pos, desc_pos + desc_size) hits a hole,
iomap_read_folio_iter() skips fsverity_fill_zerohash() because ctx->vi is
NULL and marks the newly allocated folio uptodate without zeroing it:

fs/iomap/buffered-io.c:iomap_read_folio_iter() {
    ...
		if ((iomap->flags & IOMAP_F_FSVERITY) &&
		    iomap->type =3D=3D IOMAP_HOLE) {
			if (ctx->vi)
				fsverity_fill_zerohash(folio, poff, plen,
						       ctx->vi);
			iomap_set_range_uptodate(folio, poff, plen);
		}
    ...
}

That leaves uninitialized kernel page memory cached in inode->i_mapping
and readable via FS_IOC_READ_VERITY_METADATA.

[ ... ]

> +static int
> +xfs_fsverity_reset_inode(
> +	struct xfs_inode	*ip)
> +{
> +	int			error;
> +	struct xfs_mount	*mp =3D ip->i_mount;
> +	struct xfs_trans	*tp;
> +
> +	error =3D xfs_fsverity_delete_metadata(ip);
> +	if (error)
> +		return error;
> +
> +	/*
> +	 * First, let's clean in-memory fsverity flag and then reset it on the
> +	 * disk
> +	 */
> +	inode_set_flags(VFS_I(ip), 0, S_VERITY);
> +
> +	/*
> +	 * Set fsverity inode flag
> +	 */
> +	error =3D xfs_trans_alloc_inode(ip, &M_RES(mp)->tr_ichange,
> +			0, 0, false, &tp);
> +	if (error)
> +		return error;
> +
> +	ip->i_diflags2 &=3D ~XFS_DIFLAG2_VERITY;
> +
> +	xfs_trans_log_inode(tp, ip, XFS_ILOG_CORE);
> +	xfs_trans_set_sync(tp);
> +
> +	error =3D xfs_trans_commit(tp);
> +	xfs_iunlock(ip, XFS_ILOCK_EXCL);
> +	return error;
> +}

[Severity: Medium]
Does xfs_fsverity_reset_inode() leave XFS_DIFLAG2_VERITY set on the
in-core inode if xfs_trans_commit() fails in xfs_fsverity_end_enable(),
while running an unnecessary synchronous transaction on earlier errors?

In xfs_fsverity_end_enable(), S_VERITY is only set after
xfs_trans_commit() succeeds, and ip->i_diflags2 |=3D XFS_DIFLAG2_VERITY is
only set inside that final transaction.  If xfs_trans_commit() fails, the
filesystem shuts down without persisting XFS_DIFLAG2_VERITY, and
xfs_fsverity_delete_metadata() fails immediately in xfs_trans_alloc() and
returns before clearing ip->i_diflags2.  Conversely, if
xfs_fsverity_end_enable() fails before the final transaction,
XFS_DIFLAG2_VERITY was never set, so allocating and committing a
synchronous tr_ichange transaction here is unnecessary.

[ ... ]

> +static int
> +xfs_fsverity_end_enable(
> +	struct file		*file,
> +	const void		*desc,
> +	size_t			desc_size,
> +	u64			merkle_tree_size)
> +{
[ ... ]
> +	/*
> +	 * Wait for Merkle tree get written to disk before setting on-disk inode
> +	 * flag and clearing I_VERITY_BUILDING
> +	 */
> +	error =3D filemap_write_and_wait_range(inode->i_mapping, range_start,
> +			LLONG_MAX);
> +	if (error)
> +		goto out;
> +
> +	/*
> +	 * Proactively remove unwritten extents left by COW preallocations and
> +	 * write preallocation in the merkle tree holes and past descriptor,
> +	 * and any delayed preallocations
> +	 */
> +	error =3D xfs_free_eofblocks(ip);
> +	if (error)
> +		goto out;

[Severity: High]
Does filemap_write_and_wait_range() skip writing back every post-EOF
Merkle tree and descriptor folio, after which xfs_free_eofblocks() punches
out their delayed allocation extents?

xfs_vm_writepages() zero-initializes struct xfs_writepage_ctx wpc (leaving
wpc.ctx.iomap.flags =3D=3D 0) before calling iomap_writepages().  For the
first folio at or past range_start (>=3D i_size), iomap_writeback_folio()
calls iomap_writeback_handle_eof() before calling iomap_writeback_range()
-> xfs_map_blocks():

fs/iomap/buffered-io.c:iomap_writeback_handle_eof() {
    ...
	if (wpc->iomap.flags & IOMAP_F_FSVERITY) {
		WARN_ON_ONCE(folio_pos(folio) < isize);
		return true;
	}

	if (*end_pos > isize) {
		size_t poff =3D offset_in_folio(folio, isize);
		pgoff_t end_index =3D isize >> PAGE_SHIFT;

		if (folio->index > end_index ||
		    (folio->index =3D=3D end_index && poff =3D=3D 0))
			return false;
    ...
}

Because IOMAP_F_FSVERITY has not been set in wpc->iomap.flags yet and
folio_pos(folio) >=3D round_up(isize, 65536), iomap_writeback_handle_eof()
returns false on every post-EOF folio without ever calling
xfs_map_blocks().  xfs_free_eofblocks() then punches out all post-EOF
delalloc blocks via xfs_bmap_punch_delalloc_range(), leaving the sealed
verity inode with no Merkle tree or descriptor extents on disk.

> diff --git a/fs/xfs/xfs_ioctl.c b/fs/xfs/xfs_ioctl.c
> index f81b6e52ac403..7c7435543051a 100644
> --- a/fs/xfs/xfs_ioctl.c
> +++ b/fs/xfs/xfs_ioctl.c
> @@ -562,6 +562,14 @@ xfs_ioctl_setattr_xflags(
>  		if (xfs_inode_has_filedata(ip))
>  			return -EINVAL;
> =20
> +		/*
> +		 * fs-verity is incompatible with a realtime allocation unit
> +		 * larger than a single filesystem block, so don't let a file be
> +		 * converted to realtime while verity is being enabled.
> +		 */
> +		if (fsverity_is_building(VFS_IC(ip)))
> +			return -EINVAL;
> +
>  		/*
>  		 * If S_DAX is enabled on this file, we can only switch the
>  		 * device if both support fsdax.  We can't update S_DAX because
> @@ -574,6 +582,17 @@ xfs_ioctl_setattr_xflags(
>  			return -EINVAL;
>  	}
> =20
> +	/*
> +	 * fs-verity is incompatible with DAX, and xfs_fsverity_begin_enable()
> +	 * verified the inode was not DAX under the inode lock.  That lock is
> +	 * dropped while the Merkle tree is built, so reject enabling DAX while
> +	 * verity is being enabled.
> +	 */
> +	if ((fa->fsx_xflags & FS_XFLAG_DAX) &&
> +	    !(ip->i_diflags2 & XFS_DIFLAG2_DAX) &&
> +	    fsverity_is_building(VFS_IC(ip)))
> +		return -EINVAL;

[Severity: High]
Does this fail to build because fsverity_is_building() is neither declared
nor defined anywhere in the tree, and is the in-progress verity building
state missing from xfs_fsverity_begin_enable() and
xfs_fsverity_end_enable()?

The commit message notes that XFS_IVERITY_CONSTRUCTION is set while the
Merkle tree is being built, and xfs_fsverity_end_enable() mentions
clearing I_VERITY_BUILDING, but neither flag nor fsverity_is_building() is
defined, and xfs_fsverity_begin_enable() and xfs_fsverity_end_enable()
never set, test, or clear any verity-construction state on the inode.

In addition to the build failure here (and at the fsverity_is_building()
callers introduced in commit "xfs: clamp file size for reading for
fsverity" and commit "xfs: don't preallocate past descriptor block for
fsverity"), nothing returns -EBUSY if a second FS_IOC_ENABLE_VERITY starts
after enable_verity() drops inode_lock() to build the Merkle tree, and
xfs_iomap_is_fsverity_metadata() and xfs_free_eofblocks() cannot tell that
verity is being built before S_VERITY is set.

> diff --git a/fs/xfs/xfs_super.c b/fs/xfs/xfs_super.c
> index 532bf304a921b..890fa5727d56e 100644
> --- a/fs/xfs/xfs_super.c
> +++ b/fs/xfs/xfs_super.c
> @@ -30,6 +30,7 @@
>  #include "xfs_filestream.h"
>  #include "xfs_quota.h"
>  #include "xfs_sysfs.h"
> +#include "xfs_fsverity.h"

[Severity: Low]
This isn't a bug, but xfs_fsverity.h is already included in
fs/xfs/xfs_super.c by commit "xfs: use read ioend for fsverity data
verification".

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120155752.1920=
25-1-aalbersh@kernel.org?part=3D9
