Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CFD522F14
	for <fsverity@lists.linux.dev>; Thu, 25 Jan 2024 10:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706179372; cv=none; b=mF1sxP9bK3baGJBu9RFUtNuEEqEu48kF3kmM2LlT1bG1S0qGUBJq+3Y4WhaRo8hZoQif3QgMPG15GnljZyo6EEezl2cHqanMJ8MEI2lMMj8u6tQTWJveYYwb2H/v6UbVGwr9hUnUZ7qL4ErmACQfILaJhVSLhw2ufzEzcjsQ6Nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706179372; c=relaxed/simple;
	bh=sssU2EIRoLMxdL7echHmySckRaYYRyB98B1yKCabsdA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=DVcIc6KP7WXP7rDGKM71wjFNDx6ufK5eW6IppSDW4BuIXNYPBkucW7I2jCFWhLRlnSRYkH1k3oDOsrmUodFEzobSLgPhqsCyErxhMjqBPQ/P5uKdqPZIGWRfjw8iVpFDo6T6hFMm4HjsLde+dev2XDi5n1dwaXConeF9hf22zi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KcBHHU7p; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KcBHHU7p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706179366;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=x5bvQCzbh6snBQ7Q4SSIxdvNE5S/XqmZN2h4FyrdOKw=;
	b=KcBHHU7paRfNMfi+jdFKJx9LNAWNaq5/u0J+K5XFi/HNzf5s6m3hrQkWq5THO+Zw7249Vi
	7TTBQ8wmyUto/Cjnua1qHVEzDrw0iVvgEYeNfMKteCefr3M6TNr2e4Ktf9T0TPwDRT2RPZ
	jLR8kAk16XAjGbJ+0RVsJKNxmjgn/lE=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-456-sYUjNvBtPCiBdFkryQZd6Q-1; Thu, 25 Jan 2024 05:42:45 -0500
X-MC-Unique: sYUjNvBtPCiBdFkryQZd6Q-1
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-2cf1634c94bso19623861fa.2
        for <fsverity@lists.linux.dev>; Thu, 25 Jan 2024 02:42:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706179363; x=1706784163;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x5bvQCzbh6snBQ7Q4SSIxdvNE5S/XqmZN2h4FyrdOKw=;
        b=ZUrFJAXHqS+S6g8SST4jXvXBdsp3UCpTsesLHyl/PKckx5k2VpIoRnaZBv04dX/qn8
         HTNboaRIskiDlwj9/jfoWgYRBzpqSg3GkGCSMzv4AGz1nM7vRpcR2lpTfC9E9+N15RRg
         m9mqXDafGUaGTh0pdZjFJb9dwaLuvNVYg7bCmzOP0YPDF/sJm6Xe+Qva0DM6TbPw82jQ
         oFRQWXqOlOD+/bQPaFk7UxfMSlLQG02ZzoSyrgvua5XYZD4zIfdzINtKd8dOA6Ty6nsZ
         BgFN9bACVTkRB/GAGhNbsOE7thulxrdx48Aghcrvyer+jmxqFLUT36uN1cKe3y/tOikw
         F2KA==
X-Gm-Message-State: AOJu0YyuzO5llOW65aZQQzniQEEfyoh9Bw3EXY+h7EK2vhKrvN0p7P3X
	vRwH9GD9jyBk+DZJVsf2GpRfV0EuETw4P2bIbmhrYX4KT6yA1dsXQKG1EaTpcS9vjWVYpAUAlCP
	IeX8Fiu0r4/vJyPW5lWd9V3Yud+gwckQEqIocXhcZfe817z4Fdd0In9k=
X-Received: by 2002:a2e:9649:0:b0:2ce:3d5:99e4 with SMTP id z9-20020a2e9649000000b002ce03d599e4mr441586ljh.75.1706179363691;
        Thu, 25 Jan 2024 02:42:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHuNOFoFusbSTdg9Tq0KRM9HtAoT3JKueaUJKJ+uJnSV7NkYF1UbIntDXDEXmhVRuSGFYjk+w==
X-Received: by 2002:a2e:9649:0:b0:2ce:3d5:99e4 with SMTP id z9-20020a2e9649000000b002ce03d599e4mr441581ljh.75.1706179363363;
        Thu, 25 Jan 2024 02:42:43 -0800 (PST)
Received: from thinky ([109.183.6.197])
        by smtp.gmail.com with ESMTPSA id dc25-20020a170906c7d900b00a28116285e0sm876854ejb.165.2024.01.25.02.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jan 2024 02:42:43 -0800 (PST)
Date: Thu, 25 Jan 2024 11:42:42 +0100
From: Andrey Albershteyn <aalbersh@redhat.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: fsverity@lists.linux.dev
Subject: Re: fs-verity spinlock in is_hash_block_verified()
Message-ID: <btyieqmpsljzw5ldlepdpyxc2ssvvknnjvfluivzthbliyfsip@ppne3o67hsnw>
References: <vry5tz5aaqaewaaei4e6yux7knb27zf4sm774hqqyisgfj6go7@7x2htyodqfjc>
 <20240125020838.GH1088@sol.localdomain>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20240125020838.GH1088@sol.localdomain>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> I think you're correct that the spin lock isn't actually needed, considering
> that all the operations are atomic and are properly ordered.  It does seem a
> little weird that without the spinlock, one thread can be clearing a block's
> verified bit concurrently with another thread setting it.  (That can happen if
> the threads enter is_hash_block_verified() at the same time and both see
> !PageChecked, and then one thread gets scheduled out before it clears the bits.)
> But it works out because at worst the block gets verified more than once.  That
> case should be super rare, so removing the spinlock should be better
> performance-wise.  Are you interested in sending a patch that does that?
> 
> - Eric
> 

Thanks for quick reply, yes, I will prepare the patch.

I suppose the rare case you described happens with spinlock too. If
one thread is waiting for spinlock while the second one resets the
bits. If the second thread is rescheduled immediately after spinlock
is unlocked the first thread will see PG_checked=1 bit=0 (same as
the first one) -> both do verification. So, I suppose it should not
be a problem to remove it

-- 
- Andrey

