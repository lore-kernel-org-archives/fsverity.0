Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82BD43AA91
	for <fsverity@lists.linux.dev>; Thu, 22 Jun 2023 09:37:11 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-3fde00693cfso57174191cf.3
        for <fsverity@lists.linux.dev>; Thu, 22 Jun 2023 02:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687426630; x=1690018630;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9d7SJTWDzyLBq0FOBDDPWEchjvCD3K+2+FvT0uCOCy8=;
        b=M94nXLsiRpyMFlY66kOOKFSJ7Rd/Y/iOxz0kbEkfh+N4iIumH5pJoJzs32KD6p2ToL
         8z77h8ZN++EJTi0XR+hukDwmCdSg6WX5DN9VIDIF7YfCgcbNJ6zLSHORBiZrsAroFupF
         VjOllWGq1BEvDoClXn3JeRErQfvCit1F4qSmkwiHUT8+WFsxJarkKnXn0T3TPf1Xp3La
         aTD+HEc+nXzqM5NuZzOwKl28di2zMh8zZYvd2PoKc+mLrHMEEMX2GRyd0+wlMec9FMtK
         kifrEhRAKbtH2JjI5YUa7YbIweFl6N36BHDBg5r9nj90dEM3jocPYLP+2+gjPAt+U16J
         iE2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687426630; x=1690018630;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9d7SJTWDzyLBq0FOBDDPWEchjvCD3K+2+FvT0uCOCy8=;
        b=AGSbM+Uwv/c9QH+m6vSx//dy7yIJcqt3uwBWoZvHzTOHt+F+FNvBSYx6JklyYJjqD4
         Jg7RrQNKYtSHbW2wT0/nwNAnSIuEn0jeCsAX9Zt4iPVNRBouJETiC58dBaAhZJNH55aq
         NhNvs/XbsJEF82ZB8g57rmPouMkjPC00J395mF/yFwGndtVwZi39KWTBYvg4twxNraU8
         SRODTDzDyMxDspyn2hpEYHO31Vp93/GWjRadjNHuru09DG8Pke3QTNb2ntcYtXWShBtu
         KmeJ6M/2mjt3RNSZFskuSCxFKD4TKIiwbsNBtRJOShOMuyOrJ4hZLI7MNsPqgN3xqjJz
         Ma5g==
X-Gm-Message-State: AC+VfDwWg+G74DAttCTj7R3SLlXzrQLr55LkUaejGpSs8kpbgRes266k
	rgH7WyhIviNtpK2xq7JjD+7ENwOj/7jiNUi7qHU=
X-Google-Smtp-Source: ACHHUZ5+hcMtiEmX7gyIvmmdzj6x0Si5ypWVpWFZf9e7YbCro2PaPPdEBcIeM4PoX/5rwyoRHxrVADGmgOwQoq/L5s0=
X-Received: by 2002:a05:622a:552:b0:3fd:dfbd:3225 with SMTP id
 m18-20020a05622a055200b003fddfbd3225mr19442609qtx.57.1687426630174; Thu, 22
 Jun 2023 02:37:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1686565330.git.alexl@redhat.com> <CAOQ4uxgmV1KKCeq8=8FPkAciwqPpz8JiSM8WEuxDaZbVuYcQ7Q@mail.gmail.com>
 <CAL7ro1EiYOOOqexrKy+UXRzmpGyCaNec3+LHGxnA0YfmoMDN3A@mail.gmail.com>
 <CAL7ro1FKwgUY4e7N_vYi0cFsuVx6St0-oKvcBkiRFnzLH8D1eQ@mail.gmail.com>
 <CAOQ4uxgVnv7wtwFZaBnEotFCwQD1EZcSK2KW4K4vRD8d9fzCiw@mail.gmail.com> <CAL7ro1FY6OmhypFGDjinOkkjyJzymntVje4nRA558dKY+KsgzQ@mail.gmail.com>
In-Reply-To: <CAL7ro1FY6OmhypFGDjinOkkjyJzymntVje4nRA558dKY+KsgzQ@mail.gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 22 Jun 2023 12:36:59 +0300
Message-ID: <CAOQ4uxjuhzxgTxmRXxczJLDrMzKKr-jzS3R8ESwkw4XQ+UyAfQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] ovl: Add support for fs-verity checking of lowerdata
To: Alexander Larsson <alexl@redhat.com>, ebiggers@kernel.org, tytso@mit.edu
Cc: miklos@szeredi.hu, linux-unionfs@vger.kernel.org, fsverity@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 14, 2023 at 10:17=E2=80=AFAM Alexander Larsson <alexl@redhat.co=
m> wrote:
>
> On Wed, Jun 14, 2023 at 8:14=E2=80=AFAM Amir Goldstein <amir73il@gmail.co=
m> wrote:
> >
> > On Mon, Jun 12, 2023 at 5:54=E2=80=AFPM Alexander Larsson <alexl@redhat=
.com> wrote:
> > >
> > > On Mon, Jun 12, 2023 at 1:09=E2=80=AFPM Alexander Larsson <alexl@redh=
at.com> wrote:
> > > >
> > > > On Mon, Jun 12, 2023 at 12:54=E2=80=AFPM Amir Goldstein <amir73il@g=
mail.com> wrote:
> > > > >
> > > > > On Mon, Jun 12, 2023 at 1:27=E2=80=AFPM Alexander Larsson <alexl@=
redhat.com> wrote:
> > > > > >
> > > > > > This patchset adds support for using fs-verity to validate lowe=
rdata
> > > > > > files by specifying an overlay.verity xattr on the metacopy
> > > > > > files.
> > > > > >
> > > > > > This is primarily motivated by the Composefs usecase, where the=
re will
> > > > > > be a read-only EROFS layer that contains redirect into a base d=
ata
> > > > > > layer which has fs-verity enabled on all files. However, it is =
also
> > > > > > useful in general if you want to ensure that the lowerdata file=
s
> > > > > > matches the expected content over time.
> > > > > >
> > > > > > I have also added some tests for this feature to xfstests[1].
> > > > >
> > > > > I can't remember if there is a good reason why your test does
> > > > > not include verify in a data-only layer.
> > > > >
> > > > > I think this test coverage needs to be added.
> > > >
> > > > Yeah. I'll add that.
> > >
> > > Updated the git branch with some lowerdata tests.
> > >
> >
> > What do I need to do in order to enable verity on ext4 besides
> > enabling FS_VERITY in the kernel?
> >
> > I'm getting these on verity tests on ext4 in the default 4k config.
> > _require_scratch_verity() doesn't mention any requirement other
> > that 4K blocks and extent format files.
> >
> > Thanks,
> > Amir.
> >
> > BEGIN TEST 4k (10 tests): Ext4 4k block Wed Jun 14 06:04:25 UTC 2023
> > DEVICE: /dev/vdb
> > EXT_MKFS_OPTIONS: -b 4096
> > EXT_MOUNT_OPTIONS: -o block_validity
> > FSTYP         -- ext4
> > PLATFORM      -- Linux/x86_64 kvm-xfstests
> > 6.4.0-rc2-xfstests-00026-g35774ba7f07c #1596 SMP PREEMPT_DYNAMIC Tue
> > Jun 13 18:16:59 IDT 2023
> > MKFS_OPTIONS  -- -F -q -b 4096 /dev/vdc
> > MOUNT_OPTIONS -- -o acl,user_xattr -o block_validity /dev/vdc /vdc
> >
> > generic/572        [06:04:42] [06:04:47] [not run]
> > generic/572 -- ext4 verity isn't usable by default with these mkfs opti=
ons
> > ...
>
> You need to "tune2fs -O verity" (or pass -O verity to mkfs.ext4).
>

That was indeed missing in my setup, but it did not fix the problem.

Turned out that I had a very old version of fsverity installed in my
kvm-xfstest test VM, where there is no --block-size option to
fsverity enable would always fail.

Eric,

You may consider adding a check for minimal version of
fsverity or check for support of --block-size option to make
this error reason more clear for testers.

Ted,

FYI, FSVERITY_GIT in fstests-bld/config points to an out of date URL

How come there is no ext4/cfg/verity in fstests-bld?
Are you guys not testing fsverity with fstests-bld?
Should we just add fsverity config or add verity to ext4/cfg/encrypt
instead to avoid growing the test matrix?

I can send patches for fstests-bld fixing the above if you like.

Alex,

Verified that your verity-tests2 work as expected with v5 patches.

Thanks,
Amir.
