Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5471342EEBB
	for <fsverity@lists.linux.dev>; Tue, 10 Mar 2026 08:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773132278; cv=none; b=YJ7ViCnkCAfGpVuXziUnZ/m8lqb0HA8X7bYvYrlh0lr1wPvBw0h+mjqVHZMcpKRwaEP0ph9ZVvjYJF2hQlfukFYEdMGbn+/gqJwKLPgRJUWQSbAwD/D4zGOBpSSEJgkmRpQCry4ak6FVbf5OEoe9bmu4l9VZIEpSOjXm6ds9I2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773132278; c=relaxed/simple;
	bh=M7NmYC/Iylm9myghHwqILim55SAUt9QrM+UZYk0eJlw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bpei3mVxDjHrJiexAePRIQKyilU8/U0PJHCCfPWKkReruF3neK9C1AMb7Wj5H5+/s5XUZQVmRUmhedDiM0nND5EWbwTogbHwLlD0GlDygU2MzAzuQTrVV9vx3G3+BjTRQlHNMC4yiLcVP3tjNk0arwccjiows12XhpfQOXilio0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 1DA606732A; Tue, 10 Mar 2026 09:44:34 +0100 (CET)
Date: Tue, 10 Mar 2026 09:44:33 +0100
From: Christoph Hellwig <hch@lst.de>
To: Andrey Albershteyn <aalbersh@kernel.org>
Cc: linux-xfs@vger.kernel.org, fsverity@lists.linux.dev,
	linux-fsdevel@vger.kernel.org, ebiggers@kernel.org, hch@lst.de,
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	linux-btrfs@vger.kernel.org, djwong@kernel.org
Subject: Re: [PATCH v4 08/25] iomap: obtain fsverity info for read path
Message-ID: <20260310084433.GB17112@lst.de>
References: <20260309192355.176980-1-aalbersh@kernel.org> <20260309192355.176980-9-aalbersh@kernel.org>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309192355.176980-9-aalbersh@kernel.org>
User-Agent: Mutt/1.5.17 (2007-11-01)

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

