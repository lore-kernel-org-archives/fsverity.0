Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA633101FA
	for <fsverity@lists.linux.dev>; Tue, 20 Jun 2023 12:10:24 +0000 (UTC)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-440c5960b58so165681137.3
        for <fsverity@lists.linux.dev>; Tue, 20 Jun 2023 05:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687263023; x=1689855023;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w5Y7xKI9Gz4hxFUW29vTeY+aza3A9u3z6JOAecQDiy4=;
        b=fv5HMvg4iyuBTCLElPYz/56NL3VMZ2LRXd4cWndDo0huztMD1kWE6XpYluiPckQixg
         0RVb+2pk4i7M8yme8gOWEj1mGuC9Euy4oEDdNplQs399CDzZmCBPYrK7JCMytod8eRkj
         P24CqQzUa68TGB2usbgACtwCR9fK0/rZsXot+qsvfPwTqTaMLJOxHFrzMXXzUMqbSu1l
         y+orAIv5/HVi2A81IpgndOAX/o6dQRIXbu6bXv7LGpgwsyc9Rdk7sTNau7hIpKt3KJb3
         yYgOYay106manXaCtG1wYWyxDMm1VsKm3MEVuQXU0h1HsmRTHkBmFBK4ZEZ++19XWfm3
         /t/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687263023; x=1689855023;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w5Y7xKI9Gz4hxFUW29vTeY+aza3A9u3z6JOAecQDiy4=;
        b=j99sDhm+qbOzFAB5gHmrsVBT6WLOZMbYM7Zch/+28ra9rz7mmQhs3ZoXCDP1q9sLhs
         l5UCIhl5/4KnD/5nZv4EuI4SvUdCJtjlo72i1eLE6At9vmcLRT173l/vp3F15r5+w2cE
         P6CKwy2mxZklp2wbNohJnbfmJ8B5r6QI/F3AOVOh/XtmFKgTyBww2dWaxXRsLbV9tfhO
         g2KIPrMIpFW+DdOHglc+oPWhg0h8YW9O3wF5+cf245vkHoOonKQsqBOgI+Yqr7DKodEE
         Ps3b/x20DErBy42FBpxOxMHfQ8E9iJdsMPIqL0sqX+v7DtBrhFbjns5PhPJNlnfDt9hV
         SKug==
X-Gm-Message-State: AC+VfDwmYgyZ0hJ6y04DqjaplOoktINNnwoSnxM5BwgazLvx6gH1gU+z
	fVRajjm5x3wINw1taq+D2JT/qV0hrY8J2nrr+0I=
X-Google-Smtp-Source: ACHHUZ4juVxdfx/Nbg1Yapg6m5lJCmSQPzLp3kSQP9wTgOf/LkWMoOs9u0mpa5mqtkvTeB7U1fr5UhSyDefvIqgVX3Y=
X-Received: by 2002:a67:ce8a:0:b0:440:c339:9694 with SMTP id
 c10-20020a67ce8a000000b00440c3399694mr753425vse.27.1687263023560; Tue, 20 Jun
 2023 05:10:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1687255035.git.alexl@redhat.com> <14eaa0223125470ec8cf38b6185b2a94b14ee313.1687255035.git.alexl@redhat.com>
In-Reply-To: <14eaa0223125470ec8cf38b6185b2a94b14ee313.1687255035.git.alexl@redhat.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 20 Jun 2023 15:10:12 +0300
Message-ID: <CAOQ4uxgxYRupbuKXgYQTt7GB2y4xif4ftx-XqrPV2pqB66cemw@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] ovl: Handle verity during copy-up
To: Alexander Larsson <alexl@redhat.com>
Cc: miklos@szeredi.hu, linux-unionfs@vger.kernel.org, ebiggers@kernel.org, 
	tytso@mit.edu, fsverity@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 20, 2023 at 1:15=E2=80=AFPM Alexander Larsson <alexl@redhat.com=
> wrote:
>
> During regular metacopy, if lowerdata file has fs-verity enabled, and
> the verity option is enabled, we add the digest to the metacopy xattr.
>
> If verity is required, and lowerdata does not have fs-verity enabled,
> fall back to full copy-up (or the generated metacopy would not
> validate).
>
> Signed-off-by: Alexander Larsson <alexl@redhat.com>

Looks good.
Minor comments below

> ---
>  fs/overlayfs/copy_up.c   | 45 ++++++++++++++++++++++++++++++++++++++--
>  fs/overlayfs/overlayfs.h |  3 +++
>  fs/overlayfs/util.c      | 32 +++++++++++++++++++++++++++-
>  3 files changed, 77 insertions(+), 3 deletions(-)
>
> diff --git a/fs/overlayfs/copy_up.c b/fs/overlayfs/copy_up.c
> index 68f01fd7f211..6e6c25836e52 100644
> --- a/fs/overlayfs/copy_up.c
> +++ b/fs/overlayfs/copy_up.c
> @@ -544,6 +544,7 @@ struct ovl_copy_up_ctx {
>         bool origin;
>         bool indexed;
>         bool metacopy;
> +       bool metacopy_digest;
>  };
>
>  static int ovl_link_up(struct ovl_copy_up_ctx *c)
> @@ -641,8 +642,21 @@ static int ovl_copy_up_metadata(struct ovl_copy_up_c=
tx *c, struct dentry *temp)
>         }
>
>         if (c->metacopy) {
> -               err =3D ovl_check_setxattr(ofs, temp, OVL_XATTR_METACOPY,
> -                                        NULL, 0, -EOPNOTSUPP);
> +               struct path lowerdatapath;
> +               struct ovl_metacopy metacopy_data =3D OVL_METACOPY_INIT;
> +
> +               ovl_path_lowerdata(c->dentry, &lowerdatapath);
> +               if (WARN_ON_ONCE(lowerdatapath.dentry =3D=3D NULL))
> +                       err =3D -EIO;
> +               else
> +                       err =3D ovl_set_verity_xattr_from(ofs, &lowerdata=
path, &metacopy_data);
> +
> +               if (metacopy_data.digest_algo !=3D 0)

Nit: please drop "!=3D 0"

> +                       c->metacopy_digest =3D true;
> +
> +               if (!err)
> +                       err =3D ovl_set_metacopy_xattr(ofs, temp, &metaco=
py_data);
> +
>                 if (err)
>                         return err;
>         }
> @@ -751,6 +765,12 @@ static int ovl_copy_up_workdir(struct ovl_copy_up_ct=
x *c)
>         if (err)
>                 goto cleanup;
>
> +       if (c->metacopy_digest)
> +               ovl_set_flag(OVL_HAS_DIGEST, d_inode(c->dentry));
> +       else
> +               ovl_clear_flag(OVL_HAS_DIGEST, d_inode(c->dentry));
> +       ovl_clear_flag(OVL_VERIFIED_DIGEST, d_inode(c->dentry));
> +
>         if (!c->metacopy)
>                 ovl_set_upperdata(d_inode(c->dentry));
>         inode =3D d_inode(c->dentry);
> @@ -813,6 +833,12 @@ static int ovl_copy_up_tmpfile(struct ovl_copy_up_ct=
x *c)
>         if (err)
>                 goto out_fput;
>
> +       if (c->metacopy_digest)
> +               ovl_set_flag(OVL_HAS_DIGEST, d_inode(c->dentry));
> +       else
> +               ovl_clear_flag(OVL_HAS_DIGEST, d_inode(c->dentry));
> +       ovl_clear_flag(OVL_VERIFIED_DIGEST, d_inode(c->dentry));
> +
>         if (!c->metacopy)
>                 ovl_set_upperdata(d_inode(c->dentry));
>         ovl_inode_update(d_inode(c->dentry), dget(temp));
> @@ -918,6 +944,19 @@ static bool ovl_need_meta_copy_up(struct dentry *den=
try, umode_t mode,
>         if (flags && ((OPEN_FMODE(flags) & FMODE_WRITE) || (flags & O_TRU=
NC)))
>                 return false;
>
> +       /* Fall back to full copy if no fsverity on source data and we re=
quire verity */
> +       if (ofs->config.verity_mode =3D=3D OVL_VERITY_REQUIRE) {
> +               struct path lowerdata;
> +
> +               ovl_path_lowerdata(dentry, &lowerdata);
> +
> +               if (WARN_ON_ONCE(lowerdata.dentry =3D=3D NULL) ||
> +                   ovl_ensure_verity_loaded(&lowerdata) ||
> +                   !fsverity_get_info(d_inode(lowerdata.dentry))) {
> +                       return false;
> +               }
> +       }
> +
>         return true;
>  }
>
> @@ -984,6 +1023,8 @@ static int ovl_copy_up_meta_inode_data(struct ovl_co=
py_up_ctx *c)
>         if (err)
>                 goto out_free;
>
> +       ovl_clear_flag(OVL_HAS_DIGEST, d_inode(c->dentry));
> +       ovl_clear_flag(OVL_VERIFIED_DIGEST, d_inode(c->dentry));
>         ovl_set_upperdata(d_inode(c->dentry));
>  out_free:
>         kfree(capability);
> diff --git a/fs/overlayfs/overlayfs.h b/fs/overlayfs/overlayfs.h
> index c2213a8ad16e..eef4a3243e8a 100644
> --- a/fs/overlayfs/overlayfs.h
> +++ b/fs/overlayfs/overlayfs.h
> @@ -517,11 +517,14 @@ int ovl_set_metacopy_xattr(struct ovl_fs *ofs, stru=
ct dentry *d,
>                            struct ovl_metacopy *metacopy);
>  bool ovl_is_metacopy_dentry(struct dentry *dentry);
>  char *ovl_get_redirect_xattr(struct ovl_fs *ofs, const struct path *path=
, int padding);
> +int ovl_ensure_verity_loaded(struct path *path);
>  int ovl_get_verity_xattr(struct ovl_fs *ofs, const struct path *path,
>                          u8 *digest_buf, int *buf_length);
>  int ovl_validate_verity(struct ovl_fs *ofs,
>                         struct path *metapath,
>                         struct path *datapath);
> +int ovl_set_verity_xattr_from(struct ovl_fs *ofs, struct path *src,
> +                             struct ovl_metacopy *metacopy);
>  int ovl_sync_status(struct ovl_fs *ofs);
>
>  static inline void ovl_set_flag(unsigned long flag, struct inode *inode)
> diff --git a/fs/overlayfs/util.c b/fs/overlayfs/util.c
> index 66448964f753..3841f04baf35 100644
> --- a/fs/overlayfs/util.c
> +++ b/fs/overlayfs/util.c
> @@ -1185,7 +1185,7 @@ char *ovl_get_redirect_xattr(struct ovl_fs *ofs, co=
nst struct path *path, int pa
>  }
>
>  /* Call with mounter creds as it may open the file */
> -static int ovl_ensure_verity_loaded(struct path *datapath)
> +int ovl_ensure_verity_loaded(struct path *datapath)
>  {
>         struct inode *inode =3D d_inode(datapath->dentry);
>         const struct fsverity_info *vi;
> @@ -1263,6 +1263,36 @@ int ovl_validate_verity(struct ovl_fs *ofs,
>         return 0;
>  }
>
> +int ovl_set_verity_xattr_from(struct ovl_fs *ofs, struct path *src,
> +                             struct ovl_metacopy *metacopy)
> +{
> +       int err, digest_size;
> +
> +       if (!ofs->config.verity_mode || !S_ISREG(d_inode(src->dentry)->i_=
mode))
> +               return 0;
> +
> +       err =3D ovl_ensure_verity_loaded(src);
> +       if (err < 0) {
> +               pr_warn_ratelimited("lower file '%pd' failed to load fs-v=
erity info\n",
> +                                   src->dentry);
> +               return -EIO;
> +       }
> +
> +       digest_size =3D fsverity_get_digest(d_inode(src->dentry),
> +                                         metacopy->digest, &metacopy->di=
gest_algo, NULL);
> +       if (digest_size =3D=3D 0) {
|| WARN_ON_ONCE(digest_size > FS_VERITY_MAX_DIGEST_SIZE))

> +               if (ofs->config.verity_mode =3D=3D OVL_VERITY_REQUIRE) {
> +                       pr_warn_ratelimited("lower file '%pd' has no fs-v=
erity digest\n",
> +                                           src->dentry);
> +                       return -EIO;
> +               }
> +               return 0;
> +       }
> +

ovl and fsverity are different modules, so we should have this
fail safety assertion in place.

It may look ridiculous that fsverity_get_digest() would return a size
larger than their own constant, but people may be loading an overlayfs
module not compiled with exact same fsverity code.

The results of this may be undefined, but at least we can make
the problem heard.

Thanks,
Amir.
