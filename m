Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D5A290E
	for <fsverity@lists.linux.dev>; Mon, 19 Jun 2023 07:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687161550;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PttGsP00aRBaVy89CIKR6rFg9VqQnu6lyJb2FpOUizA=;
	b=DgbEje2GiqjJCPpGMLzBK0jpxkNXHZaUnsHvquEg2HjJk0UwH1OaMG1vIsaNh9k9z3Kq4d
	50QohMVKXHDThc99dpQ94xmnd29yMtV2t9m0Nm3tBtc5CBvLxKWaMnaZPtek1tR5GU8/Y0
	BrlyYr5YBpa+xKXdBD/TPNc2q4ZBBn8=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-509-mAPeNQLNP3aRxJCNtvUtEg-1; Mon, 19 Jun 2023 03:59:08 -0400
X-MC-Unique: mAPeNQLNP3aRxJCNtvUtEg-1
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3423e94cdfcso10866135ab.0
        for <fsverity@lists.linux.dev>; Mon, 19 Jun 2023 00:59:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687161548; x=1689753548;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PttGsP00aRBaVy89CIKR6rFg9VqQnu6lyJb2FpOUizA=;
        b=aqu1IqtZ50Qyga1P3YixAyKBNjuFNhzP4CdrHsyrHhFJCbwQrhZSQZMphFqySGyr0N
         uli5PDp+qr67SE805VqDPla5sYtGSedfsPeBMrynH2Mc4KjShxsHt3rkjaZ46U1IymVA
         UsgYgF4eahudrTRKbin8Yr/pfE4LMWp8N1hKHIW7S9OnjlNb7Pkok7BR880yHWr+Pf/l
         5d181/zUSX+qh7Vs2mFr1lBeWGv2c5Nl0wqtUu5/KGCKZwhhEMBwk+jKybVUJ8MSAXQd
         sTjrjyz5vut0Yg1TB/TeYjtHs9Ew8UGWx6fw5OiYmP7Ez9LTrtQItIUJxzeGj69GIf0h
         HxjA==
X-Gm-Message-State: AC+VfDzrTGYyU/h71TtACxsP4MTibTXKb611+jCj1iVJmBzjZU/xoGDN
	zFoMbUJRIBAHR67v3iRDF48CeTBPajI7dUlitQqnDO7tqVDaliJ3SPdNH5BsrKjqBqCKLsFRSJ8
	1CNRFOTlpiFZ6CPRvEaDQQNkoCRVO5r5QY9s=
X-Received: by 2002:a92:c989:0:b0:341:d9e7:9d94 with SMTP id y9-20020a92c989000000b00341d9e79d94mr4867834iln.25.1687161547825;
        Mon, 19 Jun 2023 00:59:07 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7GMXqYzkPxBQhV1WNeUjID0xET/28y5LLauyHtHC+Hn0YMLlXYK1/ghA1EFdVLa0RQx3svyiIVJEKoiDwyAm4=
X-Received: by 2002:a92:c989:0:b0:341:d9e7:9d94 with SMTP id
 y9-20020a92c989000000b00341d9e79d94mr4867826iln.25.1687161547563; Mon, 19 Jun
 2023 00:59:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <03ac0ffd82bc1edc3a9baa68d1125f5e8cad93fd.1686565330.git.alexl@redhat.com>
 <20230612163216.GA847@sol.localdomain> <CAOQ4uxjS5-7_PaoxM41YaXW+KxwLK_K8AyJMaoi1m-3P-vZ9Kw@mail.gmail.com>
 <20230613063704.GA879@sol.localdomain> <CAOQ4uxg6BD_RDtWob5q2eX6uQ5hcWrK7wEDcBhFVrGM3vsn=NA@mail.gmail.com>
 <20230613182233.GC1139@sol.localdomain> <CAOQ4uxhzJFpfuFLxK2s0JqS5qGQDGfndFPY7n2NDmZso4cG4Rg@mail.gmail.com>
 <CAL7ro1FF2iUjPsXrha8tELYvi9MwW7WRhksqX7ahSXc4gPHraw@mail.gmail.com>
 <20230615235229.GC25295@sol.localdomain> <CAL7ro1G+Dnet=M+CUY7e_9nJhOtD3rQm16C7bWkMBVnfcvm4Yg@mail.gmail.com>
 <20230617194735.GA4703@sol.localdomain>
In-Reply-To: <20230617194735.GA4703@sol.localdomain>
From: Alexander Larsson <alexl@redhat.com>
Date: Mon, 19 Jun 2023 09:58:56 +0200
Message-ID: <CAL7ro1G+rdRKvFcoOafvA=5us=RrA-rQ2kTvKP-_jWMiiXPCrg@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] ovl: Add framework for verity support
To: Eric Biggers <ebiggers@kernel.org>
Cc: Amir Goldstein <amir73il@gmail.com>, miklos@szeredi.hu, linux-unionfs@vger.kernel.org, 
	tytso@mit.edu, fsverity@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 17, 2023 at 9:47=E2=80=AFPM Eric Biggers <ebiggers@kernel.org> =
wrote:
>
> On Fri, Jun 16, 2023 at 10:11:06AM +0200, Alexander Larsson wrote:
> > On Fri, Jun 16, 2023 at 1:52=E2=80=AFAM Eric Biggers <ebiggers@kernel.o=
rg> wrote:
> > >
> > > On Wed, Jun 14, 2023 at 09:57:41AM +0200, Alexander Larsson wrote:
> > > > When a layer containing verity xattrs is used, it means that any
> > > > such metacopy file in the upper layer is guaranteed to match the
> > > > content that was in the lower at the time of the copy-up. If at any=
 time
> > > > (during a mount, after a remount, etc) such a file in the lower is
> > > > replaced or modified in any way, then opening the corresponding fil=
e on
> > > > overlayfs will result in EIO and a detailed error printed to the ke=
rnel logs.
> > > > (Actually, due to caching the overlayfs mount might still see the p=
revious
> > > > file contents after a lower file is replaced under an active mount,=
 but
> > > > it will never see the wrong data.)
> > >
> > > Well, the key point of fsverity is that data is not verified until it=
 is
> > > actually read.  At open time, the fsverity file digest is made availa=
ble in
> > > constant time, and overlayfs will verify that.  However, invalid data=
 blocks are
> > > not reported until the data is actually read.  The error that applica=
tions get
> > > is EIO for syscalls, and SIGBUS for memory-mapped reads, as mentioned=
 at
> > > https://www.kernel.org/doc/html/latest/filesystems/fsverity.html#acce=
ssing-verity-files
> > >
> > > So overlayfs might report EIO at open time, or it might not report an=
 error
> > > until the modified data is read.  And in the latter case, presumably =
the error
> > > seen by the application matches the one for using fsverity natively?
> >
> > Yes, I'm aware of that, but do we need to describe this in the
> > overlayfs documentation?
> > The text I wrote is describing the behaviour that overlayfs adds to
> > the mix, and I sort of
> > assumed the late validation from fs-verity itself would be known about
> > if the file already
> > has fs-verity enabled.
> >
> > > You can link to the fsverity documentation somewhere if it would be h=
elpful, but
> > > I'd still like the semantics of how this works on overlayfs to be doc=
umented.
> >
> > I guess just adding a link to that is not that bad. What about:
> >
> > ----
> > When a layer containing verity xattrs is used, it means that any such
> > metacopy file in the upper layer is guaranteed to match the content
> > that was in the lower at the time of the copy-up. If at any time
> > (during a mount, after a remount, etc) such a file in the lower is
> > replaced or modified in any way, then opening the corresponding file
> > on overlayfs will result in EIO and a detailed error printed to the
> > kernel logs.  (Actually, due to caching the overlayfs mount might
> > still see the previous file contents after a lower file is replaced
> > under an active mount, but it will never see the wrong data.)  In
> > addition fs-verity will do late validation of the file content, as
> > described in :ref:`Documentation/filesystems/fsverity.rst
> > <accessing_verity_files>`.
>
> That still has the incorrect statement "If at any time (during a mount, a=
fter a
> remount, etc) such a file in the lower is replaced or modified in any way=
, then
> opening the corresponding file on overlayfs will result in EIO and a deta=
iled
> error printed to the kernel logs."  See my last email where I explained w=
hy that
> statement is not correct.

If the modification of the file happens via the kernel vfs API, then
the new backing file will have either have no, or the wrong fs-verity
digest, which will be reported by overlayfs on open. It is true that a
modification on the block level which the vfs is unaware of will be
reported at read time, by fs-verity (i.e. independent of overlayfs).
This is what I meant by the "in addition .." part, but maybe that is
not clear. I'll try to rephrase it.


--=20
=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D
 Alexander Larsson                                Red Hat, Inc
       alexl@redhat.com         alexander.larsson@gmail.com

