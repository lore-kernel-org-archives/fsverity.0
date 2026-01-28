Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57EBB2DB7B4
	for <fsverity@lists.linux.dev>; Wed, 28 Jan 2026 03:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769572083; cv=none; b=k6Rs/txn+bF7ASPFzUi26lGQO1lG/cCIJjGgMr/nMcfoV9GYIa3nr/oHpqSXNYHgKauqCQ6XPY+0cAQ/4YTYkzEK+4YRiMsE3xwjlM+d3gE9NQ76xiiZ6lQrsHGlGyDOmhDswHd997jLZIb0fkyepjvqAm3uIHS3sXNirivOKq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769572083; c=relaxed/simple;
	bh=1z/y5o6GhTSrzHG4DDhScNrYrVFq/RuPxfpWNR0UWic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M6t9K4specu09rOgqIw09ipElyzDQHUwnHCYe31jDcHX7+OspMCp5RGj+4BykOMrZEZnF5dBe0Umgmfy/uLkh6PqXwbPQm9H3lC8ki4P065FALHzBDWFs7m7LtYAQiBJl9JPsJbdonOpXdoaEQswA+VnT+tFax6mTcQ/O4RBEOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 38E61227A8E; Wed, 28 Jan 2026 04:48:00 +0100 (CET)
Date: Wed, 28 Jan 2026 04:48:00 +0100
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
Subject: Re: [PATCH 09/16] fsverity: constify the vi pointer in
 fsverity_verification_context
Message-ID: <20260128034800.GA31178@lst.de>
References: <20260126045212.1381843-1-hch@lst.de> <20260126045212.1381843-10-hch@lst.de> <20260128032203.GA2718@sol> <20260128033242.GA30830@lst.de> <20260128034102.GC2718@sol>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260128034102.GC2718@sol>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Tue, Jan 27, 2026 at 07:41:02PM -0800, Eric Biggers wrote:
> two different directions.  Maybe just drop this patch for now?

Sure.

