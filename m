Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BDDC390999
	for <fsverity@lists.linux.dev>; Wed, 25 Mar 2026 07:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774425426; cv=none; b=OfMiuFeaXmedqOgOWMw2ciZ+p6pe3Lkle5yhDO8XJeSjEQdIe0lAFRieYKCmlY4BkMwiVpEmT5k9S6bd+6+14b9xh8un9KZGBj46ghzS5QxYqiPsMaO49AEs0dZDahWcv1C6+11pIxY0mJkWjWwRefEAR8Z4KsFUpS4ujkys1TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774425426; c=relaxed/simple;
	bh=0q8BLJk/ygKuLzqid/uDpe6daMEqtyc+fcO/geTlCUc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bniQ75/QF9KRcRrdSyhmU+ZKVk3i04Wggno0R9n0iUxBEscYPA28+ULcs+3hJ2WKUd1B3Enx2h0SgtBowdQa0b9WB656EFn6TrPraBtExk9U1zihruKrku6ZWVRDWLG8buQw/24DbDWJY0T18H8rsyUkXG8stfK9VyVXuu5PWk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 9146B68C7B; Wed, 25 Mar 2026 08:57:00 +0100 (CET)
Date: Wed, 25 Mar 2026 08:57:00 +0100
From: Christoph Hellwig <hch@lst.de>
To: Andrey Albershteyn <aalbersh@kernel.org>
Cc: linux-xfs@vger.kernel.org, fsverity@lists.linux.dev,
	linux-fsdevel@vger.kernel.org, ebiggers@kernel.org, hch@lst.de,
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	linux-btrfs@vger.kernel.org, djwong@kernel.org
Subject: Re: [PATCH v5 03/25] fsverity: generate and store zero-block hash
Message-ID: <20260325075700.GC952@lst.de>
References: <20260319170231.1455553-1-aalbersh@kernel.org> <20260319170231.1455553-4-aalbersh@kernel.org>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260319170231.1455553-4-aalbersh@kernel.org>
User-Agent: Mutt/1.5.17 (2007-11-01)

Shouldn't we still try to get this out of the fsverity_info first?

