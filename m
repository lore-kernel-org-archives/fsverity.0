Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C3863AD
	for <fsverity@lists.linux.dev>; Thu,  2 Nov 2023 17:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KZU6TbKd"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-9d10972e63eso177736766b.2
        for <fsverity@lists.linux.dev>; Thu, 02 Nov 2023 10:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698944489; x=1699549289; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UzN09WMIaiF3E7sVQSKmv7RLms1wIPYoqtDBzP7/1kw=;
        b=KZU6TbKdrb824PmrcL+9CqrnvwAcBSkaBXTebPEDCuI4RafiD8b6/+IO3+rRQpNtYv
         L1Ul46nWgO8M+UC35KuEuv42GODP5RQxakKN8NgOtfkGQeHxCuM4ROHUf3+XTInm1JD/
         2o89Xji2yIfL+DIl1XzZolCRmljSDvfShnMsxqym00jEShv+38s+bDxraUxSyOuWJXB4
         XtmPSP1OhZzAMLsTTt0C8YXk04UttdNFDcnOXxXB5FMhWNL8OUn4SpVydb1DOszXrOv4
         2UQ5NIp8FK11J6giDQOqCZS6DJYCUSEyqrVbfuTEDaCOf9NvyuwbWwv0CDKPGM54UAJd
         LFZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698944489; x=1699549289;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UzN09WMIaiF3E7sVQSKmv7RLms1wIPYoqtDBzP7/1kw=;
        b=nrZqdBGZLzVQjdLuK1ZHSMiN4XCdfyK4dA98XXSukn05nV5FE9FxIIkyPC6AYwOd5a
         l/87XF5UCEwnztyFJ3H87wJbf0xY2yVK4Re1yl//0a9tZpMDicnfNMgX9YKEffKw53SP
         MQW1Xoo4zcRXxWZmHClSapDLRQT8qvXQ/fxXBDDUoJI76FUQPqhfhT/G4RGhuDNrJqIy
         lmVujG5rGOQMmE/y40Yg8wcEKzZfbH97HMiHo77Rr9iYMRHlQqvemReUXkTvBK/iMTAe
         iHEQkdYmuxJi5jUtCfdPWGbqlQzB/6mHUSpO3gEfng5W5RXJmI5GDvqlp/GxRSmtaJXI
         QqmA==
X-Gm-Message-State: AOJu0YxH+jHMJJK5DAId8f05RH6bhjTJYWQ4H/mJ4NejqsZWSIMDFs8M
	I2RFIYkrlcmgfOEubwjOU162uZ92O6/trrD1EMo=
X-Google-Smtp-Source: AGHT+IGG5vWpdJsyZGD7QM+4RAIrmNWizY3RRRubkvSE/zlMLNeESHvZHrCpQUstCH0lKZSlcSJ55k+sSn3bgi2UPF8=
X-Received: by 2002:a17:906:51ce:b0:9ae:52fb:2202 with SMTP id
 v14-20020a17090651ce00b009ae52fb2202mr4397459ejk.40.1698944489036; Thu, 02
 Nov 2023 10:01:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231024235551.2769174-1-song@kernel.org> <20231024235551.2769174-5-song@kernel.org>
In-Reply-To: <20231024235551.2769174-5-song@kernel.org>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Thu, 2 Nov 2023 10:01:17 -0700
Message-ID: <CAEf4Bzbu2YruzOnWDTkua=VTDMJi8P+BZYC_ntrLOC6QkG3oSA@mail.gmail.com>
Subject: Re: [PATCH v6 bpf-next 4/9] bpf: Add kfunc bpf_get_file_xattr
To: Song Liu <song@kernel.org>
Cc: bpf@vger.kernel.org, fsverity@lists.linux.dev, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, martin.lau@kernel.org, 
	kernel-team@meta.com, ebiggers@kernel.org, tytso@mit.edu, 
	roberto.sassu@huaweicloud.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 24, 2023 at 4:56=E2=80=AFPM Song Liu <song@kernel.org> wrote:
>
> It is common practice for security solutions to store tags/labels in
> xattrs. To implement similar functionalities in BPF LSM, add new kfunc
> bpf_get_file_xattr().
>
> To avoid recursion, bpf_get_file_xattr can be only called from LSM hooks.
>
> Signed-off-by: Song Liu <song@kernel.org>
> ---
>  kernel/trace/bpf_trace.c | 59 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 59 insertions(+)
>
> diff --git a/kernel/trace/bpf_trace.c b/kernel/trace/bpf_trace.c
> index 2626706b6387..802181986ad3 100644
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
> @@ -1436,6 +1437,64 @@ static int __init bpf_key_sig_kfuncs_init(void)
>  late_initcall(bpf_key_sig_kfuncs_init);
>  #endif /* CONFIG_KEYS */
>
> +/* filesystem kfuncs */
> +__diag_push();
> +__diag_ignore_all("-Wmissing-prototypes",
> +                 "kfuncs which will be used in BPF programs");

Dave just added convenient macros for kfunc definition regions, please
use them for new code.

> +
> +/**
> + * bpf_get_file_xattr - get xattr of a file
> + * @file: file to get xattr from
> + * @name__const_str: name of the xattr
> + * @value_ptr: output buffer of the xattr value
> + *
> + * Get xattr *name__const_str* of *file* and store the output in *value_=
ptr*.
> + *
> + * Return: 0 on success, a negative value on error.
> + */
> +__bpf_kfunc int bpf_get_file_xattr(struct file *file, const char *name__=
const_str,
> +                                  struct bpf_dynptr_kern *value_ptr)
> +{
> +       struct dentry *dentry;
> +       void *value;
> +
> +       value =3D bpf_dynptr_slice_rdwr(value_ptr, 0, NULL, 0);

This is very confusing and looks wrong. You are passing requested size
0, which is certainly not the intent of this API.
As I mentioned in previous patch, let's add internal-only dynptr
helper that will return pointer and separately we already have a
helper to get dynptr size, and do that explicitly.

> +       if (IS_ERR_OR_NULL(value))
> +               return PTR_ERR(value);
> +
> +       dentry =3D file_dentry(file);
> +       return __vfs_getxattr(dentry, dentry->d_inode, name__const_str,
> +                             value, __bpf_dynptr_size(value_ptr));
> +}
> +
> +__diag_pop();
> +
> +BTF_SET8_START(fs_kfunc_set_ids)
> +BTF_ID_FLAGS(func, bpf_get_file_xattr, KF_SLEEPABLE)
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
