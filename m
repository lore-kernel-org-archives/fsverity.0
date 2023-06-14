Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F407F
	for <fsverity@lists.linux.dev>; Wed, 14 Jun 2023 07:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686727024;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K902JB2gisvUpm4Q1IJPniY1DPyobZ0q8ZnApt8706w=;
	b=eq/85T9IB4/IxwH3nqWOQTLT4NEsT0D8im3NM5Ytsnyd3dr+FFIZ0qzTqrv965uYOfLLQg
	lGzzDCLGh78dyAq3rCpshrmlmp/ri+hDSQxY96XsyU/qcZCZrpIKp4ob3pm5fpeOZai4Lz
	J9vVycbLq0SY5iakKm4Naf5ITPVoCOY=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-259-eqEkRdjgPXOWeWuhKFfRoQ-1; Wed, 14 Jun 2023 03:17:03 -0400
X-MC-Unique: eqEkRdjgPXOWeWuhKFfRoQ-1
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-778d823038bso699925539f.3
        for <fsverity@lists.linux.dev>; Wed, 14 Jun 2023 00:17:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686727022; x=1689319022;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K902JB2gisvUpm4Q1IJPniY1DPyobZ0q8ZnApt8706w=;
        b=cvvRdUymlqPhjv7k30Qpyi0qScWjeQa24k0BBGv++13Hs9PPBG66N1MlJbe2cXATPP
         eW8xz9/duyTmjcqwJ8yf4DCjyDO3CWIQW2xEeBrqzx2bgJ3isGFn2UvU7WqnC1xpQhiN
         9O+2xjGGPSMJKrK5BJe10rTnJZPANg63vjBVbYnrOOko6IAM35IB6L0LD0ngD3d4iB4L
         VCziYIi8QGIDdwxR4LVHxv+WH6odQU6fQb1HctFncTpxKk/Y40wfO6b48y1whX/ObYz9
         z3+deFzT8dYkJlFWaevKFK83Q29hjMN7cjovLzprbP+HdMcGGew6NKTRYvUvd3P91zKU
         p00Q==
X-Gm-Message-State: AC+VfDxt8UmsYtpk7gmM0hIZl8hUqDyilsTB6iaL6oDD6HrBIuYKahaN
	+KlHB7jyFbxOcL1G8M+6sHmIWXRf/bxNUjBvhr+oQioNOv3Y+GHsa0vPrMar04t1JkJjlRqoCt3
	+wKtM3Uhx1K0s/96ifSWzsWoBH1rO3ju6KuM=
X-Received: by 2002:a92:cf06:0:b0:340:5661:5186 with SMTP id c6-20020a92cf06000000b0034056615186mr4969697ilo.14.1686727022350;
        Wed, 14 Jun 2023 00:17:02 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7+sxzko6RrSbKfWX5Bu2zRNR4xkp9rC8602a0pEeUUDxiAai24rFMC3xgdT6qSuxylLqckDMbTBJJCR+8NZpc=
X-Received: by 2002:a92:cf06:0:b0:340:5661:5186 with SMTP id
 c6-20020a92cf06000000b0034056615186mr4969690ilo.14.1686727022140; Wed, 14 Jun
 2023 00:17:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1686565330.git.alexl@redhat.com> <CAOQ4uxgmV1KKCeq8=8FPkAciwqPpz8JiSM8WEuxDaZbVuYcQ7Q@mail.gmail.com>
 <CAL7ro1EiYOOOqexrKy+UXRzmpGyCaNec3+LHGxnA0YfmoMDN3A@mail.gmail.com>
 <CAL7ro1FKwgUY4e7N_vYi0cFsuVx6St0-oKvcBkiRFnzLH8D1eQ@mail.gmail.com> <CAOQ4uxgVnv7wtwFZaBnEotFCwQD1EZcSK2KW4K4vRD8d9fzCiw@mail.gmail.com>
In-Reply-To: <CAOQ4uxgVnv7wtwFZaBnEotFCwQD1EZcSK2KW4K4vRD8d9fzCiw@mail.gmail.com>
From: Alexander Larsson <alexl@redhat.com>
Date: Wed, 14 Jun 2023 09:16:51 +0200
Message-ID: <CAL7ro1FY6OmhypFGDjinOkkjyJzymntVje4nRA558dKY+KsgzQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] ovl: Add support for fs-verity checking of lowerdata
To: Amir Goldstein <amir73il@gmail.com>
Cc: miklos@szeredi.hu, linux-unionfs@vger.kernel.org, ebiggers@kernel.org, 
	tytso@mit.edu, fsverity@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 14, 2023 at 8:14=E2=80=AFAM Amir Goldstein <amir73il@gmail.com>=
 wrote:
>
> On Mon, Jun 12, 2023 at 5:54=E2=80=AFPM Alexander Larsson <alexl@redhat.c=
om> wrote:
> >
> > On Mon, Jun 12, 2023 at 1:09=E2=80=AFPM Alexander Larsson <alexl@redhat=
.com> wrote:
> > >
> > > On Mon, Jun 12, 2023 at 12:54=E2=80=AFPM Amir Goldstein <amir73il@gma=
il.com> wrote:
> > > >
> > > > On Mon, Jun 12, 2023 at 1:27=E2=80=AFPM Alexander Larsson <alexl@re=
dhat.com> wrote:
> > > > >
> > > > > This patchset adds support for using fs-verity to validate lowerd=
ata
> > > > > files by specifying an overlay.verity xattr on the metacopy
> > > > > files.
> > > > >
> > > > > This is primarily motivated by the Composefs usecase, where there=
 will
> > > > > be a read-only EROFS layer that contains redirect into a base dat=
a
> > > > > layer which has fs-verity enabled on all files. However, it is al=
so
> > > > > useful in general if you want to ensure that the lowerdata files
> > > > > matches the expected content over time.
> > > > >
> > > > > I have also added some tests for this feature to xfstests[1].
> > > >
> > > > I can't remember if there is a good reason why your test does
> > > > not include verify in a data-only layer.
> > > >
> > > > I think this test coverage needs to be added.
> > >
> > > Yeah. I'll add that.
> >
> > Updated the git branch with some lowerdata tests.
> >
>
> What do I need to do in order to enable verity on ext4 besides
> enabling FS_VERITY in the kernel?
>
> I'm getting these on verity tests on ext4 in the default 4k config.
> _require_scratch_verity() doesn't mention any requirement other
> that 4K blocks and extent format files.
>
> Thanks,
> Amir.
>
> BEGIN TEST 4k (10 tests): Ext4 4k block Wed Jun 14 06:04:25 UTC 2023
> DEVICE: /dev/vdb
> EXT_MKFS_OPTIONS: -b 4096
> EXT_MOUNT_OPTIONS: -o block_validity
> FSTYP         -- ext4
> PLATFORM      -- Linux/x86_64 kvm-xfstests
> 6.4.0-rc2-xfstests-00026-g35774ba7f07c #1596 SMP PREEMPT_DYNAMIC Tue
> Jun 13 18:16:59 IDT 2023
> MKFS_OPTIONS  -- -F -q -b 4096 /dev/vdc
> MOUNT_OPTIONS -- -o acl,user_xattr -o block_validity /dev/vdc /vdc
>
> generic/572        [06:04:42] [06:04:47] [not run]
> generic/572 -- ext4 verity isn't usable by default with these mkfs option=
s
> ...

You need to "tune2fs -O verity" (or pass -O verity to mkfs.ext4).

--=20
=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D
 Alexander Larsson                                Red Hat, Inc
       alexl@redhat.com         alexander.larsson@gmail.com

