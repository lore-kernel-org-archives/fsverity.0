Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.95.11.211
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793960810;
	b=15JDnaysgCAfE7eUbwUhAIUqA+CDxSH8yu+zinPZdQeho8xj0mACz/oiDDhxEousmeKs
	 +gk7ySs1fZrdID7QktxZO1ciOOcU+pvgi3Ef9O9QeNgnlD56vTce6P6cs6HOMwyUOkhv5
	 q5PUKCsUWRhisctM5R5FB9v/4iH9v2GzDBxjk0kviGsrZogaljb8/+z5mqRK7Yok3nX6h
	 rYXWrox9TJ1ICszs3o0ILepFXrn+QVCnGtjplVTIKplfvAeZHea/3W2ousMQuolEbaECb
	 cJJKzuvTL7YembdHHagpFJACAkGHIdKLK9or/AGsc995WUh8e6lHvvTRRG069nG7Dhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793960810;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=M7NmYC/Iylm9myghHwqILim55SAUt9QrM+UZYk0eJlw=;
	b=FXuEF5v/ePENKRoXe3LUf7VghpWTz73q9A32uZ+sRLwrYNcfNbc/LUmbUq1ZUtZnmLc5
	 RjFKcWujJSkC4K3IttA6/PGz7aTkFLuHkvOhlnM8YI2RHz7zR+WA3Hb7wxpeWr1n/xkRB
	 BiekeB0yRCvcHkR6GpOmq9F9PSkrBlAdmLnWVOtGypwjo5DFEOrLoWDW+6/FoJsUrT2Zo
	 MSNm1Ki2pXvNWiqH4vlo2+AoptYh8iIgDdAU9ijEfZ7a3glsPXajePXNFmLMSikCk3bet
	 jy2VTybYHOTnTO9fBcHlMt0jYLWJTecKfI7uTsE6GRljbWO6iyrK735Wp5EosF9rwaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lst.de;
	spf=pass smtp.mailfrom=lst.de;
	arc=none smtp.remote-ip=213.95.11.211
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 275A2606A32D
	for <fsverity@lists.linux.dev>; Fri,  6 Nov 2026 10:26:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 275A2606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id A031B68BEB; Fri,  6 Nov 2026 11:26:45 +0100 (CET)
Date: Fri, 6 Nov 2026 11:26:45 +0100
From: Christoph Hellwig <hch@lst.de>
To: Andrey Albershteyn <aalbersh@kernel.org>
Cc: ebiggers@kernel.org, hch@lst.de, fsverity@lists.linux.dev,
	dsterba@suse.com, linux-xfs@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	linux-ext4@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	brauner@kernel.org, viro@zeniv.linux.org.uk, jaegeuk@kernel.org,
	chao@kernel.org, tytso@mit.edu
Subject: Re: [PATCH v2 2/5] fsverity: add I_VERITY_BUILDING inode state flag
Message-ID: <20261106102645.GB5319@lst.de>
References: <20261105115532.613467-1-aalbersh@kernel.org> <20261105115532.613467-3-aalbersh@kernel.org>
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Post: <mailto:fsverity@lists.linux.dev>
List-Help: <mailto:fsverity+help@lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fsverity+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261105115532.613467-3-aalbersh@kernel.org>
User-Agent: Mutt/1.5.17 (2007-11-01)

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

