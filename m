Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795192023;
	b=F5T+BIo6MYyIM9u56+8/5WoHFym7g8IQEu8XR+msSilIvZwie24J2CcImlpOqY7S7N70
	 RIIKWsCxY4eYYi7Rg3b9dNE/0W1T8elve8Pe1sRLW1cbcYU5vS5MnYb8XOpX/k1hkC9cS
	 MHKoQ24fO8Rjzmsn6qnBWrXs2WivndS1xXwqW8UutKm5Yza6t5asaTa11ol1RvUh0KYuI
	 o6HBJMWKtPNmcIKg9hF+CXjxSCPR+YT0mnFGsbu7TH+Wiy6sNL/htkJbRM1U0ckcDaCA3
	 4mo2TG87JOekU0EW3K1OO/5GiQirkNWV+vQu//H9dBrQxRuw5W0m0M+bhr5hSJCtfiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795192023;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=wkRo6jzXBlSCS1zbm0MHD3mklwY8Bb6Xai0u0PP9Cvo=;
	b=Nx00yKP+N4SK1THtjAHHgjriveAvAER2vN6/7sko0GtEJ0fgWL3EiIzsPJ/OT6GbRgkU
	 LQoGsF5efS/AF7LMcaBxWzuXiT+cBES7kNMHqaHgv8Dq34ddWkOjhpGAaQ/tNhYgqVy99
	 I+ZUJ7NOY6b46daM4P+a7BgUPdz15a0SIaPUOVA8GxiIA/3x6a+W0FUwIzkfrcBSDmhBn
	 BzJQ3W4JJ1wuHVInRAxBskyt6VHv0m/sX2ABOvbQ34xMRXlXkncM2ESFUruC4rQDmsvyq
	 ALRNpD1+13RCuRHwJmU6MJMBkgVPCb7o/jNTmqqh7E6/kItfapH10sJZCzs/++AkiUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bCbsBFyz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7EAE606A320
	for <fsverity@lists.linux.dev>; Fri, 20 Nov 2026 16:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bCbsBFyz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC94E1F000C6;
	Fri, 20 Nov 2026 16:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795192023;
	bh=wkRo6jzXBlSCS1zbm0MHD3mklwY8Bb6Xai0u0PP9Cvo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bCbsBFyzKlvb4Nzy7UPpX7NLssvvbnsP+OFg6sq176F8FF9mhaiUuc8I1+4nXrG77
	 jKNvh5KF6eaiwEb3L/BkjS9GVPIDjPsOGkxmLCRq1wyqptAdjbJ02STGbFj23NsRrm
	 bRVSMXu76mX+PWR8FKbjdNTl8pGO1cys2TPYLURKakWPWDp9zLg/8ypwRULbTxQVrL
	 UiSouA5jcRfEfKDeq7/LvONq6GDa7YHYchH7+SqAl2EXuvJ7qK5wCbZb97flSwlt0F
	 paaIOnU0wig17+VX0EZJ8YoQ398z/8f0tio3NHxHxPZrPVFg6i7LI6fdcDpI7NVU+n
	 TP25KaB8xALlQ==
Message-ID: <sashiko-outbox-225565@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v19 05/15] xfs: handle fsverity I/O in write/read path
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andrey Albershteyn" <aalbersh@kernel.org>, "Eric Biggers" <ebiggers@kernel.org>, "Christoph
 Hellwig" <hch@lst.de>, "Carlos Maiolino" <cem@kernel.org>, fsverity <fsverity@lists.linux.dev>
Cc: david@fromorbit.com
In-Reply-To: <20261120155752.192025-6-aalbersh@kernel.org>
References: <20261120155752.192025-1-aalbersh@kernel.org>
 <20261120155752.192025-6-aalbersh@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 16:27:02 +0000
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
- [High] xfs: undeclared fsverity_is_building() breaks build in
  xfs_iomap.c
- [High] xfs: post-EOF fsverity folios skipped in writeback due to
  missing flag
--

commit bdb3069c02095cd61adc7db45f468d33efe53e6b
Author: Andrey Albershteyn <aalbersh@kernel.org>

xfs: handle fsverity I/O in write/read path

This commit adds xfs_fsverity_metadata_offset() and passes the I/O offset
to xfs_bmbt_to_iomap() so IOMAP_F_FSVERITY is set on mappings covering
fs-verity metadata past EOF.

> diff --git a/fs/xfs/xfs_aops.c b/fs/xfs/xfs_aops.c
> index 1db6f3640c53b..b9728997f944a 100644
> --- a/fs/xfs/xfs_aops.c
> +++ b/fs/xfs/xfs_aops.c
> @@ -23,6 +23,7 @@
>  #include "xfs_ioend.h"
>  #include "xfs_zone_alloc.h"
>  #include "xfs_rtgroup.h"
> +#include "xfs_verity.h"
> =20
>  struct xfs_writepage_ctx {
>  	struct iomap_writepage_ctx ctx;
> @@ -265,7 +266,8 @@ xfs_map_blocks(
>  	    isnullstartblock(imap.br_startblock))
>  		goto allocate_blocks;
> =20
> -	xfs_bmbt_to_iomap(ip, &wpc->iomap, &imap, 0, 0, XFS_WPC(wpc)->data_seq);
> +	xfs_bmbt_to_iomap(ip, &wpc->iomap, &imap, offset, 0, 0,
> +			  XFS_WPC(wpc)->data_seq);
>  	trace_xfs_map_blocks_found(ip, offset, count, whichfork, &imap);
>  	return 0;
>  allocate_blocks:
> @@ -441,7 +443,7 @@ xfs_zoned_map_blocks(
>  		imap.br_startblock =3D HOLESTARTBLOCK;
>  		imap.br_state =3D XFS_EXT_NORM;
>  		xfs_iunlock(ip, XFS_ILOCK_EXCL);
> -		xfs_bmbt_to_iomap(ip, &wpc->iomap, &imap, 0, 0, 0);
> +		xfs_bmbt_to_iomap(ip, &wpc->iomap, &imap, offset, 0, 0, 0);
>  		return 0;
>  	}
>  	end_fsb =3D min(end_fsb, imap.br_startoff + imap.br_blockcount);

[Severity: High]
Will iomap_writeback_folio() skip dirty fs-verity metadata folios before
xfs_map_blocks() can set IOMAP_F_FSVERITY?

xfs_vm_writepages() zero-initializes wpc.ctx.iomap.flags (and
xc.ctx.iomap.flags on zoned filesystems), and iomap_writeback_folio()
calls iomap_writeback_handle_eof() before ->writeback_range() invokes
xfs_map_blocks().  When a dirty fs-verity folio past i_size is reached,
wpc->iomap.flags still lacks IOMAP_F_FSVERITY, so
iomap_writeback_handle_eof() returns false and the folio is skipped with
its dirty bit cleared and its delalloc extent unconverted.

Also, in xfs_zoned_map_blocks(), the non-hole path calls
xfs_iomap_set_anon_write(), which overwrites wpc->iomap.flags with
IOMAP_F_ANON_WRITE | IOMAP_F_DIRTY and drops IOMAP_F_FSVERITY.

> diff --git a/fs/xfs/xfs_iomap.c b/fs/xfs/xfs_iomap.c
> index 50eae7ff61453..5117704530f69 100644
> --- a/fs/xfs/xfs_iomap.c
> +++ b/fs/xfs/xfs_iomap.c
> @@ -32,6 +32,8 @@
>  #include "xfs_rtbitmap.h"
>  #include "xfs_icache.h"
>  #include "xfs_zone_alloc.h"
> +#include "xfs_verity.h"
> +#include <linux/fsverity.h>
> =20
>  #define XFS_ALLOC_ALIGN(mp, off) \
>  	(((off) >> mp->m_allocsize_log) << mp->m_allocsize_log)
> @@ -54,6 +56,15 @@ xfs_alert_fsblock_zero(
>  	return -EFSCORRUPTED;
>  }
> =20
> +static bool
> +xfs_iomap_is_fsverity_metadata(
> +	struct xfs_inode	*ip,
> +	loff_t			offset)
> +{
> +	return offset >=3D xfs_fsverity_metadata_offset(ip) &&
> +	       (fsverity_is_building(VFS_I(ip)) || fsverity_active(VFS_I(ip)));
> +}

[Severity: High]
Does calling fsverity_is_building() here break the build?  Neither
linux/fsverity.h nor xfs_verity.h declares or defines
fsverity_is_building(), so compiling fs/xfs/xfs_iomap.c fails with an
implicit function declaration error.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120155752.1920=
25-1-aalbersh@kernel.org?part=3D5
