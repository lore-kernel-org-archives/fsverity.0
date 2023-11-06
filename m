Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08E22E633
	for <fsverity@lists.linux.dev>; Mon,  6 Nov 2023 21:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XR6k0Irh"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-9c3aec5f326so1200475066b.1
        for <fsverity@lists.linux.dev>; Mon, 06 Nov 2023 13:07:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699304854; x=1699909654; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pY3wJ4etmNmeOhchTg2Yz0Uqtr4oqFa09rhq15XSSaY=;
        b=XR6k0IrhYneVJEkBwoYREkhVB6OpPh1Ky+eR48Oc520poSFp8I6DDg4DpVTjD+m+VN
         9IABikBVSNJa8m5/36iIYOgjaKaUBsqsw+mYU3ccxzo0D6X931Esc04ia33IiflJs0UH
         3VFQuzvCtGRNc+gWGBfwA8jVx+XMt05NWClUOiGTgbJYQERO6VfE5ffBP5epSb52iI4t
         UWqSNQ1l0Q8lkkeSVeQPuH2HW7zkPlrUlOfNEjwXzID+dZsjJEOlZLmxR/SzCx0dHr7R
         oyevHLLL5py7Y3+ueuxWuUq3TsjroPNFBKCAU3p53itDBv3PFoCVRuV7/xKE+tzBTeJr
         XixA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699304854; x=1699909654;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pY3wJ4etmNmeOhchTg2Yz0Uqtr4oqFa09rhq15XSSaY=;
        b=HPEUxc551qNNA+DY+CKbPtjymzEagaJEKFoxezM9D2jYAuXGik246smYCiz8wY+FyY
         RB6FArqAhxd872b78NZ3wPCIrJOIOvmDCthNK24Se8+ShazwZEZfIBxg0YNvXL9nKMTx
         fDVgaiZqGFRjENPZEYVfplKZ3bcM41bEd/7nKDyofnOIVDoYEsOmTX72PM8gJBQ8VaIV
         5CielgWUHPYpaIWdyyDCIDTP242oJqhvs15+4BxhMlwBh627seHLAyTeKodzja7Q8TK1
         Cl/o+6U4fKEczkkVGR38zetyb5VkbYpf3x+zg77jn2rTbaEHqPL6qOod0UJ1YAxZOTps
         +1WA==
X-Gm-Message-State: AOJu0YwwxTzh8aMd5KXN6NJF/SlReE1/XKdrc9wfzG75tKswIRO965A8
	RIwmmPkTsVKyuu6Dx0nPUc501NNPfqU7C3YAPAU=
X-Google-Smtp-Source: AGHT+IFKdQf+fJi479MY4WtNpy9t41bm+SXMyl8M1vwfdNzgJL6eAYcd/tOJmDtn5XCgRh0gXbMyeP/97q4K7Ns2BbE=
X-Received: by 2002:a17:906:20ce:b0:9c7:6523:407b with SMTP id
 c14-20020a17090620ce00b009c76523407bmr640690ejc.17.1699304853864; Mon, 06 Nov
 2023 13:07:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231104001313.3538201-1-song@kernel.org> <20231104001313.3538201-2-song@kernel.org>
In-Reply-To: <20231104001313.3538201-2-song@kernel.org>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Mon, 6 Nov 2023 13:07:22 -0800
Message-ID: <CAEf4BzadqTVe=OPiKb=F63j3pqFPayUddjf17WFw0E47zqEqOw@mail.gmail.com>
Subject: Re: [PATCH v12 bpf-next 1/9] bpf: Add __bpf_dynptr_data* for in
 kernel use
To: Song Liu <song@kernel.org>
Cc: bpf@vger.kernel.org, fsverity@lists.linux.dev, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, martin.lau@kernel.org, 
	kernel-team@meta.com, ebiggers@kernel.org, tytso@mit.edu, 
	roberto.sassu@huaweicloud.com, kpsingh@kernel.org, vadfed@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 3, 2023 at 5:13=E2=80=AFPM Song Liu <song@kernel.org> wrote:
>
> Different types of bpf dynptr have different internal data storage.
> Specifically, SKB and XDP type of dynptr may have non-continuous data.
> Therefore, it is not always safe to directly access dynptr->data.
>
> Add __bpf_dynptr_data and __bpf_dynptr_data_rw to replace direct access t=
o
> dynptr->data.
>
> Update bpf_verify_pkcs7_signature to use __bpf_dynptr_data instead of
> dynptr->data.
>
> Signed-off-by: Song Liu <song@kernel.org>
> ---
>  include/linux/bpf.h      |  2 ++
>  kernel/bpf/helpers.c     | 47 ++++++++++++++++++++++++++++++++++++++++
>  kernel/trace/bpf_trace.c | 12 ++++++----
>  3 files changed, 57 insertions(+), 4 deletions(-)
>
> diff --git a/include/linux/bpf.h b/include/linux/bpf.h
> index b4825d3cdb29..eb84caf133df 100644
> --- a/include/linux/bpf.h
> +++ b/include/linux/bpf.h
> @@ -1222,6 +1222,8 @@ enum bpf_dynptr_type {
>
>  int bpf_dynptr_check_size(u32 size);
>  u32 __bpf_dynptr_size(const struct bpf_dynptr_kern *ptr);
> +const void *__bpf_dynptr_data(const struct bpf_dynptr_kern *ptr, u32 len=
);
> +void *__bpf_dynptr_data_rw(const struct bpf_dynptr_kern *ptr, u32 len);
>
>  #ifdef CONFIG_BPF_JIT
>  int bpf_trampoline_link_prog(struct bpf_tramp_link *link, struct bpf_tra=
mpoline *tr);
> diff --git a/kernel/bpf/helpers.c b/kernel/bpf/helpers.c
> index e46ac288a108..c569c4c43bde 100644
> --- a/kernel/bpf/helpers.c
> +++ b/kernel/bpf/helpers.c
> @@ -2611,3 +2611,50 @@ static int __init kfunc_init(void)
>  }
>
>  late_initcall(kfunc_init);
> +
> +/* Get a pointer to dynptr data up to len bytes for read only access. If
> + * the dynptr doesn't have continuous data up to len bytes, return NULL.
> + */
> +const void *__bpf_dynptr_data(const struct bpf_dynptr_kern *ptr, u32 len=
)
> +{
> +       enum bpf_dynptr_type type;
> +       int err;
> +
> +       if (!ptr->data)
> +               return NULL;
> +
> +       err =3D bpf_dynptr_check_off_len(ptr, 0, len);
> +       if (err)
> +               return NULL;
> +       type =3D bpf_dynptr_get_type(ptr);
> +
> +       switch (type) {
> +       case BPF_DYNPTR_TYPE_LOCAL:
> +       case BPF_DYNPTR_TYPE_RINGBUF:
> +               return ptr->data + ptr->offset;
> +       case BPF_DYNPTR_TYPE_SKB:
> +               return skb_pointer_if_linear(ptr->data, ptr->offset, len)=
;
> +       case BPF_DYNPTR_TYPE_XDP:
> +       {
> +               void *xdp_ptr =3D bpf_xdp_pointer(ptr->data, ptr->offset,=
 len);
> +
> +               if (IS_ERR_OR_NULL(xdp_ptr))
> +                       return NULL;
> +               return xdp_ptr;
> +       }
> +       default:
> +               WARN_ONCE(true, "unknown dynptr type %d\n", type);
> +               return NULL;
> +       }
> +}
> +

Song, you basically reimplemented bpf_dynptr_slice() but didn't unify
the code. Now we have two almost identical non-trivial functions we'd
need to update every time someone adds a new type of dynptr. Why not
have common helper that does everything both bpf_dynptr_slice() kfunc
needs and __bpf_dynptr_data() needs. And then call into it from both,
keeping all the LOCAL vs RINGBUF vs SKB vs XDP logic in one place?

Is there some problem unifying them?

> +/* Get a pointer to dynptr data up to len bytes for read write access. I=
f
> + * the dynptr doesn't have continuous data up to len bytes, or the dynpt=
r
> + * is read only, return NULL.
> + */
> +void *__bpf_dynptr_data_rw(const struct bpf_dynptr_kern *ptr, u32 len)
> +{
> +       if (__bpf_dynptr_is_rdonly(ptr))
> +               return NULL;
> +       return (void *)__bpf_dynptr_data(ptr, len);
> +}
> diff --git a/kernel/trace/bpf_trace.c b/kernel/trace/bpf_trace.c
> index df697c74d519..d525a22b8d56 100644
> --- a/kernel/trace/bpf_trace.c
> +++ b/kernel/trace/bpf_trace.c
> @@ -1378,6 +1378,8 @@ __bpf_kfunc int bpf_verify_pkcs7_signature(struct b=
pf_dynptr_kern *data_ptr,
>                                struct bpf_dynptr_kern *sig_ptr,
>                                struct bpf_key *trusted_keyring)
>  {
> +       const void *data, *sig;
> +       u32 data_len, sig_len;
>         int ret;
>
>         if (trusted_keyring->has_ref) {
> @@ -1394,10 +1396,12 @@ __bpf_kfunc int bpf_verify_pkcs7_signature(struct=
 bpf_dynptr_kern *data_ptr,
>                         return ret;
>         }
>
> -       return verify_pkcs7_signature(data_ptr->data,
> -                                     __bpf_dynptr_size(data_ptr),
> -                                     sig_ptr->data,
> -                                     __bpf_dynptr_size(sig_ptr),
> +       data_len =3D __bpf_dynptr_size(data_ptr);
> +       data =3D __bpf_dynptr_data(data_ptr, data_len);
> +       sig_len =3D __bpf_dynptr_size(sig_ptr);
> +       sig =3D __bpf_dynptr_data(sig_ptr, sig_len);
> +
> +       return verify_pkcs7_signature(data, data_len, sig, sig_len,
>                                       trusted_keyring->key,
>                                       VERIFYING_UNSPECIFIED_SIGNATURE, NU=
LL,
>                                       NULL);
> --
> 2.34.1
>
