Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.95.11.211
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795220596;
	b=siFrMeqWWcrl9cOaIHBQAfm2KUPumjvuIjLHrYH+gDkAwOb2frz5+YAFvNFCXhk74l7u
	 h1PpqmE3G2nrUeyL9fX/l1XiuSE2c+Wy4zrB1+qfEvoRPN0w3yvy1ChZhXm+gCQulQI9i
	 Vq/aQ5sWRTPAcPvEV+zYT4mrcMbzuK3tqpMYL33rT9ZgujIzOlDXdKBz9XZCeQmdH6lXS
	 keMaJgAEoFGAKM5gP6+25dVmYPSFy9suX9vtzMt0bc6qiWXIKryURcCfICAk1xjLsv1zA
	 brBqW8ejE3hbVQWJ+rbmy3LnOv4/7xqQmkOZ0DmUHRooaQnsaWuPLcWzkIwzX0mMCWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795220596;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=oTROBEkS4jp/BAlO096PVJlvcp+Cy1HGGGhYAwgCsHM=;
	b=qKPN38ve38lakZfSFv2DxpKBO4YexCVyOjAbyr5KU/aQGrsCHjpnZrOvuYMGilP/aLAB
	 Exsk78GGw5LcqwMUWrcfZ8rFlzDbKhK8B0QIjWEN1BpNc/aatB0C4zlDyclxWFMqw5+Jw
	 MmPoeKKU8yjzxPSCHYg0V0gPfEDpYyXwq7zmUsK9c3YXkaZgv7GSg93QIkBJjVZOU3Mek
	 jM9bvnvvRTlURUWhtwHY6SiRhPjnoeJVOZDmCsIfPpUfEqLSkIdw6pF5LKWkWJSKe3b/n
	 zEjfb4Bo4O1quJXOT6dTLKSIqzzEUDvect5sxjKyAIy3mNHeGK/JVkC/cfGIyw+9WHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lst.de;
	spf=pass smtp.mailfrom=lst.de;
	arc=none smtp.remote-ip=213.95.11.211
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79979606A32C;
	Sat, 21 Nov 2026 00:23:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79979606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id C757B6732A; Sat, 21 Nov 2026 01:23:10 +0100 (CET)
Date: Sat, 21 Nov 2026 01:23:10 +0100
From: Christoph Hellwig <hch@lst.de>
To: sashiko-reviews@lists.linux.dev
Cc: Andrey Albershteyn <aalbersh@kernel.org>,
	Eric Biggers <ebiggers@kernel.org>, Christoph Hellwig <hch@lst.de>,
	Carlos Maiolino <cem@kernel.org>,
	fsverity <fsverity@lists.linux.dev>, david@fromorbit.com,
	"Darrick J. Wong" <djwong@kernel.org>
Subject: Re: [PATCH v19 01/15] xfs: introduce fsverity on-disk changes
Message-ID: <20261121002310.GA13395@lst.de>
References: <20261120155752.192025-1-aalbersh@kernel.org> <20261120155752.192025-2-aalbersh@kernel.org> <sashiko-outbox-225564@kernel.org>
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
In-Reply-To: <sashiko-outbox-225564@kernel.org>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Fri, Nov 20, 2026 at 04:26:31PM +0000, sashiko-bot@kernel.org wrote:
> [Severity: Medium]
> Does exposing FS_XFLAG_VERITY in xfs_ip2xflags() without allowing
> FS_VERITY_FL in xfs_fileattr_set() break FS_IOC_SETFLAGS on verity inodes?
> 
> When FS_IOC_GETFLAGS runs on a verity inode, xfs_fileattr_get() ->
> xfs_fill_fsxattr() -> fileattr_fill_xflags() translates FS_XFLAG_VERITY
> into FS_VERITY_FL in fa->flags.  When userspace such as chattr(1) modifies
> an unrelated flag (like FS_NOATIME_FL or FS_IMMUTABLE_FL) and writes the
> flags back via FS_IOC_SETFLAGS, xfs_fileattr_set() checks fa->flags against
> an allowlist that does not include FS_VERITY_FL:

Yeah.  ext4 just ignores flags like verity in fileattr_set.
Should we do the same here?

