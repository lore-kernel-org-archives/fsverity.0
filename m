Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFBDC37880C
	for <fsverity@lists.linux.dev>; Fri, 30 Jan 2026 05:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769752545; cv=none; b=Yrpt2zTnq2oyhV+Mzbv/2I8hMW73WiB1PCqYcs0djTAG2jnE4tzOuiEng7R4rtGumbKXIrp1p6FDRpZ0hLDFwbpRKbWeXTElX8Pqw+xRfHQRjS/NVqHB0JaX/AszBKPq1nLGeHvnak0WJG7eXR0GH7k+tXshLeBPaA3W7gL2qV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769752545; c=relaxed/simple;
	bh=6JRsmjSgzYP+N5fv6QtNtCSVn+ysuKU7wLgj1IALRSI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FQBDwjnEiwuDCYjTRK30hP+TaQFONRoUhACiW+nu3gv+VagonzLeU2FTMWXsD2fqeGaYCLmJKUpCuoEnub0NL/3WlgMdpcHT4//0W2bvpwPUSZfHvmW7AbNdig5pRw2Rp6aMDiQayM158lg79G772VpHsbBlMN5RE0f3Irb9cHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 6D5F568AFE; Fri, 30 Jan 2026 06:55:41 +0100 (CET)
Date: Fri, 30 Jan 2026 06:55:41 +0100
From: Christoph Hellwig <hch@lst.de>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: Eric Biggers <ebiggers@kernel.org>, Christoph Hellwig <hch@lst.de>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	David Sterba <dsterba@suse.com>, Theodore Ts'o <tytso@mit.edu>,
	Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
	Andrey Albershteyn <aalbersh@redhat.com>,
	Matthew Wilcox <willy@infradead.org>, linux-fsdevel@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, fsverity@lists.linux.dev
Subject: Re: [PATCH 08/15] fsverity: kick off hash readahead at data I/O
 submission time
Message-ID: <20260130055541.GC622@lst.de>
References: <20260128152630.627409-1-hch@lst.de> <20260128152630.627409-9-hch@lst.de> <20260128225602.GB2024@quark> <20260128232213.GJ5900@frogsfrogsfrogs>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260128232213.GJ5900@frogsfrogsfrogs>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Wed, Jan 28, 2026 at 03:22:13PM -0800, Darrick J. Wong wrote:
> > Unfortunately, this patch causes recursive down_read() of
> > address_space::invalidate_lock.  How was this meant to work?
> 
> Usually the filesystem calls filemap_invalidate_lock{,_shared} if it
> needs to coordinate truncate vs. page removal (i.e. fallocate hole
> punch).  That said, there are a few places where the pagecache itself
> will take that lock too...

> [...]

> ...except that pagecache_ra_unbounded is being called recursively from
> an actual file data read.  My guess is that we'd need a flag or
> something to ask for "unlocked" readahead if we still want readahead to
> spur more readahead.

Basically just move it out of page_cache_ra_unbounded.  With the
consolidation in the earlier patches there are just two callers
of page_cache_ra_unbounded left, this and the redirty_blocks() in f2fs.

I'd kinda wish to kill the latter, as the past-EOF reading is something
that should be restricted to core code, but I can't really think of
an easy way to do that.

