Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDCF236D513
	for <fsverity@lists.linux.dev>; Wed, 14 Jan 2026 06:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768373040; cv=none; b=ORXjgivGx/9sbpiE0MN36YZncNIJufw+uJBsLMf6zdlL359Bik4FyYuRUQY9BiU5Z3wquclctJRxSlBWaz147BFOTjf7LnrZEy4d17MA3d1G33q3iS5x60Vhb2zyxdehNgsgj9AxHJ181XD8koO4OwJaJ4twj9FlSi0+GTuu8js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768373040; c=relaxed/simple;
	bh=gVfsxtXPMoqElrqaq3KzMBvIa7HmILmNT8Z/tcwvqfI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HB6V5lRjIjHr2dpGD8ovcvr09FqpAB8jNVfHFyO4QAWbRnsAtUivxM3NR9ahjY1+NSoZj+BW6zDim0/k9byNKXnfnATMWSEJ181MlaIC6QmTq45d92A3Hrv6M0xR2rHefaqdcJ+WUR/JZG3JDhiSxTHuj9xwF/bn902Z7PqP+6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id ACB1D227A8E; Wed, 14 Jan 2026 07:43:50 +0100 (CET)
Date: Wed, 14 Jan 2026 07:43:50 +0100
From: Christoph Hellwig <hch@lst.de>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>,
	Andrey Albershteyn <aalbersh@redhat.com>, fsverity@lists.linux.dev,
	linux-xfs@vger.kernel.org, ebiggers@kernel.org,
	linux-fsdevel@vger.kernel.org, aalbersh@kernel.org,
	david@fromorbit.com
Subject: Re: [PATCH v2 11/22] xfs: add verity info pointer to xfs inode
Message-ID: <20260114064350.GC10876@lst.de>
References: <cover.1768229271.patch-series@thinky> <7s5yzeey3dmnqwz4wkdjp4dwz2bi33c75aiqjjglfdpeh6o656@i32x5x3xfilp> <20260112223938.GM15551@frogsfrogsfrogs> <20260113082158.GF30809@lst.de> <20260113180213.GX15551@frogsfrogsfrogs>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113180213.GX15551@frogsfrogsfrogs>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Tue, Jan 13, 2026 at 10:02:13AM -0800, Darrick J. Wong wrote:
> > Well, I suggested just making the fsverity_info a standalone object,
> > and looking it up using a rhastable based on the ino.  Eric didn't
> > seem overly existed about that, but I think it would be really helpful
> > to not bloat all the common inodes for fsverity.
> 
> Oh, right, now I remember you asking about using rhashtable to map an
> xfs_inode to a fsverity_info.  I wonder how much of a performance
> overhead that lookup (vs. the pointer deref that's used now) would have
> for loading folios into the pagecache.

If we have to do that on every folio it would suck.  But if we rework
the code to only do it once per operation it should be close to
noise.

