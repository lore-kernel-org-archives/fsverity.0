Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7E9D23778
	for <fsverity@lists.linux.dev>; Fri,  3 Nov 2023 22:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cHNcRp1D"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-9adb9fa7200so507812766b.0
        for <fsverity@lists.linux.dev>; Fri, 03 Nov 2023 15:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699049423; x=1699654223; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=48eapHSqB9XT8NL/KrM14oWKGu50UEgduwEpKQtsqT8=;
        b=cHNcRp1D1eCQgNlNzmB3ru+xrzDiHg4P0nuc+axF2iSEHyH7QmqmPZiD/tC+jVYHM8
         eZcHPk/nWnue2urrXQZ+u78/iSJmVtcShkS4juHzShWE1ffiTyUvodbfieEaz31Ao7/D
         VXlxdus+5GDROEojewARj8Dl6vo7SuRyFdRBsAfUpM+q3Eyw2I02F7AbGOpfYzPwGsU4
         sCvCekXSUx58A8yd3Y2O6iyqtAJs/AUnQtUrZUVP4ys/5e6erR43bZe35k6wvrekcJ9p
         eZeVYZGKe/zBwkc4sw/4A018yB8kZqEhRr1n9wGlicXtSgTKdadutHHrigfYfeD+xCXH
         zxkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699049423; x=1699654223;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=48eapHSqB9XT8NL/KrM14oWKGu50UEgduwEpKQtsqT8=;
        b=aFEGELIdnbt6PJ6cueu7shqH1pFMER5AfcOgEyrN6x6KW5OkalAnfagHwdFV8T6TJg
         QMVVc8CiE4zpcuCF97hNBw8estdbAaSRA0OY4blAKhTETMvSLVqdRQogxNS34/rifsfn
         E3EkgMcLASKRWNhfZzKutYtC2FK9/MBfbKY99yZYU+YEADnI+xJ09dSTIwRhrzx20B7/
         D95QWFp0EQPQvz/o9scOfJOpYXPAUXQZydxYY4fgmSOEbUdtxxyEnSGGO5oHlrFpAPZI
         ZYHSLnHKbQipVIHTT2xtv4p0//9a5+8w1Z3WYdrGmVJJu1e1Gj5R8tuRsKxeQc2yTfCG
         YgnA==
X-Gm-Message-State: AOJu0YxNmKuMttfuilYSbsK3vBWdfJhB08gshZoHmDZGgxrMb88l/1hY
	YOuG+/XeXMgrmWDUXREQc+WOK4S8VjGeROdgtFQ=
X-Google-Smtp-Source: AGHT+IFqeA5asuXAa8GEZgAmj23Dr/EkPdEF8Uw4igJcN/p2nkWaBVtK/aY1zJNG4MN+4LxIVna/jGHIIms4+QCCy24=
X-Received: by 2002:a17:907:3e14:b0:9dd:e124:4b39 with SMTP id
 hp20-20020a1709073e1400b009dde1244b39mr734692ejc.10.1699049422615; Fri, 03
 Nov 2023 15:10:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231103214535.2674059-1-song@kernel.org> <20231103214535.2674059-5-song@kernel.org>
In-Reply-To: <20231103214535.2674059-5-song@kernel.org>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Fri, 3 Nov 2023 15:10:11 -0700
Message-ID: <CAEf4BzY2V1Q_V=JMV4uYqHCSnV0ZDsAaLNq6cm0CPt2d8E4XGA@mail.gmail.com>
Subject: Re: [PATCH v10 bpf-next 4/9] bpf: Add kfunc bpf_get_file_xattr
To: Song Liu <song@kernel.org>
Cc: bpf@vger.kernel.org, fsverity@lists.linux.dev, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, martin.lau@kernel.org, 
	kernel-team@meta.com, ebiggers@kernel.org, tytso@mit.edu, 
	roberto.sassu@huaweicloud.com, kpsingh@kernel.org, vadfed@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 3, 2023 at 2:46=E2=80=AFPM Song Liu <song@kernel.org> wrote:
>
> It is common practice for security solutions to store tags/labels in
> xattrs. To implement similar functionalities in BPF LSM, add new kfunc
> bpf_get_file_xattr().
>
> The first use case of bpf_get_file_xattr() is to implement file
> verifications with asymmetric keys. Specificially, security applications
> could use fsverity for file hashes and use xattr to store file signatures=
.
> (kfunc for fsverity hash will be added in a separate commit.)
>
> Currently, only xattrs with "user." prefix can be read with kfunc
> bpf_get_file_xattr(). As use cases evolve, we may add a dedicated prefix
> for bpf_get_file_xattr().
>
> To avoid recursion, bpf_get_file_xattr can be only called from LSM hooks.
>
> Signed-off-by: Song Liu <song@kernel.org>
> ---
>  kernel/trace/bpf_trace.c | 64 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 64 insertions(+)
>
> diff --git a/kernel/trace/bpf_trace.c b/kernel/trace/bpf_trace.c
> index bfe6fb83e8d0..82eaa099053b 100644
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
> @@ -1431,6 +1432,69 @@ static int __init bpf_key_sig_kfuncs_init(void)
>  late_initcall(bpf_key_sig_kfuncs_init);
>  #endif /* CONFIG_KEYS */
>
> +/* filesystem kfuncs */
> +__diag_push();
> +__diag_ignore_all("-Wmissing-prototypes",
> +                 "kfuncs which will be used in BPF programs");
> +

please use __bpf_kfunc_{start,end}_defs macros, from [0]

  [0] https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf.git/commit/?i=
d=3D391145ba2acc

> +/**
> + * bpf_get_file_xattr - get xattr of a file
> + * @file: file to get xattr from
> + * @name__str: name of the xattr
> + * @value_ptr: output buffer of the xattr value
> + *
> + * Get xattr *name__str* of *file* and store the output in *value_ptr*.
> + *
> + * For security reasons, only *name__str* with prefix "user." is allowed=
.
> + *
> + * Return: 0 on success, a negative value on error.
> + */
> +__bpf_kfunc int bpf_get_file_xattr(struct file *file, const char *name__=
str,
> +                                  struct bpf_dynptr_kern *value_ptr)
> +{
> +       struct dentry *dentry;
> +       void *value;
> +
> +       if (strncmp(name__str, XATTR_USER_PREFIX, XATTR_USER_PREFIX_LEN))
> +               return -EPERM;
> +
> +       value =3D __bpf_dynptr_data_rw(value_ptr, __bpf_dynptr_size(value=
_ptr));
> +       if (!value)
> +               return -EINVAL;
> +
> +       dentry =3D file_dentry(file);
> +       return __vfs_getxattr(dentry, dentry->d_inode, name__str,
> +                             value, __bpf_dynptr_size(value_ptr));

nit: probably cleaner to get size once into local variable and use
that throughout

> +}
> +
> +__diag_pop();
> +
> +BTF_SET8_START(fs_kfunc_set_ids)
> +BTF_ID_FLAGS(func, bpf_get_file_xattr, KF_SLEEPABLE | KF_TRUSTED_ARGS)
> +BTF_SET8_END(fs_kfunc_set_ids)
> +
> +static int bpf_get_file_xattr_filter(const struct bpf_prog *prog, u32 kf=
unc_id)
> +{
> +       if (!btf_id_set8_contains(&fs_kfunc_set_ids, kfunc_id))
> +               return 0;
> +
> +       /* Only allow to attach from LSM hooks, to avoid recursion */
> +       return prog->type !=3D BPF_PROG_TYPE_LSM ? -EACCES : 0;
> +}
> +
> +const struct btf_kfunc_id_set bpf_fs_kfunc_set =3D {
> +       .owner =3D THIS_MODULE,
> +       .set =3D &fs_kfunc_set_ids,
> +       .filter =3D bpf_get_file_xattr_filter,
> +};
> +
> +static int __init bpf_fs_kfuncs_init(void)
> +{
> +       return register_btf_kfunc_id_set(BPF_PROG_TYPE_LSM, &bpf_fs_kfunc=
_set);
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
