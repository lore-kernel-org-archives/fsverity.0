Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 489E2340287
	for <fsverity@lists.linux.dev>; Thu, 22 Jan 2026 10:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769076799; cv=none; b=j8SMXbZnsVUk5TfnZan30y3q+0dtKfQed9abGyT8jr5Z7gQ6fq2T/JwJPA+ccELcxnP0GbaoGzWuFfsTWtx1c32ZOV5StRO7CQQVRSnP2ToviVFdCPg/sSQ3tWQngrzcJUN/inGN9loi//QrV5UweZ5I5WEgU7Wi5ScTno8qNxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769076799; c=relaxed/simple;
	bh=+DaVDwDFTaE2CJY7NQbgkoOai3RZT+Zn59KkM8yLeo4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=jqu+IEJYJojdKC+JQVGcEm28MAPAoXnq2N9NmXPVbCVlNIS/cUnE2LRy0wjMc+hOctE6QP8qb06A+kT2ox5CZvMqY8lQeWf6tnfd3Mu9xT+rX/apGPeuCTA6mlcnfIeHaCZ+uy0jZFYuKqhfSRywqG8gJ0z+pPkP+23xs6JJ9ZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Eig2vEnq; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Eig2vEnq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769076796;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3PvjpRuZOnSj4n9pyzBuctSprFCgwIRN8fXSvvKed5k=;
	b=Eig2vEnqKrTvedE0Dyj7tj94vNytJOO0IboF5NH+Y7okFNrD8tn6ztLm/iU88OVPwV9vKs
	M7OyLeK0LJkEJEkqDCkkS2pDIjyzkObRGkkObJN+GvW2pp0EnsuCLDo/SiCUvrLbIyPF4C
	1OUX6Jv9T2RsgH+//SiD+HdFzreAp4E=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-286-cr1r8zNBNr2o0YyygS2euQ-1; Thu, 22 Jan 2026 05:13:14 -0500
X-MC-Unique: cr1r8zNBNr2o0YyygS2euQ-1
X-Mimecast-MFC-AGG-ID: cr1r8zNBNr2o0YyygS2euQ_1769076793
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4803a72daaeso6536665e9.0
        for <fsverity@lists.linux.dev>; Thu, 22 Jan 2026 02:13:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769076793; x=1769681593;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3PvjpRuZOnSj4n9pyzBuctSprFCgwIRN8fXSvvKed5k=;
        b=LUtz9kP0m9hdO4G6wwB+E8ZuZZoNn7JIK/eygKv2uOt+t/6It8xc/ioNpBanIxFK2W
         s7LPShM5w/5oyWO6a77EzCJrKBYhQ7HMO4mVDfgfx2dLcYxGGHqhCcM6zTzHg3X4mpQ7
         /R4fXQxUvuIsSHdQGruj+K8FTxlldrPdgM84rQ5nvEqgbXsHVPqK/aC/DAOFq/Tk3M1S
         N1ola+C+2NYnIIW/nGnjdbD8Y9F4UupSDsXnARIW2bVXMcod9mH8jHmrOeX9A7v71nxh
         XX0FUTwNUsmXMMornLxjqYLUpPXGgIaZYmEbLJf3YD390fv+/KnRbLYyvr8sb1T4vs5o
         B3zg==
X-Forwarded-Encrypted: i=1; AJvYcCUKPznGiDo9/BsrV+tr7vTEzYz/zJC6KtHkwKDVjwosQIdOQ5kAtRlzEungBlPIGxc5kql0AqMLlg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzL8b3lvi9njCYplHnaKXcQb7VlsZ5mPmlRGCNE800On0QhDN4h
	ZL5Qb4+4siMANsPPheh6g7z/8uGxtPjviod36mfkVrAloAo48qpkKigFSej3SGLakzsghaZpuBK
	ZcK6s8+1laR76oLvC9hjjeKOggcxuL3C+sfV5McUQqFfgK0B8EqbSiWNtSoQ=
X-Gm-Gg: AZuq6aKqEE+XXv62QZNw1vocwh7QA960/jzBpyu54kI7+2qHZp3EhvBKUElQhlwcTFC
	YsjwSvBAWn9EEytxFCD95G+/6CaK2HbdQQw2tOrepwLZpjfWxVTct1N4bWMNaX1lwvGPRlTn6jg
	JGpyEOjJq/nVCuqhqADTIear5SzEYWOPbnO/9jBng2dFh0WPzNgmz1HVuHJimi28j5P3rEcuSbm
	llfmAjhY/C0KP2BQZvpZzZYV//UE22ar0NiuTYBAVcsDgd7B/C45lfpnzVE4pcOL+diZJP9iR5o
	/dQqvhlSY9ty4D05d86QCiWVMk1KSQZeCSt2YEtCeVts/aR3YB45oBosX1xbdaTYBJpavEqmyOo
	=
X-Received: by 2002:a05:600c:58d3:b0:47e:e48f:43b5 with SMTP id 5b1f17b1804b1-480470d4b5emr28224295e9.18.1769076792935;
        Thu, 22 Jan 2026 02:13:12 -0800 (PST)
X-Received: by 2002:a05:600c:58d3:b0:47e:e48f:43b5 with SMTP id 5b1f17b1804b1-480470d4b5emr28223915e9.18.1769076792425;
        Thu, 22 Jan 2026 02:13:12 -0800 (PST)
Received: from thinky ([217.30.74.39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804702fb04sm54550985e9.3.2026.01.22.02.13.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 02:13:12 -0800 (PST)
Date: Thu, 22 Jan 2026 11:12:41 +0100
From: Andrey Albershteyn <aalbersh@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Cc: Eric Biggers <ebiggers@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, David Sterba <dsterba@suse.com>, 
	Theodore Ts'o <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, linux-fsdevel@vger.kernel.org, linux-btrfs@vger.kernel.org, 
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, fsverity@lists.linux.dev
Subject: Re: [PATCH 04/11] fsverity: start consolidating pagecache code
Message-ID: <a3oh6pju5fuodkmhb42o5t7qkqo5oqtwk3nu4wls57p5ihz2rh@q7mt6lpuprvd>
References: <20260122082214.452153-1-hch@lst.de>
 <20260122082214.452153-5-hch@lst.de>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260122082214.452153-5-hch@lst.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: FAe2Msjvey4ybv6_jlMu0mO1c03VGxe98T3B7ARIYGY_1769076793
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2026-01-22 09:22:00, Christoph Hellwig wrote:
> ext4 and f2fs are largely using the same code to read a page full
> of Merkle tree blocks from the page cache, and the upcoming xfs
> fsverity support would add another copy.
> 
> Move the ext4 code to fs/verity/ and use it in f2fs as well.  For f2fs
> this removes the previous f2fs-specific error injection, but otherwise
> the behavior remains unchanged.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

looks good to me
Reviewed-by: Andrey Albershteyn <aalbersh@redhat.com>

-- 
- Andrey

