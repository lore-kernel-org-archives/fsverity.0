Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F197D30C
	for <fsverity@lists.linux.dev>; Wed,  3 May 2023 15:33:51 +0000 (UTC)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-4329313f39eso1381893137.1
        for <fsverity@lists.linux.dev>; Wed, 03 May 2023 08:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683128030; x=1685720030;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VJN38fphDOCnVChl1XoqJVLkmsarBD3d/ekpUkp6BwE=;
        b=BUJ4q8xP9CcKNGY5s7RCgL6SXH5eYPaAAEJG6CseOaZypQRmBVv9fLAkuaGabs1LrV
         QtkfKcPeRvVQnSUiQhvEqZ5PNArJF7M1dW0p4MPpyon2w9QxQdqx1fv3aU9kgnG3fQmA
         no3uqqZugV+qE+5zqKLDXtyUggZqTaQo0HdmwfEtaHIoS3SeHob7P4uxIlhy7r1ZiPGZ
         tIrDWIJSHZj8s5ljVLnVV91ft+6ZaLuAIeyUusmYfTHEg1vici/IeQq+ALjAkPpjfEQB
         bUsTmje96mff5TWZJIdRlNa4qpbp1n+mWizTq+CW0s5WHa90mXD78WO5xfjGC6ZKb6uU
         sCBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683128030; x=1685720030;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VJN38fphDOCnVChl1XoqJVLkmsarBD3d/ekpUkp6BwE=;
        b=US1cZ4xZ81jR6VemDsZ/TtUzrAc3NAj6qmjFyI98z7foELdfYxuXwqmgHaQqpQ8oDT
         UnNx9mMCJcHZURP39IjunLKxD3TYSLFAJtx7RhP8Bf4D+yT4T2UDe8y3nXj/mtUIlp3H
         mH2T2bC/BfMbO0rW77nR4LtMXI2cmoIROMm1Vzs/OeVw+OK1eqd/7zb0DCUIagAPgO1p
         kDZhVNX6hkcBKPEgl5q+yQJ/CAqTK7J1QPh/lJeKLZ+DXBO0L+Q9hAoft3YtsKVfq/NZ
         1FjgajvCTTFxSwXXWIJ2plPa+aWAJ5LMWPqVYR7XAOdXFRWxaICRBwGvTykzHOUwcI6p
         mUXA==
X-Gm-Message-State: AC+VfDx57qbWORZ4M6f9wZc7GMxzMkIc4qxtrKjKRZ6JCNHqLf2ig1Mo
	0Db8XBz3YSoiI5avCHYCGgmC+CbVqf/yVvbG1M8=
X-Google-Smtp-Source: ACHHUZ5whel+bBOabjiIGFFJcSL92t0ketH66gmX1myJ2YFmM1wF5CwTEFUzvwPd4d0QLHsLV3n+TtQdtx5PDoU2tA4=
X-Received: by 2002:a67:de06:0:b0:430:5f47:7243 with SMTP id
 q6-20020a67de06000000b004305f477243mr1553896vsk.12.1683128030318; Wed, 03 May
 2023 08:33:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1683102959.git.alexl@redhat.com> <c92a93fae2484e554b0d8cce5d02b8b4d6758c67.1683102959.git.alexl@redhat.com>
In-Reply-To: <c92a93fae2484e554b0d8cce5d02b8b4d6758c67.1683102959.git.alexl@redhat.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Wed, 3 May 2023 18:33:39 +0300
Message-ID: <CAOQ4uxjirxft7if1n_Qv9fLAF5u+VEL+kqMdfK+DdXTts8Q-aw@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] ovl: Handle verity during copy-up
To: Alexander Larsson <alexl@redhat.com>
Cc: miklos@szeredi.hu, linux-unionfs@vger.kernel.org, ebiggers@kernel.org, 
	tytso@mit.edu, fsverity@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 3, 2023 at 11:52=E2=80=AFAM Alexander Larsson <alexl@redhat.com=
> wrote:
>
> During regular metacopy, if lowerdata file has fs-verity enabled,
> set the new overlay.verity xattr (if enabled).
>
> During real data copy up, remove any old overlay.verity xattr.
>
> If verity is required, and lowerdata does not have fs-verity enabled,
> fall back to full copy-up (or the generated metacopy would not validate).
>
> Signed-off-by: Alexander Larsson <alexl@redhat.com>

Looks fine to me
Reviewed-by: Amir Goldstein <amir73il@gmail.com>

> ---
>  fs/overlayfs/copy_up.c   | 31 +++++++++++++++++++++++++++++++
>  fs/overlayfs/overlayfs.h |  3 +++
>  fs/overlayfs/util.c      | 39 ++++++++++++++++++++++++++++++++++++++-
>  3 files changed, 72 insertions(+), 1 deletion(-)
>
> diff --git a/fs/overlayfs/copy_up.c b/fs/overlayfs/copy_up.c
> index eb266fb68730..e25bdc2baef3 100644
> --- a/fs/overlayfs/copy_up.c
> +++ b/fs/overlayfs/copy_up.c
> @@ -19,6 +19,7 @@
>  #include <linux/fdtable.h>
>  #include <linux/ratelimit.h>
>  #include <linux/exportfs.h>
> +#include <linux/fsverity.h>
>  #include "overlayfs.h"
>
>  #define OVL_COPY_UP_CHUNK_SIZE (1 << 20)
> @@ -644,6 +645,18 @@ static int ovl_copy_up_metadata(struct ovl_copy_up_c=
tx *c, struct dentry *temp)
>         if (c->metacopy) {
>                 err =3D ovl_check_setxattr(ofs, temp, OVL_XATTR_METACOPY,
>                                          NULL, 0, -EOPNOTSUPP);
> +
> +               /* Copy the verity digest if any so we can validate the c=
opy-up later */
> +               if (!err) {
> +                       struct path lowerdatapath;
> +
> +                       ovl_path_lowerdata(c->dentry, &lowerdatapath);
> +                       if (WARN_ON_ONCE(lowerdatapath.dentry =3D=3D NULL=
))
> +                               err =3D -EIO;
> +                       else
> +                               err =3D ovl_set_verity_xattr_from(ofs, te=
mp, &lowerdatapath);
> +               }
> +
>                 if (err)
>                         return err;
>         }
> @@ -919,6 +932,19 @@ static bool ovl_need_meta_copy_up(struct dentry *den=
try, umode_t mode,
>         if (flags && ((OPEN_FMODE(flags) & FMODE_WRITE) || (flags & O_TRU=
NC)))
>                 return false;
>
> +       /* Fall back to full copy if no fsverity on source data and we re=
quire verity */
> +       if (ofs->config.require_verity) {
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
> @@ -985,6 +1011,11 @@ static int ovl_copy_up_meta_inode_data(struct ovl_c=
opy_up_ctx *c)
>         if (err)
>                 goto out_free;
>
> +       err =3D ovl_removexattr(ofs, upperpath.dentry, OVL_XATTR_VERITY);
> +       if (err && err !=3D -ENODATA)
> +               goto out_free;
> +
> +       err =3D 0;
>         ovl_set_upperdata(d_inode(c->dentry));
>  out_free:
>         kfree(capability);
> diff --git a/fs/overlayfs/overlayfs.h b/fs/overlayfs/overlayfs.h
> index 07475eaae2ca..1cc3c8df3a4d 100644
> --- a/fs/overlayfs/overlayfs.h
> +++ b/fs/overlayfs/overlayfs.h
> @@ -464,11 +464,14 @@ int ovl_lock_rename_workdir(struct dentry *workdir,=
 struct dentry *upperdir);
>  int ovl_check_metacopy_xattr(struct ovl_fs *ofs, const struct path *path=
);
>  bool ovl_is_metacopy_dentry(struct dentry *dentry);
>  char *ovl_get_redirect_xattr(struct ovl_fs *ofs, const struct path *path=
, int padding);
> +int ovl_ensure_verity_loaded(struct path *path);
>  int ovl_get_verity_xattr(struct ovl_fs *ofs, const struct path *path,
>                          u8 *digest_buf, int *buf_length);
>  int ovl_validate_verity(struct ovl_fs *ofs,
>                         struct path *metapath,
>                         struct path *datapath);
> +int ovl_set_verity_xattr_from(struct ovl_fs *ofs, struct dentry *dst,
> +                             struct path *src);
>  int ovl_sync_status(struct ovl_fs *ofs);
>
>  static inline void ovl_set_flag(unsigned long flag, struct inode *inode)
> diff --git a/fs/overlayfs/util.c b/fs/overlayfs/util.c
> index ee296614bd73..733871775b80 100644
> --- a/fs/overlayfs/util.c
> +++ b/fs/overlayfs/util.c
> @@ -1188,7 +1188,7 @@ int ovl_get_verity_xattr(struct ovl_fs *ofs, const =
struct path *path,
>  }
>
>  /* Call with mounter creds as it may open the file */
> -static int ovl_ensure_verity_loaded(struct path *datapath)
> +int ovl_ensure_verity_loaded(struct path *datapath)
>  {
>         struct inode *inode =3D d_inode(datapath->dentry);
>         const struct fsverity_info *vi;
> @@ -1262,6 +1262,43 @@ int ovl_validate_verity(struct ovl_fs *ofs,
>         return 0;
>  }
>
> +int ovl_set_verity_xattr_from(struct ovl_fs *ofs, struct dentry *dst,
> +                             struct path *src)
> +{
> +       int err;
> +       u8 src_digest[1+FS_VERITY_MAX_DIGEST_SIZE];
> +       enum hash_algo verity_algo;
> +
> +       if (!ofs->config.verity || !S_ISREG(d_inode(dst)->i_mode))
> +               return 0;
> +
> +       err =3D -EIO;
> +       if (src) {
> +               err =3D ovl_ensure_verity_loaded(src);
> +               if (err < 0) {
> +                       pr_warn_ratelimited("lower file '%pd' failed to l=
oad fs-verity info\n",
> +                                           src->dentry);
> +                       return -EIO;
> +               }
> +
> +               err =3D fsverity_get_digest(d_inode(src->dentry), src_dig=
est + 1, &verity_algo);
> +       }
> +       if (err =3D=3D -ENODATA) {
> +               if (ofs->config.require_verity) {
> +                       pr_warn_ratelimited("lower file '%pd' has no fs-v=
erity digest\n",
> +                                           src->dentry);
> +                       return -EIO;
> +               }
> +               return 0;
> +       }
> +       if (err < 0)
> +               return err;
> +
> +       src_digest[0] =3D (u8)verity_algo;
> +       return ovl_check_setxattr(ofs, dst, OVL_XATTR_VERITY,
> +                                 src_digest, 1 + hash_digest_size[verity=
_algo], -EOPNOTSUPP);
> +}
> +
>  /*
>   * ovl_sync_status() - Check fs sync status for volatile mounts
>   *
> --
> 2.39.2
>
