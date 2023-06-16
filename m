Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 860CB7C
	for <fsverity@lists.linux.dev>; Fri, 16 Jun 2023 05:55:30 +0000 (UTC)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-78cbc8176c7so140969241.0
        for <fsverity@lists.linux.dev>; Thu, 15 Jun 2023 22:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686894929; x=1689486929;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dMn3Rm2tbAq8pHNul+r6eMU5/t51ELtISdon0DSlbeE=;
        b=OFDdr46XUcBr2/1SIWc8iImyNG4If6Xx/lK4w+16fMmjZY65GOduQ/e55VsHDLRIxe
         Nduwzu6U/y4BB+IiM9q1DtDxYZNy2Rm2rN4y8jIAiSiy10973DnOjJOUppuxc+WsugH4
         4n1o23qxDYGLkwo0Tvnz9Kc4+Ym6m4LemrNgF/QpgvhAu9V//tTOXNh9+X9C+7/oNmt8
         ynjt2dZBHLs0dYRpfUUXPTHSCw1HHLR76rpqPzo0jNuapq/oM18xLOFr8t2HQzjCpeBs
         Zv2Po22SO08GbkmmvpOPCAYrLh2NmLYEJjO2uRmTVKJhOBVmcyhfUA4ML4nR+JdzlpJA
         J41A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686894929; x=1689486929;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dMn3Rm2tbAq8pHNul+r6eMU5/t51ELtISdon0DSlbeE=;
        b=cVYgAzf8STJbrPPWYzlwrRpiVnbYZN5r39h/kcoDiKe9+2DmPtQVPLwsNdE63F7Pjn
         sWFKEDUNIym8Bu5E/Mk8fAgOa69X8NWDRQWNmEEWtJXBuG2AQnmOCTr7yVRSECUKaUca
         0d06fA3QfMBIo+ZEkE9j8ep7NxJfMehC1xWnODOMPp1eYtUKueWK0aqMOIeKc+CcW2Om
         nt7t3eXeCEbG1Ii0GMILlg391uUv9qJJZwYWiIqKxFN3m37eCj5biHTWfCYyEl44C1Ah
         e9MlvRpEctluKpFcaCtR7eiZnrJjf0nMm4GbbaHyIaxKlET5RAwHjb74B1cKlBojVZuP
         rYrg==
X-Gm-Message-State: AC+VfDxJHWIcw93i2vXIH2lG76YISmjSHgLDukvwtFf47g420eWWtELs
	Pqyx90CntOeIUDE4+VMnOPvILTpa0+WGjN1Vzqg=
X-Google-Smtp-Source: ACHHUZ4eGcPPTP8o8ykfj6I5a8utI3naDymkx8FWyax373/AoG1H5Ppbm+7KkLvxUq53HRMYKGU9oM9d+cqym8ymTCs=
X-Received: by 2002:a67:e2cb:0:b0:43f:5aa1:a23e with SMTP id
 i11-20020a67e2cb000000b0043f5aa1a23emr1222231vsm.34.1686894929305; Thu, 15
 Jun 2023 22:55:29 -0700 (PDT)
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
 <CAOQ4uxgo9LOM3minBH0vw3huxjrHmO5O-caGfhgOUGCuT0B9Vg@mail.gmail.com> <20230616052444.GA181948@sol.localdomain>
In-Reply-To: <20230616052444.GA181948@sol.localdomain>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 16 Jun 2023 08:55:18 +0300
Message-ID: <CAOQ4uxjBfPvDb5921vV+jO1wtgoeWenEietmK6orP7Bh+gROqw@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] ovl: Validate verity xattr when resolving lowerdata
To: Eric Biggers <ebiggers@kernel.org>
Cc: Alexander Larsson <alexl@redhat.com>, miklos@szeredi.hu, linux-unionfs@vger.kernel.org, 
	tytso@mit.edu, fsverity@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 16, 2023 at 8:24=E2=80=AFAM Eric Biggers <ebiggers@kernel.org> =
wrote:
>
> On Fri, Jun 16, 2023 at 08:07:43AM +0300, Amir Goldstein wrote:
> > > I would really like to get the overlay.verity xattr support in
> > > upstream pretty soon, because without it I can't release a stable
> > > version of the composefs userspace code. I don't want to release
> > > something that is using an xattr format that is not guaranteed to be
> > > stable.
> > >
> >
> > Alex,
> >
> > Pondering about this last sentence.
> >
> > The overlay.verity xattr format is already in its 3rd revision since
> > the beginning of development.
> >
> > When it was bare digest, it might have made sense to have no
> > header that describes the format.
> >
> > When the algo byte was added, that was already a very big hint
> > that a proper header was in order.
> >
> > Now that you had to change the meaning of the byte, it is very hard
> > to argue that the xattr format is guaranteed to be stable - in the sens=
e
> > that it can never change again.
> >
> > Please add a minimal header to the overlay.verity xattr format,
> > similar to ovl_fb, that will allow composefs/overlayfs to be
> > maintained as the separate projects that they are.
> >
> > Something like this?
> >
> > /* On-disk format for "verity" xattr */
> > struct ovl_verity {
> >         u8 version;     /* 0 */
> >         u8 len;          /* size of this header + size of digest */
> >         u8 flags;
> >         u8 algo;        /* digest algo */
> >         u8 digest[];
> > };
> >
> > I realize that digest size may be inferred from xattr size,
> > but it is better to state the stored digest size explicitly and verify
> > that it matches expected xattr size.
>
> If it was up to me I think I'd keep it even more "minimal" just do:
>
>         struct ovl_verity {
>                 u8 version;     /* 0 */
>                 u8 algo;        /* digest algo */
>                 u8 digest[];
>         };
>
> It's up to you, though.

Please keep len and flags.
Nothing to be gained from removing them.

> Keep in mind, the definition of a fsverity digest as
> algorithm ID + raw digest is pretty fundamental to fsverity.  It's not
> especially prone to change.  The confusion we had was just over what type=
 of
> algorithm ID to use.
>
> (There is some inconsistency about whether the algorithm ID is u8, u16, o=
r u32.
> However, it's u8 on-disk in the fsverity_descriptor.  So it's fine for th=
e
> overlayfs xattr to use u8.)
>
> >
> > Does the digest buffer passed to fsnotify helpers have any
> > memory alignment requirements?
>
> I think you're asking about the raw_digest argument to fsverity_get_diges=
t()?
> No, there's no alignment requirement.
>

Yes, that is what I meant.

Thanks,
Amir.
