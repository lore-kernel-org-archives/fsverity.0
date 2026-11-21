Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.95.11.211
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795220790;
	b=efsXRLmSg3KQxOcEYDoxhBwHTyKcGbs06J7WNni4olv6qXEuTI2vWekJliWB6s97euwa
	 yYcLulGBzYG84WgHEpgoGP2qI/6j6fKg7gocHVRzkbgvwcMnAVryZBqTfgM5u8q6COqFI
	 o93baAYBvyxUca1JORkyRViYH28jT9QtUOD2hc7h1k1Sxzb5niXDTYUakon1MN/+OJifx
	 GKTEWvRfHZb9lS4IwyObRVf8SQqFaczYuh2aggLO7GbfFnX5g6RABL3HaxL1+LkxmCDuY
	 h+0zTt/QOWfdRy78lcrAp7F1KWg4KFNvMhhr9YEPJQOhDvObwwp9h00r/uYq2AGga4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795220790;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=M7NmYC/Iylm9myghHwqILim55SAUt9QrM+UZYk0eJlw=;
	b=zHbYyCi99jQKpF539boz0aF/CRcF1owdYuDzIfFpEdjjjcJTbaT6rzE7YgesXQWjLVHn
	 NTF/dIPD+54bdRhjWpXP3HKs66qvjptFodX5ZnJE8x0QneLghB/Ya7JSpVF2YyrQ/uG1+
	 CNCmbeYyb1a+fhSpLKmijbZUlZ0zZeFsFgwx2Yb+eaGgZ5BxvPhrlD3968JWC0STibGrE
	 Jfp7akvjMgDTkjdBYdhryfGx1t5saKJ/9FSDs99iTtT1B9c5pYnkgJausbCJTq7+gk0W3
	 P26otrL3FWnv/37B1lQH+DMPjViwQGxtxQ9k017Ua9B/OfACVv7C1NhZc2ANnyx2xow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lst.de;
	spf=pass smtp.mailfrom=lst.de;
	arc=none smtp.remote-ip=213.95.11.211
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C262060A2607
	for <fsverity@lists.linux.dev>; Sat, 21 Nov 2026 00:26:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C262060A2607
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 45D736732A; Sat, 21 Nov 2026 01:26:25 +0100 (CET)
Date: Sat, 21 Nov 2026 01:26:25 +0100
From: Christoph Hellwig <hch@lst.de>
To: Andrey Albershteyn <aalbersh@kernel.org>
Cc: Eric Biggers <ebiggers@kernel.org>, Christoph Hellwig <hch@lst.de>,
	Carlos Maiolino <cem@kernel.org>,
	fsverity <fsverity@lists.linux.dev>,
	linux-xfs <linux-xfs@vger.kernel.org>,
	fsdevel <linux-fsdevel@vger.kernel.org>, david@fromorbit.com,
	"Darrick J. Wong" <djwong@kernel.org>
Subject: Re: [PATCH v19 07/15] xfs: add XFS_BMAPI_UNWRITTEN to unmap
 unwritten extents in __xfs_bunmapi()
Message-ID: <20261121002625.GC13395@lst.de>
References: <20261120155752.192025-1-aalbersh@kernel.org> <20261120155752.192025-8-aalbersh@kernel.org>
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
In-Reply-To: <20261120155752.192025-8-aalbersh@kernel.org>
User-Agent: Mutt/1.5.17 (2007-11-01)

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

