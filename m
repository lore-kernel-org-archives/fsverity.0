Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869BF442C
	for <fsverity@lists.linux.dev>; Tue, 12 Aug 2025 07:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754985394; cv=none; b=nrOuA3EFUuT+kyENc3pyCvAHq+1KnrP5lll+odSrkOOxwPwvNXOZeEHKPC7TdVEQBuKI1nxwU68Sdb9a/8nSi4GFVjpTTjE38cBw/C5eNEwtN/bjFtHdokwrM0fbn31imu9J/SN7upz13Yekgwfc12VDcEe+6YWIhorCItdmSxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754985394; c=relaxed/simple;
	bh=Wzn7t/5s/NJlYDD41aeYHxbCBQtFPobZBWXGmY2Yago=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EUqqFRFtoF9WVxm+A01GFE0WazXlrIPJ0kxl4O1tOUBuoQgr/gVJdsXy1UpMBXjgIMQ7IkgPOfeSFwvONBxTIQmTBF8BZroQLqybGi3PCiycHzTzuvGjrbZ5u5cGem82Njqczlv5u2fSRNvpeK+pBrJoF4Wtj3PiCdPEpgRINqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 8DF4A227A87; Tue, 12 Aug 2025 09:56:28 +0200 (CEST)
Date: Tue, 12 Aug 2025 09:56:27 +0200
From: Christoph Hellwig <hch@lst.de>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>,
	Andrey Albershteyn <aalbersh@redhat.com>, fsverity@lists.linux.dev,
	linux-fsdevel@vger.kernel.org, linux-xfs@vger.kernel.org,
	david@fromorbit.com, ebiggers@kernel.org
Subject: Re: [PATCH RFC 06/29] fsverity: report validation errors back to
 the filesystem
Message-ID: <20250812075627.GA20240@lst.de>
References: <20250728-fsverity-v1-0-9e5443af0e34@kernel.org> <20250728-fsverity-v1-6-9e5443af0e34@kernel.org> <20250811114603.GB8969@lst.de> <20250811153142.GJ7965@frogsfrogsfrogs> <20250812073455.GA18413@lst.de>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250812073455.GA18413@lst.de>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Tue, Aug 12, 2025 at 09:34:55AM +0200, Christoph Hellwig wrote:
> On Mon, Aug 11, 2025 at 08:31:42AM -0700, Darrick J. Wong wrote:
> > On Mon, Aug 11, 2025 at 01:46:03PM +0200, Christoph Hellwig wrote:
> > > On Mon, Jul 28, 2025 at 10:30:10PM +0200, Andrey Albershteyn wrote:
> > > > From: "Darrick J. Wong" <djwong@kernel.org>
> > > > 
> > > > Provide a new function call so that validation errors can be reported
> > > > back to the filesystem.
> > > 
> > > This feels like an awfull generic name for a very specific error
> > > condition.
> > 
> > <shrug> ->verity_failure?
> 
> Either that or make it generic.  Either way it needs to be documented
> in the usual places that document file operations including explaining
> when it is supposed to be called.

FYI, I only realized now this is actually a fsverity operation, not
a file operation.  Sorry for the noise.

So maybe file_corrupt is fine, but verity_failure sounds fine to.
Maybe the fsverity maintainers have an opinion.

