Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793633710;
	b=e0rmCZjqbj4JbvNqmUf76ifZVdCSUUE5PIreDnuPqpvdtzdxEX7M6N5URFoO7kFxeur7
	 oeqgCXOUo59YsdZKKlfLgu95i3yHBDBEYJxyUk5+iV4hxSw3EjKr3RIspw+hGsnc03IQf
	 myHYkXWdo4Vx8LZgOIzJZuEGLTPdZG/5yDuKvxjPcrDBGHKaNhM0maueRCCzzRajgpqdk
	 BeNyzFFFBK1YdwLCrvGiizUI9zORUxOEl5S7zNC8vmBBAnmV3nb2Wx9DsIwYVWg9L0n+1
	 7Eov6O00yF/16Xkfmc+IWjUt5SOOmcWYdKCmjK7u50W9GdgfeRxlUmRRBAv45c4Dylg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793633710;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=p/eefTz6ok9cXHpdQz89xdIHyhwAGpSGAQ68xRmWCkY=;
	b=ALUwHOzpM4kIjldCyTuyeB4q/WUpjf44Uh5V4H+FNeMWnCPBLt6ypw1/AEPtPH7b0tsV
	 iw3viWC+JgEwKGHgJ0YLsosLsm8/ruHpW5JTyrD++xd7OazWPYGDZDf7kYKjcjxRQf9P5
	 FyXhtuSG3iMsRnZbyL+w7pK52Ok1MWtKJVxqS/tIa2ea7Q5bqQ6kTF5BXgHxJIjQ7a8Wu
	 aufxRv+SagTaH6kXpiSYxljQKogLLdCB0foR1VcNNVKE4RjJpmhMQqhPE4zHoPR3jkUFd
	 4J/nuDrd1P1XUx99SDRuVearNvEHhzN1BcovaGlHMskqg+/zpBm/Io2g7O/u0Dr3s4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hoLDGQWE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA0360DE990
	for <fsverity@lists.linux.dev>; Mon,  2 Nov 2026 15:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hoLDGQWE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 755511F00A16;
	Mon,  2 Nov 2026 15:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793633709;
	bh=p/eefTz6ok9cXHpdQz89xdIHyhwAGpSGAQ68xRmWCkY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hoLDGQWEI75uqjBdO5sQgbfHNacjB3B2saDA+VUsSH0QthBknvG+kC4p5fkGItw/z
	 cJzlXKDNAea6x2K6En0TRycusaE4uGs8TD9n+f1GXG4mXWBZieKLQ7K32VVjV3GFpP
	 mxKdxL3Mipw2pxRLY0kyR40xMu6AyqLMVnDCneowP3lVg9wm1v6ALFaeTLTMTkDvAD
	 68bRgOInI+JoQYPLWyh68LVpcl8tRkyXkTpNSZm3rC2v7zAWNmZBM+TFdYozSOxtmq
	 5PovcmMAPjdR4fv/Z8GHWbvgQKO4QRMv5L1G2glzUWo/Pd5CMPXwV08QEGIB2b6fwq
	 k/fDoYu33/eTQ==
Message-ID: <sashiko-outbox-193677@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v18 15/15] xfs: enable ro-compat fs-verity flag
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andrey Albershteyn" <aalbersh@kernel.org>, ebiggers@kernel.org, hch@lst.de, "Carlos
 Maiolino" <cem@kernel.org>, fsverity@lists.linux.dev
Cc: david@fromorbit.com, "Darrick J. Wong" <djwong@kernel.org>
In-Reply-To: <20261102144147.2393369-16-aalbersh@kernel.org>
References: <20261102144147.2393369-1-aalbersh@kernel.org>
 <20261102144147.2393369-16-aalbersh@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 15:35:08 +0000
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
- [High] xfs: skipped cleanup and early S_VERITY in xfs_fsverity_end_enable=
()
- [High] xfs: missing blocksize > PAGE_SIZE check in xfs_fsverity_begin_ena=
ble()
- [Medium] xfs: unhandled verity errors and uncleared sickness in xchk_inod=
e()
- [Medium] xfs: unnecessary eofblocks transactions on verity inodes when CO=
NFIG_FS_VERITY=3Dn
--

commit 2c04fa631aa020ee4bcc0f60d29a09521669013e
Author: Andrey Albershteyn <aalbersh@kernel.org>

xfs: enable ro-compat fs-verity flag

This commit finalizes fs-verity integration in XFS by adding
XFS_SB_FEAT_RO_COMPAT_VERITY to XFS_SB_FEAT_RO_COMPAT_ALL so the kernel
allows read-write mounts of filesystems with the fs-verity ro-compat feature
enabled.

> diff --git a/fs/xfs/libxfs/xfs_format.h b/fs/xfs/libxfs/xfs_format.h
> index e1f50ad18f0b5..6594fbe4f7f6a 100644
> --- a/fs/xfs/libxfs/xfs_format.h
> +++ b/fs/xfs/libxfs/xfs_format.h
> @@ -378,8 +378,9 @@ xfs_sb_has_compat_feature(
>  #define XFS_SB_FEAT_RO_COMPAT_ALL \
>  		(XFS_SB_FEAT_RO_COMPAT_FINOBT | \
>  		 XFS_SB_FEAT_RO_COMPAT_RMAPBT | \
> -		 XFS_SB_FEAT_RO_COMPAT_REFLINK| \
> -		 XFS_SB_FEAT_RO_COMPAT_INOBTCNT)
> +		 XFS_SB_FEAT_RO_COMPAT_REFLINK | \
> +		 XFS_SB_FEAT_RO_COMPAT_INOBTCNT | \
> +		 XFS_SB_FEAT_RO_COMPAT_VERITY)

[Severity: High]
Now that XFS_SB_FEAT_RO_COMPAT_VERITY is enabled for read-write mounts,
making FS_IOC_ENABLE_VERITY reachable through xfs_has_verity(mp), does
xfs_fsverity_end_enable() skip cleaning up failed Merkle tree metadata when
desc is NULL, and set S_VERITY before rollback is no longer possible?

In fs/verity/enable.c:enable_verity(), if build_merkle_tree(),
fsverity_create_info(), or fsverity_set_info() fails after
vops->begin_enable_verity() succeeded, enable_verity() jumps to rollback and
calls vops->end_enable_verity(filp, NULL, 0, params.tree_size).

In fs/xfs/xfs_fsverity.c:xfs_fsverity_end_enable():

	int			error =3D 0;
	...
	/* fs-verity failed, just cleanup */
	if (desc =3D=3D NULL)
		goto out;
	...
	inode_set_flags(inode, S_VERITY, S_VERITY);

	/*
	 * Proactively remove unwritten extents left by COW preallocations and
	 * write preallocation in the merkle tree holes and past descriptor,
	 * and any delayed preallocations
	 */
	error =3D xfs_free_eofblocks(ip);
out:
	if (error) {
		int	error2;

		error2 =3D xfs_fsverity_reset_inode(ip);
		...
	}

	xfs_iflags_clear(ip, XFS_VERITY_CONSTRUCTION);
	return error;

When desc =3D=3D NULL, error remains 0 at out, so xfs_fsverity_reset_inode(=
ip)
and xfs_fsverity_delete_metadata(ip) are skipped while
XFS_VERITY_CONSTRUCTION is cleared. Any post-EOF dirty folios and delalloc
extents written by xfs_fsverity_write_merkle() remain attached to the inode;
when writeback runs without XFS_VERITY_CONSTRUCTION set,
xfs_iomap_writepages() does not set IOMAP_F_FSVERITY and
iomap_writeback_handle_eof() skips the post-EOF folios after clearing their
dirty bit, stranding unwritten delalloc blocks.

In addition, on the normal enable path, inode_set_flags(inode, S_VERITY,
S_VERITY) is called before xfs_free_eofblocks(ip). Because enable_verity()
has already inserted vi into fsverity_info_hash, setting S_VERITY immediate=
ly
exposes vi to concurrent readers via fsverity_get_info(inode). If
xfs_free_eofblocks(ip) fails and triggers xfs_fsverity_reset_inode(ip),
either S_VERITY remains set if xfs_fsverity_delete_metadata(ip) also fails
(triggering WARN_ON_ONCE(IS_VERITY(inode)) in enable_verity()), or S_VERITY
is cleared and enable_verity() calls fsverity_remove_info(vi) while
concurrent readers or read ioends may already be using vi.

Should desc =3D=3D NULL call xfs_fsverity_reset_inode(ip), and should
inode_set_flags(inode, S_VERITY, S_VERITY) only be called after
xfs_free_eofblocks(ip) succeeds?

[Severity: High]
Can enabling and reading an fs-verity file on an XFS filesystem with
sb_blocksize > PAGE_SIZE trigger VM_BUG_ON_PGFLAGS(PageCompound(page))?

When mp->m_sb.sb_blocksize > PAGE_SIZE, xfs_ialloc_setup_geometry() sets
igeo->min_folio_order =3D mp->m_sb.sb_blocklog - PAGE_SHIFT, and
xfs_inode_alloc() / xfs_reinit_inode() configures the mapping with
mapping_set_folio_min_order(inode->i_mapping, M_IGEO(mp)->min_folio_order).

In fs/xfs/xfs_fsverity.c:xfs_fsverity_begin_enable():

	if (xfs_inode_has_bigrtalloc(ip))
		return -EINVAL;

	if (inode->i_size > XFS_FSVERITY_LARGEST_FILE)
		return -EFBIG;

There is no check rejecting sb_blocksize > PAGE_SIZE (or
mapping_min_folio_order(inode->i_mapping) > 0), and
fsverity_init_merkle_tree_params() allows a 4K Merkle tree block size as lo=
ng
as log_blocksize <=3D PAGE_SHIFT and log_blocksize <=3D inode->i_blkbits.

When reading the file, verify_data_block() calls:

xfs_fsverity_read_merkle()
  -> generic_read_merkle_tree_page()
     -> read_mapping_folio()
     -> folio_file_page()

Because mapping_min_folio_order(inode->i_mapping) > 0, read_mapping_folio()
allocates a compound folio and folio_file_page() returns a page with
PageCompound(hpage) =3D=3D true. verify_data_block() then calls
SetPageChecked(hpage), which is defined with PF_NO_COMPOUND and triggers
VM_BUG_ON_PGFLAGS(1 && PageCompound(page), page).

Should xfs_fsverity_begin_enable() (or xfs_has_verity() / mount-time checks)
reject filesystems with blocksize > PAGE_SIZE until fs-verity supports large
folios for Merkle tree caching?

[Severity: Medium]
In online scrub and repair, can corrupt fsverity descriptors cause
xchk_inode_setup_verity() to abort the scrub ioctl with -EINVAL or -EFBIG,
and does repairing or scrubbing a verity inode leave XFS_SICK_INO_FSVERITY
permanently set?

In fs/xfs/scrub/common.c:xchk_inode_setup_verity():

	error =3D fsverity_ensure_verity_info(VFS_I(sc->ip));
	switch (error) {
	case 0:
		/* fsverity is active */
		break;
	case -ENODATA:
	case -EMSGSIZE:
	case -EFSCORRUPTED:
	case -ERANGE:
	case -EBADMSG:
		/*
		 * The nonzero errno codes above are the error codes that can
		 * be returned from fsverity on metadata validation errors.
		 */
		return 0;
	default:
		/* runtime errors */
		return error;
	}

In fs/verity/open.c, fsverity_ensure_verity_info() calls
fsverity_get_descriptor() -> validate_fsverity_descriptor(), which returns
-EINVAL when a descriptor field is invalid (bad version, non-zero
__reserved, invalid salt_size, data_size !=3D inode->i_size, or sig_size
overflow), and fsverity_create_info() -> fsverity_init_merkle_tree_params(),
which returns -EINVAL for an invalid hash_algorithm or log_blocksize and
-EFBIG when the Merkle tree parameters exceed limits. Because -EINVAL and
-EFBIG hit the default branch in xchk_inode_setup_verity(),
xchk_prepare_iscrub() and xrep_dinode_core() abort the scrub or repair ioctl
instead of allowing xchk_inode() to flag corruption and xrep_inode_verity()
to clear XFS_DIFLAG2_VERITY.

Furthermore, xfs_fsverity_get_descriptor() marks corrupt inodes with
XFS_SICK_INO_FSVERITY (which is included in XFS_SICK_INO_PRIMARY), but
type_to_health_flag[XFS_SCRUB_TYPE_INODE] in fs/xfs/scrub/health.c only sets
XFS_SICK_INO_CORE, and neither xchk_inode() nor xrep_inode_verity() adds
XFS_SICK_INO_FSVERITY to sc->healthy_mask:

fs/xfs/scrub/inode_repair.c:xrep_inode_verity() {
	if (xchk_inode_verity_broken(sc->ip)) {
		sc->ip->i_diflags2 &=3D ~XFS_DIFLAG2_VERITY;
		inode_set_flags(inode, 0, S_VERITY);

		xfs_trans_log_inode(sc->tp, sc->ip, XFS_ILOG_CORE);
	}
}

As a result, even after xrep_inode_verity() repairs the inode,
XFS_SICK_INO_FSVERITY remains set on ip->i_sick and causes
xfs_inactive_health() to taint the AG with XFS_SICK_AG_INODES when the inode
is evicted.

[Severity: Medium]
When a kernel built with CONFIG_FS_VERITY=3Dn mounts an XFS filesystem with
XFS_SB_FEAT_RO_COMPAT_VERITY read-write (which adding
XFS_SB_FEAT_RO_COMPAT_VERITY to XFS_SB_FEAT_RO_COMPAT_ALL now permits), will
evicting a verity inode from the icache repeatedly run unnecessary
tr_itruncate transactions?

In fs/xfs/xfs_bmap_util.c:xfs_can_free_eofblocks():

	if (fsverity_active(VFS_IC(ip)) ||
	    xfs_iflags_test(ip, XFS_VERITY_CONSTRUCTION))
		return false;

And in fs/xfs/xfs_iops.c:xfs_report_dioalign():

	if (fsverity_active(VFS_I(ip)))
		return;

When CONFIG_FS_VERITY=3Dn, fsverity_active() is a stub that always returns
false, even though xfs_diflags_to_iflags() still sets S_VERITY on the VFS
inode when XFS_DIFLAG2_VERITY is present.

When a verity inode is looked up (for example via stat(), where
xfs_iformat_data_fork() populates ip->i_df with if_needextents =3D=3D 0 for
XFS_DINODE_FMT_EXTENTS inodes) and later evicted from the VFS icache:

xfs_inode_mark_reclaimable()
  -> xfs_inode_needs_inactive()
     -> xfs_can_free_eofblocks()

Because fsverity_active() returns false, xfs_can_free_eofblocks() looks up
extents past EOF, finds the post-EOF Merkle tree and descriptor extents, and
returns true. Inactivation then runs xfs_inactive() -> xfs_free_eofblocks()
-> xfs_itruncate_extents_flags(..., XFS_BMAPI_UNWRITTEN), which allocates a
tr_itruncate transaction, walks all post-EOF extents while skipping the
written verity metadata extents, and unconditionally dirties and commits the
inode core via xfs_trans_log_inode(tp, ip, XFS_ILOG_CORE) on every eviction.
Similarly, xfs_report_dioalign() reports non-zero dio_mem_align and
dio_offset_align for verity files when CONFIG_FS_VERITY=3Dn.

Should these checks test IS_VERITY(VFS_IC(ip)) (or ip->i_diflags2 &
XFS_DIFLAG2_VERITY) instead of fsverity_active()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102144147.2393=
369-1-aalbersh@kernel.org?part=3D15
