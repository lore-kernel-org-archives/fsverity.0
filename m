Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B7186994D
	for <fsverity@lists.linux.dev>; Tue, 12 Mar 2024 07:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710226868; cv=none; b=bfnaptzI45j7Rj0FgsUTLBHx93nyzvHwuXhQUBHz7bvLjOPjaF1bn+RL2aUMPD8G0JLrsu5dhIHOgki/owbguhHJQyf5FCEK5zydAQOOynAxwksdOH7l6k9Mt3z5EufCTMC+4KGTHOzbBqLdKg61rGz6bmTRGrgWktBG9ji6JJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710226868; c=relaxed/simple;
	bh=tj8KK0D7LCHZt7E6i5hvVqiBxMjal+SFD/ZyzAWJDnI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n1ZYWsJtDYPAR/cqp8TKI90rYb+4mybzQSZxKzWjSu3MPmDzIlnv/Fb5+MZEj7y1FJOuiYhU60XtIktsdMhZM6H5D4Xik4MeulXKky/MNjybqxsyOrMccSGDDxWXhNxDlIxDsrGOcceev2FoK3mpKqT3GpnvtQcOwVf0DlFq+Po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fromorbit.com; spf=pass smtp.mailfrom=fromorbit.com; dkim=pass (2048-bit key) header.d=fromorbit-com.20230601.gappssmtp.com header.i=@fromorbit-com.20230601.gappssmtp.com header.b=Lt8QVUY5; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fromorbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fromorbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fromorbit-com.20230601.gappssmtp.com header.i=@fromorbit-com.20230601.gappssmtp.com header.b="Lt8QVUY5"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1dc09556599so42726735ad.1
        for <fsverity@lists.linux.dev>; Tue, 12 Mar 2024 00:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fromorbit-com.20230601.gappssmtp.com; s=20230601; t=1710226866; x=1710831666; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iJQ+LsA4njrwtFoiuWbZG6N6ucnCdblOdJQaovZ8ZEo=;
        b=Lt8QVUY55ywnoHcV4fXbFyLJXxjYBQ/lhgyj/4ekD9H1yn1k2Wq319oti6GTvoQhPz
         AOxaPOBOYXgpWltgPATn9f9CS+zX+NsfChCgl/V+dS9/IEO9DOJmPW88bPfR1ZHGSNto
         3DOJcGejnnDbNlZUpcUznGmCS1oleCKohjS/N14ErbZloNS8GQVDrnwotChInRTTlUBV
         wbyr/cRysAbaIDvrLhD5S0V85bHGbAJyRHwAreyd0Ebb2rAv4bzvPKUKXmVvBKldL8Ky
         q27J9CVunV+dlB3qM4m7zf+lLA/SZJWpMXYLZC/Ya8X4/SpjO1GMHxZmpr1T1LN4J9Kz
         Q+4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710226866; x=1710831666;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iJQ+LsA4njrwtFoiuWbZG6N6ucnCdblOdJQaovZ8ZEo=;
        b=gBIFdj8uboBQ9V3fRb8azC0I3ygSS9jqXyu/kRQ5fiMz90gP8QFCcFX7BmCy+ZCL4b
         fRzR/luK2NZ4JGz5HuH1HOApzBSZSMO83MLOt/zDTX94toSrKX6muptbiu6IVjjm/w0u
         j+yGqzk7oVq/bTZY7qug/P0v74Sbhpl7PnnTkgmvSgZei8BzG2dMdiDX2eYTC99eD5R2
         96G4EmYD+fjLp/X9kzLnYnVktLXVaZ583m6ibh/kEQC2BxemQ2hko/QlKRzajbhQLAc0
         JMZyVlTUi0hcexMbPlQp58+GblFPcCRsZkyYwckKVKMcYfTdqgd8wOa2h/wf9ZbcB+Ov
         NlNg==
X-Forwarded-Encrypted: i=1; AJvYcCU1O3Kr6YqvJckatIbTGmOo24SoG/Hr/WGUunHAqfbUQA/4r4Fh1DAmV0hLzJZhO8Hok8lax5rbk3v+T4kTyTuU+wlWfr3ag4Q=
X-Gm-Message-State: AOJu0YzT1eqHk0ebnsocSEGJr5QFulRHnoxZ20IvAysLDhNPhkF57YLW
	5ToRSdLrsGkSBwi5gZp/w+tLrvtdn7wU+U5K8rpXk3IkpXqK838J8Z7SwJWJHjs=
X-Google-Smtp-Source: AGHT+IFfiBIZrzEHhDlB40WMpMIuhFhWXqA66uq2JH3j2quW4u+GTqwqvuflueaG7FnGq+PfIjC3uQ==
X-Received: by 2002:a17:903:94e:b0:1dd:bf6c:8973 with SMTP id ma14-20020a170903094e00b001ddbf6c8973mr193652plb.68.1710226865312;
        Tue, 12 Mar 2024 00:01:05 -0700 (PDT)
Received: from dread.disaster.area (pa49-179-47-118.pa.nsw.optusnet.com.au. [49.179.47.118])
        by smtp.gmail.com with ESMTPSA id k6-20020a170902c40600b001dd247e87aesm5889367plk.235.2024.03.12.00.01.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 00:01:04 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.96)
	(envelope-from <david@fromorbit.com>)
	id 1rjw8D-000ngZ-2g;
	Tue, 12 Mar 2024 18:01:01 +1100
Date: Tue, 12 Mar 2024 18:01:01 +1100
From: Dave Chinner <david@fromorbit.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: Andrey Albershteyn <aalbersh@redhat.com>, fsverity@lists.linux.dev,
	linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	chandan.babu@oracle.com, ebiggers@kernel.org
Subject: Re: [PATCH v5 11/24] xfs: add XBF_VERITY_SEEN xfs_buf flag
Message-ID: <Ze/9rdVsnwyksHmi@dread.disaster.area>
References: <20240304191046.157464-2-aalbersh@redhat.com>
 <20240304191046.157464-13-aalbersh@redhat.com>
 <20240307224654.GB1927156@frogsfrogsfrogs>
 <ZepxHObVLb3JLCl/@dread.disaster.area>
 <20240308033138.GN6184@frogsfrogsfrogs>
 <20240309162828.GQ1927156@frogsfrogsfrogs>
 <Ze5PsMopkWqZZ1NX@dread.disaster.area>
 <20240311152505.GR1927156@frogsfrogsfrogs>
 <20240312024507.GY1927156@frogsfrogsfrogs>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240312024507.GY1927156@frogsfrogsfrogs>

On Mon, Mar 11, 2024 at 07:45:07PM -0700, Darrick J. Wong wrote:
> On Mon, Mar 11, 2024 at 08:25:05AM -0700, Darrick J. Wong wrote:
> > > But, if a generic blob cache is what it takes to move this forwards,
> > > so be it.
> > 
> > Not necessarily. ;)
> 
> And here's today's branch, with xfs_blobcache.[ch] removed and a few
> more cleanups:
> https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git/tag/?h=fsverity-cleanups-6.9_2024-03-11

Walking all the inodes counting all the verity blobs in the shrinker
is going to be -expensive-. Shrinkers are run very frequently and
with high concurrency under memory pressure by direct reclaim, and
every single shrinker execution is going to run that traversal even
if it is decided there is nothing that can be shrunk.

IMO, it would be better to keep a count of reclaimable objects
either on the inode itself (protected by the xa_lock when
adding/removing) to avoid needing to walk the xarray to count the
blocks on the inode. Even better would be a counter in the perag or
a global percpu counter in the mount of all caches objects. Both of
those pretty much remove all the shrinker side counting overhead.

Couple of other small things.

- verity shrinker belongs in xfs_verity.c, not xfs_icache.c. It
  really has nothing to do with the icache other than calling
  xfs_icwalk(). That gets rid of some of the config ifdefs.

- SHRINK_STOP is what should be returned by the scan when
  xfs_verity_shrinker_scan() wants the shrinker to immediately stop,
  not LONG_MAX.

- In xfs_verity_cache_shrink_scan(), the nr_to_scan is a count of
  how many object to try to free, not how many we must free. i.e.
  even if we can't free objects, they are still objects that got
  scanned and so should decement nr_to_scan...

-Dave.
-- 
Dave Chinner
david@fromorbit.com
