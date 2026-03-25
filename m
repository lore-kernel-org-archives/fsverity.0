Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0C033D16EA
	for <fsverity@lists.linux.dev>; Wed, 25 Mar 2026 12:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774440529; cv=none; b=NwJ1xe62uS/N39HN4fwNEelJ/WVAQSjI4FbzWQl/471G0DTIbJaHP7kunhelWyYrJ9NdZWPvZqFZl4biei2G8/sw7kWRQKEfd1EqJu4uVixxY3pHrCLBAgdSKPFMurAemZRXfU72FA6XtqV555xL8N7NFMRg7irBve0g/URH+fY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774440529; c=relaxed/simple;
	bh=LbeAqmlJTzsDU2WI+JQRb0J70AEGN7cPn533Ft2zw3E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=Y9cdJFfWx+6sRWfkaJ3Q7vhysBvgsjt93Ctmq77anBcFFdLLoD2mSKzfAgRjKnpKFxgY99yMj9jGDH5MaWuK2cAeSU+0i6kJi+mmH228NI+E6J9V06OzWqdmA1BT62aQJT9avTdvO1X58AJKBKwmRN1ISQFNWuSNLgKZTzuvTqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Z292Ie6O; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Z292Ie6O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774440526;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xgQzcNVTgAYMtY/AG+BgYI0+wd9pZeBrIlwhVeuWoe0=;
	b=Z292Ie6OflJ7Jm0WFgDFMFY8a+GXBuatwSoTIuoWHelFNOau8n+IMWg9W0ToXSb98hwZEo
	TwaYHqB16PQdfW6VDrNyzbtp4zvcTCEnST30Jn9Lppki2FTmuMakvlE1+02uGFHrXf/LLa
	uaSRS0M8oh2EMEi1FJL2s8pZX+ZxZEM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-346-qLKaunIsORan6OvjIiCJig-1; Wed, 25 Mar 2026 08:08:45 -0400
X-MC-Unique: qLKaunIsORan6OvjIiCJig-1
X-Mimecast-MFC-AGG-ID: qLKaunIsORan6OvjIiCJig_1774440524
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-43b4d3919e4so2439271f8f.0
        for <fsverity@lists.linux.dev>; Wed, 25 Mar 2026 05:08:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774440524; x=1775045324;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xgQzcNVTgAYMtY/AG+BgYI0+wd9pZeBrIlwhVeuWoe0=;
        b=qhmzDtYIRU6hR68Xm6izakN4N7XVbb+1IgAAXFqdbARAfiPpvBmndoKQd2qVqO65Ln
         LQ1Wg4Q1Ot/PZAOlvdcL18tu/U30xigwzMcsUTVMhuqGeyM6/DsjvQXDPTEyElBRJzTq
         OwQvhT6yeHANpbN6eARvWHpW0VgNZvNAFbyPoxEhscJaBMzd+owwV/eho9l7r7ZFO4E/
         tqJNxDy+SiWdD78HlyjqXWy3/L1JOpUb5+sC5J/U2pTIsBLBWhSohUOJtES8OT3cOMp7
         uqUIhkF6GpRp/GJ/oh09cnfC6yhwSiE9GitbgFd+MZj/SpglmdtCkMHgXWXv2vZrz0IB
         S1JQ==
X-Forwarded-Encrypted: i=1; AJvYcCWl6oM5L+7F7qXn7QaUQGkmkVeENYiNAkdun/IpkhrZJKCmzX62J5fwpitTl6U4GsIVC43labXtHw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyQyKJexm5Xljec90xVB+YpQnUD3mIwwr/d3/ilEt/bno0paQ5T
	h3+C+5TiwpRpBugIU1cvGxRHZ1q8ZZGS05l4L0KqcLu1gQsW/qMPll59zG9Z5dxkNwKJQNzZ2VR
	OjKl5SziFu5VTvdEqzJRlDa7go6QEsXDMpsXko4880V0p+8k4XFaWhxUSGIw=
X-Gm-Gg: ATEYQzy55a8TBT6cbXGgeLOYPGuqADU3yC3b6SwaJ7x8dDx4gmQCo2ngLgzFD8zWzQ3
	2hNb+Qk3uW6TcgSIxTDvliYgmsWu8w7HBzDMnhngggGlgURv6B8Kk/r1USOTJFxxT8+NhtITulQ
	Il69p7jIsYM05y+5kGbBeWqtQP3bdcZeN+yabgNNPcuPs9N6QfZoV9jptRqFWZm5UYOzbnUcBVB
	7FvxRWAcZ5iek393Lpznq92HVTcaUnsryclXS8YqoBrQAo6NqlhVSoHvQ4l5rbhumxfiZu9BGRT
	pHMnxZfO/zeMcUnK0D/M8YYzWxusmE5CYXTFc4+MIN+X9FekB6BdufF5pN45BmUHhGKw2ZSvqD6
	6D5T5L50udtnooA==
X-Received: by 2002:a05:6000:2c0c:b0:43b:436d:782a with SMTP id ffacd0b85a97d-43b88a2168cmr4549293f8f.5.1774440524002;
        Wed, 25 Mar 2026 05:08:44 -0700 (PDT)
X-Received: by 2002:a05:6000:2c0c:b0:43b:436d:782a with SMTP id ffacd0b85a97d-43b88a2168cmr4549233f8f.5.1774440523459;
        Wed, 25 Mar 2026 05:08:43 -0700 (PDT)
Received: from thinky ([91.245.205.131])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b90f17158sm216982f8f.8.2026.03.25.05.08.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 05:08:42 -0700 (PDT)
Date: Wed, 25 Mar 2026 13:08:41 +0100
From: Andrey Albershteyn <aalbersh@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Cc: Andrey Albershteyn <aalbersh@kernel.org>, linux-xfs@vger.kernel.org, 
	fsverity@lists.linux.dev, linux-fsdevel@vger.kernel.org, ebiggers@kernel.org, 
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
	linux-btrfs@vger.kernel.org, djwong@kernel.org
Subject: Re: [PATCH v5 09/25] iomap: issue readahead for fsverity merkle tree
Message-ID: <nune2zskdoz2buxwj73z652azx4pwwkpsjjluq55mk3odybhym@2lolknvk7ddf>
References: <20260319170231.1455553-1-aalbersh@kernel.org>
 <20260319170231.1455553-10-aalbersh@kernel.org>
 <20260325080407.GG952@lst.de>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260325080407.GG952@lst.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: YuRRYVPuKdh-aIVMtebvzJ9f94GA0whVhitTwQb-Z1I_1774440524
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2026-03-25 09:04:07, Christoph Hellwig wrote:
> On Thu, Mar 19, 2026 at 06:01:56PM +0100, Andrey Albershteyn wrote:
> > Issue reading of fsverity merkle tree on the fsverity inodes. This way
> > metadata will be available at I/O completion time.
> 
> Patches 8 to 10 really look like they should be merged to me.  They
> all add the actual fsverity support to the iomap buffered read path,
> and merging them and having a single explanation of the side seems
> helpful both for review and future archeology

I see, thanks, I will merge them.

-- 
- Andrey

