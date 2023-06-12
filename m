Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BABAAD3C
	for <fsverity@lists.linux.dev>; Mon, 12 Jun 2023 11:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686568209;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Cp8GoFCXutEUKrZ9b8hL6TEidWt/LQg4Mbbqz6HQOU8=;
	b=A4n2pkeMq4G89MTsyf5Zh8pPi9UOmO5PX451PvfZb7ZTgyt/0KpcuHnTvbbCTz6JgW5TrT
	nQFD8JN850cQASYNTIwTYg8GV9Q2ehrz4dNZPfAmFbBh1e4uAViDRV0xrvD/PWxWvHaqRA
	w2rinv4pbgWZeEVdiwUbJAPIb8esGkE=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-563-WXoVNCj4MAWvRMM-VqXVGA-1; Mon, 12 Jun 2023 07:10:07 -0400
X-MC-Unique: WXoVNCj4MAWvRMM-VqXVGA-1
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-7778eb7966eso438132639f.1
        for <fsverity@lists.linux.dev>; Mon, 12 Jun 2023 04:10:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686568207; x=1689160207;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cp8GoFCXutEUKrZ9b8hL6TEidWt/LQg4Mbbqz6HQOU8=;
        b=Hq/9CD5IEW+zNvPVAqcPGcJ/eUEVgADi2Sbbyjjeu6g5zEqR8EiK9o3S0OUoJnA0sQ
         bpFcQgsuP+U7Oy2J2rxnmOF2KDOPGSJe+z+Iw3vz/ee2JPuqZEkJ7L36fPFaPGurRDNu
         0K3lcqacLhRkodJLfZBBflz1IQtjDF47ERMjj/NSvCbYPVLgh4ZJU7pQJnvE4zNlMmhU
         7oU+z6OzuD9GXpeZV1KdK1BzxqjJuZN7nYncDbRXmoCa1erN8pM2/c8RBqKyVL+JJLdu
         RXxIku9eBDU0zxkCkSN1B4s8KkYjdkK1Pp2RhtQsSHxPJsl4JkwU+M7bT+VXdNwTtyfu
         LABg==
X-Gm-Message-State: AC+VfDzUwWc4axK+hJyYf02E257pumUrLj59I/GJBeoM8LMsf4Fox4zt
	dQ6zwnwNzIEMeOBqXJw8X84/cT0/Q7dbvleoHU5TukIAjvDxuHImBQvwlihBxXpu1GT32j9sALI
	GngGnzZQ2NEfG/WxjJe/fJU/YiMzu/2OeHkM=
X-Received: by 2002:a92:cacb:0:b0:338:b9a1:5d06 with SMTP id m11-20020a92cacb000000b00338b9a15d06mr7196193ilq.2.1686568207152;
        Mon, 12 Jun 2023 04:10:07 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4BxkHx/pslQNEhG/r7Ottt42/vgAZ6bfx3OXW+5lgTrwYxnDq/VSEVFxAH5ApNpEMJJb5h0WMxBR5yu7H3/N0=
X-Received: by 2002:a92:cacb:0:b0:338:b9a1:5d06 with SMTP id
 m11-20020a92cacb000000b00338b9a15d06mr7196179ilq.2.1686568206887; Mon, 12 Jun
 2023 04:10:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1686565330.git.alexl@redhat.com> <CAOQ4uxgmV1KKCeq8=8FPkAciwqPpz8JiSM8WEuxDaZbVuYcQ7Q@mail.gmail.com>
In-Reply-To: <CAOQ4uxgmV1KKCeq8=8FPkAciwqPpz8JiSM8WEuxDaZbVuYcQ7Q@mail.gmail.com>
From: Alexander Larsson <alexl@redhat.com>
Date: Mon, 12 Jun 2023 13:09:56 +0200
Message-ID: <CAL7ro1EiYOOOqexrKy+UXRzmpGyCaNec3+LHGxnA0YfmoMDN3A@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] ovl: Add support for fs-verity checking of lowerdata
To: Amir Goldstein <amir73il@gmail.com>
Cc: miklos@szeredi.hu, linux-unionfs@vger.kernel.org, ebiggers@kernel.org, 
	tytso@mit.edu, fsverity@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 12, 2023 at 12:54=E2=80=AFPM Amir Goldstein <amir73il@gmail.com=
> wrote:
>
> On Mon, Jun 12, 2023 at 1:27=E2=80=AFPM Alexander Larsson <alexl@redhat.c=
om> wrote:
> >
> > This patchset adds support for using fs-verity to validate lowerdata
> > files by specifying an overlay.verity xattr on the metacopy
> > files.
> >
> > This is primarily motivated by the Composefs usecase, where there will
> > be a read-only EROFS layer that contains redirect into a base data
> > layer which has fs-verity enabled on all files. However, it is also
> > useful in general if you want to ensure that the lowerdata files
> > matches the expected content over time.
> >
> > I have also added some tests for this feature to xfstests[1].
>
> I can't remember if there is a good reason why your test does
> not include verify in a data-only layer.
>
> I think this test coverage needs to be added.

Yeah. I'll add that.

> >
> > I'm also CC:ing the fsverity list and maintainers because there is one
> > (tiny) fsverity change, and there may be interest in this usecase.
> >
> > Changes since v2:
> >  * Rebased on top of overlayfs-next
> >  * We now alway do verity verification the first time the file content
> >    is used, rather than doing it at lookup time for the non-lazy lookup
> >    case.
>
> Aparat from the minor comment:
>
> Reviewed-by: Amir Goldstein <amir73il@gmail.com>
>
> for the series.
>
> Thanks,
> Amir.
>
> >
> > Changes since v1:
> >  * Rebased on v2 lazy lowerdata series
> >  * Dropped the "validate" mount option variant. We now only support
> >    "off", "on" and "require", where "off" is the default.
> >  * We now store the digest algorithm used in the overlay.verity xattr.
> >  * Dropped ability to configure default verity options, as this could
> >    cause problems moving layers between machines.
> >  * We now properly resolve dependent mount options by automatically
> >    enabling metacopy and redirect_dir if verity is on, or failing
> >    if the specified options conflict.
> >  * Streamlined and fixed the handling of creds in ovl_ensure_verity_loa=
ded().
> >  * Renamed new helpers from ovl_entry_path_ to ovl_e_path_
> >
> > [1] https://github.com/alexlarsson/xfstests/commits/verity-tests
> >
> > Alexander Larsson (4):
> >   fsverity: Export fsverity_get_digest
> >   ovl: Add framework for verity support
> >   ovl: Validate verity xattr when resolving lowerdata
> >   ovl: Handle verity during copy-up
> >
> >  Documentation/filesystems/overlayfs.rst |  27 +++++
> >  fs/overlayfs/copy_up.c                  |  33 +++++-
> >  fs/overlayfs/file.c                     |   8 +-
> >  fs/overlayfs/namei.c                    |  54 +++++++++-
> >  fs/overlayfs/overlayfs.h                |  12 ++-
> >  fs/overlayfs/ovl_entry.h                |   3 +
> >  fs/overlayfs/super.c                    |  79 +++++++++++++-
> >  fs/overlayfs/util.c                     | 133 ++++++++++++++++++++++++
> >  fs/verity/measure.c                     |   1 +
> >  9 files changed, 340 insertions(+), 10 deletions(-)
> >
> > --
> > 2.40.1
> >
>


--=20
=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D
 Alexander Larsson                                Red Hat, Inc
       alexl@redhat.com         alexander.larsson@gmail.com

