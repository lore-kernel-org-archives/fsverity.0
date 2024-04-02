Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B8BA131751
	for <fsverity@lists.linux.dev>; Tue,  2 Apr 2024 15:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712072532; cv=none; b=IJyE87MCQ5y4tArg+mUj12ibDtNXX6DAcfpaIlfpRf72DebD94oXEXgTaGdZbHNYcnuMHW47yhfZncs0aWEl8ip/+q2IOOvozLjy1SJKTgtcxQyOjuFZLcEYkj8dZAXq71P8rGTMbI6d23Fzs7gwLiT+vNuz8tWsI7audXWzm6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712072532; c=relaxed/simple;
	bh=IOMwyl/RlCQmuZPdZbebox/pMJPz1qwO9Fe/PD0INNk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=ioJtzgPobQC4vAoyI5nNLdr1aruBpOflsxPlwfGznZWZOM4SWauaNDi08CTWrW/4Ab5oG+f769TNPxF4nktymNQoI+Kj4FXxpH2l96zqAft1+/yxPoxFN6GxdGoJ7MQ3Y/G6PFNSOrkI0QcnbvSlZMc65emDq1HH1jdjCu4DLS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VDVDF/jA; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VDVDF/jA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712072529;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Vo4KXHnHT1kRb4VWXMSvY0WyUHSYdFU/l/w7yaKXDrE=;
	b=VDVDF/jAeya7UNE5nedS09mrRKQnTQJtwWoEIS8iY0bgqD1NIELBHV0JKCkytwf9fplfkb
	+Lri6SBTsTv7SECduQLU/FKtWChNmcLXd+mPeStTZBvoiwzwlgRWN4w//a1Njv3p93Ghyv
	BmPEQ0oK6m2CRCfnQSHWs9ZQb4VCZNI=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-501-BlKeUucnOCezRx-mchMQLg-1; Tue, 02 Apr 2024 11:42:07 -0400
X-MC-Unique: BlKeUucnOCezRx-mchMQLg-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-5684c1abc7fso2492376a12.3
        for <fsverity@lists.linux.dev>; Tue, 02 Apr 2024 08:42:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712072526; x=1712677326;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vo4KXHnHT1kRb4VWXMSvY0WyUHSYdFU/l/w7yaKXDrE=;
        b=CFt5dRFoefUhf36Z2hrnQQ7kaCDndwTZ37dJjfpu5UeAW0UP6mA5GKlLQlCFgfBJdW
         BBgs1SJHB4JqtOelCoz9mHi6Ev2KeHSrvuLCDZUnDGTEXb3a6Vp3GWxOEFlN+nQFAGiF
         4tAs8StGi3btXSknI8wzHLv+zglfM6G+EsCvUednr9IxnDVw/uo9J+0fkHMLCeq+uL1x
         oxDSbEo0/MjzwhSiz/L4Xw8B7Luzk9a0eQ2Vf0BARkRa86Omtss0AyuqbkDj53PDabns
         K940CMSVGG7pDvO5Lh2TBIavcE5EOdUJCZvDt0PuAbrwrGz5WE9ZXXpzhXB6yLPT6owG
         gdPA==
X-Forwarded-Encrypted: i=1; AJvYcCWdwY/J5seSSfzbj9r2/uVGsxdD2YN6UREsy6xvE10yLZU6lc44oLK532+4c6QdKsr98ajyFGao7APPjpY7M2yLoJjb2+4XAEI=
X-Gm-Message-State: AOJu0Yx9nhewziQoAjbYAcJrXjyM2RhNKJfoYia9rzsR1nAdd2S8vAUq
	dk1rSCofbICCmGLr12OUQJ7/A+DYU2q25VnXRMLea9f/eXGN0b96X5gxEefMxH+xrqaDsIIV+iD
	bsABUsrEdN0b4noSm13YbjAZvHr+neNyKpHYgnjQpaz+5ZpE3s+6r1vA=
X-Received: by 2002:a05:6402:4406:b0:56d:f7ce:e879 with SMTP id y6-20020a056402440600b0056df7cee879mr938358eda.37.1712072526377;
        Tue, 02 Apr 2024 08:42:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH7aAEJW4XWvHbT55Usj/Gd7Y4zWuDJoOPWluU6ci0bU43MAk3Fvh9dqfeJxqYZcKsMvZRGzA==
X-Received: by 2002:a05:6402:4406:b0:56d:f7ce:e879 with SMTP id y6-20020a056402440600b0056df7cee879mr938329eda.37.1712072525629;
        Tue, 02 Apr 2024 08:42:05 -0700 (PDT)
Received: from thinky ([109.183.6.197])
        by smtp.gmail.com with ESMTPSA id x7-20020aa7cd87000000b0056dd19e3296sm2900699edv.30.2024.04.02.08.42.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 08:42:05 -0700 (PDT)
Date: Tue, 2 Apr 2024 17:42:04 +0200
From: Andrey Albershteyn <aalbersh@redhat.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: ebiggers@kernel.org, linux-xfs@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, fsverity@lists.linux.dev
Subject: Re: [PATCH 24/29] xfs: teach online repair to evaluate fsverity
 xattrs
Message-ID: <6fd77dqwbfmbaqwqori6jffpg2czfe23qmqrvzducti33a4vvi@7lut4a6qhsmt>
References: <171175868489.1988170.9803938936906955260.stgit@frogsfrogsfrogs>
 <171175868956.1988170.10162640337320302727.stgit@frogsfrogsfrogs>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <171175868956.1988170.10162640337320302727.stgit@frogsfrogsfrogs>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2024-03-29 17:42:19, Darrick J. Wong wrote:
> From: Darrick J. Wong <djwong@kernel.org>
> 
> Teach online repair to check for unused fsverity metadata and purge it
> on reconstruction.
> 
> Signed-off-by: Darrick J. Wong <djwong@kernel.org>
> ---
>  fs/xfs/scrub/attr.c        |  139 ++++++++++++++++++++++++++++++++++++++++++++
>  fs/xfs/scrub/attr.h        |    6 ++
>  fs/xfs/scrub/attr_repair.c |   50 ++++++++++++++++
>  fs/xfs/scrub/trace.c       |    1 
>  fs/xfs/scrub/trace.h       |   31 ++++++++++
>  5 files changed, 226 insertions(+), 1 deletion(-)
> 
> 
> diff --git a/fs/xfs/scrub/attr.c b/fs/xfs/scrub/attr.c
> index 2e8a2b2e82fbd..be121625c14f0 100644
> --- a/fs/xfs/scrub/attr.c
> +++ b/fs/xfs/scrub/attr.c
> @@ -18,6 +18,7 @@
>  #include "xfs_attr_leaf.h"
>  #include "xfs_attr_sf.h"
>  #include "xfs_parent.h"
> +#include "xfs_verity.h"
>  #include "scrub/scrub.h"
>  #include "scrub/common.h"
>  #include "scrub/dabtree.h"
> @@ -25,6 +26,8 @@
>  #include "scrub/listxattr.h"
>  #include "scrub/repair.h"
>  
> +#include <linux/fsverity.h>
> +
>  /* Free the buffers linked from the xattr buffer. */
>  static void
>  xchk_xattr_buf_cleanup(
> @@ -126,6 +129,53 @@ xchk_setup_xattr_buf(
>  	return 0;
>  }
>  
> +#ifdef CONFIG_FS_VERITY
> +/*
> + * Obtain merkle tree geometry information for a verity file so that we can
> + * perform sanity checks of the fsverity xattrs.
> + */
> +STATIC int
> +xchk_xattr_setup_verity(
> +	struct xfs_scrub	*sc)
> +{
> +	struct xchk_xattr_buf	*ab;
> +	int			error;
> +
> +	/*
> +	 * Drop the ILOCK and the transaction because loading the fsverity
> +	 * metadata will call into the xattr code.  S_VERITY is enabled with
> +	 * IOLOCK_EXCL held, so it should not change here.
> +	 */
> +	xchk_iunlock(sc, XFS_ILOCK_EXCL);
> +	xchk_trans_cancel(sc);
> +
> +	error = xchk_setup_xattr_buf(sc, 0);
> +	if (error)
> +		return error;
> +
> +	ab = sc->buf;
> +	error = fsverity_merkle_tree_geometry(VFS_I(sc->ip),
> +			&ab->merkle_blocksize, &ab->merkle_tree_size);
> +	if (error == -ENODATA || error == -EFSCORRUPTED) {
> +		/* fsverity metadata corrupt, cannot complete checks */
> +		xchk_set_incomplete(sc);
> +		ab->merkle_blocksize = 0;
> +		error = 0;
> +	}
> +	if (error)
> +		return error;
> +
> +	error = xchk_trans_alloc(sc, 0);
> +	if (error)
> +		return error;
> +
> +	xchk_ilock(sc, XFS_ILOCK_EXCL);
> +	return 0;
> +}
> +#else
> +# define xchk_xattr_setup_verity(...)	(0)
> +#endif /* CONFIG_FS_VERITY */
> +
>  /* Set us up to scrub an inode's extended attributes. */
>  int
>  xchk_setup_xattr(
> @@ -150,9 +200,89 @@ xchk_setup_xattr(
>  			return error;
>  	}
>  
> -	return xchk_setup_inode_contents(sc, 0);
> +	error = xchk_setup_inode_contents(sc, 0);
> +	if (error)
> +		return error;
> +
> +	if (IS_VERITY(VFS_I(sc->ip))) {
> +		error = xchk_xattr_setup_verity(sc);
> +		if (error)
> +			return error;
> +	}
> +
> +	return error;
>  }
>  
> +#ifdef CONFIG_FS_VERITY
> +/* Check the merkle tree xattrs. */
> +STATIC void
> +xchk_xattr_verity(
> +	struct xfs_scrub		*sc,
> +	xfs_dablk_t			blkno,
> +	const unsigned char		*name,
> +	unsigned int			namelen,
> +	unsigned int			valuelen)
> +{
> +	struct xchk_xattr_buf		*ab = sc->buf;
> +
> +	/* Non-verity filesystems should never have verity xattrs. */
> +	if (!xfs_has_verity(sc->mp)) {
> +		xchk_fblock_set_corrupt(sc, XFS_ATTR_FORK, blkno);
> +		return;
> +	}
> +
> +	/*
> +	 * Any verity metadata on a non-verity file are leftovers from a
> +	 * previous attempt to enable verity.
> +	 */
> +	if (!IS_VERITY(VFS_I(sc->ip))) {
> +		xchk_ino_set_preen(sc, sc->ip->i_ino);
> +		return;
> +	}
> +
> +	/* Zero blocksize occurs if we couldn't load the merkle tree data. */
> +	if (ab->merkle_blocksize == 0)
> +		return;
> +
> +	switch (namelen) {
> +	case sizeof(struct xfs_merkle_key):
> +		/* Oversized blocks are not allowed */
> +		if (valuelen > ab->merkle_blocksize) {
> +			xchk_fblock_set_corrupt(sc, XFS_ATTR_FORK, blkno);
> +			return;
> +		}
> +		break;
> +	case XFS_VERITY_DESCRIPTOR_NAME_LEN:
> +		/* Has to match the descriptor xattr name */
> +		if (memcmp(name, XFS_VERITY_DESCRIPTOR_NAME, namelen))
> +			xchk_fblock_set_corrupt(sc, XFS_ATTR_FORK, blkno);
> +		return;
> +	default:
> +		xchk_fblock_set_corrupt(sc, XFS_ATTR_FORK, blkno);
> +		return;
> +	}
> +
> +	/*
> +	 * Merkle tree blocks beyond the end of the tree are leftovers from
> +	 * a previous failed attempt to enable verity.
> +	 */
> +	if (xfs_merkle_key_from_disk(name, namelen) >= ab->merkle_tree_size)
> +		xchk_ino_set_preen(sc, sc->ip->i_ino);

The other case which probably can be detected is if we start
removing the tree and it gets interrupted (starting blocks missing).
This can be checked by iterating over the xattrs names up to
->merkle_tree_size. But I'm not sure if online repair can store
state over xattrs validation.

Also, only pair of valid descriptor and valid tree is something of
use, but I'm not sure if all of this is in scope of online repair.

Otherwise, looks good to me:
Reviewed-by: Andrey Albershteyn <aalbersh@redhat.com>

-- 
- Andrey

