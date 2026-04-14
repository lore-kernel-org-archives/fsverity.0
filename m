Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1448C392831
	for <fsverity@lists.linux.dev>; Tue, 14 Apr 2026 08:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776154318; cv=none; b=ObeRpypXU2NFBQxoraWymtoZrXlt+zx3dK/gR1xsi/IbhHv3ZbPV5AYZwdbFpZerRvevJCY6J3CTS7HuORud+X3r8nhAQSjcxQiaNrGaNRp6pGxL+CyO9hy7wlh+fzb091oZzazO1sDOnExsfLpZnrgD/6l+8C5GjbrJo6m+0sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776154318; c=relaxed/simple;
	bh=M7NmYC/Iylm9myghHwqILim55SAUt9QrM+UZYk0eJlw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mfRzSOPfKfe3rU0WFlrXxzVAfihkDQjk61L35fFiLyEJIRwXKVi1FL1OxYOTRUW6RfkaH1+82QN7LsYp3BcAmJ5jpr11uEzuFJwDzdCVmmZeYJa8Tm53zJFPhzqwz8LkNnXKL2Kpoqhfkre3NQ6J+rFakfntOQW/gzfu2dwHouk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id E6CE468CFE; Tue, 14 Apr 2026 10:11:46 +0200 (CEST)
Date: Tue, 14 Apr 2026 10:11:46 +0200
From: Christoph Hellwig <hch@lst.de>
To: Andrey Albershteyn <aalbersh@kernel.org>
Cc: linux-xfs@vger.kernel.org, fsverity@lists.linux.dev,
	linux-fsdevel@vger.kernel.org, ebiggers@kernel.org, hch@lst.de,
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	linux-btrfs@vger.kernel.org, djwong@kernel.org
Subject: Re: [PATCH v7 02/22] fsverity: expose ensure_fsverity_info()
Message-ID: <20260414081146.GA11138@lst.de>
References: <20260409131404.1545834-1-aalbersh@kernel.org> <20260409131404.1545834-3-aalbersh@kernel.org>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409131404.1545834-3-aalbersh@kernel.org>
User-Agent: Mutt/1.5.17 (2007-11-01)

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

