Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793631758;
	b=qIqV4yaab/TwICoE+YCEjMVNTRx9idUc/9QkdSB067F9bxK4O3AU1jhLIz3T1DbfXGvu
	 wzihDVDMtF7/G4sKYqWj7/VxDv17KF80eeYqPE7r500p5IkFEsIW2PSc7Cf6vXjG5kvPB
	 KPRyZ3llQ2bWOP2pk2/FiSRRtg2ij+MrPLtASFldIw2L0yC0X0lGD9WI1S7K3xSmGWQTi
	 19+9X+ApANMDZWSBEFuAAbbVEREw5h+RvFcONdz/+APgInWwVVxVdpr3MMUV+z6PFi8/G
	 ZgbkYib/ku6vwtWKbub1pCpWXWsPgPupGuGnqd894ZCi2VoP0p9yBYzbdYpNb9JnyiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793631758;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=c5BJXSduZpdK6Iwm7iDfGyQJ3wAcgkvWJJPTZUgGvW8=;
	b=hEA/ev0bc/4HWvnzLEuBSDlEXLIOAlTMSY7oulqQmvhm7/A1STWBagxNCEAX3gKXW8vn
	 cdim/PsNadOYcSkVyRxUVD3yFlgQMJKF3eA/tdb3V+nv8zjd5bGfDHGZhfH58YkUctb2z
	 A7e8C2jOgrTkJv+tydl+QYZFSQMHxE111XbaTk9tOlDKrWKBbIUgpOk2Mt2+uzY5ojo2L
	 jNS6bkJNOlHyk06SJRF+DHQ/eD6eoZR9iemhhOHfSmpYfQ4b1ypmF+G+22FqqUl6DVL1I
	 l2JL0fovgt+SeUWbgHT6Htjp5DoO3VYDB2Jz+fkt4LR0Pxj5b0h0Zeq2t8qMNCGxwZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bCd4hYLn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC4256070D9B
	for <fsverity@lists.linux.dev>; Mon,  2 Nov 2026 15:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bCd4hYLn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38A3C1F00A18;
	Mon,  2 Nov 2026 15:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793631757;
	bh=c5BJXSduZpdK6Iwm7iDfGyQJ3wAcgkvWJJPTZUgGvW8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bCd4hYLnj67tlMYOLOYbx1UyIzXU0UKAXTjg3HbkJkgYLH+OgnBA66ciB4SpP0Jmp
	 wDBmugbPaR+YfRSHMuSCwDjpAYZsQfGZyt4zOkoqZNmRuU6siZ+jK5x5bH7RBPCrAk
	 j89cbYpSvjaWRJpEbFcUH4TEZjEQCWnyMA4uKfRXwTP1R9j1M85Z7T0aBbgLYYJpbV
	 z01w5qScjkxlKvjbaF7m/BoHpI65ty3w+sJp991kGI2llveRkiuYrmQR74atJMMgxB
	 CDUWYuajuHjoWbEMT/GFy1sa2kZWCy7WX1Z33NfYCHXzEJmXXIjq7L/L+Gtc/DJs+K
	 izgOoyB8CTl0g==
Message-ID: <sashiko-outbox-193622@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v18 07/15] xfs: add XFS_BMAPI_UNWRITTEN to unmap
 unwritten extents in __xfs_bunmapi()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andrey Albershteyn" <aalbersh@kernel.org>, ebiggers@kernel.org, hch@lst.de, "Carlos
 Maiolino" <cem@kernel.org>, fsverity@lists.linux.dev
Cc: david@fromorbit.com, "Darrick J. Wong" <djwong@kernel.org>
In-Reply-To: <20261102144147.2393369-8-aalbersh@kernel.org>
References: <20261102144147.2393369-1-aalbersh@kernel.org>
 <20261102144147.2393369-8-aalbersh@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 15:02:36 +0000
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Post: <mailto:fsverity@lists.linux.dev>
List-Help: <mailto:fsverity+help@lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fsverity+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] xfs: __xfs_bunmapi() with XFS_BMAPI_UNWRITTEN unmaps written rt ex=
tents
--

commit 823f5c04cb0ac218e733c0788aa8567888bdc3de
Author: Andrey Albershteyn <aalbersh@kernel.org>

xfs: add XFS_BMAPI_UNWRITTEN to unmap unwritten extents in __xfs_bunmapi()

This commit adds the XFS_BMAPI_UNWRITTEN flag to __xfs_bunmapi() so callers
can unmap only unwritten extents while leaving written extents in place.

> diff --git a/fs/xfs/libxfs/xfs_bmap.c b/fs/xfs/libxfs/xfs_bmap.c
> index a35a44cf8c635..706f2ead42f58 100644
> --- a/fs/xfs/libxfs/xfs_bmap.c
> +++ b/fs/xfs/libxfs/xfs_bmap.c
> @@ -5279,6 +5279,10 @@ __xfs_bunmapi(
>  		if (del.br_startoff + del.br_blockcount > end + 1)
>  			del.br_blockcount =3D end + 1 - del.br_startoff;
> =20
> +		if ((flags & XFS_BMAPI_UNWRITTEN) &&
> +		    del.br_state !=3D XFS_EXT_UNWRITTEN)
> +			goto skip;
> +
>  		if (!isrt || (flags & XFS_BMAPI_REMAP))
>  			goto delete;

[Severity: High]
As reported by Darrick J. Wong on v16 [1], when __xfs_bunmapi() is called
with XFS_BMAPI_UNWRITTEN on a realtime inode with sb_rextsize > 1, can an
unwritten tail of a partially written realtime extent cause the written left
neighbor to be converted to unwritten and freed?

Specifically, if del is an unwritten extent (del.br_state =3D=3D
XFS_EXT_UNWRITTEN) at the end of a realtime allocation unit whose head
extent prev is written (prev.br_state =3D=3D XFS_EXT_NORM), it passes this =
check
and enters the realtime alignment logic in __xfs_bunmapi():

		mod =3D xfs_rtb_to_rtxoff(mp, del.br_startblock);
		if (mod) {
			...
			} else if (del.br_startoff =3D=3D start &&
				   (del.br_state =3D=3D XFS_EXT_UNWRITTEN ||
				    tp->t_blk_res =3D=3D 0)) {
				...
				continue;
			} else if (del.br_state =3D=3D XFS_EXT_UNWRITTEN) {
				...
				if (!xfs_iext_prev_extent(ifp, &icur, &prev))
					ASSERT(0);
				ASSERT(prev.br_state =3D=3D XFS_EXT_NORM);
				...
				prev.br_state =3D XFS_EXT_UNWRITTEN;
				error =3D xfs_bmap_add_extent_unwritten_real(tp,
						ip, whichfork, &icur, &cur,
						&prev, &logflags);
				if (error)
					goto error0;
				goto nodelete;
			}

When del.br_startoff > start and del.br_blockcount <=3D off, this branch
assumes the caller is also unmapping the preceding range. It converts the
written left neighbor prev to XFS_EXT_UNWRITTEN (merging it with del) and
jumps to nodelete. On the next loop iteration, the newly merged extent is
both unwritten and aligned to the realtime extent boundary, so
__xfs_bunmapi() jumps to delete and frees the written blocks as well.

Although xfs_fsverity_begin_enable() in the subsequent fs-verity patch
checks xfs_inode_has_bigrtalloc(ip), enable_verity() drops inode_lock()
after begin_enable_verity() while building the Merkle tree. On an empty or
sparse file where xfs_inode_has_filedata(ip) is false, a concurrent
FS_IOC_FSSETXATTR ioctl via xfs_ioctl_setattr_xflags() (which does not check
XFS_VERITY_CONSTRUCTION) can set XFS_DIFLAG_REALTIME before
xfs_fsverity_end_enable() writes the verity descriptor and calls
xfs_free_eofblocks(). Additionally, xfs_dinode_verify() does not reject
on-disk inodes that have both XFS_DIFLAG2_VERITY and XFS_DIFLAG_REALTIME
when sb_rextsize > 1.

Should __xfs_bunmapi() skip partial unwritten realtime extents when
XFS_BMAPI_UNWRITTEN is set instead of converting the written left neighbor?

[1] https://lore.kernel.org/r/20260922044911.GA6239@frogsfrogsfrogs

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102144147.2393=
369-1-aalbersh@kernel.org?part=3D7
