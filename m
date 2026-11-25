Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.95.11.211
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795587323;
	b=pWW3FTlkrsePsC5s+SAHTdJq7v2uos9g7KSZhra/IAu2WHOk2gq1mo7amqsa+eG4J6KU
	 EyEYRcPSGIO9Uq3dFHBD1YntSbZo3PnV8B6PtaGW5s7rgOxuNFRdO5h1Jb22bz1Ou0xit
	 nVYRqbAn0ydp7VD3ufuTaPHbgGKtSQNSOKK9HOVx1KfaQ7AK3cuCbucvpIlhrnyYTJ42y
	 gSsIR921Io55cVYRsIs9n26Zwux82oUfdZxCKEnNKnzwW446fp267s/sGSyxoHKGWAI1r
	 LHSwYhpArKazPwmGF8qdSRpX/nRq2MFfFP4JImypdk/IvP53gwU41D+SracUKgZ+B9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795587323;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=NyBEkyX9o3D+pdef06Am3ZG9CfJn14n9ZSDQru8xKiM=;
	b=4O6djjE+CQbdASHmnJplcao6fyZpfO/tnJTK8NObCgPdLyW5+hzpHA3tviU5Y9MefMpL
	 4My3NezBMPjVF0HGFUF0mlzMohFhbGVpRklZXvM3Pjrxg3UEblXZ6evo6FBwMS+QmPgf9
	 FuB722S3AhUbTJ1+JuEW70dRjf8h2oLP/9IzEumom/VuN4ApBCeC6DQWhfTMjMWZki9QD
	 SlVtYnVIRSbmMonbnfm2wq/VwZLETMWvqhPjay0K8kJjOwwIw07fwM6nO7QGI+KD2ha/2
	 b+cAszOwkj71Kp4iA4oTWDUQ4/+Hl5LYLOqdFFKcnzB0JpI+VI+K0dpo/L0vuwg3PBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lst.de;
	spf=pass smtp.mailfrom=lst.de;
	arc=none smtp.remote-ip=213.95.11.211
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FCBA606A327;
	Wed, 25 Nov 2026 06:15:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FCBA606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 38C2368AFE; Wed, 25 Nov 2026 07:15:18 +0100 (CET)
Date: Wed, 25 Nov 2026 07:15:17 +0100
From: Christoph Hellwig <hch@lst.de>
To: Andrey Albershteyn <aalbersh@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, sashiko-reviews@lists.linux.dev,
	Eric Biggers <ebiggers@kernel.org>,
	Carlos Maiolino <cem@kernel.org>,
	fsverity <fsverity@lists.linux.dev>, david@fromorbit.com
Subject: Re: [PATCH v19 05/15] xfs: handle fsverity I/O in write/read path
Message-ID: <20261125061517.GA20968@lst.de>
References: <20261120155752.192025-1-aalbersh@kernel.org> <20261120155752.192025-6-aalbersh@kernel.org> <sashiko-outbox-225565@kernel.org> <20261121002602.GB13395@lst.de> <awQVBBV4en5undcp@aalbersh-thinkpadx1carbongen13.rmtcz.csb>
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
In-Reply-To: <awQVBBV4en5undcp@aalbersh-thinkpadx1carbongen13.rmtcz.csb>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Mon, Nov 23, 2026 at 11:39:35AM +0100, Andrey Albershteyn wrote:
> > > Also, in xfs_zoned_map_blocks(), the non-hole path calls
> > > xfs_iomap_set_anon_write(), which overwrites wpc->iomap.flags with
> > > IOMAP_F_ANON_WRITE | IOMAP_F_DIRTY and drops IOMAP_F_FSVERITY.
> > 
> > Yeah.  This was kinda why I wondered if an inode flag would do
> > better for this.
> 
> Note, I added a guard against using fs-verity on zoned in v19 for now.
> 
> Previously, I thought that zoned allocation happens in iomap_begin()
> but it's obviously not, sashiko pointed out that I don't allocate
> any space.
> 
> I have a patch with added branches in write path with zone
> allocations (see below) but I decided to leave it out for follow-up
> patchset; for this patchset to get in some mergable state. And zoned
> setup probably need more testing, I just did -g verity on -r zoned.

I'm fine with delaying zoned support, although that wasn't really
what I suggested above.  I was hoping we could get rid of the
IOMAP_F_FSVERITY as most of this should be covered by the inode flag
now.  Or am I missing something?

