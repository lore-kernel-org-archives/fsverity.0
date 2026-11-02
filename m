Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793632568;
	b=YNXJKJ6JMipeLJ4mJm9cNxvCqKKeW4gtvRtIJHUvOy1gWg0kLB5kK7vVpSKJ8OISY3sg
	 cX1T5rbCIjPuUT4uyrS46myHdpio8O1HV1MCVjrK7b8yX1hZG5VQw6yf8TioMkwU7RTUH
	 tuY/5bFlQRFPTY555g7bhyzwekiVlLktSA9CyW5zAex+n1g9i6qYs9HeBKBFBDgipsy4L
	 cg8/JNwD68Oc1FVL/U6rPFY5sG7ZWCBA8ZP/TRBncSmdbTllNew13wwkNEo+sFH7Plepg
	 sCR40opbc1JMCyXWXpTkUw8JcHyzkRh78WV2ehP3oCKHB+2Ympk7JT9BeC8Zd0IMmzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793632568;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=LDS6aOYmCqqyBYXfITG/d74MbIQ49OPABzEGN7w/nuE=;
	b=yO17XAv3d78XKubfpfS4iWTVk1rNjwySxCQ+asDGfKnwRLi3+tLeO/vzMgdDCw4Mqgra
	 yjP3WCRuihURH7OBc6+4zpyI79cxfoFdvMX8HFTviIA/NBdpg9VhUig9GNz3h6v2Quu8h
	 fiB5Z/QaBUcH20kVhRDNMypb/Uf27C8s3J62nNGnIrcb2sCG7Z4uu6G6FU8aQnrFduzFq
	 5Pe3cYdQeFZXz8IT4Ls+TsRt2o37uKtLXY2ysOdJVi5QNel4JNB6HJRmE+/9t6K7yDuft
	 PCTO6l2hGuMyhnhKgpQk6LVWgsEsY88Qys28W/HfBAliO7zuDd8wGqDPL7/Kj6G/iOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Q/PkfqFc";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE15A607A89E
	for <fsverity@lists.linux.dev>; Mon,  2 Nov 2026 15:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q/PkfqFc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 790B61F00A18;
	Mon,  2 Nov 2026 15:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793632567;
	bh=LDS6aOYmCqqyBYXfITG/d74MbIQ49OPABzEGN7w/nuE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Q/PkfqFc4ywM5Uw10T+bp9H2yfhg7exII2QUO2maB4D0nHx7sUA+nuk0vge08AC0D
	 2R7dK170zMeMb2DJc9KTczIyGzvhJJxFuzPW27MMJP2wFbXgUH1NyZsxhgqs1nz/Ie
	 llRgLq/Ly1sLXTPluvEa7tMq9z/QfFYsPHJJqblxREtK4BmXnRtT07ZuznjENyCKqW
	 LYnyyF0Xmvw/uHzd2Ieo0q5a2EDa9JrzscrqkoMNYWTsajinTptZQl2MT4pqq0Ej1Y
	 5dsFOoxMtfaHwZkEglo9GCrdaONArAX1yTFu6yBzsTqD3ft1K9LUgEJ/HU887fBokt
	 OksxHTf4ykKyA==
Message-ID: <sashiko-outbox-193646@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v18 14/15] xfs: introduce health state for corrupted
 fsverity metadata
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andrey Albershteyn" <aalbersh@kernel.org>, ebiggers@kernel.org, hch@lst.de, "Carlos
 Maiolino" <cem@kernel.org>, fsverity@lists.linux.dev
Cc: david@fromorbit.com, "Darrick J. Wong" <djwong@kernel.org>
In-Reply-To: <20261102144147.2393369-15-aalbersh@kernel.org>
References: <20261102144147.2393369-1-aalbersh@kernel.org>
 <20261102144147.2393369-15-aalbersh@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 15:16:07 +0000
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
- [Medium] xfs: XFS_SICK_INO_FSVERITY is never cleared by online scrub or r=
epair
--

commit 82a3ec6a24449be06212877f0d87b35ebb6ba704
Author: Andrey Albershteyn <aalbersh@kernel.org>

xfs: introduce health state for corrupted fsverity metadata

This commit adds the XFS_SICK_INO_FSVERITY inode health flag (and its bulks=
tat
counterpart XFS_BS_SICK_FSVERITY) and marks the inode sick in
xfs_fsverity_get_descriptor() when fsverity descriptor validation fails.

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
> =20
>  #define XFS_SICK_INO_ZAPPED	(XFS_SICK_INO_BMBTD_ZAPPED | \
>  				 XFS_SICK_INO_BMBTA_ZAPPED | \
> diff --git a/fs/xfs/xfs_fsverity.c b/fs/xfs/xfs_fsverity.c
> index 441251b360731..9b83a0735dc04 100644
> --- a/fs/xfs/xfs_fsverity.c
> +++ b/fs/xfs/xfs_fsverity.c
> @@ -89,13 +89,17 @@ xfs_fsverity_get_descriptor(
>  	if (error)
>  		return error;
> =20
> -	if (is_empty)
> +	if (is_empty) {
> +		xfs_inode_mark_sick(XFS_I(inode), XFS_SICK_INO_FSVERITY);
>  		return -ENODATA;
> +	}

[Severity: Medium]
Once xfs_fsverity_get_descriptor() sets XFS_SICK_INO_FSVERITY on an inode, =
how
is this sickness flag cleared when online scrub or repair runs?

When an inode has corrupted fsverity metadata, opening the file or running
online scrub/repair (XFS_SCRUB_TYPE_INODE) invokes:

xchk_prepare_iscrub() / xrep_dinode_core()
  xchk_inode_setup_verity()
    fsverity_ensure_verity_info()
      fsverity_get_descriptor()
        xfs_fsverity_get_descriptor()
          xfs_inode_mark_sick(XFS_I(inode), XFS_SICK_INO_FSVERITY)

In fs/xfs/scrub/health.c, type_to_health_flag maps XFS_SCRUB_TYPE_INODE only
to XFS_SICK_INO_CORE:

    [XFS_SCRUB_TYPE_INODE] =3D { XHG_INO, XFS_SICK_INO_CORE },

During online repair, xchk_inode() sees xchk_inode_verity_broken(sc->ip) and
marks XFS_SICK_INO_CORE | XFS_SICK_INO_FORGET corrupt. Then
xrep_inode_verity() repairs the inode by clearing XFS_DIFLAG2_VERITY and
S_VERITY:

fs/xfs/scrub/inode_repair.c:xrep_inode_verity() {
    if (xchk_inode_verity_broken(sc->ip)) {
        sc->ip->i_diflags2 &=3D ~XFS_DIFLAG2_VERITY;
        inode_set_flags(inode, 0, S_VERITY);

        xfs_trans_log_inode(sc->tp, sc->ip, XFS_ILOG_CORE);
    }
}

When xfs_scrub_metadata() re-runs xchk_inode() to verify the repair and cal=
ls
xchk_update_health(), xfs_inode_mark_healthy(sc->ip, mask) is called with
mask =3D XFS_SICK_INO_CORE | XFS_SICK_INO_FORGET, because neither xchk_inod=
e()
nor xrep_inode_verity() adds XFS_SICK_INO_FSVERITY to sc->sick_mask or
sc->healthy_mask (and xfs_fsverity_delete_metadata(),
xfs_fsverity_reset_inode(), and xfs_fsverity_end_enable() do not clear it
either).

As a result, xfs_inode_mark_healthy() clears XFS_SICK_INO_CORE and
XFS_SICK_INO_FORGET while leaving XFS_SICK_INO_FSVERITY set in ip->i_sick.
Does this leave the repaired inode permanently sick in memory (preventing
xfs_reclaim_igrab() from reclaiming it and continuing to report
XFS_BS_SICK_FSVERITY in xfs_bulkstat_health()), and cause
xfs_inactive_health() to falsely mark the AG sick with XFS_SICK_AG_INODES w=
hen
the repaired inode is eventually inactivated because XFS_SICK_INO_FORGET was
cleared?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102144147.2393=
369-1-aalbersh@kernel.org?part=3D14
