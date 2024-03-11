Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FC59384
	for <fsverity@lists.linux.dev>; Mon, 11 Mar 2024 00:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710116793; cv=none; b=dnmAFBoLzHdrnFcUA5nklHQjC0R1BqFa4dgj7GHhBVrqAcXM8cIrbLH3kLScKTgn+jF03UBHGuvfkX1asuKtLwgFSEjyQYhrtgQ/C4L09Oq8U1MCi6Cv2sZ0nup+D8zh1AThx5khmOgkiQQ09nYJy792O2VCFSgDIw8gJ9acuOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710116793; c=relaxed/simple;
	bh=iBKjjTrnOHzNOegJJQGLP50ZpI68uONSIDUMvj2s3Po=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XipWfqWFKaJFeCWfjhExj2Z/GndRKzUlYcFooNR/wAaG/Q9w3tSDi+jIGiB8FFolywpkZHK5OSYOqmg+yjAbwrqFQItYW6iVJ7g6PzU3EfyiV2u33tqmVFbxdjQsGptKSlD6GMdkAvVJ4HEWouIM2f85XhSTnqQ5IIyNoIhb/rI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fromorbit.com; spf=pass smtp.mailfrom=fromorbit.com; dkim=pass (2048-bit key) header.d=fromorbit-com.20230601.gappssmtp.com header.i=@fromorbit-com.20230601.gappssmtp.com header.b=kajfZxTm; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fromorbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fromorbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fromorbit-com.20230601.gappssmtp.com header.i=@fromorbit-com.20230601.gappssmtp.com header.b="kajfZxTm"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1dc3b4b9b62so22903115ad.1
        for <fsverity@lists.linux.dev>; Sun, 10 Mar 2024 17:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fromorbit-com.20230601.gappssmtp.com; s=20230601; t=1710116788; x=1710721588; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=r+ZDbxeIcvt8eupuU3iHpjDH4gBEwZMYuiYtlmL76Eo=;
        b=kajfZxTmY2IjEKUrAhtb8wfDRoV5CoixryV+/mPLFMr2a+E39bfrtdUXVQ+GQF6eij
         bABCgNrhGwkjPMNfi+BUsMMkOBDF9BEdVBYFPq1+x7lZ5Z4AdBFMmR3M8jWA4kaUKnsA
         jxznQ9FKPzpG87JEKsJbeQz+TphWTCcPMb/1FbXTPSrCVXbFpNyRu8DO1lYHxK48AfRE
         EpOrQM7NxQijitRKSHxDgvq4GLoOx0zP3A/jQgvffuzD29XASZm7apuDFjBzaL3XO/Zj
         aNor7NPXSFfl4V3nKwSvhPfs9ODR06NTDdmEPbr9m8goyGVfsFL359qD321ygZI/C6oW
         h4iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710116788; x=1710721588;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r+ZDbxeIcvt8eupuU3iHpjDH4gBEwZMYuiYtlmL76Eo=;
        b=j8VDKFVxJHrGGlosJxcyOTP2rYNDCn3BHDcCD9nkScrZemZwh6bxXKBL9i/Z2h1bVB
         RAfgyysjE7mZQjqIlTNhDhj4Nm88Apc0awCvDA9gMRfnM8M0B4uzZ9V4RSTxiVbBoT1V
         dkQuK9ft/UfpYZIYNgzLpJokpaMVInC8xtdqUV3TWhM12B/JEDmf63UtNJDJRFU9CWkH
         kPjRir6mfX58j2F46WoUpVmxhJ3VSZ+APe85KTbL8bsefaUA3rApv2aXtyopH0klLD+s
         grD/6X1yrCjwH7vhXhuX0ZIc+5Nj3QCQwBOUu1i+vhFpD/Jtn/KEZD4slXUM7v+UgtXf
         uvNA==
X-Forwarded-Encrypted: i=1; AJvYcCW2k5AI71HF0UI4/CBZcUyURuyDWZHv/roURIVARowDE9jd0eC069u4WrlLzIt8VgxNLhfVPKOBsTjH8uZAButIQFOMpov77gc=
X-Gm-Message-State: AOJu0YxEas8C8ycR4590xJIbdAE1yecrRz+FHqcTINZftrYIDKyt3yx8
	pMRmEwtnTf6ib6Ichz8BgYb9oMyD20gbbnXgk30FDuOX9oKMCuBa8NfI1N3niRU=
X-Google-Smtp-Source: AGHT+IHzV7FprUI1FoXB5iJZCu3Lbc002VzAsroztma0cmpHQA1DeV9d9zr30wWO4FIBCVe1xGGJhQ==
X-Received: by 2002:a17:902:e88c:b0:1dd:4cb:cc57 with SMTP id w12-20020a170902e88c00b001dd04cbcc57mr6011101plg.0.1710116788118;
        Sun, 10 Mar 2024 17:26:28 -0700 (PDT)
Received: from dread.disaster.area (pa49-179-47-118.pa.nsw.optusnet.com.au. [49.179.47.118])
        by smtp.gmail.com with ESMTPSA id j6-20020a170902c3c600b001dd5f5b1ca4sm3232768plj.309.2024.03.10.17.26.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Mar 2024 17:26:26 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.96)
	(envelope-from <david@fromorbit.com>)
	id 1rjTUm-000EB4-1C;
	Mon, 11 Mar 2024 11:26:24 +1100
Date: Mon, 11 Mar 2024 11:26:24 +1100
From: Dave Chinner <david@fromorbit.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: Andrey Albershteyn <aalbersh@redhat.com>, fsverity@lists.linux.dev,
	linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	chandan.babu@oracle.com, ebiggers@kernel.org
Subject: Re: [PATCH v5 11/24] xfs: add XBF_VERITY_SEEN xfs_buf flag
Message-ID: <Ze5PsMopkWqZZ1NX@dread.disaster.area>
References: <20240304191046.157464-2-aalbersh@redhat.com>
 <20240304191046.157464-13-aalbersh@redhat.com>
 <20240307224654.GB1927156@frogsfrogsfrogs>
 <ZepxHObVLb3JLCl/@dread.disaster.area>
 <20240308033138.GN6184@frogsfrogsfrogs>
 <20240309162828.GQ1927156@frogsfrogsfrogs>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240309162828.GQ1927156@frogsfrogsfrogs>

On Sat, Mar 09, 2024 at 08:28:28AM -0800, Darrick J. Wong wrote:
> On Thu, Mar 07, 2024 at 07:31:38PM -0800, Darrick J. Wong wrote:
> > On Fri, Mar 08, 2024 at 12:59:56PM +1100, Dave Chinner wrote:
> > > > (Ab)using the fsbuf code did indeed work (and passed all the fstests -g
> > > > verity tests), so now I know the idea is reasonable.  Patches 11, 12,
> > > > 14, and 15 become unnecessary.  However, this solution is itself grossly
> > > > overengineered, since all we want are the following operations:
> > > > 
> > > > peek(key): returns an fsbuf if there's any data cached for key
> > > > 
> > > > get(key): returns an fsbuf for key, regardless of state
> > > > 
> > > > store(fsbuf, p): attach a memory buffer p to fsbuf
> > > > 
> > > > Then the xfs ->read_merkle_tree_block function becomes:
> > > > 
> > > > 	bp = peek(key)
> > > > 	if (bp)
> > > > 		/* return bp data up to verity */
> > > > 
> > > > 	p = xfs_attr_get(key)
> > > > 	if (!p)
> > > > 		/* error */
> > > > 
> > > > 	bp = get(key)
> > > > 	store(bp, p)
> > > 
> > > Ok, that looks good - it definitely gets rid of a lot of the
> > > nastiness, but I have to ask: why does it need to be based on
> > > xfs_bufs?
> > 
> > (copying from IRC) It was still warm in my brain L2 after all the xfile
> > buftarg cleaning and merging that just got done a few weeks ago.   So I
> > went with the simplest thing I could rig up to test my ideas, and now
> > we're at the madly iterate until exhaustion stage. ;)
> > 
> > >            That's just wasting 300 bytes of memory on a handle to
> > > store a key and a opaque blob in a rhashtable.
> > 
> > Yep.  The fsbufs implementation was a lot more slender, but a bunch more
> > code.  I agree that I ought to go look at xarrays or something that's
> > more of a direct mapping as a next step.  However, i wanted to get
> > Andrey's feedback on this general approach first.
> > 
> > > IIUC, the key here is a sequential index, so an xarray would be a
> > > much better choice as it doesn't require internal storage of the
> > > key.
> > 
> > I wonder, what are the access patterns for merkle blobs?  Is it actually
> > sequential, or is more like 0 -> N -> N*N as we walk towards leaves?

I think the leaf level (i.e. individual record) access patterns
largely match data access patterns, so I'd just treat it like as if
it's a normal file being accessed....

> > Also -- the fsverity block interfaces pass in a "u64 pos" argument.  Was
> > that done because merkle trees may some day have more than 2^32 blocks
> > in them?  That won't play well with things like xarrays on 32-bit
> > machines.
> > 
> > (Granted we've been talking about deprecating XFS on 32-bit for a while
> > now but we're not the whole world)
> > 
> > > i.e.
> > > 
> > > 	p = xa_load(key);
> > > 	if (p)
> > > 		return p;
> > > 
> > > 	xfs_attr_get(key);
> > > 	if (!args->value)
> > > 		/* error */
> > > 
> > > 	/*
> > > 	 * store the current value, freeing any old value that we
> > > 	 * replaced at this key. Don't care about failure to store,
> > > 	 * this is optimistic caching.
> > > 	 */
> > > 	p = xa_store(key, args->value, GFP_NOFS);
> > > 	if (p)
> > > 		kvfree(p);
> > > 	return args->value;
> > 
> > Attractive.  Will have to take a look at that tomorrow.
> 
> Done.  I think.  Not sure that I actually got all the interactions
> between the shrinker and the xarray correct though.  KASAN and lockdep
> don't have any complaints running fstests, so that's a start.
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git/log/?h=fsverity-cleanups-6.9_2024-03-09

My initial impression is "over-engineered".

I personally would have just allocated the xattr value buffer with a
little extra size and added all the external cache information (a
reference counter is all we need as these are fixed sized blocks) to
the tail of the blob we actually pass to fsverity. If we tag the
inode in the radix tree as having verity blobs that can be freed, we
can then just extend the existing fs sueprblock shrinker callout to
also walk all the verity inodes with cached data to try to reclaim
some objects...

But, if a generic blob cache is what it takes to move this forwards,
so be it.

-Dave.
-- 
Dave Chinner
david@fromorbit.com
