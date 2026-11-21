Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795293783;
	b=VmCRbs22wF0jOIO6ELkIe/jYc4suCtamu5Zg+wRbd+eos3KgZOp0EabX9HmNGfcjBAQf
	 GMXG1j+d3oZWg61WHa41I+YecBmLIyzXdrhfcNeHmYi65//8SAsIqfzbn4V+7kca6t+To
	 qQStzXUuRH7Vg1MuYsnxRoxpeUXniijBuCN9Q0TT/5rou30Jv8Z/IsArYCcpAgElIyAwP
	 en9a4jJ5NgyUBpZYJfk8KsOLCW8+23Uh9s4X1IxJciSi1klNRL9LOaukumZTnhyp6CZxN
	 LOTX3ubgku5OnTUGmecu0UwnJNdD+RT0+s+rYhtiJf457IVaDky/31rX7EGkGEViytA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795293783;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=1mTz+iq1JvtnlpF25oXq0EGohNT4kPJ7oLTXbtROTFU=;
	b=5RRJu86VX+y4gIaIXDs6nHmT7Q5LWWwEypWcmclLl5b1OuSz44fGuVA68+WPl/A4o06P
	 9jrW0aalemk67ikoRk0t1PgaJzTTPuBG0kh/CegE71VT+7T0WrWmCakk2R3vxlET0dZdz
	 9ecTHJxcel17siEDK9VtYXHekOTZa7dxJ7QP1h36yZ35p43HJ0DAlRqUf4ZSSrSB17Q0n
	 BJuPRvfaBBfddMRAELTInymz2FIlN+9Tv0elG/+R3CY9hWiw+bIp4dSojlMPP99WCwbq+
	 vwf8fDYOSEAbRDnkeYewvM65Qbvd/A+cJf7HvpPVSqv3a5vEH34yhg4jNHBNEX0yLVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xo4Czx09;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC7FA606A32A;
	Sat, 21 Nov 2026 20:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xo4Czx09
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A29521F000C4;
	Sat, 21 Nov 2026 20:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795293783;
	bh=1mTz+iq1JvtnlpF25oXq0EGohNT4kPJ7oLTXbtROTFU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Xo4Czx09VIXm73PY4EJUmTgx1okzuOhWQVl2ccsGH9q/cDCE5tGywjYHXa4BotbMa
	 5eDkXNeaynfD4vOijAt0q9brvj4Fei6vCJhSs6U75F9IBPNX2ouHIkSeFC41/gqw32
	 CpVyRACX/tuUSJlbAPKTSanWCw7+mqI5/R43OE4M5MHbNKYRmggRQ502Us1dCuXQO9
	 uuOL3gzctOusFG2gz+DNxiApT/d09mjEKh2Qcuxi5QvEed9wMckuIUeBG/wpcoH0t+
	 kTZLgoSN29Fz1wEcuf7dJpG/BFzc+56rwS//ZiWaEBoYGFwfoZZ3ACvnGei2vRAM3m
	 F83n7RDMWPVqA==
Date: Sat, 21 Nov 2026 21:42:59 +0100
From: Andrey Albershteyn <aalbersh@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: sashiko-reviews@lists.linux.dev, Eric Biggers <ebiggers@kernel.org>, 
	Carlos Maiolino <cem@kernel.org>, fsverity <fsverity@lists.linux.dev>, david@fromorbit.com, 
	"Darrick J. Wong" <djwong@kernel.org>
Subject: Re: [PATCH v19 01/15] xfs: introduce fsverity on-disk changes
Message-ID: <awICI9nADM7ut-WK@aalbersh-thinkpadx1carbongen13.rmtcz.csb>
References: <20261120155752.192025-1-aalbersh@kernel.org>
 <20261120155752.192025-2-aalbersh@kernel.org>
 <sashiko-outbox-225564@kernel.org>
 <20261121002310.GA13395@lst.de>
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
In-Reply-To: <20261121002310.GA13395@lst.de>

On 2026-11-21 01:23:10, Christoph Hellwig wrote:
> On Fri, Nov 20, 2026 at 04:26:31PM +0000, sashiko-bot@kernel.org wrote:
> > [Severity: Medium]
> > Does exposing FS_XFLAG_VERITY in xfs_ip2xflags() without allowing
> > FS_VERITY_FL in xfs_fileattr_set() break FS_IOC_SETFLAGS on verity inodes?
> > 
> > When FS_IOC_GETFLAGS runs on a verity inode, xfs_fileattr_get() ->
> > xfs_fill_fsxattr() -> fileattr_fill_xflags() translates FS_XFLAG_VERITY
> > into FS_VERITY_FL in fa->flags.  When userspace such as chattr(1) modifies
> > an unrelated flag (like FS_NOATIME_FL or FS_IMMUTABLE_FL) and writes the
> > flags back via FS_IOC_SETFLAGS, xfs_fileattr_set() checks fa->flags against
> > an allowlist that does not include FS_VERITY_FL:
> 
> Yeah.  ext4 just ignores flags like verity in fileattr_set.
> Should we do the same here?

yes, fixed in the other patchset [1]

1: https://lore.kernel.org/fsverity/20261120155032.187246-1-aalbersh@kernel.org/T/#m96800af1279dd56736b8199528c1c6238984e2f9

-- 
- Andrey
