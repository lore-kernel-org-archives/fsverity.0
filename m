Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F7B3B28D
	for <fsverity@lists.linux.dev>; Sat, 14 Feb 2026 20:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771101582; cv=none; b=i5b8ngUJVXczoXgr38XVudvvntG7egeB4DQDlIahP9CtCwLXZAFvi9a9Q8iLuPwpFcDyTCtfux86LfdazG4QDkhZnBrkJiTo8PT+gxKMsfpWM/yl5AFjku4e5JJHDbWCpost7bXAXfMmeYCvD23hwjkmQIOUwXya9eiUmcjSyNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771101582; c=relaxed/simple;
	bh=UNuLCaseZhQmbcd8cNZc/hV2jVRYkUeP9KxTuzf6zu4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fndHipvRc7YOPM1ZslP9rKSHA1HwVBPjnD0d9tMZbyj3r6H/S4WMNNNIgZ9BVPEKmjb0wPnVpo7yX8DR+2Wvl6JHpPyK2BAVwYN9VUlUoawDsOKwqBoIXMjCQhCE90cOZNp4xy01N7i6rK3Zvrcx5nbs9ZtlnlWGWSu67omhj7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=deBZnoRv; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="deBZnoRv"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-65bebcbffe8so8511a12.1
        for <fsverity@lists.linux.dev>; Sat, 14 Feb 2026 12:39:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1771101579; x=1771706379; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xobni0Kui4RUZeyiNPg7YdinYh9j2rSDgpyUC3GHngQ=;
        b=deBZnoRv9/cIMQjgKPa0spA/NAnlfmGXJBQCOPGyrzQ3XPoft0rVpZgqe26MzDyayb
         6qalSPN6BBElnhSqtsKqzlGrvhDjcCvuy3VrIjAv0ZZl4a+O4QanQmpCZwMWQwip/7PM
         JOQ2VQGjOyJwwqpXuEXM6TwxdTzAMyPHqe/ic=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771101579; x=1771706379;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xobni0Kui4RUZeyiNPg7YdinYh9j2rSDgpyUC3GHngQ=;
        b=CLjbZhiy+hYUTzv1agHOgRkEpEzCVpwTkjpt4J6M+G26d9uKvJegmO7DAHgdyHq3WQ
         fZ8MGZ8NTjWK/x/Ibexxgcf4+IrnmWGnIOCPnotZ1gf94PvGyDnMx3tfq2ChpWo7y8Nn
         Vy6ZsswtjuP3Day9vT4M1BwWoUwRiuAkuLUf1gmarjc2Amc3XoDMsWh2vj/FrtabUSqN
         i/l/GFLOWQ6PqBDjaEiSgn47NZmY5GicfUI/mFb2WpKAmuYM56wEr99+tGYJfeTrPCb6
         JDKAvVpjfVkNEg6TXEvrjZ2v1cFH9rgvSPzSLa72USMl18zv80hUw0dP1mum3LOnNgnN
         oPaQ==
X-Gm-Message-State: AOJu0YzcyMCEIFtQ0zWYyhltcQZvC+o//PIoQ+enU3dw/Mz5rut9MUag
	d0yLuaR4uxIIy5m4+YPGFz2mWfr/cuRtQOUA/ko3UyBfdQ4/YYo75uxisckAO7AyJVi01vDQtrP
	B0zX/3QQ=
X-Gm-Gg: AZuq6aIkLYK0Fk5BVPn+XsCorvRgKGFSXDdZ5r2zayHMjaCb9RJRmJi90qus5aUslZh
	rjWeFSgQBML8RSTX5PKp7hnjvaklm8UiXIUvd1YwA+X42YHF5Wb6d4i3Qq97rQlmQpP+0K/ItyX
	rTHA5X4zYyCBXjg8mCe7vNpylseWQseSiEOQOpaxXW+tFBJyBr9TxwpapEH6gx+zMKveIHMDICv
	hMg++9GIUwPPphcEyy+PqbDDPRZNOXJKIugwzZKslHAnUKK1NveHvjWaq393qaIgMnPFloGFVs+
	5FfnTC8+RMMgPiJecc/4S10DmbBsBRv0zOfzvnUva+IKD5n45wwgL/d4iI6FFyl0X9RHp5WCxLZ
	b2p1SrXHI40zTF1QZnflTeXlMwn+KRUGoRIEb3ajP2PTNOXHP773iZev1bgZIsA74SjmaOYknJG
	tegPCn0n+9X9Whi3lBDMMtvyHb9rYJ7y+CPQsdN7EISFz8fLFOQrypUBqktRFGu46N2Vr18jWD
X-Received: by 2002:a17:906:7312:b0:b87:31d1:4131 with SMTP id a640c23a62f3a-b8fb45662c4mr307764566b.60.1771101579051;
        Sat, 14 Feb 2026 12:39:39 -0800 (PST)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com. [209.85.218.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc7627f8dsm102082266b.42.2026.02.14.12.39.38
        for <fsverity@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Feb 2026 12:39:38 -0800 (PST)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b8845cb5862so263109466b.3
        for <fsverity@lists.linux.dev>; Sat, 14 Feb 2026 12:39:38 -0800 (PST)
X-Received: by 2002:a17:907:3d52:b0:b88:16dd:d835 with SMTP id
 a640c23a62f3a-b8fb4149eaamr307827166b.1.1771101578249; Sat, 14 Feb 2026
 12:39:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260214203311.9759-1-ebiggers@kernel.org> <20260214203311.9759-2-ebiggers@kernel.org>
In-Reply-To: <20260214203311.9759-2-ebiggers@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 14 Feb 2026 12:39:22 -0800
X-Gmail-Original-Message-ID: <CAHk-=wi60UWZ=kVayGKfrGURiX4aN6P4J_bNMOw_pSvUrxw1jw@mail.gmail.com>
X-Gm-Features: AaiRm52N7qTCMNkbWXl0IrwYY7YFxDkuplThSymslcU1mI1J-WYgkUTlm-Kk_bI
Message-ID: <CAHk-=wi60UWZ=kVayGKfrGURiX4aN6P4J_bNMOw_pSvUrxw1jw@mail.gmail.com>
Subject: Re: [PATCH 1/2] f2fs: use fsverity_verify_blocks() instead of fsverity_verify_page()
To: Eric Biggers <ebiggers@kernel.org>
Cc: fsverity@lists.linux.dev, linux-f2fs-devel@lists.sourceforge.net, 
	linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>, 
	Chao Yu <chao@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, 14 Feb 2026 at 12:33, Eric Biggers <ebiggers@kernel.org> wrote:
>
> -               if (fsverity_verify_page(dic->vi, rpage))
> +               if (fsverity_verify_blocks(dic->vi, page_folio(rpage),
> +                                          PAGE_SIZE, 0))

This really is very wrong. It may be equivalent to the old code, but
the old code was *also* wrong.

If you use "page_folio()", you need to do the proper offsetting of the
page inside the folio, unless the filesystem is purely using the old
legacy "folio is the same as page", which is simply not true in f2fs.

It might be true in this particular case, but considering that it was
*NOT* true in another case I fixed up, I really don't want to see this
same mistake done over and over again.

So either it's the whole folio, in which case PAGE_SIZE is wrong.

Or it really is PAGE_SIZE, in which case you need to use the proper
offset within the folio.

Don't take the old buggy garbage that was fsverity_verify_page() and
repeat the bug when you remove it.

                Linus
