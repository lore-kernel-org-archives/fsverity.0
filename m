Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2ABF36BCE4
	for <fsverity@lists.linux.dev>; Wed, 14 Jan 2026 09:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768384388; cv=none; b=RujFuuJ1tytDnNA0COeYQxmBYAJ4ghyczdEIMQ1pVlVFErvFzaGe6USJurcq2+ZJQLdsczzxamz2sa4ro76n6In5aLjYdCEcMMJQPA4aP6JyekcRPy+/zWaqX9JN2NfzHRTNrqWMKOGq8e5xb/8ijwDJb8K0XFc7PsiVymwsWx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768384388; c=relaxed/simple;
	bh=j5dIhiNJiGy1Qtc22ykR0iIEoSppbe3oLD7npilDfdY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=cGVXHmw1r1nl7JNLNI0DTPKeINGvLOXGUVJAIrLivHj848EfzYCK/mleYiacM+VZJvtIr+XV5NDIgcp9iYVDouc2nt+mq24jAksSfl4ZNSFMZEpPqQxtt7b03S+xuyCLFRo2Owy+ixsqhWOem+W4n1o6U6N9uaWTBECA8PpLy1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PjDjfTps; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PjDjfTps"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768384385;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aSFGgkgkpAF2fQrg8Gq7zIy2TZqVfBWhEA5o4HTAphk=;
	b=PjDjfTpsTWOsBOmTZ7nUGJ0gMKYxueyBwzsCprD0eC1i7Wx02mlKMfd/bGhHJtcP5VxfX+
	3awtW+624kRS3jZeKRIEdOGB6gF5TeND+S22knHbeaOU4ZIO37W3je0NvYy9FG2t2F63rf
	yEkpwHY+y5NQ1NdWTIRI6fcsNw+q2ag=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-122-xpubNhdmMHaDCsTz2D3hDg-1; Wed, 14 Jan 2026 04:53:04 -0500
X-MC-Unique: xpubNhdmMHaDCsTz2D3hDg-1
X-Mimecast-MFC-AGG-ID: xpubNhdmMHaDCsTz2D3hDg_1768384383
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-47edc79ff28so9378735e9.2
        for <fsverity@lists.linux.dev>; Wed, 14 Jan 2026 01:53:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768384383; x=1768989183;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aSFGgkgkpAF2fQrg8Gq7zIy2TZqVfBWhEA5o4HTAphk=;
        b=kXd7V1tt+fpyf0EKbmRs0uDHdxCy8Vy00aYWO5q+SM52pB479a6a9wqFBdWYgfrbIC
         ELCjGa2uhXuyPp6UZNgvVSOU6ebkHOzN0HT0DNhaT9RRg8e3KR8O8mmSmSSL0kESPuP0
         1hD6Vlj9CppiPV6cQvAz1Gxp4WLl1suP4bDLFbWX/f0O9HzsYcULrmM6luF4tflskckI
         yZeHo4oTsUfiXL9VtgUjkGxvivmB8tKvHUG0Kr9pAZY6nDr86CnZod8Q3bHqiu1wyaH2
         BDoDpSySsYtv4nmPShu3nQ1TYjN0XwOHtd0DyFkGj+nfhfsZMNb73Jq4EvlSCy5CqwQP
         7W+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXt142dJBDNDOvuh9h0d67N4fVkbtKQfU90mFNJlzGiWQY/0RIiJfSkdKoU+Q7fY6VZPBWzheLThA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxRn5dQuRGqLfv2GstG1ehmQ360G9c0zzgeOdP0x1hTC49U6lGU
	BVEImeNKhFLalZ6cmoHaqsBGgVKxrxm4+CXOsyHNxNrNwgXiKidCrDutCURnj8gah31xlbdktVy
	jF3/ktvtdMNDvgCeNaVt81qL5QuCSqPxE4H36JjcAC0uWuhhUvPG9SPBRPMY=
X-Gm-Gg: AY/fxX5eCo7S82GZ+apx/BpUr/DcfmS/Ypd75OX9Mor0XKc4gtnY/iDjCBRQCm97lLN
	i9ydDkMyVOykR6+FRY0SozInuInaaxqnCtGmK05972UvUSwZLRVYpoVm0qZGtDooNcgU8ol87XX
	QY+SDJuKchEPlt2HmRSDUX3oyB05KA0qm+12zmYIYWaMvfF2j0r7jptF1iTlKH11K7Xg7iEbNEv
	7FTBtT+8BIDr1+n0AR4G1lYtd2NYbITM8Iavm5kAv7/XJui0LHB+Ug3rElCBMiS9SPOTthvAe0R
	J953Lnb11GeB885qGGxBPN5F9svUg4MO7jYDcupJ/1yf2fcCVbBgPyOPJqcSskgUL+bY3lOTOZA
	=
X-Received: by 2002:a5d:584e:0:b0:430:f790:99d7 with SMTP id ffacd0b85a97d-4342c504f28mr2510674f8f.27.1768384383085;
        Wed, 14 Jan 2026 01:53:03 -0800 (PST)
X-Received: by 2002:a5d:584e:0:b0:430:f790:99d7 with SMTP id ffacd0b85a97d-4342c504f28mr2510645f8f.27.1768384382674;
        Wed, 14 Jan 2026 01:53:02 -0800 (PST)
Received: from thinky ([217.30.74.39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0e19bfsm48777428f8f.18.2026.01.14.01.53.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 01:53:01 -0800 (PST)
Date: Wed, 14 Jan 2026 10:53:00 +0100
From: Andrey Albershteyn <aalbersh@redhat.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: Matthew Wilcox <willy@infradead.org>, fsverity@lists.linux.dev, 
	linux-xfs@vger.kernel.org, ebiggers@kernel.org, linux-fsdevel@vger.kernel.org, 
	aalbersh@kernel.org, david@fromorbit.com, hch@lst.de
Subject: Re: [PATCH v2 0/23] fs-verity support for XFS with post EOF merkle
 tree
Message-ID: <6r24wj3o3gctl3vz4n3tdrfjx5ftkybdjmmye2hejdcdl6qseh@c2yvpd5d4ocf>
References: <cover.1768229271.patch-series@thinky>
 <aWZ0nJNVTnyuFTmM@casper.infradead.org>
 <op5poqkjoachiv2qfwizunoeg7h6w5x2rxdvbs4vhryr3aywbt@cul2yevayijl>
 <aWci_1Uu5XndYNkG@casper.infradead.org>
 <20260114061536.GG15551@frogsfrogsfrogs>
 <5z5r6jizgxqz5axvzwbdmtkadehgdf7semqy2oxsfytmzzu6ik@zfvhexcp3fz2>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <5z5r6jizgxqz5axvzwbdmtkadehgdf7semqy2oxsfytmzzu6ik@zfvhexcp3fz2>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Eneg3ymy55n7mpkNbs4t9Eda9A4mqNaFiXbRkm6A-Dc_1768384383
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2026-01-14 09:20:34, Andrey Albershteyn wrote:
> On 2026-01-13 22:15:36, Darrick J. Wong wrote:
> > On Wed, Jan 14, 2026 at 05:00:47AM +0000, Matthew Wilcox wrote:
> > > On Tue, Jan 13, 2026 at 07:45:47PM +0100, Andrey Albershteyn wrote:
> > > > On 2026-01-13 16:36:44, Matthew Wilcox wrote:
> > > > > On Mon, Jan 12, 2026 at 03:49:44PM +0100, Andrey Albershteyn wrote:
> > > > > > The tree is read by iomap into page cache at offset 1 << 53. This is far
> > > > > > enough to handle any supported file size.
> > > > > 
> > > > > What happens on 32-bit systems?  (I presume you mean "offset" as
> > > > > "index", so this is 1 << 65 bytes on machines with a 4KiB page size)
> > > > > 
> > > > it's in bytes, yeah I missed 32-bit systems, I think I will try to
> > > > convert this offset to something lower on 32-bit in iomap, as
> > > > Darrick suggested.
> > > 
> > > Hm, we use all 32 bits of folio->index on 32-bit plaftorms.  That's
> > > MAX_LFS_FILESIZE.  Are you proposing reducing that?
> > > 
> > > There are some other (performance) penalties to using 1<<53 as the lowest
> > > index for metadata on 64-bit.  The radix tree is going to go quite high;
> > > we use 6 bits at each level, so if you have a folio at 0 and a folio at
> > > 1<<53, you'll have a tree of height 9 and use 17 nodes.
> > > 
> > > That's going to be a lot of extra cache misses when walking the XArray
> > > to find any given folio.  Allowing the filesystem to decide where the
> > > metadata starts for any given file really is an important optimisation.
> > > Even if it starts at index 1<<29, you'll almost halve the number of
> > > nodes needed.
> 
> Thanks for this overview!
> 
> > 
> > 1<<53 is only the location of the fsverity metadata in the ondisk
> > mapping.  For the incore mapping, in theory we could load the fsverity
> > anywhere in the post-EOF part of the pagecache to save some bits.
> > 
> > roundup(i_size_read(), 1<<folio_max_order)) would work, right?
> 
> Then, there's probably no benefits to have ondisk mapping differ,
> no?

oh, the fixed ondisk offset will help to not break if filesystem
would be mounted by machine with different page size.

-- 
- Andrey

