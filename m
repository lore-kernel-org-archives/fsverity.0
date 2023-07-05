Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A72447491
	for <fsverity@lists.linux.dev>; Wed,  5 Jul 2023 13:12:18 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-6b72329b63eso5981613a34.0
        for <fsverity@lists.linux.dev>; Wed, 05 Jul 2023 06:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688562737; x=1691154737;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TW95HG18ezsCKE21BffsLUKmTOoVxM3BgdD2+LGrNCc=;
        b=XX3w+1/WRZLg7vKGgX94fVB8i30UTVbfjOuvH5wfJj6Mj1knxKCgaSA0Bs1PI2iJgw
         qRIAISzG2tvXfCXpp3L5ZB/BXm8AEh4mHEct4A2w9pDjMx1LJCcyub1sxqflZmHelE4B
         uhfuoPyX7uaUyaigYKci1WPQ0x88tjxYz999m/XHVxhzd81OdgIw3LNv7WlVAci5tkFB
         Asefcp6dgENx//gM18ZFI/YgGDW02L15vTwd3moawevuG+oL1VbSPhvPVlIMXwNEVcor
         DRLEJD1W8foPVKzIMHBn+4jFcHGteb3+Mk37xQCbKbz0s8rGBEZjTD0LRTRjdmf8ZRoh
         r0Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688562737; x=1691154737;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TW95HG18ezsCKE21BffsLUKmTOoVxM3BgdD2+LGrNCc=;
        b=WyaIhq7s9ea98t0hqAR4H+HcCyNLccOIq042Wu06Ikl6qCIrVno4ZwDPX0k00FhxKD
         akzdOtEYQUeqoV0ps80/+8F4T5aLmyN6u0+R2aimDqLHdWURiBjYeiB/3aWmxp5zGdhm
         Y0Wq7Vz2Ja9R+SGi0WGzfPWzy/YKIqjPgw2edCjWvJIDWsFIRF/wfsiP7RpXirTCNz8Q
         cwotHrJa3IRY3CbsKRuHKbsBuMyLu0E80qdkKvv9lX6CIMOmUr/W5AwsErVsc5DN/xcs
         FlW8lUtVMPgJ7f5sLXrnzRTc6EwpJzisHDgappiXOTEL/q/vT88RWz4sxGtxVEExBbd/
         1Aew==
X-Gm-Message-State: ABy/qLb4l1LYmZdiuGZB7lcwCmrLxsIdjdBQ0McKymv7/prTEIQEIMgG
	iqf0FmUIklx69t9i7YMAWVBT7XyBlK1j8Zp75rc=
X-Google-Smtp-Source: APBJJlGK3cr95OCuO57YVhJkNSfHaJ1ONk+LELungNXO6xGtE05jGlm9I178g+YaXekyw+T6u3uhwYyF5Dj+wBbq3vk=
X-Received: by 2002:a05:6358:1b:b0:135:b4c:a490 with SMTP id
 27-20020a056358001b00b001350b4ca490mr7267989rww.10.1688562737432; Wed, 05 Jul
 2023 06:12:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1687345663.git.alexl@redhat.com> <b7a2dfb80e35dda04edd942ad715dc88b784c218.1687345663.git.alexl@redhat.com>
 <20230703191355.GC1194@sol.localdomain> <CAL7ro1GpGczvGN28yVNMOw_9Uz-2SEJcRUMmvoBdmEWO5ynb7g@mail.gmail.com>
In-Reply-To: <CAL7ro1GpGczvGN28yVNMOw_9Uz-2SEJcRUMmvoBdmEWO5ynb7g@mail.gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Wed, 5 Jul 2023 16:12:06 +0300
Message-ID: <CAOQ4uxgfNrMEKyOxGV3L2sUauM47-L77PhwNYooY43kFF+fycw@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] ovl: Add versioned header for overlay.metacopy xattr
To: Alexander Larsson <alexl@redhat.com>
Cc: Eric Biggers <ebiggers@kernel.org>, miklos@szeredi.hu, linux-unionfs@vger.kernel.org, 
	tytso@mit.edu, fsverity@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 5, 2023 at 11:07=E2=80=AFAM Alexander Larsson <alexl@redhat.com=
> wrote:
>
> On Mon, Jul 3, 2023 at 9:14=E2=80=AFPM Eric Biggers <ebiggers@kernel.org>=
 wrote:
> >
> > On Wed, Jun 21, 2023 at 01:18:26PM +0200, Alexander Larsson wrote:
> > > Historically overlay.metacopy was a zero-size xattr, and it's
> > > existence marked a metacopy file. This change adds a versioned header
> > > with a flag field, a length and a digest. The initial use-case of thi=
s
> > > will be for validating a fs-verity digest, but the flags field could
> > > also be used later for other new features.
> > >
> > > ovl_check_metacopy_xattr() now returns the size of the xattr,
> > > emulating a size of OVL_METACOPY_MIN_SIZE for empty xattrs to
> > > distinguish it from the no-xattr case.
> > >
> > > Signed-off-by: Alexander Larsson <alexl@redhat.com>
> > > ---
> > >  fs/overlayfs/namei.c     | 10 +++++-----
> > >  fs/overlayfs/overlayfs.h | 24 +++++++++++++++++++++++-
> > >  fs/overlayfs/util.c      | 37 +++++++++++++++++++++++++++++++++----
> > >  3 files changed, 61 insertions(+), 10 deletions(-)
> > >
> > > diff --git a/fs/overlayfs/namei.c b/fs/overlayfs/namei.c
> > > index 57adf911735f..3dd480253710 100644
> > > --- a/fs/overlayfs/namei.c
> > > +++ b/fs/overlayfs/namei.c
> > > @@ -25,7 +25,7 @@ struct ovl_lookup_data {
> > >       bool stop;
> > >       bool last;
> > >       char *redirect;
> > > -     bool metacopy;
> > > +     int metacopy;
> >
> > Should this be called 'metacopy_size' now?
>
> Honestly I don't know. That would change a lot of locations that still
> use this as "essentially" a boolean (i.e. !=3D 0 means "has metacopy"),
> and ity would make that code less compact. I guess this is up to Amir
> and Miklos. Surely we could add a comment in the struct definition
> though.
>

I agree most of the code looks nicer when this stays 'metacopy'

> > > -             err =3D ovl_check_metacopy_xattr(OVL_FS(d->sb), &path);
> > > +             err =3D ovl_check_metacopy_xattr(OVL_FS(d->sb), &path, =
NULL);
> > >               if (err < 0)
> > >                       goto out_err;
> >
> > This part is confusing because variables named 'err' conventionally con=
tain only
> > 0 or a negative errno value.  But this patch makes it possible for
> > ovl_check_metacopy_xattr() to return a positive size.
>
> It was already returning "negative, 0 or 1", so it's not fundamentally
> changed. Again, this is not my code so I'd rather Amir and Miklos
> decide such code style questions.
>

I agree. It wasn't 0 or negative before the change and I don't
think this "convention" justifies adding another var.

Thanks,
Amir,
