Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87687BA27
	for <fsverity@lists.linux.dev>; Fri, 16 Jun 2023 08:12:49 +0000 (UTC)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-44098ef627eso11306137.2
        for <fsverity@lists.linux.dev>; Fri, 16 Jun 2023 01:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686903168; x=1689495168;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fv+7INReWev0Yt8OtSlRVi4n8fPYkR08IfepHUzN7bg=;
        b=MJaEeOUYZubOR9MPoytvEhceGtCLa9si8AcI6VQ2UZ1CE1l8NnPB03mrSzlPI7rN3C
         7NB/yUu38X7zramr3Z2nCIon1J5WhE53Cg1JejLuzBpeWYrgeyzrtltOzwMB8G72JLhB
         PT5SJCxhhSUIdrfP6qCpmSy5ZgmyxuMDH5htuI+UAWIHxg8hc23b5sMmw1VsWtYNexCE
         mDs8/9ABdPiT1rjHNxgTDiDkFpyTfG7g/UW3M3I9IuvcfY2NBQt07C+TVkHJxTw6sY/p
         FvFpWI3LlIOhELITAwVpdhjRRpcQ3d1FCzY1QV7DKTcQmOoK4UhLs6c4Yh0488RxOQDV
         6lbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686903168; x=1689495168;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fv+7INReWev0Yt8OtSlRVi4n8fPYkR08IfepHUzN7bg=;
        b=b121vb4EXoP6K+getDKN3gR8LdloFnzu2bmHO7BMOk7HG6+d3S2+ON7e8UaJ28Z+O9
         ZjFwLdiFlkKk93zqB9pikVpIehJZcczO31t6VFOIzMsB3oIJl3q1LmO28RPcMTWHarGc
         dumVWzpghuq7KlEH0rM+LoJYGr3o5xjlSjMZA/WX316tPAx1Gs3lbUSUZndzapb0mA4z
         4gCBt/AiJK+zsc8UzVAfI3mOfxyc1P+xTu/+OvgEgg7gP4LvoHRk/X8NUU/OAFFIezuN
         vHC1Vfdw/UNrzXhh96uL7U8RZxDkD89ySN8vcya88y9q2dUl7cXCdz09cwV8cejpqjxA
         LpeA==
X-Gm-Message-State: AC+VfDzfwOoehHWGntXUBegh96su8K5pggU1txWDHl/cNRjpXIVlIxGf
	kJZyeXtuF+ZXpk54u0F7xwBIxUeMbx55XNSt+tM=
X-Google-Smtp-Source: ACHHUZ5nemZrOhAY+r852jkZH9MBHs5gfu2ifH2nZH2BZETYAdL6YTx6aZ1Uny0UvrNPKH88EnRebxBmkhAnf7tK2h4=
X-Received: by 2002:a05:6102:e52:b0:43c:8c56:14a9 with SMTP id
 p18-20020a0561020e5200b0043c8c5614a9mr1250087vst.9.1686903168190; Fri, 16 Jun
 2023 01:12:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1683102959.git.alexl@redhat.com> <b58e57955e122b5d6c4e087cf2dd6ed664152c7b.1683102959.git.alexl@redhat.com>
 <20230514191647.GD9528@sol.localdomain> <CAOQ4uxhEq8u37YNnqQmLbybJy1Kkg3Qk0TVtRZQP-yHt8CMmWA@mail.gmail.com>
 <CAL7ro1Hqc29w-FuRuoEfcsxiXTnqqwHP73nwvmZRuKVRsz4D9w@mail.gmail.com>
 <CAOQ4uxh_y+YO3q7dB=ALCriq31RhapOHGt+jcXTQbOC7iVqYTw@mail.gmail.com>
 <CAL7ro1GTzJy5Nv1vH0buVEXUnUk7cXBhSJB2ap8Jt_hutk7nYw@mail.gmail.com>
 <CAOQ4uxgbMD2RdEqta7a2t3uVceLuZDxOWA9SBNDAgZSdO_532Q@mail.gmail.com>
 <CAL7ro1FF_q7FEJdevWrqvugkJ9S8bU5MxcoHHrLC3D834u4+zQ@mail.gmail.com>
 <CAOQ4uxgo9LOM3minBH0vw3huxjrHmO5O-caGfhgOUGCuT0B9Vg@mail.gmail.com>
 <20230616052444.GA181948@sol.localdomain> <CAOQ4uxjBfPvDb5921vV+jO1wtgoeWenEietmK6orP7Bh+gROqw@mail.gmail.com>
 <CAL7ro1FSPYL=P+h_qUXw=NHzPx89vR24dbZc8UOtVeYMqg5xrw@mail.gmail.com>
In-Reply-To: <CAL7ro1FSPYL=P+h_qUXw=NHzPx89vR24dbZc8UOtVeYMqg5xrw@mail.gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 16 Jun 2023 11:12:36 +0300
Message-ID: <CAOQ4uxjSLwx3NsrXJAir5DLjY-Xo5e7Qs5NjK1gFygsbTO3E-g@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] ovl: Validate verity xattr when resolving lowerdata
To: Alexander Larsson <alexl@redhat.com>
Cc: Eric Biggers <ebiggers@kernel.org>, miklos@szeredi.hu, linux-unionfs@vger.kernel.org, 
	tytso@mit.edu, fsverity@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 16, 2023 at 10:50=E2=80=AFAM Alexander Larsson <alexl@redhat.co=
m> wrote:
>
> On Fri, Jun 16, 2023 at 7:55=E2=80=AFAM Amir Goldstein <amir73il@gmail.co=
m> wrote:
> >
> > On Fri, Jun 16, 2023 at 8:24=E2=80=AFAM Eric Biggers <ebiggers@kernel.o=
rg> wrote:
> > >
> > > On Fri, Jun 16, 2023 at 08:07:43AM +0300, Amir Goldstein wrote:
> > > > > I would really like to get the overlay.verity xattr support in
> > > > > upstream pretty soon, because without it I can't release a stable
> > > > > version of the composefs userspace code. I don't want to release
> > > > > something that is using an xattr format that is not guaranteed to=
 be
> > > > > stable.
> > > > >
> > > >
> > > > Alex,
> > > >
> > > > Pondering about this last sentence.
> > > >
> > > > The overlay.verity xattr format is already in its 3rd revision sinc=
e
> > > > the beginning of development.
> > > >
> > > > When it was bare digest, it might have made sense to have no
> > > > header that describes the format.
> > > >
> > > > When the algo byte was added, that was already a very big hint
> > > > that a proper header was in order.
> > > >
> > > > Now that you had to change the meaning of the byte, it is very hard
> > > > to argue that the xattr format is guaranteed to be stable - in the =
sense
> > > > that it can never change again.
> > > >
> > > > Please add a minimal header to the overlay.verity xattr format,
> > > > similar to ovl_fb, that will allow composefs/overlayfs to be
> > > > maintained as the separate projects that they are.
> > > >
> > > > Something like this?
> > > >
> > > > /* On-disk format for "verity" xattr */
> > > > struct ovl_verity {
> > > >         u8 version;     /* 0 */
> > > >         u8 len;          /* size of this header + size of digest */
> > > >         u8 flags;
> > > >         u8 algo;        /* digest algo */
> > > >         u8 digest[];
> > > > };
> > > >
> > > > I realize that digest size may be inferred from xattr size,
> > > > but it is better to state the stored digest size explicitly and ver=
ify
> > > > that it matches expected xattr size.
> > >
> > > If it was up to me I think I'd keep it even more "minimal" just do:
> > >
> > >         struct ovl_verity {
> > >                 u8 version;     /* 0 */
> > >                 u8 algo;        /* digest algo */
> > >                 u8 digest[];
> > >         };
> > >
> > > It's up to you, though.
> >
> > Please keep len and flags.
> > Nothing to be gained from removing them.
>
> Something is gained by removing them: smaller images.
>
> I have a Centos 9 developer rootfs here to test with. The basic
> composefs image size for this with the current format (1 byte for algo)
> is 11M. Adding one more byte (version) adds 88k (0.8%) to it and adding 3
> bytes (version+flags+len) adds 240k (2.1%).
>

I am not impressed.
This is micro optimization IMO.
If you want to optimize xattrs for size, you could have erofs
compress all trusted.overlay.* names into byte special codes.
On local disk fs, this few bytes change in xattr size won't matter one bit.

> These are not huge costs, but they are not really giving any huge advanta=
ges
> either. I mean, the digest length can be computed already, both from
> the xattr size
> and the algo type. And flag-like features could be encoded in the
> version byte, or,
> if really needed, a version 2 header could add a flags field.
>

Yes it could at the cost of uglier code.
We will do that if we have to, but not because we failed
to reserve room for flags to begin with.
It would be a rookie on-disk format mistake to do that.

> I don't believe this format will actually need to change much.
> However, I do agree
> with the general requirement for *some* ability to move forward with
> this format,
> so I'm gonna go with a single version byte.
>

I disagree.
If you present a real life use case why that really matters
then I can reconsider.

Thanks,
Amir.
