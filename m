Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C68E774BFD
	for <fsverity@lists.linux.dev>; Thu, 14 Mar 2024 17:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710436569; cv=none; b=ouAuS2yPJEsTYeOYkB302QBKDY6ZXhwaG7WqOEpjGA/MsVGG2OgA4m1hk/m3OXKqn2JAOC77/7bqvRNCA8RU9T8cHdKCPfssOxqQ56CQjnHB+2xtXhEEvnS/SPfrDrbkwB3rpzqvUvNSuquegk8pk3PsAea6LTWycmiKJAOnP2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710436569; c=relaxed/simple;
	bh=yJ9lhppTwYft3uAXsPtQ9JakH3AP/Ec6HHHPVz1Rbgs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=hiaUBq1R/0JLSdxy5+yoEQxHzLDCpXMBL5QBC5G7/kFaf8IUBe6DeNMNvUFOhf+lF4EJM8c8ZMUTH26ZbRq4jyuP0sS2DI/EvBYYIB8VYMQ21Lneg/kNl/QF0WJL8bWxMAGUGsrCZ7PXf2nUlDcIagPm52qxnNILyAgCaZEwjKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CYQW8/Ls; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CYQW8/Ls"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710436566;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Yo3wkqTGWc513kM6wvuDHFlEJRGidugW7GVqad1jST8=;
	b=CYQW8/Lsxke5sAFHwCIOSsen2vK7NDXu1Ez77Ne08THBzDuZocWe4KLrzyKSGFhE8AhiuE
	WvPNcYD2Ut+2UVPqbu/fu6VXp6yC8ZL0cTETaBh0gnjkcfYlVdZ9/6e8Q/9Mul/nyzrwks
	QuJT9MEfF6hnpJb3xqjM9p2R8NwEjlE=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-8-VL6IwIKLNtSKAtbDwOXTEA-1; Thu, 14 Mar 2024 13:16:05 -0400
X-MC-Unique: VL6IwIKLNtSKAtbDwOXTEA-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-568a3be9127so449595a12.2
        for <fsverity@lists.linux.dev>; Thu, 14 Mar 2024 10:16:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710436564; x=1711041364;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yo3wkqTGWc513kM6wvuDHFlEJRGidugW7GVqad1jST8=;
        b=PaZ8QWCFljDKgE2SF3vl3nWr11aDnmo3G6YX90XqCGXWHx0kvdsJTTvZrbY6YZAlBs
         dmWpL6l288MbMkML9MdMgA3Bcalu1ORZ3lmfJDkm2DE7Bw9LCM9GwNE5HHjfKPQuB3CC
         nrM3ithVpVgKCzQrYLIYYwE6eTInjjaA31AWDFN9HluPnrOlAIagcOyc+f3El2RAVNmD
         fAw8L3MuFGvavk/tE+5UMtAFODUd4Y/rDOpIpoKCMs24lcVY+ig0GxO8axa9hJeNCos3
         XRwgf02VXfXcNOCl4N0UqgRkDRR8+x+EXTD840qArMHA/LYqmgHsV7GSeQCPuEFsyV0O
         GAdA==
X-Forwarded-Encrypted: i=1; AJvYcCVtAEgnw9PXeSlD7lAjvVTCeicKAXzIMPyPcz9NeztIWf1QUvHx0PzIpPOlzTekUxv9HrnmSrebJhGA/PmqwRW7KTSuHQ40roo=
X-Gm-Message-State: AOJu0YxXEpN8bABfQDg8TvOuXLkGQAwh4Oi5kQXKubntwq7AF+p4arbJ
	+1mDgyzhz0fNQPOL71g2IC4DXsChwjeUAHIkDmm5wrw8EiiHw395WNx6ASEIRiTu7tbF70fAr3K
	l6X0zMj0ycN+AcsHJHoOcRXtsZUlIvLUxMWgG9EpcTkByL6fbOlHs4Fg=
X-Received: by 2002:a05:6402:5d3:b0:565:c814:d891 with SMTP id n19-20020a05640205d300b00565c814d891mr2108655edx.0.1710436563929;
        Thu, 14 Mar 2024 10:16:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHpiQiYtlVEkMxL0Um6412Pz19nDaf4h9YSERjM68EoccsOsNTvC2KFnAl6vcMHFJMKQA9igw==
X-Received: by 2002:a05:6402:5d3:b0:565:c814:d891 with SMTP id n19-20020a05640205d300b00565c814d891mr2108591edx.0.1710436563299;
        Thu, 14 Mar 2024 10:16:03 -0700 (PDT)
Received: from thinky ([109.183.6.197])
        by smtp.gmail.com with ESMTPSA id g17-20020aa7d1d1000000b00568a44036a2sm546147edp.46.2024.03.14.10.16.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Mar 2024 10:16:02 -0700 (PDT)
Date: Thu, 14 Mar 2024 18:16:02 +0100
From: Andrey Albershteyn <aalbersh@redhat.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: ebiggers@kernel.org, linux-fsdevel@vger.kernel.org, 
	fsverity@lists.linux.dev, linux-xfs@vger.kernel.org
Subject: Re: [PATCH 21/29] xfs: add fs-verity support
Message-ID: <lveodvnohv4orprbr7xte2c3bbspd3ttmx2e5f5bvtf3353kfa@qsjqrliz4urs>
References: <171035223299.2613863.12196197862413309469.stgit@frogsfrogsfrogs>
 <171035223693.2613863.3986547716372413007.stgit@frogsfrogsfrogs>
 <20240314170620.GR1927156@frogsfrogsfrogs>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20240314170620.GR1927156@frogsfrogsfrogs>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2024-03-14 10:06:20, Darrick J. Wong wrote:
> On Wed, Mar 13, 2024 at 10:58:03AM -0700, Darrick J. Wong wrote:
> > From: Andrey Albershteyn <aalbersh@redhat.com>
> > 
> > Add integration with fs-verity. The XFS store fs-verity metadata in
> > the extended file attributes. The metadata consist of verity
> > descriptor and Merkle tree blocks.
> > 
> > The descriptor is stored under "vdesc" extended attribute. The
> > Merkle tree blocks are stored under binary indexes which are offsets
> > into the Merkle tree.
> > 
> > When fs-verity is enabled on an inode, the XFS_IVERITY_CONSTRUCTION
> > flag is set meaning that the Merkle tree is being build. The
> > initialization ends with storing of verity descriptor and setting
> > inode on-disk flag (XFS_DIFLAG2_VERITY).
> > 
> > The verification on read is done in read path of iomap.
> > 
> > Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
> > Reviewed-by: Darrick J. Wong <djwong@kernel.org>
> > [djwong: replace caching implementation with an xarray, other cleanups]
> > Signed-off-by: Darrick J. Wong <djwong@kernel.org>
> 
> I started writing more of userspace (xfs_db decoding of verity xattrs,
> repair/scrub support) so I think I want to make one more change to this.

Just to note, I have a version of xfs_db with a few modification to
make it work with xfstests and make it aware of fs-verity:

https://github.com/alberand/xfsprogs/tree/fsverity-v5

-- 
- Andrey

