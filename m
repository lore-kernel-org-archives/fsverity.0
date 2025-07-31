Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF3F2C15A2
	for <fsverity@lists.linux.dev>; Thu, 31 Jul 2025 11:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753962186; cv=none; b=luxht+fEnxb+Ok66XpS96UpUe6cTriqabCEIakhJqTOGfv2maOzj2BO7fBD7v3ISvYc3eosRiWQcJ45kWIHgTXIaT7jDUvdguielZAm0nSFOL4oNwW/HMX3ZMpeRmn9tpsI9YY6gpM8IUBMegTK/hZx0SbUsQydw9C7m/+xi9fA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753962186; c=relaxed/simple;
	bh=lPPR+xOELWOjgNYZPLA2fZ8JUQ13Q6IiXHiwQiLDycc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=LyzlWpiUXBeQlJy7Yy/rYSOqcUr/R9Nk1+RH1xh/nWfvC/x8yMDSlTboZZXzBuzPCHgfSZ/VjlaA8irCnMpq6sii46MLXBAwuVKYbAA9hsqm57SaBSfv84yPz2WRJqw6ud6ufb15/D+mzGWKa2M0qDx0VsbySOxo1wmorD1J3xM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PrNQOgZI; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PrNQOgZI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753962183;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fo+NPNjMxlQ2cBw7t4Z+XizD1fhqWsIHl9ucwxzn9EA=;
	b=PrNQOgZIcEe2XrcGQW8Qnjpm+hFEJi8WmZZYnRI9Gdshe5/7RmKlnJEFCSKuHtbVL1IZyd
	esNDizb4bI9L5iTJHBiA7m2EuRRAv5wrX4607ZmR/qfKmz7IW0ftYUhRdO4BpaHrT8LM7J
	BnzPnroR7Q8VJwGoh4T1gKnTYn00uCc=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-317-lx0PYeIgOo6wOPCb2HQL6w-1; Thu, 31 Jul 2025 07:43:01 -0400
X-MC-Unique: lx0PYeIgOo6wOPCb2HQL6w-1
X-Mimecast-MFC-AGG-ID: lx0PYeIgOo6wOPCb2HQL6w_1753962177
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-ae6d660903aso26628066b.2
        for <fsverity@lists.linux.dev>; Thu, 31 Jul 2025 04:42:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753962177; x=1754566977;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fo+NPNjMxlQ2cBw7t4Z+XizD1fhqWsIHl9ucwxzn9EA=;
        b=jjkl3M+HFYtHU1h7s1ihS8sQzeTivtegyvMAY3U3YyeXk0RL1CaxXortv1+qwvuvj3
         P526Nscu9uBsnfTn2gsoNxe/tjgTcy9sHIMP12QtQbE5MiwLNqWuL/qHLK5f7czT/xfw
         pMBMYPGXbfstgMGBO1c9ndwNj42U338GiAeavng/0YARMWmS+BixYsgkMbp2JSBpIZDt
         iPSKWvtBinPqsKDDJLrJtGLTkdsbTIvinj+GuDWLNKGVAeaQ5OREA6KktG3JU9p3pHwn
         Jj/bfcfmqmM0jXxqAg/wmKTF182FABxqZbjaioQ5RiOGilDL1q0+9w0n6UetoP3xdFqd
         bB+w==
X-Gm-Message-State: AOJu0Yx5Im6FyVMhXhx9oZedrwQEVNaycCmSDqgS7pjlF2Xm6Lf5HrXN
	tBHkBrKg0jjGl/Nj6kxD+HZCuo3xloY8V19s9fKeytvj2sVO/Jm/SsDE1IH0xRBgoFHHbpnWSJ6
	b975eZ7lmYYYQRzU0r17CZ+LYVufmM1kG+l6QJP5XY73XKL/1FOFG548KPEA=
X-Gm-Gg: ASbGncsOr3xsIgn3aVUyYeW+0Mtlz/P4e8QrZQQOnEQnJvYt0+qD7PELzfcK8YNC1J9
	krQfishOQXrQ65qxz7IpRgKm+qeqc667kW4yiUHaGDZZmSwlTDI4Asn65L2fanr6hApzKD2B1w0
	HUiS2vmAwuU++aC+859yLCv8S1B9HKc8eD1tj7/lrV5CDnWbVj/HzOr+ZgiZRRLCSEC+kBzaXbp
	JpppSbczyMjOf6bcCmQj70zVTt4yKAcZZs1zWp5yePoFqvXlZS/wOKSflgvqc3+iy92mI54+Atv
	IjIfrUz9gEXQ99ypYjj0CFnTqKbHucRi+z7AhjxWCo8YvdlnF2c2rTP/7dU=
X-Received: by 2002:a17:907:3da5:b0:ae3:cd73:efde with SMTP id a640c23a62f3a-af8fd9b8cd8mr840014666b.44.1753962176760;
        Thu, 31 Jul 2025 04:42:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE67P8ng9AVSUESMcuBOxJ0x4LQSgKEPKDtRaQgthvJXLuQrA842cvO1Io0AFJoyaHMXBrfDA==
X-Received: by 2002:a17:907:3da5:b0:ae3:cd73:efde with SMTP id a640c23a62f3a-af8fd9b8cd8mr840012166b.44.1753962176183;
        Thu, 31 Jul 2025 04:42:56 -0700 (PDT)
Received: from thinky (ip-217-030-074-039.aim-net.cz. [217.30.74.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a078a11sm98404766b.7.2025.07.31.04.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 04:42:55 -0700 (PDT)
Date: Thu, 31 Jul 2025 13:42:54 +0200
From: Andrey Albershteyn <aalbersh@redhat.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: fsverity@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
	linux-xfs@vger.kernel.org, david@fromorbit.com, ebiggers@kernel.org, hch@lst.de, 
	Andrey Albershteyn <aalbersh@kernel.org>
Subject: Re: [PATCH RFC 20/29] xfs: disable preallocations for fsverity
 Merkle tree writes
Message-ID: <hnpu2acy45q3v3k4sj3p3yazfqfpihh3rnvrdyh6ljgmkod6cz@poli3ifoi6my>
References: <20250728-fsverity-v1-0-9e5443af0e34@kernel.org>
 <20250728-fsverity-v1-20-9e5443af0e34@kernel.org>
 <20250729222736.GK2672049@frogsfrogsfrogs>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20250729222736.GK2672049@frogsfrogsfrogs>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: GVlnlW7Ed_KJVomRvc2y6NqYtvAal38EneLajSWe3xE_1753962177
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2025-07-29 15:27:36, Darrick J. Wong wrote:
> On Mon, Jul 28, 2025 at 10:30:24PM +0200, Andrey Albershteyn wrote:
> > While writing Merkle tree, file is read-only and there's no further
> > writes except Merkle tree building. The file is truncated beforehand to
> > remove any preallocated extents.
> > 
> > The Merkle tree is the only data XFS will write. As we don't want XFS to
> > truncate file after we done writing, let's also skip truncation on
> > fsverity files. Therefore, we also need to disable preallocations while
> > writing merkle tree as we don't want any unused extents past the tree.
> > 
> > Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org>
> > ---
> >  fs/xfs/xfs_iomap.c | 13 ++++++++++++-
> >  1 file changed, 12 insertions(+), 1 deletion(-)
> > 
> > diff --git a/fs/xfs/xfs_iomap.c b/fs/xfs/xfs_iomap.c
> > index ff05e6b1b0bb..00ec1a738b39 100644
> > --- a/fs/xfs/xfs_iomap.c
> > +++ b/fs/xfs/xfs_iomap.c
> > @@ -32,6 +32,8 @@
> >  #include "xfs_rtbitmap.h"
> >  #include "xfs_icache.h"
> >  #include "xfs_zone_alloc.h"
> > +#include "xfs_fsverity.h"
> > +#include <linux/fsverity.h>
> 
> What do these includes pull in for the iflags tests below?

Probably need to be removed, thanks for noting

> 
> >  #define XFS_ALLOC_ALIGN(mp, off) \
> >  	(((off) >> mp->m_allocsize_log) << mp->m_allocsize_log)
> > @@ -1849,7 +1851,9 @@ xfs_buffered_write_iomap_begin(
> >  		 * Determine the initial size of the preallocation.
> >  		 * We clean up any extra preallocation when the file is closed.
> >  		 */
> > -		if (xfs_has_allocsize(mp))
> > +		if (xfs_iflags_test(ip, XFS_VERITY_CONSTRUCTION))
> > +			prealloc_blocks = 0;
> > +		else if (xfs_has_allocsize(mp))
> >  			prealloc_blocks = mp->m_allocsize_blocks;
> >  		else if (allocfork == XFS_DATA_FORK)
> >  			prealloc_blocks = xfs_iomap_prealloc_size(ip, allocfork,
> > @@ -1976,6 +1980,13 @@ xfs_buffered_write_iomap_end(
> >  	if (flags & IOMAP_FAULT)
> >  		return 0;
> >  
> > +	/*
> > +	 * While writing Merkle tree to disk we would not have any other
> > +	 * delayed allocations
> > +	 */
> > +	if (xfs_iflags_test(XFS_I(inode), XFS_VERITY_CONSTRUCTION))
> > +		return 0;
> 
> I assume XFS_VERITY_CONSTRUCTION doesn't get set until after we've
> locked the inode, flushed the dirty pagecache, and truncated the file to
> EOF?  In which case I guess this is ok -- we're never going to have new
> delalloc reservations,

yes, this is my thinking here

> and verity data can't be straddling the EOF
> folio, no matter how large it is.  Right?

Not sure, what you mean here. In page cache merkle tree is stored
at (1 << 53) offset, and there's check for file overlapping this in
patch 22 xfs_fsverity_begin_enable().

-- 
- Andrey

