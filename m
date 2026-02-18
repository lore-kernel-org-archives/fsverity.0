Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F238E2F8BDF
	for <fsverity@lists.linux.dev>; Wed, 18 Feb 2026 06:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771396414; cv=none; b=hrf4oAsn4G9Rxfh0UmkIQJgXXluqqefO9kaSajrwtU3r85xIxtJLoub7o6EcKdyZwERG0uF4qB/pcMEHlIFFQ2WZiiNQvCtom5i+qquex2AApAbAZHosQtdLcmOBeise5/zDPEIXVUnN61lwpqhFEVHccPQ30InyoosC8nMtKtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771396414; c=relaxed/simple;
	bh=JM6CYKPzTNMWuvNOH1j7DD0XGj0cph2VgrlB9TsAJxc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EP5FY0FkUPivh+UjTRKtFrMuKZifIrTq7ZiwGCvxyA9j9DQxZv42STLkX8VqFba8+u5+4A2qHeeVy808e18OjuUc43FCPjCx0lei1+1aToQSDffR6IRdr1qoUZfN8TtwYsgbUoDWOuc+eLBL2iFVAUtZ4Dd6Nf3vVd7gPxJzOC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id E562468B05; Wed, 18 Feb 2026 07:33:30 +0100 (CET)
Date: Wed, 18 Feb 2026 07:33:30 +0100
From: Christoph Hellwig <hch@lst.de>
To: Andrey Albershteyn <aalbersh@kernel.org>
Cc: linux-xfs@vger.kernel.org, fsverity@lists.linux.dev,
	linux-fsdevel@vger.kernel.org, ebiggers@kernel.org, hch@lst.de,
	djwong@kernel.org
Subject: Re: [PATCH v3 20/35] xfs: introduce XFS_FSVERITY_REGION_START
 constant
Message-ID: <20260218063329.GB8600@lst.de>
References: <20260217231937.1183679-1-aalbersh@kernel.org> <20260217231937.1183679-21-aalbersh@kernel.org>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260217231937.1183679-21-aalbersh@kernel.org>
User-Agent: Mutt/1.5.17 (2007-11-01)

> + * tree size is ((128^8 − 1)/(128 − 1)) = 567*10^12 blocks. This should fit in 53

Overly long line.

