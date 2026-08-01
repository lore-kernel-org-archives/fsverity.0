Received: from mail-wm2-f9.google.com (mail-wm2-f9.google.com [74.125.225.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37BF63403E3
	for <fsverity@lists.linux.dev>; Sat,  1 Aug 2026 20:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.137
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785617315; cv=pass; b=QBvLB8xknh6rysT1eyM+V38Q/k38bwhTCxcK390yzcDPcOUJwdd4aJe6soObxuUiq5QtWvgDsr5FaaBsK2PMI2IUbLvZKgWAOTAtk2Sgn/wsEnDi5W6ac1PT3jgUWvMHbkbqfMowIVqh8R+GMgCP9q7t5WC6mL8QW8snTO9CNpE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785617315; c=relaxed/simple;
	bh=mBnkT6ThApqljIooYhlHy2KrG4XpgC9Us1AFdPaobNE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fFRF4xjNJ3CgwEnMwh8SiyQLBPi9q/ryY4hhcYkTqFzIrHmzGUpceSl0JziES/JW5goD4ETFwKPbsE41G4Rcp7adRminZQPI4sVcXVD4UwCi1gV5PoEY/pXvv/2iDQVdiSoBghgAppaYu+8qXw7BzIJbuq9hrE1pxYw0FLiMZn0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fi9J5crL; arc=pass smtp.client-ip=74.125.225.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fi9J5crL"
Received: by mail-wm2-f9.google.com with SMTP id 5b1f17b1804b1-49556ce3549so3736895e9.0
        for <fsverity@lists.linux.dev>; Sat, 01 Aug 2026 13:48:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785617312; cv=none;
        d=google.com; s=arc-20260327;
        b=eqDw2t8V4o3oBJje1h62j6QXFJsljPpzm34HQSY3u4siUJIjH94mT9JBRPCKQ99Pp+
         yjJHyEHud2aBd/lGe/xm+l/xvYI6XuWcOIEcSdB7wfK1BgmwqwZae5APJt1eoAciXCOx
         qC+UgScb57nNP0FY/94vGWPx5Cho9IuAAUaOh45TNdzNkAAC9aDsMlRtfyywWvoQKqn4
         cF47iu6NVr8pc/moVj/y2vEl9wVytbtJ/go32luJCZNTgWOWooRrLLlSsDeYvJHgcfyZ
         b1LPt6OIuPy38kHHnLpTZVYJFLJmrD8KOZrABi0F4Wlp4VcAieVB0iD0bFPV0WZGRCvc
         1GDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=8C6J3xKw6R8FPOPnn4w954ZGYhiuE4HGYU/iy6pgEu8=;
        fh=T+A7pNeEN2TQ4vfKNKDbsMN/yIGjP1msTksgS99itqw=;
        b=EwuhknvbHmZ+3WDKHQBPVx3gEVsq5mE/HnvtspTOLNIqTFLzLvxc54JvRia611Rgkz
         kaDg+pAdiVg1HVrNRVXSICdEW471Xg+vzGBecygEfwTDK626+JNVatxdQJG2CQdraqAu
         hhQzzuCCMAQkrtZNEnNeAyWBKUDerYw0IbL9P2UoA8OdIt8yOasqwk9e39aEZmbuv+0z
         0Pynsg/ImRzEVrUCQmS7M5sfCJYmGdEXDvQo2L5I3PyRMdBmUIVCbZO+jNUwzl5Wf3C/
         /3BQVP+YoIbC4gRMdbv1gcTXO5vvdNVOZ/YCgzkXwqg5E0eD2kAPaD6Eac/+wJoWwWwo
         tGpg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785617312; x=1786222112; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8C6J3xKw6R8FPOPnn4w954ZGYhiuE4HGYU/iy6pgEu8=;
        b=Fi9J5crLjfs04PLVlqs/pcUnvrbzMFcLpCAvNbQ60QRBoP0uzWrNCFsDF+qLVHXoXn
         g6ji/dvyGLzO3M9xSGr0ZnyQx4LPMtPg5Fgo7v+QB7met8A1PO+nEs2+1clXMkR6e89K
         lUwWKB2nrr4cdlVEqxCbfU6fOh4zNaq2dx1FR0i/4ct4bXDegPvmZyUNn+flUvpj99LC
         SsfI1OK0fLKqvyFqQSPE5MpAnQ4qO78/35G5toEMMXPieTF2JQ0VfH4f++oqsH0C31jg
         /PlUMxAyu3aap7CEG/jmjfvjOzR8R8h41nEJnOVPWXBama4881oB+RjhEtXYmFFScKLv
         BPpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785617312; x=1786222112;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8C6J3xKw6R8FPOPnn4w954ZGYhiuE4HGYU/iy6pgEu8=;
        b=pOQc/JgHTPtI3tZM9DmyWoAJDTkzq8aEoyDpBLO/mb+XjejNmRIBo32DVUd6xeCKNd
         EM2RpdnafbguyA6qwyERHq+8nFaG/xC71e2KvEhms7daySEBhM9wjGxlKEMdt4CNGyGa
         pETLwhrVsp9fGwXfH3cWEsdmCllsNW1FQEdsAKpshhAaAyMc01Om7Q2xy5FnARH27r7f
         COj5zMBocPkZMno6vccUo6GcRAH8trf4PIKtqroX77B1ACQHXU5MY6pivVouAFQKQ58x
         w/qqoB9yiIoBE/ZzseVk7kdUhzttFmD8pJ3Rj0m0CLy9Oy/lOq2EBaIP22T/wzXE01qV
         Spgg==
X-Gm-Message-State: AOJu0YwTOzZUB296kxQ3Xfnr7X5K1CwWO5NTDWMekh6secU6YN4pgpWx
	7fyOoE2NJMSz4fvrdGGTWrHpVtaGBNjLNccoaFOPU+A4j2SfOM+8G97mTw7+ov898rReqmxJ1XX
	vqt0nVUZ+n8pumRCK2E6UQnRVioMceM4=
X-Gm-Gg: AR+sD12ns+utMI1v3CyzqH71K6m+CX8gjD1+q+HhXftYVxrVgrV7EobrWw0y53Pj7pW
	iLZFGInO4T2Clv7M40+w6unHgoDOXGUUq3S6qNAEgI6oR9N6P5XYWEAvkHsV4eKtdTqpg2cz1VY
	8rO+Rw8gUlq1mLfR3MXbranpsg0XIFqF3sUyaZpqYXxx046dRm3KT0yzjdfTlKmkid98+QItzdY
	+WHriE2sZzu/2dDtgq5WrvWAmmm7qzJ8ZuBsUC5CMr4lKsEpVS/CzmWifGsmBO+m8Q1H5WtYSoq
	bA06jF3MmIBQkM8oQISsmLC/WxkIbt4GL+LvLVv+K52PLcnjnlHJW8Xjr6ILGhiZIPYWPwxNCDl
	Wu2OWhCabSUC4KVGmWs4vOXJSIX1kOhTCDeaiXu1AG4ioI+ulk7JdhBrOjaVtMSHCWzuTcgXRvj
	4rtyGyy0SS8BefP9XpJ7rO
X-Received: by 2002:a05:600c:4e8c:b0:492:3e69:a86f with SMTP id
 5b1f17b1804b1-4980c66c82dmr61216715e9.1.1785617312375; Sat, 01 Aug 2026
 13:48:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260731003925.2728977-1-ebiggers@kernel.org> <DKDRHTVNMQ2E.1FCTWQZO2EB7Z@gmail.com>
 <20260801171549.GB3567@quark> <DKDSE8AVM7Q3.3KZHCSNL4NT4L@gmail.com>
 <DKDSGKU7WKI2.3UV1GEZW2VZWY@gmail.com> <20260801201830.GA9537@quark>
In-Reply-To: <20260801201830.GA9537@quark>
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Date: Sat, 1 Aug 2026 22:47:55 +0200
X-Gm-Features: AUfX_mzLIMowetDUO0vAuf8KJJkY3h7UzUQoep8RdQws3hVuyYMF4336u1MQHcg
Message-ID: <CAP01T74A0umBf_2hCuAygvUFBocjrDogxnu1_U+RkKBw8ictfw@mail.gmail.com>
Subject: Re: [PATCH] fsverity: Fix bpf_get_fsverity_digest() dynptr assumptions
To: Eric Biggers <ebiggers@kernel.org>
Cc: fsverity@lists.linux.dev, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Emil Tsalapatis <emil@etsalapatis.com>, 
	Jiri Olsa <jolsa@kernel.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 1 Aug 2026 at 22:18, Eric Biggers <ebiggers@kernel.org> wrote:
>
> On Sat, Aug 01, 2026 at 07:38:08PM +0200, Kumar Kartikeya Dwivedi wrote:
> > On Sat Aug 1, 2026 at 7:35 PM CEST, Kumar Kartikeya Dwivedi wrote:
> > > On Sat Aug 1, 2026 at 7:15 PM CEST, Eric Biggers wrote:
> > >> On Sat, Aug 01, 2026 at 06:52:45PM +0200, Kumar Kartikeya Dwivedi wrote:
> > >>> > Also correctly handle sizes over INT_MAX, which previously caused an
> > >>> > integer overflow and crash.  __bpf_dynptr_size() returns a u64.
> > >>> >
> > >>>
> > >>> I guess this occurs when using file dynptrs? Otherwise the size is capped to
> > >>> DYNPTR_SIZE_MASK.
> > >>
> > >> Yes, though it looks like __bpf_dynptr_data_rw() excludes file dynptrs.
> > >> So this particular issue might be unreachable.  Still seems like a good
> > >> idea to match the u64 type that __bpf_dynptr_size() returns though.
> > >>
> > >
> > > I don't see this in patchwork, so you might have to resend this with [PATCH
> > > bpf-next] subject again to trigger CI if you want this to go through bpf tree.
> > >
> >
> > Sorry, [PATCH bpf], rather.
>
> Sure I can do that.
>
> Would it be okay to also make this function return -EOVERFLOW if
> out_digest_sz is too small, similar to FS_IOC_MEASURE_VERITY, instead of
> silently truncating?  The silent truncation is a footgun.

Yeah, I think it makes sense. I will also ping Song to ack this on
Monday (or your new version).
Thanks

>
> - Eric
