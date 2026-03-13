Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3252538B7DA
	for <fsverity@lists.linux.dev>; Fri, 13 Mar 2026 11:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773400644; cv=none; b=HcJLI0GZK8V3m5kKg7Ttrn82hveVd73MUi9x+HCHuKA4qdKEYrq12v5wTh2FJ1rM2XWIZRz/7GS94K86dqJvSncFoI3WUbpY5nBk/P/ISWyrx6Sn8pxR8aTV9MQ0SVXMrYvIt4gonl6U2dcma/TG49iSbwF3K0plFMB1wzvaMYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773400644; c=relaxed/simple;
	bh=2ocLF+6gDlSJ0COpbZ4Q1YW8LyldVKS8d2Q/lZFZfic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=LFYMQdkA5F28wS0TsCEk4XbuksR8E4TEkgSBrX18bMdR3732gKWfh9uMWrUVcvWHVCASZYdCUmBd108v01t5ob8dk6kARYZ6omj/wVjIYcIAy2ZhRrDzgfwr0bweRRVtf2YG07udNstyy0sSb3VHV9EYWXxSp8TmvDCFpcJKp8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OKrNARqw; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OKrNARqw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773400640;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=G3aAJby17/qDvpdgHW3BwLZTyLi3K99yUle4/tTAV/E=;
	b=OKrNARqwkYelqWGSTRuXPia0Hk9bJllMK93J6bCZsenFBTr2yAP8WoHr5HIUq1yJmxnNzJ
	roRty5ThfMb56It1GF+ACxR58ERoxghdXQPbE/9WcJewxFRFNdhw7EVsgVA6EO8b0CpQt3
	rB0HRscEx8F6ofgjV8gqmn6Stxp+rIE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-82-jZskyjPmNnS-ktS39GWstw-1; Fri, 13 Mar 2026 07:17:19 -0400
X-MC-Unique: jZskyjPmNnS-ktS39GWstw-1
X-Mimecast-MFC-AGG-ID: jZskyjPmNnS-ktS39GWstw_1773400638
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-439b8bc43aeso1671147f8f.1
        for <fsverity@lists.linux.dev>; Fri, 13 Mar 2026 04:17:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773400638; x=1774005438;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G3aAJby17/qDvpdgHW3BwLZTyLi3K99yUle4/tTAV/E=;
        b=gAGYGlkTg4aL5RdWwyzW45du92R4cBjtqAplo0m52+3OPcGq8fd3sd8uB0ZX3adeGj
         PNl2D3P2E9CRgvMBHyqxp/mLGgFvgU4jRJkVGlZoXUuNUZyddgkN9BFxmtnoRzcgwy47
         uiih8dSiTo0cwy1hWpVET2bfEN/eaHmGqw60H/2CQDemizH4rwrudezyAQA2pXd3whvM
         G3sH5hzmVW16/F2v8HuARF4eFSy3Y6yTxzgRy+Z/1daIhRTGMyN6T7B2to4pLvmbNxD6
         ov6ndJVyQueK3JbYMq4okJXC/O31XwUL++aAIQV3LsWDjEN21Fj9Ww8p8vz14iiz+j4J
         /BHA==
X-Forwarded-Encrypted: i=1; AJvYcCVQhXqlOe7SgpotoSy/RrDfcqW+9HfooSl8GSaaMawxIXD5v7+F4YZGtMu6LTVVEQ+UCPjFJhnExw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyU19hMK8H/wmWywqi0pCZQwMeJEAvUMBIoPBpuqb7E9gn7xeJh
	zJcVoD+rpoyW8PhVRqXGlseTuwxHq8kabOyowZmAmzZRTH1nNsHptorCXvvMXFECiKu2B9gXXXw
	DCE5m/O4sioL4FZfafNzWqy12rasfNLA0VLXKj4oRuj6VvHDpVTxDD2R3B1Y=
X-Gm-Gg: ATEYQzxXwK4Fuf+CALmyX3ZMp1sYUKAv93jjHEck+LEbUeX+l+X9T9FOTiAm2h42GKp
	cdusLJNMW8+jj58Vv79/ol2HXihMv+8Op6qKSrqjEZv1u2R1R2dD0fKTizpJY0m40K5jK5CJu0Z
	9ohXbFf8vlPiRZGJdqLmBorhesiocET0LgRcQcF09ywXm3E5u7nDbw1PjUgLc+rMDgn9G5dLfFM
	0b3Ml/xCuOMw5KPcBempHoyDj0WS7+boKxylhaz4xGkgy5ZbtrK1XDXRQq/MexuujonyzjWsr1x
	ijdvMrgOYwps9iWxHrHAeBsbGH2ZYN1wZbja6PWEI5x4z9QGH28n3jdzK/1/hOsY77SpqtxKmBx
	Rmgajm6ztUow=
X-Received: by 2002:a05:6000:2010:b0:439:ddc0:4bee with SMTP id ffacd0b85a97d-43a04d86228mr5317859f8f.16.1773400637604;
        Fri, 13 Mar 2026 04:17:17 -0700 (PDT)
X-Received: by 2002:a05:6000:2010:b0:439:ddc0:4bee with SMTP id ffacd0b85a97d-43a04d86228mr5317761f8f.16.1773400636834;
        Fri, 13 Mar 2026 04:17:16 -0700 (PDT)
Received: from thinky ([217.30.74.39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43a03cfd18fsm8558495f8f.36.2026.03.13.04.17.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 04:17:16 -0700 (PDT)
Date: Fri, 13 Mar 2026 12:17:15 +0100
From: Andrey Albershteyn <aalbersh@redhat.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: Andrey Albershteyn <aalbersh@kernel.org>, linux-xfs@vger.kernel.org, 
	fsverity@lists.linux.dev, linux-fsdevel@vger.kernel.org, ebiggers@kernel.org, hch@lst.de, 
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
	linux-btrfs@vger.kernel.org
Subject: Re: [PATCH v4 19/25] xfs: remove unwritten extents after
 preallocations in fsverity metadata
Message-ID: <dz3va7indkh4to2pingopyndck737qvyxvlfomkqqothzj4pdk@wu26ba5stnf6>
References: <20260309192355.176980-1-aalbersh@kernel.org>
 <20260309192355.176980-20-aalbersh@kernel.org>
 <20260310012914.GG1105363@frogsfrogsfrogs>
 <ymisdrze3ohdnxa4inqfwp4riaz4qk5nmtil33adn5ukhngq7v@f3tcv3hbzobz>
 <20260312145250.GE6069@frogsfrogsfrogs>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260312145250.GE6069@frogsfrogsfrogs>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6SIgHxa_PstrN5Ykr1h01PuOSNXwDyTM1vuUoLnzVYw_1773400638
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2026-03-12 07:52:50, Darrick J. Wong wrote:
> On Thu, Mar 12, 2026 at 02:50:57PM +0100, Andrey Albershteyn wrote:
> > On 2026-03-09 18:29:14, Darrick J. Wong wrote:
> > > > XFS preallocates spaces during writes. In normal I/O this space, if
> > > > unused, is removed by truncate. For files with fsverity, XFS does not
> > > > use truncate as fsverity metadata is stored past EOF.
> > > > 
> > > > After we're done with writing fsverity metadata iterate over extents in
> > > > that region and remove any unwritten ones. These would be preallocation
> > > > leftovers in the merkle tree holes and past fsverity descriptor.
> > > > 
> > > > Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org>
> > > > ---
> > 
> > > There's an upper limit on the number of blocks you can unmap/free in a
> > > single transaction.  Maybe move the xfs_trans_{alloc,commit} into the
> > > loop body?
> > > 
> > > Oh wait, you skip the written extents.  Ok, so maybe just roll it after
> > > you've done a bunmapi.
> > 
> > I see, I will add a rolling transaction. Btw, why skipping the
> > written extents let's us use rolling here?
> 
> Hrmm.  At first I thought: why can't xfs_fsverity_cancel_unwritten
> allocate (and commit) the transaction inside the loop body?  Then I
> thought "well, it's only conditionally unmapping things, and it's sort
> of a pain to allocate a transaction only then to find out if you
> actually want to run one".
> 
> OTOH there could be billions of extents in the data fork, so holding the
> ILOCK for that many transactions isn't a good thing because tr_write
> only preallocates space for a certain number of transaction rolls.
> fsverity already holds IOLOCK_EXCL so there can't be any other programs
> using the file.
> 
> So now I arrive back at "The transaction allocation and commit/cancel
> should be inside the loop body, since crashing midway through wouldn't
> result in user-visible changes to the file data".
> 
> > > Do you need to purge the cow fork too?
> > 
> > hmm, what case are you thinking about here? The fsverity is written
> > in past EOF region, I don't see how COW extent could be left there.
> > Can they somehow be left mapped for blocks past i_size?
> 
> I was talking about speculative cow fork preallocations below i_size.
> They'll eventually get purged by blockgc, but you could give the space
> back once you've committed enabling the fsverity file flag.

hmm, if they're purged by blockgc, then why to do it here? I'm
iterating and removing unwritten extents here only because
xfs_inode_free_eofblocks() will skip fsverity inodes, the check in
xfs_can_free_eofblocks():

	if (IS_VERITY(VFS_I(ip)))
		return false;

The skipping is done to not remove all the fsverity metadata
extents. With preallocations enabled there could be unwritten
extents left in the metadata.

Am I missing something?

-- 
- Andrey

