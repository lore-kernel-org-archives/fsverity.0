Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A77C34FF6C
	for <fsverity@lists.linux.dev>; Thu, 12 Mar 2026 13:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773323466; cv=none; b=IcWzahoEcPc6GkpEF1TqV9im4ZJyDnjSsPIsmqa3bx+h7YpXjSFNYN2Q5KDGJcSra017d7zigBDHkAgBVKwHm0VVUvpoI0KBwcPUQHiPHOAjpNaALRAAWsSdZbYdANA05QiJWBDHJQxrk/jcGvMNaOZ+gzXc9GWd+qTv+OLQ2bM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773323466; c=relaxed/simple;
	bh=m79QPg3lZxtO3qB8FGmL4feJvOHf6hv0uj9IuHB+gbQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=oCSgeCZ5wbsq9weL+4ymFHZlejk4yDSfL/3iB3xUS32PyWL3MymzjSimtorAzIudUFAHcyHXNVNXqkPC1uUx+2WLMg0XPIbXhFXkzVeYsFbOUSzeLg40C8bbpA4cNnhx2JqeSJuw9WA/o0F9STe0wxHGM8GfqFJ+2qI19U+bfZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=I/9NUr31; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="I/9NUr31"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773323464;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lusPCuwgPIO7EacrWQT9X+JN0PBRkgLuOI7TKiRgdsk=;
	b=I/9NUr31VX6T85P5Mfx4ZOBKgrHPlIbZXj09zBoKFUA16Wa4Cbr+CbcSf4sV49MBd7aihX
	QldwtdFlqHYwlRcy1GqFEYw28Bq/l1z2EXwqOJRLsZZz07PwNEQadTaIfvS2voLoNCSE1J
	fRvIh3xWPkrF7TPX9iYRAw8H65YcKHo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-657-VybopOjgO7Wz6pPBESdb7w-1; Thu, 12 Mar 2026 09:51:01 -0400
X-MC-Unique: VybopOjgO7Wz6pPBESdb7w-1
X-Mimecast-MFC-AGG-ID: VybopOjgO7Wz6pPBESdb7w_1773323460
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-48531e8ae62so7679425e9.3
        for <fsverity@lists.linux.dev>; Thu, 12 Mar 2026 06:51:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773323460; x=1773928260;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lusPCuwgPIO7EacrWQT9X+JN0PBRkgLuOI7TKiRgdsk=;
        b=Y6eSNBi/tOD/x9vBDS1lIV7+kMWpPvZ1hepqsw7oZkVNc1UDumzn341tR+duXMRs92
         dL1nbQTd/v/PuVcFwpnQ+tG58KPD76OKA4/zvOvQPfm2ecfZMUVOQtFJ5UuNenDeFBoU
         CsYpcnVG0Z2YbgJZclhmCM3ZT0lDak0P0IhDTnuTT6bdUUjWC9pjyztbmMz2wbwug/Hx
         afqPewxXEJ9rDkQGcO0Onb8ngBrwKuKGdNP6Mw5ei7RFOat/HnFp/+16lrlZX9nxfsjw
         a61/4HuaGCgw0SF2k/wFygQr5uPSwXO0JweqKEQUZ+BRn06S6qD1lJHfKiEtCZourzGw
         nlYg==
X-Forwarded-Encrypted: i=1; AJvYcCWKKsy0F1ffwUiZqKsdPe0TGd+OtlP2nBP5KAtf3j2uvNVpabYOVxyIOSYfqa8eIHK2ij8G5WGaXg==@lists.linux.dev
X-Gm-Message-State: AOJu0YytlPc1rHjcVbalikAUBkj+ky4Avwv073qRWqk1mn9kaWQ4ChqC
	aCpfTkG0kdBtb6twujWeVAlhl8RyjNpKX2QRLvp3cNfZ/YEX/RdUM5IVyksxidFCbvuSU95m5Zo
	dW+r3MzYysQ4Hwl6jX0/np77afHxdjlvVIEm7aJEfNcx56Pxjg4g02B/9fUI=
X-Gm-Gg: ATEYQzyVF8s5O27aFLlfgX+YDPeYUdmEPeQ3YcH57eILIxCfUIVJw6KYuMijuXJOfXR
	veFpPy1QmWY5b26ytyqYDr1pkmfPMDKkW2LH7qU3yqwdtAgmSWqsJAhSAXtqKJKoG6TN6x4tldt
	b+vd024OS5ol9un30E78zIRjaqw0yemziKIJUnBzFjPBGIeKr2lXCtPpyPUwu44rH/lNznUlIyE
	fvhSSiDa4DeSa3+bDSQdLrq8yuBpZZ8Nxy+3xaw3fkuRmntpagKW14yd2UHQ2ZDLxaGGoxrNWCe
	AhBv9nYnEsnlTARUPZazbZaw3/S4xehhm7qaPRzHFj61Du0z+k77RiKyC6O1lmiJZnEQaaabSn/
	s59R0OtlOabo=
X-Received: by 2002:a05:600c:1e8f:b0:485:2ce2:4c8a with SMTP id 5b1f17b1804b1-4854b0a4c24mr109098005e9.1.1773323459804;
        Thu, 12 Mar 2026 06:50:59 -0700 (PDT)
X-Received: by 2002:a05:600c:1e8f:b0:485:2ce2:4c8a with SMTP id 5b1f17b1804b1-4854b0a4c24mr109097485e9.1.1773323459224;
        Thu, 12 Mar 2026 06:50:59 -0700 (PDT)
Received: from thinky ([217.30.74.39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fdf09abesm8106385f8f.0.2026.03.12.06.50.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 06:50:58 -0700 (PDT)
Date: Thu, 12 Mar 2026 14:50:57 +0100
From: Andrey Albershteyn <aalbersh@redhat.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: Andrey Albershteyn <aalbersh@kernel.org>, linux-xfs@vger.kernel.org, 
	fsverity@lists.linux.dev, linux-fsdevel@vger.kernel.org, ebiggers@kernel.org, hch@lst.de, 
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
	linux-btrfs@vger.kernel.org
Subject: Re: [PATCH v4 19/25] xfs: remove unwritten extents after
 preallocations in fsverity metadata
Message-ID: <ymisdrze3ohdnxa4inqfwp4riaz4qk5nmtil33adn5ukhngq7v@f3tcv3hbzobz>
References: <20260309192355.176980-1-aalbersh@kernel.org>
 <20260309192355.176980-20-aalbersh@kernel.org>
 <20260310012914.GG1105363@frogsfrogsfrogs>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260310012914.GG1105363@frogsfrogsfrogs>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: RlnnKoUvxKtNPxKLYskYqTnqtlpRwwONgZ262nbIp4s_1773323460
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2026-03-09 18:29:14, Darrick J. Wong wrote:
> > XFS preallocates spaces during writes. In normal I/O this space, if
> > unused, is removed by truncate. For files with fsverity, XFS does not
> > use truncate as fsverity metadata is stored past EOF.
> > 
> > After we're done with writing fsverity metadata iterate over extents in
> > that region and remove any unwritten ones. These would be preallocation
> > leftovers in the merkle tree holes and past fsverity descriptor.
> > 
> > Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org>
> > ---

> There's an upper limit on the number of blocks you can unmap/free in a
> single transaction.  Maybe move the xfs_trans_{alloc,commit} into the
> loop body?
> 
> Oh wait, you skip the written extents.  Ok, so maybe just roll it after
> you've done a bunmapi.

I see, I will add a rolling transaction. Btw, why skipping the
written extents let's us use rolling here?

> 
> Do you need to purge the cow fork too?

hmm, what case are you thinking about here? The fsverity is written
in past EOF region, I don't see how COW extent could be left there.
Can they somehow be left mapped for blocks past i_size?

-- 
- Andrey

