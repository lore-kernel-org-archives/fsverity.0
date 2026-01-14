Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E5D734E760
	for <fsverity@lists.linux.dev>; Wed, 14 Jan 2026 06:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768372906; cv=none; b=ngdnPitONLPH5+XXHckTLLDKaa6CxlpZCwC6RFSL5PfK+g/MtHrufRxodTOmz31YedrUefY2d1X82umKVTiXybp6qs7OXR+1iy2YS/+3USt5Dlse/O69UfUhaCFSW6oCQeRgPQ/n9aCmh3BFkA/v8Vanqlvhznyy+qdcLrN7WSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768372906; c=relaxed/simple;
	bh=Wk2Qes8mC74BQQVtKDTbnWWnLCvdYM7n1bvz88FbkT8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nur/DZS39Ys2mtXSl9qfOAwUmtDvUcj7fJbL27BlImqRyhwKlwtQUtUpJUBc6QaR4MfDvX+3a3Hn92opfGbW0hFmNBqql1QgXrqkkj0cxlKmBPWUgcnHrF+qHcUTh5s3tBTUoSRIWtJjDaia/n4pSaiH4zzpCTj42mvZPktoSqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 3BC1C227AA8; Wed, 14 Jan 2026 07:41:31 +0100 (CET)
Date: Wed, 14 Jan 2026 07:41:30 +0100
From: Christoph Hellwig <hch@lst.de>
To: Matthew Wilcox <willy@infradead.org>
Cc: Christoph Hellwig <hch@lst.de>, "Darrick J. Wong" <djwong@kernel.org>,
	Andrey Albershteyn <aalbersh@redhat.com>, fsverity@lists.linux.dev,
	linux-xfs@vger.kernel.org, ebiggers@kernel.org,
	linux-fsdevel@vger.kernel.org, aalbersh@kernel.org,
	david@fromorbit.com
Subject: Re: [PATCH v2 4/22] iomap: allow iomap_file_buffered_write() take
 iocb without file
Message-ID: <20260114064130.GB10876@lst.de>
References: <cover.1768229271.patch-series@thinky> <kibhid6bipmrndfn774tlbm6wcitya5qydhjws3n6tnjvbd4a3@bui63p535b3q> <20260112222215.GJ15551@frogsfrogsfrogs> <20260113081535.GC30809@lst.de> <aWZ2RL3oBQGUmLvF@casper.infradead.org>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aWZ2RL3oBQGUmLvF@casper.infradead.org>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Tue, Jan 13, 2026 at 04:43:48PM +0000, Matthew Wilcox wrote:
> > It's not passed down, but I think it could easily.
> 
> willy@deadly:~/kernel/linux$ git grep ki_filp |grep file_inode | wc
>     109     575    7766
> willy@deadly:~/kernel/linux$ git grep ki_filp |wc
>     367    1920   23371
> 
> I think there's a pretty strong argument for adding ki_inode to
> struct kiocb.  What do you think?

That assumes the reduced pointer dereference is worth bloating the
structure.  Feel free to give it a try.

Note that we'd still require the file to be set, otherwise we're
going to have calling conventions from hell.
