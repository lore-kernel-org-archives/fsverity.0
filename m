Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C6D326937
	for <fsverity@lists.linux.dev>; Tue,  3 Feb 2026 05:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770096752; cv=none; b=PmyGu58YoF0ARMvDyPIoNuLrTb/is8HNjdaamIqkqJ6KWhbyoOYLZ205Ro9BdYxmeBmy097idVt0fdiFt/oOiSB+e0UintOit300n00UHCJxEx3lelTUaUW+hpesCxFWAr4m4CZ0gKlEpQXZdpoWsTPOKFQ0EbAqnjxDGO7Ztio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770096752; c=relaxed/simple;
	bh=fs/NRSNAuw7Zu4gJ1VEptU0JD85IwsG2goAuMKdkTnw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cc/rajwE8vGHE13xCbEKp29ElmJMrvJRj9Dqr/bVD9pMgSLerGi4k9xRTb35dekdunfykMm5Hl1qXlGf2RPtNyGedaS0N8bdRNsBKfNyVBbcVX4Svp3Rkf3UEu8/NnCrDm0erUJf0vxJ04f0p6qCnOnycnyh6TjWkJ8+3lguA+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 88D1568AFE; Tue,  3 Feb 2026 06:32:28 +0100 (CET)
Date: Tue, 3 Feb 2026 06:32:28 +0100
From: Christoph Hellwig <hch@lst.de>
To: Eric Biggers <ebiggers@kernel.org>
Cc: fsverity@lists.linux.dev, linux-fsdevel@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>, Theodore Ts'o <tytso@mit.edu>
Subject: Re: [PATCH] fsverity: add missing fsverity_free_info()
Message-ID: <20260203053228.GB15956@lst.de>
References: <20260202214306.153492-1-ebiggers@kernel.org>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202214306.153492-1-ebiggers@kernel.org>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Mon, Feb 02, 2026 at 01:43:06PM -0800, Eric Biggers wrote:
> If fsverity_set_info() fails, we need to call fsverity_free_info().
> 
> Fixes: ada3a1a48d5a ("fsverity: use a hashtable to find the fsverity_info")
> Signed-off-by: Eric Biggers <ebiggers@kernel.org>

Looks good.  It might make sense to fold into the offending patch to help
with bisectability, though.

