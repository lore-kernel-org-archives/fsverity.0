Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F7C1113
	for <fsverity@lists.linux.dev>; Fri, 16 Jun 2023 13:27:41 +0000 (UTC)
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-6b29b9f5a94so660172a34.2
        for <fsverity@lists.linux.dev>; Fri, 16 Jun 2023 06:27:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686922060; x=1689514060;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wDpBe1vASZiycTTANQ+9981dUvLrI+07lrGXRtcZlQA=;
        b=ljUxL+fKfiIzd7cRkMLz6GgqWXWAjl/WzaL0FsEefmpy1fbRgm1nWj7xoGl/GMru8B
         tULocTkannZNYiAsHmCoMtniWwTibQpZUtzp9agbAPRzcwRuQnpuz9JxBRfR87bv6erk
         BpfZ18t74kFPfPqQ/tnJmnkHsCVROrghP1yCz++Kn9/iD9IpDIGSkmziCKNAZqUB1j3U
         TygpFDx24UQdDf7k1k418UboznGMeNh6CK6oz1kRalS4tz2QZb8iIWF8Z7dCFhQEqphw
         QsbVrEsHDQmnEzmm4O/Scyjdua4v6Q3gkOg9+WQUK58c43qmsL98UR7fEhEjpZtbopby
         EBlQ==
X-Gm-Message-State: AC+VfDwPxLfybR7/C5+gELfmT2FVNyKmUL9HT1Nlv0xMrrwtY7kygr5i
	B8KolnbxaXGiytQhw2TtzYJF9izzuXIx/g==
X-Google-Smtp-Source: ACHHUZ5YFCVhymvDWBUDrD2Qlib39Jog4iL0Eu++aAGQtJuH1/F9MrsOOe56y06dCp96iiLejwLFug==
X-Received: by 2002:a05:6359:603:b0:12f:2563:292c with SMTP id eh3-20020a056359060300b0012f2563292cmr258131rwb.27.1686922060158;
        Fri, 16 Jun 2023 06:27:40 -0700 (PDT)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id t138-20020a0dea90000000b0057064c14d14sm321045ywe.11.2023.06.16.06.27.39
        for <fsverity@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jun 2023 06:27:39 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-570002c9b38so8199117b3.1
        for <fsverity@lists.linux.dev>; Fri, 16 Jun 2023 06:27:39 -0700 (PDT)
X-Received: by 2002:a0d:ea89:0:b0:56c:e4b1:19f6 with SMTP id
 t131-20020a0dea89000000b0056ce4b119f6mr1715268ywe.44.1686922059468; Fri, 16
 Jun 2023 06:27:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230615230537.30429-1-ebiggers@kernel.org> <CAMw=ZnR69AhMMQUOwKv9RtP85JzxQhMGO3yzyeEagWxaGiPAZg@mail.gmail.com>
 <20230616021707.GA87129@sol.localdomain>
In-Reply-To: <20230616021707.GA87129@sol.localdomain>
From: Luca Boccassi <bluca@debian.org>
Date: Fri, 16 Jun 2023 14:27:28 +0100
X-Gmail-Original-Message-ID: <CAMw=ZnTEV=GuEE=wB0Z4E1x_uH5zzjyQkB1ycrYnWB2GCMaRTA@mail.gmail.com>
Message-ID: <CAMw=ZnTEV=GuEE=wB0Z4E1x_uH5zzjyQkB1ycrYnWB2GCMaRTA@mail.gmail.com>
Subject: Re: [PATCH] fsverity: improve documentation for builtin signature support
To: Eric Biggers <ebiggers@kernel.org>
Cc: fsverity@lists.linux.dev, linux-integrity@vger.kernel.org, 
	linux-doc@vger.kernel.org, Colin Walters <walters@verbum.org>, 
	Alexander Larsson <alexl@redhat.com>, Victor Hsieh <victorhsieh@google.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 16 Jun 2023 at 03:17, Eric Biggers <ebiggers@kernel.org> wrote:
>
> Hi Luca,
>
> On Fri, Jun 16, 2023 at 02:10:35AM +0100, Luca Boccassi wrote:
> > On Fri, 16 Jun 2023 at 00:07, Eric Biggers <ebiggers@kernel.org> wrote:
> > >
> > > From: Eric Biggers <ebiggers@google.com>
> > >
> > > fsverity builtin signatures (CONFIG_FS_VERITY_BUILTIN_SIGNATURES) aren't
> > > the only way to do signatures with fsverity, and they have some major
> > > limitations.  Yet, more users have tried to use them, e.g. recently by
> > > https://github.com/ostreedev/ostree/pull/2640.  In most cases this seems
> > > to be because users aren't sufficiently familiar with the limitations of
> > > this feature and what the alternatives are.
> > >
> > > Therefore, make some updates to the documentation to try to clarify the
> > > properties of this feature and nudge users in the right direction.
> > >
> > > Note that the Integrity Policy Enforcement (IPE) LSM, which is not yet
> > > upstream, is planned to use the builtin signatures.  (This differs from
> > > IMA, which uses its own signature mechanism.)  For that reason, my
> > > earlier patch "fsverity: mark builtin signatures as deprecated"
> > > (https://lore.kernel.org/r/20221208033548.122704-1-ebiggers@kernel.org),
> > > which marked builtin signatures as "deprecated", was controversial.
> > >
> > > This patch therefore stops short of marking the feature as deprecated.
> > > I've also revised the language to focus on better explaining the feature
> > > and what its alternatives are.
> > >
> > > Signed-off-by: Eric Biggers <ebiggers@google.com>
> > > ---
> > >
> > > This patch applies to https://git.kernel.org/pub/scm/fs/fsverity/linux.git/log/?h=for-next
> > >
> > >  Documentation/filesystems/fsverity.rst | 176 ++++++++++++++++---------
> > >  fs/verity/Kconfig                      |  16 +--
> > >  fs/verity/enable.c                     |   2 +-
> > >  fs/verity/open.c                       |   8 +-
> > >  fs/verity/read_metadata.c              |   4 +-
> > >  fs/verity/signature.c                  |   8 ++
> > >  6 files changed, 139 insertions(+), 75 deletions(-)
> > >
> > > diff --git a/Documentation/filesystems/fsverity.rst b/Documentation/filesystems/fsverity.rst
> > > index ede672dedf110..e990149cfdf5c 100644
> > > --- a/Documentation/filesystems/fsverity.rst
> > > +++ b/Documentation/filesystems/fsverity.rst
> >
> > Most of the patch looks fine, two notes:
> >
> > > +- Trusted userspace code.  When the accesses to a file happen in a
> > > +  well-defined way, userspace code can authenticate the file's
> > > +  fs-verity digest before accessing the file.  This can be done by
> > > +  verifying a signature of the fs-verity file digest using any
> > > +  userspace cryptographic library that supports digital signatures.
> > > +  Consider using `libsodium
> > > +  <https://libsodium.gitbook.io/doc/public-key_cryptography/public-key_signatures>`_
> > > +  or `Tink <https://developers.google.com/tink/digitally-sign-data>`_.
> > > +  Other options include OpenSSL, JCA, and libgcrypt.
> >
> > This should at least mention something like "depending on whether the
> > threat model allows trusting userspace with such tasks", because it is
> > by no means guaranteed that it is the case.
>
> Sure, that's why it says "Trusted userspace code", but I can make it clearer.

Thanks, that would be great.

> > > +- fs-verity builtin signatures are in PKCS#7 format, and the public
> > > +  keys are in X.509 format.  These data formats are complex and prone
> > > +  to vulnerabilities, so parsing them is preferably done in userspace.
> > > +  (fs-verity builtin signatures were made to use these formats because
> > > +  other kernel subsystems, such as the module loader, unfortunately
> > > +  used these formats already.)  Most cryptographic libraries also
> > > +  support working with raw keys and signatures, which are much
> > > +  simpler.  For example, consider using `libsodium
> > > +  <https://libsodium.gitbook.io/doc/public-key_cryptography/public-key_signatures>`_.
> > > +
> > > +  IMA appraisal, which supports fs-verity, does not use PKCS#7, so it
> > > +  partially avoids this issue as well (though it does use X.509).
> >
> > The kernel makes extensive use of PKCS7, it's the foundation of the
> > trust chain with secure boot (and kernel modules as noted) after all,
> > among other things, so this description looks very out of place as
> > part of the same project. Readers might be led to believe that using
> > secure boot or signed modules is useless, or worse, dangerous, and
> > that it's better not to, and I'm quite sure that's not something we
> > want.
> >
>
> Unfortunately just because PKCS#7, X.509, and ASN.1 is being used does not mean
> it is a good idea.  Have you read the kernel code that implements these formats?
> A few years ago I went through some of it.  Here are some of the bugs I fixed:
>
>     2eb9eabf1e86 ("KEYS: fix out-of-bounds read during ASN.1 parsing")
>     624f5ab8720b ("KEYS: fix NULL pointer dereference during ASN.1 parsing [ver #2]")
>     e0058f3a874e ("ASN.1: fix out-of-bounds read when parsing indefinite length item")
>     81a7be2cd69b ("ASN.1: check for error from ASN1_OP_END__ACT actions")
>     0f30cbea005b ("X.509: reject invalid BIT STRING for subjectPublicKey")
>     54c1fb39fe04 ("X.509: fix comparisons of ->pkey_algo")
>     971b42c038dc ("PKCS#7: fix certificate chain verification")
>     29f4a67c17e1 ("PKCS#7: fix certificate blacklisting")
>     437499eea429 ("X.509: fix BUG_ON() when hash algorithm is unsupported")
>     4b34968e77ad ("X.509: fix NULL dereference when restricting key with unsupported_sig")

I have no doubt that there are bugs, as I have no doubts that there
are bugs in every other subsystem, including fsverity, once you start
looking hard enough. That's not the point. The point is that having
the documentation of one kernel subsystem disparaging the mechanisms
that are central to other kernel subsystems' functionality is weird
and out of place. Something like that is fine to post on social media
or a blog post or so. A user jumping from one page of kernel doc
saying, paraphrasing heavily for the sake of argument, "use pkcs7 to
ensure the security of your system via secure boot, measured boot and
signed kernel modules" and another saying "pkcs7 is bad and broken,
stay away from it" is just strange, confusing and incoherent from the
point of view of a reader.

Kind regards,
Luca Boccassi
