Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55456271464
	for <fsverity@lists.linux.dev>; Tue,  3 Feb 2026 05:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770096969; cv=none; b=eKaBiB7s/RnMvf43ALvyxxtdmKUMIrRmOPDFczWo2UaLuEm0cyrP4HCaVBpcp+9Xh7Kh8lDTv2WDxyTiSNgNMCt76iqitAP/6Kj1yoPqk0eFzJyMlWz3MAjbyc8KYRKmFtDo8PJTUxXfQMZMvulf2dfBlIxjuT2qojZ7IBNNXoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770096969; c=relaxed/simple;
	bh=cC/qk4dm1B5K6YpfaVGKmBECm1eO3/9Kot5iyWUeUr4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T1ZfiNmxbLEjn1NbHbegeOq0KfSum/vXFlXDtyeLyflDsUZH/3S745kdKfMtxjSxnZl56PhvYBbIGyx6ujwNsvPAHX68GLA3g3e8UTlfmZSFZOtWYgXolpxOVQOgk+kQrnwlg4C1Qp/tLLgTZlRawEhnpLE1XfevqvJbhef67yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id E866E68AFE; Tue,  3 Feb 2026 06:36:04 +0100 (CET)
Date: Tue, 3 Feb 2026 06:36:04 +0100
From: Christoph Hellwig <hch@lst.de>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	David Sterba <dsterba@suse.com>, Theodore Ts'o <tytso@mit.edu>,
	Andrey Albershteyn <aalbersh@redhat.com>,
	Matthew Wilcox <willy@infradead.org>, linux-fsdevel@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, fsverity@lists.linux.dev
Subject: Re: fsverity speedup and memory usage optimization v5
Message-ID: <20260203053604.GC15956@lst.de>
References: <20260202060754.270269-1-hch@lst.de> <20260202211423.GB4838@quark> <20260202223404.GA173552@quark>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202223404.GA173552@quark>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Mon, Feb 02, 2026 at 02:34:04PM -0800, Eric Biggers wrote:
> On Mon, Feb 02, 2026 at 01:14:23PM -0800, Eric Biggers wrote:
> > On Mon, Feb 02, 2026 at 07:06:29AM +0100, Christoph Hellwig wrote:
> > > Hi all,
> > > 
> > > this series has a hodge podge of fsverity enhances that I looked into as
> > > part of the review of the xfs fsverity support series.
> > > 
> > > The first part optimizes the fsverity read path by kicking off readahead
> > > for the fsverity hashes from the data read submission context, which in my
> > > simply testing showed huge benefits for sequential reads using dd.
> > > I haven't been able to get fio to run on a preallocated fio file, but
> > > I expect random read benefits would be significantly better than that
> > > still.
> > > 
> > > The second part avoids the need for a pointer in every inode for fsverity
> > > and instead uses a rhashtable lookup, which is done once per read_folio
> > > or ->readahead invocation plus for btrfs only for each bio completion.
> > > Right now this does not increse the number of inodes in
> > > each slab, but for ext4 we are getting very close to that (within
> > > 16 bytes by my count).
> > > 
> > > Changes since v5:
> > >  - drop already merged patches
> > >  - fix a bisection hazard for non-ENOENT error returns from
> > >    generic_read_merkle_tree_page
> > >  - don't recurse on invalidate_lock
> > >  - refactor page_cache_ra_unbounded locking to support the above
> > >  - refactor ext4 and f2fs fsverity readahead to remove the need for the
> > >    first_folio branch in the main readpages loop
> > 
> > Applied to https://git.kernel.org/pub/scm/fs/fsverity/linux.git/log/?h=for-next
> > 
> > (Though it's getting late for v6.20 / v7.0.  So if there are any
> > additional issues reported, I may have to drop it.)
> 
> Unfortunately this silently conflicts with changes in the f2fs tree.
> Resolution doesn't look too bad, but we'll need to handle this.
> Christoph, Jaegeuk, and Chao, let me know if this looks okay:

I ended up with the same merge, and it looks good to me.

