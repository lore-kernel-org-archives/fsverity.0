Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.95.11.211
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793960832;
	b=NBecBZad9WXT03oOfBsIAeyUgdtEAzaxvtcCyGmBIs+jqKkaLZvS++mI5ZA9RmX0GwDz
	 TyxgpeMxiHqO2mrA8GVr5UxMWJ6a1WlamlflapLeBSBeqtmgnaeLYAHIX7PnEYApj3/Oy
	 2HVQgFuAylf2oQ23Y19swvqg/8UuuAjsaihM4lXx0iiSy4XYgSRJWO9d4CYf4M+6PpzN5
	 +DHy7WQ4TyW/NElOn0XNXUuXiE3F71y1gUoD+lVY/vYuMrxcxaY8DhQ/it2bEwc77eq4M
	 sB4X7zLm1ZP7q9CXReqg7TXdXAk1xaiAOXf/TROsX7uq2cIbeM9z7MRm+6H+6D2H+NA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793960832;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=M7NmYC/Iylm9myghHwqILim55SAUt9QrM+UZYk0eJlw=;
	b=ItxmbUm4h0Mx4bY+1Xt1v/FGjueFGQk+tI686WDmEykpx1RFIt1ETGY/dRx7eqQJbnnn
	 Dl6w129pF35jnmzBKmMkLgWLJs6vipUmbXgCvfaH7y8t0DSK13h+ZURHP5d9VzvednL/h
	 ydM3i8ElPZ3JtGhau6ryNOoKjDcqsVQ1gVddcuIlRb2YOWJxlELaQNFGKBHJ4aU7zL+KV
	 2hKzWJCzBGH8UBh8MFMqlZsrh2y8cXCsnFQXuAILgaGSAq+SugcSj/s+adM7pqQYagU7D
	 k5p7LNS9xbm4M6Z9LRv9Q7kVtknFRKpC2MSRqNBd4ND1e71kjJxPubcc3sBnsggO0Ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lst.de;
	spf=pass smtp.mailfrom=lst.de;
	arc=none smtp.remote-ip=213.95.11.211
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D66606A330
	for <fsverity@lists.linux.dev>; Fri,  6 Nov 2026 10:27:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9D66606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 6C90068BEB; Fri,  6 Nov 2026 11:27:08 +0100 (CET)
Date: Fri, 6 Nov 2026 11:27:08 +0100
From: Christoph Hellwig <hch@lst.de>
To: Andrey Albershteyn <aalbersh@kernel.org>
Cc: ebiggers@kernel.org, hch@lst.de, fsverity@lists.linux.dev,
	dsterba@suse.com, linux-xfs@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	linux-ext4@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	brauner@kernel.org, viro@zeniv.linux.org.uk, jaegeuk@kernel.org,
	chao@kernel.org, tytso@mit.edu
Subject: Re: [PATCH v2 4/5] ext4: use I_VERITY_BUILDING instead of private
 flags
Message-ID: <20261106102708.GD5319@lst.de>
References: <20261105115532.613467-1-aalbersh@kernel.org> <20261105115532.613467-5-aalbersh@kernel.org>
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
In-Reply-To: <20261105115532.613467-5-aalbersh@kernel.org>
User-Agent: Mutt/1.5.17 (2007-11-01)

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

