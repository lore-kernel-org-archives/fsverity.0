Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEDA111CAD
	for <fsverity@lists.linux.dev>; Mon, 12 Jun 2023 10:54:51 +0000 (UTC)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-43b4056391dso1064795137.1
        for <fsverity@lists.linux.dev>; Mon, 12 Jun 2023 03:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686567290; x=1689159290;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=55JZQuWiKXsW5VvUXF+T4Pc/c2vTJw0zoDl6WyRqKhM=;
        b=pn0Ua+y2rkPorzQy7TELsOQ2xoxostJxbsR/n7ZV5HHuzi7zg8GFdZvoB90g5XEkSm
         qNYXGCbC/SWNxrIG3aG2zCERkwG8xclulZW/LEL4j6nqASnipeZoMm3FKrmYpxcugEU7
         dxQPzrbOjjAQWdim0RdMVmNNrNVnQPhjA6g0A5BEDGaziGn00+x06pI2h6QK4fmBOfTR
         JBPxphOO7i5/yEKXnGxNzLs241ACnRh1ydflYvEEeycWrhOeg/0VAvcDtJ/CPVbQzLtY
         ZMBdeUfTJmSPhWbeXi1CuD1nZZnCulLOH6Fjt48Pe+Ev1YTcXkHjW8ycJnHPE4z7NYmm
         cI5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686567290; x=1689159290;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=55JZQuWiKXsW5VvUXF+T4Pc/c2vTJw0zoDl6WyRqKhM=;
        b=NT+um+ZKZI6hvMI0CDb+SQg/JmjL2IdyHNm7fblwrjKcwLzPYvM3yanshf9DagLUOc
         Z9DSSl366uECagvzG68UXXBrBEsGVMqDmStHXI4CVYbnhxvJBPEat3jZspQBCTKwCixA
         gb0iQ/Dpkzfui9pyZRURz/rkDhLxDv7zuKGSelTT3T8/TW/Cr3zOVu4jzbOfHPnFX00Z
         NekAgSHh32fEmBfdwRen36DP8DMhPAn4TlBoID4uxe65tf6vTzps8H9n0cPdGLoxhXc6
         DGpWwRAS4fB/fGoy0lLlTv+ZsArELYfm6sEec+Yf2i64tRnjb8oZZ3AEQeLs+X3+ElkO
         aFxA==
X-Gm-Message-State: AC+VfDyBMUYWn3Ev4l7SuDJkfgozATN/ZoqJfraWHHVpau+X9mgkrnhj
	+8N5byHX5NsboqUqEIxvEongdhT5V3fcDSK/Ucw=
X-Google-Smtp-Source: ACHHUZ4rZIKzHr21LaHPT+GdND8QaN+XV9Zc06J4patG32oyhi+Z8Yddb4Id/n0yTZo7DlUCC6O1oz8B6ubO0WCtnIA=
X-Received: by 2002:a05:6102:112:b0:43b:34ff:5b4a with SMTP id
 z18-20020a056102011200b0043b34ff5b4amr3424744vsq.28.1686567290233; Mon, 12
 Jun 2023 03:54:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1686565330.git.alexl@redhat.com>
In-Reply-To: <cover.1686565330.git.alexl@redhat.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Mon, 12 Jun 2023 13:54:38 +0300
Message-ID: <CAOQ4uxgmV1KKCeq8=8FPkAciwqPpz8JiSM8WEuxDaZbVuYcQ7Q@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] ovl: Add support for fs-verity checking of lowerdata
To: Alexander Larsson <alexl@redhat.com>
Cc: miklos@szeredi.hu, linux-unionfs@vger.kernel.org, ebiggers@kernel.org, 
	tytso@mit.edu, fsverity@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 12, 2023 at 1:27=E2=80=AFPM Alexander Larsson <alexl@redhat.com=
> wrote:
>
> This patchset adds support for using fs-verity to validate lowerdata
> files by specifying an overlay.verity xattr on the metacopy
> files.
>
> This is primarily motivated by the Composefs usecase, where there will
> be a read-only EROFS layer that contains redirect into a base data
> layer which has fs-verity enabled on all files. However, it is also
> useful in general if you want to ensure that the lowerdata files
> matches the expected content over time.
>
> I have also added some tests for this feature to xfstests[1].

I can't remember if there is a good reason why your test does
not include verify in a data-only layer.

I think this test coverage needs to be added.

>
> I'm also CC:ing the fsverity list and maintainers because there is one
> (tiny) fsverity change, and there may be interest in this usecase.
>
> Changes since v2:
>  * Rebased on top of overlayfs-next
>  * We now alway do verity verification the first time the file content
>    is used, rather than doing it at lookup time for the non-lazy lookup
>    case.

Aparat from the minor comment:

Reviewed-by: Amir Goldstein <amir73il@gmail.com>

for the series.

Thanks,
Amir.

>
> Changes since v1:
>  * Rebased on v2 lazy lowerdata series
>  * Dropped the "validate" mount option variant. We now only support
>    "off", "on" and "require", where "off" is the default.
>  * We now store the digest algorithm used in the overlay.verity xattr.
>  * Dropped ability to configure default verity options, as this could
>    cause problems moving layers between machines.
>  * We now properly resolve dependent mount options by automatically
>    enabling metacopy and redirect_dir if verity is on, or failing
>    if the specified options conflict.
>  * Streamlined and fixed the handling of creds in ovl_ensure_verity_loade=
d().
>  * Renamed new helpers from ovl_entry_path_ to ovl_e_path_
>
> [1] https://github.com/alexlarsson/xfstests/commits/verity-tests
>
> Alexander Larsson (4):
>   fsverity: Export fsverity_get_digest
>   ovl: Add framework for verity support
>   ovl: Validate verity xattr when resolving lowerdata
>   ovl: Handle verity during copy-up
>
>  Documentation/filesystems/overlayfs.rst |  27 +++++
>  fs/overlayfs/copy_up.c                  |  33 +++++-
>  fs/overlayfs/file.c                     |   8 +-
>  fs/overlayfs/namei.c                    |  54 +++++++++-
>  fs/overlayfs/overlayfs.h                |  12 ++-
>  fs/overlayfs/ovl_entry.h                |   3 +
>  fs/overlayfs/super.c                    |  79 +++++++++++++-
>  fs/overlayfs/util.c                     | 133 ++++++++++++++++++++++++
>  fs/verity/measure.c                     |   1 +
>  9 files changed, 340 insertions(+), 10 deletions(-)
>
> --
> 2.40.1
>
