Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16381ACED5
	for <fsverity@lists.linux.dev>; Fri, 23 Jan 2026 07:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769153435; cv=none; b=I0aEc9s6fJvAV8n87nkTZF3nWYvoR2k+vplY0tnwyI79nh+3bFYl0Ne+97AYEsbgPldcIlAgkm8qw+YtzrkCUNUHXkSWIbEtPfjrs7NZcvzQpTEsY5MuUwKR9acg2qhI9lI5vubZRg3kcjzBjF7MdRMU3BGnjAy0cVx09NU83MA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769153435; c=relaxed/simple;
	bh=7cs8KTtnIn7YUHI145cRhMX4l5zAigUfI//KElxOWLU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tRT3MYCQIwM2ZQ/0UcGI/QvwVDpCIzCx40cpeXEsRZfkfJq9caNlWI91BERnCcr5DNrHUfDQeXwMxvpa1b8e0PP9qUnl7GLyTZRNPv21X93cdoYbTImjBqYm5vWoQ4Ge77b4+z0QJe6bQ10NdbOB6td82b4Zs003KItxsca1uJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 93D62227AAE; Fri, 23 Jan 2026 08:30:25 +0100 (CET)
Date: Fri, 23 Jan 2026 08:30:24 +0100
From: Christoph Hellwig <hch@lst.de>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, Eric Biggers <ebiggers@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	David Sterba <dsterba@suse.com>, Theodore Ts'o <tytso@mit.edu>,
	Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
	Andrey Albershteyn <aalbersh@redhat.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	linux-fsdevel@vger.kernel.org, linux-btrfs@vger.kernel.org,
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	fsverity@lists.linux.dev
Subject: Re: [PATCH 11/11] fsverity: use a hashtable to find the
 fsverity_info
Message-ID: <20260123073024.GA27731@lst.de>
References: <20260122082214.452153-1-hch@lst.de> <20260122082214.452153-12-hch@lst.de> <20260122220420.GI5910@frogsfrogsfrogs> <20260123052723.GE24123@lst.de> <20260123072700.GN5910@frogsfrogsfrogs>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123072700.GN5910@frogsfrogsfrogs>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Thu, Jan 22, 2026 at 11:27:00PM -0800, Darrick J. Wong wrote:
> > rhashtable_lookup_fast returns the struct containing the rhash_head.
> > The paramters store the rhead_offset for that purpose.  See rht_obj
> > as used by rhashtable_lookup.
> 
> Ahah.  That's right, but (imo) a weird quirk of the rhashtable
> interface.  Though I only say that because *I* keep tripping over that;
> maybe everyone else is ok.

I don't think it's a quirk.  It seems like an explicit design decision.
Not one I would have taken as I think doing a container_of in the caller
would be cleaner, but it is what it is.

