Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793632114;
	b=a/r42IxDKutiLcHVdJVACbUeSgtrEZNP7BQf6fwoYGoWLi4wP4KjWp6tw0asRR1BNfzo
	 3lA8sxwQfg5CrOVz962bUjdeQo0DnQn+a2pGksEp6aTEFevvUI+O3o8/zirfv3+q/ivmX
	 gxQDidw851cElVnBTbvOvwsnnXNR25siNERJz8EIdG/XTj2R3pAZGgyx+26/DD7Pvzk5p
	 JjM4eHhQ5mlbJkaGDNSK6fmxyuC9wYRCJMOKBLhaa5UAHARvRSKM32p7tqYQo6A6kS89h
	 FTreyORgEdVAIYmI1yx7OsXD4vgow2k4J/IPPykG0IUFlsBY91kqXT2my//T2sqAvyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793632114;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=hQNOUA7axfB/1ZOHbyJOVybn376dOFMq0S9fNf7bomE=;
	b=Gu2JXSYgmnRnfVwAxdo9MLDat9qkoK+KRKBVxXZg2oPEWX3jNXubcW8rVRYC7ljA83Pa
	 sBFo5t5Hag4zS+/2pgmZ0I4WpkGo4d8B+4nN0rEbokaNOtQMvxFS1Ren1xQbVxHy96C5G
	 EChZA2KmEPm0ZjuW35VlnUtq1tomvE3yyKUTUvocUdSR+fHHYiEaX4C942v8N3ZvPjucY
	 Sh4pvCxfxi7KvA5/kuYQt77c2q8yb1PN9VfaDJ6/8I3uXlz9GLczAPmV7yUWrysYg6Y8o
	 thUKFaKwHHCnzwDHegCYkjufSroDfmfZ+Wp5FE95ehMkWPmLUMTRcsguUSDD+tJi2+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hjQkRZKV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEAD060A8C06
	for <fsverity@lists.linux.dev>; Mon,  2 Nov 2026 15:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hjQkRZKV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90AC71F00A17;
	Mon,  2 Nov 2026 15:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793632113;
	bh=hQNOUA7axfB/1ZOHbyJOVybn376dOFMq0S9fNf7bomE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hjQkRZKV7JhG5jIihUgEjbFj++im74fazR8MdG9AjED69JrArfSdZNMtFAVDwUJ+I
	 uMKSvG+8UcKwev9aXjyjDwD1x1aJjs3pcbOmXhjKFXviM366PiVQPG7dzz16QWrWnI
	 7aun+PEzAY01aQk/F6yMdGVPjEsOUT5bApV1smfvHOP8HMwWLEVGyx0JviFCoI3DBw
	 0tO+9jP96MQaKzO+xs5Y4PDrwPIn8/0MfSsvBEMn/K4kFZ7GZiPilAe6m2W+JUQ6dB
	 iafBh+6FpPDaLDi7FowCwD8qOG+3QaWVd4zavtaQCexy3Jb+MEPp9vGGD3ht4L2p9o
	 zUrLSpDnA3Frg==
Message-ID: <sashiko-outbox-193633@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v18 01/15] xfs: introduce fsverity on-disk changes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andrey Albershteyn" <aalbersh@kernel.org>, ebiggers@kernel.org, hch@lst.de, "Carlos
 Maiolino" <cem@kernel.org>, fsverity@lists.linux.dev
Cc: david@fromorbit.com, "Darrick J. Wong" <djwong@kernel.org>
In-Reply-To: <20261102144147.2393369-2-aalbersh@kernel.org>
References: <20261102144147.2393369-1-aalbersh@kernel.org>
 <20261102144147.2393369-2-aalbersh@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 15:08:32 +0000
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
- [Medium] xfs: FS_IOC_SETFLAGS fails with EOPNOTSUPP on verity files in xf=
s_fileattr_set()
--

commit 28c38f60096ab4965845dc0881e604defd26203f
Author: Andrey Albershteyn <aalbersh@kernel.org>

xfs: introduce fsverity on-disk changes

This commit introduces the on-disk XFS_DIFLAG2_VERITY inode flag and the
XFS_SB_FEAT_RO_COMPAT_VERITY superblock feature bit for fs-verity support.
It also wires up inode verification and flag conversions between on-disk
diflags2, extended attributes, and VFS inode flags.

[ ... ]

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

[Severity: Medium]
When FS_XFLAG_VERITY is returned by xfs_ip2xflags(), will a read-modify-wri=
te
cycle using FS_IOC_GETFLAGS and FS_IOC_SETFLAGS (such as chattr toggling
FS_IMMUTABLE_FL or FS_NOATIME_FL) on a verity-enabled inode fail with
-EOPNOTSUPP?

During FS_IOC_GETFLAGS on an inode with XFS_DIFLAG2_VERITY set,
vfs_fileattr_get() -> xfs_fileattr_get() -> xfs_fill_fsxattr() ->
fileattr_fill_xflags() translates FS_XFLAG_VERITY into FS_VERITY_FL in
fa->flags.

When userspace modifies another flag and passes the flags back via
FS_IOC_SETFLAGS, ioctl_setflags() calls fileattr_fill_flags(), which leaves
fa->fsx_valid as false while preserving FS_VERITY_FL in fa->flags. In
fs/xfs/xfs_ioctl.c:xfs_fileattr_set():

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

Should xfs_fileattr_set() allow FS_VERITY_FL in allowed when
ip->i_diflags2 & XFS_DIFLAG2_VERITY is set, similar to how FS_CASEFOLD_FL is
handled right above it?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102144147.2393=
369-1-aalbersh@kernel.org?part=3D1
