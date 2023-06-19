Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50DD5C2CC
	for <fsverity@lists.linux.dev>; Mon, 19 Jun 2023 23:04:53 +0000 (UTC)
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-47164fe4941so886714e0c.1
        for <fsverity@lists.linux.dev>; Mon, 19 Jun 2023 16:04:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687215892; x=1689807892;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RFSPNjm2hMa0/jsneVXl5q2cKXCwfSxcO5Rh1yMkXew=;
        b=Frpptt7sNNPjpgmb+Ciq/MQphzNEAl0PRQMUNAKkD1SChtxFVTqpTaKP81gbZ3VZ55
         1NnuR59tUolpELdwbGz2lDu+yJ0VayzOFCJ5NnbB2NaLmx63NsQxy3MBw7A1EKGVbllb
         4uchcy/7oQDDRZ0oAeqZvBjIG3azAgc5iNipoW7+/HkuhFUtbem1y9lZfrc87aike3lz
         jScNLQi61SRtrXhZUdGtZt/aZrN72jy/NVkDXRPvH/73yr8G4lSFAEhw1H3iSvowsZX7
         WroD8lBzN59rB2wMGKiJozneq90FzzmmR/z7+URf+QdI3qxcZRA0RQAVdCccnEtTViU6
         i+/g==
X-Gm-Message-State: AC+VfDzyDKjPKdX9ZrHfy+BBlbBBtae5Dw47eLdKQ8MAFuyE7ifPLtw/
	eyk647as/wq63dSXSFcBlj5TfFDqvT8Ovg==
X-Google-Smtp-Source: ACHHUZ414rdpL9nrLcwGFtidlhaYJ/YFDoZZQTlK7DpucRSGmsk2ZVlVJAfcaqe3Spd31n1R468B+g==
X-Received: by 2002:a1f:e784:0:b0:471:6119:95cc with SMTP id e126-20020a1fe784000000b00471611995ccmr2584401vkh.14.1687215891644;
        Mon, 19 Jun 2023 16:04:51 -0700 (PDT)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com. [209.85.219.173])
        by smtp.gmail.com with ESMTPSA id d11-20020a814f0b000000b00568b941e5e3sm197172ywb.72.2023.06.19.16.04.51
        for <fsverity@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jun 2023 16:04:51 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-bd61dd9a346so4135499276.2
        for <fsverity@lists.linux.dev>; Mon, 19 Jun 2023 16:04:51 -0700 (PDT)
X-Received: by 2002:a0d:d5cc:0:b0:570:126:feaf with SMTP id
 x195-20020a0dd5cc000000b005700126feafmr12478101ywd.19.1687215890768; Mon, 19
 Jun 2023 16:04:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230619221048.10335-1-ebiggers@kernel.org>
In-Reply-To: <20230619221048.10335-1-ebiggers@kernel.org>
From: Luca Boccassi <bluca@debian.org>
Date: Tue, 20 Jun 2023 00:04:39 +0100
X-Gmail-Original-Message-ID: <CAMw=ZnQCBJM71wi-yO99yi+KTy=WtR2+jJxU2snvWgJTzTeeFw@mail.gmail.com>
Message-ID: <CAMw=ZnQCBJM71wi-yO99yi+KTy=WtR2+jJxU2snvWgJTzTeeFw@mail.gmail.com>
Subject: Re: [PATCH v2] fsverity: improve documentation for builtin signature support
To: Eric Biggers <ebiggers@kernel.org>
Cc: fsverity@lists.linux.dev, linux-integrity@vger.kernel.org, 
	linux-doc@vger.kernel.org, Colin Walters <walters@verbum.org>, 
	Alexander Larsson <alexl@redhat.com>, Victor Hsieh <victorhsieh@google.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 19 Jun 2023 at 23:11, Eric Biggers <ebiggers@kernel.org> wrote:
>
> From: Eric Biggers <ebiggers@google.com>
>
> fsverity builtin signatures (CONFIG_FS_VERITY_BUILTIN_SIGNATURES) aren't
> the only way to do signatures with fsverity, and they have some major
> limitations.  Yet, more users have tried to use them, e.g. recently by
> https://github.com/ostreedev/ostree/pull/2640.  In most cases this seems
> to be because users aren't sufficiently familiar with the limitations of
> this feature and what the alternatives are.
>
> Therefore, make some updates to the documentation to try to clarify the
> properties of this feature and nudge users in the right direction.
>
> Note that the Integrity Policy Enforcement (IPE) LSM, which is not yet
> upstream, is planned to use the builtin signatures.  (This differs from
> IMA, which uses its own signature mechanism.)  For that reason, my
> earlier patch "fsverity: mark builtin signatures as deprecated"
> (https://lore.kernel.org/r/20221208033548.122704-1-ebiggers@kernel.org),
> which marked builtin signatures as "deprecated", was controversial.
>
> This patch therefore stops short of marking the feature as deprecated.
> I've also revised the language to focus on better explaining the feature
> and what its alternatives are.
>
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>
> v2: updated two paragraphs of fsverity.rst to address Luca's comments
>
>  Documentation/filesystems/fsverity.rst | 190 ++++++++++++++++---------
>  fs/verity/Kconfig                      |  16 +--
>  fs/verity/enable.c                     |   2 +-
>  fs/verity/open.c                       |   8 +-
>  fs/verity/read_metadata.c              |   4 +-
>  fs/verity/signature.c                  |   8 ++
>  6 files changed, 147 insertions(+), 81 deletions(-)
>
> diff --git a/Documentation/filesystems/fsverity.rst b/Documentation/filesystems/fsverity.rst
> index ede672dedf110..c33f783e74953 100644
> --- a/Documentation/filesystems/fsverity.rst
> +++ b/Documentation/filesystems/fsverity.rst
<...>
> +- Trusted userspace code.  Often, the userspace code that accesses
> +  files can be trusted to authenticate them.  Consider e.g. an
> +  application that wants to authenticate data files before using them,
> +  or an application loader that is part of the operating system (which
> +  is already authenticated in a different way, such as by being loaded
> +  from a read-only partition that uses dm-verity) and that wants to
> +  authenticate applications before loading them.  In these cases, this
> +  trusted userspace code can authenticate a file's contents by
> +  retrieving its fs-verity digest using `FS_IOC_ENABLE_VERITY`_, then
> +  verifying a signature of it using any userspace cryptographic
> +  library that supports digital signatures.  Consider using `libsodium
> +  <https://libsodium.gitbook.io/doc/public-key_cryptography/public-key_signatures>`_
> +  or `Tink <https://developers.google.com/tink/digitally-sign-data>`_.
> +  Other options include OpenSSL, JCA, and libgcrypt.

Text looks good to me now, but please just drop the last sentence with
the external projects links, as it seems best left as an exercise for
the reader to find their preferred tooling that is appropriate to be
used at the time of reading, as this will get out of date fast.

<...>

> +- fs-verity builtin signatures are in PKCS#7 format, and the public
> +  keys are in X.509 format.  These data formats are unnecessarily
> +  complex and prone to vulnerabilities.  (fs-verity builtin signatures
> +  were made to use these formats because other kernel subsystems, such
> +  as the module loader, unfortunately used these formats already.
> +  Note, these formats should still be used when they are the only
> +  option to have signatures at all.)  Userspace signature verification
> +  avoids having to enable CONFIG_FS_VERITY_BUILTIN_SIGNATURES and the
> +  associated kernel attack surface.  Userspace also has the
> +  flexibility to choose simpler formats.  For example, consider using
> +  straightforward Ed25519 keys and signatures with `libsodium
> +  <https://libsodium.gitbook.io/doc/public-key_cryptography/public-key_signatures>`_.
> +
> +  IMA appraisal, which supports fs-verity, does not use PKCS#7, so it
> +  partially avoids this issue as well (though it does use X.509).
> +
> +  If you are considering making use of "advanced" features of X.509
> +  and/or PKCS#7, please also keep in mind that these "advanced"
> +  features do not always work as intended with the kernel.  For
> +  example, the kernel does not check X.509 certificate validity times.

Sorry but this still reads as way too opinionated and generic, rather
than being fsverity-specific. Please simplify to convey the same
message in more concise way, perhaps something along these lines:

- fs-verity builtin signatures are in PKCS#7 format, and the public
keys are in X.509 format. IMA appraisal, which supports fs-verity,
uses a custom signature format rather than PKCS#7 and X.509 for public
keys. Alternative formats for signatures and public keys are not
supported for builtin signatures or IMA appraisal. For fully flexible
and customized signature and public keys formats, while also avoiding
to expose the kernel to untrusted input, signature verification can be
implemented by a trusted userspace component as described at <pointer
to appropriate section>

Kind regards,
Luca Boccassi
