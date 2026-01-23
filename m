Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE98D1F419F
	for <fsverity@lists.linux.dev>; Fri, 23 Jan 2026 05:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769145524; cv=none; b=h89CKDIB817mO75k2cnWfZbQLFnzg0CY+Itv+IlVB2BGgBH/TO+vHr+Fc0S93yElEmyrxRW5klRiCIAahTYrMEgj1NkWW1pEr8IeaLqxEon4G3+FNSadKkPOZ/ajBiqELep24jkdDK5m6A8uF9fdKsah51KxxJDopMTB2dF1Bvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769145524; c=relaxed/simple;
	bh=utRuWXi2BFH/GlT4amXhsrjsG1YSbK+N6GLLW3J/48Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iEJM+Q46kbnJwIrRWnZo8DW4f1Rv9po8pGUZjlAqt1CK4Yu7qEYGh+zbwo++Ipq3WCDF7JvoSS1NWT2PQQrbjZt95NjWBRAFP3UnD1azYzKGdF9D80Fc7Tm8t5Mla895eMTdNrrBlgQ1WqV9VW1Bwm51UFRDz03Czzm0Ea8tDo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 56C74227AAE; Fri, 23 Jan 2026 06:18:36 +0100 (CET)
Date: Fri, 23 Jan 2026 06:18:36 +0100
From: Christoph Hellwig <hch@lst.de>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, Eric Biggers <ebiggers@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	David Sterba <dsterba@suse.com>, Theodore Ts'o <tytso@mit.edu>,
	Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
	Andrey Albershteyn <aalbersh@redhat.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	linux-fsdevel@vger.kernel.org, linux-btrfs@vger.kernel.org,
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	fsverity@lists.linux.dev
Subject: Re: [PATCH 08/11] ext4: consolidate fsverity_info lookup
Message-ID: <20260123051836.GD24123@lst.de>
References: <20260122082214.452153-1-hch@lst.de> <20260122082214.452153-9-hch@lst.de> <20260122215457.GH5910@frogsfrogsfrogs>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260122215457.GH5910@frogsfrogsfrogs>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Thu, Jan 22, 2026 at 01:54:57PM -0800, Darrick J. Wong wrote:
> > +			if (folio->index <
> > +			    DIV_ROUND_UP(inode->i_size, PAGE_SIZE))
> 
> I keep seeing this predicate, maybe it should go into fsverity.h as a
> helper function with the comment about mmap that I was muttering about
> in the previous patch?

Right now it is not generic.  Nothing in the generic fsverity code
known about the offset, ext4 and f2fs just happened to chose the
same constant (and the ext4 one leak to buffer.c), while btrfs stores
the verity hashed totally differently.  I hope the xfs works ends up
with a consolidated way of doing this, at which point such a helper
would be useful.

> Or maybe a "get verity info for given folio index" helper?

How would that make sense?

> /*
>  * Grab the fsverity context needed to verify the contents of the folio.
>  *
>  * <Big fat comment from before, about mmap and whatnot>
>  */
> static inline struct fsverity_info *vi
> fsverity_folio_info(const struct folio *folio)
> {
> 	struct inode *inode = folio->mapping->host;
> 
> 	if (folio->index < DIV_ROUND_UP(inode->i_size, PAGE_SIZE))
> 		return fsverity_get_info(inode);
> 	return NULL;
> }

Tthe offset right now is entirely file system specific,
so we can't do this.  Maybe that'll change with further consolidation.

