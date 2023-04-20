Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E58A5661
	for <fsverity@lists.linux.dev>; Thu, 20 Apr 2023 12:12:34 +0000 (UTC)
Received: by mail-ua1-f45.google.com with SMTP id a26so2014420uak.5
        for <fsverity@lists.linux.dev>; Thu, 20 Apr 2023 05:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681992753; x=1684584753;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nguzq/f1Tjc/dp3Jnp8k4tZEg8n0swUGPV8jptc/xXY=;
        b=DHQ2lFx2MizWMQQrYU/Zu46mRFRdtM4lEuTKEsZ2tYoxgcQldR2JQ3bQG2T5mJxOhR
         b75zfmVi6WHumlV1KqvFEWyjGGVYORoOOzJPrPnkiI4CpPGnKMKfmiJ1Ff9xQI0zujLX
         4LYMoxP6wcwkhMzWAnZjrlTobrLtGROySoTCpSUIU+YuAwZ0m7x0NruhjcL6YQ+pes6s
         8rXwcP7fpckfnNNU0nNaDew9KHsoHdrDkSu5pbQUB4AWIuEWUJnxePaWNC5R0EJoHYx/
         IxKIea0Lg7bjgZNTEoc7z6Ir8vLhMM1MZdom9RxmnKYhM4+VBHC42WTpzqRHeLK65F8T
         a7Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681992753; x=1684584753;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nguzq/f1Tjc/dp3Jnp8k4tZEg8n0swUGPV8jptc/xXY=;
        b=G7faX1tVik7l8/pLaay+tDo0rE3QjM2IXIewmcljv0i6Z0HXxYA1p5njPFk3UGTUok
         jAkzNDqWsWgbY6NCwJ/J7zbCwBh3w9LQ/P16UODSmMbjDA1KjjbdX+H5eRbnAg6j3IsV
         WPIXE7ZoKx3ZQeWh3S5RXxUR4v3Kv6Ao2TYoqj/CEKJfXkycYbGS8gKu6PDLTh7bsyST
         GPKwe8Ais+uG/CxpRUu5qhcjyBGz0RTEZi1zVH/DMe1raDD6gvHTE15g9QNBY4mFczIo
         k2iMkhAWuBCOYe5hMORfOKTRIjiC8tgLseCWoUjUrVElKDUEGL8jk+B/ZrKP3XkehJiP
         /OPQ==
X-Gm-Message-State: AAQBX9dPiuFiyuQdUz4zLvPCUyefBdA4BXaJlsqXSORbE3H2UE9D/0vV
	GR1ikhRR2A1XvmKgqxl3+rxczbB2n0hIG0SymvA=
X-Google-Smtp-Source: AKy350ZAWQBzAc920rmXqxFboV4WcJL/RkyzdyZVEAjmX5ykGw8ZKiZGhVdmaEOPbZo+XnBZYCpAiMN+G0rft3UT7lE=
X-Received: by 2002:a1f:a994:0:b0:446:c76f:a7e5 with SMTP id
 s142-20020a1fa994000000b00446c76fa7e5mr855147vke.0.1681992753049; Thu, 20 Apr
 2023 05:12:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1681917551.git.alexl@redhat.com> <4c5c62c05a00a97dce0ce5fbee020e82ee76c202.1681917551.git.alexl@redhat.com>
In-Reply-To: <4c5c62c05a00a97dce0ce5fbee020e82ee76c202.1681917551.git.alexl@redhat.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 20 Apr 2023 15:12:21 +0300
Message-ID: <CAOQ4uxihGt_W=o69fdGn4DCKpY-kJYYvhhXf0qxqDLRmWAyL3w@mail.gmail.com>
Subject: Re: [PATCH 2/6] ovl: Break out ovl_entry_path_real() from ovl_i_path_real()
To: Alexander Larsson <alexl@redhat.com>
Cc: miklos@szeredi.hu, linux-unionfs@vger.kernel.org, ebiggers@kernel.org, 
	tytso@mit.edu, fsverity@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 20, 2023 at 10:44=E2=80=AFAM Alexander Larsson <alexl@redhat.co=
m> wrote:
>
> This allows us to get the real path from the ovl_entry in ovl_lookup()
> before having finished setting up the resulting inode.
>
> Signed-off-by: Alexander Larsson <alexl@redhat.com>
> ---
>  fs/overlayfs/overlayfs.h |  2 ++
>  fs/overlayfs/util.c      | 25 ++++++++++++++++++-------
>  2 files changed, 20 insertions(+), 7 deletions(-)
>
> diff --git a/fs/overlayfs/overlayfs.h b/fs/overlayfs/overlayfs.h
> index 4e327665c316..477008186d18 100644
> --- a/fs/overlayfs/overlayfs.h
> +++ b/fs/overlayfs/overlayfs.h
> @@ -395,6 +395,8 @@ void ovl_path_upper(struct dentry *dentry, struct pat=
h *path);
>  void ovl_path_lower(struct dentry *dentry, struct path *path);
>  void ovl_path_lowerdata(struct dentry *dentry, struct path *path);
>  void ovl_i_path_real(struct inode *inode, struct path *path);
> +void ovl_entry_path_real(struct ovl_fs *ofs, struct ovl_entry *oe,
> +                        struct dentry *upperdentry, struct path *path);
>  enum ovl_path_type ovl_path_real(struct dentry *dentry, struct path *pat=
h);
>  enum ovl_path_type ovl_path_realdata(struct dentry *dentry, struct path =
*path);
>  struct dentry *ovl_dentry_upper(struct dentry *dentry);
> diff --git a/fs/overlayfs/util.c b/fs/overlayfs/util.c
> index 9a042768013e..77c954591daa 100644
> --- a/fs/overlayfs/util.c
> +++ b/fs/overlayfs/util.c
> @@ -351,19 +351,30 @@ struct dentry *ovl_i_dentry_upper(struct inode *ino=
de)
>         return ovl_upperdentry_dereference(OVL_I(inode));
>  }
>
> -void ovl_i_path_real(struct inode *inode, struct path *path)
> -{
> -       struct ovl_path *lowerstack =3D ovl_lowerstack(OVL_I_E(inode));
> +void ovl_entry_path_real(struct ovl_fs *ofs,

Nit: I would use ovl_e_ prefix. Not critical.

Thanks,
Amir.
