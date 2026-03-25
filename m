Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6FC13939C1
	for <fsverity@lists.linux.dev>; Wed, 25 Mar 2026 07:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774425465; cv=none; b=Ixbsw3mmwYW0pSB1/QAhzRMdvJMSae39UkR0D7PXjXflLMLsLnhkdVU753/y1gLTYTMgLPKcEV1UpX8WGfwaXLAlIHNyD1DHe2xXjTwibjlqYwTpGXvB4yj8fAsmTBiWIVDQ6OACCH/CkSG8tGIqLA2x2zRmTJkZl3WVcmqaplg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774425465; c=relaxed/simple;
	bh=q2c/xT6XJwEKIiHJmT8558WCfx4UGROZ9aBuiUzMmX0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mz30z8FebmZoGq6dtHwgaW7DYVbvuGMjsdr0eVUtgvP9VK74dws//J9BH305xQ8hc0H/dmmh2xWodcZdeVKffkJHTaSAExcGgLELnzcMyXzN7TiBiRm843kCzd73Jo2ZlMn1Co1FWER6j53uuCRRMlyqbxkB4txDwrvO0NMyE2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id DAD7968CFE; Wed, 25 Mar 2026 08:57:37 +0100 (CET)
Date: Wed, 25 Mar 2026 08:57:37 +0100
From: Christoph Hellwig <hch@lst.de>
To: Andrey Albershteyn <aalbersh@kernel.org>
Cc: linux-xfs@vger.kernel.org, fsverity@lists.linux.dev,
	linux-fsdevel@vger.kernel.org, ebiggers@kernel.org, hch@lst.de,
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	linux-btrfs@vger.kernel.org, djwong@kernel.org
Subject: Re: [PATCH v5 04/25] fsverity: introduce fsverity_folio_zero_hash()
Message-ID: <20260325075737.GD952@lst.de>
References: <20260319170231.1455553-1-aalbersh@kernel.org> <20260319170231.1455553-5-aalbersh@kernel.org>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260319170231.1455553-5-aalbersh@kernel.org>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Thu, Mar 19, 2026 at 06:01:51PM +0100, Andrey Albershteyn wrote:
> Helper to pre-fill folio with hashes of empty blocks. This will be used
> by iomap to synthesize blocks full of zero hashes on the fly.

This should probably be merged with the previous patch.

