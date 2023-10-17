Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E95F2DF6E
	for <fsverity@lists.linux.dev>; Tue, 17 Oct 2023 19:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BdeLL72Q"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-53df747cfe5so10725963a12.2
        for <fsverity@lists.linux.dev>; Tue, 17 Oct 2023 12:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697572229; x=1698177029; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QiAfMO8Yugl8IggqSvmRx+k1gube6Jyh/Cc5OXvA1/g=;
        b=BdeLL72QlDXy/jPKLHiuva9axeJVVwe+D0TeFyTVUJAE8lzQFI+zxaEmRK4w+1VBJc
         Ld7TZeVrM3tIqdSosgSNj22Oe9bLPdUz16CwzM+uwjDkqQzgBFN5Zsxqos2bejKX3CFp
         HqhW270Y0/kmHqMM4wOL8Se6KPjAGI5O3NxicVPnTuwVzuV3hL1lpzCQpk5cq9YECCDA
         5e9Ye49+Q0F9NXKV5H0TPxaG3XW0hM6vesx8Fm3eBcs0+HtLmCX5YVZ9+7HB0P8p7pyk
         8A5M3n6qbbPoWBqllImZe6g5EnARHfl0GidQMei3+3CPqCeKqpmJV5ty6kINKGItN2uS
         zdKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697572229; x=1698177029;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QiAfMO8Yugl8IggqSvmRx+k1gube6Jyh/Cc5OXvA1/g=;
        b=mhzIqVyssKfcO8aVhDHbY7eEmIR9gtiAek7atN8KwMHCnQ9NdClnI3G/cb9jEpCbLB
         K+W7ceC0B8CoCqATwlKICSVDzcRqec2n5N9KlXFmpnezayUPjzhYw7jqQ+Y28jP9jol3
         b8iGkc28f2c2ekr1lcjGAmqmEHPBpfqCZLolvIZXWAQ4tBhA6aFN/I5vAs+uVOnVuB94
         gpETHpP5ciBR9K0g7SDy5E0tZyAeC2DO1NVHdrnY5EflIeYREFIyF/W9toaci69DU4LW
         rUuo6pzBCF0FJlDXHcBb2Sx64Mq48y/jzDbpLed+BVt5Z6pAYGCl/mqdBfS2l+A//2qX
         XvoA==
X-Gm-Message-State: AOJu0YwWgKUJnEKgAK70J/UrJMJIQLltRUGLP/QzerscYVpunpOiUx9R
	2hNCCzgWzs5zlm0InucMmjggGEjEiRPizbx4G48=
X-Google-Smtp-Source: AGHT+IGHguOehkLc0Vq8S+Qs8vFHEGViFzjDhHg6jRfYIrUTrsBxcj4WmObk1SZjGfT6kbHabJzXQTi9WFPEidxfd4I=
X-Received: by 2002:a50:d5d4:0:b0:53e:6624:5aeb with SMTP id
 g20-20020a50d5d4000000b0053e66245aebmr2512294edj.11.1697572229531; Tue, 17
 Oct 2023 12:50:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231013182644.2346458-1-song@kernel.org> <20231013182644.2346458-3-song@kernel.org>
In-Reply-To: <20231013182644.2346458-3-song@kernel.org>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Tue, 17 Oct 2023 12:50:17 -0700
Message-ID: <CAEf4BzbM0Ru4NpHNfn5Y=vQgfFAmeb+8Z+O6unuFkNr=9BrvKQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next 2/5] bpf, fsverity: Add kfunc bpf_get_fsverity_digest
To: Song Liu <song@kernel.org>
Cc: bpf@vger.kernel.org, fsverity@lists.linux.dev, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, martin.lau@kernel.org, 
	kernel-team@meta.com, ebiggers@kernel.org, tytso@mit.edu, 
	roberto.sassu@huaweicloud.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 13, 2023 at 11:29=E2=80=AFAM Song Liu <song@kernel.org> wrote:
>
> The kfunc can be used to read fsverity_digest, so that we can verify
> signature in BPF LSM.
>
> This kfunc is added to fs/verity/measure.c because some data structure us=
ed
> in the function is private to fsverity (fs/verity/fsverity_private.h).
>
> Signed-off-by: Song Liu <song@kernel.org>
> ---
>  fs/verity/measure.c | 66 +++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 66 insertions(+)
>
> diff --git a/fs/verity/measure.c b/fs/verity/measure.c
> index eec5956141da..2d4b2e6f5a5d 100644
> --- a/fs/verity/measure.c
> +++ b/fs/verity/measure.c
> @@ -8,6 +8,8 @@
>  #include "fsverity_private.h"
>
>  #include <linux/uaccess.h>
> +#include <linux/bpf.h>
> +#include <linux/btf.h>
>
>  /**
>   * fsverity_ioctl_measure() - get a verity file's digest
> @@ -100,3 +102,67 @@ int fsverity_get_digest(struct inode *inode,
>         return hash_alg->digest_size;
>  }
>  EXPORT_SYMBOL_GPL(fsverity_get_digest);
> +
> +/* bpf kfuncs */
> +__diag_push();
> +__diag_ignore_all("-Wmissing-prototypes",
> +                 "kfuncs which will be used in BPF programs");
> +
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
> +       struct fsverity_digest *arg =3D digest_ptr->data;

this can be null

I think we need some internal helpers that are similar to
bpf_dynptr_slice() that would handle invalid dynptr cases, as well as
abstract away potentially non-contiguous memory dynptr points to.
WDYT?

> +       const struct fsverity_info *vi;
> +       const struct fsverity_hash_alg *hash_alg;
> +       int out_digest_sz;
> +
> +       if (__bpf_dynptr_size(digest_ptr) < sizeof(struct fsverity_digest=
))
> +               return -EINVAL;
> +
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
> +       memset(arg->digest + arg->digest_size, 0, out_digest_sz - hash_al=
g->digest_size);
> +
> +       return 0;
> +}
> +
> +__diag_pop();
> +
> +BTF_SET8_START(fsverity_set)
> +BTF_ID_FLAGS(func, bpf_get_fsverity_digest, KF_SLEEPABLE)
> +BTF_SET8_END(fsverity_set)
> +
> +const struct btf_kfunc_id_set bpf_fsverity_set =3D {
> +       .owner =3D THIS_MODULE,
> +       .set =3D &fsverity_set,
> +};
> +
> +static int __init bpf_fsverity_init(void)
> +{
> +       return register_btf_kfunc_id_set(BPF_PROG_TYPE_TRACING,
> +                                        &bpf_fsverity_set);
> +}
> +
> +late_initcall(bpf_fsverity_init);
> --
> 2.34.1
>
