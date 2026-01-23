Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC75A35292E
	for <fsverity@lists.linux.dev>; Fri, 23 Jan 2026 05:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769145147; cv=none; b=Nc32OkEzeEsLANjiPLQGSeik4kunyDW6EKk6xHf6RnfOVO265bMqBoGRS6cIT0QORDMQw9f8r0NjLNERrqdydlGnVhGY5nfyF1UZR1fH5lXknFA7DqRkzOoidFfW8OEIWuC7R8BvXTxfpHH/nA2IgGuGq9mYOAqv0ajaAIRPtGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769145147; c=relaxed/simple;
	bh=f9ZY//WP7sMGr4/l+Rf2qgx5FluM0DH8X2K6UdTQ70U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JWb9T1I2dafwUy1ofgGrJM1qDu4ZsezmEvnS/5LvUg8h4dEq9Xp+b/5bw0ca2LkoJ6gCGzX4UAZik+urAhauaEJq7CKU2z4ufjnQRBV2Arv8jxsqH2dd9aYDzv7GV72EIDz10VmAIIl8ytK/0kMHmrgnnXSpl+5LlKaY9eZH83w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id A85EC227AA8; Fri, 23 Jan 2026 06:12:16 +0100 (CET)
Date: Fri, 23 Jan 2026 06:12:16 +0100
From: Christoph Hellwig <hch@lst.de>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, t@magnolia.djwong.org,
	Eric Biggers <ebiggers@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	David Sterba <dsterba@suse.com>, Theodore Ts'o <tytso@mit.edu>,
	Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
	Andrey Albershteyn <aalbersh@redhat.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	linux-fsdevel@vger.kernel.org, linux-btrfs@vger.kernel.org,
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	fsverity@lists.linux.dev
Subject: Re: [PATCH 04/11] fsverity: start consolidating pagecache code
Message-ID: <20260123051216.GA24123@lst.de>
References: <20260122082214.452153-1-hch@lst.de> <20260122082214.452153-5-hch@lst.de> <20260122212700.GD5910@frogsfrogsfrogs>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260122212700.GD5910@frogsfrogsfrogs>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Thu, Jan 22, 2026 at 01:27:00PM -0800, Darrick J. Wong wrote:
> Nice hoist, though I wonder -- as an exported fs function, should we be
> checking that the returned folio doesn't cover EOF?  Not that any of the
> users actually check that returned merkle tree folios fit that
> criterion.

As in past i_size because this is verity metadata?  I think per the
last discussion that's only guranteed to be true, not the folio.  It
might be useful to assert this, but it might be better for combine
this with the work to use different on-disk vs in-memory offset
and to consolidate all the offset magic.  Which is worthwhile,
but І don't really want to add that in this series.

