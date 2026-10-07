Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB26B40680F;
	Wed,  7 Oct 2026 06:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791355271; cv=none; b=WjHQjyh6Wl4P6cn+K4vVxEMJCEvdgLSVG6jmeFY8H+bfHAqh6MiH4YEKLxJXoRmbMDVu+nRRVHkO+InoncdT99qd3G9WEDmca2FXSl9Es4OHoamSLOaMNeQ7M2g8O8RzJxdxR8BntQA8JQE0rMSudqKbl0iC5/peWYNASntpapQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791355271; c=relaxed/simple;
	bh=/MrSSOjH6lZHbxBsn0oVLGTqgyTjcmG1aGU3QOhhnqM=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=nlek+03eWvY8HkyDjakDzbK9fBipDFgsYtt1bpaJSnH0GGjgY4JNF+y3Gd4s0+fe5FM/FH3IyAKYqa9TFEdD2yb9CpmkV5pelWXHx76msmXZSWIWJeyGcuzrZmB3V7dZHnvLl6z3WZKHWjRoXEpZzpsyAXmoR2/EIiNgDaRzqyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nprsY2b5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nprsY2b5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A8BE1F0089B;
	Wed,  7 Oct 2026 06:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791355270;
	bh=Rud9F8uCtycX/IqZP5NIE5anwNdKj7HLofR2MoL97dU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nprsY2b5N4P72oaD5MPBEG8x0mp7EO77shD5QymZi6JhSzh7IONNM0lD82DPyuh4E
	 ZYiSaOwtjsD71z652/qWalV1+OL9uVBMNfSvnJj+sRvvaOZEvm5r58d6wPK7TK9oDI
	 PGvPIbgD5BagR4HCg8Ba2nl0FihfJfscXVXWC9t9EwJQQDzMP0lgoONUjJoGhi4AS+
	 VGrhVuRVk1oszwIw2dQ3mxxHo/q/7k6kBzkQf+RABCW5BmY7Luo16GS0BCyXQoikq5
	 3mFwuiBSuFA4gu+mJraMGs1/9SMqUIirWB0vywQwjTHoLwaTsNVa+NpelCo9Hgjprg
	 QX4OUn+z3ajqg==
Message-ID: <sashiko-outbox-162680@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: Patch "fs,fsverity: reject size changes on fsverity files in
 setattr_prepare" has been added to the 6.18-stable tree
Reply-To: sashiko-reviews@lists.linux.dev
To: ebiggers@kernel.org, gregkh@linuxfoundation.org, djwong@kernel.org, fsverity@lists.linux.dev, hch@lst.de, jack@suse.cz
Cc: stable-commits@vger.kernel.org
In-Reply-To: <2026100754-drizzle-shape-0a72@gregkh>
References: <2026100754-drizzle-shape-0a72@gregkh>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 07 Oct 2026 06:41:09 +0000
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] vfs: verity file truncation bypass when CONFIG_FS_VERITY is disabl=
ed
--

commit 750dd8cb058f7ea5d2ca5305006f1c5e63c6eb32
Author: gregkh@linuxfoundation.org <gregkh@linuxfoundation.org>

fs,fsverity: reject size changes on fsverity files in setattr_prepare

This commit centralizes the check to reject truncates of fsverity files
into setattr_prepare() in fs/attr.c. This removes boilerplate code from
individual filesystems and fixes a missing truncation check in btrfs.

Link: https://lore.kernel.org/r/20260128152630.627409-2-hch@lst.de

> diff --git a/fs/attr.c b/fs/attr.c
> index 795f231d00e8e..2c94af08be183 100644
> --- a/fs/attr.c
> +++ b/fs/attr.c
> @@ -169,7 +169,17 @@ int setattr_prepare(struct mnt_idmap *idmap, struct =
dentry *dentry,
>  	 * ATTR_FORCE.
>  	 */
>  	if (ia_valid & ATTR_SIZE) {
> -		int error =3D inode_newsize_ok(inode, attr->ia_size);
> +		int error;
> +
> +		/*
> +		 * Verity files are immutable, so deny truncates.  This isn't
> +		 * covered by the open-time check because sys_truncate() takes a
> +		 * path, not an open file.
> +		 */
> +		if (IS_ENABLED(CONFIG_FS_VERITY) && IS_VERITY(inode))
> +			return -EPERM;

[Severity: High]
Does this logic inadvertently permit truncating verity files when
CONFIG_FS_VERITY is disabled?

Before this patch, filesystems explicitly called fsverity_prepare_setattr().
When CONFIG_FS_VERITY was disabled, the fallback implementation safely retu=
rned
-EOPNOTSUPP for any inode with the verity flag set.

By short-circuiting the check here with IS_ENABLED(CONFIG_FS_VERITY), it
appears an unprivileged user with DAC write access could use sys_truncate()
to bypass the check and modify a verity file if the kernel was built without
fsverity support.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/2026100754-drizzle-=
shape-0a72@gregkh?part=3D1
