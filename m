Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 187FA3793AD
	for <fsverity@lists.linux.dev>; Tue, 13 Jan 2026 08:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768291945; cv=none; b=s7QEYJzpgRb4DM0rAIhCb3IwGUbkYiGaBVK3c5V2LUxF7UWOA7G8mbZuxuAXUKvAGeXujiFqHIbUwXscyx1/Sl7XmIeXtGLJ+0TUSnfwC4jvXx1r62NsTMjqSSl+FqjiNfw8tHq0LmWhsFs1EQ3WBtEY0HrSWt7AKzwZyGx2/Xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768291945; c=relaxed/simple;
	bh=DNFd102j054r5FnEeMtTIJcmuAO3bOs1G9f9PQgkbH4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p5/uejBZbOJK06HmWXmSuT8FgLlGIMojRWKBJRDHxp8gToWOZaGutkll8vZ6vS32sIFcC72WUTZgwyEuw9Kgm0LNJoaqpsN6FSpNAvMbanRTCIAovm2uTV3FPNhBYT9P3T6Z1B7P0LjohSv+kbZO9ZIx6C+Uj3+NTKfTvnOl9j0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 8DC11227AA8; Tue, 13 Jan 2026 09:12:20 +0100 (CET)
Date: Tue, 13 Jan 2026 09:12:20 +0100
From: Christoph Hellwig <hch@lst.de>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: Andrey Albershteyn <aalbersh@redhat.com>, fsverity@lists.linux.dev,
	linux-xfs@vger.kernel.org, ebiggers@kernel.org,
	linux-fsdevel@vger.kernel.org, aalbersh@kernel.org,
	david@fromorbit.com, hch@lst.de
Subject: Re: [PATCH v2 3/22] iomap: introduce IOMAP_F_BEYOND_EOF
Message-ID: <20260113081220.GB30809@lst.de>
References: <cover.1768229271.patch-series@thinky> <d5fc72ldfwyzbgiypzlhn5diiqyijxaicpa3w6obx4iismuko3@kttpcgqjy6i5> <20260112221853.GI15551@frogsfrogsfrogs>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260112221853.GI15551@frogsfrogsfrogs>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Mon, Jan 12, 2026 at 02:18:53PM -0800, Darrick J. Wong wrote:
> On Mon, Jan 12, 2026 at 03:50:05PM +0100, Andrey Albershteyn wrote:
> > Flag to indicate to iomap that read/write is happening beyond EOF and no
> > isize checks/update is needed.
> > 
> > Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org>
> > ---
> >  fs/iomap/buffered-io.c | 13 ++++++++-----
> >  fs/iomap/trace.h       |  3 ++-
> >  include/linux/iomap.h  |  5 +++++
> >  3 files changed, 15 insertions(+), 6 deletions(-)
> > 
> > diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
> > index e5c1ca440d..cc1cbf2a4c 100644
> > --- a/fs/iomap/buffered-io.c
> > +++ b/fs/iomap/buffered-io.c
> > @@ -533,7 +533,8 @@
> 
> (Does your diff program not set --show-c-function?  That makes reviewing
> harder because I have to search on the comment text to figure out which
> function this is)

Or use git-send-email which sidesteps all these issues :)

> Hrm.  The last test in iomap_block_needs_zeroing is if pos is at or
> beyond EOF, and iomap_adjust_read_range takes great pains to reduce plen
> so that poff/plen never cross EOF.  I think the intent of that code is
> to ensure that we always zero the post-EOF part of a folio when reading
> it in from disk.
> 
> For verity I can see why you don't want to zero the merkle tree blocks
> beyond EOF, but I think this code can expose unwritten junk in the
> post-EOF part of the EOF block on disk.
> 
> Would it be more correct to do:

Or replace the generic past EOF flag with a FSVERITY flag making
the use case clear?

> > @@ -1815,8 +1817,9 @@
> >  
> >  	trace_iomap_writeback_folio(inode, pos, folio_size(folio));
> >  
> > -	if (!iomap_writeback_handle_eof(folio, inode, &end_pos))
> > -		return 0;
> > +	if (!(wpc->iomap.flags & IOMAP_F_BEYOND_EOF) &&
> > +	    !iomap_writeback_handle_eof(folio, inode, &end_pos))
> 
> Hrm.  I /think/ this might break post-eof zeroing on writeback if
> BEYOND_EOF is set.  For verity this isn't a problem because there's no
> writeback, but it's a bit of a logic bomb if someone ever tries to set
> BEYOND_EOF on a non-verity file.

Maybe we should not even support the flag for writeback?

