Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23AC8653
	for <fsverity@lists.linux.dev>; Fri, 16 Jun 2023 12:57:21 +0000 (UTC)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-57023c9be80so7395297b3.3
        for <fsverity@lists.linux.dev>; Fri, 16 Jun 2023 05:57:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686920241; x=1689512241;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hcbF9PBOH9151WOgd1icrip8DJq22U52YsMydTt0A4U=;
        b=TwseGukV3vmFXL6nUa0w5lkLhHWxhj9jmCy4P8W0Hu24BMdHioo5wFZjaG9tTw/4tM
         paYZyEXerk5Nl+lczf+RjizfAF9Yi0IOZkLC1EdvYCfpNCqTRkjX3jqtj8JaSr7lmltc
         bgek3cdeaL/gOlzwqmz0limPDEabJ0hPiPv8hUFt0iX0kPyXlXnLEpt7WSW3nzQVkeXP
         Mw5JMkJMtymtyWEnK13JnwHvv4+Fb05GfaITzLfXasQl+dnUL/QE4XWhqUMoU4Zp/xgU
         D+60nsd24/PyzunLZ/tiyWjSuEpHkkj0DrVyWPp9ZPBMv/Ggw53sImNJQ38c3RtRFrLj
         3vyQ==
X-Gm-Message-State: AC+VfDy7eCFB6wr+360uL4O7+qmYmcs0WpjXgmueaDSKjY8VhFZskFuh
	pPiuDZiDfWpa9/j4ZcctLg/nfBhyRob/iw==
X-Google-Smtp-Source: ACHHUZ7pxHo17wsBtUMuKUFJ2dNC7LyJeUoryVEaF2qEzRDaeDth041EaD51p6RL25p2GtWZiSp8OQ==
X-Received: by 2002:a81:8351:0:b0:56f:fcf5:3f6d with SMTP id t78-20020a818351000000b0056ffcf53f6dmr1713315ywf.27.1686920240596;
        Fri, 16 Jun 2023 05:57:20 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id y188-20020a8188c5000000b00568904cc9dcsm5062599ywf.18.2023.06.16.05.57.19
        for <fsverity@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jun 2023 05:57:19 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-5701eaf0d04so7482687b3.2
        for <fsverity@lists.linux.dev>; Fri, 16 Jun 2023 05:57:19 -0700 (PDT)
X-Received: by 2002:a81:7206:0:b0:570:209a:a4fe with SMTP id
 n6-20020a817206000000b00570209aa4femr1585508ywc.32.1686920239175; Fri, 16 Jun
 2023 05:57:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230615230537.30429-1-ebiggers@kernel.org> <CAMw=ZnR69AhMMQUOwKv9RtP85JzxQhMGO3yzyeEagWxaGiPAZg@mail.gmail.com>
 <20230616021707.GA87129@sol.localdomain> <e213b58defcce0b49ee57cb27df591310eb09fd3.camel@huaweicloud.com>
In-Reply-To: <e213b58defcce0b49ee57cb27df591310eb09fd3.camel@huaweicloud.com>
From: Luca Boccassi <bluca@debian.org>
Date: Fri, 16 Jun 2023 13:57:07 +0100
X-Gmail-Original-Message-ID: <CAMw=ZnT_3ahFUL82iaJ+sA2DFuMtnLMui0qWi7U=BtEnW8bPyg@mail.gmail.com>
Message-ID: <CAMw=ZnT_3ahFUL82iaJ+sA2DFuMtnLMui0qWi7U=BtEnW8bPyg@mail.gmail.com>
Subject: Re: [PATCH] fsverity: improve documentation for builtin signature support
To: Roberto Sassu <roberto.sassu@huaweicloud.com>
Cc: Eric Biggers <ebiggers@kernel.org>, fsverity@lists.linux.dev, 
	linux-integrity@vger.kernel.org, linux-doc@vger.kernel.org, 
	Colin Walters <walters@verbum.org>, Alexander Larsson <alexl@redhat.com>, 
	Victor Hsieh <victorhsieh@google.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 16 Jun 2023 at 10:51, Roberto Sassu
<roberto.sassu@huaweicloud.com> wrote:
>
> On Thu, 2023-06-15 at 19:17 -0700, Eric Biggers wrote:
> > Hi Luca,
> >
> > On Fri, Jun 16, 2023 at 02:10:35AM +0100, Luca Boccassi wrote:
> > > On Fri, 16 Jun 2023 at 00:07, Eric Biggers <ebiggers@kernel.org> wrote:
> > > > From: Eric Biggers <ebiggers@google.com>
> > > >
> > > > fsverity builtin signatures (CONFIG_FS_VERITY_BUILTIN_SIGNATURES) aren't
> > > > the only way to do signatures with fsverity, and they have some major
> > > > limitations.  Yet, more users have tried to use them, e.g. recently by
> > > > https://github.com/ostreedev/ostree/pull/2640.  In most cases this seems
> > > > to be because users aren't sufficiently familiar with the limitations of
> > > > this feature and what the alternatives are.
> > > >
> > > > Therefore, make some updates to the documentation to try to clarify the
> > > > properties of this feature and nudge users in the right direction.
> > > >
> > > > Note that the Integrity Policy Enforcement (IPE) LSM, which is not yet
> > > > upstream, is planned to use the builtin signatures.  (This differs from
> > > > IMA, which uses its own signature mechanism.)  For that reason, my
> > > > earlier patch "fsverity: mark builtin signatures as deprecated"
> > > > (https://lore.kernel.org/r/20221208033548.122704-1-ebiggers@kernel.org),
> > > > which marked builtin signatures as "deprecated", was controversial.
> > > >
> > > > This patch therefore stops short of marking the feature as deprecated.
> > > > I've also revised the language to focus on better explaining the feature
> > > > and what its alternatives are.
> > > >
> > > > Signed-off-by: Eric Biggers <ebiggers@google.com>
> > > > ---
> > > >
> > > > This patch applies to https://git.kernel.org/pub/scm/fs/fsverity/linux.git/log/?h=for-next
> > > >
> > > >  Documentation/filesystems/fsverity.rst | 176 ++++++++++++++++---------
> > > >  fs/verity/Kconfig                      |  16 +--
> > > >  fs/verity/enable.c                     |   2 +-
> > > >  fs/verity/open.c                       |   8 +-
> > > >  fs/verity/read_metadata.c              |   4 +-
> > > >  fs/verity/signature.c                  |   8 ++
> > > >  6 files changed, 139 insertions(+), 75 deletions(-)
> > > >
> > > > diff --git a/Documentation/filesystems/fsverity.rst b/Documentation/filesystems/fsverity.rst
> > > > index ede672dedf110..e990149cfdf5c 100644
> > > > --- a/Documentation/filesystems/fsverity.rst
> > > > +++ b/Documentation/filesystems/fsverity.rst
> > >
> > > Most of the patch looks fine, two notes:
> > >
> > > > +- Trusted userspace code.  When the accesses to a file happen in a
> > > > +  well-defined way, userspace code can authenticate the file's
> > > > +  fs-verity digest before accessing the file.  This can be done by
> > > > +  verifying a signature of the fs-verity file digest using any
> > > > +  userspace cryptographic library that supports digital signatures.
> > > > +  Consider using `libsodium
> > > > +  <https://libsodium.gitbook.io/doc/public-key_cryptography/public-key_signatures>`_
> > > > +  or `Tink <https://developers.google.com/tink/digitally-sign-data>`_.
> > > > +  Other options include OpenSSL, JCA, and libgcrypt.
> > >
> > > This should at least mention something like "depending on whether the
> > > threat model allows trusting userspace with such tasks", because it is
> > > by no means guaranteed that it is the case.
> >
> > Sure, that's why it says "Trusted userspace code", but I can make it clearer.
> >
> > > > +- fs-verity builtin signatures are in PKCS#7 format, and the public
> > > > +  keys are in X.509 format.  These data formats are complex and prone
> > > > +  to vulnerabilities, so parsing them is preferably done in userspace.
> > > > +  (fs-verity builtin signatures were made to use these formats because
> > > > +  other kernel subsystems, such as the module loader, unfortunately
> > > > +  used these formats already.)  Most cryptographic libraries also
> > > > +  support working with raw keys and signatures, which are much
> > > > +  simpler.  For example, consider using `libsodium
> > > > +  <https://libsodium.gitbook.io/doc/public-key_cryptography/public-key_signatures>`_.
> > > > +
> > > > +  IMA appraisal, which supports fs-verity, does not use PKCS#7, so it
> > > > +  partially avoids this issue as well (though it does use X.509).
> > >
> > > The kernel makes extensive use of PKCS7, it's the foundation of the
> > > trust chain with secure boot (and kernel modules as noted) after all,
> > > among other things, so this description looks very out of place as
> > > part of the same project. Readers might be led to believe that using
> > > secure boot or signed modules is useless, or worse, dangerous, and
> > > that it's better not to, and I'm quite sure that's not something we
> > > want.
> > >
> >
> > Unfortunately just because PKCS#7, X.509, and ASN.1 is being used does not mean
> > it is a good idea.  Have you read the kernel code that implements these formats?
> > A few years ago I went through some of it.  Here are some of the bugs I fixed:
> >
> >     2eb9eabf1e86 ("KEYS: fix out-of-bounds read during ASN.1 parsing")
> >     624f5ab8720b ("KEYS: fix NULL pointer dereference during ASN.1 parsing [ver #2]")
> >     e0058f3a874e ("ASN.1: fix out-of-bounds read when parsing indefinite length item")
> >     81a7be2cd69b ("ASN.1: check for error from ASN1_OP_END__ACT actions")
> >     0f30cbea005b ("X.509: reject invalid BIT STRING for subjectPublicKey")
> >     54c1fb39fe04 ("X.509: fix comparisons of ->pkey_algo")
> >     971b42c038dc ("PKCS#7: fix certificate chain verification")
> >     29f4a67c17e1 ("PKCS#7: fix certificate blacklisting")
> >     437499eea429 ("X.509: fix BUG_ON() when hash algorithm is unsupported")
> >     4b34968e77ad ("X.509: fix NULL dereference when restricting key with unsupported_sig")
> >
> > 971b42c038dc is noteworthy; it turned out the kernel did not properly verify
> > certificate chains in PKCS#7 messages.  That was fundamentally a PKCS#7-specific
> > security bug that was directly caused by the complexity that is specific to
> > PKCS#7.  Simple signatures do not have certificate chains.
> >
> > I hope the code is in slightly better shape now.  But I really haven't looked at
> > it in several years.  In any case, the fact is that these formats are complex,
> > which causes bugs.  I don't think we should be trying to pretend otherwise.
>
> That is a quite extensive explanation why is not a good idea to parse
> key/certificates in the kernel.
>
> Actually, I tried to address that with this patch set:
>
> https://lore.kernel.org/linux-kernel//20230425173557.724688-1-roberto.sassu@huaweicloud.com/
>
> The idea was to develop an asymmetric key parser to forward the key
> material from the kernel to a user space process for parsing, and get
> back a well formatted key (basically the same fields of struct
> public_key).
>
> Maybe that would not work for X.509 certificates, as they are
> extensively used in kernel code, but for simpler formats like PGP,
> maybe. And the mechanism is interchangeable. If you want to support
> another key format, you need to change only user space.
>
> The challenge is if the user space process makes some security
> decisions, like for key expiration, etc. I thought that we could
> enforce strong isolation of that process by denying ptrace on it, but
> it is still work in progress...

Something like that makes sense on systems where userspace sits at a
higher privilege level than the kernel, so to speak, in the threat
model. While I'm sure there are such systems, it doesn't mean it's the
best solution everywhere.
So, having that as an option on equal footing: fine, no problem.
Having that as the only option, or implying it's the only
possible/sensible option everywhere: sorry, not fine.

Kind regards,
Luca Boccassi
