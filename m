Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C4D1C33
	for <fsverity@lists.linux.dev>; Wed,  5 Jul 2023 08:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688544473;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZjAnllnS92S3vOqpBo7l6W/k2CUBJSHTlRNn8Oppiz4=;
	b=Ywe7lWs9V0k3aw1x0c4CesuJJtFeU6VeinmUQ+Kv15undQfVfYLg2VRYa/AcjPK46WhDWM
	SNZUx+dMlePEU43z3RZt2gCaWzQBFcSND9E+SEpf0LUbH0LtYbsbNm8R/u+eMaALVpdvPF
	t7hKf/8Xu646AUymVN5WJg11ntSLjPY=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-295-JT5fLKFwOIemJnQEZ13ZOg-1; Wed, 05 Jul 2023 04:07:51 -0400
X-MC-Unique: JT5fLKFwOIemJnQEZ13ZOg-1
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-345c29495c9so27030365ab.1
        for <fsverity@lists.linux.dev>; Wed, 05 Jul 2023 01:07:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688544471; x=1691136471;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZjAnllnS92S3vOqpBo7l6W/k2CUBJSHTlRNn8Oppiz4=;
        b=G7ybAf0oW8gBU2fZkLaZz6hmsmiaHS27AaQfJp2i7MrVMuY2cGspi/hYbkb13YYxRG
         d0CaoeJyTyeqL/zTtfuzD8VmwHToUR97efGw9AGDN1+1EESbLa3I0M+x3R7edvcMzFqL
         kg123i+ZU8LqO6PedUmMTaTzMk4SDgRw5Nq8GOG3GHlo9szwAe8wq+HOLnkale89tqUM
         udIfF6Sza1bfYhLamyXrljv6vJp9BONcgDMnpszHTP5Ca6gGutpai4IuOUSSk92ticMI
         j7X8OFbbUgy4SgMrvjLzXueIeGrGkQZaqarZ1PgFZTHbwL1fGj7Ct/JNIXcaeklu9j9+
         Po8Q==
X-Gm-Message-State: ABy/qLbU9f/RI0wUhSiAxBFYBPPaHNpE6qad221YBp5aGVPHAc+fgn3A
	KDEcuL4roYjZarp6vsjg3YsxZEKwIPORk7HdngU2jFHetiQa1rAoZSwPHNFNLNM0t05U9NlMHgp
	fd8i6SYulQGbM1mIj0EH+eSkjV6AFxWWuGd4=
X-Received: by 2002:a92:d7d1:0:b0:342:655f:6f25 with SMTP id g17-20020a92d7d1000000b00342655f6f25mr13496180ilq.31.1688544470858;
        Wed, 05 Jul 2023 01:07:50 -0700 (PDT)
X-Google-Smtp-Source: APBJJlH6iahUKCHAfmzEsw4rJkqZmgC0TqPd8lrw7+xDO9rFoaLFb6rFR8YZz8IFjmvbtQrnu5EBsxlUKgDi9bT0iTA=
X-Received: by 2002:a92:d7d1:0:b0:342:655f:6f25 with SMTP id
 g17-20020a92d7d1000000b00342655f6f25mr13496165ilq.31.1688544470652; Wed, 05
 Jul 2023 01:07:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1687345663.git.alexl@redhat.com> <b7a2dfb80e35dda04edd942ad715dc88b784c218.1687345663.git.alexl@redhat.com>
 <20230703191355.GC1194@sol.localdomain>
In-Reply-To: <20230703191355.GC1194@sol.localdomain>
From: Alexander Larsson <alexl@redhat.com>
Date: Wed, 5 Jul 2023 10:07:39 +0200
Message-ID: <CAL7ro1GpGczvGN28yVNMOw_9Uz-2SEJcRUMmvoBdmEWO5ynb7g@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] ovl: Add versioned header for overlay.metacopy xattr
To: Eric Biggers <ebiggers@kernel.org>
Cc: miklos@szeredi.hu, linux-unionfs@vger.kernel.org, amir73il@gmail.com, 
	tytso@mit.edu, fsverity@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 3, 2023 at 9:14=E2=80=AFPM Eric Biggers <ebiggers@kernel.org> w=
rote:
>
> On Wed, Jun 21, 2023 at 01:18:26PM +0200, Alexander Larsson wrote:
> > Historically overlay.metacopy was a zero-size xattr, and it's
> > existence marked a metacopy file. This change adds a versioned header
> > with a flag field, a length and a digest. The initial use-case of this
> > will be for validating a fs-verity digest, but the flags field could
> > also be used later for other new features.
> >
> > ovl_check_metacopy_xattr() now returns the size of the xattr,
> > emulating a size of OVL_METACOPY_MIN_SIZE for empty xattrs to
> > distinguish it from the no-xattr case.
> >
> > Signed-off-by: Alexander Larsson <alexl@redhat.com>
> > ---
> >  fs/overlayfs/namei.c     | 10 +++++-----
> >  fs/overlayfs/overlayfs.h | 24 +++++++++++++++++++++++-
> >  fs/overlayfs/util.c      | 37 +++++++++++++++++++++++++++++++++----
> >  3 files changed, 61 insertions(+), 10 deletions(-)
> >
> > diff --git a/fs/overlayfs/namei.c b/fs/overlayfs/namei.c
> > index 57adf911735f..3dd480253710 100644
> > --- a/fs/overlayfs/namei.c
> > +++ b/fs/overlayfs/namei.c
> > @@ -25,7 +25,7 @@ struct ovl_lookup_data {
> >       bool stop;
> >       bool last;
> >       char *redirect;
> > -     bool metacopy;
> > +     int metacopy;
>
> Should this be called 'metacopy_size' now?

Honestly I don't know. That would change a lot of locations that still
use this as "essentially" a boolean (i.e. !=3D 0 means "has metacopy"),
and ity would make that code less compact. I guess this is up to Amir
and Miklos. Surely we could add a comment in the struct definition
though.

> > -             err =3D ovl_check_metacopy_xattr(OVL_FS(d->sb), &path);
> > +             err =3D ovl_check_metacopy_xattr(OVL_FS(d->sb), &path, NU=
LL);
> >               if (err < 0)
> >                       goto out_err;
>
> This part is confusing because variables named 'err' conventionally conta=
in only
> 0 or a negative errno value.  But this patch makes it possible for
> ovl_check_metacopy_xattr() to return a positive size.

It was already returning "negative, 0 or 1", so it's not fundamentally
changed. Again, this is not my code so I'd rather Amir and Miklos
decide such code style questions.

--=20
=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D
 Alexander Larsson                                Red Hat, Inc
       alexl@redhat.com         alexander.larsson@gmail.com

