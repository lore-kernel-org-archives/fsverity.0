Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C54C156CD
	for <fsverity@lists.linux.dev>; Thu,  2 Nov 2023 16:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lAONVXnN"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-9d2e6c8b542so175441666b.0
        for <fsverity@lists.linux.dev>; Thu, 02 Nov 2023 09:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698944175; x=1699548975; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PAok9UmZEssJYk2T0a1ynw4R8uobF4KBAfxj8PyiTLQ=;
        b=lAONVXnN0kQ7mb3dKxHN3+U9hnIYXwVV3uNR54jPZaMSV6IQCSsw1+QYQIZzY9OBUl
         nHoksKiKJoAneCdVHvoGWbYluMejiLo0QLrrNNqgsAkTnfFygBODOO6ZqriSQgh8xTFq
         e1b8f0GoUlkd6xAS759L2XA4eCMvHrgoigm0DAzheU6tqLjdFvyBexifDjyYwFyzLSLM
         tCpDtRbH2J0Hvu4g+PfpCkfbLGo49oCKbIH7Fpz4I+TPWhbfjcZNv0W081K/t2EhYVek
         UTEA5KCRp6KeGCdsmFsTHRQjZzL8XI7dt0kTc7jXgdhN/qPiJ9ZhSPMOS4KyPtKTyCCV
         kL2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698944175; x=1699548975;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PAok9UmZEssJYk2T0a1ynw4R8uobF4KBAfxj8PyiTLQ=;
        b=R+EhmF3MiP8OjNjkbJHhmyR4J7xh+Jn3zjV6IH6evHTyOMCCVt7tYYdAFFfxKi5Lh2
         IAOZJshDnisWiJtcg+3H0JkcnRLDinvGTtXGYY0ExhbhIToXF6BH3EK11QEJ0jjYpPRe
         4ieVn1B/iv3APLToJg1J3tXuixZpl5wpdwuPGm20GaNpb6PtuoQv3hfvG0Dzto+Wbb6b
         +VrrdV8Yo/wNkQx91SN1e6cXJTZwkFh++zlTOUfWfsGqsc/3Chq51tdDHJD9HkW+OX7k
         gBFD3ainFdCjOOMaGDCmnhRygsHSFkqmqJilMbZtf4DO63TCxwgRTREeMWA3fR8ENH31
         agAg==
X-Gm-Message-State: AOJu0Yyuei7ZTP6dhhmAAIoxjWi/yjjbkv5XjSq4cW6/JpEPVHKrdXdf
	PqXKV0GjzMy8B7mlvYOg85C3WVFUi8xkVDryutk=
X-Google-Smtp-Source: AGHT+IEbcmCXNJTJqudaMXApeY9rOovFyZUpcqYePFhLFW8kyv5DpZFZ/Yy+pCteAmr2fwS9ZXP5t5x5vKyd5pdCTbg=
X-Received: by 2002:a17:907:a08a:b0:9d2:7f29:2baf with SMTP id
 hu10-20020a170907a08a00b009d27f292bafmr4047085ejc.75.1698944174286; Thu, 02
 Nov 2023 09:56:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231024235551.2769174-1-song@kernel.org> <20231024235551.2769174-2-song@kernel.org>
In-Reply-To: <20231024235551.2769174-2-song@kernel.org>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Thu, 2 Nov 2023 09:56:02 -0700
Message-ID: <CAEf4Bzbr8dgksh2z+4nEkAFdV9gquhR+HROULKdTkWrUpSM9-Q@mail.gmail.com>
Subject: Re: [PATCH v6 bpf-next 1/9] bpf: Expose bpf_dynptr_slice* kfuncs for
 in kernel use
To: Song Liu <song@kernel.org>
Cc: bpf@vger.kernel.org, fsverity@lists.linux.dev, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, martin.lau@kernel.org, 
	kernel-team@meta.com, ebiggers@kernel.org, tytso@mit.edu, 
	roberto.sassu@huaweicloud.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 24, 2023 at 4:56=E2=80=AFPM Song Liu <song@kernel.org> wrote:
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

Hold on, nope, this one shouldn't return error pointer because it's
used from BPF program side and BPF program is checking for NULL only.
Does it actually return error pointer, though?

I'm generally skeptical of allowing to call kfuncs directly from
internal kernel code, tbh, and concerns like this are one reason why.
BPF verifier sets up various conditions that kfuncs have to follow,
and it seems error-prone to mix this up with internal kernel usage.

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
>
