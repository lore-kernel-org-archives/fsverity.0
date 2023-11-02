Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8699A1DA29
	for <fsverity@lists.linux.dev>; Thu,  2 Nov 2023 16:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ULiaUpQs"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-9d274222b5dso191251166b.3
        for <fsverity@lists.linux.dev>; Thu, 02 Nov 2023 09:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698944292; x=1699549092; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZPcRpgkJLKOqQjBSbWACjfbVfsa8e/UxzcPQ+su5uCE=;
        b=ULiaUpQs6iwBp7Mzisb/qjl6xcTfhR15G+DyEMyuWRFBJITemkJYbS5Jz287f/EeUL
         pZlH6PnRIkiegKIEd5pc8nx4y66fB33tlh0bc4OCLEamj51/X/giLWx1NEjbI6OjsXTZ
         0fL01VqFl/3HcWzO6zb1hB1Ni6xSq2n/QbpWCx7SS8KVihK9xrO7kr39shfJJTuqUpAR
         q9II99ggAYPujGgtEu0iRrb5gFyFyb11R3TPRJ7s4/PHn6tbjbiUi5DtiBtib/8Qw+gV
         MAVI/qhXswL3NS8+KPJOIJ4plT1hn220/GJC+GJ0WTWOeUxxwfuxyuaaPTQDeaUjbLsZ
         h8Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698944292; x=1699549092;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZPcRpgkJLKOqQjBSbWACjfbVfsa8e/UxzcPQ+su5uCE=;
        b=hAWU+OkzyJQHP098R/HqXu/z4tw7RsKWs18PxEXkGW+DKkD4sMf+Lcy1kVao0BmcRn
         fpRAY9jXKW970tzBZYMZzmZAVL+zTsHflXnJ4bSf/p3v7U9rOc34VuwhZDXEWyBIobWk
         BRRvWfVXE6TevFc+gtBhOghKeRWU+cqGOgei/GnPDxrAoMkdHPEk9pgCA9ocI7Ay1v8j
         F0t86ByIiKXPHSZ2ahIRelxlFG0hZIF0MY5AtxcjhtEfcimbZ1bYL6YRnDrifKkzeaDN
         cGiY7m+3J+IevVrB22dsZKohhCQ2MjuHJMzPuyAFXBppNWt+AsbCM3sIFDck1XDWacv+
         lGew==
X-Gm-Message-State: AOJu0YwWQ3vbc3Wx7uOl9U/FunA41HenRivQgZ1ThuJXfSzmRHviYXPR
	qPOBkjX+qYfMb3UvY2HmEgZUpAzqLuVi+u1GlCo=
X-Google-Smtp-Source: AGHT+IEOl8uRxKrYgDJKuvpCigDmSHVCjegPh7u1wjycTK+e5equPh7Upa8iuNdVIbj0RwvCSGko+7agxh66KK4Udas=
X-Received: by 2002:a17:907:6d06:b0:9b2:abb1:a4ab with SMTP id
 sa6-20020a1709076d0600b009b2abb1a4abmr4490629ejc.65.1698944291437; Thu, 02
 Nov 2023 09:58:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231024235551.2769174-1-song@kernel.org> <20231024235551.2769174-3-song@kernel.org>
In-Reply-To: <20231024235551.2769174-3-song@kernel.org>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Thu, 2 Nov 2023 09:58:00 -0700
Message-ID: <CAEf4BzaHm6zbPGAWVfLC9YAV8_w8A05nf7cWgQfd+uH4L7ZfmQ@mail.gmail.com>
Subject: Re: [PATCH v6 bpf-next 2/9] bpf: Factor out helper check_reg_const_str()
To: Song Liu <song@kernel.org>
Cc: bpf@vger.kernel.org, fsverity@lists.linux.dev, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, martin.lau@kernel.org, 
	kernel-team@meta.com, ebiggers@kernel.org, tytso@mit.edu, 
	roberto.sassu@huaweicloud.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 24, 2023 at 4:56=E2=80=AFPM Song Liu <song@kernel.org> wrote:
>
> ARG_PTR_TO_CONST_STR is used to specify constant string args for BPF
> helpers. The logic that verifies a reg is ARG_PTR_TO_CONST_STR is
> implemented in check_func_arg().
>
> As we introduce kfuncs with constant string args, it is necessary to
> do the same check for kfuncs (in check_kfunc_args). Factor out the logic
> for ARG_PTR_TO_CONST_STR to a new check_reg_const_str() so that it can be
> reused.
>
> check_func_arg() ensures check_reg_const_str() is only called with reg of
> type PTR_TO_MAP_VALUE. Add a redundent type check in check_reg_const_str(=
)
> to avoid misuse in the future. Other than this redundent check, there is
> no change in behavior.
>
> Signed-off-by: Song Liu <song@kernel.org>
> ---
>  kernel/bpf/verifier.c | 85 +++++++++++++++++++++++++------------------
>  1 file changed, 49 insertions(+), 36 deletions(-)
>

LGTM, I don't feel too strongly about that added WARN_ON_ONCE.

Acked-by: Andrii Nakryiko <andrii@kernel.org>


> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> index 857d76694517..238a8e08e781 100644
> --- a/kernel/bpf/verifier.c
> +++ b/kernel/bpf/verifier.c
> @@ -8571,6 +8571,54 @@ static enum bpf_dynptr_type dynptr_get_type(struct=
 bpf_verifier_env *env,
>         return state->stack[spi].spilled_ptr.dynptr.type;
>  }
>

[...]
