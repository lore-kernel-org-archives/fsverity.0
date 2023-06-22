Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F9C2FB2
	for <fsverity@lists.linux.dev>; Thu, 22 Jun 2023 11:45:46 +0000 (UTC)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-78f689fd0a3so1952246241.2
        for <fsverity@lists.linux.dev>; Thu, 22 Jun 2023 04:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687434345; x=1690026345;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HILfXiyJTzqIWiU2ds9vS2XsGukIr6n4KyLc8e2yavI=;
        b=eaS3xUSrs8PQn6dBchdEKDSHFLc64oFo5hy7YEWFIw6V3sOWGTcYsIA9tB06F8RS8g
         FlLdXMRDNv11xhDY21luoC02vGh6kkAY2QxfQF3E0uu4jC6X2jzgKt6en/ukT5AGVaPk
         y0AK6OTLekATGE3hStGtkhdcrF//dk7HxUFXu0j/pgJINI6gox1VkzzDv9pDrvcFxPZa
         gfK6DIa0vrh9BIhsfbpoJCYfNuzCXv5EayIqHUbxKHhIU2pXZ9Iff1tF1duu9e5xITtV
         83omGA30WMnYqncAXq+/EczyvSaahDcWS7X/aJ3VzcDojn7yks8Gpryf+vvSL0rkasPa
         zykw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687434345; x=1690026345;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HILfXiyJTzqIWiU2ds9vS2XsGukIr6n4KyLc8e2yavI=;
        b=jW85O+3w7tOiXvENmE00otD1eTRk777BPIuErgq0j4ukYP8F34cqr/GkgFMG3eDIUL
         HDG2v8O2E+atM2X4JOG5vGFv/6A29J8XyEVGot31AdiLDQI73XHkGTVEWhBqvUNM2tdU
         SaNGPHhH0QVyBqFowhlkPKL+4LFd+JBgVgJGGkBelvEMThkGxqv6H8ZdVwedHWySjA2A
         8uUrR9TBknTUDQLChtF3D7/OGozk2DazrTnW36eY+gXVcvC1LWNjI5NSPy00nn06Wn9p
         HRXEGAspX/7ueZi6plKqdG6kT0x3hRdkH+awI8YPiuDnjKlNulf+JPjATPw4OJTfQBbC
         /vdQ==
X-Gm-Message-State: AC+VfDxPFMFdF/NVDl+3PhUV8j6ccSQ6ds4VI20JVLAFHdpfe/Kgsw7J
	bymYpPe3P33k56P4pB4JKYDKvTh4fc+7BvutjDQ=
X-Google-Smtp-Source: ACHHUZ7VsJxGdhJR1w92sy48nDflxrVzz13c6GCAx02UUdfI4cSeAw3LHPAJz/orzJWayksSphv97z+GCi7MyAfdRqE=
X-Received: by 2002:a67:fc08:0:b0:440:af3c:4c18 with SMTP id
 o8-20020a67fc08000000b00440af3c4c18mr7053535vsq.5.1687434345423; Thu, 22 Jun
 2023 04:45:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1686565330.git.alexl@redhat.com> <CAOQ4uxgmV1KKCeq8=8FPkAciwqPpz8JiSM8WEuxDaZbVuYcQ7Q@mail.gmail.com>
 <CAL7ro1EiYOOOqexrKy+UXRzmpGyCaNec3+LHGxnA0YfmoMDN3A@mail.gmail.com>
 <CAL7ro1FKwgUY4e7N_vYi0cFsuVx6St0-oKvcBkiRFnzLH8D1eQ@mail.gmail.com>
 <CAOQ4uxgVnv7wtwFZaBnEotFCwQD1EZcSK2KW4K4vRD8d9fzCiw@mail.gmail.com>
 <CAL7ro1FY6OmhypFGDjinOkkjyJzymntVje4nRA558dKY+KsgzQ@mail.gmail.com>
 <CAOQ4uxjuhzxgTxmRXxczJLDrMzKKr-jzS3R8ESwkw4XQ+UyAfQ@mail.gmail.com> <CAL7ro1GYEdMvjn+e8Y8CmMC-s_5NZOXjsj=iv7s5NbnpTZz+Cg@mail.gmail.com>
In-Reply-To: <CAL7ro1GYEdMvjn+e8Y8CmMC-s_5NZOXjsj=iv7s5NbnpTZz+Cg@mail.gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 22 Jun 2023 14:45:34 +0300
Message-ID: <CAOQ4uxjS9mTjCCTS9eS1HmZqKAQV97mh1wpkqJuShCHP_MKqag@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] ovl: Add support for fs-verity checking of lowerdata
To: Alexander Larsson <alexl@redhat.com>
Cc: ebiggers@kernel.org, tytso@mit.edu, miklos@szeredi.hu, 
	linux-unionfs@vger.kernel.org, fsverity@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 22, 2023 at 12:52=E2=80=AFPM Alexander Larsson <alexl@redhat.co=
m> wrote:
>
> On Thu, Jun 22, 2023 at 11:37=E2=80=AFAM Amir Goldstein <amir73il@gmail.c=
om> wrote:
> >
> > On Wed, Jun 14, 2023 at 10:17=E2=80=AFAM Alexander Larsson <alexl@redha=
t.com> wrote:
> > >
> > > On Wed, Jun 14, 2023 at 8:14=E2=80=AFAM Amir Goldstein <amir73il@gmai=
l.com> wrote:
> > > >
> > > > On Mon, Jun 12, 2023 at 5:54=E2=80=AFPM Alexander Larsson <alexl@re=
dhat.com> wrote:
> > > > >
> > > > > On Mon, Jun 12, 2023 at 1:09=E2=80=AFPM Alexander Larsson <alexl@=
redhat.com> wrote:
> > > > > >
> > > > > > On Mon, Jun 12, 2023 at 12:54=E2=80=AFPM Amir Goldstein <amir73=
il@gmail.com> wrote:
> > > > > > >
> > > > > > > On Mon, Jun 12, 2023 at 1:27=E2=80=AFPM Alexander Larsson <al=
exl@redhat.com> wrote:
> > > > > > > >
> > > > > > > > This patchset adds support for using fs-verity to validate =
lowerdata
> > > > > > > > files by specifying an overlay.verity xattr on the metacopy
> > > > > > > > files.
> > > > > > > >
> > > > > > > > This is primarily motivated by the Composefs usecase, where=
 there will
> > > > > > > > be a read-only EROFS layer that contains redirect into a ba=
se data
> > > > > > > > layer which has fs-verity enabled on all files. However, it=
 is also
> > > > > > > > useful in general if you want to ensure that the lowerdata =
files
> > > > > > > > matches the expected content over time.
> > > > > > > >
> > > > > > > > I have also added some tests for this feature to xfstests[1=
].
> > > > > > >
> > > > > > > I can't remember if there is a good reason why your test does
> > > > > > > not include verify in a data-only layer.
> > > > > > >
> > > > > > > I think this test coverage needs to be added.
> > > > > >
> > > > > > Yeah. I'll add that.
> > > > >
> > > > > Updated the git branch with some lowerdata tests.
> > > > >
> > > >
> > > > What do I need to do in order to enable verity on ext4 besides
> > > > enabling FS_VERITY in the kernel?
> > > >
> > > > I'm getting these on verity tests on ext4 in the default 4k config.
> > > > _require_scratch_verity() doesn't mention any requirement other
> > > > that 4K blocks and extent format files.
> > > >
> > > > Thanks,
> > > > Amir.
> > > >
> > > > BEGIN TEST 4k (10 tests): Ext4 4k block Wed Jun 14 06:04:25 UTC 202=
3
> > > > DEVICE: /dev/vdb
> > > > EXT_MKFS_OPTIONS: -b 4096
> > > > EXT_MOUNT_OPTIONS: -o block_validity
> > > > FSTYP         -- ext4
> > > > PLATFORM      -- Linux/x86_64 kvm-xfstests
> > > > 6.4.0-rc2-xfstests-00026-g35774ba7f07c #1596 SMP PREEMPT_DYNAMIC Tu=
e
> > > > Jun 13 18:16:59 IDT 2023
> > > > MKFS_OPTIONS  -- -F -q -b 4096 /dev/vdc
> > > > MOUNT_OPTIONS -- -o acl,user_xattr -o block_validity /dev/vdc /vdc
> > > >
> > > > generic/572        [06:04:42] [06:04:47] [not run]
> > > > generic/572 -- ext4 verity isn't usable by default with these mkfs =
options
> > > > ...
> > >
> > > You need to "tune2fs -O verity" (or pass -O verity to mkfs.ext4).
> > >
> >
> > That was indeed missing in my setup, but it did not fix the problem.
> >
> > Turned out that I had a very old version of fsverity installed in my
> > kvm-xfstest test VM, where there is no --block-size option to
> > fsverity enable would always fail.
> >
> > Eric,
> >
> > You may consider adding a check for minimal version of
> > fsverity or check for support of --block-size option to make
> > this error reason more clear for testers.
> >
> > Ted,
> >
> > FYI, FSVERITY_GIT in fstests-bld/config points to an out of date URL
> >
> > How come there is no ext4/cfg/verity in fstests-bld?
> > Are you guys not testing fsverity with fstests-bld?
> > Should we just add fsverity config or add verity to ext4/cfg/encrypt
> > instead to avoid growing the test matrix?
> >
> > I can send patches for fstests-bld fixing the above if you like.
> >
> > Alex,
> >
> > Verified that your verity-tests2 work as expected with v5 patches.
>
> To be honest I have not validated that my changes to the shared verity
> code still works with the non-overlayfs tests. If you have a setup for
> it it would be great if you could try the regular ext4 w/ fs-veriy
> tests on top of the verity-test2 branch.
>

There is no problem with "./check -g verity" on ext4
those tests pass.

However, "./check -overlay -g generic/verity" fails several test:
Failures: generic/572 generic/573 generic/574 generic/575 generic/577
because _require_scratch_verity falsely claims that overlay (over ext4)
supports verify, but then FS_IOC_ENABLE_VERITY actually fails
during the test.

Instead of changing _require_scratch_verity() as you did,
you should consider passing optional arguments, e.g.:
  local fstyp=3D${1:-$FSTYP}
and calling it from _require_scratch_overlay_verity() with the
$OVL_BASE_* values.

Thanks,
Amir.
