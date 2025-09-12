Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1AF1301028
	for <fsverity@lists.linux.dev>; Fri, 12 Sep 2025 11:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757678213; cv=none; b=qkffxRYYCuWcTRrcPYQwrcID894Ee6TL5mkIgrgQYTjBonya5SuQUJiqmpHsGISr7mbo9In1VuT/2DFhCWypOSFmvB6e1dsP5dWzo1HiHrivQ2QH1+BwGU9DuIT+kIVGjCSz5/Wlbd0sPwnqB2f+Xu9F8Jt5D6CReMydBEfToO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757678213; c=relaxed/simple;
	bh=+mNtg5JQLMkrEOEyHPRCbKpHStXXOyD5XtUgf68Si4Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=R4/TaZUldzt9iQFAu5FhhwmonvCCzCAlRSLunmxZwV7PCkTV/JkAghpWRWfrvhQPBYOpuwKNYgJ2Pdnxbb7sKQtG0s05XtR64seL6b11H4id14xYFzHaAvroON8Mvz0lqH6QyfvEXwaMsn1KoCkslXm3AsJnCYwRozvy2z+pcCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HLcNqfnZ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HLcNqfnZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757678210;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Z+6E05kBbROZjYHlECJ6pM3n90elFfaGg1KIjniWKd0=;
	b=HLcNqfnZtQIRRIrw/Pu50WCO0gl5DJMDQ27rYBob+wMyoWgD/2WNaS0RObKULVNJQJr0ds
	7XK5SzLjCVhN+LbZWspqnXGxVS0xhD98R66+G9UQrI//V99BoztWBPTu/A0L7hH64Jy0pe
	tQUH7lWkcT39ALBrE144BQFvWom8Myg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-630-LIp_0jGNOxiYogoChMADsQ-1; Fri, 12 Sep 2025 07:56:49 -0400
X-MC-Unique: LIp_0jGNOxiYogoChMADsQ-1
X-Mimecast-MFC-AGG-ID: LIp_0jGNOxiYogoChMADsQ_1757678208
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-45e037fd142so14212945e9.3
        for <fsverity@lists.linux.dev>; Fri, 12 Sep 2025 04:56:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757678208; x=1758283008;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z+6E05kBbROZjYHlECJ6pM3n90elFfaGg1KIjniWKd0=;
        b=fajYp4LC5VjLDw+s06DoF3YHUOzHWWyu3b9G9yl9JHDAhB1TVvTrXw2qXXn1YvCch+
         b2B8AUzxyripF9CIUPACNKuo5RsmM+E0hGW1DEcgT8BfiMovOM/wZKnKd3UJn/D01ndG
         sy3g0HJl0w086AZ1lE8mA+lpxWmFOqa/B7b26xtIfKEXxRKXm6+oqgPXevs+AvrHe+zd
         sJYQ24w18wUldQEnRSh3VPLs1JP4E/DkxI1Nq9tpQ6ItIpwj1xqLZE7BxXALd9QZEyLw
         /2C3BnPmL88RUAFtoOF5MZE9mxPC9pNBMRiDqz3oXMEWk1zPexVU3iCXNptq1qCd1LSP
         S/DQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmDtQyLeIBHlo72pMVdLJGQ8f84KBaYG6u88yBmd9uz4e0+R53sriSPPvZIAoqA2pcqKhqd/KpCA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxWizI28lzS7HvfFaHyZXt6LqKD8psB55Bvyyog/VThSLOyweK3
	9iF0JPZRegBuAfq/BMBIQ6tl/GiSrJQhkrv59AyotQwOn7+v11BvJ2N4vaVD//XR2K76ure06Iu
	7eUtLVGwZ1pl8bGCmuDW+5fCHfgmpoXDpuTbuBS29WgBQDcPC6anagh1boKI=
X-Gm-Gg: ASbGncv3mT4KtOlLn7NS1tdPVCzPIKmJVCBY26596RRUbtOMhaD09PN4ec7PdCjsZJt
	qNiUXjsNe66dpSYN/1GgkOM9uXQPHbN6O3s/bqXrzMtiSs6lSfqU9t1wu5HptHdMhWLZWvQK4VS
	C+JdgKniEei2SsOGjbBsHRzYY37M0uPwMAZohN26/w2S6hNRACrQHVHppusFaN0n1g+HVICzJby
	PpwC3sZJbb16Lu2cx3tZAmHNhmz+S+n37HxKEIUmyY2E2jQkh1npFdHamYfyXcNnQQq5962welU
	437lYoVdcw7KHi+ssilQ0glSbKpbVnrN
X-Received: by 2002:a05:600c:46d3:b0:45e:598:90b0 with SMTP id 5b1f17b1804b1-45f211d4640mr28993405e9.9.1757678207814;
        Fri, 12 Sep 2025 04:56:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFa3w2WIx7VIKrKrQtNbmGIs6VxkTekeX4oKYegwFajbDtX1Br0uRbrYVR+ymTQ7e9/hErz+g==
X-Received: by 2002:a05:600c:46d3:b0:45e:598:90b0 with SMTP id 5b1f17b1804b1-45f211d4640mr28993125e9.9.1757678207364;
        Fri, 12 Sep 2025 04:56:47 -0700 (PDT)
Received: from thinky ([91.245.205.131])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e037d741asm58941035e9.23.2025.09.12.04.56.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 04:56:47 -0700 (PDT)
Date: Fri, 12 Sep 2025 13:56:45 +0200
From: Andrey Albershteyn <aalbersh@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Cc: "Darrick J. Wong" <djwong@kernel.org>, fsverity@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, linux-xfs@vger.kernel.org, david@fromorbit.com, 
	ebiggers@kernel.org, Andrey Albershteyn <aalbersh@kernel.org>
Subject: Re: [PATCH RFC 02/29] iomap: introduce iomap_read/write_region
 interface
Message-ID: <khoyx76se2x2z2ktzelsklcqnbjl4budasczm2mjknkgvlsbph@gckk675qmqkj>
References: <20250728-fsverity-v1-0-9e5443af0e34@kernel.org>
 <20250728-fsverity-v1-2-9e5443af0e34@kernel.org>
 <20250729222252.GJ2672049@frogsfrogsfrogs>
 <20250811114337.GA8850@lst.de>
 <pz7g2o6lo6ef5onkgrn7zsdyo2o3ir5lpvo6d6p2ao5egq33tw@dg7vjdsyu5mh>
 <20250912071859.GB13505@lst.de>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20250912071859.GB13505@lst.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5q_F4cyZLtloV53wCrvnyrdwP52B6mFMIePRw3b97jM_1757678208
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2025-09-12 09:18:59, Christoph Hellwig wrote:
> On Tue, Sep 09, 2025 at 02:30:14PM +0200, Andrey Albershteyn wrote:
> > > Same thoughts here.  It seems like we should just have a beyond-EOF or
> > > fsverity flag for ->read_iter / ->write_iter and consolidate all this
> > > code.  That'll also go along nicely with the flag in the writepage_ctx
> > > suggested by Joanne.
> > > 
> > 
> > In addition to being bound by the isize the fiemap_read() copies
> > data to the iov_iter, which is not really needed for fsverity.
> 
> Aka, you want an O_DIRECT read into a ITER_BVEC buffer for the data?
> 

hmm, but we want fsverity merkle tree to be in page cache to use the
"verified page" flag. As far as I understand iter_bvec will need a
page attached anyway, so this is the same. Or am I missing
something?

And with direct io there's no readahead then, and we don't get any
benefit going through vfs instead of directly calling to iomap.

-- 
- Andrey

