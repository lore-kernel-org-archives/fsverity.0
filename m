Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 095A45D746
	for <fsverity@lists.linux.dev>; Fri,  8 Mar 2024 21:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709933697; cv=none; b=okIYeTfqEDvKrFiFeSkbW+xGR/CK9lvhVTMvfcDRJdNadVY872EkSxxvDUonPzEGBFrIrbRr4FPUWiLwnVm0ZE8YMDl6kQ6Z4CjNNdY/lVM4JWR8qGRGeKStiDrfo1tJFzEA0s1nq/ASu0zor7rz3oaZ8r28gr6wj3A732WoC7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709933697; c=relaxed/simple;
	bh=LReDSpNpt8I5stTHN/A/zJpmJikjiFBWWm7Z9HG4Eoc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mHr6KBzprL9RB+T1vNzM/4l4PH3yQN2cuiLnQ5JWOWtciJO9++yBiQB2qVUxkmZuzjidsNiU72cQL00RBeNYnXRNS8WaOqTxOaZuWannQFkZLT73N2MwPMqq1OSNu/4Q+b5nIo7Bpl+IVVIC4/hdIgS4QadsHXJf1X8senDrcf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fromorbit.com; spf=pass smtp.mailfrom=fromorbit.com; dkim=pass (2048-bit key) header.d=fromorbit-com.20230601.gappssmtp.com header.i=@fromorbit-com.20230601.gappssmtp.com header.b=L8VjxpdK; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fromorbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fromorbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fromorbit-com.20230601.gappssmtp.com header.i=@fromorbit-com.20230601.gappssmtp.com header.b="L8VjxpdK"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1dd10ae77d8so21736815ad.0
        for <fsverity@lists.linux.dev>; Fri, 08 Mar 2024 13:34:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fromorbit-com.20230601.gappssmtp.com; s=20230601; t=1709933695; x=1710538495; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=s1lFTMD4ua9Pt/g44ZsrO8BcJui/gOH3DnnaI/0fZCc=;
        b=L8VjxpdKsaK13a5IBYVkJOrJVo5AT8ew4ALYXLVcJX2YABrnHqeljYl1LHNrb3zFcG
         4/jzJzWSqIMsE5Xta/hTXA0+WY2PAX1e/vjOepkBSZY/F2oD9ZDuvtwX3+ybBnulEGAc
         YntFtWezhWQmSrqYDaG7cF1M9tGZcWtaisCAN/yviJMxM1i/kAJCqOipc5hQ/T2ZopJN
         4HytF8uVG0oV+BUi9eBpucI/8C1rbYHUQf0liwgNUSz8YDta1goQVMaiHBMsdtNjR6Pm
         Vb7ZHi+uIeds8dkveu2DCNPNOkxMHJzVc7fSIAYPrfuBmH/kE40T9vhw+iN12oJXiRRl
         dzzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709933695; x=1710538495;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s1lFTMD4ua9Pt/g44ZsrO8BcJui/gOH3DnnaI/0fZCc=;
        b=Bug0F4umaQlE1XOCcJz89z1Vysz//Vl+DibivtsLa0ygzyKKHBzccMtGWj/3wl5XsV
         U1rj2GFu8MSlIj1Y2LLjV7OkY+c6l+w2sgVqQz9DlLFHiAqSqPVS0EXk/Kz1+YShUKOh
         XzhlUyAxSGdgK1/ZaUlG/3rfi/buy2yRenqDGSarhmh0/84hfRBJwit60L/IuxZ4bDu3
         TJQ9bnZj42TQTGWaeP0r4DKdllm/XYewOLDv+7bgR9hjISscWLo9/ToWdbB+Pye7L+zd
         7TCLjr6OEFhx6qctXYoXxE81pz2VHueAj5KMEfJpeoE91pB90B3MoRGuiNSSXQ6tV33f
         M4WQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYZYJAjai19iXzJcri6nbU6oshJNVo7FxaeZU5jnaMSME+XypzH5mHymkJE5brEBz8NawnC9WNlLZSFLaEGyl2pWNaXDcl6kg=
X-Gm-Message-State: AOJu0YxLa/MbszIEOVgccDv64rV4Djz1bf3AeCD1SDzXp/cd0ktQ+duj
	uOElfQPkUomu6/3sOQ3azLdR/1LXLUEqXj+dSCv1Ci+0uEdptrV5TJ856Yh9oxs=
X-Google-Smtp-Source: AGHT+IGrW5Ki3WQYUAfiJ6/1g8yrg/6IUgZwscba+wvqytAYrLGdr2/pvxsMX9PUz3RiNFLZDmMhxA==
X-Received: by 2002:a17:903:2303:b0:1dd:78f8:3e1 with SMTP id d3-20020a170903230300b001dd78f803e1mr252879plh.44.1709933695086;
        Fri, 08 Mar 2024 13:34:55 -0800 (PST)
Received: from dread.disaster.area (pa49-179-47-118.pa.nsw.optusnet.com.au. [49.179.47.118])
        by smtp.gmail.com with ESMTPSA id jz12-20020a170903430c00b001dd6e0a0c1bsm95326plb.268.2024.03.08.13.34.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Mar 2024 13:34:54 -0800 (PST)
Received: from dave by dread.disaster.area with local (Exim 4.96)
	(envelope-from <david@fromorbit.com>)
	id 1rihrf-00GsPN-1u;
	Sat, 09 Mar 2024 08:34:51 +1100
Date: Sat, 9 Mar 2024 08:34:51 +1100
From: Dave Chinner <david@fromorbit.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: Eric Biggers <ebiggers@kernel.org>,
	Andrey Albershteyn <aalbersh@redhat.com>, fsverity@lists.linux.dev,
	linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	chandan.babu@oracle.com
Subject: Re: [PATCH v5 06/24] fsverity: pass tree_blocksize to
 end_enable_verity()
Message-ID: <ZeuEe7qpNYaIll7L@dread.disaster.area>
References: <20240304191046.157464-2-aalbersh@redhat.com>
 <20240304191046.157464-8-aalbersh@redhat.com>
 <20240305005242.GE17145@sol.localdomain>
 <20240306163000.GP1927156@frogsfrogsfrogs>
 <20240307220224.GA1799@sol.localdomain>
 <20240308034650.GK1927156@frogsfrogsfrogs>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240308034650.GK1927156@frogsfrogsfrogs>

On Thu, Mar 07, 2024 at 07:46:50PM -0800, Darrick J. Wong wrote:
> On Thu, Mar 07, 2024 at 02:02:24PM -0800, Eric Biggers wrote:
> > On Wed, Mar 06, 2024 at 08:30:00AM -0800, Darrick J. Wong wrote:
> > > Or you could leave the unfinished tree as-is; that will waste space, but
> > > if userspace tries again, the xattr code will replace the old merkle
> > > tree block contents with the new ones.  This assumes that we're not
> > > using XATTR_CREATE during FS_IOC_ENABLE_VERITY.
> > 
> > This should work, though if the file was shrunk between the FS_IOC_ENABLE_VERITY
> > that was interrupted and the one that completed, there may be extra Merkle tree
> > blocks left over.
> 
> What if ->enable_begin walked the xattrs and trimmed out any verity
> xattrs that were already there?  Though I think ->enable_end actually
> could do this since one of the args is the tree size, right?

If we are overwriting xattrs, it's effectively a remove then a new
create operation, so we may as well just add a XFS_ATTR_VERITY
namespace invalidation filter that removes any xattr in that
namespace in ->enable_begin...

> > BTW, is xfs_repair planned to do anything about any such extra blocks?
> 
> Sorry to answer your question with a question, but how much checking is
> $filesystem expected to do for merkle trees?
> 
> In theory xfs_repair could learn how to interpret the verity descriptor,
> walk the merkle tree blocks, and even read the file data to confirm
> intactness.  If the descriptor specifies the highest block address then
> we could certainly trim off excess blocks.  But I don't know how much of
> libfsverity actually lets you do that; I haven't looked into that
> deeply. :/

Perhaps a generic fsverity userspace checking library we can link in
to fs utilities like e2fsck and xfs_repair is the way to go here.
That way any filesystem that supports fsverity can do offline
validation of the merkle tree after checking the metadata is OK if
desired.

> For xfs_scrub I guess the job is theoretically simpler, since we only
> need to stream reads of the verity files through the page cache and let
> verity tell us if the file data are consistent.

*nod*

> For both tools, if something finds errors in the merkle tree structure
> itself, do we turn off verity?  Or do we do something nasty like
> truncate the file?

Mark it as "data corrupt" in terms of generic XFS health status, and
leave it up to the user to repair the data and/or recalc the merkle
tree, depending on what they find when they look at the corrupt file
status.

> Is there an ioctl or something that allows userspace to validate an
> entire file's contents?  Sort of like what BLKVERIFY would have done for
> block devices, except that we might believe its answers?
> 
> Also -- inconsistencies between the file data and the merkle tree aren't
> something that xfs can self-heal, right?

Not that I know of - the file data has to be validated before we can
tell if the error is in the data or the merkle tree, and only the
user can validate the data is correct.

-Dave.
-- 
Dave Chinner
david@fromorbit.com
