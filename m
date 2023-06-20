Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 169112AB55
	for <fsverity@lists.linux.dev>; Tue, 20 Jun 2023 19:15:55 +0000 (UTC)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-5700401acbeso55228647b3.0
        for <fsverity@lists.linux.dev>; Tue, 20 Jun 2023 12:15:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687288555; x=1689880555;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J9aIQ0PjtPWDuZDbSrp1ylwlxr0L4BcJbt/NlFEzGjw=;
        b=fh3s9z26xeGM3GSC4cdZUKuGHEIEt2sv/qBzF8dqbJe9B3IxlsKsrLZfE/eKNAANrB
         nohYLpvjODI00MN9xL8tiYeV5SXyeUiVj1zAINQonnwq6huQMTTTKRLVSrLx7S0EkJ9H
         mCWez4xkO32yWJ6037fR6zF8RS6n0y+VbOArEybwhRkZm0OewfT8pzIS32WflPZbihvL
         ToAtxZyNLcocS+HxCgFU9jqpTNAp3niAkpWYq+cOuQGAEyX3aOkhrMa2TxDkGA8QJTle
         KNg8Tw6BSl9QlLE+0PgMRVoA97nPT2u6pH8l91P6ZNrJTsUpifIkd13wrSaemTGfxi9J
         0NWA==
X-Gm-Message-State: AC+VfDwCrbmyTi8pZkNjQCGkzhzXU0jeAraKp1vNpgnVCaHal8bNB1Bf
	xqfXvOR3YBvoRX3iA53KrABbIgNOD3Wjzg==
X-Google-Smtp-Source: ACHHUZ5wzhYDEKPn/gqTbHaluReewgrMMuGcn+xcr36U3Z0Iu1oZ4qtghHYU0WWKOhGE8qj5Tgcv/A==
X-Received: by 2002:a25:c785:0:b0:bb3:ae54:9fcd with SMTP id w127-20020a25c785000000b00bb3ae549fcdmr10594851ybe.23.1687288554727;
        Tue, 20 Jun 2023 12:15:54 -0700 (PDT)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id l1-20020a252501000000b00bccc2241e14sm516743ybl.28.2023.06.20.12.15.53
        for <fsverity@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jun 2023 12:15:54 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-56ffd7d7fedso55024177b3.2
        for <fsverity@lists.linux.dev>; Tue, 20 Jun 2023 12:15:53 -0700 (PDT)
X-Received: by 2002:a25:ada2:0:b0:ba7:b933:9063 with SMTP id
 z34-20020a25ada2000000b00ba7b9339063mr11008259ybi.4.1687288553412; Tue, 20
 Jun 2023 12:15:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230620041937.5809-1-ebiggers@kernel.org>
In-Reply-To: <20230620041937.5809-1-ebiggers@kernel.org>
From: Luca Boccassi <bluca@debian.org>
Date: Tue, 20 Jun 2023 20:15:42 +0100
X-Gmail-Original-Message-ID: <CAMw=ZnQg2dvdivEPdScMcgQQtj00T=EigpGn0ZRYHLMU=AKLMA@mail.gmail.com>
Message-ID: <CAMw=ZnQg2dvdivEPdScMcgQQtj00T=EigpGn0ZRYHLMU=AKLMA@mail.gmail.com>
Subject: Re: [PATCH v3] fsverity: improve documentation for builtin signature support
To: Eric Biggers <ebiggers@kernel.org>
Cc: fsverity@lists.linux.dev, linux-integrity@vger.kernel.org, 
	linux-doc@vger.kernel.org, Colin Walters <walters@verbum.org>, 
	Alexander Larsson <alexl@redhat.com>, Victor Hsieh <victorhsieh@google.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 20 Jun 2023 at 05:23, Eric Biggers <ebiggers@kernel.org> wrote:
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
> v3: fixed ioctl name, and more updates to address Luca's comments
> v2: updated two paragraphs of fsverity.rst to address Luca's comments
>
>  Documentation/filesystems/fsverity.rst | 192 ++++++++++++++++---------
>  fs/verity/Kconfig                      |  16 +--
>  fs/verity/enable.c                     |   2 +-
>  fs/verity/open.c                       |   8 +-
>  fs/verity/read_metadata.c              |   4 +-
>  fs/verity/signature.c                  |   8 ++
>  6 files changed, 149 insertions(+), 81 deletions(-)
<...>
> +- fs-verity builtin signatures are in PKCS#7 format, and the public
> +  keys are in X.509 format.  These formats are commonly used,
> +  including by some other kernel features (which is why the fs-verity
> +  builtin signatures use them), and are very feature rich.
> +  Unfortunately, history has shown that code that parses and handles
> +  these formats (which are from the 1990s and are based on ASN.1)
> +  often has vulnerabilities as a result of their complexity.  This
> +  complexity is not inherent to the cryptography itself.
> +
> +  fs-verity users who do not need advanced features of X.509 and
> +  PKCS#7 should strongly consider using simpler formats, such as plain
> +  Ed25519 keys and signatures, and verifying signatures in userspace.
> +
> +  fs-verity users who choose to use X.509 and PKCS#7 anyway should
> +  still consider that verifying those signatures in userspace is more
> +  flexible (for other reasons mentioned earlier in this document) and
> +  eliminates the need to enable CONFIG_FS_VERITY_BUILTIN_SIGNATURES
> +  and its associated increase in kernel attack surface.  In some cases
> +  it can even be necessary, since advanced X.509 and PKCS#7 features
> +  do not always work as intended with the kernel.  For example, the
> +  kernel does not check X.509 certificate validity times.
> +
> +  Note: IMA appraisal, which supports fs-verity, does not use PKCS#7
> +  for its signatures, so it partially avoids the issues discussed
> +  here.  IMA appraisal does use X.509.

Thank you for the update, I find this new version much better as it is
clearly scoped for the specific case of fs-verity, hence:

Reviewed-by: Luca Boccassi <bluca@debian.org>
