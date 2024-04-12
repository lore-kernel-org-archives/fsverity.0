Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F1AE50299
	for <fsverity@lists.linux.dev>; Fri, 12 Apr 2024 08:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712910349; cv=none; b=Og5XT+qbfczchjC7VWFPoUo+Gf1uv05kTdOLxh3u7+/ZuDPGz1ZoDctxzSX3eXiw82A5dujqtB9+eUpbrDnVBiORjOwiNeOVav5slTlrY4UgcVTmYANhRHQukxObr4AaLt87C+xYcBrCMKLJ8y5QULT0Pv3TFwk5VqGYDA+48nQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712910349; c=relaxed/simple;
	bh=Dmo9AHMMGGgPEoVGLppnwNRKTdIgSAyXTBQHGf7tPiU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=myqvgaaPy9Nq96+Cew0zkrPmDVHL5++3BbAKejD+nTU0JuvhcRVDR+KoXNIYEJ0WCLA738zPa3oQvy99oyG5vy0sJ9ZbNhYvqz76y881XWckXb23LeLxpKNDqt7ABo+KqrebVLd2ghzjkUwjVHAhUrIwCDwg0JbLUKIEBfbvPes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=oyVCcUNb; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="oyVCcUNb"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a523524e5baso51352366b.3
        for <fsverity@lists.linux.dev>; Fri, 12 Apr 2024 01:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1712910345; x=1713515145; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Dmo9AHMMGGgPEoVGLppnwNRKTdIgSAyXTBQHGf7tPiU=;
        b=oyVCcUNbIoGgJj7DhBuJRQGFB/Qe0rsdDhIDOwDZu/4k+g/SXZFncreyJ+JpDntO9B
         zglZsXANLMZ3M6k0a51ZRzmQBoZ7u3Ud/LNhMp9rtNNPDGjXd4rF1MJnzWLHEbtwiUkf
         VZb8O/+taPM/7tjJGhNGGN/So/IKDPhUven/Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712910345; x=1713515145;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dmo9AHMMGGgPEoVGLppnwNRKTdIgSAyXTBQHGf7tPiU=;
        b=S4xh6ndeoQBHiWkZuEcVR5DaGAn/HfpxbpT8SVmtmmmfL3SFRimvnB08HNTJiGlOZQ
         /APQ0wTCNZPTdUzSlfBt2jvBJraQDBRnNJqd9MWABDlFCzky1Kvu37eGbikv6zodoia9
         lzTkrmISF4VaVQCDB4av2zNBlxt69dUKd8/AdQWDlVJykiDLTWynwPJZ0s08cp6iO7CI
         cdacfFwlEkwQgj3nrikD2K7Y2KTcyMVsqq57cOOfzBjo3nr49XqGEf9qx7cea4wDmeT+
         COSMxcrMmhHoCy5hOMuO/qTmJZI6YBM+lp2vk7fx8n7bJpk/2Nxrdoj+97NJlDsGE/UY
         /RAw==
X-Forwarded-Encrypted: i=1; AJvYcCXnU5i/1fGVFZX66ps4S6pl1MkMB2dxlD/F/8/LuDT/j5QEjOoXt5Q8Tn0EGyIkWsjV8Hmn0M14VJubumea4cTsyRbY+z009cs=
X-Gm-Message-State: AOJu0YzKE7vzwUEPX5++iztMpcnpG5M1YZGhMD7WM9Wv/rAMpYUaTuS8
	lv1Ok/ZvLi7+SnJ0lXX5rjBXCFlrzBEDz6sXKX1XfkaR6pCQNYnHYra2eIUsKQG5plt8TTLMT4Y
	uHjnEU0v3LXWZ87vGlTA+HK0IyFNpj4NxmbS9IQ==
X-Google-Smtp-Source: AGHT+IF/tkpRIAuXyA0t1Y5eApjLqAPPFZCcMNfzMite3UyAln6TWqPxc15w9WzHro50cc0Uh+9DZd+5i41uLfVrPhk=
X-Received: by 2002:a17:906:13cd:b0:a51:aeb8:bff5 with SMTP id
 g13-20020a17090613cd00b00a51aeb8bff5mr1548283ejc.69.1712910345406; Fri, 12
 Apr 2024 01:25:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240328205822.1007338-1-richardfung@google.com>
 <20240328205822.1007338-2-richardfung@google.com> <CAJfpegvtUywhs8vse1rZ6E=hnxUS6uo_eii-oHDmWd0hb35jjA@mail.gmail.com>
 <20240409235018.GC1609@quark.localdomain> <CAJfpegt9hBADfGEAdsBjNShYHB68o7c=gHN29SZHqekdnYzkNA@mail.gmail.com>
 <CAGndiTMNuzKot7fKSE5Hrcm=9XQ-0=KsQCnt4wXVtkq0bmVvXg@mail.gmail.com>
In-Reply-To: <CAGndiTMNuzKot7fKSE5Hrcm=9XQ-0=KsQCnt4wXVtkq0bmVvXg@mail.gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Fri, 12 Apr 2024 10:25:34 +0200
Message-ID: <CAJfpegvt4ivELbyF-4qBRUX7wLxSCwpZ7fg2o7Kry-_gF3kRYg@mail.gmail.com>
Subject: Re: [PATCH 1/1] fuse: Add initial support for fs-verity
To: Richard Fung <richardfung@google.com>
Cc: Eric Biggers <ebiggers@kernel.org>, linux-fsdevel@vger.kernel.org, 
	fsverity@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, 11 Apr 2024 at 21:16, Richard Fung <richardfung@google.com> wrote:

> Would allowing FUSE_IOCTL_RETRY for these specific ioctls be
> possible/preferable? From my limited understanding retrying is
> designed to handle dynamically sized data. However it seems like
> that's currently only allowed for CUSE.
>
> If that's not a good idea then I'll try to split it into a separate
> function if you don't feel strongly about the other approach.

It's not a good idea, because it gives complete freedom to the fuse
server about where to gather data from, and that's just an invitation
to malicious behavior.

So yes, please split the current one off to a separate function and
let's see how that looks.

Thanks,
Miklos
