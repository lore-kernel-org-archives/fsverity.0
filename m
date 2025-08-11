Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B83622356C6
	for <fsverity@lists.linux.dev>; Mon, 11 Aug 2025 11:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754912725; cv=none; b=T8fwsWiw5LhqaFFMWG7YzT0JAaWKX28CDFLQlO4mEBIVmLdi93u4+s5gsdTTgqoPnRpgkCGDGUx8a6skSA6XiRRLpP08yisBUT+XQCWr4VSZ4JCR+HPQfTi+5+CEmYEp3pacDMVTvcmsIb591LOnF237MUH9go5NJhrmW/hsVYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754912725; c=relaxed/simple;
	bh=1FpN0t8TOFT0mPy+HBk3oYO0/vYuhEeuchJL9MfoR4w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MXk5UT60+JeEwhRvur52Pnh03Ywyp0qarXLH8AlAiPYJbJtrgE6mUzOF2pCy8K3fS1vp0X8lH81hv1e1k8e9J4alGqCPg1OrrMbt2wzTKKAb6FQffZ/mKemOwe9oN/1SqOLehGmxQTDl4wMjzGzmudk1lskh0hLsM9LeFrRNRK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id F2C26227A87; Mon, 11 Aug 2025 13:45:19 +0200 (CEST)
Date: Mon, 11 Aug 2025 13:45:19 +0200
From: Christoph Hellwig <hch@lst.de>
To: Andrey Albershteyn <aalbersh@redhat.com>
Cc: fsverity@lists.linux.dev, linux-fsdevel@vger.kernel.org,
	linux-xfs@vger.kernel.org, david@fromorbit.com, djwong@kernel.org,
	ebiggers@kernel.org, hch@lst.de, Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 04/29] fsverity: add per-sb workqueue for post read
 processing
Message-ID: <20250811114519.GA8969@lst.de>
References: <20250728-fsverity-v1-0-9e5443af0e34@kernel.org> <20250728-fsverity-v1-4-9e5443af0e34@kernel.org>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250728-fsverity-v1-4-9e5443af0e34@kernel.org>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Mon, Jul 28, 2025 at 10:30:08PM +0200, Andrey Albershteyn wrote:
> From: Andrey Albershteyn <aalbersh@redhat.com>
> 
> For XFS, fsverity's global workqueue is not really suitable due to:
> 
> 1. High priority workqueues are used within XFS to ensure that data
>    IO completion cannot stall processing of journal IO completions.
>    Hence using a WQ_HIGHPRI workqueue directly in the user data IO
>    path is a potential filesystem livelock/deadlock vector.

Do they?  I though the whole point of WQ_HIGHPRI was that they'd
have separate rescue workers to avoid any global pool effects.

> 2. The fsverity workqueue is global - it creates a cross-filesystem
>    contention point.

How does this not affect the other file systems?

If the global workqueue is such an issue, maybe it should be addressed
in an initial series before the xfs support?

