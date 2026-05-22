Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A97233945
	for <fsverity@lists.linux.dev>; Fri, 22 May 2026 12:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779451683; cv=none; b=GLv2ZaxySQjvvmT0O89kRODmHqMRg/t8r+1HwbT8PFERR0oN14RYb+iLFM4tIA6hOFz+ZZX/XX7mqBnakwdAGJ0458dcZJQH8APoI841f3MIl3XC61mTbS9I1xYyza6pkJh4+XmL4Lu3TPtwAOIC3GbaJ6+JrNNNaDLwgKRWaJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779451683; c=relaxed/simple;
	bh=atNXOnjiGYV5Attahdoy1UUe8z1fIMr0HTetf8oZSus=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UNiNwFG1v21/4QyNVciIRTfMoT9mT6hq011f5LVnCskSVkB8mfl2/eqGFGirWqtbdme9CB2daIOwfHwPwX68sO0TMZ8OsAsd66lgdz0CEK8enZCCMByUT9Bvw3rTjcw6U5D3sJ7mNEHTnD9INSAsXe9U1dx59L2O27MdAp2Lpfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id AE61C68CFE; Fri, 22 May 2026 14:07:57 +0200 (CEST)
Date: Fri, 22 May 2026 14:07:57 +0200
From: Christoph Hellwig <hch@lst.de>
To: Christian Brauner <brauner@kernel.org>
Cc: Carlos Maiolino <cem@kernel.org>,
	Andrey Albershteyn <aalbersh@redhat.com>,
	Christoph Hellwig <hch@lst.de>,
	Andrey Albershteyn <aalbersh@kernel.org>, linux-xfs@vger.kernel.org,
	fsverity@lists.linux.dev, linux-fsdevel@vger.kernel.org,
	ebiggers@kernel.org, linux-ext4@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, linux-btrfs@vger.kernel.org,
	linux-unionfs@vger.kernel.org, djwong@kernel.org,
	david@fromorbit.com
Subject: Re: [PATCH v10 00/22] fs-verity support for XFS with post EOF
 merkle tree
Message-ID: <20260522120757.GA21041@lst.de>
References: <20260520123722.405752-1-aalbersh@kernel.org> <20260521090705.GA14254@lst.de> <gcw7zcg6p4s2egpufwizfig72g6ren7jfmuz5mqskkpb7xepww@e3v35j7bk7dc> <ag7uW7KQ5mVyCGEv@nidhogg.toxiclabs.cc> <20260522-unbehagen-baumethode-erlesen-811a4065eeac@brauner>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260522-unbehagen-baumethode-erlesen-811a4065eeac@brauner>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Fri, May 22, 2026 at 12:03:20PM +0200, Christian Brauner wrote:
> > I was expecting this to come through xfs tree too if Eric and Christian
> > agree.
> 
> You may take it through the xfs tree if there are no conflicts with
> vfs-7.2.iomap. If there are I want to add the iomap changes into
> vfs-7.2.iomap that you can pull in.

Merging the iomap bits through the iomap branch might make sense, given
that iomap usually tends to see quite a bit of activity.
