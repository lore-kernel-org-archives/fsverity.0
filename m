Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E54E22C028F
	for <fsverity@lists.linux.dev>; Mon,  6 Apr 2026 04:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775451529; cv=none; b=C/deM0OTcHikEJEkJxrwfGOEiJSZe6ujOERm4EgDD3WuLXzloDwUItH6jY/rKcjooZBw6HFMc3NJiWRdEzYeIkGoOtGYdF9PWEHhDp+0MN0hsnG/A4HOgg0HkMf8p1iTlGMoBpiIcJqcFrz7vfQ0fbMlT91Y2DWHn1N3R1hawKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775451529; c=relaxed/simple;
	bh=5bS0Ij2Sus3BcmvfN4pf8ZirueqVCK4akyrtBq9EYCI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dMu9cDu1oryi6Oe1LX5h20K9tDOMWZ690j51G5X2XsVAk7kQh3M7zNpzlsqVZflMzRe4zaAG729vIyovPo5/d0e2kYzJYguIlNf8j0c7pm+r/G7+/G4G0fDB5uDF6rXWtpt/s9EiYn5KbKc8qyhpNzsBrpMiqtA4nExi/v5QrOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=IuZ6/PbB; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="IuZ6/PbB"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=dGOz5LubrXMgBVpbR4UMcmlEhL2e9ysHTTF2z+zf9og=; b=IuZ6/PbBZWjKoDfehqr38nON9Y
	62MnQsFVXczj5TJri4tFP4ORN7hQ9kGUdY365ozWLvuseFttT7y3FkBGAs/4VEwRtW6NWagLocbrk
	pu759OF3S1IHRUyA/NptJWH6YVoF3219uqSoj5jEPMmavOL/+yRV8bNu5cmpNylEDuyHgLjJVothX
	FuQi3SNXZA24ATeuxA5u8qkeGPTZTrSnEBTojHjIiRsZSoH/iVah4+2X9sEuCP0qYfoYtC8PwRURW
	+PVoNViks+/8eS2dmF3J9QfhK/jNkNSL93QbD7LwxA5wp1kc/BNSrAijqZTajnnz14cR5brNGIdpJ
	hc+5qBVg==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9c2t-00000000t4M-2BPd;
	Mon, 06 Apr 2026 04:58:43 +0000
Date: Mon, 6 Apr 2026 05:58:43 +0100
From: Matthew Wilcox <willy@infradead.org>
To: fsverity@lists.linux.dev
Cc: Eric Biggers <ebiggers@kernel.org>, "Theodore Y. Ts'o" <tytso@mit.edu>,
	Christoph Hellwig <hch@lst.de>
Subject: fsverity and large folios
Message-ID: <adM9g5jgxzG_NvgI@casper.infradead.org>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I suspect that fsverity simply doesn't support large folios today.
However, I assume that we'd like to support them someday (eg to support
16KiB block devices on a machine with a 4KiB page size).

To make a move in that direction, I started to convert
->read_markle_tree_page() to ->read_merkle_tree_folio().  But there's
a problem.  The Merkle tree is stored at "some offset" from the EOF.  And
the knowledge of what offset is particular to the individual filesystem
(or potentially each individual file).  That means that we can't hoist
the "folio_file_page(folio, index)" call from the filesystem to the core
code because the core code doesn't know what offset the tree is stored at.

And it's kind of dangerous because calling offset_in_folio(folio,
byte_offset) doesn't work correctly eitheer (it's fine as long as the
Merkle tree starts at some multiple of folio_size() from the base of
the file ... which is a nasty gotcha to stumble across!)

This actually came up for me because fsverity is using PageChecked(),
and it's the last part of the kernel still using PageChecked().  I was
hoping to replace these uses with folio_test/set_checked(), but it all
feels a bit fragile at this point.

I don't have an idea beyond exposing ->verity_metadata_pos() to the
core code from individual filesystems, which feels like poor
architecture.  Ideas welcome.
