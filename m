Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B4D2D9EF3
	for <fsverity@lists.linux.dev>; Tue, 12 Aug 2025 17:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755018692; cv=none; b=tSgcRSr5fL7//WL6CG9L6zWXvNtbSvF8lcgTIhbM/TSs5JAWoZENeEnRaYvIkwsCaB1ZcPiTJXWuEwCrtPeeA8VnXu21xDpuPd3ezsMRETUTtQU5sSLug8A9XYKzg1ahgCAGUpzzR6Q2QXgCKZmtOvtWTrkDZkcz8OQnALVy4ZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755018692; c=relaxed/simple;
	bh=7rbRck077Xr3QB/yKuzHkUIMG+GnCWEWE8m7/2tPOI8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=F8y4Q4k9IVsBVD/eDpwC2BsuhL7U9MlbmbYwx6apOsbQu2jS1Q2/TUtHGHcXhcf77OqXxmyzrOKfbG2NYf43jqwthEUvjl2J36E3s2vzu5iYaMInXK5QmXCkz9spGpScbh9ynmcEWC/ix5c6/U9eypUeLDKbusg/BKNr21GDsGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hGOA667q; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hGOA667q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755018689;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cP2OHHmo9urpEPIW8P+jTI4EpHMpDkapbSQ2TBaCUcc=;
	b=hGOA667q+H9Dg4RXTgDpLhbp4Qr0xLHA6GVw9EHe0ouoAod7SvagHNqwbeu4eEgeGiY0rs
	ugd85LZ9MWCfy/mBJV+7flpzH4r2xaRd1hpodB7q4tjy0PqhYW/OvUptK3uQIFz247q3eA
	wetM7vBzJ7EdG0QB9qiC0rB885eZQ6w=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-107-QA7ZVMx-PbCvcJBCBYkCzw-1; Tue, 12 Aug 2025 13:11:28 -0400
X-MC-Unique: QA7ZVMx-PbCvcJBCBYkCzw-1
X-Mimecast-MFC-AGG-ID: QA7ZVMx-PbCvcJBCBYkCzw_1755018686
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3b78b88ecfeso2998388f8f.3
        for <fsverity@lists.linux.dev>; Tue, 12 Aug 2025 10:11:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755018686; x=1755623486;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cP2OHHmo9urpEPIW8P+jTI4EpHMpDkapbSQ2TBaCUcc=;
        b=hTrsHVSKV0o2Ry1CuvqYMthnP+a6kyrZX6AYSuPlBa7o4OxHgXVSmBdMN9mq3qGYKK
         GaVouIW0+kvkZebYdP0hulVuPayC3JwgpjyFn+fwSXj0vPAIGARSDDNWsmCm8WgZUzsz
         +AVhEK2fj60ACJnvzYs89+g2slSnv+a2QovgOHg0ubWNNXWnZOHA250ZZuDf60gYD7bM
         upr4QW3B0wmm6hILGTlOa0zFUNafV5egsf0JLyaqmsBJWhi/w+TyrBDbcen3d/hi+64q
         DIJvlKeorDxMTm26UMysHK0dlgfOqYfKt+2iiQ2xI5kB8LSOu1omd526YBnmq6n2EIcf
         xugQ==
X-Gm-Message-State: AOJu0Yz+WXZ2D/NddNr0+77hJOKW37D9Aac9Bacbg6xvYlGolxDpiKcm
	v0DxK4jSJdzrUl23nJ/9HbRaFiUAO9LSri9RxchJ6fH8/4WwCWrZ2QPfArPFgUrH0RPZw0of9rE
	pcYv8Uy0O6Y0QVkr8deZxW99fmh1DUyjwNV/iPH/eURltu8Ewm2vc0pVtyTVIYLs1ogg=
X-Gm-Gg: ASbGnctw6P9sqpDgS9EWnvh/nfa+NdqVh7+u0RmG2HaUhIVXRFS2Fuwu/7gCbDW4u0P
	x1IGi++wiIPypkaKBj3BiYzYWOF5Xtdotz6Z6tyYauM0ERds3+5hmSxMNGFuuwF4UnlR76uu3HW
	v4mC3UJSuhejyr1xcYwcOQPHZsq1+WGEeKgwyoyqGXcv9akzYUvHP9Yd2dxcL40Ghs8d8YZ7MXZ
	GII6pEYwtkgYnxepanUt/7ES2dTff2zYdulh/ze9nVJIbdnrmDvTxXBF+BoAaUz0fv0KfsEtD28
	9EiheH6YyFWRzsut39OIejVa1Vc3lZV/E0VYHNOCxkK/ggf8C4A5I89+J3M=
X-Received: by 2002:a05:6000:4284:b0:3b7:7898:6df5 with SMTP id ffacd0b85a97d-3b9172842e1mr184452f8f.14.1755018686202;
        Tue, 12 Aug 2025 10:11:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEu8Rkwg6tXk/NOl1brWzbGx1iLmq2u9niyeF3EOyOy1kqum5BGcDYR8r3k+JuJQv8cN6B4Mg==
X-Received: by 2002:a05:6000:4284:b0:3b7:7898:6df5 with SMTP id ffacd0b85a97d-3b9172842e1mr184431f8f.14.1755018685786;
        Tue, 12 Aug 2025 10:11:25 -0700 (PDT)
Received: from thinky (ip-217-030-074-039.aim-net.cz. [217.30.74.39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b8e1cb7deesm35097967f8f.2.2025.08.12.10.11.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 10:11:25 -0700 (PDT)
Date: Tue, 12 Aug 2025 19:11:24 +0200
From: Andrey Albershteyn <aalbersh@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Cc: fsverity@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
	linux-xfs@vger.kernel.org, david@fromorbit.com, djwong@kernel.org, ebiggers@kernel.org, 
	Andrey Albershteyn <aalbersh@kernel.org>
Subject: Re: [PATCH RFC 14/29] xfs: add attribute type for fs-verity
Message-ID: <radr4lpyokwvxdduurafrfu4l2uwisrbbggdt3m7afcutmezwv@tj334pmh4pgk>
References: <20250728-fsverity-v1-0-9e5443af0e34@kernel.org>
 <20250728-fsverity-v1-14-9e5443af0e34@kernel.org>
 <20250811115023.GD8969@lst.de>
 <je3ryqpl3dyryplaxt6a5h6vtvsa2tpemfzraofultyfccr4a4@mftein7jfwmt>
 <20250812074415.GD18413@lst.de>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20250812074415.GD18413@lst.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: CVDUD17UUzinZvnoUfg8MhyaT5FygOs3dcwkDn1mYhA_1755018686
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2025-08-12 09:44:15, Christoph Hellwig wrote:
> On Mon, Aug 11, 2025 at 09:00:29PM +0200, Andrey Albershteyn wrote:
> > Mostly because it was already implemented. But looking for benefits,
> > attr can be inode LOCAL so a bit of saved space? Also, seems like a
> > better interface than to look at a magic offset
> 
> Well, can you document the rationale somewhere?
> 

We discussed this a bit with Darrick, and it probably makes more
sense to have descriptor in data fork if fscrypt is added. As
descriptor has root hash of the tree (and on small files this is
just a file hash), and fscrypt expects merkle tree to be encrpyted
as it's hash of plaintext data.

-- 
- Andrey

