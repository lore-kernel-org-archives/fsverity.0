Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263681B952
	for <fsverity@lists.linux.dev>; Wed,  3 Apr 2024 01:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712109567; cv=none; b=WA+f2NGngfHWqR69vx5tv06v9dD4+5E1Lc329xaFzVqhc6SZIPPXfAZWVqvj57A7y2Tn7ADtSEoEtKisVVO6gN3Dc67V/boJNqtl5YbprQau6q06gVFQP6xA+Vi2mz4I6/eI4MqIMMjY9vtuhJH4W4hfP30MOCrrgmrq4P8G8Do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712109567; c=relaxed/simple;
	bh=QIwoSNVbGhF4tVY6dhV0Hdf7RkIWChRHPzMOnXsGvyE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nBKmZUSu0SpHwhDrhB4ukdnjnQgWsjNfQALaTFJb6/NvJL/q7eKywhqQzxi7EgbDvEM4H0hjLtwrWfGyN3vFMH14NLDYFrW9N/65185Bg1qU53U3t1mGfk5792kM0H8VFRySWoI2jfJnLWaQnGu+4S3Bov/bYdXmbbbZ6dB8udY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fromorbit.com; spf=pass smtp.mailfrom=fromorbit.com; dkim=pass (2048-bit key) header.d=fromorbit-com.20230601.gappssmtp.com header.i=@fromorbit-com.20230601.gappssmtp.com header.b=RGdoyZ32; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fromorbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fromorbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fromorbit-com.20230601.gappssmtp.com header.i=@fromorbit-com.20230601.gappssmtp.com header.b="RGdoyZ32"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6e6fb9a494aso4804966b3a.0
        for <fsverity@lists.linux.dev>; Tue, 02 Apr 2024 18:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fromorbit-com.20230601.gappssmtp.com; s=20230601; t=1712109565; x=1712714365; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NYvnBCprFZzYoPCfFCY9FHGMDGDnnbenpZrTFCrtHqg=;
        b=RGdoyZ32LYrkjGbg/b9QdSK5/4sp/0e9lPzCsJzahHTQGJZm/WY4Z5XFUJecqPEwXF
         vi96OgN1WihhsbcRq4znf3mIn92ermeKV7fHRhhWYNuddt8ShkhpPoDfIptPqA3QJ+eY
         enxglMy4TsfSBliE1KC3ozHeXehQAJI5pcC1IQzVO2FGVyQgUYC4RHc7Kb4n1N/8gAcF
         Gchowx71AQGSLiOC5htAf2Ty2woRgbh38xIrk8yN9l5B+7ERGaG5Wa3D0L0ORIfkAYYD
         ZgJU6JulBKl4N1Al2Xu2RMvlns+yv4gQeL3npqfWOFY/k2nawdn+TXczhlZNouWbWRgN
         pm8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712109565; x=1712714365;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NYvnBCprFZzYoPCfFCY9FHGMDGDnnbenpZrTFCrtHqg=;
        b=pQR1wXjNMgHC5sM9GaQeiaHLh4aAnOYFGU8/1YzXnowr4woxbYtORgzjNHAHHGqJui
         mvkl6chUvmtizSGqyH+eHIANsWCsTB2LduZy4dTe/JR7Ou/siej9DAm/EALAdb38KOT5
         MgynYA1kfnR9757DYSMrj4LXP5UljK9fHQK4CCCaIh3jSYe8fOoTL4liuk2nNotw3vHU
         TjSkeszhJA8EciJQLq8akoefFeHFlUe6RlS5QZ2LVAvHlex9PxtcF8CSmpo/WF338okK
         PAWD7Dy+iqvqBiYn3ZdqwqMOcYXI+WHJmPht8I7tbWV8oH1FBNsbz2QwnSTsOOs7ZsRa
         AXkg==
X-Forwarded-Encrypted: i=1; AJvYcCWyXUp6VUWERvvbzYXJHBssVsegHTUMftW8meVm8dyYg32fKFqNSE+vdPorj7GN4T+7fHK2h2gwqPx7rl4+S/APY0I/VOalEVg=
X-Gm-Message-State: AOJu0YzA3cxn3QEUEk4NwxUAKLayiC0A8rZ2pT7DYVGER7eBYymSsvAn
	hZ28xIUJlKCPxD2rYVppf0n5rggaheSjK4mOiSKrCWxwh/bEEkS84evfTXMZKZ0=
X-Google-Smtp-Source: AGHT+IH7IcdRuRfN1eedYkwr5P3Wm/AdI3Un/KrVubjcpsHE0mA4uhQCOt/SLnjlUQhlQrSkkwksHg==
X-Received: by 2002:a05:6a20:8f27:b0:1a3:30a8:2ad6 with SMTP id b39-20020a056a208f2700b001a330a82ad6mr12794751pzk.10.1712109565140;
        Tue, 02 Apr 2024 18:59:25 -0700 (PDT)
Received: from dread.disaster.area (pa49-181-56-237.pa.nsw.optusnet.com.au. [49.181.56.237])
        by smtp.gmail.com with ESMTPSA id n14-20020a170902d2ce00b001e0942da6c7sm11830061plc.284.2024.04.02.18.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 18:59:24 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.96)
	(envelope-from <david@fromorbit.com>)
	id 1rrpuM-0020Ui-0p;
	Wed, 03 Apr 2024 12:59:22 +1100
Date: Wed, 3 Apr 2024 12:59:22 +1100
From: Dave Chinner <david@fromorbit.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: Colin Walters <walters@verbum.org>, Eric Biggers <ebiggers@kernel.org>,
	Andrey Albershteyn <aalbersh@redhat.com>,
	xfs <linux-xfs@vger.kernel.org>, linux-fsdevel@vger.kernel.org,
	fsverity@lists.linux.dev, Alexander Larsson <alexl@redhat.com>
Subject: Re: [PATCH 28/29] xfs: allow verity files to be opened even if the
 fsverity metadata is damaged
Message-ID: <Zgy3+ljJME0pky3d@dread.disaster.area>
References: <171175868489.1988170.9803938936906955260.stgit@frogsfrogsfrogs>
 <171175869022.1988170.16501260874882118498.stgit@frogsfrogsfrogs>
 <2afcf2b2-992d-4678-bf68-d70dce0a2289@app.fastmail.com>
 <20240402225216.GW6414@frogsfrogsfrogs>
 <992e84c7-66f5-42d2-a042-9a850891b705@app.fastmail.com>
 <20240403013903.GG6390@frogsfrogsfrogs>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240403013903.GG6390@frogsfrogsfrogs>

On Tue, Apr 02, 2024 at 06:39:03PM -0700, Darrick J. Wong wrote:
> On Tue, Apr 02, 2024 at 08:10:15PM -0400, Colin Walters wrote:
> > >> I hesitate to say it but maybe there should be some ioctl for online
> > >> repair use cases only, or perhaps a new O_NOVERITY special flag to
> > >> openat2()?
> > >
> > > "openat2 but without meddling from the VFS"?  Tempting... ;)
> > 
> > Or really any lower level even filesystem-specific API for the online
> > fsck case.  Adding a blanket new special case for all CAP_SYS_ADMIN
> > processes covers a lot of things that don't need that.
> 
> I suppose there could be an O_NOVALIDATION to turn off data checksum
> validation on btrfs/bcachefs too.  But then you'd want to careful
> controls on who gets to use it.  Maybe not liblzma_la-crc64-fast.o.

Just use XFS_IOC_OPEN_BY_HANDLE same as xfs_fsr and xfsdump do. The
handle can be build in userspace from the inode bulkstat
information, and for typical inode contents verification purposes we
don't actually need path-based open access to the inodes. That would
then mean we can simple add our own open flag to return a fd that
can do data operations that short-circuit verification...

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com
