Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB845661
	for <fsverity@lists.linux.dev>; Thu, 20 Apr 2023 12:14:36 +0000 (UTC)
Received: by mail-ua1-f50.google.com with SMTP id ch24so2040265uab.3
        for <fsverity@lists.linux.dev>; Thu, 20 Apr 2023 05:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681992875; x=1684584875;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qaylrUdg0+csiYgaM5+2CX7gGdXl19IxIjKJHzKB4FY=;
        b=T59oQAg2MWq7i3cq5xS92GokDfg8LSKQr6n//AMVeN/y8m1wWCfWxlr3tJRQHm0oi8
         c2d8EIeviic20oNZHKw+sfJMe7woMPxh6L2OxU0J21cCQNcjccUX+WNpfMIH8Pu+xhd0
         sO6fkmqilDo/93nMbAJZ4QrtmxbhLHOOQ7GNKum2MQm05Ds/Hhm8iHwZM8dSoVq68B7R
         WixL8YinjCpOI/oAE4je9+/3lCUocqV7q+YWIWXqn74TftuKPnAw4+ieTBAaY17WPrHt
         VODnwMnGJE2C5meZrMYvmthpuDioqyGageYgv4e666vT7GK+rq7iv5Ce8lRB0c48W72i
         vtFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681992875; x=1684584875;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qaylrUdg0+csiYgaM5+2CX7gGdXl19IxIjKJHzKB4FY=;
        b=QXvn7BqqCEHtjtnIPfkW0RWfgdeHZQvhHW2DLvSup2ch7yyevj+Q0cdKAWBJpizz2f
         QYwjuDLKdRhAoaO+NUBuT3QUOKHbRcIIoUmqoPxNSs1L3uUaLot0gQDMKbgbFdoe3HZ/
         mkaTFd3HumVqJJ2FBAxZc9UsW0BccaeyCCbqF96HkEIVfN6OQ0ooYcOy7MkFak9gb3u4
         NR8S1AORWrVd9fnEM1Cei/PqB5HHmBPswHzI4gJOQGGBf2abXZQKw+xB5DtoREBKJtN6
         kvYaTUkMPoAi8fvpMNWHxNyG1iq7ioO494i8E4giGhTOkFiCfy/yTcKQHz0ntwiyEX39
         JK1w==
X-Gm-Message-State: AAQBX9fb8a/VMLoGRdRjA4W8S6hiEQcHVlC11BbkuO6gnj4o3hrVGuV/
	jittIk6rG8uj6Y783yzAf1f0sqd0FeycF5HDHSIl2ex79To=
X-Google-Smtp-Source: AKy350Yrv4NYwerSTBFmlWC65yBwWFEnf0PlTtRdRTVul1G1PUYzblBBWp37FTc5NhUJghGF9mgjX7tbs1+jP1CKVe4=
X-Received: by 2002:a1f:a294:0:b0:443:e6f7:e37e with SMTP id
 l142-20020a1fa294000000b00443e6f7e37emr852770vke.0.1681992875635; Thu, 20 Apr
 2023 05:14:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1681917551.git.alexl@redhat.com> <69fa1af45ee0f51b50c1ff8a386a57d2842379c9.1681917551.git.alexl@redhat.com>
In-Reply-To: <69fa1af45ee0f51b50c1ff8a386a57d2842379c9.1681917551.git.alexl@redhat.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 20 Apr 2023 15:14:24 +0300
Message-ID: <CAOQ4uxidTC7ZqxRjxDQ1cBGm0m4nzsjBjE-TRMjrk7XsS34qgg@mail.gmail.com>
Subject: Re: [PATCH 3/6] ovl: Break out ovl_entry_path_lowerdata() from ovl_path_lowerdata()
To: Alexander Larsson <alexl@redhat.com>
Cc: miklos@szeredi.hu, linux-unionfs@vger.kernel.org, ebiggers@kernel.org, 
	tytso@mit.edu, fsverity@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 20, 2023 at 10:44=E2=80=AFAM Alexander Larsson <alexl@redhat.co=
m> wrote:
>
> This will be needed later when getting the lowerdata path from the
> ovl_entry in ovl_lookup() before the dentry is set up.
>
> Signed-off-by: Alexander Larsson <alexl@redhat.com>
> ---
>  fs/overlayfs/overlayfs.h |  1 +
>  fs/overlayfs/util.c      | 11 +++++++++--
>  2 files changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/fs/overlayfs/overlayfs.h b/fs/overlayfs/overlayfs.h
> index 477008186d18..3d14770dc711 100644
> --- a/fs/overlayfs/overlayfs.h
> +++ b/fs/overlayfs/overlayfs.h
> @@ -395,6 +395,7 @@ void ovl_path_upper(struct dentry *dentry, struct pat=
h *path);
>  void ovl_path_lower(struct dentry *dentry, struct path *path);
>  void ovl_path_lowerdata(struct dentry *dentry, struct path *path);
>  void ovl_i_path_real(struct inode *inode, struct path *path);
> +void ovl_entry_path_lowerdata(struct ovl_entry *oe, struct path *path);
>  void ovl_entry_path_real(struct ovl_fs *ofs, struct ovl_entry *oe,
>                          struct dentry *upperdentry, struct path *path);
>  enum ovl_path_type ovl_path_real(struct dentry *dentry, struct path *pat=
h);
> diff --git a/fs/overlayfs/util.c b/fs/overlayfs/util.c
> index 77c954591daa..17eff3e31239 100644
> --- a/fs/overlayfs/util.c
> +++ b/fs/overlayfs/util.c
> @@ -242,9 +242,9 @@ void ovl_path_lower(struct dentry *dentry, struct pat=
h *path)
>         }
>  }
>
> -void ovl_path_lowerdata(struct dentry *dentry, struct path *path)
> +void ovl_entry_path_lowerdata(struct ovl_entry *oe,

Nit: I would use ovl_e_ prefix. Not critical.

> +                             struct path *path)
>  {
> -       struct ovl_entry *oe =3D OVL_E(dentry);
>         struct ovl_path *lowerdata =3D ovl_lowerdata(oe);
>         struct dentry *lowerdata_dentry =3D ovl_lowerdata_dentry(oe);
>
> @@ -262,6 +262,13 @@ void ovl_path_lowerdata(struct dentry *dentry, struc=
t path *path)
>         }
>  }
>
> +void ovl_path_lowerdata(struct dentry *dentry, struct path *path)
> +{
> +       struct ovl_entry *oe =3D OVL_E(dentry);
> +
> +       return ovl_entry_path_lowerdata(oe, path);

Nit: I wouldn't use a helper var here.

Otherwise you may add (also to the previous helper patch):

Reviewed-by: Amir Goldstein <amir73il@gmail.com>

Thanks,
Amir.
