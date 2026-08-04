Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70EC44ADD8C
	for <fsverity@lists.linux.dev>; Tue,  4 Aug 2026 17:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785865432; cv=none; b=bD7rsiQXsWkzeZzYQLAVt/YxvO1p18oAcgLZCsd/2bFDYKWbVPjmE+QqfC810WYYx0/bkZhNc3+8LRRxEhraLcINDi+4Yzhd2kLK5MgDbyLU5SOvGvDj1LUbi2C0CnmFtBzQ/DRsYI6J0r7+yX3JQZ8pbgXYqdrNgkxLAEpeKTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785865432; c=relaxed/simple;
	bh=NxGVmzuUM25d1cHXaLgUR7DeLjHeQXw5xmNSdkgqV20=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b0ubsvTR5mSeYsY3FhLVoP0lvESC/SFIhaPZ1M/mqDDyA1nc+SPt0tKfouK4rcjucR6/AMVNRaiVArUld5K48jzPfcxrCZ5H0ACMSeZR501j5utP4fIqbBLw0+ZgmimLxK8XpQEE7l/g5N/rYwMAIQA/OOjMWgQx4eI65E+9R5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 02A256732A; Tue,  4 Aug 2026 19:43:48 +0200 (CEST)
Date: Tue, 4 Aug 2026 19:43:47 +0200
From: Christoph Hellwig <hch@lst.de>
To: Andrey Albershteyn <aalbersh@kernel.org>
Cc: linux-xfs@vger.kernel.org, fsverity@lists.linux.dev,
	linux-fsdevel@vger.kernel.org, ebiggers@kernel.org, hch@lst.de,
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	linux-btrfs@vger.kernel.org, djwong@kernel.org
Subject: Re: [PATCH v14 11/21] xfs: don't report dio_mem_align and
 dio_offset_align for fsverity files
Message-ID: <20260804174347.GC14046@lst.de>
References: <20260803200820.393203-1-aalbersh@kernel.org> <20260803200820.393203-12-aalbersh@kernel.org>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260803200820.393203-12-aalbersh@kernel.org>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Mon, Aug 03, 2026 at 10:08:01PM +0200, Andrey Albershteyn wrote:
> Sashiko.dev reported that while fsverity files falls back to the
> buffered IO for Direct I/O, they should not report non-zero values in
> dio_mem_align and dio_offset_align, meaning it's not supported.

This doesn't make much sense to me.  If we didn't want to report
we'd also want to not set STATX_DIOALIGN | STATX_DIO_READ_ALIGN.
But in the end there is very little upside of this while adding
extra special cases.

