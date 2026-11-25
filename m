Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795596678;
	b=yqs/FukRE52/d2OxGd4fEy2Zk5hrcmUV5L2CIW0KjEInfSSRcVEIRWdQ1cKuM6D/V7Mf
	 NDfz/6krnW44P5SBUOPIGOtg12xqDPlvaLe3YQm55Qa64epxQrWgdV1rhxUC1tImlYuNS
	 4f3BaLS2SDslMvElij7PWY5ApRa8NrvObV/dsaBBVkGJvXL1UoGR5h13ThXzRYmA2bMhV
	 98vxPR+Pp4GZeSNR396y6723euN6v6JGRc2KEKY3a8/C25ak+61qKUlqvYbZAN7SahDt1
	 pGhSDOral1CWYrbYd1ziLMwLyApw7un4OK3FUnyPoBHe98L0cgTDdvoIKeztiqm9KhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795596678;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=kUxmD3O0e6bplmCqlY/rbyMbAFW3h8LIYJ4umDO8GLE=;
	b=n5ekgZQFc89VI0AbM70YpxlEedP7g/TTExYKJNlH2Ppjy5Dta+9qmUgjzwGESvtt24P7
	 n/nJI3DQZHKfq0dIbFBf5DcXPb75jtvpV0JKh9KS68Qxb+1SE6etcJUC+0ClD11yccJ4w
	 zgD4oDkrsZ9hAQi4jHjz2unykMKNNjdU8lwTUQI4WqE3ywcYaCvHjd/UXXV+S7wjZvIRz
	 eb50SI0e44iOOgyLWeocvvBjaVSPSfILepvVb+mo7LOPUG0YlOjLZPZQhsczKywHYZmzz
	 GphkyZ1yI1cbJCHmHhP3VHCacUHmVfwxWuu/1XNmyHeY/jl1WZDcLOIveJCCgc7xFFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RUUn0ERL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15DB8606A31E;
	Wed, 25 Nov 2026 08:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RUUn0ERL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 104F61F000C4;
	Wed, 25 Nov 2026 08:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795596677;
	bh=kUxmD3O0e6bplmCqlY/rbyMbAFW3h8LIYJ4umDO8GLE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RUUn0ERLeyRLd0PVNxUg+9/o5xvXnVS+fCQ5TIcYojSXfDqAqbyQHK6FhSIqo3tlO
	 X7iodjYQArDgm3AdcNUp4a5IwD2blXo+crFgIKacidzS86qhkgWMJZRaDivvQi0BNh
	 4Yeuy//zdOgMRY4hlYVnoOLGTTANv0IXlRHori3B/Kvss3guzu5MgGU26JrElEsS2M
	 dZ9PlzgkS8z97suJjs/m1pcIiwiPWwDZo517f+zU8hj4/GLEmlzsLQ2HimZbFpda9V
	 9IK+PMl2AgGOuf0h1CGumyf0okAG1zffwfliVX/E8zxDIZ44hwO76igzD6vcdNF+2q
	 Jp3F05dbwnDTA==
Date: Wed, 25 Nov 2026 09:51:13 +0100
From: Andrey Albershteyn <aalbersh@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: sashiko-reviews@lists.linux.dev, Eric Biggers <ebiggers@kernel.org>, 
	Carlos Maiolino <cem@kernel.org>, fsverity <fsverity@lists.linux.dev>, david@fromorbit.com
Subject: Re: [PATCH v19 05/15] xfs: handle fsverity I/O in write/read path
Message-ID: <awaftWKo68Vz4f0G@aalbersh-thinkpadx1carbongen13.rmtcz.csb>
References: <20261120155752.192025-1-aalbersh@kernel.org>
 <20261120155752.192025-6-aalbersh@kernel.org>
 <sashiko-outbox-225565@kernel.org>
 <20261121002602.GB13395@lst.de>
 <awQVBBV4en5undcp@aalbersh-thinkpadx1carbongen13.rmtcz.csb>
 <20261125061517.GA20968@lst.de>
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
In-Reply-To: <20261125061517.GA20968@lst.de>

On 2026-11-25 07:15:17, Christoph Hellwig wrote:
> On Mon, Nov 23, 2026 at 11:39:35AM +0100, Andrey Albershteyn wrote:
> > > > Also, in xfs_zoned_map_blocks(), the non-hole path calls
> > > > xfs_iomap_set_anon_write(), which overwrites wpc->iomap.flags with
> > > > IOMAP_F_ANON_WRITE | IOMAP_F_DIRTY and drops IOMAP_F_FSVERITY.
> > > 
> > > Yeah.  This was kinda why I wondered if an inode flag would do
> > > better for this.
> > 
> > Note, I added a guard against using fs-verity on zoned in v19 for now.
> > 
> > Previously, I thought that zoned allocation happens in iomap_begin()
> > but it's obviously not, sashiko pointed out that I don't allocate
> > any space.
> > 
> > I have a patch with added branches in write path with zone
> > allocations (see below) but I decided to leave it out for follow-up
> > patchset; for this patchset to get in some mergable state. And zoned
> > setup probably need more testing, I just did -g verity on -r zoned.
> 
> I'm fine with delaying zoned support, although that wasn't really
> what I suggested above.  I was hoping we could get rid of the
> IOMAP_F_FSVERITY as most of this should be covered by the inode flag
> now.  Or am I missing something?
> 

This flag is also used in read path when entablement already done.
And as Eric and sashiko pointed out in the other patchset,
I_VERITY_BUILDING doesn't strictly require "no data I/O" during tree
building; this is done by XFS only. So, I think it's still needed.

-- 
- Andrey
