Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F62D2DECBA
	for <fsverity@lists.linux.dev>; Tue, 27 Jan 2026 06:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769494557; cv=none; b=lT3ImOX6ys3rufWkFdBH6Z1/o7QOBO+94ZQFNZtaV2CzAM7KCaxzkZaqt9/KPAOYRnnVYczMbW2qmPBnDTawXUSR+VHJyX6tpTLykhVP+enJSK+ADs8C1kawozBcK+BJWc4zzouFROFTgkNS+Rc/qI19QkpNNZhBiL/0BCEdWU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769494557; c=relaxed/simple;
	bh=A+Qvt7PJ1zzJc5nC8vIE7nhGKBhLxaI43psasrisBGg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cdrmKRdtfSzSH1LmI7iR6KCcWbBy4SXeL+SPNCd/t2D8oSl9+GJvoc0/j9c1Z88iZ0fb6I8Chvn3RTb/qwcT7alvZVTjOnRxf4lUk44letigmGygRCyrSERZxjqMVa0b0j1zNYS6QULEbLxSSeIE4AjDcqH43l7bVNCpGoKoOYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 2F41D227AAE; Tue, 27 Jan 2026 07:15:52 +0100 (CET)
Date: Tue, 27 Jan 2026 07:15:51 +0100
From: Christoph Hellwig <hch@lst.de>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, Al Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	David Sterba <dsterba@suse.com>, Theodore Ts'o <tytso@mit.edu>,
	Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
	Andrey Albershteyn <aalbersh@redhat.com>,
	Matthew Wilcox <willy@infradead.org>, linux-fsdevel@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, fsverity@lists.linux.dev
Subject: Re: [PATCH 16/16] fsverity: use a hashtable to find the
 fsverity_info
Message-ID: <20260127061551.GA25522@lst.de>
References: <20260126045212.1381843-1-hch@lst.de> <20260126045212.1381843-17-hch@lst.de> <20260126204030.GC30838@quark>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260126204030.GC30838@quark>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Mon, Jan 26, 2026 at 12:40:30PM -0800, Eric Biggers wrote:
> On Mon, Jan 26, 2026 at 05:51:02AM +0100, Christoph Hellwig wrote:
> > The file open path uses rhashtable_lookup_get_insert_fast,
> > which can either find an existing object for the hash key or insert a
> > new one in a single atomic operation, so that concurrent opens never
> > allocate duplicate fsverity_info structure.
> 
> They still do, though.  But that's unchanged from before.
> ensure_verity_info() frees the one it allocated if it finds that one got
> set concurrently.

You're right.  We allocate them, but never register them.  I'll fix
that up.

> 
> > Because insertion into the hash table now happens before S_VERITY is set,
> > fsverity just becomes a barrier and a flag check and doesn't have to look
> > up the fsverity_info at all, so there is only a single lookup per
> > ->read_folio or ->readahead invocation.  For btrfs there is an additional
> > one for each bio completion, while for ext4 and f2fs the fsverity_info
> > is stored in the per-I/O context and reused for the completion workqueue.
> 
> btrfs actually still looks up the verity info once per folio.  See:
> 
>     btrfs_readahead()
>         -> btrfs_do_readpage()
>             -> fsverity_get_info()

True.  I've fixed up btrfs to avoid extra lookups.
