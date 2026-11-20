Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795191718;
	b=Eo40b7Q8z1pwQkAIXjaBxaFEKLjIgjgdfi8BMrEhCuXmKSxFk16VCFVS/8qVu2Osfsda
	 Kl3CwF80keOgRpRIrzQil9PT30HJKyiV1vM3hI/zsdCB++cEHJzeedeCUo8ZY2agvBUyM
	 r1dDxqps/dILQV73bYYrqkYJM+bUQ1gwyrMilJW9EZopWcSqKu1aZkkbBTd7M0G86AMTB
	 hgzZj++VdZKK+IuNn9j/S+myjK8a0O4jgH4s7ow4dFCtb0XYyPE093g7L+03bO3hNLqER
	 TVuSE2ueUV8RGexzriOQsBZWwdRs482TzrPaqwN2usjt5vJV9ACA6jlDLKNW/IsHlEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795191718;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Y7vAJt//gZoqyDH0FIxxlhUVevq06zFxg/z6IzpVEXw=;
	b=YJ1sK6EnhDb6gWYhrr2cGlzkZ1XNCjFDwE5wuTVkppIzsjlr1L1P947SFRebGA5KV88O
	 Z1z75bOeOj4evMT2kbdXprqyDxkrThzEFRn4/1+sYfght3QxBeFmPkUxGDLeT9hHMrnDW
	 PJjZvq6RM4sgqiGPY/SRGwUSeOpeFFWPhYRJKxhyooaUiKdPtyjG/EpvTPzmK4lZDA30o
	 RQtULp6Tdd86E4m6ikS8hVs4Rl0eOqMd16r9O/JDaKJMjLWyFpdP1Rldy6yOMJTV8kAz3
	 UCmMPv9+ghs9p9gBDHi5CLHmQbbCpXhSiybUTgdpLQYF+HK6b/vGTu2k5B2sJ1kweNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FhVaFd9i;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD6C9606A320
	for <fsverity@lists.linux.dev>; Fri, 20 Nov 2026 16:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FhVaFd9i
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE4281F000CA;
	Fri, 20 Nov 2026 16:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795191718;
	bh=Y7vAJt//gZoqyDH0FIxxlhUVevq06zFxg/z6IzpVEXw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FhVaFd9ijRZG77NDnLJd23ZGDMXAzbYuTEL8gxGb4qnMkosTOlU3fWpTaDLOZ61o3
	 UAtoY4i4OpK0uLmtWaMhvi3D3kGxA3gqbOh3/1ywSdlj1edGeXqnvNwBas6s1KTCk9
	 Mo0V7mLUBzgUWkB7AhebRx6Qypi8U0eLXyprzQpVRknO6MiMNx/yVTcqcmMd+kAvN2
	 UNmxmOdIhD6jCpyHBN5dpk0Mz6K7YfqBjNU45E2SsQQ+nC5KDfa1LzdNzHJBlwbbSz
	 d5uzVaFOKn2BiUxNmHKaSNfqNgDhyoVltvjnyfy9DO0SBMFr4OnSPf2jAljaB65K1m
	 As35kYPrL4m2g==
Message-ID: <sashiko-outbox-225559@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v19 08/15] xfs: don't remove written extents past EOF on
 fsverity inodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andrey Albershteyn" <aalbersh@kernel.org>, "Eric Biggers" <ebiggers@kernel.org>, "Christoph
 Hellwig" <hch@lst.de>, "Carlos Maiolino" <cem@kernel.org>, fsverity <fsverity@lists.linux.dev>
Cc: david@fromorbit.com, "Darrick J. Wong" <djwong@kernel.org>
In-Reply-To: <20261120155752.192025-9-aalbersh@kernel.org>
References: <20261120155752.192025-1-aalbersh@kernel.org>
 <20261120155752.192025-9-aalbersh@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 16:21:57 +0000
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Post: <mailto:fsverity@lists.linux.dev>
List-Help: <mailto:fsverity+help@lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fsverity+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [High] xfs: implicit declaration of fsverity_is_building() breaks
  build
- [Low] xfs: xfs_free_eofblocks() clears eofblocks tag before truncating
  extents
--

commit 9dfe7c39ae9adbec3053517f6ebaa07ffa9e51dc
Author: Andrey Albershteyn <aalbersh@kernel.org>

xfs: don't remove written extents past EOF on fsverity inodes

This commit updates xfs_can_free_eofblocks(), xfs_free_eofblocks(), and
xfs_inode_free_eofblocks() to preserve written post-EOF extents on
fsverity inodes while punching out delayed allocations and unwritten
extents after Merkle tree construction.

> diff --git a/fs/xfs/xfs_bmap_util.c b/fs/xfs/xfs_bmap_util.c
> index 865aec3ae5ab3..d6130cfc8246d 100644
> --- a/fs/xfs/xfs_bmap_util.c
> +++ b/fs/xfs/xfs_bmap_util.c
[ ... ]
> @@ -553,6 +554,17 @@ xfs_can_free_eofblocks(
>  	if (last_fsb <=3D end_fsb)
>  		return false;
> =20
> +	/*
> +	 * Don't clean fsverity inodes as they already have been cleaned up and
> +	 * are read-only. Skip inodes which have merkle tree being built, the
> +	 * merkle tree is written beyond EOF. Skip inodes which have
> +	 * XFS_DIFLAG2_VERITY in case this kernel has fsverity disabled.
> +	 */
> +	if (fsverity_active(VFS_IC(ip)) ||
> +	    fsverity_is_building(VFS_I(ip)) ||
> +	    ip->i_diflags2 & XFS_DIFLAG2_VERITY)
> +		return false;

[Severity: High]
Where is fsverity_is_building() declared?  Neither include/linux/fsverity.h
nor any other header defines it, so the calls here, in
xfs_free_eofblocks(), and in xfs_inode_free_eofblocks() fail to compile
with an implicit function declaration error.

> @@ -593,15 +607,20 @@ xfs_free_eofblocks(
>  	 *
>  	 * Note that this means we also leave speculative preallocations in
>  	 * place for preallocated files.
> +	 *
> +	 * Clean up delalloc reservations for fsverity too as those won't be
> +	 * used
>  	 */
> -	if (ip->i_diflags & (XFS_DIFLAG_PREALLOC | XFS_DIFLAG_APPEND)) {
> +	if (ip->i_diflags & (XFS_DIFLAG_PREALLOC | XFS_DIFLAG_APPEND) ||
> +			verity) {
>  		if (ip->i_delayed_blks) {
>  			xfs_bmap_punch_delalloc_range(ip, XFS_DATA_FORK,
>  				round_up(XFS_ISIZE(ip), mp->m_sb.sb_blocksize),
>  				LLONG_MAX, NULL);
>  		}
>  		xfs_inode_clear_eofblocks_tag(ip);
> -		return 0;
> +		if (!verity)
> +			return 0;
>  	}

[Severity: Low]
Should xfs_inode_clear_eofblocks_tag(ip) only be called inside the
!verity branch here?  When verity is true, the tag is cleared before the
extent truncation transaction runs (and cleared a second time after
xfs_trans_commit()), leaving XFS_IEOFBLOCKS cleared if xfs_trans_alloc(),
xfs_itruncate_extents_flags(), or xfs_trans_commit() fails.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120155752.1920=
25-1-aalbersh@kernel.org?part=3D8
