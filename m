Received: from mail-wr2-f0.google.com (mail-wr2-f0.google.com [74.125.225.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4235C3B71B9
	for <fsverity@lists.linux.dev>; Sat,  1 Aug 2026 17:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785605710; cv=none; b=Ky+r/H/TCzKKHc2jzfBu4fnpy0qCiAqhz3wt+4cIYb8SGfCedPhQMOd2f7LkWTVZ9VRKkBhy5Tnkl8bFdUDXz2PNefwwz3cbkAJxqISGiUGG6bm6/DpEojYp0wMfv6hRxHv0DCKElFX9A5e5D5c/35DbqhJvZNFksb/suYwg6/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785605710; c=relaxed/simple;
	bh=qrkQjH/yPS0Ki/jy3KZEKed04xYWuEysIpsTesxuj9o=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=D1FVSFFAFIp/F5z8043ciKj9ViGHR1YGcP64BnzRLt7TM/4Yh/xu4WU+3lgOsWQGW04D/NSxQBE1tXmrtqICRDZYY81GZZKtGwIDn/ZkaL9ZMYg8XLKTnI5QDy8sfGb3vqjFaqlg3fW2PASua+H5pdkpC5+9JEiIEVYsgcQj/qA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PdlJcxXC; arc=none smtp.client-ip=74.125.225.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PdlJcxXC"
Received: by mail-wr2-f0.google.com with SMTP id ffacd0b85a97d-4784b41f3aeso647363f8f.1
        for <fsverity@lists.linux.dev>; Sat, 01 Aug 2026 10:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785605706; x=1786210506; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ug8010ZyC+kV7fl3Lgjmm0rAlYJx/RD0vaE5unAL+gA=;
        b=PdlJcxXCzzUqHGXZsAQir9K733n+8KMwUdR/qmPZD4q3XTNOPMFIp78aNELbKag6wy
         MbIjJmiDYJLqRNQXTuk9EvOysRro0fvfDmp2haTu3qbXLCbXjZepCsSM21SYg+o+HErR
         mDq/gs0Uc12HKISNAL2HYqGrj3z6ix6kzVy57UNMubElYASJomyzLKnFg21+YC72Ry4E
         /618UL35GvDYlxArMuPHOSI6R0a0/j2YeJNEdW5c2cvulkJ1Lu6fGGATJWOtlk09sU+/
         sVGAhy/Ef7JAe4+XXa6d6WxnCc3yeMg6R9V3mYe1FOp2SKsAIQYlrlVqSBBpaHqbMcGP
         n1Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785605706; x=1786210506;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ug8010ZyC+kV7fl3Lgjmm0rAlYJx/RD0vaE5unAL+gA=;
        b=aWHonkiMr6WgjSlMVwjKC4VzGsDneBmXWEYvHYIGxrUI5mvUooVjCi0Vt3dbfB+LKX
         dII8LMCIziVaI5rOpgc+jbCqTnXyqkCQpHWT3tTtwzERoXuuUg3XwdZByRDvdVuBapgT
         CaGGixANrQWayFQLa7KPBGkKU+uh4tpPe+B645R3Qc3eMMyKI0rM5GrGlxFdkW5qOM0c
         zoegI6d3jYkzYvf48L8x6mqFSi58FrCFL2v7/UEXQsy8T2AUK9jSaQ4ygwTB4iUP6/bF
         ctw3uW4frXP/NF211Uf54MB6q1W0xe7nrV+wobTgrnP+plKVK6WUBgXLyj1tSFobsNzi
         G+aA==
X-Gm-Message-State: AOJu0Yz/31pJ72jSF6zDp3QBQoPhBsI11yP1VR7qbPxN/pav+dCurgmn
	A0yzjTZfCu5p2lqv/gV+99A+mfqhFUo2gsVJzMpkZSI5SAgAv0NYScVn
X-Gm-Gg: AR+sD111Bat54+6EoemIy5osh8/4WXL88X9tN4ZWvPagQf/z9WOj4UEkDoxmwc3itEG
	fwWk6Ob1efL1cmpGu2oL04u0N1qznruPW2276aabcn9NAUQ6vkPLJSBr1p3+a/0XVMhJvS6LAJ+
	YYv+ZHEr1OdprLyWXti/flVmoyPVnqd5Y/QfXLwtCuxZuDc06Mjppfc7dcmOmUnskH2OPLZdvg2
	J6MANjNMTncXRV93Gnq2wilAhJFZQCWtdCFgiTJdEVn9Ytaad+z24q3iIEa/80xOvzBjgKbC5dn
	xcUOwpo944u+q2S6XSC/Ap+2jnj+gF6S8q5iHse/zMbqXex9IIXzIesS8WA9PXUVngy7QxKFTqt
	+RMG3vcYKs49S5alciglJ9MN+ryiIw+/+BT/0Gn6+xpIoHcUnLkCasQFgZccYk5hlLvNNxPOdSj
	qoVojuM+kcMQClEpy4MD4T6iHzvQhhzwtfXbcDBG1oT0GNdY9KOB854Wz6n1fyBuoLWMBGN1q0U
	FBwPdMg2jrZuUTJbuSaVadW1bIy8AlpOAHefl+dJS8rpv+gKwOn9WIOF9tAeTsGDll4dTUpoX8F
	uBLg6iq43vILk73l5nojMGL9NlamtI/KHr/A1w==
X-Received: by 2002:a05:600c:c4a3:b0:493:a613:56b2 with SMTP id 5b1f17b1804b1-4980c64b5c2mr55006905e9.8.1785605706390;
        Sat, 01 Aug 2026 10:35:06 -0700 (PDT)
Received: from localhost (nat-icclus-192-26-29-3.epfl.ch. [192.26.29.3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49808199f2csm98595505e9.5.2026.08.01.10.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 10:35:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 01 Aug 2026 19:35:04 +0200
Message-Id: <DKDSE8AVM7Q3.3KZHCSNL4NT4L@gmail.com>
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
In-Reply-To: <20260801171549.GB3567@quark>

On Sat Aug 1, 2026 at 7:15 PM CEST, Eric Biggers wrote:
> On Sat, Aug 01, 2026 at 06:52:45PM +0200, Kumar Kartikeya Dwivedi wrote:
>> > Also correctly handle sizes over INT_MAX, which previously caused an
>> > integer overflow and crash.  __bpf_dynptr_size() returns a u64.
>> >
>>
>> I guess this occurs when using file dynptrs? Otherwise the size is cappe=
d to
>> DYNPTR_SIZE_MASK.
>
> Yes, though it looks like __bpf_dynptr_data_rw() excludes file dynptrs.
> So this particular issue might be unreachable.  Still seems like a good
> idea to match the u64 type that __bpf_dynptr_size() returns though.
>

I don't see this in patchwork, so you might have to resend this with [PATCH
bpf-next] subject again to trigger CI if you want this to go through bpf tr=
ee.

> - Eric

