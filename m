Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.95.11.211
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793113700;
	b=o6sTDbrZHFrrbssiUQJ6133IzZ09tL/eNxy7KcTl7d3GxjbvSvc8+/O4KsJeTk/RsjbR
	 zJg4XecDbZ6IncvQvBORK6VSWdzRsiFTJh9fG3YRrS9PiXdsrafy5QJA4UF8oaVS2xRck
	 4Fcwd28bQdQz3TM7+RxW4sDCrDI0c2nPxry4YKZCGuJv3U3SMZqxJJ5QCCYqnYOriooP4
	 WkKuxoupUvDmhltC0VJnZFRBFCXmKf0t0gypmYcqACiMvX6NcJBMaGPv81NGlTclze2V4
	 jSiZuVcz1O79TxHQgzYV38en46IfYZO+1lDHc56Njkz9ROm+FY/NN/zrGOeRrMQg8gA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793113700;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=M7NmYC/Iylm9myghHwqILim55SAUt9QrM+UZYk0eJlw=;
	b=5JnxjLrx5JgfC40YYZ3B6EbgABRxBmAlCMpQtDRjhMrcPLp6ISm2Fz7Ozfgyk3KmuODA
	 WoenMcV0giIJKTH1Lwn9s4aaP4xYt+0CNlL4it1aUarGf4jcanikWAyOAuRfk060xP27o
	 Hyvr6ma4gzTOkRwVLL/tdai2HyiG1IUHDgfzeIl0eX50/uMONkJt8oJ2Ir9fAP8+WtyAv
	 qoM0apMCaLqdMkPcO/NF3Z7CLr1QWtiDtsIXlIYwWm91dwKoO900I3P8zNZitRpnXb2/f
	 E0DJ1wY7qx4BEGWHzlB3uuPvQ81ye7wOyrHZ9Kxn3q99v4M7j4l8hPnfSwBfDd3y7VQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lst.de;
	spf=pass smtp.mailfrom=lst.de;
	arc=none smtp.remote-ip=213.95.11.211
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B61606A31A
	for <fsverity@lists.linux.dev>; Tue, 27 Oct 2026 15:08:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4B61606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 4991F68C7B; Tue, 27 Oct 2026 16:08:11 +0100 (CET)
Date: Tue, 27 Oct 2026 16:08:11 +0100
From: Christoph Hellwig <hch@lst.de>
To: Eric Biggers <ebiggers@kernel.org>
Cc: fsverity@lists.linux.dev, linux-ext4@vger.kernel.org,
	linux-btrfs@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
	stable@vger.kernel.org
Subject: Re: [PATCH] fsverity: Set S_VERITY only after rollback is no
 longer possible
Message-ID: <20261027150811.GC14436@lst.de>
References: <20261025204807.122875-1-ebiggers@kernel.org>
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
In-Reply-To: <20261025204807.122875-1-ebiggers@kernel.org>
User-Agent: Mutt/1.5.17 (2007-11-01)

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

