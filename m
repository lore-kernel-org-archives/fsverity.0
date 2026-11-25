Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.95.11.211
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795587365;
	b=0BEQf7J2sSJPRWvhYZkxl3i3FKgDC91T7ebkAzhhQ3xSiRvVx9X3xFAjZw8loggc4Q+0
	 VeMG177r3ySvwImbaMUyG/idOuzNUK/37lvN9BqQGRkefiRWlPkuGQuFzXnS6vL4+hELk
	 eNYIsWRLsM8NnKvMU41jRsBDEgcu/sKASGHKz6CFvzvLRx2UBDEnQz019ntIpxJJDSE4F
	 x/Ql596JRe6v+BccJ+7Cugp4DnfQ3rPRm7biZh8u0oFCrikV5eQOjubo+86tbFaq6sDyn
	 uI9+ZxnhAnRja0ss8To1K2GWbfWjkly5gn/PkQ4dnXuJ+TJl/75JmA8UQr3bMiWD3Aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795587365;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=ytCkvKWImMchISbudsB2LLM+jbU+ELfGkaAp9hL16aA=;
	b=N+NMicCQL06N/xpjQWc4XpabdclgJ99Rk4tC3S4aJXcj5DFY7fct3wIVgs7lBQwhSohY
	 xAx9xHRMGNPg9ghnnBYMawyCzInH25D2DY+9opncXXrTNQsTtMKEoDdFrNr31yto0YERA
	 zSGRaBC+NBulB9PnJcrdMtnk5vGAwAkyXXWuP31nQdTad+H4RlPT5f2nA1js7wTsmKR4R
	 K2o9zC8IE6mbEYRwFq8cfLE76C+viOhNnrg5aCnBxHE3tnMa2r/h3e/XMngJlpbGDocbT
	 mwOpkQpq+gci0Tl/fqGSUACqS4gcV+5G2zEGBNmdIeDGTKdqNRm49pmA6tlD9vJ6Yug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lst.de;
	spf=pass smtp.mailfrom=lst.de;
	arc=none smtp.remote-ip=213.95.11.211
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A87E0606D329;
	Wed, 25 Nov 2026 06:16:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A87E0606D329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 3E5D968AFE; Wed, 25 Nov 2026 07:16:01 +0100 (CET)
Date: Wed, 25 Nov 2026 07:16:00 +0100
From: Christoph Hellwig <hch@lst.de>
To: Andrey Albershteyn <aalbersh@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, sashiko-reviews@lists.linux.dev,
	Eric Biggers <ebiggers@kernel.org>,
	Carlos Maiolino <cem@kernel.org>,
	fsverity <fsverity@lists.linux.dev>, david@fromorbit.com,
	"Darrick J. Wong" <djwong@kernel.org>
Subject: Re: [PATCH v19 01/15] xfs: introduce fsverity on-disk changes
Message-ID: <20261125061600.GB20968@lst.de>
References: <20261120155752.192025-1-aalbersh@kernel.org> <20261120155752.192025-2-aalbersh@kernel.org> <sashiko-outbox-225564@kernel.org> <20261121002310.GA13395@lst.de> <awICI9nADM7ut-WK@aalbersh-thinkpadx1carbongen13.rmtcz.csb>
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
In-Reply-To: <awICI9nADM7ut-WK@aalbersh-thinkpadx1carbongen13.rmtcz.csb>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Sat, Nov 21, 2026 at 09:42:59PM +0100, Andrey Albershteyn wrote:
> On 2026-11-21 01:23:10, Christoph Hellwig wrote:
> > On Fri, Nov 20, 2026 at 04:26:31PM +0000, sashiko-bot@kernel.org wrote:
> > > [Severity: Medium]
> > > Does exposing FS_XFLAG_VERITY in xfs_ip2xflags() without allowing
> > > FS_VERITY_FL in xfs_fileattr_set() break FS_IOC_SETFLAGS on verity inodes?
> > > 
> > > When FS_IOC_GETFLAGS runs on a verity inode, xfs_fileattr_get() ->
> > > xfs_fill_fsxattr() -> fileattr_fill_xflags() translates FS_XFLAG_VERITY
> > > into FS_VERITY_FL in fa->flags.  When userspace such as chattr(1) modifies
> > > an unrelated flag (like FS_NOATIME_FL or FS_IMMUTABLE_FL) and writes the
> > > flags back via FS_IOC_SETFLAGS, xfs_fileattr_set() checks fa->flags against
> > > an allowlist that does not include FS_VERITY_FL:
> > 
> > Yeah.  ext4 just ignores flags like verity in fileattr_set.
> > Should we do the same here?
> 
> yes, fixed in the other patchset [1]
> 
> 1: https://lore.kernel.org/fsverity/20261120155032.187246-1-aalbersh@kernel.org/T/#m96800af1279dd56736b8199528c1c6238984e2f9

Please make sure to include everything the next version.  That makes
life so much easier when reviewing.

