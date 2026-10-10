Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A953E451D
	for <fsverity@lists.linux.dev>; Sat, 10 Oct 2026 09:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791622960; cv=none; b=ja6mNiHOVNlHNMSS/rS2feRxZ//wueQ6sp/CA+XNoXMvTz5MA5A0rI1H2h39OcTuPoUMSyxWPx0JlNLTbdxECYNtNc6R7wABqyIpm0LUkzVJ4/+3fKMB83vPAObk02dBTjmAdgwV0wa1fSnLbrMyYWrxi0EJfkRIoECEcXY6ifU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791622960; c=relaxed/simple;
	bh=QejqMsHiBB/4yRgImpsUrEPeQ9bf0UtT+H+EO6CQpPc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ov+iUQocnQaEnBtfTV26vB65f1sXc/k4vkR/oDehYeBDwzc5otcAC1ww3CIMiMQV5lT7ymeohIewek9LJaDNo/Cki4ibK5Ub2Gf1uH4aXaDz3SksAj0I+EkP6xt8TFdsEtkWsJwHj3CocTqzVitBl+Q/V8I101QbfEwrYip6zGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Q6Pk1qXM; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Q6Pk1qXM"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6a374bea882so765605a12.1
        for <fsverity@lists.linux.dev>; Sat, 10 Oct 2026 02:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1791622957; x=1792227757; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4pgI1vKggIJHGNGiqTkdyPpOoGvxt3pFxWjHLXybdRA=;
        b=Q6Pk1qXMEpVT0KuFuMyshASdsUCtbm9W+7AGNb9j51T24uDZlPQi2m7oy9JkR9IAjT
         FNuuGrkv9l3iLFOHIiFOUFm4g6qrIfyvmdaHSk6t7HCWaJ2Q45IHZ+u0AEIVAFsC1apM
         tdd0DU2zEUUhiQUy0TjbDl2qYRoXa8VMtocSqAkVi2lN7SxJqgrc8Y9mXRrfHm+sOPVY
         MK585f2SW2tTi/tgG+SnwwAgZmmEHcvw1MpUpHFOpF0CNTmJCfLUTC2AZ7ZzZJW9jrCl
         tah9khc+gu0pTlBkKg1fGfKtLYvlFLcCyNGGwXhhT6tL+vETlfEj8Q+lkUjCVugMinI1
         EYUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791622957; x=1792227757;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4pgI1vKggIJHGNGiqTkdyPpOoGvxt3pFxWjHLXybdRA=;
        b=c91kZlNufyNbW87J5BNLh1rSkUq5nMTuN/j3UlBEnysbG1cfgyzz9ux/Qdad42iny4
         vLrIO364v9zGuZVtdiNje7jDYHwIJl6yyGNHw6KLFkNoN9gvBsNRnsn/h27VR5KJe1Nn
         fBU3HEWNQeM1O0m0VomshYef2DYPTQlAgPjS+eP6iRqDynG5OX/P8xuBXCIbKVWEYa4s
         J5Ks6TzdBjzdP2m4BfIPHYjqP2XCudQAaS8xdtMh4kIIgtrkXXw1CQpgiTXi29gogKbn
         kuoSRLKZwsUBujjRAtATf4iTQYCEbJk9wtpsQkFnB16w/raSj5roIMI+UIGa+jcoZXR6
         N6sw==
X-Gm-Message-State: AFq9FYJYvZ+Yosq3Yef8/vFKXx59QuUpbVPMGiK6bdLzLDpPGY5Vq0w8
	341Qh+6lMB+IRzSN3/I+6848DZJdAb1K+RYw3z8ta9hyYxD0O6EWnMsxc6alminpcZo=
X-Gm-Gg: AYBFou1LFQ3MqaN5qczCo7vAMDdU4qX+8z4FPtx8hhi3Lxm5oNZUPgEUuGmZgrHjr0c
	1g0hMf7+Hpyd0a6q3ZcF/7tuYdVjaXnQsA8U6pa1SbqVraDlQoWer/s5kq1ffPykoA2i5STKVxS
	foJ9SLMAKRVl+Owxu4j6Kfnjv620524UL3/yScxpkWxFQjfSjHu7O8Xzy10Ypksma/wIF6GHpzI
	vIeSsz2zWFT9MjmbDS8W58FJiFZcf6+EHW4WcwPRSrqHFZKil+Vi54q/wjX+Brf2cifID1YJiXh
	2enZo1be8o9skqzE+0t0ofItiCyUDm1zu5QI+KO3MJNpJtq39bKrcxg1luYC9Jz99XJYFr0hff5
	eOp9vMvrCUwS200+HTcc8yqa02O5fXtClzf3+hrpkUy6+TathzaBGyevTJeItprthYvcVwS8esN
	fee/Hj7Umpms5h2sW20uiDdcgTeIHKdHpCoU1ik+37qwglfKYesYe8cOUH94d75w==
X-Received: by 2002:a17:907:3d09:b0:c31:8cfe:9a25 with SMTP id a640c23a62f3a-c31a9fd33dcmr446091466b.9.1791622956614;
        Sat, 10 Oct 2026 02:02:36 -0700 (PDT)
Received: from [10.86.128.17] ([149.22.87.44])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c31071absm2122417b3a.15.2026.10.10.02.02.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Oct 2026 02:02:34 -0700 (PDT)
Message-ID: <f180671b-ce45-4bd8-b536-b936ade0a79e@suse.com>
Date: Sat, 10 Oct 2026 19:32:29 +1030
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: btrfs: spurious fs-verity "FILE CORRUPTED" with large data folios
 (v7.2+)
To: Tito Duarte <duartito@gmail.com>, linux-btrfs@vger.kernel.org
Cc: fsverity@lists.linux.dev
References: <20261010083827.27604-1-duartito@gmail.com>
Content-Language: en-US
From: Qu Wenruo <wqu@suse.com>
Autocrypt: addr=wqu@suse.com; keydata=
 xsBNBFnVga8BCACyhFP3ExcTIuB73jDIBA/vSoYcTyysFQzPvez64TUSCv1SgXEByR7fju3o
 8RfaWuHCnkkea5luuTZMqfgTXrun2dqNVYDNOV6RIVrc4YuG20yhC1epnV55fJCThqij0MRL
 1NxPKXIlEdHvN0Kov3CtWA+R1iNN0RCeVun7rmOrrjBK573aWC5sgP7YsBOLK79H3tmUtz6b
 9Imuj0ZyEsa76Xg9PX9Hn2myKj1hfWGS+5og9Va4hrwQC8ipjXik6NKR5GDV+hOZkktU81G5
 gkQtGB9jOAYRs86QG/b7PtIlbd3+pppT0gaS+wvwMs8cuNG+Pu6KO1oC4jgdseFLu7NpABEB
 AAHNGFF1IFdlbnJ1byA8d3F1QHN1c2UuY29tPsLAlAQTAQgAPgIbAwULCQgHAgYVCAkKCwIE
 FgIDAQIeAQIXgBYhBC3fcuWlpVuonapC4cI9kfOhJf6oBQJqqw0NBQkUl/JeAAoJEMI9kfOh
 Jf6o/xYH/3AaWnGSq58XnY/T3/YYjr6g+TUZxa7MPyiYTELNpNlvmNlbtbAL0nW0LNvkeiqf
 SmYA+xkwY4RbxnZYQK0H5iv2w1eqa9qqFZb4bIBRmTapu26GEEkpad0W0ZhoSPMO8bV2Bwkf
 YdtPZQLaeUKvHZqNqBKnmtRLQj2Cgy3kuXX3bEGvWjzUOxPUSCj/S++JWBewMdMBPT62vZM0
 3156gfn5mHA94s2p+NFJoWkERY+JPTMu9NISkpD7yuGhXN88qd/aqD0RrlhxvKsrQogdPwn9
 vP18FGG3CRlHtOvOLVoY5NKSOWTDc+o+8t2XEETFTGbKYTcqeTzi4SxhvBLtTinOwE0EWdWB
 rwEIAKpT62HgSzL9zwGe+WIUCMB+nOEjXAfvoUPUwk+YCEDcOdfkkM5FyBoJs8TCEuPXGXBO
 Cl5P5B8OYYnkHkGWutAVlUTV8KESOIm/KJIA7jJA+Ss9VhMjtePfgWexw+P8itFRSRrrwyUf
 E+0WcAevblUi45LjWWZgpg3A80tHP0iToOZ5MbdYk7YFBE29cDSleskfV80ZKxFv6koQocq0
 vXzTfHvXNDELAuH7Ms/WJcdUzmPyBf3Oq6mKBBH8J6XZc9LjjNZwNbyvsHSrV5bgmu/THX2n
 g/3be+iqf6OggCiy3I1NSMJ5KtR0q2H2Nx2Vqb1fYPOID8McMV9Ll6rh8S8AEQEAAcLAfAQY
 AQgAJgIbDBYhBC3fcuWlpVuonapC4cI9kfOhJf6oBQJnEXWBBQkQ/lrSAAoJEMI9kfOhJf6o
 cakH+QHwDszsoYvmrNq36MFGgvAHRjdlrHRBa4A1V1kzd4kOUokongcrOOgHY9yfglcvZqlJ
 qfa4l+1oxs1BvCi29psteQTtw+memmcGruKi+YHD7793zNCMtAtYidDmQ2pWaLfqSaryjlzR
 /3tBWMyvIeWZKURnZbBzWRREB7iWxEbZ014B3gICqZPDRwwitHpH8Om3eZr7ygZck6bBa4MU
 o1XgbZcspyCGqu1xF/bMAY2iCDcq6ULKQceuKkbeQ8qxvt9hVxJC2W3lHq8dlK1pkHPDg9wO
 JoAXek8MF37R8gpLoGWl41FIUb3hFiu3zhDDvslYM4BmzI18QgQTQnotJH8=
In-Reply-To: <20261010083827.27604-1-duartito@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



在 2026/10/10 19:08, Tito Duarte 写道:
> Hi,
> 
> Since v7.2, reading fs-verity files on btrfs intermittently logs fs-verity
> verification failures although the data is intact:

Next time let your agent to check the mailing list first:

https://lore.kernel.org/linux-btrfs/15f4ef9f50e1f4af375e45cf976717041f1a96d4.1791613764.git.wqu@suse.com/
