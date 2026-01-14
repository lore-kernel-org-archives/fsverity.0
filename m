Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C5A343D7B
	for <fsverity@lists.linux.dev>; Wed, 14 Jan 2026 06:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768373268; cv=none; b=uqkBAtxu0oVqywbkZcPvItk8VY74nJaCobPWjJwY8JYWIjxVh842nGKBeQyPn1L4MrwuAQgPw1SIx7a2HXXAjVkgMRwmIFDJYk6x9DfG+TdqLITsGraKViYSfT82vY5nUXJA4AIR1JyKtfS9XRGCfq9FoOPtWCOBI32v5KgEBbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768373268; c=relaxed/simple;
	bh=LDAkt1tMxJVXmMz+fqZ+LFnrWWUemPCfMg6j3gIiGQ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qpV/Q+Z/n6jYa6mkiz7Qow2BwiX3vWK2mk+umukXUzUkCD2xtXwXDDK645ows7QKxFaschSaWDnnFVsF172y1pGdF58SqruFYVF/V2CkefF7FhIx/BJdAjoREEpFUi4qz6qvgs/4R0+kqxRc/0Nvp4nd+on9EskyjYpKFd631LM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id E164967373; Wed, 14 Jan 2026 07:47:35 +0100 (CET)
Date: Wed, 14 Jan 2026 07:47:35 +0100
From: Christoph Hellwig <hch@lst.de>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: Andrey Albershteyn <aalbersh@redhat.com>, fsverity@lists.linux.dev,
	linux-xfs@vger.kernel.org, ebiggers@kernel.org,
	linux-fsdevel@vger.kernel.org, aalbersh@kernel.org,
	david@fromorbit.com, hch@lst.de
Subject: Re: [PATCH v2 13/22] xfs: introduce XFS_FSVERITY_REGION_START
 constant
Message-ID: <20260114064735.GD10876@lst.de>
References: <cover.1768229271.patch-series@thinky> <qwtd222f5dtszwvacl5ywnommg2xftdtunco2eq4sni4pyyps7@ritrh57jm2eg> <20260112224631.GO15551@frogsfrogsfrogs> <5ax7476dl472kpg3djnlojoxo2k4pmfbzwzsw4mo4jnaoqumeh@t3l4aesjfhwz> <20260113180655.GY15551@frogsfrogsfrogs>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113180655.GY15551@frogsfrogsfrogs>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Tue, Jan 13, 2026 at 10:06:55AM -0800, Darrick J. Wong wrote:
> > hmm right, check in begin_enable() will be probably enough
> 
> I think that would probably be more of a mount-time prohibition?
> 
> Which would be worse -- any fsverity filesystem refuses to mount on
> 32-bit; or it mounts but none of the fsverity files are readable?
> 
> Alternately I guess for 32-bit you could cheat in ->iomap_begin
> by loading the fsverity artifacts into the pagecache at 1<<39 instead of
> 1<<53, provided the file is smaller than 1<<39 bytes.  Writing the
> fsverity metadata would perform the reverse translation.
> 
> (Or again we just don't allow mounting of fsverity on 32-bit kernels.)

What are the other file systems doing here?  Unless we have a good
reason to differ we should just follow the precedence.

