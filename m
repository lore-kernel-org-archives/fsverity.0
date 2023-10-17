Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C5849CA47
	for <fsverity@lists.linux.dev>; Tue, 17 Oct 2023 18:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SQxPtYOr"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5079eed8bfbso5569856e87.1
        for <fsverity@lists.linux.dev>; Tue, 17 Oct 2023 11:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697569123; x=1698173923; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YcSCete3RhbZYHvD2wFvMNaSSxKHdQNRC4K1hU+Bvpw=;
        b=SQxPtYOrVSGvSAwVKpcxAeCtGVtEj++10QceYy6JUm8CDypgK7IG0WgTcQy9YbRhqo
         Ynp75C2CnztsQ48pYaAzaQl1lEPyIis6YHBxmGQirZfLkrc1ZJq8EeJmZ8O6glGyvlcx
         fVCeQifUomcbMZ+UHpckBvyDM+henTSJWcmE/N6FFA2HXvLbAXDmZR9Z1SzxdoV497Xn
         hy4aaBhkMIJKryZU9VqomxXA7FbXR3/SJNNlPzidet7W0cRh5uRpaHeiY3fCmXBZYvA5
         kyrQE8EJxOjk+xq2opdWjnfQmt4QP5VPMxB73pA3J7eA/3OtZx8b9GBgEHB2Q/H6UFWu
         gnrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697569123; x=1698173923;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YcSCete3RhbZYHvD2wFvMNaSSxKHdQNRC4K1hU+Bvpw=;
        b=XBQ+gWqLgw5ZePZD3/uC/yaLg2hXBbRAKRILRbhp90i6PkvaBkdCn+Xg9g9/2tYSnC
         rEKwa665XhVG59D+/98SdNKbLbB1eSLOLta9mx16XueGg4kGdlUvazJV4VGZWCgcyX4M
         7PMJtg/BlCY+VYpg9pvZA0IBSFL+kzJwnpTOQtvu6B8130MeB4DOEsrecmMmmds1tD+y
         DvAEyseDsAq54W2HeIfVQOB15EcsL+DmpSITgZpFdWD2rk9UK8si58Xlh4a31vKcyxGH
         aUKV5bCIb4dE9FTDsTQvFYUEXbBv+iTlUfSr3fCoZIzjcyP2e/FJJqToaOlihyCN13yB
         XYvA==
X-Gm-Message-State: AOJu0YxCcWgrszsStyakfMg6Sa/r/vSE8htq3l4y0wntxQtHAB17H4/s
	1XaV+odFXVyNSOAtCspGNiGEGd9RjdAQRzVhc4xdGX62
X-Google-Smtp-Source: AGHT+IEDkcsQ/iUsfpI1fK31VO/CRI+hnBngDdQ9zQYTdmLRo73mcBmeP9k3EdydsDmNOr0NINHSCPN1/k1czkG0Jv4=
X-Received: by 2002:a19:7506:0:b0:503:3680:6726 with SMTP id
 y6-20020a197506000000b0050336806726mr2260835lfe.6.1697569122925; Tue, 17 Oct
 2023 11:58:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231013182644.2346458-1-song@kernel.org> <20231013182644.2346458-2-song@kernel.org>
In-Reply-To: <20231013182644.2346458-2-song@kernel.org>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Tue, 17 Oct 2023 11:58:31 -0700
Message-ID: <CAEf4BzYbQzMU4T6KYt4UudXvZiPg4nQdQCxD9zqzoJLgqOE9bQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next 1/5] bpf: Add kfunc bpf_get_file_xattr
To: Song Liu <song@kernel.org>
Cc: bpf@vger.kernel.org, fsverity@lists.linux.dev, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, martin.lau@kernel.org, 
	kernel-team@meta.com, ebiggers@kernel.org, tytso@mit.edu, 
	roberto.sassu@huaweicloud.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 13, 2023 at 11:29=E2=80=AFAM Song Liu <song@kernel.org> wrote:
>
> This kfunc can be used to read xattr of a file.
>
> Since vfs_getxattr() requires null-terminated string as input "name", a n=
ew
> helper bpf_dynptr_is_string() is added to check the input before calling
> vfs_getxattr().
>
> Signed-off-by: Song Liu <song@kernel.org>
> ---
>  include/linux/bpf.h      | 12 +++++++++++
>  kernel/trace/bpf_trace.c | 44 ++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 56 insertions(+)
>
> diff --git a/include/linux/bpf.h b/include/linux/bpf.h
> index 61bde4520f5c..f14fae45e13d 100644
> --- a/include/linux/bpf.h
> +++ b/include/linux/bpf.h
> @@ -2472,6 +2472,13 @@ static inline bool has_current_bpf_ctx(void)
>         return !!current->bpf_ctx;
>  }
>
> +static inline bool bpf_dynptr_is_string(struct bpf_dynptr_kern *ptr)

is_zero_terminated would be more accurate? though there is nothing
really dynptr-specific here...

> +{
> +       char *str =3D ptr->data;
> +
> +       return str[__bpf_dynptr_size(ptr) - 1] =3D=3D '\0';
> +}
> +
>  void notrace bpf_prog_inc_misses_counter(struct bpf_prog *prog);
>
>  void bpf_dynptr_init(struct bpf_dynptr_kern *ptr, void *data,
> @@ -2708,6 +2715,11 @@ static inline bool has_current_bpf_ctx(void)
>         return false;
>  }
>
> +static inline bool bpf_dynptr_is_string(struct bpf_dynptr_kern *ptr)
> +{
> +       return false;
> +}
> +
>  static inline void bpf_prog_inc_misses_counter(struct bpf_prog *prog)
>  {
>  }
> diff --git a/kernel/trace/bpf_trace.c b/kernel/trace/bpf_trace.c
> index df697c74d519..946268574e05 100644
> --- a/kernel/trace/bpf_trace.c
> +++ b/kernel/trace/bpf_trace.c
> @@ -24,6 +24,7 @@
>  #include <linux/key.h>
>  #include <linux/verification.h>
>  #include <linux/namei.h>
> +#include <linux/fileattr.h>
>
>  #include <net/bpf_sk_storage.h>
>
> @@ -1429,6 +1430,49 @@ static int __init bpf_key_sig_kfuncs_init(void)
>  late_initcall(bpf_key_sig_kfuncs_init);
>  #endif /* CONFIG_KEYS */
>
> +/* filesystem kfuncs */
> +__diag_push();
> +__diag_ignore_all("-Wmissing-prototypes",
> +                 "kfuncs which will be used in BPF programs");
> +
> +/**
> + * bpf_get_file_xattr - get xattr of a file
> + * @name_ptr: name of the xattr
> + * @value_ptr: output buffer of the xattr value
> + *
> + * Get xattr *name_ptr* of *file* and store the output in *value_ptr*.
> + *
> + * Return: 0 on success, a negative value on error.
> + */
> +__bpf_kfunc int bpf_get_file_xattr(struct file *file, struct bpf_dynptr_=
kern *name_ptr,
> +                                  struct bpf_dynptr_kern *value_ptr)
> +{
> +       if (!bpf_dynptr_is_string(name_ptr))
> +               return -EINVAL;

so dynptr can be invalid and name_ptr->data will be NULL, you should
account for that

and there could also be special dynptrs that don't have contiguous
memory region, so somehow you'd need to take care of that as well

> +
> +       return vfs_getxattr(mnt_idmap(file->f_path.mnt), file_dentry(file=
), name_ptr->data,
> +                           value_ptr->data, __bpf_dynptr_size(value_ptr)=
);
> +}
> +
> +__diag_pop();
> +
> +BTF_SET8_START(fs_kfunc_set)
> +BTF_ID_FLAGS(func, bpf_get_file_xattr, KF_SLEEPABLE)
> +BTF_SET8_END(fs_kfunc_set)
> +
> +const struct btf_kfunc_id_set bpf_fs_kfunc_set =3D {
> +       .owner =3D THIS_MODULE,
> +       .set =3D &fs_kfunc_set,
> +};
> +
> +static int __init bpf_fs_kfuncs_init(void)
> +{
> +       return register_btf_kfunc_id_set(BPF_PROG_TYPE_TRACING,
> +                                        &bpf_fs_kfunc_set);
> +}
> +
> +late_initcall(bpf_fs_kfuncs_init);
> +
>  static const struct bpf_func_proto *
>  bpf_tracing_func_proto(enum bpf_func_id func_id, const struct bpf_prog *=
prog)
>  {
> --
> 2.34.1
>
