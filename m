Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73EB0181337
	for <fsverity@lists.linux.dev>; Tue, 14 May 2024 19:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715716515; cv=none; b=jzRWY9LMr06I65tkAB3dMKxeI0k0lSV9YrIYJw7Xepsng6p7WTYWup9aX3beh9MeOifvm+SIgznaBK4YBHZgyaFAtC0gzV+XcTwEg/suOVooVHNiFMSI9crDr6Lu/XV0DE9Hom1uBzh64y+U3aoQAjmvr0Z1CX8oP3q5Sn9zqeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715716515; c=relaxed/simple;
	bh=Tn7ggDBZ467fewog7X29iTchxNr3w1imZ5QlMHFp0v0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fNZS3q2vcDyN33xgpAzS7P9SCSYzG4TYfn9tEiGVIJqAgysWkevX14uivGQVLPSuDijYQugb9/7zvb+wdfPQ+LqkbayzQN3ggNOZTzsvVLrdz3qRJ5hI/A3sqQWdusSqtGmzZDIajRo3ZjPWqjYi6D/JHfL+yL43Vit4QNwSDsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=UOWhLICG; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="UOWhLICG"
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-dcc71031680so6420066276.2
        for <fsverity@lists.linux.dev>; Tue, 14 May 2024 12:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1715716512; x=1716321312; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I5DfaKSvWBjSuruH8QpkzwqbDWxyqIe8ntp5STBjhPE=;
        b=UOWhLICGChm6yL0s4nybYeeRcz7BG/8SmewGSr0YrjDg/4gnrPuH3f/T2a2uwRkL9D
         Y8zQm4UZCwUyKXjpM7m1DvMo6FKrx59Y2KjcAwuv/XyPwfEHzq4VcNjCa6o0pYq6wenx
         Aa3Sto0BGGKExaPHDiljqXV2m9zicb5aRbFYWBZNuIDVPP+hUtDKQYWxXuWa8BFmdCwx
         h9BsKaHHhaXSxrzmL506Rh2+/9Y8FfGgk1YZQjkCjF6XANpdnKgP80xECRWcuNtU8yHR
         lyaIdFtH8q4RPQnEmD6IvH6NzSpPBxdhk1s2KYhi4TQt+cMSYzJYZONEXVsecBt96k60
         +tqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715716512; x=1716321312;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I5DfaKSvWBjSuruH8QpkzwqbDWxyqIe8ntp5STBjhPE=;
        b=HC9n22L8PZe1ZCKNljZ1Tx5hQv9Nm5uHUtjcOrnC0X/DERsxd0wGDkMO24vqtME1Y+
         A2NEnpAeiMQ2i7oPwNOE7wtnsdL6JEalKckijjSzEeF0b1D8FPk/hovdOKOfm2s/hxOC
         SX3rJYS56tHWviMntcHp5nFYAxo0IyH6yGzTcUZn45O9vzEnaq559VKtzuxQxBFqGj7J
         U0MvU9Dr5dqCLiNIKO7U9tLksDRjLLO9igx0kOxbxg2WVs0SyXsl9dO9v/9ZTOoXYbny
         13zcLrtTsQ5mN9ozCHbpnxEiMpoAD/t59AE9T8AFz4wdDgah/UIkzj3bZDuUgg7oEbzE
         IpvQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3yN7qJy0L/+/1/90ePwgYpQ+jCCU24L0kAyuoMw9IGXfb12rt0J3zrvMOz+4Uflh+0S45C6PW1sSXQbJZJ3RN+ullLXMZ3ls=
X-Gm-Message-State: AOJu0Yz9kIbjZ7yEl1s8hZB7azlp398CuUoYCX1Xd46+rDEQ69XsRoaP
	2M0efONIvZG+XtDn0FjuX0mXWXzAYzm3qk6hqsVjgKXpHR4np3l0hikVRLcI005ioS6m5eq2h19
	JmCAYtZJHRSTqspW9k7rit7XpHWj+Yua8dIpy
X-Google-Smtp-Source: AGHT+IGVq5mRXTNrK/KaBwurMBldLnV/6qJN5uwTdGazOX6+s8bWL81rsv23lU+ZbyujJVMk8Qdjk3/8J+Z+jQ3+QZk=
X-Received: by 2002:a25:ad50:0:b0:de4:619a:fbd with SMTP id
 3f1490d57ef6-dee4f2f6cb8mr13359322276.9.1715716512499; Tue, 14 May 2024
 12:55:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1714775551-22384-1-git-send-email-wufan@linux.microsoft.com> <1714775551-22384-17-git-send-email-wufan@linux.microsoft.com>
In-Reply-To: <1714775551-22384-17-git-send-email-wufan@linux.microsoft.com>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 14 May 2024 15:55:01 -0400
Message-ID: <CAHC9VhTK4WS6BOXqLJ4sNKXR9a17gT3vXJUBc1F11cZ_QaOYBA@mail.gmail.com>
Subject: Re: [PATCH v18 16/21] fsverity: expose verified fsverity built-in
 signatures to LSMs
To: ebiggers@kernel.org
Cc: Fan Wu <wufan@linux.microsoft.com>, corbet@lwn.net, zohar@linux.ibm.com, 
	jmorris@namei.org, serge@hallyn.com, tytso@mit.edu, axboe@kernel.dk, 
	agk@redhat.com, snitzer@kernel.org, eparis@redhat.com, 
	linux-doc@vger.kernel.org, linux-integrity@vger.kernel.org, 
	linux-security-module@vger.kernel.org, fsverity@lists.linux.dev, 
	linux-block@vger.kernel.org, dm-devel@lists.linux.dev, audit@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Deven Bowers <deven.desai@linux.microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 3, 2024 at 6:32=E2=80=AFPM Fan Wu <wufan@linux.microsoft.com> w=
rote:
>
> This patch enhances fsverity's capabilities to support both integrity and
> authenticity protection by introducing the exposure of built-in
> signatures through a new LSM hook. This functionality allows LSMs,
> e.g. IPE, to enforce policies based on the authenticity and integrity of
> files, specifically focusing on built-in fsverity signatures. It enables
> a policy enforcement layer within LSMs for fsverity, offering granular
> control over the usage of authenticity claims. For instance, a policy
> could be established to permit the execution of all files with verified
> built-in fsverity signatures while restricting kernel module loading
> from specified fsverity files via fsverity digests.
>
> The introduction of a security_inode_setintegrity() hook call within
> fsverity's workflow ensures that the verified built-in signature of a fil=
e
> is exposed to LSMs. This enables LSMs to recognize and label fsverity fil=
es
> that contain a verified built-in fsverity signature. This hook is invoked
> subsequent to the fsverity_verify_signature() process, guaranteeing the
> signature's verification against fsverity's keyring. This mechanism is
> crucial for maintaining system security, as it operates in kernel space,
> effectively thwarting attempts by malicious binaries to bypass user space
> stack interactions.
>
> The second to last commit in this patch set will add a link to the IPE
> documentation in fsverity.rst.
>
> Signed-off-by: Deven Bowers <deven.desai@linux.microsoft.com>
> Signed-off-by: Fan Wu <wufan@linux.microsoft.com>

Eric, are you okay with the fs-verity patches in v18?  If so, it would
be nice to get your ACK on this patch at the very least.

While it looks like there may be a need for an additional respin to
address some new/different feedback from the device-mapper folks, that
shouldn't affect the fs-verity portions of the patchset.

--=20
paul-moore.com
