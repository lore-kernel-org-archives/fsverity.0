Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.95.11.211
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795221170;
	b=eJ3UHmNwGa2Wux9pc0G+yvW3ph5FHNO8KYm5lW5y2mDIOHJ0tl5Y82up1f/yFnIDFyTg
	 r2igbUtjK8X9Dm3Zg9u9ESxGnFWOt2OnsbGuic66xfSFzyRlNoK6x4cfFisKOzRPKJ/g3
	 SHvVI7rSS35baqDDw+wOVISA5jims7e+GvSlIezPXN+WZ1Be0WFY14L6savHqdngpUIvV
	 ByF5PPcYRjK7hnUDI3/CztOp6To7S1hui6RSa3qDNv8+uh0W/rexlt9nz3vGjvr7I0hh9
	 p8HEWNkXGRRhQY/Xu67whZOcL4cWIqut/6B9rvhsO6j0Yd9IQUiuqYFIILKs/6UIhrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795221170;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=ihfyuU32DGUjdYR5qqrDPmGGabnnWYHVfkog8RlXax4=;
	b=pjleOEb2LXr9KyboKTnmKyR2WMyQkmuRXsC8Uo/VGxAkSP7hnQTHKm3t4xr7+57D4kCi
	 1tACjS1s4mC9qEqx0u/Ag6sl8UYPt568tK/FlF2Q1YWWVrAGIyIC2kCQvOlR1dThD2WTv
	 5fs5hbJbxwg3ce2BbNX0ZGwJ9zM6b9A7ZkzH5rREk1O3EN8O59PY4EU4Q66wcL9N9zvJ/
	 WdHP/JMlezHw91JC1oQNf2F/QlKZxuq58uHoS7fXFyPjZXbXME2DFLVdGwm1348+qJvu9
	 SVVklDds3/n7bad2yrL55T7Uil26Pv/lTuS4EegSKHIzPHSRCL6YUR1kt87C0PVQ2cQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lst.de;
	spf=pass smtp.mailfrom=lst.de;
	arc=none smtp.remote-ip=213.95.11.211
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A74606A320;
	Sat, 21 Nov 2026 00:32:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50A74606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id AF9966732A; Sat, 21 Nov 2026 01:32:44 +0100 (CET)
Date: Sat, 21 Nov 2026 01:32:44 +0100
From: Christoph Hellwig <hch@lst.de>
To: sashiko-reviews@lists.linux.dev
Cc: Andrey Albershteyn <aalbersh@kernel.org>,
	Eric Biggers <ebiggers@kernel.org>, Christoph Hellwig <hch@lst.de>,
	Carlos Maiolino <cem@kernel.org>,
	fsverity <fsverity@lists.linux.dev>, david@fromorbit.com,
	"Darrick J. Wong" <djwong@kernel.org>
Subject: Re: [PATCH v19 08/15] xfs: don't remove written extents past EOF
 on fsverity inodes
Message-ID: <20261121003244.GD13395@lst.de>
References: <20261120155752.192025-1-aalbersh@kernel.org> <20261120155752.192025-9-aalbersh@kernel.org> <sashiko-outbox-225559@kernel.org>
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Post: <mailto:fsverity@lists.linux.dev>
List-Help: <mailto:fsverity+help@lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fsverity+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-225559@kernel.org>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Fri, Nov 20, 2026 at 04:21:57PM +0000, sashiko-bot@kernel.org wrote:
> >  	 *
> >  	 * Note that this means we also leave speculative preallocations in
> >  	 * place for preallocated files.
> > +	 *
> > +	 * Clean up delalloc reservations for fsverity too as those won't be
> > +	 * used
> >  	 */
> > -	if (ip->i_diflags & (XFS_DIFLAG_PREALLOC | XFS_DIFLAG_APPEND)) {
> > +	if (ip->i_diflags & (XFS_DIFLAG_PREALLOC | XFS_DIFLAG_APPEND) ||
> > +			verity) {
> >  		if (ip->i_delayed_blks) {
> >  			xfs_bmap_punch_delalloc_range(ip, XFS_DATA_FORK,
> >  				round_up(XFS_ISIZE(ip), mp->m_sb.sb_blocksize),
> >  				LLONG_MAX, NULL);
> >  		}
> >  		xfs_inode_clear_eofblocks_tag(ip);
> > -		return 0;
> > +		if (!verity)
> > +			return 0;
> >  	}
> 
> [Severity: Low]
> Should xfs_inode_clear_eofblocks_tag(ip) only be called inside the
> !verity branch here?  When verity is true, the tag is cleared before the
> extent truncation transaction runs (and cleared a second time after
> xfs_trans_commit()), leaving XFS_IEOFBLOCKS cleared if xfs_trans_alloc(),
> xfs_itruncate_extents_flags(), or xfs_trans_commit() fails.

This doesn't seem to criticial, but maybe the structure actually
is nicer if we do it that way.  I.e.:

> >  			xfs_bmap_punch_delalloc_range(ip, XFS_DATA_FORK,
> >  				round_up(XFS_ISIZE(ip), mp->m_sb.sb_blocksize),
> >  				LLONG_MAX, NULL);
> > +			verity) {

	aligned_size = round_up(XFS_ISIZE(ip), mp->m_sb.sb_blocksize);
	if (ip->i_diflags & (XFS_DIFLAG_PREALLOC | XFS_DIFLAG_APPEND)) {
  		if (ip->i_delayed_blks)
 			xfs_bmap_punch_delalloc_range(ip, XFS_DATA_FORK,
	  				aligned_size, LLONG_MAX, NULL);
 		xfs_inode_clear_eofblocks_tag(ip);
		return 0;
	}

	/* Good comment explaining all fsverity magic here */
 	if (fsverity_is_building(VFS_I(ip))) {
		if (ip->i_delayed_blks)
			xfs_bmap_punch_delalloc_range(ip, XFS_DATA_FORK,
	  				aligned_size, LLONG_MAX, NULL);
		bmapi_flags |= XFS_BMAPI_UNWRITTEN;
	}

