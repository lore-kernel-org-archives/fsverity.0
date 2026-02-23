Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC6DF29AB07
	for <fsverity@lists.linux.dev>; Mon, 23 Feb 2026 15:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771859430; cv=none; b=kjaNpjf+q/zjDXrRVeindWaJY4TyEx50Vo0aaNQb9oHeDhxc7ymk4E7HxOHSiQroqubLPsTinjwGX4lxQwe80Ioi/IIGZyyPG2K3y5EnuOejWSZXnUV693WQ0kvHn8PeyUNiFkDQZEvcenEEmKtzLBCNYDxJQB7TJtZbnBqjxuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771859430; c=relaxed/simple;
	bh=ajbFxcQIg7kiK+LNtaEKR4J6yZsldAS3Pd3wK1n42zo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=tpdztmrvdVjz81tpDtF9O4oU8xy7414uMFDgvUWeEO/Nihb07ZR1e0PdM+saUg+vtFnBuxM6bF7SL490v9H6rlItPuL8/XQJiwlJRG+5V6XyZ/8WcyDGwox+zPPD6Z1VNfclMGQNiadKCDiUuYfVw64+3SZ/+cgmcqcX6rkqWEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=b77f9FKl; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="b77f9FKl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771859427;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7toYPkkmoQQ1IjdzTLbC2+SMDXKjnI0hCgkq/dBEBHU=;
	b=b77f9FKl3b6wsDciH2kTNG9nensYxmEzeMpljaMpD6EQq8taCIyh4T12uB7Idhi8nsOtDQ
	kvPgN5yirujSNnTkLXgxWzPE7u5vIQ9iOr0UrorDsTY6ycOcXsJ7HUO5lfHfT9LvJHBOS1
	RsVaNUOyIMj+OWl3m00cIcC39JilhYk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-413-lVQnOE5ZMBKxOjZFjHFHng-1; Mon, 23 Feb 2026 10:10:26 -0500
X-MC-Unique: lVQnOE5ZMBKxOjZFjHFHng-1
X-Mimecast-MFC-AGG-ID: lVQnOE5ZMBKxOjZFjHFHng_1771859425
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4836fbfa35cso30950185e9.1
        for <fsverity@lists.linux.dev>; Mon, 23 Feb 2026 07:10:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771859425; x=1772464225;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7toYPkkmoQQ1IjdzTLbC2+SMDXKjnI0hCgkq/dBEBHU=;
        b=fEglKbJiqLwzGMNgydkhCDk2/dDG8PSzBFVUEWEwYzhACrAx1E+M2eC/bsXpS7jvR1
         oZSbyvFgrP3gBZlBnYier38S8Fh2LVq/dKfOJfknF/T/3hVvDFSJmxkYBmKQqRTDfVBw
         Sj+gsuS4QQ1Stgm2HQvuuhDFHXp/USNZcu/DVlj1U3pQa0cbEIY7aYpvnP9aWMYvlSD6
         4640/p3uCDUX+B+fevlYW2vfDf3iYex28eV1epUmTvc1vLv/mmZtdciO/tjB3SrB0lZY
         hqFnh+c8yXtwiQZ2fd/wDS7btOWNqAWTwPMJCamrBGbj+mtYvj8UEA3+SwbWqCsybfQq
         Fw1g==
X-Forwarded-Encrypted: i=1; AJvYcCVcCW8uudhG3RlX8nxqDhwAzBNhq3bdsm+LOST6cEKM4Ejdqn3H/rB1otpk4EDuQ56toA6J1prl0g==@lists.linux.dev
X-Gm-Message-State: AOJu0YzEZ0Qj7QMzXIdvFzi9vRP2ksAqdlu6bkZ4Mi5vJTZPREOlxuaE
	FqDuhcx03J3Q+B7z9DthQnkXVao7QMnax2Tnq8wn52Ail9+a2FqIkWuMRCzUHfr8F1SY+FcV8nE
	x6/+b7nriZx0YYni1lI0/Qr3kRHCEQXOGrE4FPZq2IbACCyrY9je2+E8jG2k=
X-Gm-Gg: AZuq6aJwYIfkdC19w5Te+VGRqT0sphTaoL21aDtFqdolW2kXecTNRBM2YJ12dswjWor
	VEQdeYhktvIa3FrpjlOK/gQ/6mg0YvglbTi1jVT4B3cHEBFNn+NvNEcLtJ0rkk2auZ++FKqZ+eS
	NYeEAuSquo2MWzUKLzQjysh1Sd1jnBEclZDPx0lv4NLl+j4n+NWzCpFMLiZP7LHlpwUpZ016t7/
	VUxor8Rj9aukw8Z6FfBBHa1YyTbe+7XuQxuzy7cUSisP9xw7OQKsPL7CO+e2p+pQcQxy/04xm+Z
	agI/jkJXpppjgBsXRx2gh6P8FPS6a53410OQMaaYI0gtkCpsfW3aoQCeTxiKOXe6Igd6hlmoTku
	uddJlY8NFFqc=
X-Received: by 2002:a05:600c:3f14:b0:483:703e:4ad5 with SMTP id 5b1f17b1804b1-483a95e2563mr126160845e9.22.1771859425031;
        Mon, 23 Feb 2026 07:10:25 -0800 (PST)
X-Received: by 2002:a05:600c:3f14:b0:483:703e:4ad5 with SMTP id 5b1f17b1804b1-483a95e2563mr126159955e9.22.1771859424262;
        Mon, 23 Feb 2026 07:10:24 -0800 (PST)
Received: from thinky ([217.30.74.39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a31f9475sm249120765e9.14.2026.02.23.07.10.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 07:10:23 -0800 (PST)
Date: Mon, 23 Feb 2026 16:10:23 +0100
From: Andrey Albershteyn <aalbersh@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Cc: Andrey Albershteyn <aalbersh@kernel.org>, linux-xfs@vger.kernel.org, 
	fsverity@lists.linux.dev, linux-fsdevel@vger.kernel.org, ebiggers@kernel.org, 
	djwong@kernel.org
Subject: Re: [PATCH v3 11/35] iomap: allow filesystem to read fsverity
 metadata beyound EOF
Message-ID: <ujwgs5xb6rienyskr7qbekmsbyn5qea2ew4untas5drqdufirp@2qea2ndmnchs>
References: <20260217231937.1183679-1-aalbersh@kernel.org>
 <20260217231937.1183679-12-aalbersh@kernel.org>
 <20260218063606.GD8600@lst.de>
 <hfteu6bonpv7djecbf3d6ekh56ktgcl4c2lvtjtrjfetzaq5dw@scsrvxx5rgig>
 <20260219060420.GC3739@lst.de>
 <qheg77kxcl4ecqdrsnmz4acfvszjlamlb7ilgxxyf3pmt4r7ah@5fzzmcpurdfp>
 <20260219133829.GA11935@lst.de>
 <bltgc6uliclhzkuqd4la2tzp6x7vsww73nvjedxh7s624tby3k@jw4ij5irh6ni>
 <20260220153113.GA14359@lst.de>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260220153113.GA14359@lst.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: DXhv5ngCBEDMR2PMs6452CvgHSQVsyPDcTN4fM6sI5U_1771859425
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2026-02-20 16:31:13, Christoph Hellwig wrote:
> On Thu, Feb 19, 2026 at 03:23:11PM +0100, Andrey Albershteyn wrote:
> > On 2026-02-19 14:38:29, Christoph Hellwig wrote:
> > > On Thu, Feb 19, 2026 at 12:11:18PM +0100, Andrey Albershteyn wrote:
> > > > > > fsverity descriptor. This is basically the case as for EOF folio.
> > > > > > Descriptor is the end of the fsverity metadata region. If we have 1k
> > > > > > fs blocks (= merkle blocks) we can have [descriptor | hole ] folio.
> > > > > > As we are not limited by i_size here, iomap_block_needs_zeroing()
> > > > > > won't fire to zero this hole. So, this case is to mark this tail as
> > > > > > uptodate.
> > > > > 
> > > > > How do we end up in that without ctx->vi set?
> > > > 
> > > > We're reading it
> > > 
> > > Did a part of that sentence get lost?
> > 
> > I mean that to have ctx->vi we need to read fsverity descriptor
> > first. When iomap is reading fsverity descriptor inode won't have
> > any fsverity_info yet.
> 
> So for ext4/f2fs the pattern is that it is set by:
> 
> 	if (folio->index < DIV_ROUND_UP(inode->i_size, PAGE_SIZE))
> 		vi = fsverity_get_info(inode);
> 
> i.e., only for reading the data.  OTOH, for iomap we do:
> 
> 	if (fsverity_active(iter.inode)) {
> 		ctx->vi = fsverity_get_info(iter.inode);
> 
> which means it now is set for all I/O on fsverity files, which
> is subtly different.

I see, I will clarify this.

> 
> (You don't actually need the fsverity_active chck, fsverity_get_info
> already does that, btw).

Sure, will drop this

> 
> I'm still not sure what "When iomap is reading fsverity descriptor
> inode" means.

"When iomap is reading fsverity descriptor, inode won't have any
fsverity_info yet."

sorry, missing comma

> 
> > > Another overly long line here.  Also we should avoid the
> > > fsverity_active check here, as it causes a rhashtable lookup.  F2fs
> > > and ext4 just check ctx->vi, but based on the checks above, we seem
> > > to set this also for (some) reads of the fsverity metadata.  But as
> > > we exclude IOMAP_F_FSVERITY above, we might actually be fine with a
> > > ctx->vi anyway.
> > 
> > Don't you confused this with fsverity_get_info()? I don't see how it
> > could cause lookup.
> 
> Yeah.  Still, having ctx->vi implies fsverity_active, and follows
> what we're doing elsewhere.
> 
> > 
> > > 
> > > Please document the rules for ctx->vi while were it.
> > > 
> > 
> > Hmm, the vi is set in iomap_read_folio() [1] and then used down
> > through I/O up to ioend completion. What info you would like to see
> > there?
> 
> See above, unlike ext4/f2fs we set it for all I/O on fsverity inodes.
> And afaik we don't actually need it, the only use in the fsverity
> metadata path is the fill zeroes hash values check (which I'm still
> totally confused about).

Yeah, for metadata the only use is to fill zero hash blocks. I will
try to split it so lookup happens for data and holes in fsverity
metadata. This way we would have less lookups for metadata.

-- 
- Andrey

