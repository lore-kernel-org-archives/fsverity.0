Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.95.11.211
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795220768;
	b=FjCQTlv1k2bUU2we5iE3IGCkYvT+ysBjIqPJ3A+ZI10RknvfuNaUDjjfvKuhz66d7Emq
	 x4Q0U+nzbZdgrPY9bHHo+4cP96tlryHXKwv7RMl78xERUW2j8Ug+giqMk//1+wSecnyRg
	 sXQtZ37DL85Agfwj1ZLoa1wMzE7agLn5RcpUQ9lnoszukDv8XxnT9xobQPs/c3++bWs5o
	 hofE21P5Hym8oxdBtBIeQBu8zXveqiP6SoHnZZ1Pb1lAx8TIEnDSgIwlaj9GGwNr7+5br
	 Lho0gk5rDD1q52xXqamEXn97+avMYXodZHWpfVPDb6tvazSVMM35lg2p7eZg/q0Mgow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795220768;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=ThNZU9cuErcDQGfQdOdRvkQ5CunsbVsQnEjFJ3qGiuE=;
	b=OsOAjfpO88o4OT6dZvjN5o1IjuPKDohAWgkNfIpsHdE+eY/nAnPaGCO30JiPw4MoAdY1
	 qLnfd/FfJjv04rk2YFfH6Zkub4sRRPKH16Tuy0b0st6gnXsO14xgutvtv0vFQk6GGSiem
	 hVXc3CQpwPmgEWifzE1IFmIijCdGrWe5yct9qYOJPJeCXVSqQxGqvwZVuGPaJ/HjRhpNu
	 AuUShEac7K/0cUsPMWwxL3v4WwBun0zWdi7REc55sQ7lvPRiH6Ou8ppYM4G46Slb1mpMG
	 J87EPPsdh6i3HjH7mX5A/mAYUif5dpK8z3Jevp74N3oiZ6oyX+rwPcjClXBzWuiJ0aQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lst.de;
	spf=pass smtp.mailfrom=lst.de;
	arc=none smtp.remote-ip=213.95.11.211
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282A2606A68C;
	Sat, 21 Nov 2026 00:26:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 282A2606A68C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 7FA5F6732A; Sat, 21 Nov 2026 01:26:02 +0100 (CET)
Date: Sat, 21 Nov 2026 01:26:02 +0100
From: Christoph Hellwig <hch@lst.de>
To: sashiko-reviews@lists.linux.dev
Cc: Andrey Albershteyn <aalbersh@kernel.org>,
	Eric Biggers <ebiggers@kernel.org>, Christoph Hellwig <hch@lst.de>,
	Carlos Maiolino <cem@kernel.org>,
	fsverity <fsverity@lists.linux.dev>, david@fromorbit.com
Subject: Re: [PATCH v19 05/15] xfs: handle fsverity I/O in write/read path
Message-ID: <20261121002602.GB13395@lst.de>
References: <20261120155752.192025-1-aalbersh@kernel.org> <20261120155752.192025-6-aalbersh@kernel.org> <sashiko-outbox-225565@kernel.org>
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
In-Reply-To: <sashiko-outbox-225565@kernel.org>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Fri, Nov 20, 2026 at 04:27:02PM +0000, sashiko-bot@kernel.org wrote:
> [Severity: High]
> Will iomap_writeback_folio() skip dirty fs-verity metadata folios before
> xfs_map_blocks() can set IOMAP_F_FSVERITY?
> 
> xfs_vm_writepages() zero-initializes wpc.ctx.iomap.flags (and
> xc.ctx.iomap.flags on zoned filesystems), and iomap_writeback_folio()
> calls iomap_writeback_handle_eof() before ->writeback_range() invokes
> xfs_map_blocks().  When a dirty fs-verity folio past i_size is reached,
> wpc->iomap.flags still lacks IOMAP_F_FSVERITY, so
> iomap_writeback_handle_eof() returns false and the folio is skipped with
> its dirty bit cleared and its delalloc extent unconverted.
> 
> Also, in xfs_zoned_map_blocks(), the non-hole path calls
> xfs_iomap_set_anon_write(), which overwrites wpc->iomap.flags with
> IOMAP_F_ANON_WRITE | IOMAP_F_DIRTY and drops IOMAP_F_FSVERITY.

Yeah.  This was kinda why I wondered if an inode flag would do
better for this.

> > +xfs_iomap_is_fsverity_metadata(
> > +	struct xfs_inode	*ip,
> > +	loff_t			offset)
> > +{
> > +	return offset >= xfs_fsverity_metadata_offset(ip) &&
> > +	       (fsverity_is_building(VFS_I(ip)) || fsverity_active(VFS_I(ip)));
> > +}
> 
> [Severity: High]
> Does calling fsverity_is_building() here break the build?  Neither
> linux/fsverity.h nor xfs_verity.h declares or defines
> fsverity_is_building(), so compiling fs/xfs/xfs_iomap.c fails with an
> implicit function declaration error.

It might make sense to include the core fs/fsverity patches in the series
so that human and less humane reviewers have the full context.

