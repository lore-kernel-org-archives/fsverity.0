Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F268D24A00
	for <fsverity@lists.linux.dev>; Fri,  3 Nov 2023 22:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ayXwrG6f"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-99bdeae1d0aso407392866b.1
        for <fsverity@lists.linux.dev>; Fri, 03 Nov 2023 15:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699052040; x=1699656840; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PDjO6lIkMKFXpFrGVUwAbyrybMO4fvAZwVAGS0l+WqA=;
        b=ayXwrG6fl0FmfYgq6gmiu11aR9FvuGYM8e9rDLFv2Ui9FO33n8UCoAKQkzmUNBU5n6
         NsAXlFSqFgg+wrykP0HP/ivCvNxgMx3r537ta4TpGzON9oIiXgQmk5/BTc7y2A8bI/E+
         xQR7ag90MhivZOwKQSl/12JcxznHP362DwLcSOLWrGE1XxPZryzvwqS+/235yaGNO1ml
         zP8gThZnfNow2q/EDpKCpeVOJHa3BCrmgMrvJKUxXg3frw3USZ+B6xx+vaaP9EDFUzxW
         M30CZ+3Z4duPL4iGJdfmR6BCVD5j5nWOtbXQ85MPT2DaoGCxHXKJsguEynV6P35uGmmC
         17/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699052040; x=1699656840;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PDjO6lIkMKFXpFrGVUwAbyrybMO4fvAZwVAGS0l+WqA=;
        b=J3RcnyRxlyDaZ7aYIP6TY2zNbTML4K9sjeCS/jqCSkDJncTvYHnIammYeQILkmBmCX
         KDDT1R+kniepqI8/Bh7kaxYPjj3OEyYnqli/ZASm3rj+v7nR9A0IwB8i+Y9XhfVb7ctk
         hDlx6j3jezqFybEnhI3w1Xk6YosseH2vAYm5Pc1XtMuS2Dyt31jDRG/3dmjVj5EHJ3Hg
         2NM6flFE06dq8+68wWuzgbku/AZDaIWX55Udso8DQ9j0XVrqnq9hZpYGsU4mg5Euk3au
         ryIJiCvfNKG7T4DQV4uQlaLcKOBDfrTcELg6eLG2+4FjEKaTHupW+0P01+3lgo5LV+yB
         iF4A==
X-Gm-Message-State: AOJu0YzQKZCj1vPXA5m1AenkCCDHAQOj8TW4i0+FlP7Z9+XhXwJX21jw
	DYWaMhHbEH1wUUeD2unMJJiAJvGN/+XNuJE/3xcLqrO2
X-Google-Smtp-Source: AGHT+IHDfOPEkBEKXx+ucASoxCb5eKpB87iaOs7N/oNTA0+13giMgN/gRU+ZR+yYWQZ2Y+Ag/alK0b06Mn4HFH385lw=
X-Received: by 2002:a17:907:7f19:b0:9bd:fe2f:3949 with SMTP id
 qf25-20020a1709077f1900b009bdfe2f3949mr9232237ejc.51.1699052040506; Fri, 03
 Nov 2023 15:54:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231103214535.2674059-1-song@kernel.org> <20231103214535.2674059-5-song@kernel.org>
 <CAEf4BzY2V1Q_V=JMV4uYqHCSnV0ZDsAaLNq6cm0CPt2d8E4XGA@mail.gmail.com>
 <CAPhsuW6yG8zL12KcjZQOB5Q9YbUdf5T3cxyzMx_GF3v_uw=LXA@mail.gmail.com> <CAPhsuW5Y4=e5Zhhcc2J+O55AVuuSAF=YfajqOiuE8VZyXbxvkQ@mail.gmail.com>
In-Reply-To: <CAPhsuW5Y4=e5Zhhcc2J+O55AVuuSAF=YfajqOiuE8VZyXbxvkQ@mail.gmail.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Fri, 3 Nov 2023 15:53:49 -0700
Message-ID: <CAEf4Bzbe0mW9ETZbFzn_XH6v=J1_4ZijvGFsTQRodKJ=0skrnA@mail.gmail.com>
Subject: Re: [PATCH v10 bpf-next 4/9] bpf: Add kfunc bpf_get_file_xattr
To: Song Liu <song@kernel.org>
Cc: bpf@vger.kernel.org, fsverity@lists.linux.dev, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, martin.lau@kernel.org, 
	kernel-team@meta.com, ebiggers@kernel.org, tytso@mit.edu, 
	roberto.sassu@huaweicloud.com, kpsingh@kernel.org, vadfed@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 3, 2023 at 3:38=E2=80=AFPM Song Liu <song@kernel.org> wrote:
>
> On Fri, Nov 3, 2023 at 3:30=E2=80=AFPM Song Liu <song@kernel.org> wrote:
> >
> > On Fri, Nov 3, 2023 at 3:10=E2=80=AFPM Andrii Nakryiko
> > <andrii.nakryiko@gmail.com> wrote:
> > >
> > > On Fri, Nov 3, 2023 at 2:46=E2=80=AFPM Song Liu <song@kernel.org> wro=
te:
> > > >
> > > > It is common practice for security solutions to store tags/labels i=
n
> > > > xattrs. To implement similar functionalities in BPF LSM, add new kf=
unc
> > > > bpf_get_file_xattr().
> > > >
> > > > The first use case of bpf_get_file_xattr() is to implement file
> > > > verifications with asymmetric keys. Specificially, security applica=
tions
> > > > could use fsverity for file hashes and use xattr to store file sign=
atures.
> > > > (kfunc for fsverity hash will be added in a separate commit.)
> > > >
> > > > Currently, only xattrs with "user." prefix can be read with kfunc
> > > > bpf_get_file_xattr(). As use cases evolve, we may add a dedicated p=
refix
> > > > for bpf_get_file_xattr().
> > > >
> > > > To avoid recursion, bpf_get_file_xattr can be only called from LSM =
hooks.
> > > >
> > > > Signed-off-by: Song Liu <song@kernel.org>
> > > > ---
> > > >  kernel/trace/bpf_trace.c | 64 ++++++++++++++++++++++++++++++++++++=
++++
> > > >  1 file changed, 64 insertions(+)
> > > >
> > > > diff --git a/kernel/trace/bpf_trace.c b/kernel/trace/bpf_trace.c
> > > > index bfe6fb83e8d0..82eaa099053b 100644
> > > > --- a/kernel/trace/bpf_trace.c
> > > > +++ b/kernel/trace/bpf_trace.c
> > > > @@ -24,6 +24,7 @@
> > > >  #include <linux/key.h>
> > > >  #include <linux/verification.h>
> > > >  #include <linux/namei.h>
> > > > +#include <linux/fileattr.h>
> > > >
> > > >  #include <net/bpf_sk_storage.h>
> > > >
> > > > @@ -1431,6 +1432,69 @@ static int __init bpf_key_sig_kfuncs_init(vo=
id)
> > > >  late_initcall(bpf_key_sig_kfuncs_init);
> > > >  #endif /* CONFIG_KEYS */
> > > >
> > > > +/* filesystem kfuncs */
> > > > +__diag_push();
> > > > +__diag_ignore_all("-Wmissing-prototypes",
> > > > +                 "kfuncs which will be used in BPF programs");
> > > > +
> > >
> > > please use __bpf_kfunc_{start,end}_defs macros, from [0]
> > >
> > >   [0] https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf.git/com=
mit/?id=3D391145ba2acc
> >
> > Nice! I was thinking about the same issue (-Wmissing-declarations).
> >
> > But this patch is not pulled into bpf-next yet (only in bpf). How about=
 we keep
> > __diag_ignore_all() etc for now?
>
> I will add __diag_ignore_all("-Wmissing-declarations",) so it is
> equivalent to the marcos.

Ah, it's bpf tree, not bpf-next, I see. Ok, we'll have to leave it as
is for now and then clean up later.

>
> Thanks,
> Song
