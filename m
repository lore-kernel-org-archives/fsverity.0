Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1EC8D534
	for <fsverity@lists.linux.dev>; Thu, 11 Apr 2024 19:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712862981; cv=none; b=bZsnTjQfiq/ZM4fnPEVtKbZ1TMpu33/XAhLjBybgngJ3t8vCfeUFzSxCmEcZiMA0Rf4BYroeaCskh1d+ks3jxEiaZAZ/NxDHzUnYHqexmKBMYBEDNPBiuS2Iz8bDGRZrwUhThMoFbSB1Da28trCDIJS+XNy/9JxM1bMgRCMI6g0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712862981; c=relaxed/simple;
	bh=pNGS7PL3Q3YJB0ZVZIZ0iegtesPYiF+tOfUb+pWU9rk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IdJew2Z44165Y5APXQHJzz4dhi/scHQSYpYPWeInBrV3viSeWQYBB1z71/BdFQHQO2m+lIxQIgSb1nW+sOHOubf0W65wDz5wmEnwPlQInxeyf+gMkI+kL+qdWWF1/ZLKIYZbizk4RpFFOWUN32H4qHFF5nWvqNau/6bdAnRTSRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2xJ1i9S7; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2xJ1i9S7"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-434c3d21450so503961cf.0
        for <fsverity@lists.linux.dev>; Thu, 11 Apr 2024 12:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712862979; x=1713467779; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AhpgH9Z9qXqFvfvUioYha8hRr6JLQXv1CXZE9+U2upw=;
        b=2xJ1i9S7JI4Yo7Pi0RXisMNxqqDw+0GDErIUHBOgWjl/w8rbea5mj9GZz9TRVvpv9J
         2+HlZyJXznB86jhOTzYVIyyegqgaH9Q+w1cQ/PJ9juGg7j5JEhUtLhVPgPsY1T2bghnY
         E7GLlqKd9y6yhZepb8UuY22/HcvPmG9EnF5MCClngkKwO+3wPk3PE4ukqJ2Z9ss3ksb6
         ZdkRfqckAaSKivxGGmvwSFsTd1zzrRKO6JDJU8n2izZ9CfX6MuOMMLYBh7eTRhC2/piL
         d50vk6hjtTXoQ0nhv8ZY9My30A34MLvknA4J/KhGs21jhbeN+hm3Xmztl8h2QpwLN/0N
         Ustg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712862979; x=1713467779;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AhpgH9Z9qXqFvfvUioYha8hRr6JLQXv1CXZE9+U2upw=;
        b=N6S9MsVHlTR1HXBecEO+IARHgT8BuygE5mpTK0yve8o6+3DgyDGx90kFYmo/y1XOKL
         EZATKwQ10YN9jvHb12q4ExOUg3x/jXwuhnIQQCsT6m1zgpIGV04jkZGm6cwi53Y5lL/Z
         zInTcUGEdLZTG7dqIs0GOM/DhwMYoAnHyxQBGzIwAo2NBPEBhcnW5N7DHD+qdxcvR9RU
         FzNoK+vQD8GaaRzoV0X26zCUxL19CBTEjPdmksjr/C8VvN4UFMsGje+tjE+XgEN2hT+Z
         NOtRF3f6fsIDrbTrN1oUZFJRp8AQIFUfKB8U0RRbIF2dbNFUcHt1jbVgfyodrvBQ8wxb
         moEA==
X-Forwarded-Encrypted: i=1; AJvYcCX148nxELuoQ2iFiYChTeSFQa+urybnGUrtV8robIvKsHRwHNyrxbfuwjkOZtuH31znWFmAFsd33KMqrNeUGu70T1vsMjT6myc=
X-Gm-Message-State: AOJu0Yz65GqpI/fGVDEPSfAC0CJji0jvghA+38doxCrnhZkqIjfYzdns
	xzX9ABzaUhKrryPuqhXw4DfrTGQ4xDmyDxE4eVgbgojDkNltVG/P1Ql4ExrsLNZo+ejANzwIDgM
	mLRzEUFbbdILDyGSvQ8rzyKIQgOORPZ/AjzMfF/jkZxTVCSPPAERB
X-Google-Smtp-Source: AGHT+IGfw7Fj9rJcZz0lVyRkaC000N/pbyxjhWMp0wgV0f00xMv3P+3YAc16D0UgDFqzJhTfRJb/CdCWFldQ6h4t5bU=
X-Received: by 2002:a05:6214:5610:b0:69b:7c6:72be with SMTP id
 mg16-20020a056214561000b0069b07c672bemr730423qvb.43.1712862978616; Thu, 11
 Apr 2024 12:16:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240328205822.1007338-1-richardfung@google.com>
 <20240328205822.1007338-2-richardfung@google.com> <CAJfpegvtUywhs8vse1rZ6E=hnxUS6uo_eii-oHDmWd0hb35jjA@mail.gmail.com>
 <20240409235018.GC1609@quark.localdomain> <CAJfpegt9hBADfGEAdsBjNShYHB68o7c=gHN29SZHqekdnYzkNA@mail.gmail.com>
In-Reply-To: <CAJfpegt9hBADfGEAdsBjNShYHB68o7c=gHN29SZHqekdnYzkNA@mail.gmail.com>
From: Richard Fung <richardfung@google.com>
Date: Thu, 11 Apr 2024 12:15:39 -0700
Message-ID: <CAGndiTMNuzKot7fKSE5Hrcm=9XQ-0=KsQCnt4wXVtkq0bmVvXg@mail.gmail.com>
Subject: Re: [PATCH 1/1] fuse: Add initial support for fs-verity
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: Eric Biggers <ebiggers@kernel.org>, linux-fsdevel@vger.kernel.org, 
	fsverity@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 10, 2024 at 11:06=E2=80=AFPM Miklos Szeredi <miklos@szeredi.hu>=
 wrote:
> Ideally I'd imagine something something similar to how we handle
> FS_IOC_GETFLAGS/SETFLAGS.
>
> Exceptions for those were also added in commit 31070f6ccec0 ("fuse:
> Fix parameter for FS_IOC_{GET,SET}FLAGS").  But then infrastructure
> was added to the vfs (commit 4c5b47997521 ("vfs: add fileattr ops"))
> so that filesystems can handle these as normal callbacks instead of
> dealing with ioctls directly.
>
> In the fsverity case this is not such a clear cut case, since only
> fuse (and possible network fs?) would actually implement the vfs
> callback, others would just set the default handler from fsverity.  So
> I don't insist on doing this, just saying that it would be the
> cleanest outcome.
>
> If we do add exceptions, the requirement from me is that it's split
> out into a separate function from fuse_do_ioctl().
>
> Thanks,
> Miklos

Thank you all for the feedback and suggestions!

Would allowing FUSE_IOCTL_RETRY for these specific ioctls be
possible/preferable? From my limited understanding retrying is
designed to handle dynamically sized data. However it seems like
that's currently only allowed for CUSE.

If that's not a good idea then I'll try to split it into a separate
function if you don't feel strongly about the other approach.
