Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.95.11.211
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793960822;
	b=Oqfe6fqOG7Ovd1PK/MsjRM+5SqmsGNPKzbNkHcOc83fe5iHYw3B9uGZZmRC76ElsQ/ou
	 DUKkmDIhY8ow7b9avnXBYlnu4GDUESq8IQQX7JWpC9QAJWwI1+nv6ariVvMls312hYBq6
	 Xt/x5++1zcUprZ9kkkkdHjGTgrY1zS41eMK0c5K68uWer1FXEtQ01xIV82htZGLMY3ppl
	 I5377ZglwkOiFP05TE7WZt914zsd+J1aGtfffI30UM+A1Qivk7JlgqawP6TX8GL3LONBP
	 PkmrQ3ocgyE5XTWJllc+woqAd29rB7nMI8Kcp8uWOh5A2SUJZTk3WsC7Y38XtBIuvAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793960822;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=M7NmYC/Iylm9myghHwqILim55SAUt9QrM+UZYk0eJlw=;
	b=uSlBrkMLpW6wXbjbwwYDa2Yy9ZlvyJmKo8KViDt3fi5K15EPtXkg/UVpJIkupYNQAhLL
	 Rdk8UFBgFL5g7HTF2bRP5QFeunYP/fysMh4YHTGTl1/G8MLQ/hG/F54wDMjp5WG9x5PgG
	 WYUQ/KgUdUtsYoD3Q0aEeIu2iaEeoJ1qXvc1Ed09zk2Wo5ZQ+eP8BE9yWNGwse5BXZ3UF
	 rGIGl+w8GrRKCWtZy+2rDp6yrvUffXhsS3uWbj0LH0gmy3+isi9TRWE3JiWWfp7yl+Ptq
	 co9pz3ua+odcQW19fRFUHzJS98bzsyj+3SRRZiCYdzrrSymt10wPeewirqvk9+PtlTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lst.de;
	spf=pass smtp.mailfrom=lst.de;
	arc=none smtp.remote-ip=213.95.11.211
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16A44606A329
	for <fsverity@lists.linux.dev>; Fri,  6 Nov 2026 10:27:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16A44606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id C5F7F68BEB; Fri,  6 Nov 2026 11:26:58 +0100 (CET)
Date: Fri, 6 Nov 2026 11:26:58 +0100
From: Christoph Hellwig <hch@lst.de>
To: Andrey Albershteyn <aalbersh@kernel.org>
Cc: ebiggers@kernel.org, hch@lst.de, fsverity@lists.linux.dev,
	dsterba@suse.com, linux-xfs@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	linux-ext4@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	brauner@kernel.org, viro@zeniv.linux.org.uk, jaegeuk@kernel.org,
	chao@kernel.org, tytso@mit.edu
Subject: Re: [PATCH v2 3/5] btrfs: use I_VERITY_BUILDING instead of private
 flags
Message-ID: <20261106102658.GC5319@lst.de>
References: <20261105115532.613467-1-aalbersh@kernel.org> <20261105115532.613467-4-aalbersh@kernel.org>
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
In-Reply-To: <20261105115532.613467-4-aalbersh@kernel.org>
User-Agent: Mutt/1.5.17 (2007-11-01)

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

