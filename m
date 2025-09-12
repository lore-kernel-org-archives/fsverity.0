Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53CE1215198
	for <fsverity@lists.linux.dev>; Fri, 12 Sep 2025 07:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757661551; cv=none; b=rW5p522nNVMNTeduMQ1w/ohpC199BhAC3IRuu60mqJH/V+IshPygTNALn5Dzozj9mHklKQeJD30a2HuX6m3te4TTEqAl4wBzA3EHm/R5+/nEXzxU7wFNQwUtcjeOVFHXAzJ6/K30SKVyMKhsSmfA163oDFFqq5Iry8DZKKpMp+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757661551; c=relaxed/simple;
	bh=4VSxvnyitUuHbhqtl529rIPITQrQA9BPf6MhDT6TeK0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S/tG40PnjJjAShyeT0+b0vPjiFz8gDS0kLC6mR/XFW3Qbb4rGqpoNc9TQ+ZJZuUxW7y0XbjKnyRZrUkGvyWNO+YDmP1jivhsZCvuFR4WL+XvDllp4cfTcW1USFXLTKcn6PBxGSUkEqF1dKqWZzngo97hPisRakRGFRXzKR9xEuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 96F4068BFE; Fri, 12 Sep 2025 09:18:59 +0200 (CEST)
Date: Fri, 12 Sep 2025 09:18:59 +0200
From: Christoph Hellwig <hch@lst.de>
To: Andrey Albershteyn <aalbersh@redhat.com>
Cc: Christoph Hellwig <hch@lst.de>, "Darrick J. Wong" <djwong@kernel.org>,
	fsverity@lists.linux.dev, linux-fsdevel@vger.kernel.org,
	linux-xfs@vger.kernel.org, david@fromorbit.com, ebiggers@kernel.org,
	Andrey Albershteyn <aalbersh@kernel.org>
Subject: Re: [PATCH RFC 02/29] iomap: introduce iomap_read/write_region
 interface
Message-ID: <20250912071859.GB13505@lst.de>
References: <20250728-fsverity-v1-0-9e5443af0e34@kernel.org> <20250728-fsverity-v1-2-9e5443af0e34@kernel.org> <20250729222252.GJ2672049@frogsfrogsfrogs> <20250811114337.GA8850@lst.de> <pz7g2o6lo6ef5onkgrn7zsdyo2o3ir5lpvo6d6p2ao5egq33tw@dg7vjdsyu5mh>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <pz7g2o6lo6ef5onkgrn7zsdyo2o3ir5lpvo6d6p2ao5egq33tw@dg7vjdsyu5mh>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Tue, Sep 09, 2025 at 02:30:14PM +0200, Andrey Albershteyn wrote:
> > Same thoughts here.  It seems like we should just have a beyond-EOF or
> > fsverity flag for ->read_iter / ->write_iter and consolidate all this
> > code.  That'll also go along nicely with the flag in the writepage_ctx
> > suggested by Joanne.
> > 
> 
> In addition to being bound by the isize the fiemap_read() copies
> data to the iov_iter, which is not really needed for fsverity.

Aka, you want an O_DIRECT read into a ITER_BVEC buffer for the data?

