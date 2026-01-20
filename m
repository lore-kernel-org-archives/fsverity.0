Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B51142314C
	for <fsverity@lists.linux.dev>; Tue, 20 Jan 2026 11:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768909469; cv=none; b=Hv9S8doz3BuiubOQqKIaAiyzhcB+wxh+1fvJFwAAOzxXjLnTR05cjwAdNGwWsBm1MfG60dEgbWermZKVYgzef7FB/b0jX4T+01tGznhFdzkck02613wZSZJyOvPJf115ivIi9KwBsdGVQJwBZ1Z2+lNsrSPnAthlHA8owhklLOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768909469; c=relaxed/simple;
	bh=TiiXYzQUqQAZpwrQs2Qyyc4v41VwLgKHuTM7jdyKi+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=tvheWxA+pBPAOZQR7jbtIKOuEmOy/LBHzTYh6q5rOtZhk9Ex2Tw81GNRwkHc2jMpZYrzrm7y/jAl40CTCVzm7T+TgmtkyJNUZMCJcDXP1e4glFKbDQEuQ8b97dsUNu1/8tzxNy6CzRK5EopiT15a+HwZTOQ7Ty5rOH/H5tyuoHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Q6FZFSvC; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Q6FZFSvC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768909467;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VXQVvpxNNsGjingzXc9wZFJEzzxIAdMJuzmc45mqLJ4=;
	b=Q6FZFSvC1i3nUXIdw5q0IuDDjyNdmEzRLrsMFP4XOlMFJmFMtopTOHTDZDgMPwyu8Pfm9w
	dP3LuNGuWhVo+bFobSoP35A7YgIxrmXet3MIM71Ckw2kFY3WRYQa24U1wnnUoZ9BCPghg4
	sNVpbVqdDftaaclLWRZQOh0ge9VDce8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-626-uYY9Q87gOLWhtm169Xioig-1; Tue, 20 Jan 2026 06:44:23 -0500
X-MC-Unique: uYY9Q87gOLWhtm169Xioig-1
X-Mimecast-MFC-AGG-ID: uYY9Q87gOLWhtm169Xioig_1768909462
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-47ee71f0244so48349565e9.0
        for <fsverity@lists.linux.dev>; Tue, 20 Jan 2026 03:44:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768909462; x=1769514262;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VXQVvpxNNsGjingzXc9wZFJEzzxIAdMJuzmc45mqLJ4=;
        b=f9KG+E+Js3EaKmC0Ntf7HHDQmSIor3AW8g6XaSC3yhF2+AKZ1SOA+PQHNNqnA+xV0F
         DvDI3zdOOY1AjNqcC5YdDoOS7pjN8tMi4C1VVOA0/9Kv2+y24lDMmACRHLommaGEVm65
         H6oRzBJwzGtVDUP588l7H/oYtr+e8T2lFK6MjMcQZ8h/rw8gFlEJNz2gNoYBOfgTpM7P
         skw8ze3bYR4DggxrZoSZGymIViLsl7drp6lCSynKCv1BhZHouinfnMakxsKyba04BxJx
         Kk0z2Km3Mva94yPKXvls40/mA93A5acBDaBCe5EXiMd1E6V0m8p5SVM8eliGzvkEdDDE
         khzg==
X-Forwarded-Encrypted: i=1; AJvYcCWMAfulkcMriJEPV8W9Pz8cB3oA/hS4NLQJ/UtbrHwB/QEqRMDF2bVNMMZdsmD2WCkd3oDuiQSkXA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz2UcDYdL2ZXcej1NNFJBnNdXYRs85C6VQ7Z1K9C33vBjFXy0hP
	PWvyIJPWeAfWRq6qU1e9oTKMGlbVVqBmYXCqBjj5cBiDbc8XVg/aJk69TRvuVn7LZMFuZd7bzaK
	lwaNhYqSEIpfpngq3bmeFcu4TLXpAB6b6zZl+MaJB7LOuBLRWAAlfkRQ4gx8=
X-Gm-Gg: AY/fxX7MKmGYOJ/xEIglHyG6T88KwPa40ey5rjCIoKs73aBeif8DuiLfx0BePwPFbIa
	R0p30WmZ4ofj3vMs775Pdpx6yRdLM9zmY4PrHfdo8XVO7brOHBm5r4dME6xqX+2B37Gm+X8IUL/
	OKzGgQv/TSuCRosQaGJnlfKnyEQX7HoY3wZ02WRJZcDxxyt5Q8MihwpMP3M9oJCCYBpzViM5/qQ
	28ERgmEV3fNhl5wdewwEB+Ec5HEdzVcIyyQdedfkg2vB3Gv49uAWNOqH4+mLHPAqxrly8EWEnbO
	RFY5GSIF8I97HrRxLy5x7ZURaAh1jlQw77/i38gijuFAmQ5I0VwCiYZUYl3/6+kmMmRB8gKF9D0
	=
X-Received: by 2002:a05:600c:4448:b0:47e:e20e:bbb4 with SMTP id 5b1f17b1804b1-4801e345c8amr179356715e9.26.1768909461634;
        Tue, 20 Jan 2026 03:44:21 -0800 (PST)
X-Received: by 2002:a05:600c:4448:b0:47e:e20e:bbb4 with SMTP id 5b1f17b1804b1-4801e345c8amr179356335e9.26.1768909461124;
        Tue, 20 Jan 2026 03:44:21 -0800 (PST)
Received: from thinky ([217.30.74.39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47f42907141sm300491595e9.9.2026.01.20.03.44.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 03:44:20 -0800 (PST)
Date: Tue, 20 Jan 2026 12:44:19 +0100
From: Andrey Albershteyn <aalbersh@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Cc: "Darrick J. Wong" <djwong@kernel.org>, 
	Eric Biggers <ebiggers@kernel.org>, Matthew Wilcox <willy@infradead.org>, fsverity@lists.linux.dev, 
	linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org, aalbersh@kernel.org, 
	david@fromorbit.com, tytso@mit.edu, linux-ext4@vger.kernel.org, jaegeuk@kernel.org, 
	chao@kernel.org, linux-f2fs-devel@lists.sourceforge.net
Subject: Re: fsverity metadata offset, was: Re: [PATCH v2 0/23] fs-verity
 support for XFS with post EOF merkle tree
Message-ID: <5tse47xskuaofuworccgwhyftyymx5xj3mc6opwz7nfxa225u6@uvbk4gc2rktd>
References: <aWZ0nJNVTnyuFTmM@casper.infradead.org>
 <op5poqkjoachiv2qfwizunoeg7h6w5x2rxdvbs4vhryr3aywbt@cul2yevayijl>
 <aWci_1Uu5XndYNkG@casper.infradead.org>
 <20260114061536.GG15551@frogsfrogsfrogs>
 <5z5r6jizgxqz5axvzwbdmtkadehgdf7semqy2oxsfytmzzu6ik@zfvhexcp3fz2>
 <6r24wj3o3gctl3vz4n3tdrfjx5ftkybdjmmye2hejdcdl6qseh@c2yvpd5d4ocf>
 <20260119063349.GA643@lst.de>
 <20260119193242.GB13800@sol>
 <20260119195816.GA15583@frogsfrogsfrogs>
 <20260120073218.GA6757@lst.de>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260120073218.GA6757@lst.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: FgExppEQLflN9ZjT_x08MgwmBKvydNcXV6-xgIjdMVc_1768909462
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2026-01-20 08:32:18, Christoph Hellwig wrote:
> On Mon, Jan 19, 2026 at 11:58:16AM -0800, Darrick J. Wong wrote:
> > > >  a) not all architectures are reasonable.  As Darrick pointed out
> > > >     hexagon seems to support page size up to 1MiB.  While I don't know
> > > >     if they exist in real life, powerpc supports up to 256kiB pages,
> > > >     and I know they are used for real in various embedded settings
> > 
> > They *did* way back in the day, I worked with some seekrit PPC440s early
> > in my career.  I don't know that any of them still exist, but the code
> > is still there...
> 
> Sorry, I meant I don't really know how real the hexagon large page
> sizes are.  I know about the ppcs one personally, too.
> 
> > > If we do need to fix this, there are a couple things we could consider
> > > doing without changing the on-disk format in ext4 or f2fs: putting the
> > > data in the page cache at a different offset than it exists on-disk, or
> > > using "small" pages for EOF specifically.
> > 
> > I'd leave the ondisk offset as-is, but change the pagecache offset to
> > roundup(i_size_read(), mapping_max_folio_size_supported()) just to keep
> > file data and fsverity metadata completely separate.
> 
> Can we find a way to do that in common code and make ext4 and f2fs do
> the same?

hmm I don't see what else we could do except providing common offset
and then use it to map blocks

loff_t fsverity_metadata_offset(struct inode *inode)
{
	return roundup(i_size_read(), mapping_max_folio_size_supported());
}

-- 
- Andrey

