Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C0F1BD035
	for <fsverity@lists.linux.dev>; Mon, 11 Aug 2025 11:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754912770; cv=none; b=SeVrWqtLkAZxVvnwFctkssi9kdb2R1L0PTwbnniVDxi/D61TqNMLqfcM14k3MMavmNi8v6V13LbgtSn0jyTZuGUtnLDB0n6on+Xa/mbWuwmYXOni7GS3QGZfsKxL0jNNPqawzYQia/sqvzINPmbPST8KuWfZaAyLBGCSPUlgHBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754912770; c=relaxed/simple;
	bh=AGj83JSmx4WTFFvosyP53U7jrIvk/cdStHsWay2F2no=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YvtjbsokVh/VqmV5cajsUk7aLpc49ahPoQ9r51egKvFUQxGVMg7bMtMO5g5nKgUk3X8D0+JtKz22vJRfaS9mWvrdFMw7R8Wf1J9noEluZS5vL6x09J8MawnIVLjWGDlhuZ3vEqSrziWycWwxTNxJgGeGrtDT5Olw5nTwF7SCZg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 1F9C4227A87; Mon, 11 Aug 2025 13:46:04 +0200 (CEST)
Date: Mon, 11 Aug 2025 13:46:03 +0200
From: Christoph Hellwig <hch@lst.de>
To: Andrey Albershteyn <aalbersh@redhat.com>
Cc: fsverity@lists.linux.dev, linux-fsdevel@vger.kernel.org,
	linux-xfs@vger.kernel.org, david@fromorbit.com, djwong@kernel.org,
	ebiggers@kernel.org, hch@lst.de
Subject: Re: [PATCH RFC 06/29] fsverity: report validation errors back to
 the filesystem
Message-ID: <20250811114603.GB8969@lst.de>
References: <20250728-fsverity-v1-0-9e5443af0e34@kernel.org> <20250728-fsverity-v1-6-9e5443af0e34@kernel.org>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250728-fsverity-v1-6-9e5443af0e34@kernel.org>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Mon, Jul 28, 2025 at 10:30:10PM +0200, Andrey Albershteyn wrote:
> From: "Darrick J. Wong" <djwong@kernel.org>
> 
> Provide a new function call so that validation errors can be reported
> back to the filesystem.

This feels like an awfull generic name for a very specific error
condition.

> Signed-off-by: Darrick J. Wong <djwong@kernel.org>

Btw, this is missing a signoff from Andrey as the series submitter
needs to sign off after the author.

