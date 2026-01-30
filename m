Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26367366813
	for <fsverity@lists.linux.dev>; Fri, 30 Jan 2026 05:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769752322; cv=none; b=fEeVExqy9RfnzOig93SWFWy5hFsn4Yc+MzaJ4F06VTWk9Hc0YNs8txeIOZZNpgRHAo9MQpl26oVBwB7Jc8JOKS925mIlDFZC2JlKHzgawwbf/bzSOA1wqQG7x3YRjuax7MHqNwSOoXjOvKkq4JxjLk7GHH1Cc7HUPAIlzD4WzTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769752322; c=relaxed/simple;
	bh=/di7tV81dK2M9pT7T3tckyp5SVxFbJScrP/zb82Kews=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QfrsqqJug8/B+6mHnEp6cMuv1StpCbr+7JowHn5sCTCTd1Shuw8xO5IaplVwZE0w20SGzjyKh08JU0HByLnMJGkuPKrFbUk8YqRt2bquLjD3OyjkvwTRwQrYM3GrWKxEzJKmkrKd9pEGdIzkoial3CxONCIKxCo0MeUUy8x9pXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id E26A168B05; Fri, 30 Jan 2026 06:51:57 +0100 (CET)
Date: Fri, 30 Jan 2026 06:51:57 +0100
From: Christoph Hellwig <hch@lst.de>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, Al Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	David Sterba <dsterba@suse.com>, Theodore Ts'o <tytso@mit.edu>,
	Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
	Andrey Albershteyn <aalbersh@redhat.com>,
	Matthew Wilcox <willy@infradead.org>, linux-fsdevel@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, fsverity@lists.linux.dev
Subject: Re: [PATCH 08/15] fsverity: kick off hash readahead at data I/O
 submission time
Message-ID: <20260130055157.GB622@lst.de>
References: <20260128152630.627409-1-hch@lst.de> <20260128152630.627409-9-hch@lst.de> <20260128225602.GB2024@quark>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260128225602.GB2024@quark>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Wed, Jan 28, 2026 at 02:56:02PM -0800, Eric Biggers wrote:
> On Wed, Jan 28, 2026 at 04:26:20PM +0100, Christoph Hellwig wrote:
> > Currently all reads of the fsverity hashes is kicked off from the data
> > I/O completion handler, leading to needlessly dependent I/O.  This is
> > worked around a bit by performing readahead on the level 0 nodes, but
> > still fairly ineffective.
> > 
> > Switch to a model where the ->read_folio and ->readahead methods instead
> > kick off explicit readahead of the fsverity hashed so they are usually
> > available at I/O completion time.
> > 
> > For 64k sequential reads on my test VM this improves read performance
> > from 2.4GB/s - 2.6GB/s to 3.5GB/s - 3.9GB/s.  The improvements for
> > random reads are likely to be even bigger.
> > 
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> > Acked-by: David Sterba <dsterba@suse.com> [btrfs]
> 
> Unfortunately, this patch causes recursive down_read() of
> address_space::invalidate_lock.  How was this meant to work?

It worked by the chances that multiple down_read generally work.
Except when they don't and we have a write queued up in between,
but nothing in xfstests hits that.

I'll look into reworking it to avoid that.
