Received: from mail-wm2-f10.google.com (mail-wm2-f10.google.com [74.125.225.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD8B3B38BC
	for <fsverity@lists.linux.dev>; Sat,  1 Aug 2026 16:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785603169; cv=none; b=sfeMOptXfql27suPiE7I/UpZ34ofXsigrg+h+U2eGAq0uq97jemPkoGuyy/GhfrWMveIGGrzoo453vH/agP3QFrLtG0gOB6ZkDD55Rdkm8MKdnDgbSedIczpitDaGPuC7W1QCYFRhRiW4yaxAL1ud1sLXSbZxvfcE1zpUI2PiK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785603169; c=relaxed/simple;
	bh=KgdOOMyZqtF9at8+Chv5TnjOOT3t+C5+wsxUxONLNNI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Ked2kaMBBctrC9o+/dY7HeUZeL43mDXGVxvM4BCXeVzMST+m9tF6TOXnjUqdmHZBBbZ8LtY4HdmlxvDDJHkQZa0faTlDxw7UStRlNxLfV/rcR4bpOZHeKP1rLPB3DdrExyy3pXyqPVCHlK6EYtc5lVFH1i6cfpGG9HSUh8zHLGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZUxnt+5T; arc=none smtp.client-ip=74.125.225.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZUxnt+5T"
Received: by mail-wm2-f10.google.com with SMTP id 5b1f17b1804b1-495482c36b8so2829635e9.0
        for <fsverity@lists.linux.dev>; Sat, 01 Aug 2026 09:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785603166; x=1786207966; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wIeansZilxyffldQc11/VX8an2oLgIWn7z7CoIfg0tI=;
        b=ZUxnt+5TjZnaGbwkDE78mzHeZ62dd5niUBkQLK2sUW7y99WuK1P4GDPrw8CJuHhwpl
         Bx07HAOqykbbrTfOoY6j4SF+yH+ZVq7Ah+TtBUpm+OOSHutSszvH9e91R7BJoNEYAePO
         qQlcZV4vu0QIlEl3n+rJ4mJe+E1pvgIYZeUoY7ohorZ/Uz8g5LXjokBEtTCow6cjG9jD
         ZrA7U+P2qRmuI+7ILUdmJu5B4byYpCPT8ELKbroaPmGylhoWGkhtIWrsvvpwZuDBymM5
         BrFA+PskpfA+hKUNLoy8C/coq9qY9JqSv+6XNbvXqa5NmT/yyZ3IjKubR1HAsnFawfSi
         5nGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785603166; x=1786207966;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wIeansZilxyffldQc11/VX8an2oLgIWn7z7CoIfg0tI=;
        b=YESAf7LaL/RO8wme4A4sy2sAZY+n/z3NJeauNiqd6gZb15GFI/GSf5w52o2PpnxNhg
         zwFQvQtDHUwthlX62IlbANd+hkhuFTpDKfEskWnPTq6j2oBJSYlJNIvJMzDhfngpizcU
         gyQfx7xbe0Ynn7SOH3toky1yOnu1y1IwYpT2OiEIYSvfeHy7fPO37EDcwdmhYPzzmGB3
         YJmqcwWML+Mlu5wAKeyJWyucSdtZ9D2DmgPPH0U8KuNdbBr/AhcWZz1BqPzzJETsGscx
         Qt3AxZvqgILGn5yzEn5mMhDwZYk4Tk/1ltrf2o+g+BoDsrXJAds7MdcC05p8apNONSgO
         vYvw==
X-Forwarded-Encrypted: i=1; AHgh+RpF6MVZXn2EDuQ8rJ2Z3irtCdQXBX2Ho27sfkN9tf+YSmcFk5Eusrtbx+jYwqQNCfFjIU2MD7zC4w==@lists.linux.dev
X-Gm-Message-State: AOJu0YyvXY2cX6vcbvPYg4ZDgvvn0wpdLlorH6a7jFUOMcUnMt7tl78k
	wPWULepV+/MbSpnk3xQCkBGHrN2qN4n73sZWTPl4uexD9ET+5KiL8Wxp
X-Gm-Gg: AR+sD11uwlN6nhz6w7Y08XzjwcZK+Bk9QNnEyymunkrYnTBC4GyP+I6dnv3vt3nx8oj
	ZV1NkGehLZhBq2oyi27CA9GbPFJvii8DO7rxNQeeIHFwLwe7Nnpgwm3ciRghNt+ouznBZY3LzPT
	iaNEAYECb0ZmfL4kYZz7BR7e+V6X6wgUjELg1249UjxzAKOtd4qsgeR6TrkVHsicuw1P68PTskJ
	q2wpdUyIpG+sWiG9x9Ljop4Vd30BtMb8JhK9cbLSXUGfmpelG23WRdMIF3zqGe6AMLKqDvNOZ4l
	MRGW2++g/25MbF/W1DTQtrtjAFhljn+IzDPdee2iO+OCA8h98l8wnYrxoqIcVB2IuVyhUBX2rmD
	/UxAcvKHOVRD6T2NtEvy7qAkjBSImMIVO3V1q1gLQPOuiK751rruXPlAOg5hWL4oUpjdenfi6qS
	M6Tg0tcZSCBzKNVYzChhaoiyF4VztN7DBEoWBH/fPXZPOI8THVRRwnyJsRpXean+kmB338buVCe
	x1eUMh2J6XyfguCWmZN0xTKhHWttGOfjemSHrVB7M6gRGP2zGI6u8o78XUfeCQAhYcqZizYVvtB
	z52LRkzvYuoJsODtwxkqfagbldc=
X-Received: by 2002:a05:600c:8b17:b0:495:4491:b8c2 with SMTP id 5b1f17b1804b1-4980c66c926mr70298535e9.3.1785603166215;
        Sat, 01 Aug 2026 09:52:46 -0700 (PDT)
Received: from localhost (nat-icclus-192-26-29-3.epfl.ch. [192.26.29.3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49808191ef9sm78066875e9.1.2026.08.01.09.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 09:52:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 01 Aug 2026 18:52:45 +0200
Message-Id: <DKDRHTVNMQ2E.1FCTWQZO2EB7Z@gmail.com>
Cc: <bpf@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Alexei
 Starovoitov" <ast@kernel.org>, "Daniel Borkmann" <daniel@iogearbox.net>,
 "Andrii Nakryiko" <andrii@kernel.org>, "Eduard Zingerman"
 <eddyz87@gmail.com>, "Martin KaFai Lau" <martin.lau@linux.dev>, "Song Liu"
 <song@kernel.org>, "Yonghong Song" <yonghong.song@linux.dev>, "Emil
 Tsalapatis" <emil@etsalapatis.com>, "Jiri Olsa" <jolsa@kernel.org>,
 <stable@vger.kernel.org>
Subject: Re: [PATCH] fsverity: Fix bpf_get_fsverity_digest() dynptr
 assumptions
From: "Kumar Kartikeya Dwivedi" <memxor@gmail.com>
To: "Eric Biggers" <ebiggers@kernel.org>, <fsverity@lists.linux.dev>
X-Mailer: aerc 0.21.0
References: <20260731003925.2728977-1-ebiggers@kernel.org>
In-Reply-To: <20260731003925.2728977-1-ebiggers@kernel.org>

On Fri Jul 31, 2026 at 2:39 AM CEST, Eric Biggers wrote:
> The BPF verifier and the dynptr abstraction ensure that the memory space
> referenced by a dynptr remains valid.  They do not, however, provide any
> guarantee that the contents of the memory are stable.  kfuncs are
> expected to remain memory-safe even if concurrent modifications occur.
>
> bpf_get_fsverity_digest() didn't follow that: it could crash if
> arg->digest_size was concurrently modified.
>
> Fix that by using the known-good value hash_alg->digest_size instead.
>

This makes sense.

> Also correctly handle sizes over INT_MAX, which previously caused an
> integer overflow and crash.  __bpf_dynptr_size() returns a u64.
>

I guess this occurs when using file dynptrs? Otherwise the size is capped t=
o
DYNPTR_SIZE_MASK.

> Fixes: 67814c00de31 ("bpf, fsverity: Add kfunc bpf_get_fsverity_digest")
> Cc: stable@vger.kernel.org
> Signed-off-by: Eric Biggers <ebiggers@kernel.org>
> ---

Acked-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>

> [...]
