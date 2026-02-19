Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629F133B958
	for <fsverity@lists.linux.dev>; Thu, 19 Feb 2026 13:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771506601; cv=none; b=L29lxBTw9Z6+QczJmz3wM6I/vBXF7frHDPTKbmVc/nHHMuufgxzot4Jag4R4EZo4o3tq6oi6Cy/sF63wSeAUlEArJIkdWelFFXCgzZCNuPxTb5NMHEtYhhTlMB/o+Z/Tf7dt1SKimGHrmp/THahsCMGsMqTzxT/0Ch2abkumxi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771506601; c=relaxed/simple;
	bh=H6GbZk5mdMnT9e3o9j/Gu86s2cpxHt7MmO2p6vvqV9w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=hT6M94JjL0u148Bjg/U6szllKt0ztKC4H45Jm1dlvdWNlC+uhO6Q8Qns6dWeNFUbyJIqPNPUDce0POyB9NHFmQjqtCX0T+U7gOzc0A7P9PvpFCOUsOHvOIqbQEW8w4NHzsS8zunZWoTFuYH4c/up4ZrzyfkocJIew2NkQor12yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=P+M+Et0Z; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="P+M+Et0Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771506598;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=86TIrp4laa0pBu7H21TRyyRDI/9QW6qy9OH6ZIij+k8=;
	b=P+M+Et0ZnVCC2psPRg3hE1rV86bhZRyVR129HdRRmct+ze5GHKjv0p4xDZ41nI+tAU4c9v
	zZiaUuwrXB4kqjlT7nGASt8jCe6608x7gQjN5mwUA/zXz6RRYWTscj74nn8/e0YEpm0LMO
	Wao/UrJ2AmYwwZBikeNBt35zlRA4ksk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-605-AURtVGH9PMml9vySoBnPaQ-1; Thu, 19 Feb 2026 08:09:57 -0500
X-MC-Unique: AURtVGH9PMml9vySoBnPaQ-1
X-Mimecast-MFC-AGG-ID: AURtVGH9PMml9vySoBnPaQ_1771506596
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-483786a09b1so9631275e9.3
        for <fsverity@lists.linux.dev>; Thu, 19 Feb 2026 05:09:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771506596; x=1772111396;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=86TIrp4laa0pBu7H21TRyyRDI/9QW6qy9OH6ZIij+k8=;
        b=jF5e1TgssSWqzICNCfB5K19AMtVkRfoVA/pQCS03MNDHQjXtTGSh3ssBRhacSpGEhW
         8E4WhzJSQRpstywBRReGLAMdmoPUSMXtBOc4KvCf2uhG7jr/cmdhLwDl1RaZMfCLklLU
         hKq7SyIkJC83lXi/eBoJA0ee3d0X3b0l89Px4oxblxcUJxA/eBxDDyisW0b8PVWkxv/W
         mpRR4RjYaw056upPCrc3VaJT5CdyGPirKIB0VT9MULyKCCx+EEvYuCmmKo22Ul3KBGU8
         JxjqDXuj08BUeLHZpqcCoG5zFihCeXtT18zLmPZDzT0ZeutphiTnE5y/xhqu8tJVSJhV
         tZ2w==
X-Forwarded-Encrypted: i=1; AJvYcCVEnaAiCUd8QrGIZX/xuNoN+Js0lmz5YAa4pi7mkQwwWGuCDUpznDStG6PqyyhGjyTkJxkEhhmn0g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzy1vI8JMaP4QD+HEjK9Nm6bvVa1s5ifNe+sS2E8BULvgkHyC/L
	OffWNjrzQ6hMAHKBjla4VTXDI/LQ//8ydqrO7UZmnVMouaxqqR6Aab312h3an2l52xJ6i0JTIYr
	3nkF49Xr75cfXdYnwGcxxWG0ZyXI+768bMSm68R1ZDHXoytKo3BgNxjYaUmE=
X-Gm-Gg: AZuq6aJni5D0DtN768l8wNJSY8fRy4Yo/LLm/GMfBHGOK3aJ4jCDYUSVUwrvSDyat9+
	0ygxwUTHZxRcOpurmuCPa0FsHaIlY8T2niv02zFMIjFkrftKMta5Mxojhnd5LuJCAwFf1okbzok
	32FIxwBw5uQK17tRhmLIwd8AnNcewFWWlB90nNwpXqAb9QIH6mDzgh3r8IVTIeAN82EZ2nqPa7o
	MovwOWK/isEmqUVGSxY+SI1+HMDb+A6WAXGkdTqT/ofCH8xtWMt/TbQQImDAX1c44qq+vihBL0y
	W0T1AypfSgUwppyR2BfnYpYNlRkUCk8mlksYWp8RvLfHD9sW2nK76zRLnbdkl8XEywWNLbVy/n7
	ErMxjQyZCZo4=
X-Received: by 2002:a05:600c:8b70:b0:483:54cc:cd89 with SMTP id 5b1f17b1804b1-48398a548c5mr100843255e9.9.1771506595883;
        Thu, 19 Feb 2026 05:09:55 -0800 (PST)
X-Received: by 2002:a05:600c:8b70:b0:483:54cc:cd89 with SMTP id 5b1f17b1804b1-48398a548c5mr100842775e9.9.1771506595304;
        Thu, 19 Feb 2026 05:09:55 -0800 (PST)
Received: from thinky ([217.30.74.39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4839f978328sm20400695e9.14.2026.02.19.05.09.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 05:09:54 -0800 (PST)
Date: Thu, 19 Feb 2026 14:09:54 +0100
From: Andrey Albershteyn <aalbersh@redhat.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, 
	Andrey Albershteyn <aalbersh@kernel.org>, linux-xfs@vger.kernel.org, fsverity@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, ebiggers@kernel.org
Subject: Re: [PATCH v3 03/35] fsverity: add consolidated pagecache offset for
 metadata
Message-ID: <xxpvkb5cmadxkifi3onmfmnaorw3emfzr32ha5n6kma2kvg54a@ueu4zhhzrglc>
References: <20260217231937.1183679-1-aalbersh@kernel.org>
 <20260217231937.1183679-4-aalbersh@kernel.org>
 <20260218061707.GA8416@lst.de>
 <20260218215732.GC6467@frogsfrogsfrogs>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260218215732.GC6467@frogsfrogsfrogs>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bgGCQCvVtEA1owlrZvpoo08hAOgzKX4OEcqy5ziSyAc_1771506596
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2026-02-18 13:57:32, Darrick J. Wong wrote:
> On Wed, Feb 18, 2026 at 07:17:07AM +0100, Christoph Hellwig wrote:
> > On Wed, Feb 18, 2026 at 12:19:03AM +0100, Andrey Albershteyn wrote:
> > > Filesystems implementing fsverity store fsverity metadata on similar
> > > offsets in pagecache. Prepare fsverity for consolidating this offset to
> > > the first folio after EOF folio. The max folio size is used to guarantee
> > > that mapped file will not expose fsverity metadata to userspace.
> > > 
> > > So far, only XFS uses this in futher patches.
> > 
> > This would need a kerneldoc comment explaining it.  And unless we can
> > agree on a common offset and have the translation in all file systems,
> > it probably makes sense to keep it in XFS for now.   If you have spare
> > cycles doing this in common code would be nice, though.
> 
> fsverity_metadata_offset definitely ought to have a kerneldoc explaining
> what it is (minimum safe offset for caching merkle data in the pagecache
> if large folios are enabled).
> 
> and yes, it'd be nice to do trivial conversions, but ... I think the
> only filesystem that has fscrypt and large folios is btrfs?  And I only
> got that from dumb grepping; I don't know if it supports both at the
> same time.
> 
> OTOH I think the ext4 conversion is trivial...
> 
> static struct page *ext4_read_merkle_tree_page(struct inode *inode,
> 					       pgoff_t index,
> 					       unsigned long num_ra_pages)
> {
> 	index += fsverity_metadata_offset(inode) >> PAGE_SHIFT;

I don't think it's that easy as ondisk file offset will be the same
to this. So, this will require some offset conversion like in XFS
and handling of old 64k offset.

-- 
- Andrey

