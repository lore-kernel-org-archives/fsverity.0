Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F4222F506
	for <fsverity@lists.linux.dev>; Tue, 17 Oct 2023 21:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i+8oo+WJ"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2c50fbc218bso55500521fa.3
        for <fsverity@lists.linux.dev>; Tue, 17 Oct 2023 14:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697579532; x=1698184332; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z+MMru+ANnbBtUyjXQ7RSzaj59Vo4+f2PiryvSIAEZs=;
        b=i+8oo+WJz3oev7fNmuKODtg3bimnwq5XKDf1KR4LyOVlOnNGpIchVUtsAqrJ1IYj3Z
         3GriI8/u2P+IKIdCm4/g9Nt5+9/ZVN07hYW5jbXJ5pnoMSVzEW0gQx9nxVnUaBXRT3jD
         UVxaRQA7tb4R2o/M4F7psJk3dXmT9oiJvRC/G2zNBRM7k3uKG1W5hoSMLvO81B+RuNAU
         lu6UEfgzTgl36Ty+MPfl1ok7bmjE22Sp0FG5qRavq/cGIF2wdEaeRXLnCf47014/ssUY
         Yn/UgO6EWcEOLMaBCA9krqJ+3Wt0nbplG/FxlPGX3am1hYP269uINw3WUgHRxYfDitgK
         g7aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697579532; x=1698184332;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z+MMru+ANnbBtUyjXQ7RSzaj59Vo4+f2PiryvSIAEZs=;
        b=tNt2NDXrt2hgYBhaYnYP1/ESwNopmupmR8ShpAQR7Kqwqg3Nm5nnQgn5wvi8X0Tybx
         t+3+1+cFZyEbEnz1yUkzweTWZfKVCLwebMA+g8DWhznLu0wIo9H+71TjZk0B8VyvPL2U
         Iv8YH0hD3OChdRXuN/tKGizF/BYW6s2ZJ2SS9yssErCQ+I2g3JTmAwebgU9qN0DAPMTi
         7O/nG6H2LDWIQAhP4bPCwiogIfxYcAeclpb+/YewSBC/38vf0gz/Ebeuhh44TFojxgG6
         t/ZaBopJHwXigSTAaKcFyPJIgEhZS252jybhG37Ev/CMPTWcQekloVkg4k3NT8csaK9q
         EK2A==
X-Gm-Message-State: AOJu0Yw709kUSUsMmMsFTQgEjhAfhYZNk+2Y1Of8Q6fDp9MfQUnHfqwE
	2ibEjTL9+5q2oPcmvDShj5HF8VN8MQrP4LuBb98=
X-Google-Smtp-Source: AGHT+IGglQ+ancHiwnwqbc5KazxsT6tMqQJwuyFrBD+wUcEKORvPu7c33njI8XaQWr8Z51mXGECC+ccQtk8M1pYE4cc=
X-Received: by 2002:a05:6512:4016:b0:507:a6f8:b373 with SMTP id
 br22-20020a056512401600b00507a6f8b373mr3433358lfb.54.1697579532229; Tue, 17
 Oct 2023 14:52:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231013182644.2346458-1-song@kernel.org> <20231013182644.2346458-2-song@kernel.org>
 <CAEf4BzYbQzMU4T6KYt4UudXvZiPg4nQdQCxD9zqzoJLgqOE9bQ@mail.gmail.com> <0ABF7860-A331-4161-9599-C781E9650283@fb.com>
In-Reply-To: <0ABF7860-A331-4161-9599-C781E9650283@fb.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Tue, 17 Oct 2023 14:52:01 -0700
Message-ID: <CAEf4BzaNA18CpG-E-OUynEZuhGoQsieyzTVTkVOF9qB=j4u+yA@mail.gmail.com>
Subject: Re: [PATCH bpf-next 1/5] bpf: Add kfunc bpf_get_file_xattr
To: Song Liu <songliubraving@meta.com>
Cc: Song Liu <song@kernel.org>, bpf <bpf@vger.kernel.org>, 
	"fsverity@lists.linux.dev" <fsverity@lists.linux.dev>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@kernel.org>, Kernel Team <kernel-team@meta.com>, 
	Eric Biggers <ebiggers@kernel.org>, "tytso@mit.edu" <tytso@mit.edu>, 
	"roberto.sassu@huaweicloud.com" <roberto.sassu@huaweicloud.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 17, 2023 at 1:31=E2=80=AFPM Song Liu <songliubraving@meta.com> =
wrote:
>
>
>
> > On Oct 17, 2023, at 11:58=E2=80=AFAM, Andrii Nakryiko <andrii.nakryiko@=
gmail.com> wrote:
> >
> > On Fri, Oct 13, 2023 at 11:29=E2=80=AFAM Song Liu <song@kernel.org> wro=
te:
> >>
> >> This kfunc can be used to read xattr of a file.
> >>
> >> Since vfs_getxattr() requires null-terminated string as input "name", =
a new
> >> helper bpf_dynptr_is_string() is added to check the input before calli=
ng
> >> vfs_getxattr().
> >>
> >> Signed-off-by: Song Liu <song@kernel.org>
> >> ---
> >> include/linux/bpf.h      | 12 +++++++++++
> >> kernel/trace/bpf_trace.c | 44 ++++++++++++++++++++++++++++++++++++++++
> >> 2 files changed, 56 insertions(+)
> >>
> >> diff --git a/include/linux/bpf.h b/include/linux/bpf.h
> >> index 61bde4520f5c..f14fae45e13d 100644
> >> --- a/include/linux/bpf.h
> >> +++ b/include/linux/bpf.h
> >> @@ -2472,6 +2472,13 @@ static inline bool has_current_bpf_ctx(void)
> >>        return !!current->bpf_ctx;
> >> }
> >>
> >> +static inline bool bpf_dynptr_is_string(struct bpf_dynptr_kern *ptr)
> >
> > is_zero_terminated would be more accurate? though there is nothing
> > really dynptr-specific here...
>
> is_zero_terminated sounds better.
>
> >
> >> +{
> >> +       char *str =3D ptr->data;
> >> +
> >> +       return str[__bpf_dynptr_size(ptr) - 1] =3D=3D '\0';
> >> +}
> >> +
> >> void notrace bpf_prog_inc_misses_counter(struct bpf_prog *prog);
> >>
> >> void bpf_dynptr_init(struct bpf_dynptr_kern *ptr, void *data,
> >> @@ -2708,6 +2715,11 @@ static inline bool has_current_bpf_ctx(void)
> >>        return false;
> >> }
> >>
> >> +static inline bool bpf_dynptr_is_string(struct bpf_dynptr_kern *ptr)
> >> +{
> >> +       return false;
> >> +}
> >> +
> >> static inline void bpf_prog_inc_misses_counter(struct bpf_prog *prog)
> >> {
> >> }
> >> diff --git a/kernel/trace/bpf_trace.c b/kernel/trace/bpf_trace.c
> >> index df697c74d519..946268574e05 100644
> >> --- a/kernel/trace/bpf_trace.c
> >> +++ b/kernel/trace/bpf_trace.c
> >> @@ -24,6 +24,7 @@
> >> #include <linux/key.h>
> >> #include <linux/verification.h>
> >> #include <linux/namei.h>
> >> +#include <linux/fileattr.h>
> >>
> >> #include <net/bpf_sk_storage.h>
> >>
> >> @@ -1429,6 +1430,49 @@ static int __init bpf_key_sig_kfuncs_init(void)
> >> late_initcall(bpf_key_sig_kfuncs_init);
> >> #endif /* CONFIG_KEYS */
> >>
> >> +/* filesystem kfuncs */
> >> +__diag_push();
> >> +__diag_ignore_all("-Wmissing-prototypes",
> >> +                 "kfuncs which will be used in BPF programs");
> >> +
> >> +/**
> >> + * bpf_get_file_xattr - get xattr of a file
> >> + * @name_ptr: name of the xattr
> >> + * @value_ptr: output buffer of the xattr value
> >> + *
> >> + * Get xattr *name_ptr* of *file* and store the output in *value_ptr*=
.
> >> + *
> >> + * Return: 0 on success, a negative value on error.
> >> + */
> >> +__bpf_kfunc int bpf_get_file_xattr(struct file *file, struct bpf_dynp=
tr_kern *name_ptr,
> >> +                                  struct bpf_dynptr_kern *value_ptr)
> >> +{
> >> +       if (!bpf_dynptr_is_string(name_ptr))
> >> +               return -EINVAL;
> >
> > so dynptr can be invalid and name_ptr->data will be NULL, you should
> > account for that
>
> We can add a NULL check (or size check) here.

there must be some helper to check if dynptr is valid, let's use that
instead of NULL checks

>
> >
> > and there could also be special dynptrs that don't have contiguous
> > memory region, so somehow you'd need to take care of that as well
>
> We can require the dynptr to be BPF_DYNPTR_TYPE_LOCAL. I don't think
> we need this for dynptr of skb or xdp. Would this be sufficient?

well, to keep thing simple we can have a simple internal helper API
that will tell if it's safe to assume that dynptr memory is contiguous
and it's ok to use dynptr memory. But still, you shouldn't access data
pointer directly, there must be some helper for that. Please check. It
has to take into account offset and stuff like that.


Also, and separately from that, we should think about providing a
bpf_dynptr_slice()-like helper that will accept a fixed-sized
temporary buffer and return pointer to either actual memory or copy
non-contiguous memory into that buffer. That will make sure you can
use any dynptr as a source of data, and only pay the price of memory
copy in rare cases where it's necessary

>
> Thanks,
> Song
>
> >
> >> +
> >> +       return vfs_getxattr(mnt_idmap(file->f_path.mnt), file_dentry(f=
ile), name_ptr->data,
> >> +                           value_ptr->data, __bpf_dynptr_size(value_p=
tr));
> >> +}
>
