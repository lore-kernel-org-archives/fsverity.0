Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE9721CA82
	for <fsverity@lists.linux.dev>; Thu,  2 Nov 2023 17:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OlibAuG0"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-991c786369cso188606066b.1
        for <fsverity@lists.linux.dev>; Thu, 02 Nov 2023 10:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698944977; x=1699549777; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jLma4XbyH5frF0gB6JBr2iynMB57cgWiVUGmlemzqIc=;
        b=OlibAuG0etT2FfkD+t7o0dgT513jkKHBQbNPuOgu9vp1m9Q/kpBlVotQaJ6mnFY/Uv
         JDXFoC96hXWXDy0RtSXgBQy80jnd1HQSEZYizogsY3C1+qCmjvErUEcfWYn5EgiYw8PV
         W1LUHfWVpbZ3NlOoZVURefNsFF2rCTcKsEQ6O5Y6Gw4k6ihoCSvdkWqKHREs6L0/lms4
         vF1JeTml7peP/vI+ddmGqo3HEdYqPdZU2BZtSqaFumezZzQP80qHV1e/hCSWDeiAXUPy
         GgvGf5nKMU/EwG3fOGHa9nwXzAkwOITXRTK3V/0hPHmTUYk3CsxbG5UCyScqXKKnMolJ
         0F8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698944977; x=1699549777;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jLma4XbyH5frF0gB6JBr2iynMB57cgWiVUGmlemzqIc=;
        b=lHvXy9goe7Nl5F+77iYrzXsOwMsD0SdQ4CTFt+08Wo7TeiUHlgYJlsXRnHrdQvtp6Q
         oA8+z23JyF1969mYTpHtO9qlZPHaJ+o+3wYzZLsqxLb6NFLhF5UmjGsu3n/y5GWCNtBk
         eZ1Rxp4Bf11eTYaccpZXwPg29/2ziggZiu0BsQb7sBhw0oACIIwq9JLAwTC+6p3oVm87
         F7Nx+5mTmrdRCuRewabJQj/zw1KZlz7+iMkKNDnB2Fy/WtlsnvSMyj/Q7dMze/tWlclJ
         QT7vWg4WHQifWs4tUfaDFjGRzjsPLz7sMICauW7Xi80wCxgL7wrgfVRtqWrRSZAJgyf2
         V1uw==
X-Gm-Message-State: AOJu0Yzvkm/3BBAYGESY/+ZcRAoOrH3LJ/lYHPEhjpZClMQQljX4dldX
	ixDFkGB4fJ6aqxeCT0ONN59Ow1gxEFL6lgQWuvw=
X-Google-Smtp-Source: AGHT+IE4IFU1ccSX3s2vS0J7AaA1f2GyvvO/ldP8wXadKTxVb+cv2Aj/lyv36ZEFPrS4LtWJghLTRp+Ijs2T5tEfJUs=
X-Received: by 2002:a17:906:dc91:b0:9c5:7f8b:bafc with SMTP id
 cs17-20020a170906dc9100b009c57f8bbafcmr5226811ejc.22.1698944976729; Thu, 02
 Nov 2023 10:09:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231024235551.2769174-1-song@kernel.org> <20231024235551.2769174-2-song@kernel.org>
 <CAEf4Bzbr8dgksh2z+4nEkAFdV9gquhR+HROULKdTkWrUpSM9-Q@mail.gmail.com>
In-Reply-To: <CAEf4Bzbr8dgksh2z+4nEkAFdV9gquhR+HROULKdTkWrUpSM9-Q@mail.gmail.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Thu, 2 Nov 2023 10:09:25 -0700
Message-ID: <CAEf4BzbDFDX30Y_Hcmd__hgDp+m6X+htr-wTeBtaoauEnrEdLw@mail.gmail.com>
Subject: Re: [PATCH v6 bpf-next 1/9] bpf: Expose bpf_dynptr_slice* kfuncs for
 in kernel use
To: Song Liu <song@kernel.org>
Cc: bpf@vger.kernel.org, fsverity@lists.linux.dev, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, martin.lau@kernel.org, 
	kernel-team@meta.com, ebiggers@kernel.org, tytso@mit.edu, 
	roberto.sassu@huaweicloud.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 2, 2023 at 9:56=E2=80=AFAM Andrii Nakryiko
<andrii.nakryiko@gmail.com> wrote:
>
> On Tue, Oct 24, 2023 at 4:56=E2=80=AFPM Song Liu <song@kernel.org> wrote:
> >
> > kfuncs bpf_dynptr_slice and bpf_dynptr_slice_rdwr are used by BPF progr=
ams
> > to access the dynptr data. They are also useful for in kernel functions
> > that access dynptr data, for example, bpf_verify_pkcs7_signature.
> >
> > Add bpf_dynptr_slice and bpf_dynptr_slice_rdwr to bpf.h so that kernel
> > functions can use them instead of accessing dynptr->data directly.
> >
> > Update bpf_verify_pkcs7_signature to use bpf_dynptr_slice instead of
> > dynptr->data.
> >
> > Also, update the comments for bpf_dynptr_slice and bpf_dynptr_slice_rdw=
r
> > that they may return error pointers for BPF_DYNPTR_TYPE_XDP.
> >
> > Signed-off-by: Song Liu <song@kernel.org>
> > ---
> >  include/linux/bpf.h      |  4 ++++
> >  kernel/bpf/helpers.c     | 16 ++++++++--------
> >  kernel/trace/bpf_trace.c | 15 +++++++++++----
> >  3 files changed, 23 insertions(+), 12 deletions(-)
> >
> > diff --git a/include/linux/bpf.h b/include/linux/bpf.h
> > index b4825d3cdb29..3ed3ae37cbdf 100644
> > --- a/include/linux/bpf.h
> > +++ b/include/linux/bpf.h
> > @@ -1222,6 +1222,10 @@ enum bpf_dynptr_type {
> >
> >  int bpf_dynptr_check_size(u32 size);
> >  u32 __bpf_dynptr_size(const struct bpf_dynptr_kern *ptr);
> > +void *bpf_dynptr_slice(const struct bpf_dynptr_kern *ptr, u32 offset,
> > +                      void *buffer__opt, u32 buffer__szk);
> > +void *bpf_dynptr_slice_rdwr(const struct bpf_dynptr_kern *ptr, u32 off=
set,
> > +                           void *buffer__opt, u32 buffer__szk);
> >
> >  #ifdef CONFIG_BPF_JIT
> >  int bpf_trampoline_link_prog(struct bpf_tramp_link *link, struct bpf_t=
rampoline *tr);
> > diff --git a/kernel/bpf/helpers.c b/kernel/bpf/helpers.c
> > index e46ac288a108..af5059f11e83 100644
> > --- a/kernel/bpf/helpers.c
> > +++ b/kernel/bpf/helpers.c
> > @@ -2270,10 +2270,10 @@ __bpf_kfunc struct task_struct *bpf_task_from_p=
id(s32 pid)
> >   * bpf_dynptr_slice will not invalidate any ctx->data/data_end pointer=
s in
> >   * the bpf program.
> >   *
> > - * Return: NULL if the call failed (eg invalid dynptr), pointer to a r=
ead-only
> > - * data slice (can be either direct pointer to the data or a pointer t=
o the user
> > - * provided buffer, with its contents containing the data, if unable t=
o obtain
> > - * direct pointer)
> > + * Return: NULL or error pointer if the call failed (eg invalid dynptr=
), pointer
>
> Hold on, nope, this one shouldn't return error pointer because it's
> used from BPF program side and BPF program is checking for NULL only.
> Does it actually return error pointer, though?

So I just checked the code (should have done it before replying,
sorry). It is a bug that slipped through when adding bpf_xdp_pointer()
usage. We should always return NULL from this kfunc on error
conditions. Let's fix it separately, but please don't change the
comments.

>
> I'm generally skeptical of allowing to call kfuncs directly from
> internal kernel code, tbh, and concerns like this are one reason why.
> BPF verifier sets up various conditions that kfuncs have to follow,
> and it seems error-prone to mix this up with internal kernel usage.
>

Reading bpf_dynptr_slice_rdwr code, it does look exactly like what you
want, despite the confusingly-looking 0, NULL, 0 arguments. So I guess
I'm fine exposing it directly, but it still feels like it will bite us
at some point later.


> > + * to a read-only data slice (can be either direct pointer to the data=
 or a
> > + * pointer to the user provided buffer, with its contents containing t=
he data,
> > + * if unable to obtain direct pointer)
> >   */
> >  __bpf_kfunc void *bpf_dynptr_slice(const struct bpf_dynptr_kern *ptr, =
u32 offset,
> >                                    void *buffer__opt, u32 buffer__szk)
> > @@ -2354,10 +2354,10 @@ __bpf_kfunc void *bpf_dynptr_slice(const struct=
 bpf_dynptr_kern *ptr, u32 offset
> >   * bpf_dynptr_slice_rdwr will not invalidate any ctx->data/data_end po=
inters in
> >   * the bpf program.
> >   *
> > - * Return: NULL if the call failed (eg invalid dynptr), pointer to a
> > - * data slice (can be either direct pointer to the data or a pointer t=
o the user
> > - * provided buffer, with its contents containing the data, if unable t=
o obtain
> > - * direct pointer)
> > + * Return: NULL or error pointer if the call failed (eg invalid dynptr=
), pointer
> > + * to a data slice (can be either direct pointer to the data or a poin=
ter to the
> > + * user provided buffer, with its contents containing the data, if una=
ble to
> > + * obtain direct pointer)
> >   */
> >  __bpf_kfunc void *bpf_dynptr_slice_rdwr(const struct bpf_dynptr_kern *=
ptr, u32 offset,
> >                                         void *buffer__opt, u32 buffer__=
szk)
> > diff --git a/kernel/trace/bpf_trace.c b/kernel/trace/bpf_trace.c
> > index df697c74d519..2626706b6387 100644
> > --- a/kernel/trace/bpf_trace.c
> > +++ b/kernel/trace/bpf_trace.c
> > @@ -1378,6 +1378,7 @@ __bpf_kfunc int bpf_verify_pkcs7_signature(struct=
 bpf_dynptr_kern *data_ptr,
> >                                struct bpf_dynptr_kern *sig_ptr,
> >                                struct bpf_key *trusted_keyring)
> >  {
> > +       void *data, *sig;
> >         int ret;
> >
> >         if (trusted_keyring->has_ref) {
> > @@ -1394,10 +1395,16 @@ __bpf_kfunc int bpf_verify_pkcs7_signature(stru=
ct bpf_dynptr_kern *data_ptr,
> >                         return ret;
> >         }
> >
> > -       return verify_pkcs7_signature(data_ptr->data,
> > -                                     __bpf_dynptr_size(data_ptr),
> > -                                     sig_ptr->data,
> > -                                     __bpf_dynptr_size(sig_ptr),
> > +       data =3D bpf_dynptr_slice(data_ptr, 0, NULL, 0);
> > +       if (IS_ERR(data))
> > +               return PTR_ERR(data);
> > +
> > +       sig =3D bpf_dynptr_slice(sig_ptr, 0, NULL, 0);
> > +       if (IS_ERR(sig))
> > +               return PTR_ERR(sig);
> > +
> > +       return verify_pkcs7_signature(data, __bpf_dynptr_size(data_ptr)=
,
> > +                                     sig, __bpf_dynptr_size(sig_ptr),
> >                                       trusted_keyring->key,
> >                                       VERIFYING_UNSPECIFIED_SIGNATURE, =
NULL,
> >                                       NULL);
> > --
> > 2.34.1
> >
> >
