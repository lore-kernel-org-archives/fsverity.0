Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12BAA30FC32
	for <fsverity@lists.linux.dev>; Wed, 18 Feb 2026 12:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771417079; cv=none; b=u2Pb3f5qyBCZBTZ9a9fvqqvBXe7UDP4DuU2h8+tvE5NKrI/xBW8p+XpdYR/Kv9matdGVoNnNqKUQn0bPn//RLGkQEwWwUaPsDus4XdAgkqDC92N7pRU4FLxcSpmCIF01L2+b9+wCSUshq/cJXNkCrQOBaym+YORDXSfHlRxv6j4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771417079; c=relaxed/simple;
	bh=oHxq0RfYCSn+Ri7S2yKvntEHV9eX/s1jFiqv1G6pKoM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=MatqwX/vF3wOhL99D5hmA418dBTD7zvsTNhwMjD1TN8gNdru8HtC/gEa96qDgZwangIHPAeI0OqUKK+hBKq9hHoWQq9h8gstixLZpzpJj+9YqLH1MNIk4x0BuNxYpQLa0O23D1N073CYwnZwih9WP4I5oBTg90HVGO9fBOmCvXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BmlF6Geh; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BmlF6Geh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771417077;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=A90VfYyBvXYfNQuJ+OjztcCqIsGKTH6zgy48JEKhUi4=;
	b=BmlF6Gehs4S1vSXZqz78mOzy8/bklFiIMHyOGDQ/nh1GTTVCVzCo+f1SLzA2xrLp5y1c/Y
	orPWkMq0kNx0j98ThwACW1zCM2bmQPu0vQ6IgDMCU89Hktk7Omb5KKL4B+iZjfg0OalkgG
	7CLzxbuIQRTWclyapJblwl6ExaeN5j8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-131-JCh3ohR2Pk2iI1PxCppEeA-1; Wed, 18 Feb 2026 07:17:55 -0500
X-MC-Unique: JCh3ohR2Pk2iI1PxCppEeA-1
X-Mimecast-MFC-AGG-ID: JCh3ohR2Pk2iI1PxCppEeA_1771417075
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-4368060a5e5so5584738f8f.3
        for <fsverity@lists.linux.dev>; Wed, 18 Feb 2026 04:17:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771417074; x=1772021874;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A90VfYyBvXYfNQuJ+OjztcCqIsGKTH6zgy48JEKhUi4=;
        b=KGVoHQVmIdmXuYLwAMaZERD69cgkrg4BXJa1/DvY/UYcvCTfj/DP4hDpKxJVtxo2wx
         WcuyAURp/Mv/u0cnrg78vzFCqrvr/DHlYg6kcQWW8rIP0w3e6dqPUboVjnVlyPj0+8RG
         GITkoQOcGzx6mASLG9iGONXoVEFnf2O4avpgdT67lypUgIWataI71SFpCmD10Jse7/+c
         RB0o32zo8LOIGznUs09fkMqu6R6KoxNFLTKLsK3Ro/u4OE7tneVNHkwHGEN/7C8LNY0r
         AlPdfddcITEVhbIAtvqCK6jSws1dEtRtcY+nLU08z++voAfeSh+6Bk+n22oeFd0sV888
         5zaw==
X-Forwarded-Encrypted: i=1; AJvYcCWwl0Geh0JGDqgtRNX5uWXWXzAerp4qX6Q4ixbDh01LethNtH362Mi+F/RBgXGE2oQ90ndPo9kKbA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwwpBEa9H5j8e6rQcnZquhDLeQfhdKYwFdz9ZV4agqI8z44am81
	PNjBZ+XUAEA/GdhoK6zffoJpqn4ehHMhF8QF8kStModHfSbopluI55qOw7UiueRJrOXoV5fbz7Y
	YFofDe07ZVhB3NdJdk/VOITxoWut+4x8ut5RH3u3xdvd6Yz3wLC9SmhOkijk=
X-Gm-Gg: AZuq6aKxSGuEMJVKfYeRl6EJ5uczhz5m2ZlgKTxsP/0RfRud/oe2UNlYV7sJrcj9CCc
	swzFqIyq03GMWSl0KRopDMVvCMVCa7lHkVePlEsqBqB1coYLR8UPMKmjIIoo83INiZNvpk9RHUK
	yU7LnMNiipX0gAlkPjDZHLWvU8w2nf3cax+oEOa7XZk/xedr4mlH4xWEMeEO+zB5p7jAhAq/fno
	sjIg1l8Bgi2ABOOg6lQKu1QM6J6L8zJ6EUa6Z4KgFJyrL3AaC+jzPfg0nZV8FuxxYEYPVCGzQmW
	OZnutIQr+q+hieAo7AwdPrJ+Cm90rdIMzw3glhLFzfgtWhCBEXbuOVLhNI3bv3Mjlsz9I1Bay3v
	dy3IxhD3Px90=
X-Received: by 2002:a05:6000:186f:b0:436:1b1:6cbb with SMTP id ffacd0b85a97d-4379db30f9bmr22128041f8f.7.1771417074456;
        Wed, 18 Feb 2026 04:17:54 -0800 (PST)
X-Received: by 2002:a05:6000:186f:b0:436:1b1:6cbb with SMTP id ffacd0b85a97d-4379db30f9bmr22127986f8f.7.1771417073862;
        Wed, 18 Feb 2026 04:17:53 -0800 (PST)
Received: from thinky ([217.30.74.39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796ac82f7sm45619590f8f.28.2026.02.18.04.17.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 04:17:53 -0800 (PST)
Date: Wed, 18 Feb 2026 13:17:52 +0100
From: Andrey Albershteyn <aalbersh@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Cc: Andrey Albershteyn <aalbersh@kernel.org>, linux-xfs@vger.kernel.org, 
	fsverity@lists.linux.dev, linux-fsdevel@vger.kernel.org, ebiggers@kernel.org, 
	djwong@kernel.org
Subject: Re: [PATCH v3 06/35] fsverity: pass digest size and hash of the
 empty block to ->write
Message-ID: <wl5dkpyqtmbdyc7w7v4kqiydpuemaccmivi37ebbzohn4bvcwo@iny5xh3qaqsq>
References: <20260217231937.1183679-1-aalbersh@kernel.org>
 <20260217231937.1183679-7-aalbersh@kernel.org>
 <20260218061834.GB8416@lst.de>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260218061834.GB8416@lst.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: WNozRb4pwLBOrh3EVpVEbXS2X_ICYoMA587DlfKp_-A_1771417075
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2026-02-18 07:18:34, Christoph Hellwig wrote:
> On Wed, Feb 18, 2026 at 12:19:06AM +0100, Andrey Albershteyn wrote:
> > Let filesystem iterate over hashes in the block and check if these are
> > hashes of zeroed data blocks. XFS will use this to decide if it want to
> > store tree block full of these hashes.
> 
> Does it make sense to pass in the zero_digest vs just having a global
> symbol or accessor?  This should be static information.

I think this won't work if we have two filesystems with different
block sizes and therefore different merkle block sizes => different
hash.

-- 
- Andrey

