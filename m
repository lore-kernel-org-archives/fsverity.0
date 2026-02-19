Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E3B01487F6
	for <fsverity@lists.linux.dev>; Thu, 19 Feb 2026 12:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771505159; cv=none; b=IA6lPJHYwNHA42IHT4OJ1PEHZz2G5PZdodMzxK/mSwovh9EV7Nt8V3HcsUrjZSgQ3xEY2rbipzX2ba0s2CLvW02pW7Bj0p9GCoauKbePkrEaD4xNUqFtB5jtUPUaIfSyZG3fsO0rrWs7lwLrE/W3TVy2XbaWOkxxn4wyLTkqXPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771505159; c=relaxed/simple;
	bh=YZj+GxGcB2P5EaA2DiPIK6jUW8TyBkFDHxcApQg7DBc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=bFSzhfB2y0wRbreTrHaQeH8LO531ARvWoCFtxa0ixpG308d8mgGv8Ubp2nXGbjxxabiGulhfGvCqegEcu2s+Q4EHFFEwit2E8dpfoUEsrWUIZ4lw2mkU0HnR3+9E9E/R2NzqgsvJKPBZ8a8b+IWD9n/wRrIB39LuxWKY5Zaw9y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RKzzGsTx; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RKzzGsTx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771505157;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HAt8PmrU86SKVM1FRxExfTh0czVVLlWni+dAt41FBrg=;
	b=RKzzGsTxhbbxzMw93lnx3CPYugEXbHnAzOeJ06A7KrrckIg/VJcmpTO0pEJABJl8QGgQuC
	u6rYTdM0axIcpJx2c0//on9PwrrI4D5w77zN6q9qBxwXe2hM2dx1IoPjrRpPDsNhKj48PH
	nSCajdnTfadZtD0MyyPyuDqVPUg3mP4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-624-Sb7DnFA3OaCHaZGPox6EZA-1; Thu, 19 Feb 2026 07:45:56 -0500
X-MC-Unique: Sb7DnFA3OaCHaZGPox6EZA-1
X-Mimecast-MFC-AGG-ID: Sb7DnFA3OaCHaZGPox6EZA_1771505155
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4837b6f6b93so7575935e9.3
        for <fsverity@lists.linux.dev>; Thu, 19 Feb 2026 04:45:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771505155; x=1772109955;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HAt8PmrU86SKVM1FRxExfTh0czVVLlWni+dAt41FBrg=;
        b=kjddxRsaWTgawVl5C8NtOvnXFx6p1kX6oHkU9DrxZmntHFfq7hsrX4zjTsAFzIEryw
         b+rjS60SP0olETZCW9QoXlgpM+CPgr/zFue0sla/B3zfz9U4PeoXDFvOZSahQPeC9MSo
         fM7AyxdQurhM6Q26wo97y8HLP6GfOoZbXeP0DZ0+b6JtzCMmzi2604pM55VmLy9Im2PG
         fri/F8Kw8WtREfhtBFziL994vbNE94kW2K/aHKliBtHcrmBb6ZTDLYzBKHvzBtn4Am5e
         6W0IAtXAF4mZYc9Oje9mMWBSJL36coYPjneShPQ0ixkckd2rYbh9LmvGrwCX4QKHUsYi
         tdUw==
X-Forwarded-Encrypted: i=1; AJvYcCVif4x9qywcEBMNqNq4AgRCmuB5211H8nU+iDFvPUK0HLsbhFsXueLrtpL4eJV6fl2vJU04JX/QkA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzXwZZpNtgCq5QhsPFBq7LZ+A7ZHBYWwMEh4QeSWbCFgsTNMriA
	mCUEfd+ynujld3hfyhZ7cgsq+FaxF9t+We02mJhxhmhsnYtQRd0J5q/GKAmfr6SqukDb3+IYJTF
	xGIdqKihZ4zdIw/dBmXsH2ulwYjUk3DH4kcCj35A2r3fqSoACFhXGQfMGhaI=
X-Gm-Gg: AZuq6aLu0f55VRDtTlcBbrpGyisRG97ft3sBLcQ5EUI9ns1SdnaYPFrBe0Y6Ge3B/S0
	8NCOnWUPhS5dhuyLgQlvqbFoU0GwpJJx5XyT3qBWXqXAuGzMZCVTb8aBC+rsCm6F7ibaht/MqTQ
	UAsADir+1E98lsVagVF+uiGe9FlVkabsRFqr26RdVKhiChMvklmjMhJXAXnGj7sr9cQxFx//v9q
	NJGjPDuz/KLq3sUg6k3mBefjzgdzBa3WC2Tscpm9JjRobSJm9FoG4fXmLsai4ZTIaiSLWfRDgnh
	26gAeo04PeCQj++NDNeMwz8A2TDsbc3sTXy6PY4DG3TmsOwZ4ADqPABRyMo0lyXzzsGLg/WdcLz
	5F7Xin6h4dkQ=
X-Received: by 2002:a05:600c:3496:b0:47e:e779:36d with SMTP id 5b1f17b1804b1-48379bd72a9mr274885825e9.23.1771505154964;
        Thu, 19 Feb 2026 04:45:54 -0800 (PST)
X-Received: by 2002:a05:600c:3496:b0:47e:e779:36d with SMTP id 5b1f17b1804b1-48379bd72a9mr274885405e9.23.1771505154517;
        Thu, 19 Feb 2026 04:45:54 -0800 (PST)
Received: from thinky ([217.30.74.39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a31b1712sm2281905e9.1.2026.02.19.04.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 04:45:53 -0800 (PST)
Date: Thu, 19 Feb 2026 13:45:53 +0100
From: Andrey Albershteyn <aalbersh@redhat.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: Andrey Albershteyn <aalbersh@kernel.org>, linux-xfs@vger.kernel.org, 
	fsverity@lists.linux.dev, linux-fsdevel@vger.kernel.org, ebiggers@kernel.org, hch@lst.de
Subject: Re: [PATCH v3 05/35] fsverity: introduce fsverity_folio_zero_hash()
Message-ID: <rxgelentzvfkgygsyapfylqaja4dtpyh5v3yprjw4ay66bmmwc@koduf7u6tfon>
References: <20260217231937.1183679-1-aalbersh@kernel.org>
 <20260217231937.1183679-6-aalbersh@kernel.org>
 <20260218225303.GE6467@frogsfrogsfrogs>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260218225303.GE6467@frogsfrogsfrogs>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: C9Wlgtj_bIwbGxPy4OXvl4iRhTXqTR43YY8VQGXqrNg_1771505155
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2026-02-18 14:53:03, Darrick J. Wong wrote:
> > +static inline void fsverity_folio_zero_hash(struct folio *folio, size_t poff,
> > +					    size_t plen,
> > +					    struct fsverity_info *vi)
> > +{
> > +	WARN_ON_ONCE(1);
> > +}
> 
> /me wonders if something this deep in the IO path really needs a stub
> version?  Otherwise this looks ok to me, in the "vaguely familiar from
> long ago" sense. :/

I thought warning would be a better option for iomap. I'm fine with
dropping this.

-- 
- Andrey

