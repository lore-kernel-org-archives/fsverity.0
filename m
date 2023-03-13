Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58DD88F4E
	for <fsverity@lists.linux.dev>; Mon, 13 Mar 2023 23:08:12 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id j19-20020a05600c191300b003eb3e1eb0caso11975920wmq.1
        for <fsverity@lists.linux.dev>; Mon, 13 Mar 2023 16:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1678748890;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gCAgZtvsvzEwpyf+tDTv88lry9y+fkPb0SFZ89lPlIY=;
        b=U6ICPpoPPnsA6GsxHGPXzbQn2+EEE6xLdbLQfH0Zm21MgYRzBEptOazyKUi2PCUrIm
         VTG7ywGv7Q/POGk0pJFJw6vo8Z43W9rWiLHzTtkDUqDwCn/+n/Xzuj/W636hqcU97SbO
         eKhU0EQTzSy3uj/lXi1FFFOsV1YedONHfnVjEipSceLLEWprp0+uuy40fMLIannRlbVI
         SZp6yhGjMZrFRgPkL4MpjiyD95VvegFGfEq/6Xab6UGsfzs5Sq9oMkTdaPhgcGA4polx
         Gfew9da7JTsYxxU6xUFcN0IXinXBI1j1X2ZKFLl2EIeYj8GseDysmHFY+43ueyMHTtry
         +wVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678748890;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gCAgZtvsvzEwpyf+tDTv88lry9y+fkPb0SFZ89lPlIY=;
        b=ZfnVPd3Hd4wj2YXUHCRjqPlDWF4Qb4ZdUYouQoBNj0E/ccg9YwR7/KUF4uNsh1m4wO
         zLYFK4lIBc1hlwW10F7dMlV0NKhZOcaDzZ9UB2iHK1eK5Vp5j6z4ZGCKWNPceAzw28Lx
         HvKlQ9SbfV145Eo99uvIvdKG6OjUD7d3eJMPlYyu4qG25eOdbndqqe+N4GNjNzFMUrJU
         ZksC/3SuZ4GkhpsoqY5d/LL1oX0hK7tL+wSgdoTIa6hWiLtULFeaTKN3t772qWMy4Wjk
         jOi5mk5jT9EcvdpjQ3NpVdZaUd6r5mzhlxmxYNf/qphTOFTbrNM3xyKOd1Xlkr6VFtd0
         Of/g==
X-Gm-Message-State: AO0yUKWgoEanEqNms80MxkPnwWK0WM5ngxEQ3u4TiQ57HKKp1+3r++1j
	Aht3w+NyFxUIprXxtIhS3v3n1m2z7eAIHvS1V6+VOA==
X-Google-Smtp-Source: AK7set9NFQkbop6nJgcwtia/x3RdY5/3UU85190ckqLwVyrIVh+aws8dF2LEUlwSbgMaOHOssSbOdj/4KqZebXkzEWw=
X-Received: by 2002:a05:600c:4709:b0:3e2:2107:b7f2 with SMTP id
 v9-20020a05600c470900b003e22107b7f2mr3569275wmo.6.1678748890480; Mon, 13 Mar
 2023 16:08:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230310193325.620493-1-nhuck@google.com> <ZA+qt0gakiyAoacr@sol.localdomain>
In-Reply-To: <ZA+qt0gakiyAoacr@sol.localdomain>
From: Nathan Huckleberry <nhuck@google.com>
Date: Mon, 13 Mar 2023 16:07:59 -0700
Message-ID: <CAJkfWY5eg2wLMUKUL5whU6zoHFogiUna1NPE+W8fPHm8YS-ReA@mail.gmail.com>
Subject: Re: [PATCH v2] fsverity: Remove WQ_UNBOUND from fsverity read workqueue
To: Eric Biggers <ebiggers@kernel.org>
Cc: "Theodore Y. Ts'o" <tytso@mit.edu>, fsverity@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Eric.

On Mon, Mar 13, 2023 at 3:59=E2=80=AFPM Eric Biggers <ebiggers@kernel.org> =
wrote:
>
> On Fri, Mar 10, 2023 at 11:33:25AM -0800, Nathan Huckleberry wrote:
> > WQ_UNBOUND causes significant scheduler latency on ARM64/Android.  This
> > is problematic for latency sensitive workloads, like I/O
> > post-processing.
> >
> > Removing WQ_UNBOUND gives a 96% reduction in fsverity workqueue related
> > scheduler latency and improves app cold startup times by ~30ms.
> > WQ_UNBOUND was also removed from the dm-verity workqueue for the same
> > reason [1].
> >
> > This code was tested by running Android app startup benchmarks and
> > measuring how long the fsverity workqueue spent in the runnable state.
> >
> > Before
> > Total workqueue scheduler latency: 553800us
> > After
> > Total workqueue scheduler latency: 18962us
> >
> > [1]: https://lore.kernel.org/all/20230202012348.885402-1-nhuck@google.c=
om/
> >
> > Signed-off-by: Nathan Huckleberry <nhuck@google.com>
> > ---
> > Changelog:
> > v1 -> v2:
> > - Added comment about WQ_UNBOUND
> > - Added info about related dm-verity patches in commit message
> >
> >  fs/verity/verify.c | 10 +++++-----
> >  1 file changed, 5 insertions(+), 5 deletions(-)
> >
> > diff --git a/fs/verity/verify.c b/fs/verity/verify.c
> > index f50e3b5b52c9..782b8b4a24c1 100644
> > --- a/fs/verity/verify.c
> > +++ b/fs/verity/verify.c
> > @@ -387,15 +387,15 @@ EXPORT_SYMBOL_GPL(fsverity_enqueue_verify_work);
> >  int __init fsverity_init_workqueue(void)
> >  {
> >       /*
> > -      * Use an unbound workqueue to allow bios to be verified in paral=
lel
> > -      * even when they happen to complete on the same CPU.  This sacri=
fices
> > -      * locality, but it's worthwhile since hashing is CPU-intensive.
> > -      *
> >        * Also use a high-priority workqueue to prioritize verification =
work,
> >        * which blocks reads from completing, over regular application t=
asks.
> > +      *
> > +      * This workqueue is not marked as unbound for performance reason=
s.
> > +      * Using an unbound workqueue for crypto operations causes excess=
ive
> > +      * scheduler latency on ARM64.
> >        */
> >       fsverity_read_workqueue =3D alloc_workqueue("fsverity_read_queue"=
,
> > -                                               WQ_UNBOUND | WQ_HIGHPRI=
,
> > +                                               WQ_HIGHPRI,
> >                                                 num_online_cpus());
>
> Applied to https://git.kernel.org/pub/scm/fs/fsverity/linux.git/log/?h=3D=
for-next
>
> I adjusted the comment slightly so that the first paragraph doesn't start=
 with
> "Also".
>
> - Eric
