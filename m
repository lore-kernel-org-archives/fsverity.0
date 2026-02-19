Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6593238C16
	for <fsverity@lists.linux.dev>; Thu, 19 Feb 2026 06:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771481063; cv=none; b=TEZdlqBnC/+4JcvMjW+FYcne7r+xSNE8q1iFUvf9GSehfAK6IciUNmbFsGV0/7x0vy7QdzIe33Z0xB1OO0KIjPqcvKUfFm/yIpXETHHlS5uEpnY0+Whu1LXt3h6RlK1EoT/kKW9mYMSZjr6cgoaCeMOi53QCUJPmo5lh4qeH5tY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771481063; c=relaxed/simple;
	bh=tghFlCBFVHod7l2FgpgEuuzHopXeIrkIWJQ5bXIaWOA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZLHSsQz1WvkrkuGkveFraxMyXXBcMFdI1YfiKtRob+vxCMHK7CrvbwLukT0vCrvYoD4k0Dx4bvST+ygQ6051zbLDZPBwFUE8/bT9fG6RQorWVKTcklekm4X/Y/UA7f/YcanMn0XNq7ikHQuq234Y7sIxKmyJ8PmWQ29IwpVcQiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 5B3F968C7B; Thu, 19 Feb 2026 07:04:20 +0100 (CET)
Date: Thu, 19 Feb 2026 07:04:20 +0100
From: Christoph Hellwig <hch@lst.de>
To: Andrey Albershteyn <aalbersh@redhat.com>
Cc: Christoph Hellwig <hch@lst.de>,
	Andrey Albershteyn <aalbersh@kernel.org>, linux-xfs@vger.kernel.org,
	fsverity@lists.linux.dev, linux-fsdevel@vger.kernel.org,
	ebiggers@kernel.org, djwong@kernel.org
Subject: Re: [PATCH v3 11/35] iomap: allow filesystem to read fsverity
 metadata beyound EOF
Message-ID: <20260219060420.GC3739@lst.de>
References: <20260217231937.1183679-1-aalbersh@kernel.org> <20260217231937.1183679-12-aalbersh@kernel.org> <20260218063606.GD8600@lst.de> <hfteu6bonpv7djecbf3d6ekh56ktgcl4c2lvtjtrjfetzaq5dw@scsrvxx5rgig>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <hfteu6bonpv7djecbf3d6ekh56ktgcl4c2lvtjtrjfetzaq5dw@scsrvxx5rgig>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Wed, Feb 18, 2026 at 10:41:14AM +0100, Andrey Albershteyn wrote:
> > +		 * Handling of fsverity "holes". We hits this for two case:
> > +		 *   1. No need to go further, the hole after fsverity
> > +		 *	descriptor is the end of the fsverity metadata.
> > +		 *
> > +		 *	No ctx->vi means we are reading a folio with descriptor.
> > +		 *	XXX: what does descriptor mean here?  Also how do we
> > +		 *	even end up with this case?  I can't see how this can
> > +		 *	happe based on the caller?
> 
> fsverity descriptor. This is basically the case as for EOF folio.
> Descriptor is the end of the fsverity metadata region. If we have 1k
> fs blocks (= merkle blocks) we can have [descriptor | hole ] folio.
> As we are not limited by i_size here, iomap_block_needs_zeroing()
> won't fire to zero this hole. So, this case is to mark this tail as
> uptodate.

How do we end up in that without ctx->vi set?

> I think this could be split into two cases by checking if (poff +
> plen) cover everything to the folio end. This means that we didn't
> get the case with tree holes and descriptor in one folio.

That might be more clear.

> > +		    	if (!ctx->vi) {
> > +				iomap_set_range_uptodate(folio, poff, plen);
> > +				/*
> > +				 * XXX: why return to the caller early here?
> > +				 */
> 
> To not hit hole in the tree (which means synthesize the block). The
> fsverity_folio_zero_hash() case.

Well, I mean return early from the function and not just move on
to the next loop iteration (which based on everything else you
wrote would then terminate anyway), і.e., why is this not:

		if (!ctx->vi)
			fsverity_folio_zero_hash(folio, poff, plen, ctx->vi)
		iomap_set_range_uptodate(folio, poff, plen);
	} else if ...

?

