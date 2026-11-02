Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793633684;
	b=K6rHQgI6HGqvixg5NBadHDP9EjYOOMF+IS5k96DJf6hDzqxi21lfFgGOM3gDUEv4Fb8e
	 Of51JiyqwIntYKrNmcXrJR+UAfSfZeEjVkA9JlDsDr9UFfr3b5Me87kyQXErBu5L1Afuq
	 xNvetB4eaxLf9K+Pup9RqlMj/2Mr8/tQeJlPeXVYMeoBhjZD89RTW6nxuj6J7nQadpUWf
	 JgkshNIYXNGS5DptnRzxjZHgG/L87r1+C+wKLCkOLyxjZ2VhbTxexxvKXZZnfY6aDzyBS
	 +uZie6bGqkCR0dfX/pb9TX056GSenvVSh+Xh6Di3TA43VZ9j8L+68cIABLeuO7M66jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793633684;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=sa2Eq8wS/Fp7+/iqks3ckfjeM5ATIyCzP0u6YTxRuOw=;
	b=dpKCbBrJ5/FnvJ7kM4eqjRXnp0DKSAkjWkP83/6yAFqkpCRqrISqvssL/J7liq3H7Yq6
	 /piR0TJAyMrKLTkMJwN24MhSVpB5vjlqW7v4Si4D9hLadF5+1gN/bzTQ1whFpVntB0di/
	 ghC8+2PBWpu+Qo8F+u5xF3mK/0nDh1U5mw2nx+xnG6nvhNvGL+l/1Je2O/NkocO/4/4lU
	 OTPft2z02vwTHkqFvS+90uwZVOGSsXmoloCq8/F+cWgCmYavubv4/nOmDDOXRxG1Df1hf
	 Qyz3d5coKgvQS7BZLNiW1AjvqCWOzcQb4z48y3+gCWOQ/z3ct1zkY8oU8peQEbhfikA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="ZlU/K07f";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 307D560A0CA4
	for <fsverity@lists.linux.dev>; Mon,  2 Nov 2026 15:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZlU/K07f
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 877AB1F00A1B;
	Mon,  2 Nov 2026 15:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793633683;
	bh=sa2Eq8wS/Fp7+/iqks3ckfjeM5ATIyCzP0u6YTxRuOw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZlU/K07fmLQYprTT0doMMYIPeLGU/W4Ru/srUiIXZ/7kEuSbTh9d49WPgoONXJ01a
	 UuNIEEflNU8Zwp2cf/YggVfnpqM1R63uwTjMmrHA2ie/07xNhvX24hCNCEoDMPCQG1
	 +9iivBzhlA6C08DlLkYBiDzAULSfrVUfT3lBVLAK+hiWHouK6iwt6nmW97Fb4B1iJO
	 gbGwpPQDAgjAIXC+No3gpebrF5s3ZZdY59HMbgRSzvUGAAAbHH94WDedJUN+oHcFj2
	 iXFzZA525JbDw4bwsdh5PBYESQGWnj05Sahk5mBXmqdxn41JhKT1VVz1axuEXrLUyj
	 alZwCGVyvFZ8g==
Message-ID: <sashiko-outbox-193675@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v18 09/15] xfs: add fs-verity support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andrey Albershteyn" <aalbersh@kernel.org>, ebiggers@kernel.org, hch@lst.de, "Carlos
 Maiolino" <cem@kernel.org>, fsverity@lists.linux.dev
Cc: david@fromorbit.com
In-Reply-To: <20261102144147.2393369-10-aalbersh@kernel.org>
References: <20261102144147.2393369-1-aalbersh@kernel.org>
 <20261102144147.2393369-10-aalbersh@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 15:34:43 +0000
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Post: <mailto:fsverity@lists.linux.dev>
List-Help: <mailto:fsverity+help@lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fsverity+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] xfs: skipped metadata cleanup when desc is NULL in xfs_fsverity_en=
d_enable()
- [High] xfs: premature S_VERITY publication and broken rollback in xfs_fsv=
erity_end_enable()
- [High] xfs: NULL xfs_zone_alloc_ctx dereference when enabling verity on z=
oned inodes
- [High] xfs: missing s_maxbytes bounds checks in xfs_fsverity_write_descri=
ptor() and xfs_fsverity_get_descriptor()
- [High] xfs: compound Merkle folios with bs > ps in xfs_fsverity_read_merk=
le()
- [High] xfs: missing extent bounds check in xfs_fsverity_get_descriptor()
--

commit 996c2dec93ad3f7a7f8b9c7b85e6cd7f58d990bd
Author: Andrey Albershteyn <aalbersh@kernel.org>

xfs: add fs-verity support

This commit integrates XFS with fs-verity by implementing
xfs_fsverity_ops to read and write Merkle tree blocks and the verity
descriptor past EOF in the inode data fork using iomap and pagecache
helpers. It also wires up superblock verity operations and logs an
experimental feature warning on mount.

> diff --git a/fs/xfs/xfs_fsverity.c b/fs/xfs/xfs_fsverity.c
> index 8fc3e763c017b..441251b360731 100644
> --- a/fs/xfs/xfs_fsverity.c
> +++ b/fs/xfs/xfs_fsverity.c
[ ... ]
> @@ -44,3 +53,417 @@ xfs_fsverity_is_file_data(
>  	return fsverity_active(VFS_IC(ip)) &&
>  			offset < xfs_fsverity_metadata_offset(ip);
>  }
> +
> +/*
> + * Retrieve the verity descriptor.
> + */
> +static int
> +xfs_fsverity_get_descriptor(
> +	struct inode		*inode,
> +	void			*buf,
> +	size_t			buf_size)
> +{
[ ... ]
> +	error =3D xfs_bmap_last_extent(NULL, ip, XFS_DATA_FORK, &rec, &is_empty=
);
> +	xfs_iunlock(ip, XFS_ILOCK_EXCL);
> +	if (error)
> +		return error;
> +
> +	if (is_empty)
> +		return -ENODATA;
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
> +
> +	desc_pos =3D round_down(desc_size_pos - desc_size, blocksize);
> +	if (desc_pos < xfs_fsverity_metadata_offset(ip))
> +		return -ERANGE;
> +
> +	error =3D fsverity_pagecache_read(inode, buf, desc_size, desc_pos);

[Severity: High]
In fs/xfs/xfs_fsverity.c, xfs_fsverity_get_descriptor() checks that
desc_pos >=3D xfs_fsverity_metadata_offset(ip), but it does not check that
desc_pos >=3D XFS_FSB_TO_B(mp, rec.br_startoff) or that rec is a written
extent covering the entire descriptor range [desc_pos, last_block_offset).

When an inode with S_VERITY is opened:

  xfs_file_open()
    -> fsverity_file_open()
      -> fsverity_ensure_verity_info()
        -> fsverity_get_descriptor()
          -> xfs_fsverity_get_descriptor()

S_VERITY is already set on the inode while fsverity_get_info(inode) is
still NULL. If [desc_pos, last_block_offset) spans a hole before rec,
fsverity_pagecache_read() reads that hole through iomap_read_folio(), and
xfs_read_iomap_begin() sets IOMAP_F_FSVERITY on the IOMAP_HOLE mapping.

In fs/iomap/buffered-io.c:iomap_read_folio_iter():

	if ((iomap->flags & IOMAP_F_FSVERITY) &&
	    iomap->type =3D=3D IOMAP_HOLE) {
		if (ctx->vi)
			fsverity_fill_zerohash(folio, poff, plen,
					       ctx->vi);
		iomap_set_range_uptodate(folio, poff, plen);

Because ctx->vi is NULL during descriptor loading,
fsverity_fill_zerohash() is skipped and the newly allocated folio range is
marked uptodate without being zeroed. Can this leave uninitialized kernel
page memory cached as uptodate in inode->i_mapping and allow it to be read
by userspace via FS_IOC_READ_VERITY_METADATA?

> +	if (error)
> +		return error;
> +
> +	return desc_size;
> +}
> +
> +static int
> +xfs_fsverity_write_descriptor(
> +	struct file		*file,
> +	const void		*desc,
> +	u32			desc_size,
> +	u64			merkle_tree_size)
> +{
> +	int			error;
> +	struct inode		*inode =3D file_inode(file);
> +	struct xfs_inode	*ip =3D XFS_I(inode);
> +	unsigned int		blksize =3D ip->i_mount->m_sb.sb_blocksize;
> +	u64			tree_last_block =3D
> +			xfs_fsverity_metadata_offset(ip) + merkle_tree_size;
> +	u64			desc_pos =3D
> +			round_up(tree_last_block, XFS_FSVERITY_START_ALIGN);
> +	u64			desc_end =3D desc_pos + desc_size;
> +	__be32			desc_size_disk =3D cpu_to_be32(desc_size);
> +	u64			desc_size_pos =3D
> +			round_up(desc_end + sizeof(desc_size_disk), blksize) -
> +			sizeof(desc_size_disk);
> +
> +	error =3D iomap_fsverity_write(file, desc_size_pos, sizeof(__be32),
> +			(const void *)&desc_size_disk,
> +			&xfs_buffered_write_iomap_ops,
> +			&xfs_iomap_write_ops);

[Severity: High]
Unlike xfs_fsverity_write_merkle(), which checks whether
position + size > inode->i_sb->s_maxbytes, neither
xfs_fsverity_write_descriptor() nor xfs_fsverity_get_descriptor() validates
that the descriptor offset stays within inode->i_sb->s_maxbytes.

In xfs_fsverity_write_descriptor(), on 32-bit architectures where
s_maxbytes (MAX_LFS_FILESIZE) is (loff_t)ULONG_MAX << PAGE_SHIFT,
inode->i_size <=3D XFS_FSVERITY_LARGEST_FILE does not prevent tree_last_blo=
ck
from ending within 64 KiB of s_maxbytes, so rounding up to
XFS_FSVERITY_START_ALIGN and adding desc_size pushes desc_pos and
desc_size_pos past s_maxbytes.

Similarly, in xfs_fsverity_get_descriptor(), rec.br_startoff +
rec.br_blockcount from an on-disk extent can exceed
XFS_B_TO_FSB(mp, inode->i_sb->s_maxbytes) or overflow xfs_fsize_t in
XFS_FSB_TO_B(mp, rec.br_startoff + rec.br_blockcount).

When an offset >=3D mp->m_super->s_maxbytes is passed to
iomap_fsverity_write() or fsverity_pagecache_read(), xfs_iomap_end_fsb()
hits ASSERT(offset <=3D mp->m_super->s_maxbytes) and clamps end_fsb <=3D
offset_fsb, which causes xfs_buffered_write_iomap_begin() and
xfs_read_iomap_begin() -> xfs_bmapi_read() to pass an uninitialized stack
struct xfs_bmbt_irec imap to xfs_bmbt_to_iomap(). Should both
xfs_fsverity_write_descriptor() and xfs_fsverity_get_descriptor() check
that the end of the descriptor does not exceed inode->i_sb->s_maxbytes?

[ ... ]
> +/*
> + * Prepare to enable fsverity by clearing old metadata.
> + */
> +static int
> +xfs_fsverity_begin_enable(
> +	struct file		*filp)
> +{
> +	struct inode		*inode =3D file_inode(filp);
> +	struct xfs_inode	*ip =3D XFS_I(inode);
> +	int			error;
> +
> +	xfs_assert_ilocked(ip, XFS_IOLOCK_EXCL);
> +
> +	if (IS_DAX(inode) || ip->i_diflags2 & XFS_DIFLAG2_DAX)
> +		return -EINVAL;

[Severity: High]
On an XFS filesystem formatted with sb_blocksize > PAGE_SIZE,
xfs_ialloc_setup_geometry() sets M_IGEO(mp)->min_folio_order > 0, so
inode->i_mapping only allocates compound folios.

When FS_IOC_ENABLE_VERITY is called with a Merkle tree block size of
PAGE_SIZE, fsverity_init_merkle_tree_params() accepts it because
log_blocksize <=3D PAGE_SHIFT and log_blocksize <=3D inode->i_blkbits, and
xfs_fsverity_begin_enable() does not reject blocksize > PAGE_SIZE.

When a subsequent read verifies data blocks:

  xfs_end_fsverity_io_read()
    -> fsverity_verify_bio()
      -> verify_data_block()
        -> xfs_fsverity_read_merkle()
          -> generic_read_merkle_tree_page()

generic_read_merkle_tree_page() returns folio_file_page(folio, index) from
a compound folio in inode->i_mapping, and verify_data_block() /
is_hash_block_verified() in fs/verity/verify.c call SetPageChecked(hpage).
Because PageChecked uses the PF_NO_COMPOUND policy, doesn't this trigger
VM_BUG_ON_PGFLAGS(enforce && PageCompound(page), page) when
CONFIG_DEBUG_VM_PGFLAGS is enabled?

> +
> +	/*
> +	 * fs-verity stores the Merkle tree past EOF in units of the filesystem
> +	 * block size, so it cannot support realtime files whose allocation unit
> +	 * (extent size) is larger than the block size.
> +	 */
> +	if (xfs_inode_has_bigrtalloc(ip))
> +		return -EINVAL;

[Severity: High]
In fs/xfs/xfs_fsverity.c, xfs_fsverity_begin_enable() checks
xfs_inode_has_bigrtalloc(ip), which only tests whether
XFS_IS_REALTIME_INODE(ip) && ip->i_mount->m_sb.sb_rextsize > 1. On zoned
XFS filesystems, sb_rextsize is 1, so zoned inodes (xfs_is_zoned_inode(ip))
are not rejected here.

When xfs_fsverity_write_merkle() or xfs_fsverity_write_descriptor() then
calls iomap_fsverity_write():

  iomap_fsverity_write()
    -> iomap_file_buffered_write(..., NULL)
      -> xfs_buffered_write_iomap_begin()
        -> xfs_zoned_buffered_write_iomap_begin()

iomap_file_buffered_write() is called with private =3D=3D NULL instead of a
struct xfs_zone_alloc_ctx. In xfs_zoned_buffered_write_iomap_begin(),
struct xfs_zone_alloc_ctx *ac =3D iter->private is NULL, hitting ASSERT(ac)
and dereferencing ac->reserved_blocks. Should xfs_fsverity_begin_enable()
also reject xfs_is_zoned_inode(ip)?

[ ... ]
> +/*
> + * Complete (or fail) the process of enabling fsverity.
> + */
> +static int
> +xfs_fsverity_end_enable(
> +	struct file		*file,
> +	const void		*desc,
> +	size_t			desc_size,
> +	u64			merkle_tree_size)
> +{
> +	struct inode		*inode =3D file_inode(file);
> +	struct xfs_inode	*ip =3D XFS_I(inode);
> +	struct xfs_mount	*mp =3D ip->i_mount;
> +	struct xfs_trans	*tp;
> +	int			error =3D 0;
> +	loff_t			range_start =3D xfs_fsverity_metadata_offset(ip);
> +
> +	xfs_assert_ilocked(ip, XFS_IOLOCK_EXCL);
> +
> +	/* fs-verity failed, just cleanup */
> +	if (desc =3D=3D NULL)
> +		goto out;

[Severity: High]
In xfs_fsverity_end_enable(), error is initialized to 0. When
enable_verity() in fs/verity/enable.c fails during Merkle tree construction
or descriptor setup and calls vops->end_enable_verity(filp, NULL, 0,
params.tree_size), desc is NULL and execution jumps to out with error =3D=
=3D 0:

out:
	if (error) {
		int	error2;

		error2 =3D xfs_fsverity_reset_inode(ip);
		...
	}

	xfs_iflags_clear(ip, XFS_VERITY_CONSTRUCTION);
	return error;

Because error is 0, xfs_fsverity_reset_inode(ip) is skipped when
desc =3D=3D NULL, leaving behind any post-EOF pagecache folios, delalloc
reservations, and extents written during build_merkle_tree(). Furthermore,
once XFS_VERITY_CONSTRUCTION is cleared, background writeback via
xfs_vm_writepages() no longer sets IOMAP_F_FSVERITY, so
iomap_writeback_handle_eof() skips the dirty post-EOF folios and strands
the unconverted delalloc blocks in ip->i_delayed_blks. Should the
desc =3D=3D NULL path also run xfs_fsverity_delete_metadata(ip) (or
xfs_fsverity_reset_inode(ip)) before clearing XFS_VERITY_CONSTRUCTION?

[ ... ]
> +	/*
> +	 * Ensure that we've persisted the verity information before we enable
> +	 * it on the inode and tell the caller we have sealed the inode.
> +	 */
> +	ip->i_diflags2 |=3D XFS_DIFLAG2_VERITY;
> +
> +	xfs_trans_log_inode(tp, ip, XFS_ILOG_CORE);
> +	xfs_trans_set_sync(tp);
> +
> +	error =3D xfs_trans_commit(tp);
> +	xfs_iunlock(ip, XFS_ILOCK_EXCL);
> +	if (error)
> +		goto out;
> +
> +	inode_set_flags(inode, S_VERITY, S_VERITY);
> +
> +	/*
> +	 * Proactively remove unwritten extents left by COW preallocations and
> +	 * write preallocation in the merkle tree holes and past descriptor,
> +	 * and any delayed preallocations
> +	 */
> +	error =3D xfs_free_eofblocks(ip);
> +out:
> +	if (error) {
> +		int	error2;
> +
> +		error2 =3D xfs_fsverity_reset_inode(ip);
> +		if (error2)
> +			xfs_alert(ip->i_mount,
> +"ino 0x%llx failed to clean up new fsverity metadata, err %d",
> +					I_INO(ip), error2);
> +	}

[Severity: High]
As reported by Darrick J. Wong on v15 [1], xfs_fsverity_end_enable()
commits XFS_DIFLAG2_VERITY and sets S_VERITY on the VFS inode before
calling xfs_free_eofblocks(ip) to remove unwritten preallocations in Merkle
tree holes and past the descriptor.

This creates several problems:

1. Because S_VERITY is published before xfs_free_eofblocks(ip) runs,
concurrent readers can immediately observe S_VERITY while unwritten extents
still exist in Merkle tree holes (causing zero-hash blocks to map as
IOMAP_UNWRITTEN instead of IOMAP_HOLE) or after the descriptor (causing
xfs_fsverity_get_descriptor() to read from the trailing preallocation). If
xfs_free_eofblocks(ip) then fails and xfs_fsverity_reset_inode(ip) clears
S_VERITY, enable_verity() frees the struct fsverity_info via
fsverity_remove_info(vi) while concurrent readers that already saw
S_VERITY may still be verifying read bios against ioend->io_vi.

2. In xfs_fsverity_reset_inode(ip):

	error =3D xfs_fsverity_delete_metadata(ip);
	if (error)
		return error;

	inode_set_flags(VFS_I(ip), 0, S_VERITY);

	error =3D xfs_trans_alloc_inode(ip, &M_RES(mp)->tr_ichange,
			0, 0, false, &tp);
	if (error)
		return error;

	ip->i_diflags2 &=3D ~XFS_DIFLAG2_VERITY;

If xfs_fsverity_delete_metadata(ip) fails, xfs_fsverity_reset_inode(ip)
returns early with S_VERITY still set on the VFS inode, which triggers
WARN_ON_ONCE(IS_VERITY(inode)) in enable_verity() and leaks the
fsverity_info in fsverity_info_hash. And if xfs_fsverity_delete_metadata()
succeeds (or the system crashes after the synchronous XFS_DIFLAG2_VERITY
commit) before the second transaction clearing XFS_DIFLAG2_VERITY commits,
the inode is left marked with XFS_DIFLAG2_VERITY on disk after its Merkle
tree and descriptor extents have already been deleted.

Could xfs_free_eofblocks(ip) (or the post-EOF unwritten/delalloc cleanup)
be performed before setting XFS_DIFLAG2_VERITY and S_VERITY so that
enabling verity does not have to roll back committed on-disk state and
published VFS flags?

[1] https://lore.kernel.org/r/20260820164411.GI6072@frogsfrogsfrogs

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102144147.2393=
369-1-aalbersh@kernel.org?part=3D9
