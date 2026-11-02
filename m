Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793633086;
	b=5UMqUwqGqB3HGtsUJUdZBqQSFMEqEB70EVxmUWmPTHLPftZnHN3QRKoa46/0q/JT7wJZ
	 9Fn2G9P6GAcXRuKTbNfR0hafHLexkO5m2SWwSu7RJW4ZWCbu8RauoKcJGU9dOJ0Ed3jdC
	 2NbGsRRXCQTmD8zA8wuzMm7ldUs3CfOxuAuqqGdeilBtCCWnofiS9umlk9Mo1zLQ/kNtm
	 FW5V/wxg8g/Y4NmGcep9kcL1qByTupn7uw/9blxtvGc7LgGIsWytkgXWn2XSYvVJkVjMs
	 yPmF0w0aeCUuJ3mx6M7h29BSPMcOaz5J/9E7pQEyBNkYz4WHfSGiS5G0S/QsiK4Gh9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793633086;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=4MhEGq6ERdHAgliIPJFoUp2EE8tW9vLtTWN1h/f0mqQ=;
	b=C1XxiqBdwgF66lLpPRyBj+NT94/4VCl+LwZAS9AvMCFMRQp122XD3la3BaeD/gPm+4i7
	 /JKrbVz577XAU/vT4jjUsHeifCa0yPFmTZhCOUvTPvl7TaGGqyzGZwr7a77KYAv3bxqCv
	 pBgbhrtXe43vTMlsSJUGlHjNE9Y4bpAGpdiOLn3fYPxYxtmEX+RNeea0L6EYGjd3Td+hB
	 /3FnSh/Qmu1pLkR0dcvRxoB/9WanpiZi573Z1Hpkmqrj3d+gUhM4bn4SLgl3F38KsmtqZ
	 CnaCybgjRwntbF7tv9zWPBc+03/gLL8ll7XJVVPmSSOPgnMgHINZQ6UyTLFnWNtMfUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fWbZRgl+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06BBC60CA5D0
	for <fsverity@lists.linux.dev>; Mon,  2 Nov 2026 15:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fWbZRgl+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 510FD1F00A1B;
	Mon,  2 Nov 2026 15:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793633085;
	bh=4MhEGq6ERdHAgliIPJFoUp2EE8tW9vLtTWN1h/f0mqQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fWbZRgl+5+KJA0Y+kklkcuZ1aXkbayNxDUQHvy5aimtThEtXkEm3aDBrryyLBa+NQ
	 s421bo394KJ/FmbEsO4D4QGTjd/yHsW7fl68p3eftHxvXys/6M+MfBtDWaw9cDHH7k
	 RN4KzEQLSwsAMaFmw4/gBd9Hw2v4Nao74FQ/4YEltQ6tCc3cDcmiPcrSQ9IHwNZdaR
	 fxS8xlRvBnOEXFb2q3jcrXAx9hzwNkkmumPdsIFeayU2TNSUDkGvAsBhPG4gtWRCzh
	 nSQWaSOrf7dHDODh/LXnndhFxgjtdNxa156HmtGu7e+x6Str1uibCNKhFpkh/HMC/Q
	 uSVQC7cKxe/kg==
Message-ID: <sashiko-outbox-193657@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v18 11/15] xfs: add fs-verity ioctls
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andrey Albershteyn" <aalbersh@kernel.org>, ebiggers@kernel.org, hch@lst.de, "Carlos
 Maiolino" <cem@kernel.org>, fsverity@lists.linux.dev
Cc: david@fromorbit.com, "Darrick J. Wong" <djwong@kernel.org>
In-Reply-To: <20261102144147.2393369-12-aalbersh@kernel.org>
References: <20261102144147.2393369-1-aalbersh@kernel.org>
 <20261102144147.2393369-12-aalbersh@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 15:24:44 +0000
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Post: <mailto:fsverity@lists.linux.dev>
List-Help: <mailto:fsverity+help@lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fsverity+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [Critical] xfs: premature S_VERITY set before xfs_free_eofblocks() causes=
 UAF
- [Critical] xfs: fs-verity triggers compound page BUG_ON on large block si=
ze fs
- [High] xfs: xfs_fsverity_end_enable() skips rollback cleanup when desc is=
 NULL
- [Medium] xfs: xfs_fileattr_set() rejects FS_VERITY_FL during FS_IOC_SETFL=
AGS
- [Medium] xfs: xfs_fileattr_set() races with in-progress FS_IOC_ENABLE_VER=
ITY
--

commit 2331d2406515413653c5db56870e5226577de902
Author: Andrey Albershteyn <aalbersh@kernel.org>

xfs: add fs-verity ioctls

This commit exposes the FS_IOC_ENABLE_VERITY, FS_IOC_MEASURE_VERITY, and
FS_IOC_READ_VERITY_METADATA ioctls in xfs_file_ioctl() when the filesystem
has the verity feature enabled.

> diff --git a/fs/xfs/xfs_ioctl.c b/fs/xfs/xfs_ioctl.c
> index f81b6e52ac403..37c6a2fae58cc 100644
> --- a/fs/xfs/xfs_ioctl.c
> +++ b/fs/xfs/xfs_ioctl.c

[ ... ]

> @@ -1575,6 +1576,19 @@ xfs_file_ioctl(
>  	case XFS_IOC_VERIFY_MEDIA:
>  		return xfs_ioc_verify_media(filp, arg);
> =20
> +	case FS_IOC_ENABLE_VERITY:
> +		if (!xfs_has_verity(mp))
> +			return -EOPNOTSUPP;
> +		return fsverity_ioctl_enable(filp, arg);

[Severity: High]
When FS_IOC_ENABLE_VERITY fails during Merkle tree construction or
descriptor validation, enable_verity() rolls back by calling
vops->end_enable_verity(filp, NULL, 0, params.tree_size).

In fs/xfs/xfs_fsverity.c:xfs_fsverity_end_enable(), local variable error is
initialized to 0 and the NULL descriptor check jumps directly to out:

	int			error =3D 0;
	loff_t			range_start =3D xfs_fsverity_metadata_offset(ip);

	xfs_assert_ilocked(ip, XFS_IOLOCK_EXCL);

	/* fs-verity failed, just cleanup */
	if (desc =3D=3D NULL)
		goto out;
	...
out:
	if (error) {
		int	error2;

		error2 =3D xfs_fsverity_reset_inode(ip);
		if (error2)
			xfs_alert(ip->i_mount,
"ino 0x%llx failed to clean up new fsverity metadata, err %d",
					I_INO(ip), error2);
	}

	xfs_iflags_clear(ip, XFS_VERITY_CONSTRUCTION);
	return error;

Because error is 0 when desc is NULL, won't xfs_fsverity_reset_inode(ip) be
skipped on rollback, leaving dirty post-EOF Merkle tree folios in
inode->i_mapping and delayed allocation extents in ip->i_df after
XFS_VERITY_CONSTRUCTION is cleared?

[Severity: Medium]
While fsverity_ioctl_enable() -> enable_verity() is building the Merkle
tree, inode_lock(inode) is dropped between xfs_fsverity_begin_enable() and
xfs_fsverity_end_enable(), and XFS_DIFLAG2_VERITY is not set until
xfs_fsverity_end_enable().

During that window, can a concurrent FS_IOC_FSSETXATTR, FS_IOC_SETFLAGS, or
file_setattr call enter xfs_fileattr_set() -> xfs_ioctl_setattr_xflags()
and set XFS_DIFLAG2_DAX or XFS_DIFLAG_REALTIME (including bigrtalloc) on
the inode because neither function checks
xfs_iflags_test(ip, XFS_VERITY_CONSTRUCTION)?

[Severity: Medium]
Once FS_IOC_ENABLE_VERITY sets XFS_DIFLAG2_VERITY on an inode,
FS_IOC_GETFLAGS reports FS_VERITY_FL via:

  ioctl_getflags()
    -> xfs_fileattr_get()
      -> xfs_fill_fsxattr()
        -> fileattr_fill_xflags(fa, xfs_ip2xflags(ip))

When userspace tools such as chattr perform a read-modify-write via
FS_IOC_SETFLAGS (where fa->fsx_valid is false), fs/xfs/xfs_ioctl.c:
xfs_fileattr_set() checks:

	if (!fa->fsx_valid) {
		unsigned int allowed =3D FS_IMMUTABLE_FL | FS_APPEND_FL |
				       FS_NOATIME_FL | FS_NODUMP_FL |
				       FS_SYNC_FL | FS_DAX_FL |
				       FS_PROJINHERIT_FL;
...
		if (xfs_has_asciici(mp))
			allowed |=3D FS_CASEFOLD_FL;

		if (fa->flags & ~allowed)
			return -EOPNOTSUPP;
	}

Since FS_VERITY_FL is not included in allowed even when XFS_DIFLAG2_VERITY
is already set on the inode, won't FS_IOC_SETFLAGS updates (such as
chattr +i or chattr +a) on verity-enabled files fail with -EOPNOTSUPP?

[Severity: Critical]
On XFS filesystems where sb_blocksize > PAGE_SIZE (or whenever compound
folios are instantiated in inode->i_mapping), xfs_fsverity_begin_enable()
allows enabling verity, and fs/xfs/xfs_fsverity.c:xfs_fsverity_read_merkle()
fetches Merkle tree pages via generic_read_merkle_tree_page():

static struct page *
xfs_fsverity_read_merkle(
	struct inode		*inode,
	pgoff_t			index)
{
	index +=3D xfs_fsverity_metadata_offset(XFS_I(inode)) >> PAGE_SHIFT;

	return generic_read_merkle_tree_page(inode, index);
}

When verify_data_block() and is_hash_block_verified() subsequently call
PageChecked() and SetPageChecked() on the returned struct page belonging to
a compound folio, won't SetPageChecked() trigger
VM_BUG_ON_PGFLAGS(PageCompound(page), page) (defined via PF_NO_COMPOUND) and
corrupt tail page flags?

> +	case FS_IOC_MEASURE_VERITY:
> +		if (!xfs_has_verity(mp))
> +			return -EOPNOTSUPP;
> +		return fsverity_ioctl_measure(filp, arg);
> +	case FS_IOC_READ_VERITY_METADATA:
> +		if (!xfs_has_verity(mp))
> +			return -EOPNOTSUPP;
> +		return fsverity_ioctl_read_metadata(filp, arg);

[Severity: Critical]
In fs/xfs/xfs_fsverity.c:xfs_fsverity_end_enable(), S_VERITY is set on the
VFS inode before calling xfs_free_eofblocks(ip):

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

Because enable_verity() has already hashed struct fsverity_info via
fsverity_set_info() before calling vops->end_enable_verity(), setting
S_VERITY makes fsverity_get_info(inode) return that unrefcounted pointer to
concurrent readers (buffered reads queueing bio verification work,
FS_IOC_MEASURE_VERITY, and FS_IOC_READ_VERITY_METADATA) while
xfs_free_eofblocks(ip) is still running.

If xfs_free_eofblocks(ip) fails, xfs_fsverity_reset_inode(ip) clears
S_VERITY (or leaves S_VERITY set if xfs_fsverity_delete_metadata(ip) also
fails) and enable_verity() removes and RCU-frees struct fsverity_info via
fsverity_remove_info(vi). Can concurrent readers or queued verification work
items then dereference the freed fsverity_info, or can concurrent
FS_IOC_READ_VERITY_METADATA calls invoke xfs_fsverity_get_descriptor() ->
xfs_bmap_last_extent() before xfs_free_eofblocks(ip) removes trailing
post-descriptor preallocations? Should inode_set_flags(inode, S_VERITY,
S_VERITY) only be called after xfs_free_eofblocks(ip) succeeds and rollback
is no longer possible?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102144147.2393=
369-1-aalbersh@kernel.org?part=3D11
