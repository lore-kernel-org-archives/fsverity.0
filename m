Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E45C1C5D72
	for <fsverity@lists.linux.dev>; Mon, 26 Jan 2026 04:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769401995; cv=none; b=NtWO05ZSiHEbLQc7uKbM3N0zXb81qz13j/4VJEOnFjU+gosy3r7+/iEVKNg1TOxTzed0mm+9DN/Vye6TMLXIeCuF6vDtuX0XGlsHRcGU8JRnk81YuJcN0CWRrRnc51ln4JTWnTWJTOz2ZptndZjD/deuyM9HSyZ2/y+oArH2Xfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769401995; c=relaxed/simple;
	bh=RE7ir2TtXqgklqUp7zQMs3F6Y48rSvyMCBqXJ+NJjOo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gj2V+zT2f7iFxqUv/IfTcTOcrc3+RzvqLrCIpdwyjOci1tU2HJyclmX4ZlTiL5YRYR7JA9vpQDSj/KMJdr628PO7gMpFhpHh2Llz0hLQMKwSQNmJfK6tl6hXPdrVbx70/wVr8zU6FkHCvNbP2K2QwAxpUG5aGd0k62fB5SyoFmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id D3E6F227A88; Mon, 26 Jan 2026 05:33:11 +0100 (CET)
Date: Mon, 26 Jan 2026 05:33:11 +0100
From: Christoph Hellwig <hch@lst.de>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, Al Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	David Sterba <dsterba@suse.com>, Theodore Ts'o <tytso@mit.edu>,
	Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
	Andrey Albershteyn <aalbersh@redhat.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	linux-fsdevel@vger.kernel.org, linux-btrfs@vger.kernel.org,
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	fsverity@lists.linux.dev
Subject: Re: [PATCH 06/11] fsverity: push out fsverity_info lookup
Message-ID: <20260126043311.GC30803@lst.de>
References: <20260122082214.452153-1-hch@lst.de> <20260122082214.452153-7-hch@lst.de> <20260124211956.GF2762@quark>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260124211956.GF2762@quark>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Sat, Jan 24, 2026 at 01:19:56PM -0800, Eric Biggers wrote:
> This patch introduces another bisection hazard by adding calls to
> fsverity_info_addr() when CONFIG_FS_VERITY=n.  fsverity_info_addr() has
> a definition only when CONFIG_FS_VERITY=y.
> 
> Maybe temporarily add a CONFIG_FS_VERITY=n stub for fsverity_info_addr()
> that returns NULL, and also ensure that it's dereferenced only when it's
> known that fsverity verification is needed.  Most of the call sites look
> okay, but the second one in ext4_mpage_readpages() needs to be fixed.

I've added an external declaration for fsverity_info_addr in the
CONFIG_FS_VERITY=n so that the linker catches unguarded references.  It 
caught two, which I fixed by adding IS_ENABLED checks that also reduce
the code size for non-fsverity builds.

> > -	fsverity_init_verification_context(&ctx, inode);
> > +	fsverity_init_verification_context(&ctx, inode, vi);
> 
> Note that fsverity_info has a back-pointer to the inode.  So,
> fsverity_init_verification_context() could just take the vi and set
> ctx->inode to vi->inode.
> 
> Then it wouldn't be necessary to get the inode from
> bio_first_folio_all(bio)->mapping->host (in fsverity_verify_bio()) or
> folio->mapping->host (in fsverity_verify_blocks()).
> Similarly in fsverity_readahead() too.
> 
> (It might make sense to handle this part as a separate patch.)

To be able to nicely used this vi->inode needs to lose the const
qualifier.  I've done that, and also added a const qualifiers
to ctx->vi while at it in prep patches.  With that just using
vi->inode in this patch is easy enough.

