Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795192683;
	b=IMOMGVDVJ8GBfY8U2ZrWRcpEx4xyftMnVvusF91PbOCd5+30iPj5vIPRWGCZx9cQZuZQ
	 B1j7z21tslbZjJGp2NhGbZcELqSx8I2A8EN/EzrJPvk8Z3+auhsVF4pQBo3acmzJW6aiJ
	 djVstu64m/2Rmu06fO/ZtDU27NG+pPpYBeehjtfsL2fWu5OiUIoRfX48DFudG2tCB4fS4
	 bRBOmy3mIY4jBmi8GyNZ8bDvMDlwsNH4M9lRZwIv7e1REOZJ8rXW6MMCFgIaZFpDK9Fpd
	 OtsYZVjvXQIkfCXG9iJVqSjV7oMwbT1X4BGJXYF2Tlplm6yzRQBS0mIRfYpfflibF/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795192683;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=PxOpoHkcKR1FppPUwuU3iFhxxiXijz+CtevshdMi0/0=;
	b=A9jPFIW1odK9P+4VYbJ6XerepLdHgWYLM8MEMS0XaZUoQpGeeFI9vyObyag065+OyyFN
	 wGowcQr2mw/HvpKs8kbPS/0aZ/AeIZMmMwFQPPwzeFIOdQaikCY2VRkzD6aV+d9UKWGf9
	 znGVSQiDRDaX0Y/rQiZV0qVfJQPKPBucVwo/876NjDfX+cKw4FI2koNVUzwHJf8z16AGK
	 5s4p4pV7Btp2mrp4OOjyiN/dihAFATLFFrWKKHLobQ+JEdDld3OoTpa6sVGb4iAgl4wID
	 k1hVCh1cSzE3k6msxDjFtv1pKacjdzV2g9XHK8WszZUJlsG1F+LWYqZS3VklHrcWNaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZiiM9D+8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3821E606A32C
	for <fsverity@lists.linux.dev>; Fri, 20 Nov 2026 16:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZiiM9D+8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AAF01F000D3;
	Fri, 20 Nov 2026 16:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795192682;
	bh=PxOpoHkcKR1FppPUwuU3iFhxxiXijz+CtevshdMi0/0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZiiM9D+8klwICp4x4Tztsb07WcGqDzrfDgCcjfWrFoOCd4mu50gr23zxyq+O0u16l
	 UhSoKXqm3Cjfu9EUYertbux7jo19ec1xIJE1ijdfPLD4Ner4gEtK0wniMaRjkcMuWh
	 ISkGzkKMV+PUEdNcnoqsPGJOcz0U3HslLPYdBX42UeuDSmsRMH4nUlLrsEX+l+UPWS
	 Chm2hOBOxAS1bZT/05TRnD3G4m9wXw2UvbdOmy5Fr6aZWkoW3CWn/jqEKACF3QkJWx
	 8RTGl8Bds6N4FD5axENyFzlTpdTXapTjZKHgpT33MGS4Sbtc2d7+ESl0LFdUag00Ny
	 8Id74fnT/FOYg==
Message-ID: <sashiko-outbox-225580@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v19 15/15] xfs: enable ro-compat fs-verity flag
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andrey Albershteyn" <aalbersh@kernel.org>, "Eric Biggers" <ebiggers@kernel.org>, "Christoph
 Hellwig" <hch@lst.de>, "Carlos Maiolino" <cem@kernel.org>, fsverity <fsverity@lists.linux.dev>
Cc: david@fromorbit.com, "Darrick J. Wong" <djwong@kernel.org>
In-Reply-To: <20261120155752.192025-16-aalbersh@kernel.org>
References: <20261120155752.192025-1-aalbersh@kernel.org>
 <20261120155752.192025-16-aalbersh@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 16:38:01 +0000
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Post: <mailto:fsverity@lists.linux.dev>
List-Help: <mailto:fsverity+help@lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fsverity+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] xfs: unhandled verity errors and uncleared sickness in
  xchk_inode()
--

commit 895a6d1e83651f06565310457271bfd62d56550f
Author: Andrey Albershteyn <aalbersh@kernel.org>

xfs: enable ro-compat fs-verity flag

This commit enables the XFS_SB_FEAT_RO_COMPAT_VERITY superblock feature fla=
g in
XFS_SB_FEAT_RO_COMPAT_ALL so that XFS filesystems with fs-verity can be
mounted.

> diff --git a/fs/xfs/libxfs/xfs_format.h b/fs/xfs/libxfs/xfs_format.h
> index 2cb375bdbd76b..16d6e8931df06 100644
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
>  #define XFS_SB_FEAT_RO_COMPAT_UNKNOWN	~XFS_SB_FEAT_RO_COMPAT_ALL
>  static inline bool
>  xfs_sb_has_ro_compat_feature(

[Severity: Medium]
Can online scrub and repair handle inodes whose fs-verity metadata fails
validation with -EINVAL or -EFBIG, and clear XFS_SICK_INO_FSVERITY after
repair?

In commit "xfs: check and repair the verity inode flag state",
xchk_inode_setup_verity() ignores several validation errnos from
fsverity_ensure_verity_info() so that scrub and repair can proceed:

fs/xfs/scrub/common.c:xchk_inode_setup_verity() {
	...
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
	...
}

However, validate_fsverity_descriptor() returns -EINVAL for invalid descrip=
tor
fields (such as bad version, non-zero reserved bytes, or data_size mismatch=
),
and fsverity_init_merkle_tree_params() returns -EINVAL or -EFBIG for invalid
hash algorithms, block sizes, or oversized Merkle trees.  Because those hit=
 the
default case, xchk_prepare_iscrub() and xrep_dinode_core() abort the scrub =
or
repair ioctl instead of flagging corruption or running xrep_inode_verity().

In addition, commit "xfs: introduce health state for corrupted fsverity
metadata" sets XFS_SICK_INO_FSVERITY on ip->i_sick when descriptor loading
fails, and includes it in XFS_SICK_INO_PRIMARY.  Because
type_to_health_flag[XFS_SCRUB_TYPE_INODE] only maps to XFS_SICK_INO_CORE and
neither xchk_inode() nor xrep_inode_verity() adds XFS_SICK_INO_FSVERITY to
sc->healthy_mask, XFS_SICK_INO_FSVERITY remains set after repair and causes
xfs_inactive_health() to mark the AG sick with XFS_SICK_AG_INODES when the
inode is evicted.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120155752.1920=
25-1-aalbersh@kernel.org?part=3D15
