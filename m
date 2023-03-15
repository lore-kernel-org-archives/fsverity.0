Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E406123
	for <fsverity@lists.linux.dev>; Wed, 15 Mar 2023 20:01:52 +0000 (UTC)
Received: by mail-il1-f175.google.com with SMTP id h5so6950096ile.13
        for <fsverity@lists.linux.dev>; Wed, 15 Mar 2023 13:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1678910511;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QdLj1A8OJQmCn9L+6EagDYwqPweTZs0gPc0iNxYbwNQ=;
        b=LklbiHJvuZuqc/Bx1Wq8jpqDIoCGLqhnel9DKGs/Hr6pzv1ZAH4iK+hjfl9nfGI+7z
         y3+pcG/jgu+3VVxyOH/l5ET0gdmJN8aa1jy5ULMS1i61ZoAI0TSA8xnhydXb32yLqvuO
         X+hOlx/zn/q8aHK0qsN7FB/yOqBXYro4a2OrNdzQED7yTXzq5xFCkWI7aJSV5rWdxIyq
         ywsZRYeQPuyKEdVm7u4QqA25tA8hMnuzpO38/qpMX8gCltPcINbjt6PqtH1PXN2WN+Jk
         nW+FQLIO2NCMhb9XhzNdITDuYbA6KgRKI8wnYHArbl/TeDMH+hMPfgsVrLb+OoHy58iD
         dLxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678910511;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QdLj1A8OJQmCn9L+6EagDYwqPweTZs0gPc0iNxYbwNQ=;
        b=0GjkCOXd9+TJIlA95w8Q9x6V6g5q7y46EnTLDxSQJx1hNAifeWDJlGH54iMdeOouGb
         qBi9OxVUV0rMV8jDPk4xTkEfuTMJGD1CMjj6QlyMeAZnenOtgtOtCj/9Cp87uaB6/FYV
         XXuD6SKWaRf0eNfkd0Zh0VvXPznvwuJH3D5rJ7bEdIX/pz1wtvQKccqnv3DYwfPYphO8
         1RLFODnASBkzjDlx8s58UOurTNenuL91chguwRVALl2C0mGAwq7kqIP77Oifniid3Gau
         ljjO/uNDhkOS36xPpO5Bprdf9lBETy2s1F16xGbwAgty1QA/ydsBMrLNLR4FGXQC1p3E
         3yqQ==
X-Gm-Message-State: AO0yUKX9UnXcXRXb7ufDnM6zBg+xumB8A2X02eb3bgbPv/5NcKv1FpDB
	vQksEhjusJGqewZYdAfunbVlTwgsrJgQ1pEwKKldUw==
X-Google-Smtp-Source: AK7set9WGH1pDwg9Oc343uqZgOz19nbKLKKiJkee6xGh4enienlupjLecLu+/AQ9ICV9i8UGt+CllvLOVlLVwVN8HHE=
X-Received: by 2002:a92:d90b:0:b0:322:fdbc:d1a2 with SMTP id
 s11-20020a92d90b000000b00322fdbcd1a2mr3821819iln.2.1678910510983; Wed, 15 Mar
 2023 13:01:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230314235332.50270-1-ebiggers@kernel.org>
In-Reply-To: <20230314235332.50270-1-ebiggers@kernel.org>
From: Victor Hsieh <victorhsieh@google.com>
Date: Wed, 15 Mar 2023 13:01:38 -0700
Message-ID: <CAFCauYOtRO3i0=HuogKngkxO4_au7ftD7aB+M0A-kcsdMUXmfA@mail.gmail.com>
Subject: Re: [PATCH] fsverity: don't drop pagecache at end of FS_IOC_ENABLE_VERITY
To: Eric Biggers <ebiggers@kernel.org>
Cc: fsverity@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Victor Hsieh <victorhsieh@google.com>

On Tue, Mar 14, 2023 at 4:55=E2=80=AFPM Eric Biggers <ebiggers@kernel.org> =
wrote:
>
> From: Eric Biggers <ebiggers@google.com>
>
> The full pagecache drop at the end of FS_IOC_ENABLE_VERITY is causing
> performance problems and is hindering adoption of fsverity.  It was
> intended to solve a race condition where unverified pages might be left
> in the pagecache.  But actually it doesn't solve it fully.
>
> Since the incomplete solution for this race condition has too much
> performance impact for it to be worth it, let's remove it for now.
>
> Fixes: 3fda4c617e84 ("fs-verity: implement FS_IOC_ENABLE_VERITY ioctl")
> Cc: stable@vger.kernel.org
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>  fs/verity/enable.c | 25 +++++++++++++------------
>  1 file changed, 13 insertions(+), 12 deletions(-)
>
> diff --git a/fs/verity/enable.c b/fs/verity/enable.c
> index e13db6507b38b..7a0e3a84d370b 100644
> --- a/fs/verity/enable.c
> +++ b/fs/verity/enable.c
> @@ -8,7 +8,6 @@
>  #include "fsverity_private.h"
>
>  #include <linux/mount.h>
> -#include <linux/pagemap.h>
>  #include <linux/sched/signal.h>
>  #include <linux/uaccess.h>
>
> @@ -367,25 +366,27 @@ int fsverity_ioctl_enable(struct file *filp, const =
void __user *uarg)
>                 goto out_drop_write;
>
>         err =3D enable_verity(filp, &arg);
> -       if (err)
> -               goto out_allow_write_access;
>
>         /*
> -        * Some pages of the file may have been evicted from pagecache af=
ter
> -        * being used in the Merkle tree construction, then read into pag=
ecache
> -        * again by another process reading from the file concurrently.  =
Since
> -        * these pages didn't undergo verification against the file diges=
t which
> -        * fs-verity now claims to be enforcing, we have to wipe the page=
cache
> -        * to ensure that all future reads are verified.
> +        * We no longer drop the inode's pagecache after enabling verity.=
  This
> +        * used to be done to try to avoid a race condition where pages c=
ould be
> +        * evicted after being used in the Merkle tree construction, then
> +        * re-instantiated by a concurrent read.  Such pages are unverifi=
ed, and
> +        * the backing storage could have filled them with different cont=
ent, so
> +        * they shouldn't be used to fulfill reads once verity is enabled=
.
> +        *
> +        * But, dropping the pagecache has a big performance impact, and =
it
> +        * doesn't fully solve the race condition anyway.  So for those r=
easons,
> +        * and also because this race condition isn't very important rela=
tively
> +        * speaking (especially for small-ish files, where the chance of =
a page
> +        * being used, evicted, *and* re-instantiated all while enabling =
verity
> +        * is quite small), we no longer drop the inode's pagecache.
>          */
> -       filemap_write_and_wait(inode->i_mapping);
> -       invalidate_inode_pages2(inode->i_mapping);
>
>         /*
>          * allow_write_access() is needed to pair with deny_write_access(=
).
>          * Regardless, the filesystem won't allow writing to verity files=
.
>          */
> -out_allow_write_access:
>         allow_write_access(filp);
>  out_drop_write:
>         mnt_drop_write_file(filp);
>
> base-commit: f959325e6ac3f499450088b8d9c626d1177be160
> --
> 2.39.2
>
