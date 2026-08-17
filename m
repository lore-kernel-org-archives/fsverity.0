Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02FB93B4E9F
	for <fsverity@lists.linux.dev>; Mon, 17 Aug 2026 07:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786950662; cv=none; b=b0afhHiUKRkTb8DyH0+/dZpP1eweyrVVqlL07eBJHKGP5XArkSWpEiVfDcXioXarK8RQzQirmF9pqRaky/Rrtn1xQZv7Jd7qBLM125Fd1sOzMceRRvLOiC920xwxIhgLe5uL0uRPuu79oxWyUzs9QYkw57w3/ui4OipXv/5YW3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786950662; c=relaxed/simple;
	bh=M7NmYC/Iylm9myghHwqILim55SAUt9QrM+UZYk0eJlw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ia4C2o447GlUcNHYZdA9pHeQdHXz6Y/aVjCVmxxY5JxjLRNBOKkMdhGw6KZ0ns+2XfaiSOpnC1OaZJUJC5/8vT8rk4t4drP9PZgq+9+lmFI3hlh7v8D9uh5KlbvdqE6lSAiKse0RJ1N+woA84e26/zkWv4tMTpTS8qduqp39xcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 2E11868CFE; Mon, 17 Aug 2026 09:10:56 +0200 (CEST)
Date: Mon, 17 Aug 2026 09:10:55 +0200
From: Christoph Hellwig <hch@lst.de>
To: Andrey Albershteyn <aalbersh@kernel.org>
Cc: djwong@kernel.org, ebiggers@kernel.org, hch@lst.de,
	Jens Axboe <axboe@kernel.dk>, Carlos Maiolino <cem@kernel.org>,
	fsverity@lists.linux.dev, linux-fsdevel@vger.kernel.org,
	linux-xfs@vger.kernel.org, linux-unionfs@vger.kernel.org,
	linux-block@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, linux-btrfs@vger.kernel.org,
	david@fromorbit.com, Tal Zussman <tz2294@columbia.edu>
Subject: Re: [PATCH v15 16/25] xfs: handle fsverity I/O in write/read path
Message-ID: <20260817071055.GC17371@lst.de>
References: <20260814092448.1818082-1-aalbersh@kernel.org> <20260814092448.1818082-17-aalbersh@kernel.org>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260814092448.1818082-17-aalbersh@kernel.org>
User-Agent: Mutt/1.5.17 (2007-11-01)

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

