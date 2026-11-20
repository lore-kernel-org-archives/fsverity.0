Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795191992;
	b=ZTBqHP4FgmFSDPaLC8ZOuDHIX7iym6yF7+J8bTZOW76/A+An65dbxMrMnvjE7tydE0cP
	 F5DXilDSqvR90pbzGcuXRXUoOV3X4LX//jdkWjsbw8ocAPHnY/K7wPM8mkIt3RN4OQnXB
	 YqY5H+ztb68ZDjreyknjN9Wktrf3NClRNj0p/nfGO2TEV9/r6BAElsBbiVmT4h6eifAvb
	 hkqpn2vyWFNORwnWSbx0v6oh1hLYEq13Pz/vokkkN3u2CvFgYtBD6NeW4nHOTofYu4wo0
	 igADJLzputwgB7PPQCEyUQpr54mUe/fXcWahd1VoPEHkHJc/GbWX0M3xVaHyIIV7+ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795191992;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=7vJOm6Y/qpv3G3DN+wZbNKoW/Ky02g6AHoRGzZMLLZM=;
	b=WqCbTZvNds71/JpgdyiOnBwLeXXsL/5oLICSgYR1ORzx2259WFotErA6NJ9TvcNgrNDh
	 1DFYLC+Lyaf8kZwbw2lR9OO0iCZ9wzdQUCcQWDS4LkMqcyGWNIxAaWXw+DdHh42psEtNM
	 ayVPR7wHpOVC8F6NoaiPbk0rwEGQ49lecigZEdhMqiQiYhDkXAhloTHUUT6ga0Oe/1TDC
	 NXO0ot9xiMxpFNE7pevns5EEVmvXqUY2dwxU7tQTMXmt8vUTPCVgtPHgdLa4d0IWaGL0N
	 2k+E5eK7JvDlcQQSmb3aSlrNYr5Svo04AIBBIiSlx/e+nwUl+kXd4DroTeoTCNlm9Hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NT++sXPv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2944606A325
	for <fsverity@lists.linux.dev>; Fri, 20 Nov 2026 16:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NT++sXPv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AFAD1F000D3;
	Fri, 20 Nov 2026 16:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795191992;
	bh=7vJOm6Y/qpv3G3DN+wZbNKoW/Ky02g6AHoRGzZMLLZM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NT++sXPvB6pqDo7x7QOufPuOwNxyUQ78zhlS7kpQyZ1bIiwcRp2Z1dD8wvlnnNr9L
	 H2w/AfGxMlH3yd35vlDlrwzqhkxH2+YwFvJDA4jL3Br1W5kfWA0s0yFPI1kewYlWvQ
	 BJcXfwEkmG7vsqySmHwEg2EUE70K55wm6EOlH7AOuM5vSOberoVbQ5eZzmOtUGhPat
	 PZNGmuA6D0wIsxInhjFypxetpuF7U81ll1HnQ77HiGXQRac43OSdb7ghcJos+aUuZG
	 2uYy95YvgHhj5KHvkkbBIov6HnKB+J91Ru2fPabkNABpPTqlh1MFnritSXFffRL8YD
	 EN1L1lYdo9rGw==
Message-ID: <sashiko-outbox-225564@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v19 01/15] xfs: introduce fsverity on-disk changes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andrey Albershteyn" <aalbersh@kernel.org>, "Eric Biggers" <ebiggers@kernel.org>, "Christoph
 Hellwig" <hch@lst.de>, "Carlos Maiolino" <cem@kernel.org>, fsverity <fsverity@lists.linux.dev>
Cc: david@fromorbit.com, "Darrick J. Wong" <djwong@kernel.org>
In-Reply-To: <20261120155752.192025-2-aalbersh@kernel.org>
References: <20261120155752.192025-1-aalbersh@kernel.org>
 <20261120155752.192025-2-aalbersh@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 16:26:31 +0000
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
- [Medium] xfs: missing FS_VERITY_FL in xfs_fileattr_set() breaks
  FS_IOC_SETFLAGS
--

commit 6ecc983ef533264f23250c3f4f069d8b6005a644
Author: Andrey Albershteyn <aalbersh@kernel.org>

xfs: introduce fsverity on-disk changes

This commit introduces on-disk format definitions for fs-verity in XFS,
including XFS_SB_FEAT_RO_COMPAT_VERITY and XFS_DIFLAG2_VERITY, along with
inode verifier checks and flag conversions.

> diff --git a/fs/xfs/libxfs/xfs_inode_util.c b/fs/xfs/libxfs/xfs_inode_uti=
l.c
> index f486b23a9b523..a717b19558afa 100644
> --- a/fs/xfs/libxfs/xfs_inode_util.c
> +++ b/fs/xfs/libxfs/xfs_inode_util.c
> @@ -73,7 +73,8 @@ xfs_flags2diflags2(
>  	uint64_t		di_flags2 =3D
>  		(ip->i_diflags2 & (XFS_DIFLAG2_REFLINK |
>  				   XFS_DIFLAG2_BIGTIME |
> -				   XFS_DIFLAG2_NREXT64));
> +				   XFS_DIFLAG2_NREXT64 |
> +				   XFS_DIFLAG2_VERITY));
> =20
>  	if (xflags & FS_XFLAG_DAX)
>  		di_flags2 |=3D XFS_DIFLAG2_DAX;
> @@ -125,6 +126,8 @@ xfs_ip2xflags(
>  			flags |=3D FS_XFLAG_DAX;
>  		if (ip->i_diflags2 & XFS_DIFLAG2_COWEXTSIZE)
>  			flags |=3D FS_XFLAG_COWEXTSIZE;
> +		if (ip->i_diflags2 & XFS_DIFLAG2_VERITY)
> +			flags |=3D FS_XFLAG_VERITY;
>  	}

[Severity: Medium]
Does exposing FS_XFLAG_VERITY in xfs_ip2xflags() without allowing
FS_VERITY_FL in xfs_fileattr_set() break FS_IOC_SETFLAGS on verity inodes?

When FS_IOC_GETFLAGS runs on a verity inode, xfs_fileattr_get() ->
xfs_fill_fsxattr() -> fileattr_fill_xflags() translates FS_XFLAG_VERITY
into FS_VERITY_FL in fa->flags.  When userspace such as chattr(1) modifies
an unrelated flag (like FS_NOATIME_FL or FS_IMMUTABLE_FL) and writes the
flags back via FS_IOC_SETFLAGS, xfs_fileattr_set() checks fa->flags against
an allowlist that does not include FS_VERITY_FL:

fs/xfs/xfs_ioctl.c:xfs_fileattr_set() {
    ...
	if (!fa->fsx_valid) {
		unsigned int allowed =3D FS_IMMUTABLE_FL | FS_APPEND_FL |
				       FS_NOATIME_FL | FS_NODUMP_FL |
				       FS_SYNC_FL | FS_DAX_FL |
				       FS_PROJINHERIT_FL;

		if (xfs_has_asciici(mp))
			allowed |=3D FS_CASEFOLD_FL;

		if (fa->flags & ~allowed)
			return -EOPNOTSUPP;
	}
    ...
}

Because FS_VERITY_FL is still present in fa->flags from the GETFLAGS read,
FS_IOC_SETFLAGS fails with -EOPNOTSUPP.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120155752.1920=
25-1-aalbersh@kernel.org?part=3D1
