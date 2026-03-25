Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BDD7382398
	for <fsverity@lists.linux.dev>; Wed, 25 Mar 2026 07:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774425377; cv=none; b=QCnSTj5gbEzETfxeyQXKRjw1fa712aInbRzu1ddjgSv9kPWjUPeF9EcL/4o1c8Sj4pWAKQijtbupje2R7pjhI+2ncIA1kE5FYG0zJ4GVTeEV2elS3VY/ita2R0CTYeE1xH4LthsTa30/w/+4zA5CAEo55Bip1bL8LLqoyCcUs5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774425377; c=relaxed/simple;
	bh=omp26RJziVlztCI+JMpRUhx7/joUYji5MmDyrc6lGjk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fbVoySxVWXe91mS0lSn0cWAyfo4nsnQiOn/w+CmWe6JXHjVZgccMD0cTnDGNqbUFxak/dpec4trq4/d7U6Fxhfj7IlBJIGDyi846hH1Jjax0DknB2Xj7/GC8z1jME1zFp/5eG/Ww/0nm5cl336ZHLt52I45VVRx60h3Am8HBm54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id B87BB68C4E; Wed, 25 Mar 2026 08:56:11 +0100 (CET)
Date: Wed, 25 Mar 2026 08:56:11 +0100
From: Christoph Hellwig <hch@lst.de>
To: Andrey Albershteyn <aalbersh@kernel.org>
Cc: linux-xfs@vger.kernel.org, fsverity@lists.linux.dev,
	linux-fsdevel@vger.kernel.org, ebiggers@kernel.org, hch@lst.de,
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	linux-btrfs@vger.kernel.org, djwong@kernel.org
Subject: Re: [PATCH v5 02/25] fsverity: expose ensure_fsverity_info()
Message-ID: <20260325075611.GB952@lst.de>
References: <20260319170231.1455553-1-aalbersh@kernel.org> <20260319170231.1455553-3-aalbersh@kernel.org>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260319170231.1455553-3-aalbersh@kernel.org>
User-Agent: Mutt/1.5.17 (2007-11-01)

> -static int ensure_verity_info(struct inode *inode)
> +int fsverity_ensure_verity_info(struct inode *inode)

This should grow a kerneldoc comment.

> +static inline int fsverity_ensure_verity_info(struct inode *inode)
> +{
> +	WARN_ON_ONCE(1);
> +	return -EOPNOTSUPP;
> +}

We should not need a stub for this as the only non-fsverity caller
already checks fsverity_active and the compiler will eliminate the
dead call.

