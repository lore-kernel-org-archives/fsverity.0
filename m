Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 262961843
	for <fsverity@lists.linux.dev>; Wed, 14 Jun 2023 06:14:22 +0000 (UTC)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-7841dc9871dso1252143241.0
        for <fsverity@lists.linux.dev>; Tue, 13 Jun 2023 23:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686723262; x=1689315262;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5X8LqfljrU+PrZzpVIfQqSqX4Zf57KzrOZh2lwpVjVY=;
        b=HLS8Xcw1HHANF3zLbpjmkJnFHtJgSjU+Kw+VABcbtVxihx3nr8T2gGgEV81WbHDk94
         7qraWKd41ajxAM8QqIXASfvasndOwOrwhwtS+csDTPALy20Bq/8W8Zq/DXktumEzfNwF
         WdgKs/T7AqfUdtnDQvw/IWtnXn7bj3jJUP1qGyG6JvHC8rHkxzwBUzGECzl+R9ZrN2nW
         vQeqLxwmwQjCV1ir7RAyheU6WnOqDfldHU4nLr86j1W+ap0Crfcr/HDwSnLLHdkt2Ybp
         cCCcNgbIIq4x1wDOZszquuaseSyukJHBa8sAUg008Wi5MH1sVVlwvYnybgd1CXb0AsCw
         gcWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686723262; x=1689315262;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5X8LqfljrU+PrZzpVIfQqSqX4Zf57KzrOZh2lwpVjVY=;
        b=h/JKEbIFXvVoJ/PyThpWoAjNYz3lfIpJpN6w16r/WgQktr3ZjkfNzKoYdvNHZN8IiC
         DE5VVVWSPvRBwEAAmReauk+gkxNcAdNuRIzwOjchBNF+8ryFehWOCGCKcyDyPhhTxYCW
         PJNCPLFjTRlLCsPVHPu5LDw4c105GWnpSVxjmzFJ73DEbDHk7AtgI/gdoF6UxHIuaqg3
         sjMHci+kkkNFaXPUsb1s6C3AyoYfPwtsCvwdRh97reZIyXROagRe9xDaZFHISZ6Tc2yE
         B77T0cxNTKJzovNhr2PQ2WhH32mnwnnFWvgnMfwd+cQEWmxBNxiU6D6F5YX05yPruh8c
         HBsw==
X-Gm-Message-State: AC+VfDzoZ7Erd273/0YvHRnZgZ7Za/LMHeg/MHz34jCevAYx+1gLpYF2
	/jNxEKHl/uWo+IySHW4RdUpZFnbKONq3/bmnO8c=
X-Google-Smtp-Source: ACHHUZ53Nnn+7QbkbpCe5wEepLUDpweMtHW/vktPbygIkeMsNE/y+jIvQefAWT8+S6pkZaXl5oY2L3DRWL3qQT/9yxU=
X-Received: by 2002:a05:6102:160f:b0:434:5810:32a6 with SMTP id
 cu15-20020a056102160f00b00434581032a6mr238422vsb.8.1686723261835; Tue, 13 Jun
 2023 23:14:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1686565330.git.alexl@redhat.com> <CAOQ4uxgmV1KKCeq8=8FPkAciwqPpz8JiSM8WEuxDaZbVuYcQ7Q@mail.gmail.com>
 <CAL7ro1EiYOOOqexrKy+UXRzmpGyCaNec3+LHGxnA0YfmoMDN3A@mail.gmail.com> <CAL7ro1FKwgUY4e7N_vYi0cFsuVx6St0-oKvcBkiRFnzLH8D1eQ@mail.gmail.com>
In-Reply-To: <CAL7ro1FKwgUY4e7N_vYi0cFsuVx6St0-oKvcBkiRFnzLH8D1eQ@mail.gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Wed, 14 Jun 2023 09:14:10 +0300
Message-ID: <CAOQ4uxgVnv7wtwFZaBnEotFCwQD1EZcSK2KW4K4vRD8d9fzCiw@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] ovl: Add support for fs-verity checking of lowerdata
To: Alexander Larsson <alexl@redhat.com>
Cc: miklos@szeredi.hu, linux-unionfs@vger.kernel.org, ebiggers@kernel.org, 
	tytso@mit.edu, fsverity@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 12, 2023 at 5:54=E2=80=AFPM Alexander Larsson <alexl@redhat.com=
> wrote:
>
> On Mon, Jun 12, 2023 at 1:09=E2=80=AFPM Alexander Larsson <alexl@redhat.c=
om> wrote:
> >
> > On Mon, Jun 12, 2023 at 12:54=E2=80=AFPM Amir Goldstein <amir73il@gmail=
.com> wrote:
> > >
> > > On Mon, Jun 12, 2023 at 1:27=E2=80=AFPM Alexander Larsson <alexl@redh=
at.com> wrote:
> > > >
> > > > This patchset adds support for using fs-verity to validate lowerdat=
a
> > > > files by specifying an overlay.verity xattr on the metacopy
> > > > files.
> > > >
> > > > This is primarily motivated by the Composefs usecase, where there w=
ill
> > > > be a read-only EROFS layer that contains redirect into a base data
> > > > layer which has fs-verity enabled on all files. However, it is also
> > > > useful in general if you want to ensure that the lowerdata files
> > > > matches the expected content over time.
> > > >
> > > > I have also added some tests for this feature to xfstests[1].
> > >
> > > I can't remember if there is a good reason why your test does
> > > not include verify in a data-only layer.
> > >
> > > I think this test coverage needs to be added.
> >
> > Yeah. I'll add that.
>
> Updated the git branch with some lowerdata tests.
>

What do I need to do in order to enable verity on ext4 besides
enabling FS_VERITY in the kernel?

I'm getting these on verity tests on ext4 in the default 4k config.
_require_scratch_verity() doesn't mention any requirement other
that 4K blocks and extent format files.

Thanks,
Amir.

BEGIN TEST 4k (10 tests): Ext4 4k block Wed Jun 14 06:04:25 UTC 2023
DEVICE: /dev/vdb
EXT_MKFS_OPTIONS: -b 4096
EXT_MOUNT_OPTIONS: -o block_validity
FSTYP         -- ext4
PLATFORM      -- Linux/x86_64 kvm-xfstests
6.4.0-rc2-xfstests-00026-g35774ba7f07c #1596 SMP PREEMPT_DYNAMIC Tue
Jun 13 18:16:59 IDT 2023
MKFS_OPTIONS  -- -F -q -b 4096 /dev/vdc
MOUNT_OPTIONS -- -o acl,user_xattr -o block_validity /dev/vdc /vdc

generic/572        [06:04:42] [06:04:47] [not run]
generic/572 -- ext4 verity isn't usable by default with these mkfs options
...
