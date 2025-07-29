Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57CAA2777E4
	for <fsverity@lists.linux.dev>; Tue, 29 Jul 2025 09:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753782805; cv=none; b=UItn8ZtLU7XobSRdy98VhSZiEfg/XN2Ft0SDu+Kqs80UN/E14ynQq8EPtx9ZIvMbMy8aSsfktkEqFuORJMjKMfFKwfD8XATlqauK5gVo1R1sx/9ZZ/fxkiuqPPTW5WooS+NyEO4EEudjqumD90k7F2fgthAOogulTGgsLfTFpUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753782805; c=relaxed/simple;
	bh=7+SJUIAuwlucDpr/Ujqn/MTDxXbwcZf6SPuXrL327zc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b2EzGeB5Qqi5z0aq9YDQz/SSRr61M7bRdOw14srRb+C/kDUTWLdyfSEI+wFnZrlPxcef1x9SibW1Yfw02bGSjvTV47qOzCyJ+AwY86VkqlbUkm0EP+510AE3r3vqfiDbTqbM/G0cdy8qsK4HS56xxzggx9qGCZy5iWWdPsr9tn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hBYUFShJ; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hBYUFShJ"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ae3703c2a8bso1123986366b.0
        for <fsverity@lists.linux.dev>; Tue, 29 Jul 2025 02:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753782802; x=1754387602; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HFX+lzexMcAGbZ75ILE4gw1AriEScd2jvceXRZZOKC4=;
        b=hBYUFShJ0yQfw7lPW1vd9zJmHk8n7NkkuHBkxYjUg/gPjq2TbeAvBAOTz7LFZJkAIl
         fSjpStypOKGWqT+kXVWy29Jg527PUq9lQliGV3wN6gLnuciXVW1fR82uB+8GlxzhEMvN
         cvgPQ7+v35T5xbfj5kgwunD7nhov932QMufGeAA+SUieU0UrPdYN2rlI/EyQ0eeFFG24
         VuM0Prrd6x++iXlWYLi94sZUlraPE0bZuStwDFQonBo9ssR2z6KiFFnUp1VmIvjyRQQ2
         wz2dXGXmfOyyDCnWbfQY1DjAHosJ7Bh1+xNimY8igo/pZxmRQG87n0hor0KIxmpooTan
         HG8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753782802; x=1754387602;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HFX+lzexMcAGbZ75ILE4gw1AriEScd2jvceXRZZOKC4=;
        b=PxPiax7dilrkap/FTP8TTPO1fcBnZF40hyICFXJYeCPVRb++CKsmjWP56yIewEsViZ
         3l66cZyBb/JLN2bAmANnj+PB+oTwDrjsN0Y8KgB9MFA7DhO7F5+p99MaBO9/SeLW6QGp
         7NS2hMv8OOoJ/y2VFCynJ7k9/MDtNZopy7Bdp9jneeqbjtIR6iA0QKJxVwoYxGKDMKkr
         gQT+uSWfhTH2Evw0rLfoxY2TGUAyRJ5l+y/5mnuK1dEU9+KCvePlhzsx/pb0X04E6QQM
         66xKfZr/PRY+HM2AIliV+/7xNS1QcHL5Gfzt22bF+v9UTBxrh6Bj+gl2CswSR5T+g7T6
         lA2A==
X-Gm-Message-State: AOJu0YyJkFhuvFlkCUrx+DIIRecH99Snf+KTy4k/dM9cCw6431ej2EFO
	Jl7UlXDOHF5GTviRPa6lrrUwu5t9PX6NH+axxJc9t0e1vF3Mw9hTt7UPw5TwzjhZPz+NZNKBtBW
	LufTIHYTrAbeAzZTsf8RvPF8vsE9b2qI=
X-Gm-Gg: ASbGncuKdMDqLTNq+RRB6yxOALKdH91OUxQn8CtO0YvWnbZmVUr7UF+RYjSBc5Yz+4Z
	hoXJi4SbIRa+L42hM+sUoHYudIuWv7GQr2gA3DeTH7KajR5hpTL2mSufUFNJTNmGXlMhj10GIdo
	ItQMmGqupnkNPhFI+QIzDZejjo6ULnZUcvl7cNUlkpRVcpu+cwT5236jE8SxOKtjQSjzIbpfSb6
	oCw9fY=
X-Google-Smtp-Source: AGHT+IHI/EjqqMmf950Go3Z5plmrSUsz6yT8F0YJthhOd/QbOT9YKyo4zEAy4B5Ob1BOlXMqOQ8qFmSeRWJYCXTVneU=
X-Received: by 2002:a17:907:1ca3:b0:ad4:d00f:b4ca with SMTP id
 a640c23a62f3a-af619a0795cmr1505116566b.50.1753782801221; Tue, 29 Jul 2025
 02:53:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250728-fsverity-v1-0-9e5443af0e34@kernel.org> <20250728-fsverity-v1-3-9e5443af0e34@kernel.org>
In-Reply-To: <20250728-fsverity-v1-3-9e5443af0e34@kernel.org>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 29 Jul 2025 11:53:09 +0200
X-Gm-Features: Ac12FXx2e9WU_rYdw6lpKj0TUobg7gmcCx3m27ycNICGFD2Gmpnq_21heHmT1Mk
Message-ID: <CAOQ4uxjXucbQderHmkd7Dw9---U4hA7PjdgA7M7r5BZ+kXbKiQ@mail.gmail.com>
Subject: Re: [PATCH RFC 03/29] fs: add FS_XFLAG_VERITY for verity files
To: Andrey Albershteyn <aalbersh@redhat.com>, Christian Brauner <brauner@kernel.org>
Cc: fsverity@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
	linux-xfs@vger.kernel.org, david@fromorbit.com, djwong@kernel.org, 
	ebiggers@kernel.org, hch@lst.de, Andrey Albershteyn <aalbersh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 28, 2025 at 10:31=E2=80=AFPM Andrey Albershteyn <aalbersh@redha=
t.com> wrote:
>
> From: Andrey Albershteyn <aalbersh@redhat.com>
>
> Add extended attribute FS_XFLAG_VERITY for inodes with fs-verity
> enabled.

Oh man! Please don't refer to this as an "extended attribute".

I was quite surprised to see actually how many times the term
"extended attribute" was used in commit messages in your series
that Linus just merged including 4 such references in the Kernel-doc
comments of security_inode_file_[sg]etattr(). :-/

The terminology used in Documentation/filesystem/vfs.rst and fileattr.h
are some permutations of "miscellaneous file flags and attributes".
Not perfect, but less confusing than "extended attributes", which are
famously known as something else.

>
> Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
> [djwong: fix broken verity flag checks]
> Reviewed-by: Darrick J. Wong <djwong@kernel.org>
> Signed-off-by: Darrick J. Wong <djwong@kernel.org>
> Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org>
> ---
>  Documentation/filesystems/fsverity.rst |  8 ++++++++
>  fs/ioctl.c                             | 11 +++++++++++
>  include/uapi/linux/fs.h                |  1 +
>  3 files changed, 20 insertions(+)
>
> diff --git a/Documentation/filesystems/fsverity.rst b/Documentation/files=
ystems/fsverity.rst
> index dacdbc1149e6..33b588c32ed1 100644
> --- a/Documentation/filesystems/fsverity.rst
> +++ b/Documentation/filesystems/fsverity.rst
> @@ -342,6 +342,14 @@ the file has fs-verity enabled.  This can perform be=
tter than
>  FS_IOC_GETFLAGS and FS_IOC_MEASURE_VERITY because it doesn't require
>  opening the file, and opening verity files can be expensive.
>
> +FS_IOC_FSGETXATTR
> +-----------------
> +
> +Since Linux v6.17, the FS_IOC_FSGETXATTR ioctl sets FS_XFLAG_VERITY (0x0=
0020000)
> +in the returned flags when the file has verity enabled. Note that this a=
ttribute
> +cannot be set with FS_IOC_FSSETXATTR as enabling verity requires input
> +parameters. See FS_IOC_ENABLE_VERITY.
> +
>  .. _accessing_verity_files:
>
>  Accessing verity files
> diff --git a/fs/ioctl.c b/fs/ioctl.c
> index 69107a245b4c..6b94da2b93f5 100644
> --- a/fs/ioctl.c
> +++ b/fs/ioctl.c
> @@ -480,6 +480,8 @@ void fileattr_fill_xflags(struct fileattr *fa, u32 xf=
lags)
>                 fa->flags |=3D FS_DAX_FL;
>         if (fa->fsx_xflags & FS_XFLAG_PROJINHERIT)
>                 fa->flags |=3D FS_PROJINHERIT_FL;
> +       if (fa->fsx_xflags & FS_XFLAG_VERITY)
> +               fa->flags |=3D FS_VERITY_FL;
>  }
>  EXPORT_SYMBOL(fileattr_fill_xflags);
>
> @@ -510,6 +512,8 @@ void fileattr_fill_flags(struct fileattr *fa, u32 fla=
gs)
>                 fa->fsx_xflags |=3D FS_XFLAG_DAX;
>         if (fa->flags & FS_PROJINHERIT_FL)
>                 fa->fsx_xflags |=3D FS_XFLAG_PROJINHERIT;
> +       if (fa->flags & FS_VERITY_FL)
> +               fa->fsx_xflags |=3D FS_XFLAG_VERITY;
>  }
>  EXPORT_SYMBOL(fileattr_fill_flags);
>

I think you should add it to FS_COMMON_FL/FS_XFLAG_COMMON?

And I guess also to FS_XFLAGS_MASK/FS_XFLAG_RDONLY_MASK
after rebasing to master.

> @@ -640,6 +644,13 @@ static int fileattr_set_prepare(struct inode *inode,
>             !(S_ISREG(inode->i_mode) || S_ISDIR(inode->i_mode)))
>                 return -EINVAL;
>
> +       /*
> +        * Verity cannot be changed through FS_IOC_FSSETXATTR/FS_IOC_SETF=
LAGS.
> +        * See FS_IOC_ENABLE_VERITY.
> +        */
> +       if ((fa->fsx_xflags ^ old_ma->fsx_xflags) & FS_XFLAG_VERITY)
> +               return -EINVAL;
> +

I think that after rebase, if you add the flag to FS_XFLAG_RDONLY_MASK
This check will fail, so can either remove this check and ignore user tryin=
g to
set FS_XFLAG_VERITY, same as if user was trying to set FS_XFLAG_HASATTR.
or, as I think Darrick may have suggested during review, we remove the mask=
ing
of FS_XFLAG_RDONLY_MASK in the fill helpers and we make this check more
generic here:

+       if ((fa->fsx_xflags ^ old_ma->fsx_xflags) & FS_XFLAG_RDONLY_MASK)
+               return -EINVAL;

Thanks,
Amir.
