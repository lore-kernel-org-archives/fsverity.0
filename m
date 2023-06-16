Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF23736D
	for <fsverity@lists.linux.dev>; Fri, 16 Jun 2023 01:10:48 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-bd6d9d7da35so123941276.0
        for <fsverity@lists.linux.dev>; Thu, 15 Jun 2023 18:10:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686877847; x=1689469847;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sfbNROs6Pgx0jh/QUciGEinEqOd0nb4vq/TV0kvqbQo=;
        b=ZBCxPQemnnqpZNIHPW7e+AiFn7ep7zUy1jaWhypPzO8RPKPpImFHsoJ89ssnWKflQy
         g27aARUOUCy9+lw56QIfZpVXNN4pIRLCT5202rHsZb2xHvFmSEjOkXw8FWSjioTceGXf
         TFTX2VS+9K4i/cUIQJJeg7KVZv9KPIm3nOVs0/005p0eA7MxUMsV2p2ZeeeGk5s0RifH
         xEkRUciAsnAEUQvi//Nxdm9t1fObmxmUjcraN6FgjbZseuTalcMu5T2EIjroy5UJnxz2
         RaI2n9FPkn+aFcW0K/GY2PYAhR2VaRWyto5kacYJuXiP6XYAx7LgtEsqR7l7eL7611+W
         Qw1g==
X-Gm-Message-State: AC+VfDy2EUabHPzbZuPHuV2mygZiwdeGWi9sblh+5WIKRdoPWMnd2F7y
	5j66OtFqZM1p8pwxCDQYpQxHKJYofTUaVI81
X-Google-Smtp-Source: ACHHUZ4xoeP2tBrxUaWPENU26Z/tAwhIVJP8zx+V2idOqkILMHjyH58UWfvfWGpon9LQJI4GCO1E5w==
X-Received: by 2002:a25:1186:0:b0:bcd:1e83:2467 with SMTP id 128-20020a251186000000b00bcd1e832467mr492371ybr.33.1686877847339;
        Thu, 15 Jun 2023 18:10:47 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id v128-20020a257a86000000b00bb163732c14sm4384894ybc.10.2023.06.15.18.10.46
        for <fsverity@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jun 2023 18:10:46 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-56fff21c2ebso2680527b3.3
        for <fsverity@lists.linux.dev>; Thu, 15 Jun 2023 18:10:46 -0700 (PDT)
X-Received: by 2002:a0d:d5d5:0:b0:56d:4d7:4a45 with SMTP id
 x204-20020a0dd5d5000000b0056d04d74a45mr304478ywd.52.1686877846182; Thu, 15
 Jun 2023 18:10:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230615230537.30429-1-ebiggers@kernel.org>
In-Reply-To: <20230615230537.30429-1-ebiggers@kernel.org>
From: Luca Boccassi <bluca@debian.org>
Date: Fri, 16 Jun 2023 02:10:35 +0100
X-Gmail-Original-Message-ID: <CAMw=ZnR69AhMMQUOwKv9RtP85JzxQhMGO3yzyeEagWxaGiPAZg@mail.gmail.com>
Message-ID: <CAMw=ZnR69AhMMQUOwKv9RtP85JzxQhMGO3yzyeEagWxaGiPAZg@mail.gmail.com>
Subject: Re: [PATCH] fsverity: improve documentation for builtin signature support
To: Eric Biggers <ebiggers@kernel.org>
Cc: fsverity@lists.linux.dev, linux-integrity@vger.kernel.org, 
	linux-doc@vger.kernel.org, Colin Walters <walters@verbum.org>, 
	Alexander Larsson <alexl@redhat.com>, Victor Hsieh <victorhsieh@google.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 16 Jun 2023 at 00:07, Eric Biggers <ebiggers@kernel.org> wrote:
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
> This patch applies to https://git.kernel.org/pub/scm/fs/fsverity/linux.git/log/?h=for-next
>
>  Documentation/filesystems/fsverity.rst | 176 ++++++++++++++++---------
>  fs/verity/Kconfig                      |  16 +--
>  fs/verity/enable.c                     |   2 +-
>  fs/verity/open.c                       |   8 +-
>  fs/verity/read_metadata.c              |   4 +-
>  fs/verity/signature.c                  |   8 ++
>  6 files changed, 139 insertions(+), 75 deletions(-)
>
> diff --git a/Documentation/filesystems/fsverity.rst b/Documentation/filesystems/fsverity.rst
> index ede672dedf110..e990149cfdf5c 100644
> --- a/Documentation/filesystems/fsverity.rst
> +++ b/Documentation/filesystems/fsverity.rst

Most of the patch looks fine, two notes:

> +- Trusted userspace code.  When the accesses to a file happen in a
> +  well-defined way, userspace code can authenticate the file's
> +  fs-verity digest before accessing the file.  This can be done by
> +  verifying a signature of the fs-verity file digest using any
> +  userspace cryptographic library that supports digital signatures.
> +  Consider using `libsodium
> +  <https://libsodium.gitbook.io/doc/public-key_cryptography/public-key_signatures>`_
> +  or `Tink <https://developers.google.com/tink/digitally-sign-data>`_.
> +  Other options include OpenSSL, JCA, and libgcrypt.

This should at least mention something like "depending on whether the
threat model allows trusting userspace with such tasks", because it is
by no means guaranteed that it is the case.

> +- fs-verity builtin signatures are in PKCS#7 format, and the public
> +  keys are in X.509 format.  These data formats are complex and prone
> +  to vulnerabilities, so parsing them is preferably done in userspace.
> +  (fs-verity builtin signatures were made to use these formats because
> +  other kernel subsystems, such as the module loader, unfortunately
> +  used these formats already.)  Most cryptographic libraries also
> +  support working with raw keys and signatures, which are much
> +  simpler.  For example, consider using `libsodium
> +  <https://libsodium.gitbook.io/doc/public-key_cryptography/public-key_signatures>`_.
> +
> +  IMA appraisal, which supports fs-verity, does not use PKCS#7, so it
> +  partially avoids this issue as well (though it does use X.509).

The kernel makes extensive use of PKCS7, it's the foundation of the
trust chain with secure boot (and kernel modules as noted) after all,
among other things, so this description looks very out of place as
part of the same project. Readers might be led to believe that using
secure boot or signed modules is useless, or worse, dangerous, and
that it's better not to, and I'm quite sure that's not something we
want.

Kind regards,
Luca Boccassi
