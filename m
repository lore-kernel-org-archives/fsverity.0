Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.95.11.211
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793865169;
	b=NTa1P7scHdjEQW88YZDE/fzqpKnPxFqZP8tdg56JPc84l2g3VW1i3fhT6UsRv+4KyeVn
	 XS52jRWc/OKyqoCFMezwDubWjF22qJQ8WR6r7mrLSuGNo5NGWKVFMbf7LXy6Q+WJGZf2O
	 5vgCdR7nQSpzJg1bTydpLCe1zvBcVVW9/Wgt25EoofMmnw1TzX/RMoLJZNHww6Wy5tpYt
	 TX8IXotzFHwgIJnAziIvZPyFXuRm1XY6kaZ5LuqS+mPAjol06JakW1LgYOmSKxJtTc1d+
	 CDDgv6/DaykDMozw0RKODAIwFC900h/PSz4tZz5y0jiJGpZFI4yooLel/4bCKFFGtXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793865169;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=hzbANlYHtH0nKEF4umY8/K7880JB3GR2byaY0YcD/Jc=;
	b=3dwMrVNpnO+p0OIoH84MxWThbmDx0+N6uDghB6GzLIXv2SdorXShxD3F8m1ZnrwONt12
	 EvVhlLyEZ8GvxnbB0G1CcW05ukXYSzQrF/xqVNUcQEe8/lJvOKCkLugj0SFT7UUYZ/rCn
	 Vb1OYbffmcSfkApg8fc5z+ZN89pXEFr8okoi4bWIXcO0Ut2cVnqjOsCMBXQUV9cZePfVd
	 HSMc+pLQM7gvb/dKwS6+MUyOtyUgNyhLfp5pVzXKHG1pJx1o1yoRAsb62NIk1D70eoClF
	 XlGe+ahloCyMh4Ym5cgA6kFghteH2kmmdpSz1KJidjgtxnUWFNcxS/uLujgkQvfb6dQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lst.de;
	spf=pass smtp.mailfrom=lst.de;
	arc=none smtp.remote-ip=213.95.11.211
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5D0606D803
	for <fsverity@lists.linux.dev>; Thu,  5 Nov 2026 07:52:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C5D0606D803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id DBB1668BEB; Thu,  5 Nov 2026 08:52:44 +0100 (CET)
Date: Thu, 5 Nov 2026 08:52:44 +0100
From: Christoph Hellwig <hch@lst.de>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Andrey Albershteyn <aalbersh@kernel.org>, hch@lst.de,
	fsverity@lists.linux.dev, linux-xfs@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	linux-ext4@vger.kernel.org
Subject: Re: [PATCH 0/5] fsverity: lift ioctl() input masking and runtime
 inode flag to VFS
Message-ID: <20261105075244.GB17923@lst.de>
References: <20261104194618.103332-1-aalbersh@kernel.org> <20261104215749.GA3648616@google.com>
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
In-Reply-To: <20261104215749.GA3648616@google.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Wed, Nov 04, 2026 at 09:57:49PM +0000, Eric Biggers wrote:
> Changes to 'struct inode' should be Cc'ed to linux-fsdevel as well.

Yes.  Except for that and the two btrfs/f2fs issue reported by Sashiko
this looks sane.  Please try to do a full fsverity xfstests run for
all the touched file systems.

