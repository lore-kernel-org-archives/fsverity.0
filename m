Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F6A713CA82
	for <fsverity@lists.linux.dev>; Thu, 11 Apr 2024 06:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712815613; cv=none; b=uML/woFbp1HwpjaWu2k6uXh3tbzxfJIm95bkchiy52NxaoJeBp+24+l1xD2Y1eJvDDk2iJDLbDjcOYeso1DG8rdEZp38Ph1My+Fm5PJ0dNpcvZMu3vjV+pN1nEqOa8CdOFrrlVVUjZqwgY4vlCEonki50Hgcy5cq9rm1IUa9Kyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712815613; c=relaxed/simple;
	bh=etwAmNFsbXUdww48y7BC8erdJj2lz+EKgfLJrt1mtXI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ldr6l1zC9vuuHwdUNrZ3rfglyRurTaEJdmchzkCZwjP5NR5ZL2MxkvddqyMS8CBEtm2A7BVfbzWZWc5hs1On1093d8TBjeB/Ybd77uNe9CzouUgP11zGaAOZG1TKhk8pOyK3kjG88xlprXDN3IbpjKhELXzqp2MIcbxGykFjyjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=qA6I391j; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="qA6I391j"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a450bedffdfso1024514866b.3
        for <fsverity@lists.linux.dev>; Wed, 10 Apr 2024 23:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1712815609; x=1713420409; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TqfSt8w/wpB2B9Py9iSBwVpeof6kTkVrZ0umEsasQxQ=;
        b=qA6I391jzNC6LTHaPTqSd4V3VSoDD2tjClA7Gc3pIcmI7nPB/sp9f7I45pL+ZcXu4N
         umPJzh+wP4gePyilOK4SbqX8ccEPnE0ZLp2/rgvZL2ARb9rxHJlRpFQ3ZFPwmaKd1qpA
         wKUvJIXsvO22Zqp6tAp40eZ/+7xLbOd+RLMxE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712815609; x=1713420409;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TqfSt8w/wpB2B9Py9iSBwVpeof6kTkVrZ0umEsasQxQ=;
        b=Ftj7rxqbIFhqj7pai2Koruh4Ghc/8//r/s7SPue+uzbHs5SgzPcdzF4hKLqGXX2lZW
         eHNqhNutTwBNtK/HgGpHSaXZJooO48q/KUcBn0jDMMIWa+pr9fjt96QbAj7FFtDEDyXZ
         LmkhwloPKC4cszPCdd6iMFUhVzjrxzA/2rxSkYIenvMbJNV3tdNT1npI+ZcDcie882Oa
         ai/qW02As+cJK6q18wHO6lKfp2j4q+Ap897JD1PYiM4wjh/5kqzxZmW3oX9OUKGfUzhy
         zetAv77ZdWd0iQZ0hS/o6AvAlRYjB/4UdIGxrM5/lb1LLVziMVu3IekJMY0iAdqIraYH
         PtYg==
X-Forwarded-Encrypted: i=1; AJvYcCWz8ZAJqkdcL4EpLRBsiDUcKlCPeTcrwNihUCoGr39m24YINqJsHeoPtFl3DI3PM663fLfB0lZS93wzEEuKtKQcGTnxXutKBdw=
X-Gm-Message-State: AOJu0Yzhg3Eum+KWdAl2Xw+XDaFxEeEdChmje4/FiFuoSH+dLnjcTVtz
	rTonG4LqeGu8ugp0tWNnEZQpxWDhLPRkigjILblYUamk8I/HDguUFOEYz7S5WRk6mLOwTcPPm/9
	UTGcPAboO6NcErPKwURQJwD3n6BXnfoWYYdYAzA==
X-Google-Smtp-Source: AGHT+IGry/tdGf5pMhfHh2d583hk5cG64ou7lZWKS/zaTKtvxUTJx1tmwBEjU+sskUEc1/51fPcviZps69p8CVraRIY=
X-Received: by 2002:a17:906:6812:b0:a4d:fc83:70e1 with SMTP id
 k18-20020a170906681200b00a4dfc8370e1mr2167447ejr.56.1712815609200; Wed, 10
 Apr 2024 23:06:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240328205822.1007338-1-richardfung@google.com>
 <20240328205822.1007338-2-richardfung@google.com> <CAJfpegvtUywhs8vse1rZ6E=hnxUS6uo_eii-oHDmWd0hb35jjA@mail.gmail.com>
 <20240409235018.GC1609@quark.localdomain>
In-Reply-To: <20240409235018.GC1609@quark.localdomain>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Thu, 11 Apr 2024 08:06:37 +0200
Message-ID: <CAJfpegt9hBADfGEAdsBjNShYHB68o7c=gHN29SZHqekdnYzkNA@mail.gmail.com>
Subject: Re: [PATCH 1/1] fuse: Add initial support for fs-verity
To: Eric Biggers <ebiggers@kernel.org>
Cc: Richard Fung <richardfung@google.com>, linux-fsdevel@vger.kernel.org, 
	fsverity@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, 10 Apr 2024 at 01:50, Eric Biggers <ebiggers@kernel.org> wrote:

> I am fine with having FUSE support passing through FS_IOC_MEASURE_VERITY and
> FS_IOC_ENABLE_VERITY.
>
> As you may have noticed, these ioctls are a bit more complex than the simple
> ones that FUSE allows already.  The argument to FS_IOC_MEASURE_VERITY has a
> variable-length trailing array, and the argument to FS_IOC_ENABLE_VERITY has up
> to two pointers to other buffers.
>
> I am hoping the FUSE folks have thoughts on what is the best way to support
> ioctls like these.  I suspect that this patch (with the special handling in
> FUSE) may be the only feasible approach, but I haven't properly investigated it.

Ideally I'd imagine something something similar to how we handle
FS_IOC_GETFLAGS/SETFLAGS.

Exceptions for those were also added in commit 31070f6ccec0 ("fuse:
Fix parameter for FS_IOC_{GET,SET}FLAGS").  But then infrastructure
was added to the vfs (commit 4c5b47997521 ("vfs: add fileattr ops"))
so that filesystems can handle these as normal callbacks instead of
dealing with ioctls directly.

In the fsverity case this is not such a clear cut case, since only
fuse (and possible network fs?) would actually implement the vfs
callback, others would just set the default handler from fsverity.  So
I don't insist on doing this, just saying that it would be the
cleanest outcome.

If we do add exceptions, the requirement from me is that it's split
out into a separate function from fuse_do_ioctl().

Thanks,
Miklos
