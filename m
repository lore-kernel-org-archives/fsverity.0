Received: from mail-wr2-f1.google.com (mail-wr2-f1.google.com [74.125.225.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B189A3AE1A0
	for <fsverity@lists.linux.dev>; Sat,  1 Aug 2026 17:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785605893; cv=none; b=mXQP/wrC2twgY7Xo93vKy+kBK7qQrlscFpyQXZH0bDA/uFU0uxzZ40JjB6OULVbOxdPz1kHPMgtNxWxa3ASq6QGkYzeLxuUWvCRTgpzbrXr6Y8ShN0EKSAYfZLT/NKZCsgA0gPxbZW1ZCS+JlerTuXpFjSGx6+Ua0pnVJAVYZiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785605893; c=relaxed/simple;
	bh=h1I5cBGaL4NNtruvUDMk6k72yunOA/sUN+iC6Di/G7Q=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=UcogRpAFgLsVRwMRVXyLs1Lo86914tEPHAb4faxvqVV47UQEEpnj++3EOS0tfTMmb2DFCDxUe+AVRLIkAWE5e9C0S4H7It1sAQ1NoOTz/xi1KS4hWbJEABQRQprVwRjT9vn6TV8ruaJUZhHfbdt/ya8j0eBEC4IioDPi+c7Rbws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PJvfFzjF; arc=none smtp.client-ip=74.125.225.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PJvfFzjF"
Received: by mail-wr2-f1.google.com with SMTP id ffacd0b85a97d-47fd1b2021fso662981f8f.1
        for <fsverity@lists.linux.dev>; Sat, 01 Aug 2026 10:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785605890; x=1786210690; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3nDM0mc96Bzr18k4xoBHNsXxvKjDpatYOwOhRrLaoyo=;
        b=PJvfFzjFO135TYl1mBf/+rwRXk2RB4okqG6kR8SkpBrjZW6g9VixG2eP0XEnoaGonb
         hBEgziTMuNa7E8PsWw2hWZnzU7kfU41qz5T+it/AbuM9mvYoTaYaw8jplF/8mYFwnu3n
         g6DPzD/RhEWsQqQ13LpbX92JxCncHMwPCRyW+RUe2AZs67O4spMBU26Qr7LcdGugQZtG
         TZmO3y+Ax26zW8lAf0vPYW6s/GQhnzGqM8S3TaU9xhJ3CKsRf2t8N/bDEzY2qeZXX6fP
         t2kGl9OhLyZ2esLGlCk3vairOVaMMcX2+hAXXLvAJmGqR4NCMTtXPtrcvCH95ku0XD5J
         jI3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785605890; x=1786210690;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3nDM0mc96Bzr18k4xoBHNsXxvKjDpatYOwOhRrLaoyo=;
        b=I3o7NtiZN5xD+UBjJ4jqBw87y4zFE/IYP1KhVwSLze45dCrrHpneOQo1/6+ekloI4n
         NNaoJOAM0/EgQe2icDodOh/8Xir0Jyi6HD1X1/3i1fUJcMtrPKVn7MJ/BRuArSCf+AIY
         E1tESOA/vbNq4Esn9QlHBZzEshg25Te1cDdWqQczBuGWb+okkZO6/hpSXLjQNCo6lohB
         9P5w9cl6a7w1MRSxp9MZTV1R/3HvRHub8sx1yfpUaCQjEoZxrXkZEjogoiQYabeUqAfS
         Rev8yb6p9TAAjJOMVnZt+DnuSWlQsXhi+f/Roo0UyHgVConXitotz0rV1zghA/uRT5/o
         KqdQ==
X-Gm-Message-State: AOJu0YwqnlGyGNRe0n8fujC25gLsahLwmH/bwDOu7/68UHM6K87ekzku
	W/D0exP9kV66qTi4HTmSmIW5NTGGWDc+dua+33ZMmmQ7SQf7hp8LqegY
X-Gm-Gg: AR+sD11IU3YgXaHVIH5On7aED171OYVheiNhDLDXhN/U+lO9ouKU/2mtgnQpkIXN5dS
	UAoWI34rkCQEnp86ui9L3/ijVjtonlFd682tpE0rx2d9qgpcoqbAEbXP3bFR8Pazkr3AGyrjgDs
	gjF/YmlgYIkWbie32gWmYnj7r2NaVQuNyhzmvPTw4pAP/QLKXjav7HqpblHm+o/nlT15mWXmLu0
	fZdz879Y5IcN7FJSWfNq16/nZsoxv6O+AZU30OfOyHrl6kSnYgkl8kwgCPjk0E/lZ+xY+2IsYL1
	xbBQGQKJS1T1Oh/e3f1wceCtmGD9XZ+5BBBXUOZ0j8HYMGk1RS8gWp+zTwN00J/ZcZtf2+s/hJD
	f9CPW00c7lQkvDGc0EeoJGT3bn0+9JcSFzKm2j0+b/VQYTELvEaqcRgd4ybtjJhIWLVA7m7FUIk
	pes3XNZNLYRaaLfcskW1X9+6yYVa6XVDmWf/YfhT+YzpUFp8QyzmiLU1u+ghtOGP7XE2iHe68Ix
	0PwXfFfLPeziFg1MaVsRH/8fZvOLwZ2IxT1ESNY7SFedJ6GdIVBHotYebmIUXe+4wLayInuh7jl
	v/hc3n1Qs18l4NWMqWhzjfaFTqc=
X-Received: by 2002:a5d:4acf:0:b0:47d:f441:5f93 with SMTP id ffacd0b85a97d-47fd72c560bmr6890615f8f.25.1785605889988;
        Sat, 01 Aug 2026 10:38:09 -0700 (PDT)
Received: from localhost (nat-icclus-192-26-29-3.epfl.ch. [192.26.29.3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41d17f2sm20504660f8f.2.2026.08.01.10.38.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 10:38:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 01 Aug 2026 19:38:08 +0200
Message-Id: <DKDSGKU7WKI2.3UV1GEZW2VZWY@gmail.com>
Cc: <fsverity@lists.linux.dev>, <bpf@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Alexei Starovoitov" <ast@kernel.org>,
 "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii Nakryiko"
 <andrii@kernel.org>, "Eduard Zingerman" <eddyz87@gmail.com>, "Martin KaFai
 Lau" <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>, "Yonghong Song"
 <yonghong.song@linux.dev>, "Emil Tsalapatis" <emil@etsalapatis.com>, "Jiri
 Olsa" <jolsa@kernel.org>, <stable@vger.kernel.org>
Subject: Re: [PATCH] fsverity: Fix bpf_get_fsverity_digest() dynptr
 assumptions
From: "Kumar Kartikeya Dwivedi" <memxor@gmail.com>
To: "Eric Biggers" <ebiggers@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260731003925.2728977-1-ebiggers@kernel.org>
 <DKDRHTVNMQ2E.1FCTWQZO2EB7Z@gmail.com> <20260801171549.GB3567@quark>
 <DKDSE8AVM7Q3.3KZHCSNL4NT4L@gmail.com>
In-Reply-To: <DKDSE8AVM7Q3.3KZHCSNL4NT4L@gmail.com>

On Sat Aug 1, 2026 at 7:35 PM CEST, Kumar Kartikeya Dwivedi wrote:
> On Sat Aug 1, 2026 at 7:15 PM CEST, Eric Biggers wrote:
>> On Sat, Aug 01, 2026 at 06:52:45PM +0200, Kumar Kartikeya Dwivedi wrote:
>>> > Also correctly handle sizes over INT_MAX, which previously caused an
>>> > integer overflow and crash.  __bpf_dynptr_size() returns a u64.
>>> >
>>>
>>> I guess this occurs when using file dynptrs? Otherwise the size is capp=
ed to
>>> DYNPTR_SIZE_MASK.
>>
>> Yes, though it looks like __bpf_dynptr_data_rw() excludes file dynptrs.
>> So this particular issue might be unreachable.  Still seems like a good
>> idea to match the u64 type that __bpf_dynptr_size() returns though.
>>
>
> I don't see this in patchwork, so you might have to resend this with [PAT=
CH
> bpf-next] subject again to trigger CI if you want this to go through bpf =
tree.
>

Sorry, [PATCH bpf], rather.

>> - Eric

