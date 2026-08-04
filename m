Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 057654921BC
	for <fsverity@lists.linux.dev>; Tue,  4 Aug 2026 17:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785865197; cv=none; b=AX27iqRpQWL4zXu3eiKJZfpzW5+FfEQ3c2TASxhADjNFLr6qmhjy9YbvlXMIWFY2BheXy9GSqHVJ5/cg3il6Dzrjhwhuv1X2W1TozJ7TltA+h70egjlfi3DHTcCvcg8QFuby1+ski5y1yxAfpeOkVlh4ecBWYwi9a73hC24kUBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785865197; c=relaxed/simple;
	bh=uRWuvIdnw5Xs4qO6QIZ6DtEuYHVb045l8RzlJ4qk1vI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t0EnNwzlCe/d6Tr+JcIWesyf8nC7PfMQ46AxSRv07jXmD1OoL3qvxc4HJoeUi57+jK35SeWQdRI2Yg2rKAiJa8zK9HGtJGoEUx4XoC81IYQ48VQP/Z8z4uQGo3lvym59ebDCxODUJ4NPlKZkcOzdR1zXB6mNGdAYkVlhPOeucQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 3CE6E68C4E; Tue,  4 Aug 2026 19:39:50 +0200 (CEST)
Date: Tue, 4 Aug 2026 19:39:50 +0200
From: Christoph Hellwig <hch@lst.de>
To: Andrey Albershteyn <aalbersh@kernel.org>
Cc: linux-xfs@vger.kernel.org, fsverity@lists.linux.dev,
	linux-fsdevel@vger.kernel.org, ebiggers@kernel.org, hch@lst.de,
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	linux-btrfs@vger.kernel.org, djwong@kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v14 07/21] fsverity: hoist statx reporting of fs-verity
 flag
Message-ID: <20260804173950.GA14046@lst.de>
References: <20260803200820.393203-1-aalbersh@kernel.org> <20260803200820.393203-8-aalbersh@kernel.org>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260803200820.393203-8-aalbersh@kernel.org>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Mon, Aug 03, 2026 at 10:07:57PM +0200, Andrey Albershteyn wrote:
> All filesystems, supporting fsverity, report this status by checking
> inode flag. Also, BTRFS was missing stat->attributes_mask, which is
> fixed now.

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

