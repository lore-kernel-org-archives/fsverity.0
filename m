Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2EDA1BDF0
	for <fsverity@lists.linux.dev>; Thu,  2 Nov 2023 19:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jUWQKhGk"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-54394328f65so2174528a12.3
        for <fsverity@lists.linux.dev>; Thu, 02 Nov 2023 12:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698952022; x=1699556822; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dx8cpcmrOZxzhEqxNTxc4dvmHYweBXWx1RB8KilgMfE=;
        b=jUWQKhGkZ6EQI5vaWf5/O5EAu/Y5yicpGrJkQg1czgPAA4kIcYnXlcVArXN6oyWryy
         en2VOMKhgei39U0265vCkPOxIX9+JJ6XdJhquoSJniR2cpPpt9R86yG+6BS/0I1H7Bbb
         B5n8GBgxYF9Cj2UGwDhE4klEhw5DD+54aTvBvTGyrlu1MlEUsl3qG5CHMQe0vNG7lD4F
         Flq79aJAhWQ3YFAjFmB+0sTpWuhXRtJHbwLhSohOAkjB5WX0CYBwM90js95ah2QSUZ3z
         BYXTPqWkV4gr+Y4goPMLS2xmvv0KKxAvMUadU0RN1BH5RYKcLT9CDvGzyH9L+7/4koR1
         01Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698952022; x=1699556822;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dx8cpcmrOZxzhEqxNTxc4dvmHYweBXWx1RB8KilgMfE=;
        b=syCwma/4zV0Eu2uW7wTGFMh88OT9rYwAxFEz6osb5VpcbvLH5gM2fyaNr5MVFYBgxv
         FtOGg1UXtDu0sg6vCAhSTs3TxZOjx+ob/pg3O3ce+xZXxfpBcIvvkHj4Rc6ehz080XG7
         XaAmqLNWDumwSp6HGbho/tY0Hby0vGShCKvwgpD03ELCgFCVW8fbEAFUvFxVTGt6E17k
         IGaheTBWiEklBElFYUK/f9g2Fr0Yn9Xr2ZFdtnvyGLtzrQh9ojHLYl1GcbA05gHdPB7o
         hQnZZ0TZ7EMdnMglp3B5XJW+bOSJRXj1uz0NOjA/1bocCiu8X5FpEXRZl/yD/lFLqdWF
         +WSw==
X-Gm-Message-State: AOJu0YzYYcrfm+PrQORWZDbi4Iae/9Rsh/OIiGpiHDSsNY1nArUnBINR
	bK3PCFOIHSOQeLVxP0c36AKjgTfD9+Tqh3wGh3U=
X-Google-Smtp-Source: AGHT+IElS1HrxuD4m483T6kr3C2TOa9PyL5ja4nYdmkgG6cBBrGv5ayN5G2qNcof/Q5ycn4VImku5ADxwN+WZfCdTpA=
X-Received: by 2002:a17:906:4705:b0:9a1:abae:8d30 with SMTP id
 y5-20020a170906470500b009a1abae8d30mr3899114ejq.47.1698952021693; Thu, 02 Nov
 2023 12:07:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231024235551.2769174-1-song@kernel.org> <20231024235551.2769174-2-song@kernel.org>
 <CAEf4Bzbr8dgksh2z+4nEkAFdV9gquhR+HROULKdTkWrUpSM9-Q@mail.gmail.com>
 <CAEf4BzbDFDX30Y_Hcmd__hgDp+m6X+htr-wTeBtaoauEnrEdLw@mail.gmail.com>
 <CAEf4BzaD+FV_PM8_4yWnZVed9pXE-KX6CwpYEmiUDpMRQDNEXQ@mail.gmail.com>
 <15A85D6B-56E5-4C9F-B7AB-A62F3DA8294C@fb.com> <B1DDF0D9-5365-4421-83AF-E7F6C0439422@fb.com>
In-Reply-To: <B1DDF0D9-5365-4421-83AF-E7F6C0439422@fb.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Thu, 2 Nov 2023 12:06:50 -0700
Message-ID: <CAEf4BzY_aW0-Ao9vaYoRJ=A3b2=VYqyAX--4UK6CYv7QGAjzgg@mail.gmail.com>
Subject: Re: [PATCH v6 bpf-next 1/9] bpf: Expose bpf_dynptr_slice* kfuncs for
 in kernel use
To: Song Liu <songliubraving@meta.com>
Cc: Song Liu <song@kernel.org>, bpf <bpf@vger.kernel.org>, 
	"fsverity@lists.linux.dev" <fsverity@lists.linux.dev>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@kernel.org>, Kernel Team <kernel-team@meta.com>, 
	Eric Biggers <ebiggers@kernel.org>, "Theodore Ts'o" <tytso@mit.edu>, 
	"roberto.sassu@huaweicloud.com" <roberto.sassu@huaweicloud.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 2, 2023 at 11:16=E2=80=AFAM Song Liu <songliubraving@meta.com> =
wrote:
>
>
>
> > On Nov 2, 2023, at 11:09=E2=80=AFAM, Song Liu <songliubraving@meta.com>=
 wrote:
> >
> >
> >
> >> On Nov 2, 2023, at 10:16=E2=80=AFAM, Andrii Nakryiko <andrii.nakryiko@=
gmail.com> wrote:
> >>
> >> On Thu, Nov 2, 2023 at 10:09=E2=80=AFAM Andrii Nakryiko
> >> <andrii.nakryiko@gmail.com> wrote:
> >>>
> >>> On Thu, Nov 2, 2023 at 9:56=E2=80=AFAM Andrii Nakryiko
> >>> <andrii.nakryiko@gmail.com> wrote:
> >>>>
> >>>> On Tue, Oct 24, 2023 at 4:56=E2=80=AFPM Song Liu <song@kernel.org> w=
rote:
> >>>>>
> >>>>> kfuncs bpf_dynptr_slice and bpf_dynptr_slice_rdwr are used by BPF p=
rograms
> >>>>> to access the dynptr data. They are also useful for in kernel funct=
ions
> >>>>> that access dynptr data, for example, bpf_verify_pkcs7_signature.
> >>>>>
> >>>>> Add bpf_dynptr_slice and bpf_dynptr_slice_rdwr to bpf.h so that ker=
nel
> >>>>> functions can use them instead of accessing dynptr->data directly.
> >>>>>
> >>>>> Update bpf_verify_pkcs7_signature to use bpf_dynptr_slice instead o=
f
> >>>>> dynptr->data.
> >>>>>
> >>>>> Also, update the comments for bpf_dynptr_slice and bpf_dynptr_slice=
_rdwr
> >>>>> that they may return error pointers for BPF_DYNPTR_TYPE_XDP.
> >>>>>
> >>>>> Signed-off-by: Song Liu <song@kernel.org>
> >>>>> ---
> >>>>> include/linux/bpf.h      |  4 ++++
> >>>>> kernel/bpf/helpers.c     | 16 ++++++++--------
> >>>>> kernel/trace/bpf_trace.c | 15 +++++++++++----
> >>>>> 3 files changed, 23 insertions(+), 12 deletions(-)
> >>>>>
> >>>>> diff --git a/include/linux/bpf.h b/include/linux/bpf.h
> >>>>> index b4825d3cdb29..3ed3ae37cbdf 100644
> >>>>> --- a/include/linux/bpf.h
> >>>>> +++ b/include/linux/bpf.h
> >>>>> @@ -1222,6 +1222,10 @@ enum bpf_dynptr_type {
> >>>>>
> >>>>> int bpf_dynptr_check_size(u32 size);
> >>>>> u32 __bpf_dynptr_size(const struct bpf_dynptr_kern *ptr);
> >>>>> +void *bpf_dynptr_slice(const struct bpf_dynptr_kern *ptr, u32 offs=
et,
> >>>>> +                      void *buffer__opt, u32 buffer__szk);
> >>>>> +void *bpf_dynptr_slice_rdwr(const struct bpf_dynptr_kern *ptr, u32=
 offset,
> >>>>> +                           void *buffer__opt, u32 buffer__szk);
> >>>>>
> >>>>> #ifdef CONFIG_BPF_JIT
> >>>>> int bpf_trampoline_link_prog(struct bpf_tramp_link *link, struct bp=
f_trampoline *tr);
> >>>>> diff --git a/kernel/bpf/helpers.c b/kernel/bpf/helpers.c
> >>>>> index e46ac288a108..af5059f11e83 100644
> >>>>> --- a/kernel/bpf/helpers.c
> >>>>> +++ b/kernel/bpf/helpers.c
> >>>>> @@ -2270,10 +2270,10 @@ __bpf_kfunc struct task_struct *bpf_task_fr=
om_pid(s32 pid)
> >>>>> * bpf_dynptr_slice will not invalidate any ctx->data/data_end point=
ers in
> >>>>> * the bpf program.
> >>>>> *
> >>>>> - * Return: NULL if the call failed (eg invalid dynptr), pointer to=
 a read-only
> >>>>> - * data slice (can be either direct pointer to the data or a point=
er to the user
> >>>>> - * provided buffer, with its contents containing the data, if unab=
le to obtain
> >>>>> - * direct pointer)
> >>>>> + * Return: NULL or error pointer if the call failed (eg invalid dy=
nptr), pointer
> >>>>
> >>>> Hold on, nope, this one shouldn't return error pointer because it's
> >>>> used from BPF program side and BPF program is checking for NULL only=
.
> >>>> Does it actually return error pointer, though?
> >
> > Right. kfunc should not return error pointer.
> >
> >>>
> >>> So I just checked the code (should have done it before replying,
> >>> sorry). It is a bug that slipped through when adding bpf_xdp_pointer(=
)
> >>> usage. We should always return NULL from this kfunc on error
> >>> conditions. Let's fix it separately, but please don't change the
> >>> comments.
> >>>
> >>>>
> >>>> I'm generally skeptical of allowing to call kfuncs directly from
> >>>> internal kernel code, tbh, and concerns like this are one reason why=
.
> >>>> BPF verifier sets up various conditions that kfuncs have to follow,
> >>>> and it seems error-prone to mix this up with internal kernel usage.
> >>>>
> >>>
> >>> Reading bpf_dynptr_slice_rdwr code, it does look exactly like what yo=
u
> >>> want, despite the confusingly-looking 0, NULL, 0 arguments. So I gues=
s
> >>> I'm fine exposing it directly, but it still feels like it will bite u=
s
> >>> at some point later.
> >>
> >> Ok, now I'm at patch #5. Think about what you are doing here. You are
> >> asking bpf_dynptr_slice_rdrw() if you can get a directly writable
> >> pointer to a data area of length *zero*. So if it's SKB, for example,
> >> then yeah, you'll be granted a pointer. But then you are proceeding to
> >> write up to sizeof(struct fsverity_digest) bytes, and that can cross
> >> into non-contiguous memory.
>
> By the way, the syntax and comment of bpf_dynptr_slice() is confusing:
>
>  * @buffer__opt: User-provided buffer to copy contents into.  May be NULL
>  * @buffer__szk: Size (in bytes) of the buffer if present. This is the
>  *               length of the requested slice. This must be a constant.
>
> It reads (to me) as, "if buffer__opt is NULL, buffer__szk should be 0".
>
> Is this just my confusion, or is there a real issue?

It's a bit confusing, but no, that size needs to be a "how much data
do I want to read/write", so even if buffer is NULL, size has to be
specified.

"This is the length of the requested slice." is the most important
part in that comment.

>
> Thanks,
> Song
>
>
> >>
> >> So I'll take it back, let's not expose this kfunc directly to kernel
> >> code. Let's have a separate internal helper that will return either
> >> valid pointer or NULL for a given dynptr, but will require valid
> >> non-zero max size. Something with the signature like below
> >>
> >> void * __bpf_dynptr_data_rw(const struct bpf_dynptr_kern *ptr, u32 len=
);
> >>
> >> If ptr can provide a direct pointer to memory of length *len*, great.
> >> If not, return NULL. This will be an appropriate internal API for all
> >> the use cases you are adding where we will be writing back into dynptr
> >> from other kernel APIs with the assumption of contiguous memory
> >> region.
> >
>
