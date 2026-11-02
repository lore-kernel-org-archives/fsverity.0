Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793632399;
	b=mzjwc+X4MVtuXCDbFMVfN11NeY+G8g6e7Rn5UkBfkHCwfIxztSTKKxqUD0WPTr2IY8DJ
	 3HnV+eft8dMtFplHo4u9fLnVTk0pOHion0Axma6j4VTxh4k5AHERo+ihRbezGV8eVTYvn
	 iOv8o0fUiVpKlwwMKsJY52rV+wioBasWUQGe253ratmyKGCn5zB4nCkCQFNGmpubZBT/9
	 PRqPM/KTg+izRMHke4+6LyVg/nHPtcc6clVmko/NsVXr4f4Ho6+EWc8AlqUQF1jBGAgCq
	 YAxojv970Cqd14HLnlZHpCPHvQJmiHCedggVPqrNoihOgnWwydZlTUxh3Sm9vLcRaQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793632399;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=EWpnfsvjSV5n3713EHL5APfBICq33eLFdctb4nODZYo=;
	b=ZJhHH2xa1pquou3BeQh0z8hih66Stf7GxS4W0BSPWBsZQpRMKHpqF+ztbxpZTKhSxNQQ
	 +Jw1sQzK31fujnro1hFuruPTPkdFdhQ4aLdoeXkZi+0pO8NHp6smHB6Tq1CLNkn/FXzYJ
	 w4N27rUA2A3kX2XBwCNdg31fIek01nKYUzrXhhlR/R/+vpwcpiyauuwgEKjYDLvfXIGnt
	 qnmhIK/gim6fdBqReXrKki1YmAEU47h2r13BjY0Vrz2dl9GUNWgMtLK4pMkIg6YmQlecx
	 lBTfGAqpu3dWaaF0zeuqUVGY08pCfTtYvKuN4CalUuQZuZSXrc2v54JwoDktYJMFQFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=igo9+b2K;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE1966078250
	for <fsverity@lists.linux.dev>; Mon,  2 Nov 2026 15:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=igo9+b2K
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C8161F00A17;
	Mon,  2 Nov 2026 15:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793632398;
	bh=EWpnfsvjSV5n3713EHL5APfBICq33eLFdctb4nODZYo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=igo9+b2KCA8zfbXnDMECzO+BXdnWcuxlZH9knt4PoxuZDu6Etkwmh1F17iN7Roacf
	 6oumvsUjf7J41IGb4aNTmMpGAvTbhhLZs+JCzxIkk4I+VafuHNQ8DpYHYM5YwypcKs
	 AJFPgejWU9w6m7o+WLMhcs7HL3fYkgEJgSRO+hJ6JkkMPPwY4q22fmd4IeuLvbh6rM
	 b6CAvCzDRLoNuZtz4DebUgqaTRIs9woA16J45nY1Mb0kb2NsX0wm5Le0brPQf22Bug
	 q1ut0LBe/UjtSlpQ6qZg3v92OfKNL23pvakzE9jueQU9QPPvyp0g5uBNyVKE28RXit
	 sfYErxJhmc3NA==
Message-ID: <sashiko-outbox-193642@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v18 05/15] xfs: handle fsverity I/O in write/read path
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andrey Albershteyn" <aalbersh@kernel.org>, ebiggers@kernel.org, hch@lst.de, "Carlos
 Maiolino" <cem@kernel.org>, fsverity@lists.linux.dev
Cc: david@fromorbit.com, "Darrick J. Wong" <djwong@kernel.org>
In-Reply-To: <20261102144147.2393369-6-aalbersh@kernel.org>
References: <20261102144147.2393369-1-aalbersh@kernel.org>
 <20261102144147.2393369-6-aalbersh@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 15:13:17 +0000
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
- [High] xfs: missing IOMAP_F_FSVERITY on CoW iomap in xfs_direct_write_iom=
ap_begin()
- [High] xfs: race in xfs_iomap_writepages() drops dirty fsverity folios pa=
st EOF
- [Low] xfs: inclusion of missing header xfs_fsverity.h in xfs_aops.c break=
s build
--

commit be21020c05928b16d2e0448f7473e28373912042
Author: Andrey Albershteyn <aalbersh@kernel.org>

xfs: handle fsverity I/O in write/read path

This commit updates the XFS write, writeback, and read paths to set
IOMAP_F_FSVERITY when handling fsverity metadata, and introduces the
XFS_VERITY_CONSTRUCTION inode flag for Merkle tree construction.

> diff --git a/fs/xfs/xfs_aops.c b/fs/xfs/xfs_aops.c
> index c30e688cfc9f6..19640e4e3ed12 100644
> --- a/fs/xfs/xfs_aops.c
> +++ b/fs/xfs/xfs_aops.c
> @@ -23,6 +23,7 @@
>  #include "xfs_ioend.h"
>  #include "xfs_zone_alloc.h"
>  #include "xfs_rtgroup.h"
> +#include "xfs_fsverity.h"

[Severity: Low]
Does including xfs_fsverity.h here break the build at this commit?

This patch creates fs/xfs/libxfs/xfs_verity.h, whereas fs/xfs/xfs_fsverity.h
is only introduced in the subsequent commit ee4503160b45 ("xfs: use read
ioend for fsverity data verification"), causing compilation of
fs/xfs/xfs_aops.c to fail during bisection.

[ ... ]

> @@ -507,6 +517,22 @@ static const struct iomap_writeback_ops xfs_zoned_wr=
iteback_ops =3D {
>  	.writeback_submit	=3D xfs_zoned_writeback_submit,
>  };
> =20
> +static int
> +xfs_iomap_writepages(
> +	struct xfs_inode		*ip,
> +	struct iomap_writepage_ctx	*ctx)
> +{
> +	/*
> +	 * Writeback does not work for folios past EOF, let it know that
> +	 * I/O happens for fsverity metadata and this restriction need
> +	 * to be skipped
> +	 */
> +	if (xfs_iflags_test(ip, XFS_VERITY_CONSTRUCTION))
> +		ctx->iomap.flags |=3D IOMAP_F_FSVERITY;
> +
> +	return iomap_writepages(ctx);
> +}

[Severity: High]
Can testing XFS_VERITY_CONSTRUCTION only once before iomap_writepages() race
with fsverity enablement and drop dirty Merkle tree folios past EOF?

If a background writeback thread enters xfs_vm_writepages() ->
xfs_iomap_writepages() just before xfs_fsverity_begin_enable() sets
XFS_VERITY_CONSTRUCTION, ctx->iomap.flags starts without IOMAP_F_FSVERITY.

While writeback_iter() -> writeback_get_folio() is running or reschedules on
data folios, xfs_fsverity_begin_enable() can finish filemap_write_and_wait()
(which only waits on PAGECACHE_TAG_WRITEBACK and does not serialize against=
 an
in-flight do_writepages() call), set XFS_VERITY_CONSTRUCTION, and start
dirtying Merkle tree folios past i_size via build_merkle_tree() ->
iomap_fsverity_write().

When the writeback loop reaches those newly dirtied post-EOF folios,
folio_prepare_writeback() calls folio_clear_dirty_for_io(), clearing the
dirty state before iomap_writeback_folio() calls iomap_writeback_handle_eof=
():

fs/iomap/buffered-io.c:iomap_writeback_handle_eof() {
	if (wpc->iomap.flags & IOMAP_F_FSVERITY) {
		WARN_ON_ONCE(folio_pos(folio) < isize);
		return true;
	}

	if (*end_pos > isize) {
		...
		if (folio->index > end_index ||
		    (folio->index =3D=3D end_index && poff =3D=3D 0))
			return false;
}

Because iomap_writeback_handle_eof() runs before wpc->ops->writeback_range
(xfs_map_blocks), wpc->iomap.flags still lacks IOMAP_F_FSVERITY, so the cle=
an
folio is skipped without writing it out or converting its delalloc extent.

Similarly, in xfs_bmapi_convert_one_delalloc(), IOMAP_F_FSVERITY is only set
when offset >=3D xfs_fsverity_metadata_offset(ip):

fs/xfs/libxfs/xfs_bmap.c:xfs_bmapi_convert_one_delalloc() {
	if (xfs_iflags_test(ip, XFS_VERITY_CONSTRUCTION) &&
	    offset >=3D xfs_fsverity_metadata_offset(ip))
		flags |=3D IOMAP_F_FSVERITY;

	ASSERT(!isnullstartblock(bma.got.br_startblock));
	xfs_bmbt_to_iomap(ip, iomap, &bma.got, 0, flags,
				xfs_iomap_inode_sequence(ip, flags));
}

If xfs_bmapi_convert_one_delalloc() converts a delalloc extent below
xfs_fsverity_metadata_offset(ip) while XFS_VERITY_CONSTRUCTION is set,
xfs_bmbt_to_iomap() overwrites wpc->iomap.flags without IOMAP_F_FSVERITY
before the writeback loop advances to post-EOF Merkle tree folios.

[ ... ]

> diff --git a/fs/xfs/xfs_iomap.c b/fs/xfs/xfs_iomap.c
> index 329c745e31204..68fef65764420 100644
> --- a/fs/xfs/xfs_iomap.c
> +++ b/fs/xfs/xfs_iomap.c

[ ... ]

> @@ -883,6 +885,9 @@ xfs_direct_write_iomap_begin(
>  	if (flags & IOMAP_ATOMIC)
>  		iomap_flags |=3D IOMAP_F_ATOMIC_BIO;
> =20
> +	if (xfs_iflags_test(ip, XFS_VERITY_CONSTRUCTION))
> +		iomap_flags |=3D IOMAP_F_FSVERITY;
> +
>  	/*
>  	 * COW writes may allocate delalloc space or convert unwritten COW
>  	 * extents, so we need to make sure to take the lock exclusively here.
> @@ -1023,7 +1028,8 @@ xfs_direct_write_iomap_begin(
>  	trace_xfs_iomap_found(ip, offset, length - offset, XFS_COW_FORK, &cmap);
>  	if (imap.br_startblock !=3D HOLESTARTBLOCK) {
>  		seq =3D xfs_iomap_inode_sequence(ip, 0);
> -		error =3D xfs_bmbt_to_iomap(ip, srcmap, &imap, flags, 0, seq);
> +		error =3D xfs_bmbt_to_iomap(ip, srcmap, &imap, flags,
> +				iomap_flags & IOMAP_F_FSVERITY, seq);
>  		if (error)
>  			goto out_unlock;
>  	}

[Severity: High]
In xfs_direct_write_iomap_begin() at out_found_cow, should the final
xfs_bmbt_to_iomap() call for iomap also include iomap_flags (e.g.
iomap_flags | IOMAP_F_SHARED) instead of passing only IOMAP_F_SHARED?

Right after populating srcmap above, out_found_cow populates iomap with a
hardcoded IOMAP_F_SHARED:

fs/xfs/xfs_iomap.c:xfs_direct_write_iomap_begin() {
out_found_cow:
	...
	seq =3D xfs_iomap_inode_sequence(ip, IOMAP_F_SHARED);
	xfs_iunlock(ip, lockmode);
	return xfs_bmbt_to_iomap(ip, iomap, &cmap, flags, IOMAP_F_SHARED, seq);
}

When an inode has an extent size hint, xfs_buffered_write_iomap_begin()
delegates buffered fsverity metadata writes to xfs_direct_write_iomap_begin=
():

fs/xfs/xfs_iomap.c:xfs_buffered_write_iomap_begin() {
	/* we can't use delayed allocations when using extent size hints */
	if (xfs_get_extsz_hint(ip))
		return xfs_direct_write_iomap_begin(inode, offset, count,
				flags, iomap, srcmap);
}

If that write takes the out_found_cow path, xfs_bmbt_to_iomap() overwrites
iomap->flags with IOMAP_F_SHARED, dropping IOMAP_F_FSVERITY from
iter->iomap.flags.

In iomap_write_iter(), the EOF extension check tests iter->iomap.flags rath=
er
than iter->srcmap.flags:

fs/iomap/buffered-io.c:iomap_write_iter() {
		old_size =3D iter->inode->i_size;
		if (pos + written > old_size &&
		    !(iter->iomap.flags & IOMAP_F_FSVERITY)) {
			i_size_write(iter->inode, pos + written);
			iter->iomap.flags |=3D IOMAP_F_SIZE_CHANGED;
		}
}

Without IOMAP_F_FSVERITY on iter->iomap.flags, won't iomap_write_iter()
extend inode->i_size into the post-EOF fsverity metadata region?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102144147.2393=
369-1-aalbersh@kernel.org?part=3D5
