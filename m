Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C25E2110F
	for <fsverity@lists.linux.dev>; Fri,  3 Nov 2023 20:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mjDm2XGD"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-507975d34e8so3496831e87.1
        for <fsverity@lists.linux.dev>; Fri, 03 Nov 2023 13:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699043206; x=1699648006; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lIPkfPZvsJFl00A6YMaZROp6c7APaKkERcq3nCq6tRk=;
        b=mjDm2XGD6+Nto82afNO4QNQ6e99JxzXsSIrMZdeW0SeT0o2+ofADZvR2FSrvvbbJMh
         d1MTAMzYvS1+yRRN3eYHylOxWD5XzdraFoLkuDH6pT9D/S175kZhdbZGt1AtdAnS7BIU
         GoGrvGZL0lmNOXRE5Mqg9ZkISYTmvkXV3EQzP3hUC0wZZQZ+oOvhKv4vSeorRo/Sh23d
         +g2aH9Bu3UPF3ltNsz7iLNRdSYcplQNj+EAHwzQaeW7q6pFXrsyzKsm/Xd02++kTzYIa
         vfKB4C4IRUSkZZt8QrJfDK3wLSoG2qDvfVnf68uWoOLPbx9U/+N3WVjee+4ySz8NGiYK
         8MTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699043206; x=1699648006;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lIPkfPZvsJFl00A6YMaZROp6c7APaKkERcq3nCq6tRk=;
        b=erKN6j3Crg0sxrvrvE7NMMSqFZoNqAQwcpM8NW1btMNCFzqaHFNTMU8Zk6zOjapFU1
         pmpjGSJsHPoiblcjPhfOuVLMg46l8r94W0HWvF2tx9SCmTJJ/YuZ3u0O8iNDl+RhE6yB
         hKRGDfNpDnAlRfG+06bxOtNoyROswVem1CIdQLsxN7jTlfESy/RBkAPnlduSFc3wIq8R
         8RVH5xmKA9GNdNLHRFb27rjmaaRVwJMoT+K63VpSYEQK4HEpH/rLP1+pitnQv9Q0VLZ/
         NKZXgrfiyC3sBO6lo6brA+RYy9vk0vaA4Bd56C3jDQABZAHrqJswgPd3O+gXYPnvsd0X
         gitA==
X-Gm-Message-State: AOJu0YwK4FFzLs71uoWYCZf1dYJHQJD6vQ4G3lVJ7omOu7kQw6793Dli
	jl/LBnqh2h2jxz0CETW8q4Pwp+2VjpwaG1hHUT0=
X-Google-Smtp-Source: AGHT+IHYpRg8cWvsELbq/cDvWCzFmXw8xZgCCK+woCvoFKHU89G7hjvAxcsp33/6p5G3nKV9dLLrgXTv/26EZC8XeZo=
X-Received: by 2002:a19:f70c:0:b0:503:3278:3221 with SMTP id
 z12-20020a19f70c000000b0050332783221mr15770642lfe.69.1699043206004; Fri, 03
 Nov 2023 13:26:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231103190147.1757520-1-song@kernel.org> <20231103190147.1757520-3-song@kernel.org>
In-Reply-To: <20231103190147.1757520-3-song@kernel.org>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Fri, 3 Nov 2023 13:26:35 -0700
Message-ID: <CAADnVQJgsaH1XddyKphFW0to_0n7xFY_5SFQ2BjMeFACQNH2Zg@mail.gmail.com>
Subject: Re: [PATCH v9 bpf-next 2/9] bpf: Factor out helper check_reg_const_str()
To: Song Liu <song@kernel.org>
Cc: bpf <bpf@vger.kernel.org>, fsverity@lists.linux.dev, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@kernel.org>, 
	Kernel Team <kernel-team@meta.com>, Eric Biggers <ebiggers@kernel.org>, 
	"Theodore Ts'o" <tytso@mit.edu>, Roberto Sassu <roberto.sassu@huaweicloud.com>, 
	KP Singh <kpsingh@kernel.org>, Vadim Fedorenko <vadfed@meta.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 3, 2023 at 12:02=E2=80=AFPM Song Liu <song@kernel.org> wrote:
>
>
> +static int check_reg_const_str(struct bpf_verifier_env *env,
> +                              struct bpf_reg_state *reg, u32 regno)
> +{
> +       struct bpf_map *map =3D reg->map_ptr;
> +       int err;
> +       int map_off;
> +       u64 map_addr;
> +       char *str_ptr;
> +
> +       if (WARN_ON_ONCE(reg->type !=3D PTR_TO_MAP_VALUE))
> +               return -EINVAL;

Pls drop WARN. People run kernels with panic_on_warn.
This is not an error that is worth panicking on.
