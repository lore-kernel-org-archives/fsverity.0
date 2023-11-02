Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B29D9187A
	for <fsverity@lists.linux.dev>; Thu,  2 Nov 2023 05:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SHUZg2Gw"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-40850b244beso4222755e9.2
        for <fsverity@lists.linux.dev>; Wed, 01 Nov 2023 22:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698904742; x=1699509542; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vXX2qenhOsv3lSe1EamJq3W8kEVyRo3eOOz+lcy0UEQ=;
        b=SHUZg2GwdlRaLWxewAV5LuIsFMGuORxMHCQdlL8v5X+8Av1jfKk6n0yMHQfYMPsk/X
         Pkd9VFzPup9MLg1jsii9y1lBpgs6ktkk97fEZvIPQ/4GiDhy0kCnKdgptcLYuXzYvCEN
         RrTR6lVqbmBg9tbTI4tl2/tL95qKcofmVAYKkDtMghDyBStRtQFmOeapblpNjbEzPyBl
         wpJnlgp24FseWBaY23L0bLVzzHXgwhL999nx94VFTH6V/751B/l6yOX4qA+Xr+IJdiTA
         f0jHfWR5t6f8aTSvRYny/8gvrnnlfye/mt/udTMdGqICD7cetY/VjIYJUcQ/IqDzPOzK
         pGcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698904742; x=1699509542;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vXX2qenhOsv3lSe1EamJq3W8kEVyRo3eOOz+lcy0UEQ=;
        b=G0G8UHyP20Na1rmt9P3weSQOBLP+c8YGerh6QJ2Ogfrk8v2sOPU3LbxALlkNomjKlp
         JLx+GsoZeGPR8P6VGyNRSGbEhX8rSn6KgCit7EbuvTamqyaO0MwwQlrGfGNefSejpfJI
         stGSysvp1NOuCgfhhuFJGxVaswVXuPJp8dg7PhUR3hB24Qpg/OCSZt6dSYqBAjeOjFsa
         y8ONM1RxXr3YCp6Ph1Ih9drQWORMUsvMG1ykkPP3xnjmD4Mbt86ict6sRsqCIldXu8cA
         9ybhipNeGzGT+bi1uCRsWpc9srW+c7mGv3eHxhtWPvcthR1E9lJStD1Csw44PRHnlv05
         yHRw==
X-Gm-Message-State: AOJu0YwpeeAc4BQeQzxcRZJh5N6GhxgUloUzwwno675Mx482ZjsCtVx1
	yCs5smgCCFZpewxWsGq7aIsRzT0kjRheIqZN1FA=
X-Google-Smtp-Source: AGHT+IFXJoQUVrP10UvEpxyjpq1KrF/R5gyGwk15+ii5TiHgxAl2HxSDGWtsNU7faoVWvZJxsyXyHQROeMGwKT48yYM=
X-Received: by 2002:a05:600c:1d18:b0:408:4475:8cc1 with SMTP id
 l24-20020a05600c1d1800b0040844758cc1mr15920925wms.35.1698904741521; Wed, 01
 Nov 2023 22:59:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231024235551.2769174-1-song@kernel.org> <20231024235551.2769174-4-song@kernel.org>
In-Reply-To: <20231024235551.2769174-4-song@kernel.org>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Wed, 1 Nov 2023 22:58:49 -0700
Message-ID: <CAADnVQ+rqwPARuwkuRJLJSYN45m7vC1sLkiVX=BQbP0ho+3DJQ@mail.gmail.com>
Subject: Re: [PATCH v6 bpf-next 3/9] bpf: Introduce KF_ARG_PTR_TO_CONST_STR
To: Song Liu <song@kernel.org>
Cc: bpf <bpf@vger.kernel.org>, fsverity@lists.linux.dev, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@kernel.org>, 
	Kernel Team <kernel-team@meta.com>, Eric Biggers <ebiggers@kernel.org>, 
	"Theodore Ts'o" <tytso@mit.edu>, Roberto Sassu <roberto.sassu@huaweicloud.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 24, 2023 at 4:56=E2=80=AFPM Song Liu <song@kernel.org> wrote:
>
>
> +2.2.5 __const_str Annotation
> +----------------------------
> +This annotation is used to indicate that the argument is a constant stri=
ng.
> +
> +An example is given below::
> +
> +        __bpf_kfunc bpf_get_file_xattr(..., const char *name__const_str,=
 ...)

After sleeping on it this still looks too verbose to me.
'const' is repeated back to back.
Let's use __str suffix?

> +                       ret =3D check_reg_const_str(env, reg, regno);

I don't mind that helper has a more verbose name.
