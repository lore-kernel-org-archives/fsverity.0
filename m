Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 224DE35505B
	for <fsverity@lists.linux.dev>; Mon, 19 Jan 2026 09:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768814876; cv=none; b=NYgADO2MiK4RA1Ho61NevEJH0YFAx5VEW/Z05m08wKGU471Ym9Jxdaf/bNvNu3sOqkwb6RiZ2rekPVTf+gyMj7DX0i8hhdn4AxlKS/+/Zh2r39YtTsD6VVvRgnMR3GM/E+7DVd0YpsTAEUkxPo8tVRIc/Ut43czObAYmywbDD5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768814876; c=relaxed/simple;
	bh=sh0TkxkEOKhDl2DVrl4mw+NTqDA2lqqTM0EYMUUo+sI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KUG5o7QjV0afPhy3N3GQ8Rh8pJThDz3SNPdiZWje8QckDSfeMgIqMwelf5rm+WAN1OmkFADMBpFs4ZfvSFOzZoZLZLWEoZjui7QoNjT/JNQDccuYPKJ/eQ3pKbnmpxcdmcliHkYH4sO846B87zvV7nC07GJqfX8RRmxJ3XuPeBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 7696C227A88; Mon, 19 Jan 2026 10:27:49 +0100 (CET)
Date: Mon, 19 Jan 2026 10:27:48 +0100
From: Christoph Hellwig <hch@lst.de>
To: Jan Kara <jack@suse.cz>
Cc: Christoph Hellwig <hch@lst.de>, Eric Biggers <ebiggers@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	David Sterba <dsterba@suse.com>, Theodore Ts'o <tytso@mit.edu>,
	Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
	Andrey Albershteyn <aalbersh@redhat.com>,
	linux-fsdevel@vger.kernel.org, linux-btrfs@vger.kernel.org,
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	fsverity@lists.linux.dev
Subject: Re: [PATCH 4/6] fsverity: use a hashtable to find the fsverity_info
Message-ID: <20260119092748.GA10125@lst.de>
References: <20260119062250.3998674-1-hch@lst.de> <20260119062250.3998674-5-hch@lst.de> <z4652hoxetll645hgpfuhy3pogm5y32ealgydlaz4kwve6qc2g@bl6ilzut2ybp>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <z4652hoxetll645hgpfuhy3pogm5y32ealgydlaz4kwve6qc2g@bl6ilzut2ybp>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Mon, Jan 19, 2026 at 10:21:00AM +0100, Jan Kara wrote:
> OK, but since __fsverity_get_info() is just rhashtable_lookup_fast() what
> prevents the CPU from reordering the hash table reads before the S_VERITY
> check? I think you need a barrier in fsverity_get_info() to enforce the
> proper ordering. The matching ordering during setting of S_VERITY is
> implied by cmpxchg used to manipulate i_flags so that part should be fine.

Yes, probably.

