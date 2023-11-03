Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC2DB24200
	for <fsverity@lists.linux.dev>; Fri,  3 Nov 2023 22:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HB3yHW9T"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-9d0b4dfd60dso386316466b.1
        for <fsverity@lists.linux.dev>; Fri, 03 Nov 2023 15:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699049242; x=1699654042; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mAOEeYu9Y5b58jCwpGeHFSWpd6B5Ki35hB3NAClanDs=;
        b=HB3yHW9TDH6eNvAdtqGvSeyokxmaorBlMxjXJXX9lLcLV6eeaNhJnchPZJm5h+pOGW
         2iIeOqKOzlHUzDwCxkWAzu69GNOIXmlcgSjSMksJ14ormY3ZfoFJE9lAL/dG6LHP093r
         0MqABfgldiU00SGJx8lcVQ8Z06LebY/DG5ycjw7G1sw6MEeYFRrpsl5SUmiita9eCEBF
         wKypvQYKbP9ka8P2JJbOl1G6UWT7icYb/YLkGegjH0W8xcvQY1IWPdNhs6YXsaW3rptV
         MKnDzcL8yk8jCj1phSfhQl9iy8uHjtbyDBpKRSSwevWl+0YHCc4Rah82EwDjattE05Br
         8zqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699049242; x=1699654042;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mAOEeYu9Y5b58jCwpGeHFSWpd6B5Ki35hB3NAClanDs=;
        b=SXnOa783w0kCxKl1BhrwL+r35pjINo3w55iqB/wq+0WfuH/TJId6oPEOd6VKHzb4NF
         L3qFtDctDZ+T0Er8WlvahNG9xNjARXrMivq7+LpGFF3/3deMtqRf+v/PjCm51Wqxe1K3
         /uTtKlvzHKTgx2mt4P9kmT52bvRGp3U51llboDv4rvCwuOEWKJDYd4SlUqCFSEGWLXMB
         SjBvycRL/4e2xlLNSGL4FYC3n+H9C/npqEDP6jo0Pttvln3895fpeq8IkQ71xaN5L3hL
         rhtsUizLrhYdLsR5PtimpgPyyQsCno4zmmIiKRMs/C07zm1Kud/3GYZmBnJ3YWRLS6KV
         OJ7A==
X-Gm-Message-State: AOJu0YysTCvDG5q1RgdTnjJ6eIlCGiKbw2lWrdS1hJ7JeZ0OooP/rjxo
	Xu49j5n45VfOjAzByBu2W+4ksSxPxgVSujXOOoM=
X-Google-Smtp-Source: AGHT+IEEqBakZImmRNxFwt5EuhT7UQQz7k7ryZ78AvzBVKojbm/oN3zGreLMEdbDQuxm3fbja3hrIQ8zyZtlPv1qg1o=
X-Received: by 2002:a17:907:2d2b:b0:9b2:a7db:9662 with SMTP id
 gs43-20020a1709072d2b00b009b2a7db9662mr9245859ejc.12.1699049242163; Fri, 03
 Nov 2023 15:07:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231103214535.2674059-1-song@kernel.org> <20231103214535.2674059-4-song@kernel.org>
In-Reply-To: <20231103214535.2674059-4-song@kernel.org>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Fri, 3 Nov 2023 15:07:11 -0700
Message-ID: <CAEf4Bza2WO4y75ffU0F9XOYXebjfZ=Zp=K0VUZc0UAirPPmdBw@mail.gmail.com>
Subject: Re: [PATCH v10 bpf-next 3/9] bpf: Introduce KF_ARG_PTR_TO_CONST_STR
To: Song Liu <song@kernel.org>
Cc: bpf@vger.kernel.org, fsverity@lists.linux.dev, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, martin.lau@kernel.org, 
	kernel-team@meta.com, ebiggers@kernel.org, tytso@mit.edu, 
	roberto.sassu@huaweicloud.com, kpsingh@kernel.org, vadfed@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 3, 2023 at 2:46=E2=80=AFPM Song Liu <song@kernel.org> wrote:
>
> Similar to ARG_PTR_TO_CONST_STR for BPF helpers, KF_ARG_PTR_TO_CONST_STR
> specifies kfunc args that point to const strings. Annotation "__str" is
> used to specify kfunc arg of type KF_ARG_PTR_TO_CONST_STR. Also, add
> documentation for the "__str" annotation.
>
> bpf_get_file_xattr() will be the first kfunc that uses this type.
>
> Signed-off-by: Song Liu <song@kernel.org>
> ---
>  Documentation/bpf/kfuncs.rst | 24 ++++++++++++++++++++++++
>  kernel/bpf/verifier.c        | 19 +++++++++++++++++++
>  2 files changed, 43 insertions(+)
>

Acked-by: Andrii Nakryiko <andrii@kernel.org>

> diff --git a/Documentation/bpf/kfuncs.rst b/Documentation/bpf/kfuncs.rst
> index 0d2647fb358d..bfe065f7e23c 100644
> --- a/Documentation/bpf/kfuncs.rst
> +++ b/Documentation/bpf/kfuncs.rst
> @@ -137,6 +137,30 @@ Either way, the returned buffer is either NULL, or o=
f size buffer_szk. Without t
>  annotation, the verifier will reject the program if a null pointer is pa=
ssed in with
>  a nonzero size.
>
> +2.2.5 __str Annotation
> +----------------------------
> +This annotation is used to indicate that the argument is a constant stri=
ng.
> +
> +An example is given below::
> +
> +        __bpf_kfunc bpf_get_file_xattr(..., const char *name__str, ...)
> +        {
> +        ...
> +        }
> +
> +In this case, ``bpf_get_file_xattr()`` can be called as::
> +
> +        bpf_get_file_xattr(..., "xattr_name", ...);
> +
> +Or::
> +
> +        const char name[] =3D "xattr_name";  /* This need to be global *=
/
> +        int BPF_PROG(...)
> +        {
> +                ...
> +                bpf_get_file_xattr(..., name, ...);
> +                ...
> +        }
>
>  .. _BPF_kfunc_nodef:
>
> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> index fefe3eafccb9..6d382f20674d 100644
> --- a/kernel/bpf/verifier.c
> +++ b/kernel/bpf/verifier.c
> @@ -10803,6 +10803,11 @@ static bool is_kfunc_arg_nullable(const struct b=
tf *btf, const struct btf_param
>         return __kfunc_param_match_suffix(btf, arg, "__nullable");
>  }
>
> +static bool is_kfunc_arg_const_str(const struct btf *btf, const struct b=
tf_param *arg)
> +{
> +       return __kfunc_param_match_suffix(btf, arg, "__str");
> +}
> +
>  static bool is_kfunc_arg_scalar_with_name(const struct btf *btf,
>                                           const struct btf_param *arg,
>                                           const char *name)
> @@ -10946,6 +10951,7 @@ enum kfunc_ptr_arg_type {
>         KF_ARG_PTR_TO_RB_ROOT,
>         KF_ARG_PTR_TO_RB_NODE,
>         KF_ARG_PTR_TO_NULL,
> +       KF_ARG_PTR_TO_CONST_STR,
>  };
>
>  enum special_kfunc_type {
> @@ -11090,6 +11096,9 @@ get_kfunc_ptr_arg_type(struct bpf_verifier_env *e=
nv,
>         if (is_kfunc_arg_rbtree_node(meta->btf, &args[argno]))
>                 return KF_ARG_PTR_TO_RB_NODE;
>
> +       if (is_kfunc_arg_const_str(meta->btf, &args[argno]))
> +               return KF_ARG_PTR_TO_CONST_STR;
> +
>         if ((base_type(reg->type) =3D=3D PTR_TO_BTF_ID || reg2btf_ids[bas=
e_type(reg->type)])) {
>                 if (!btf_type_is_struct(ref_t)) {
>                         verbose(env, "kernel function %s args#%d pointer =
type %s %s is not supported\n",
> @@ -11713,6 +11722,7 @@ static int check_kfunc_args(struct bpf_verifier_e=
nv *env, struct bpf_kfunc_call_
>                 case KF_ARG_PTR_TO_MEM_SIZE:
>                 case KF_ARG_PTR_TO_CALLBACK:
>                 case KF_ARG_PTR_TO_REFCOUNTED_KPTR:
> +               case KF_ARG_PTR_TO_CONST_STR:
>                         /* Trusted by default */
>                         break;
>                 default:
> @@ -11984,6 +11994,15 @@ static int check_kfunc_args(struct bpf_verifier_=
env *env, struct bpf_kfunc_call_
>                         meta->arg_btf =3D reg->btf;
>                         meta->arg_btf_id =3D reg->btf_id;
>                         break;
> +               case KF_ARG_PTR_TO_CONST_STR:
> +                       if (reg->type !=3D PTR_TO_MAP_VALUE) {
> +                               verbose(env, "arg#%d doesn't point to a c=
onst string\n", i);
> +                               return -EINVAL;
> +                       }
> +                       ret =3D check_reg_const_str(env, reg, regno);
> +                       if (ret)
> +                               return ret;
> +                       break;
>                 }
>         }
>
> --
> 2.34.1
>
