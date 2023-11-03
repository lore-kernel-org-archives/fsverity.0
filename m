Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB5324201
	for <fsverity@lists.linux.dev>; Fri,  3 Nov 2023 22:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uk34P9Zp"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-9d10f94f70bso373698466b.3
        for <fsverity@lists.linux.dev>; Fri, 03 Nov 2023 15:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699049594; x=1699654394; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0smAkhzWi7LQB4O+bnHLFjKF0X/wdZ2cGiNse1b9Nr8=;
        b=Uk34P9ZpTZKt37bParOPBwuSFVlfe+DhpzF3X7vRLLRfkE190w7VccPwIaTWvjktT9
         KPrfHAQs+jfK0EzZtx514amDef9ggvLqxrCc7Zh9CoCG9QNY5jzsVAmrArnUcFVMLzEh
         OGGrRBrTPm8OlTgtG1R9EciXmzBPzOEE0THxKjDJ1h0E1/2dwjnJmmXpnE6NCNb4MlVl
         2Vh31M1b6TE+dY2AIew3FaSNJvhT96+9qWB4uz0zQ7VOLavNr5fuRNC7Z4hK/1IKHCj4
         ekDzIdiNUZWsy64T9BTMOVDa6tx5y5EhuFeGN39H4e0SjcFqIy2A1QQHrpirTQ8yf7s5
         bUlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699049594; x=1699654394;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0smAkhzWi7LQB4O+bnHLFjKF0X/wdZ2cGiNse1b9Nr8=;
        b=ZpFj2cNq0n42lUuh7Ebo/Lb8snCj2BNfAsUxfGkyK5Fvzl1DC/xdrbPCKvLkvSkWNs
         xmi8KyJHh3zBYB4CRy/gTh8q3zbuh0d5dt3JqHOly8ld8C2obD6gh5j8k8sLDnqdxj7y
         DbpY/Z9epZFDWiMGHJiZj9vhCEdcdP7CXxss1q7D5BU9VLKtuvC8QgeG2vl8vtdJovwY
         rROyS+EaQ9XAkV21hNGquOkuKsb0LeEChYXXRU7K02F4dAPSgITNgRTRfqy//3yQBntU
         mnGvcwfftJgQcSumMnvSDZqo7aXG1U8ld783Xtb7LdGomQl9coUAWzMMUCVPQPMg1ueV
         RNGg==
X-Gm-Message-State: AOJu0Yz0H8AMJF9skSndWu0vkLYOYyMOCIgeH7iK3GdctaRy/VzToTZl
	Rz9ma+z5KjgnkK64zQjXkIbxtGLo+8Z/QEOQvjY=
X-Google-Smtp-Source: AGHT+IGxcj9zlsTnn23D7rMoNKSCm46NGjxZY9GtKO3L7ajg44Ok3mmi9fe1bXtWaT4kXlcpGz/Ziu3kTiWu58o0yjk=
X-Received: by 2002:a17:907:3685:b0:9bd:a7a5:3a5a with SMTP id
 bi5-20020a170907368500b009bda7a53a5amr8464669ejc.36.1699049593900; Fri, 03
 Nov 2023 15:13:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231103214535.2674059-1-song@kernel.org> <20231103214535.2674059-6-song@kernel.org>
In-Reply-To: <20231103214535.2674059-6-song@kernel.org>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Fri, 3 Nov 2023 15:13:02 -0700
Message-ID: <CAEf4BzbRrVcHxEdR89UMv6aPpF+478WCpCMx7RFknNMexpUGpw@mail.gmail.com>
Subject: Re: [PATCH v10 bpf-next 5/9] bpf, fsverity: Add kfunc bpf_get_fsverity_digest
To: Song Liu <song@kernel.org>
Cc: bpf@vger.kernel.org, fsverity@lists.linux.dev, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, martin.lau@kernel.org, 
	kernel-team@meta.com, ebiggers@kernel.org, tytso@mit.edu, 
	roberto.sassu@huaweicloud.com, kpsingh@kernel.org, vadfed@meta.com, 
	Eric Biggers <ebiggers@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 3, 2023 at 2:46=E2=80=AFPM Song Liu <song@kernel.org> wrote:
>
> fsverity provides fast and reliable hash of files, namely fsverity_digest=
.
> The digest can be used by security solutions to verify file contents.
>
> Add new kfunc bpf_get_fsverity_digest() so that we can access fsverity fr=
om
> BPF LSM programs. This kfunc is added to fs/verity/measure.c because some
> data structure used in the function is private to fsverity
> (fs/verity/fsverity_private.h).
>
> To avoid recursion, bpf_get_fsverity_digest is only allowed in BPF LSM
> programs.
>
> Signed-off-by: Song Liu <song@kernel.org>
> Acked-by: Eric Biggers <ebiggers@google.com>
> ---
>  fs/verity/fsverity_private.h | 10 +++++
>  fs/verity/init.c             |  1 +
>  fs/verity/measure.c          | 85 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 96 insertions(+)
>
> diff --git a/fs/verity/fsverity_private.h b/fs/verity/fsverity_private.h
> index d071a6e32581..a6a6b2749241 100644
> --- a/fs/verity/fsverity_private.h
> +++ b/fs/verity/fsverity_private.h
> @@ -100,6 +100,16 @@ fsverity_msg(const struct inode *inode, const char *=
level,
>  #define fsverity_err(inode, fmt, ...)          \
>         fsverity_msg((inode), KERN_ERR, fmt, ##__VA_ARGS__)
>
> +/* measure.c */
> +
> +#ifdef CONFIG_BPF_SYSCALL
> +void __init fsverity_init_bpf(void);
> +#else
> +static inline void fsverity_init_bpf(void)
> +{
> +}
> +#endif
> +
>  /* open.c */
>
>  int fsverity_init_merkle_tree_params(struct merkle_tree_params *params,
> diff --git a/fs/verity/init.c b/fs/verity/init.c
> index a29f062f6047..1e207c0f71de 100644
> --- a/fs/verity/init.c
> +++ b/fs/verity/init.c
> @@ -69,6 +69,7 @@ static int __init fsverity_init(void)
>         fsverity_init_workqueue();
>         fsverity_init_sysctl();
>         fsverity_init_signature();
> +       fsverity_init_bpf();
>         return 0;
>  }
>  late_initcall(fsverity_init)
> diff --git a/fs/verity/measure.c b/fs/verity/measure.c
> index eec5956141da..a08177eda96e 100644
> --- a/fs/verity/measure.c
> +++ b/fs/verity/measure.c
> @@ -7,6 +7,8 @@
>
>  #include "fsverity_private.h"
>
> +#include <linux/bpf.h>
> +#include <linux/btf.h>
>  #include <linux/uaccess.h>
>
>  /**
> @@ -100,3 +102,86 @@ int fsverity_get_digest(struct inode *inode,
>         return hash_alg->digest_size;
>  }
>  EXPORT_SYMBOL_GPL(fsverity_get_digest);
> +
> +#ifdef CONFIG_BPF_SYSCALL
> +
> +/* bpf kfuncs */
> +__diag_push();
> +__diag_ignore_all("-Wmissing-prototypes",
> +                 "kfuncs which will be used in BPF programs");
> +

same as in previous patch, we have dedicated macros for this, please use th=
em


> +/**
> + * bpf_get_fsverity_digest: read fsverity digest of file
> + * @file: file to get digest from
> + * @digest_ptr: (out) dynptr for struct fsverity_digest
> + *
> + * Read fsverity_digest of *file* into *digest_ptr*.
> + *
> + * Return: 0 on success, a negative value on error.
> + */
> +__bpf_kfunc int bpf_get_fsverity_digest(struct file *file, struct bpf_dy=
nptr_kern *digest_ptr)
> +{
> +       const struct inode *inode =3D file_inode(file);
> +       struct fsverity_digest *arg;
> +       const struct fsverity_info *vi;
> +       const struct fsverity_hash_alg *hash_alg;
> +       int out_digest_sz;
> +
> +       arg =3D __bpf_dynptr_data_rw(digest_ptr, __bpf_dynptr_size(digest=
_ptr));
> +       if (!arg)
> +               return -EINVAL;
> +
> +       if (!IS_ALIGNED((uintptr_t)arg, __alignof__(*arg)))
> +               return -EINVAL;
> +
> +       if (__bpf_dynptr_size(digest_ptr) < sizeof(struct fsverity_digest=
))
> +               return -EINVAL;
> +

similar nit, you call __bpf_dynptr_size(digest_ptr) many times, let's
use `u32 len =3D __bpf_dynptr_size(digest_ptr);` ?

> +       vi =3D fsverity_get_info(inode);
> +       if (!vi)
> +               return -ENODATA; /* not a verity file */
> +
> +       hash_alg =3D vi->tree_params.hash_alg;
> +
> +       arg->digest_algorithm =3D hash_alg - fsverity_hash_algs;
> +       arg->digest_size =3D hash_alg->digest_size;
> +
> +       out_digest_sz =3D __bpf_dynptr_size(digest_ptr) - sizeof(struct f=
sverity_digest);
> +
> +       /* copy digest */
> +       memcpy(arg->digest, vi->file_digest,  min_t(int, hash_alg->digest=
_size, out_digest_sz));
> +
> +       /* fill the extra buffer with zeros */
> +       if (out_digest_sz > hash_alg->digest_size)
> +               memset(arg->digest + arg->digest_size, 0, out_digest_sz -=
 hash_alg->digest_size);
> +
> +       return 0;
> +}
> +
> +__diag_pop();
> +
> +BTF_SET8_START(fsverity_set_ids)
> +BTF_ID_FLAGS(func, bpf_get_fsverity_digest, KF_TRUSTED_ARGS)
> +BTF_SET8_END(fsverity_set_ids)
> +
> +static int bpf_get_fsverity_digest_filter(const struct bpf_prog *prog, u=
32 kfunc_id)
> +{
> +       if (!btf_id_set8_contains(&fsverity_set_ids, kfunc_id))
> +               return 0;
> +
> +       /* Only allow to attach from LSM hooks, to avoid recursion */
> +       return prog->type !=3D BPF_PROG_TYPE_LSM ? -EACCES : 0;
> +}
> +
> +static const struct btf_kfunc_id_set bpf_fsverity_set =3D {
> +       .owner =3D THIS_MODULE,
> +       .set =3D &fsverity_set_ids,
> +       .filter =3D bpf_get_fsverity_digest_filter,
> +};
> +
> +void __init fsverity_init_bpf(void)
> +{
> +       register_btf_kfunc_id_set(BPF_PROG_TYPE_LSM, &bpf_fsverity_set);
> +}
> +
> +#endif /* CONFIG_BPF_SYSCALL */
> --
> 2.34.1
>
