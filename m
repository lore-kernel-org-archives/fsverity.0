Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF571DFC5
	for <fsverity@lists.linux.dev>; Thu,  2 Nov 2023 17:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I3rwCd9J"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-9adb9fa7200so243543466b.0
        for <fsverity@lists.linux.dev>; Thu, 02 Nov 2023 10:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698945388; x=1699550188; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gd2Fs3GfhrEEJME/1JQNTfULynbPV+EasVl0KfnSo0g=;
        b=I3rwCd9JDBZvftuCoSNtL1HUdrlEnfDZ4u+/8/wO7z1a+uqFaxGqqGWcYxyzbqmnYA
         0pLH34q3dkUNxYU0f06MwxfwMlLejFOHq+1MhfyDjcXoduRamp9Mpc8JdR5n0cUI+4pX
         NS/Ios3vLO2AIB4cfZOMyeRztxutIrRT3NR8BEHHC47wApapqyU54IC5RlgvHsFpTaCb
         KXD9NgQuO0PWLcHaLV6jqMVc/BRbozx/uYnYu31HFn9DKBdD1TN10gg77XmvLBoUzaZB
         bdforYi/8jJa5mFQqb2DGY49guCkMmIp5KAuO3Ix1c7ZS14wF7CpnUAi15sS/EugSLN5
         zqCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698945388; x=1699550188;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gd2Fs3GfhrEEJME/1JQNTfULynbPV+EasVl0KfnSo0g=;
        b=dbjz6rtdfNp/N+BGRY47YhnGOQizp7HurxkkRbzDK7h8+moxLWnGejpoxsSHah80Bm
         7tb8R3Be+xVSc++UtxZ7AzEx31B3kphPZMv/WgoHCWC2o4GjidS+E/hqv/KfjnCaVK/R
         xTh7ASAspu7Tr3bngz0JhqPT2NT9TRaIG4TWNBCzFvU6mDW2r5SVzDskxAMc/L8i4q9x
         fEXidYLbkyj91Tsn4Js+i9NwSxC980LKTjRIRLaSlVpIx0dZ3OQBsYzzCABmR1/+xW1K
         M7n8pB6cM1P8ZPABe6q3IY9QCitX1fOxV95re8JrCfQsNWKhPDAEax2OSAKQLLJe/HR+
         em1w==
X-Gm-Message-State: AOJu0YzsrduGulwGKaoN6n6ijABxve93lCACVaDPGYjJJP8d0ESmM5MY
	b0OloiB8+EiHHjw3qImAEftg6aFMMuOmRZxatBQ=
X-Google-Smtp-Source: AGHT+IFmj6ncFqt7SUbCMeywVPQb8uDH5NpTMbtGAf7UXDd/+Hus/PLPbJRJnWModdcLjyPcoQY+WKqeOPoKCBxVv94=
X-Received: by 2002:a17:906:f190:b0:9c7:6523:407b with SMTP id
 gs16-20020a170906f19000b009c76523407bmr115498ejb.17.1698945388260; Thu, 02
 Nov 2023 10:16:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231024235551.2769174-1-song@kernel.org> <20231024235551.2769174-2-song@kernel.org>
 <CAEf4Bzbr8dgksh2z+4nEkAFdV9gquhR+HROULKdTkWrUpSM9-Q@mail.gmail.com> <CAEf4BzbDFDX30Y_Hcmd__hgDp+m6X+htr-wTeBtaoauEnrEdLw@mail.gmail.com>
In-Reply-To: <CAEf4BzbDFDX30Y_Hcmd__hgDp+m6X+htr-wTeBtaoauEnrEdLw@mail.gmail.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Thu, 2 Nov 2023 10:16:16 -0700
Message-ID: <CAEf4BzaD+FV_PM8_4yWnZVed9pXE-KX6CwpYEmiUDpMRQDNEXQ@mail.gmail.com>
Subject: Re: [PATCH v6 bpf-next 1/9] bpf: Expose bpf_dynptr_slice* kfuncs for
 in kernel use
To: Song Liu <song@kernel.org>
Cc: bpf@vger.kernel.org, fsverity@lists.linux.dev, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, martin.lau@kernel.org, 
	kernel-team@meta.com, ebiggers@kernel.org, tytso@mit.edu, 
	roberto.sassu@huaweicloud.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 2, 2023 at 10:09=E2=80=AFAM Andrii Nakryiko
<andrii.nakryiko@gmail.com> wrote:
>
> On Thu, Nov 2, 2023 at 9:56=E2=80=AFAM Andrii Nakryiko
> <andrii.nakryiko@gmail.com> wrote:
> >
> > On Tue, Oct 24, 2023 at 4:56=E2=80=AFPM Song Liu <song@kernel.org> wrot=
e:
> > >
> > > kfuncs bpf_dynptr_slice and bpf_dynptr_slice_rdwr are used by BPF pro=
grams
> > > to access the dynptr data. They are also useful for in kernel functio=
ns
> > > that access dynptr data, for example, bpf_verify_pkcs7_signature.
> > >
> > > Add bpf_dynptr_slice and bpf_dynptr_slice_rdwr to bpf.h so that kerne=
l
> > > functions can use them instead of accessing dynptr->data directly.
> > >
> > > Update bpf_verify_pkcs7_signature to use bpf_dynptr_slice instead of
> > > dynptr->data.
> > >
> > > Also, update the comments for bpf_dynptr_slice and bpf_dynptr_slice_r=
dwr
> > > that they may return error pointers for BPF_DYNPTR_TYPE_XDP.
> > >
> > > Signed-off-by: Song Liu <song@kernel.org>
> > > ---
> > >  include/linux/bpf.h      |  4 ++++
> > >  kernel/bpf/helpers.c     | 16 ++++++++--------
> > >  kernel/trace/bpf_trace.c | 15 +++++++++++----
> > >  3 files changed, 23 insertions(+), 12 deletions(-)
> > >
> > > diff --git a/include/linux/bpf.h b/include/linux/bpf.h
> > > index b4825d3cdb29..3ed3ae37cbdf 100644
> > > --- a/include/linux/bpf.h
> > > +++ b/include/linux/bpf.h
> > > @@ -1222,6 +1222,10 @@ enum bpf_dynptr_type {
> > >
> > >  int bpf_dynptr_check_size(u32 size);
> > >  u32 __bpf_dynptr_size(const struct bpf_dynptr_kern *ptr);
> > > +void *bpf_dynptr_slice(const struct bpf_dynptr_kern *ptr, u32 offset=
,
> > > +                      void *buffer__opt, u32 buffer__szk);
> > > +void *bpf_dynptr_slice_rdwr(const struct bpf_dynptr_kern *ptr, u32 o=
ffset,
> > > +                           void *buffer__opt, u32 buffer__szk);
> > >
> > >  #ifdef CONFIG_BPF_JIT
> > >  int bpf_trampoline_link_prog(struct bpf_tramp_link *link, struct bpf=
_trampoline *tr);
> > > diff --git a/kernel/bpf/helpers.c b/kernel/bpf/helpers.c
> > > index e46ac288a108..af5059f11e83 100644
> > > --- a/kernel/bpf/helpers.c
> > > +++ b/kernel/bpf/helpers.c
> > > @@ -2270,10 +2270,10 @@ __bpf_kfunc struct task_struct *bpf_task_from=
_pid(s32 pid)
> > >   * bpf_dynptr_slice will not invalidate any ctx->data/data_end point=
ers in
> > >   * the bpf program.
> > >   *
> > > - * Return: NULL if the call failed (eg invalid dynptr), pointer to a=
 read-only
> > > - * data slice (can be either direct pointer to the data or a pointer=
 to the user
> > > - * provided buffer, with its contents containing the data, if unable=
 to obtain
> > > - * direct pointer)
> > > + * Return: NULL or error pointer if the call failed (eg invalid dynp=
tr), pointer
> >
> > Hold on, nope, this one shouldn't return error pointer because it's
> > used from BPF program side and BPF program is checking for NULL only.
> > Does it actually return error pointer, though?
>
> So I just checked the code (should have done it before replying,
> sorry). It is a bug that slipped through when adding bpf_xdp_pointer()
> usage. We should always return NULL from this kfunc on error
> conditions. Let's fix it separately, but please don't change the
> comments.
>
> >
> > I'm generally skeptical of allowing to call kfuncs directly from
> > internal kernel code, tbh, and concerns like this are one reason why.
> > BPF verifier sets up various conditions that kfuncs have to follow,
> > and it seems error-prone to mix this up with internal kernel usage.
> >
>
> Reading bpf_dynptr_slice_rdwr code, it does look exactly like what you
> want, despite the confusingly-looking 0, NULL, 0 arguments. So I guess
> I'm fine exposing it directly, but it still feels like it will bite us
> at some point later.

Ok, now I'm at patch #5. Think about what you are doing here. You are
asking bpf_dynptr_slice_rdrw() if you can get a directly writable
pointer to a data area of length *zero*. So if it's SKB, for example,
then yeah, you'll be granted a pointer. But then you are proceeding to
write up to sizeof(struct fsverity_digest) bytes, and that can cross
into non-contiguous memory.

So I'll take it back, let's not expose this kfunc directly to kernel
code. Let's have a separate internal helper that will return either
valid pointer or NULL for a given dynptr, but will require valid
non-zero max size. Something with the signature like below

void * __bpf_dynptr_data_rw(const struct bpf_dynptr_kern *ptr, u32 len);

If ptr can provide a direct pointer to memory of length *len*, great.
If not, return NULL. This will be an appropriate internal API for all
the use cases you are adding where we will be writing back into dynptr
from other kernel APIs with the assumption of contiguous memory
region.



>
>
> > > + * to a read-only data slice (can be either direct pointer to the da=
ta or a
> > > + * pointer to the user provided buffer, with its contents containing=
 the data,
> > > + * if unable to obtain direct pointer)
> > >   */
> > >  __bpf_kfunc void *bpf_dynptr_slice(const struct bpf_dynptr_kern *ptr=
, u32 offset,
> > >                                    void *buffer__opt, u32 buffer__szk=
)
> > > @@ -2354,10 +2354,10 @@ __bpf_kfunc void *bpf_dynptr_slice(const stru=
ct bpf_dynptr_kern *ptr, u32 offset
> > >   * bpf_dynptr_slice_rdwr will not invalidate any ctx->data/data_end =
pointers in
> > >   * the bpf program.
> > >   *
> > > - * Return: NULL if the call failed (eg invalid dynptr), pointer to a
> > > - * data slice (can be either direct pointer to the data or a pointer=
 to the user
> > > - * provided buffer, with its contents containing the data, if unable=
 to obtain
> > > - * direct pointer)
> > > + * Return: NULL or error pointer if the call failed (eg invalid dynp=
tr), pointer
> > > + * to a data slice (can be either direct pointer to the data or a po=
inter to the
> > > + * user provided buffer, with its contents containing the data, if u=
nable to
> > > + * obtain direct pointer)
> > >   */
> > >  __bpf_kfunc void *bpf_dynptr_slice_rdwr(const struct bpf_dynptr_kern=
 *ptr, u32 offset,
> > >                                         void *buffer__opt, u32 buffer=
__szk)
> > > diff --git a/kernel/trace/bpf_trace.c b/kernel/trace/bpf_trace.c
> > > index df697c74d519..2626706b6387 100644
> > > --- a/kernel/trace/bpf_trace.c
> > > +++ b/kernel/trace/bpf_trace.c
> > > @@ -1378,6 +1378,7 @@ __bpf_kfunc int bpf_verify_pkcs7_signature(stru=
ct bpf_dynptr_kern *data_ptr,
> > >                                struct bpf_dynptr_kern *sig_ptr,
> > >                                struct bpf_key *trusted_keyring)
> > >  {
> > > +       void *data, *sig;
> > >         int ret;
> > >
> > >         if (trusted_keyring->has_ref) {
> > > @@ -1394,10 +1395,16 @@ __bpf_kfunc int bpf_verify_pkcs7_signature(st=
ruct bpf_dynptr_kern *data_ptr,
> > >                         return ret;
> > >         }
> > >
> > > -       return verify_pkcs7_signature(data_ptr->data,
> > > -                                     __bpf_dynptr_size(data_ptr),
> > > -                                     sig_ptr->data,
> > > -                                     __bpf_dynptr_size(sig_ptr),
> > > +       data =3D bpf_dynptr_slice(data_ptr, 0, NULL, 0);
> > > +       if (IS_ERR(data))
> > > +               return PTR_ERR(data);
> > > +
> > > +       sig =3D bpf_dynptr_slice(sig_ptr, 0, NULL, 0);
> > > +       if (IS_ERR(sig))
> > > +               return PTR_ERR(sig);
> > > +
> > > +       return verify_pkcs7_signature(data, __bpf_dynptr_size(data_pt=
r),
> > > +                                     sig, __bpf_dynptr_size(sig_ptr)=
,
> > >                                       trusted_keyring->key,
> > >                                       VERIFYING_UNSPECIFIED_SIGNATURE=
, NULL,
> > >                                       NULL);
> > > --
> > > 2.34.1
> > >
> > >
