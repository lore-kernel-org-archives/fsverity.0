Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09DDC4825B7
	for <fsverity@lists.linux.dev>; Tue, 22 Sep 2026 08:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790066019; cv=none; b=N9HXSH2y9XLROs+VGqEULi4L7M6P5MXDSFNBqyqBwYc8TP61BXAfflgETWqDGmVEpcGhbwxa+L39AwrpfjR6+g2l4aGOlNzEcoHU7Xm8v5qQqKqJ0texT9eUHyGppCFhKpeaYRv+jDAMV6zMfxy46vV3Ze8X1cTGTH/oI6lHCH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790066019; c=relaxed/simple;
	bh=zFEi4lXytmrVbgQRpPsKAIkx1xEMbo5uCPAVt3YHyCs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=TfQtC5nXxc+JFTGWSuBJC2R/DLWbqfKQC0pFv8xV4VJXmwjLVDRPhb18bHPij1P/2+Xn2SMMC/cSNUci2VHxwnHCXeJDnrr4SJ21Gej4uML1nIhIy8jh4JiN7bCUv2g2ilu70lsrf1scO3KWjNQlQjP6DtTxSUT+ph+n6QfWOz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VTOTiEQI; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VTOTiEQI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790066006;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=w4z5ytHAoQC8UWkOcT2zO26c7SVy/93HRcvFS003K4I=;
	b=VTOTiEQIl91Y6dYxZdf1v2iib8zKxLzjB3IZHRTN/8u1rNeymVxep4Oj/oZHQUvhv9KpdX
	fFyZNAN7kdl4sxYrsUTNYy5Gby/73eCAmDrlBFgnE9H+RKfp29ZG7PSaKasouWYsezS2DM
	dIAK6YXVaJ40hrMDorzora4Cee1HY04=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-453-_VMRwN-bOs27QnBux5aUUg-1; Tue, 22 Sep 2026 04:33:25 -0400
X-MC-Unique: _VMRwN-bOs27QnBux5aUUg-1
X-Mimecast-MFC-AGG-ID: _VMRwN-bOs27QnBux5aUUg_1790066004
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-49e65f2f1baso44066155e9.3
        for <fsverity@lists.linux.dev>; Tue, 22 Sep 2026 01:33:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790066004; x=1790670804;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w4z5ytHAoQC8UWkOcT2zO26c7SVy/93HRcvFS003K4I=;
        b=KpaB7kMiEHz18YBlo1+KsEkvYR/5BvjxzdwyLsPl/Wd3QkCLasdsgGt0iEke00kBjD
         Y6mnOFt/ByLslAA5oTpwY1dAERQRJp6srFykb54LHN65KOGWpf5SMNXot83e0YiIkz8N
         EiAtATWvIqcqzXg/+iRFL/yMjrn476YQuQUaOoKqlI89/XnA5ybFPF7aTYssuIG7Ujip
         bkJDl2tQfn37x2wSvHe9+SvDWF7tSYS44R0XFY7TAwV/SlcYBbzPME7Ie/VXfe5d7+MW
         LZTVa6i9ws/XyW8LZbFxNaLLySODBCQZYFTzkVtWwdnrr/+RzdWqOhz/SyhNwIc0A/lQ
         7rcw==
X-Forwarded-Encrypted: i=1; AKwUvBwAXXbdG8S40UvcKk2bDC/8shfDLgYTeZ3QkEkCi3C1zuE5eQF/DUMPyOn6HgfhblQZ14UN36VIFw==@lists.linux.dev
X-Gm-Message-State: AFuF++n/codCBZB0cwuXulABV2vJvpxKw1Qf11dg+DfNjJGd738fJMje
	cNAdLPvWBTgJbihsBkuMKLzLgq7MdtY7GEJ+lFaEcpNqiVQQ3BObeA81Q8osxS8bDGRVFh9yVBS
	HQtGnEUxWlkdfcdwuELdg4CqHkRz4ns2iYXGXAgW7E2WeKqQ3Dj/F1oD8eoQ=
X-Gm-Gg: AYBFou3gAbBk92yn4Eqp6WvPEheirBaCPa6XpchiLwj9vyJR7Fj3q2QmAtyR+EcP/7M
	oR+vXnvN/jJQzdCzDTmyjVEg3zqqFL/hExjHrpjRN0srVMNh9OfC9ajPIehOo4TqLKE0N+RpxZy
	BWL2j+S5K15BSo/eeZ2Cpp8T10aqZHRe8b6czG2UO6KRUAHoLg6zirXf0zDWhyX5rGSu5+8XISa
	LD/f+YVzS4v5sk6g0gtUI5TAQCn6C2SNOmF/ItSU+DvI1YIxXdjGXDr6WhyypKJ3feIVPkOJRf0
	9QoYkBYOjAtWpUTUgJ4L7S0BNEjmRC9doHFEKYzJguobAypyIXdgU3aqKqEnwLBq225T0n4SLtD
	1K2XOTbFVXj7ECOwv05bIGjMPBSum7+r/lg==
X-Received: by 2002:a05:600c:a42:b0:49e:6683:d23c with SMTP id 5b1f17b1804b1-49fc5594deemr183435055e9.0.1790066004107;
        Tue, 22 Sep 2026 01:33:24 -0700 (PDT)
X-Received: by 2002:a05:600c:a42:b0:49e:6683:d23c with SMTP id 5b1f17b1804b1-49fc5594deemr183434735e9.0.1790066003664;
        Tue, 22 Sep 2026 01:33:23 -0700 (PDT)
Received: from aalbersh-thinkpadx1carbongen13.rmtcz.csb ([217.30.74.39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fdab8ae6dsm74097995e9.0.2026.09.22.01.33.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 01:33:23 -0700 (PDT)
Date: Tue, 22 Sep 2026 10:33:22 +0200
From: Andrey Albershteyn <aalbersh@redhat.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: Andrey Albershteyn <aalbersh@kernel.org>, ebiggers@kernel.org, 
	hch@lst.de, Carlos Maiolino <cem@kernel.org>, fsverity@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, linux-xfs@vger.kernel.org, linux-unionfs@vger.kernel.org, 
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
	linux-btrfs@vger.kernel.org, david@fromorbit.com
Subject: Re: [PATCH v16 14/21] xfs: don't remove written extents past EOF on
 fsverity inodes
Message-ID: <arI9MpRVBZ0UEofK@aalbersh-thinkpadx1carbongen13.rmtcz.csb>
References: <20260918111539.1003439-1-aalbersh@kernel.org>
 <20260918111539.1003439-15-aalbersh@kernel.org>
 <20260922043750.GN2705364@frogsfrogsfrogs>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260922043750.GN2705364@frogsfrogsfrogs>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ug38lyW-AItszQJBEwbjOFhoIlMd5elLxEmjgBzmE9U_1790066004
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2026-09-21 21:37:50, Darrick J. Wong wrote:
> On Fri, Sep 18, 2026 at 01:15:26PM +0200, Andrey Albershteyn wrote:
> > xfs_free_eofblocks() removes all extents past EOF unless the
> > XFS_DIFLAG_PREALLOC or XFS_DIFLAG_APPEND flags are set. This is
> > undesired for fsverity as it stores metadata beyond EOF. However, while
> > merkle tree is being built, delayed preallocation and unwritten extents
> > are used. After metadata construction is done, fsverity inodes becomes
> > read-only and won't be changed anymore, none of these unwritten extents
> > or preallocations in post EOF region will be used.
> > 
> > Let xfs_free_eofblocks() be called on fsverity inode as usual to remove
> > anything which is not written extent. However, inodes which are
> > undergoing merkle tree construction need to be skipped in case reclaim
> > takes place.
> > 
> > Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org>
> > ---
> >  fs/xfs/xfs_bmap_util.c | 25 ++++++++++++++++++++++---
> >  1 file changed, 22 insertions(+), 3 deletions(-)
> > 
> > diff --git a/fs/xfs/xfs_bmap_util.c b/fs/xfs/xfs_bmap_util.c
> > index 268d159339d0..7fd951992557 100644
> > --- a/fs/xfs/xfs_bmap_util.c
> > +++ b/fs/xfs/xfs_bmap_util.c
> > @@ -31,6 +31,7 @@
> >  #include "xfs_rtbitmap.h"
> >  #include "xfs_rtgroup.h"
> >  #include "xfs_zone_alloc.h"
> > +#include <linux/fsverity.h>
> >  
> >  /* Kernel only BMAP related definitions and functions */
> >  
> > @@ -553,6 +554,13 @@ xfs_can_free_eofblocks(
> >  	if (last_fsb <= end_fsb)
> >  		return false;
> >  
> > +	/*
> > +	 * Don't clean fsverity inodes which have merkle tree being built, the
> > +	 * merkle tree is written beyond EOF
> > +	 */
> > +	if (xfs_iflags_test(ip, XFS_VERITY_CONSTRUCTION))
> > +		return false;
> > +
> >  	/*
> >  	 * Check if there is an post-EOF extent to free.  If there are any
> >  	 * delalloc blocks attached to the inode (data fork delalloc
> > @@ -579,6 +587,9 @@ xfs_free_eofblocks(
> >  	struct xfs_trans	*tp;
> >  	struct xfs_mount	*mp = ip->i_mount;
> >  	int			error;
> > +	int			bmapi_flags = XFS_BMAPI_NODISCARD;
> > +	bool			has_verity =
> > +			ip->i_diflags2 & XFS_DIFLAG2_VERITY;
> >  
> >  	/* Attach the dquots to the inode up front. */
> >  	error = xfs_qm_dqattach(ip);
> > @@ -593,15 +604,20 @@ xfs_free_eofblocks(
> >  	 *
> >  	 * Note that this means we also leave speculative preallocations in
> >  	 * place for preallocated files.
> > +	 *
> > +	 * Clean up delalloc reservations for fsverity too as those won't be
> > +	 * used
> >  	 */
> > -	if (ip->i_diflags & (XFS_DIFLAG_PREALLOC | XFS_DIFLAG_APPEND)) {
> > +	if (ip->i_diflags & (XFS_DIFLAG_PREALLOC | XFS_DIFLAG_APPEND) ||
> > +			has_verity) {
> >  		if (ip->i_delayed_blks) {
> >  			xfs_bmap_punch_delalloc_range(ip, XFS_DATA_FORK,
> >  				round_up(XFS_ISIZE(ip), mp->m_sb.sb_blocksize),
> >  				LLONG_MAX, NULL);
> >  		}
> >  		xfs_inode_clear_eofblocks_tag(ip);
> > -		return 0;
> > +		if (!has_verity)
> > +			return 0;
> >  	}
> >  
> >  	error = xfs_trans_alloc(mp, &M_RES(mp)->tr_itruncate, 0, 0, 0, &tp);
> > @@ -613,6 +629,9 @@ xfs_free_eofblocks(
> >  	xfs_ilock(ip, XFS_ILOCK_EXCL);
> >  	xfs_trans_ijoin(tp, ip, 0);
> >  
> > +	if (has_verity)
> > +		bmapi_flags |= XFS_BMAPI_UNWRITTEN;
> 
> This ought to have a comment explaining where post-eof unwritten extents
> might come from:
> 
> 	/*
> 	 * If fs-verity fails to write the full metadata, it can leave
> 	 * unwritten preallocations after EOF.  Clear all that out.
> 	 */
> 	if (has_verity)
> 		bmapi_flags |= XFS_BMAPI_UNWRITTEN;
> 
> 
> With that documented,
> Reviewed-by: "Darrick J. Wong" <djwong@kernel.org>

Sure, I will add the comment
Thanks!

-- 
- Andrey

