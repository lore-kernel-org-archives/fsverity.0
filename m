Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 505F746B6
	for <fsverity@lists.linux.dev>; Wed,  5 Jul 2023 09:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688548326;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lHt7fztlcuatzakbLpp3jG3VDU7KOxTlO7qTnhrR9YU=;
	b=M1/O4rAfjCDK6eagPkHfmkl1xk8ZHcyEsywhukojUdz7wK3CmTnzmgEmMxIRCET6K6efV3
	5VzDyR7kBoKBdDswpPqIR0pkbmHgb+30qHNYgxKCXiEkNjbIgpo8XxdDJG/fES3AzKA3WN
	/0WWFgpmeBa/NwfIUO4tNFw6moJUQ9c=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-368-oAaeYlN5P8yWjkIc1DKQ5A-1; Wed, 05 Jul 2023 05:12:04 -0400
X-MC-Unique: oAaeYlN5P8yWjkIc1DKQ5A-1
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3458a51abf9so37650165ab.0
        for <fsverity@lists.linux.dev>; Wed, 05 Jul 2023 02:12:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688548324; x=1691140324;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lHt7fztlcuatzakbLpp3jG3VDU7KOxTlO7qTnhrR9YU=;
        b=BpmdlJSPR7tOzL3NFCkFEFI4GF2MpMekUoyNpXXq0mBnauIvaC4qZCeKjK+JhBIhq6
         pMiGQN8TUnGdjQ7Z0L0e+J1Jn9G6VmDBPmlnmlJUTlapmfdWkib3T2ALqb5o12K1agzE
         KgzdtQSbREZWjODSlCTm9we0uQ94ptiHA42upkxpkrxy5AJuHgpfj/fylT3M7QEPV3b4
         BYee8LMdlVOf1QOwUjTA4LCblec0plMy7BLa9N8jZUIlWTegE/Knr3FqDzDEsSuNep+X
         3iZOrazpdymR+ux9dHIH5nnw3LwyR0DenrEjmLfPc2S8uFT350jnElHTGR+K/s1Gpk/k
         Azmw==
X-Gm-Message-State: ABy/qLa2kzGdnM/PQ1TnT5kzY1fs0WKpjhpMvVGyw890Vy+cTHA0Z482
	nwfBtVOVk53no1uB5WQ8zd/1EGXf4y4tgV8zXu7rk4sNnaYJZWB3j+qKBEOpvQuMIKTDZG+EVp9
	9P1VNaK1HLYTefx0Mp5ItLCnkXMsOeoFqaz0=
X-Received: by 2002:a92:dac4:0:b0:346:e96:7cbb with SMTP id o4-20020a92dac4000000b003460e967cbbmr9494379ilq.30.1688548324149;
        Wed, 05 Jul 2023 02:12:04 -0700 (PDT)
X-Google-Smtp-Source: APBJJlG6lbvhhJut+mleOnP8lhAwoO1V4FEK/MsktYst/YIxG/SYT1S7KjPBjm4/VHsl9K/rs9K73jJ3oQmIpg4NuZM=
X-Received: by 2002:a92:dac4:0:b0:346:e96:7cbb with SMTP id
 o4-20020a92dac4000000b003460e967cbbmr9494373ilq.30.1688548323948; Wed, 05 Jul
 2023 02:12:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1687345663.git.alexl@redhat.com> <8771725be2a8b7d65ea6c50a69bb6392b9e903aa.1687345663.git.alexl@redhat.com>
 <20230703192950.GE1194@sol.localdomain>
In-Reply-To: <20230703192950.GE1194@sol.localdomain>
From: Alexander Larsson <alexl@redhat.com>
Date: Wed, 5 Jul 2023 11:11:53 +0200
Message-ID: <CAL7ro1FcWWvTd2Fzac-VkyikAYzv_ffEvssHAgHYKuZhKf30JQ@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] ovl: Handle verity during copy-up
To: Eric Biggers <ebiggers@kernel.org>
Cc: miklos@szeredi.hu, linux-unionfs@vger.kernel.org, amir73il@gmail.com, 
	tytso@mit.edu, fsverity@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 3, 2023 at 9:30=E2=80=AFPM Eric Biggers <ebiggers@kernel.org> w=
rote:
>
> On Wed, Jun 21, 2023 at 01:18:28PM +0200, Alexander Larsson wrote:
> > During regular metacopy, if lowerdata file has fs-verity enabled, and
> > the verity option is enabled, we add the digest to the metacopy xattr.
> >
> > If verity is required, and lowerdata does not have fs-verity enabled,
> > fall back to full copy-up (or the generated metacopy would not
> > validate).
> >
> > Signed-off-by: Alexander Larsson <alexl@redhat.com>
> > ---
> >  fs/overlayfs/copy_up.c   | 45 ++++++++++++++++++++++++++++++++++++++--
> >  fs/overlayfs/overlayfs.h |  3 +++
> >  fs/overlayfs/util.c      | 33 ++++++++++++++++++++++++++++-
> >  3 files changed, 78 insertions(+), 3 deletions(-)
> >
> > diff --git a/fs/overlayfs/copy_up.c b/fs/overlayfs/copy_up.c
> > index 68f01fd7f211..fce7d048673c 100644
> > --- a/fs/overlayfs/copy_up.c
> > +++ b/fs/overlayfs/copy_up.c
> > @@ -544,6 +544,7 @@ struct ovl_copy_up_ctx {
> >       bool origin;
> >       bool indexed;
> >       bool metacopy;
> > +     bool metacopy_digest;
> >  };
> >
> >  static int ovl_link_up(struct ovl_copy_up_ctx *c)
> > @@ -641,8 +642,21 @@ static int ovl_copy_up_metadata(struct ovl_copy_up=
_ctx *c, struct dentry *temp)
> >       }
> >
> >       if (c->metacopy) {
> > -             err =3D ovl_check_setxattr(ofs, temp, OVL_XATTR_METACOPY,
> > -                                      NULL, 0, -EOPNOTSUPP);
> > +             struct path lowerdatapath;
> > +             struct ovl_metacopy metacopy_data =3D OVL_METACOPY_INIT;
> > +
> > +             ovl_path_lowerdata(c->dentry, &lowerdatapath);
> > +             if (WARN_ON_ONCE(lowerdatapath.dentry =3D=3D NULL))
> > +                     err =3D -EIO;
> > +             else
> > +                     err =3D ovl_set_verity_xattr_from(ofs, &lowerdata=
path, &metacopy_data);
>
> There's no dedicated verity xattr anymore, so maybe ovl_set_verity_xattr_=
from()
> should be renamed to something like ovl_get_verity_digest().

Yeah, that makes a lot of sense.

> > +
> > +             if (metacopy_data.digest_algo)
> > +                     c->metacopy_digest =3D true;
> > +
> > +             if (!err)
> > +                     err =3D ovl_set_metacopy_xattr(ofs, temp, &metaco=
py_data);
> > +
> >               if (err)
> >                       return err;
>
> The error handling above is a bit weird.  Some early returns would make i=
t
> easier to read:
>
>                 ovl_path_lowerdata(c->dentry, &lowerdatapath);
>                 if (WARN_ON_ONCE(lowerdatapath.dentry =3D=3D NULL))
>                         return -EIO;
>                 err =3D ovl_get_verity_digest(ofs, &lowerdatapath, &metac=
opy_data);
>                 if (err)
>                         return err;
>
>                 if (metacopy_data.digest_algo)
>                         c->metacopy_digest =3D true;
>
>                 err =3D ovl_set_metacopy_xattr(ofs, temp, &metacopy_data)=
;
>                 if (err)
>                         return err;

Yeah.

> >       }
> > @@ -751,6 +765,12 @@ static int ovl_copy_up_workdir(struct ovl_copy_up_=
ctx *c)
> >       if (err)
> >               goto cleanup;
> >
> > +     if (c->metacopy_digest)
> > +             ovl_set_flag(OVL_HAS_DIGEST, d_inode(c->dentry));
> > +     else
> > +             ovl_clear_flag(OVL_HAS_DIGEST, d_inode(c->dentry));
> > +     ovl_clear_flag(OVL_VERIFIED_DIGEST, d_inode(c->dentry));
> > +
> >       if (!c->metacopy)
> >               ovl_set_upperdata(d_inode(c->dentry));
> >       inode =3D d_inode(c->dentry);
>
> Maybe the line 'inode =3D d_inode(c->dentry);' should be moved earlier, a=
nd then
> 'inode' used instead of 'd_inode(c->dentry)' later on.

I wonder why this wasn't already done for the ovl_set_upperdata(), but
it seems ok so I did this.

> > +     if (ofs->config.verity_mode =3D=3D OVL_VERITY_REQUIRE) {
> > +             struct path lowerdata;
> > +
> > +             ovl_path_lowerdata(dentry, &lowerdata);
> > +
> > +             if (WARN_ON_ONCE(lowerdata.dentry =3D=3D NULL) ||
> > +                 ovl_ensure_verity_loaded(&lowerdata) ||
> > +                 !fsverity_get_info(d_inode(lowerdata.dentry))) {
> > +                     return false;
>
> Please use !fsverity_active() instead of !fsverity_get_info().

Done.

All these changes are in git:
https://github.com/alexlarsson/linux/commits/overlay-verity

--=20
=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D
 Alexander Larsson                                Red Hat, Inc
       alexl@redhat.com         alexander.larsson@gmail.com

