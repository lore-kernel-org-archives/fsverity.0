Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F0041DFE8
	for <fsverity@lists.linux.dev>; Thu,  2 Nov 2023 17:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O4r/lF6u"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-9d242846194so184442366b.1
        for <fsverity@lists.linux.dev>; Thu, 02 Nov 2023 10:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698945929; x=1699550729; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l6D1AAkqVfvVEHfysk9LRGuXUuKlzNpnFcIIu/P8vTA=;
        b=O4r/lF6uPgWGrt18EfdnY3mV7oNZxgv9SHAhEh34P/FMxhVnhsDEepVfkcG9+jsVCR
         RRMucKnKYq4Aa2vu3Efhjj6X38Ir+tRnvq6ehTXyBUxAHEB+rqbbRLD+bgqf5lOpNW6d
         72CDFaxRomyqeK8gskKogPGqtXBqQFuBCOsQMuyH+0KZkTI6Y4fN3P4zIfZOduZiunkN
         EOXdrsORgsXOU97WnHG3oWcgkXxhD6c9myg6eAnsqP6JZOs8EddfDuovQvBO495OcU7d
         eE+5Kctsdq+SVkNY4/9WmDiV2aLg+cJ40cTML76RWTqZj4g9EyfDCQddO8RoCS/a+lM0
         3oGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698945929; x=1699550729;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l6D1AAkqVfvVEHfysk9LRGuXUuKlzNpnFcIIu/P8vTA=;
        b=L6tKp0wsq/Y2yjfrmlzjpXQnZ+x8+rohTFPdSzhBVJ7WSkrUzgCqhQm8o2V5YAH8jY
         2HmOQA13NlUwdU0K9Lz8UDS25ZhTf1AL3fPACDqOqz93Y1yr3r+3+4v1YEkcbh6leVVm
         N7Q/gN9LaAdTlp2696qpMW43E0HQg2DpPu0HTaoG3eYjz7jXex1JwMjbOtU/gyUvhPV7
         ukZxtnFUsdHQJlqnUL0sUokpUuQt6rn1T8JxfNWNo0AMwlOUKS0d/DFXzZIjkwIPQ9bF
         78cRSxym8t6xMIvI0a9RzEBbR/ops1UmKxxE+27fcz8MVtBHHA9I9CuBE03XUn8t4aud
         o5+g==
X-Gm-Message-State: AOJu0YxrS+K/B6UijlTcIU5bdtvr0uMIAQ3SYyxc+SljS58g3bBlUIku
	o1yT1heK8E7bWUhM9eYkehN1gF/fyZAv9L/V524=
X-Google-Smtp-Source: AGHT+IEzM0hraft0farR+oFE3CLWqbpdEbVusyafAJ7N8TKn9zazkEo+eHGLs0QMrEzIkxUB40Dws73szKfhrlK8WiI=
X-Received: by 2002:a17:907:841:b0:9bf:65b0:1122 with SMTP id
 ww1-20020a170907084100b009bf65b01122mr5041987ejb.69.1698945929287; Thu, 02
 Nov 2023 10:25:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231102165432.1769965-1-song@kernel.org> <20231102165432.1769965-2-song@kernel.org>
In-Reply-To: <20231102165432.1769965-2-song@kernel.org>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Thu, 2 Nov 2023 10:25:18 -0700
Message-ID: <CAEf4BzYtfjZRq5xfAZJUmBS=bWVp6JP87Dv3dySyW_4hXwKoRQ@mail.gmail.com>
Subject: Re: [PATCH v7 bpf-next 1/9] bpf: Expose bpf_dynptr_slice* kfuncs for
 in kernel use
To: Song Liu <song@kernel.org>
Cc: bpf@vger.kernel.org, fsverity@lists.linux.dev, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, martin.lau@kernel.org, 
	kernel-team@meta.com, ebiggers@kernel.org, tytso@mit.edu, 
	roberto.sassu@huaweicloud.com, kpsingh@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 2, 2023 at 9:54=E2=80=AFAM Song Liu <song@kernel.org> wrote:
>
> kfuncs bpf_dynptr_slice and bpf_dynptr_slice_rdwr are used by BPF program=
s
> to access the dynptr data. They are also useful for in kernel functions
> that access dynptr data, for example, bpf_verify_pkcs7_signature.
>
> Add bpf_dynptr_slice and bpf_dynptr_slice_rdwr to bpf.h so that kernel
> functions can use them instead of accessing dynptr->data directly.
>
> Update bpf_verify_pkcs7_signature to use bpf_dynptr_slice instead of
> dynptr->data.
>
> Also, update the comments for bpf_dynptr_slice and bpf_dynptr_slice_rdwr
> that they may return error pointers for BPF_DYNPTR_TYPE_XDP.
>
> Signed-off-by: Song Liu <song@kernel.org>
> ---
>  include/linux/bpf.h      |  4 ++++
>  kernel/bpf/helpers.c     | 16 ++++++++--------
>  kernel/trace/bpf_trace.c | 15 +++++++++++----
>  3 files changed, 23 insertions(+), 12 deletions(-)
>

Oh, what a bad timing, I was too late (or too early, depending on how
you look) to comment on issues I've found. Please take a look comments
on v6. I think your usage of dynptr needs fixing.


> diff --git a/include/linux/bpf.h b/include/linux/bpf.h
> index b4825d3cdb29..3ed3ae37cbdf 100644
> --- a/include/linux/bpf.h
> +++ b/include/linux/bpf.h
> @@ -1222,6 +1222,10 @@ enum bpf_dynptr_type {
>
>  int bpf_dynptr_check_size(u32 size);
>  u32 __bpf_dynptr_size(const struct bpf_dynptr_kern *ptr);
> +void *bpf_dynptr_slice(const struct bpf_dynptr_kern *ptr, u32 offset,
> +                      void *buffer__opt, u32 buffer__szk);
> +void *bpf_dynptr_slice_rdwr(const struct bpf_dynptr_kern *ptr, u32 offse=
t,
> +                           void *buffer__opt, u32 buffer__szk);
>
>  #ifdef CONFIG_BPF_JIT
>  int bpf_trampoline_link_prog(struct bpf_tramp_link *link, struct bpf_tra=
mpoline *tr);
> diff --git a/kernel/bpf/helpers.c b/kernel/bpf/helpers.c
> index e46ac288a108..af5059f11e83 100644
> --- a/kernel/bpf/helpers.c
> +++ b/kernel/bpf/helpers.c
> @@ -2270,10 +2270,10 @@ __bpf_kfunc struct task_struct *bpf_task_from_pid=
(s32 pid)
>   * bpf_dynptr_slice will not invalidate any ctx->data/data_end pointers =
in
>   * the bpf program.
>   *
> - * Return: NULL if the call failed (eg invalid dynptr), pointer to a rea=
d-only
> - * data slice (can be either direct pointer to the data or a pointer to =
the user
> - * provided buffer, with its contents containing the data, if unable to =
obtain
> - * direct pointer)
> + * Return: NULL or error pointer if the call failed (eg invalid dynptr),=
 pointer
> + * to a read-only data slice (can be either direct pointer to the data o=
r a
> + * pointer to the user provided buffer, with its contents containing the=
 data,
> + * if unable to obtain direct pointer)
>   */
>  __bpf_kfunc void *bpf_dynptr_slice(const struct bpf_dynptr_kern *ptr, u3=
2 offset,
>                                    void *buffer__opt, u32 buffer__szk)
> @@ -2354,10 +2354,10 @@ __bpf_kfunc void *bpf_dynptr_slice(const struct b=
pf_dynptr_kern *ptr, u32 offset
>   * bpf_dynptr_slice_rdwr will not invalidate any ctx->data/data_end poin=
ters in
>   * the bpf program.
>   *
> - * Return: NULL if the call failed (eg invalid dynptr), pointer to a
> - * data slice (can be either direct pointer to the data or a pointer to =
the user
> - * provided buffer, with its contents containing the data, if unable to =
obtain
> - * direct pointer)
> + * Return: NULL or error pointer if the call failed (eg invalid dynptr),=
 pointer
> + * to a data slice (can be either direct pointer to the data or a pointe=
r to the
> + * user provided buffer, with its contents containing the data, if unabl=
e to
> + * obtain direct pointer)
>   */
>  __bpf_kfunc void *bpf_dynptr_slice_rdwr(const struct bpf_dynptr_kern *pt=
r, u32 offset,
>                                         void *buffer__opt, u32 buffer__sz=
k)
> diff --git a/kernel/trace/bpf_trace.c b/kernel/trace/bpf_trace.c
> index df697c74d519..2626706b6387 100644
> --- a/kernel/trace/bpf_trace.c
> +++ b/kernel/trace/bpf_trace.c
> @@ -1378,6 +1378,7 @@ __bpf_kfunc int bpf_verify_pkcs7_signature(struct b=
pf_dynptr_kern *data_ptr,
>                                struct bpf_dynptr_kern *sig_ptr,
>                                struct bpf_key *trusted_keyring)
>  {
> +       void *data, *sig;
>         int ret;
>
>         if (trusted_keyring->has_ref) {
> @@ -1394,10 +1395,16 @@ __bpf_kfunc int bpf_verify_pkcs7_signature(struct=
 bpf_dynptr_kern *data_ptr,
>                         return ret;
>         }
>
> -       return verify_pkcs7_signature(data_ptr->data,
> -                                     __bpf_dynptr_size(data_ptr),
> -                                     sig_ptr->data,
> -                                     __bpf_dynptr_size(sig_ptr),
> +       data =3D bpf_dynptr_slice(data_ptr, 0, NULL, 0);
> +       if (IS_ERR(data))
> +               return PTR_ERR(data);
> +
> +       sig =3D bpf_dynptr_slice(sig_ptr, 0, NULL, 0);
> +       if (IS_ERR(sig))
> +               return PTR_ERR(sig);
> +
> +       return verify_pkcs7_signature(data, __bpf_dynptr_size(data_ptr),
> +                                     sig, __bpf_dynptr_size(sig_ptr),
>                                       trusted_keyring->key,
>                                       VERIFYING_UNSPECIFIED_SIGNATURE, NU=
LL,
>                                       NULL);
> --
> 2.34.1
>
