Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02378361
	for <fsverity@lists.linux.dev>; Tue, 13 Jun 2023 05:19:02 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-56d0776f668so19849277b3.3
        for <fsverity@lists.linux.dev>; Mon, 12 Jun 2023 22:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686633541; x=1689225541;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jgKvakDEhEGzV06YHsozOqejrE3rMDlfFMcpSiZpB04=;
        b=cx6CHM0Lsdl3w8hA3uIHBk24pHR+g7aBBnE2vYAfps5adpmpPrld928bY6u0sXkApy
         NFDWTo5FaUl1B4ZwojwIp+BTptf8yTz6a9TwETfcEDIz+QUeMDnT+bY3tHl/Gfyg0Rr9
         ve+gdT9PROWl+V+yyQtUSOn+OuJDQ7TTQpNicl2yAHfMIJRhkNUAK86sTixKtlKWnXcE
         nyijnErjeRXXIYcbWJpctkr/EcRG/vTMhmREMCVZObJ0I8Bm8VtKWMoxclJkAD/4/h4f
         sVXWDUqLzb87sWIoR8Nl25myhvF+lbkOLpAH3FPvdaLmPsu3x82cZFif9/FrhtDw3Pqn
         2s6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686633541; x=1689225541;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jgKvakDEhEGzV06YHsozOqejrE3rMDlfFMcpSiZpB04=;
        b=YWPf9fPjNLlIhzUefZWspQYTXgthHfNNXc6g86iLl3dbvhzcy2sKrBvWOH4EJpZcjW
         Zsu5dKHdNgvGviDcsWTHcR7PZq6z9AMvhTmXHKRTYy0Jyo44aVbvj1hYZtQGHYNspJ04
         fMNaIkdQLKVPyVDxigtxSpTNfAnZGVg3gD+IsJ+miwqd/1E067F4K9aPK+VOgkN2wWQn
         BH54dRt1vEXvXFCmxzd3Ma8gJIkOA7nDpYdq2ltsLwUzIFihG4CZ0HRKBMEvMsPpjGgY
         fxhBIslhgKc1FiHJSC31YfsmyQgfeGwBzENNa0aVY3+BHgyqeYJsf+uQzCKdxPmQDxIe
         ZgUQ==
X-Gm-Message-State: AC+VfDwViPfNa6W+DpiOy0DVFpmnKd4UdludbVdNS75x28vQRWfFQG0U
	2hZEhRUad4s7EjEekzP9lmpIRYRMoHVc3kttScXFExz5lDM=
X-Google-Smtp-Source: ACHHUZ5T+jevThYxjEuz/ujRECT0knXFOba5qJXKxW1rX1miX8BuWlTeElaLZzUYOJ7tVzP65Wgy0H219i9ZaHJbQX4=
X-Received: by 2002:a0d:ca82:0:b0:56d:4f45:a8e5 with SMTP id
 m124-20020a0dca82000000b0056d4f45a8e5mr783494ywd.30.1686633541655; Mon, 12
 Jun 2023 22:19:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1686565330.git.alexl@redhat.com> <03ac0ffd82bc1edc3a9baa68d1125f5e8cad93fd.1686565330.git.alexl@redhat.com>
 <20230612163216.GA847@sol.localdomain>
In-Reply-To: <20230612163216.GA847@sol.localdomain>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 13 Jun 2023 08:18:50 +0300
Message-ID: <CAOQ4uxjS5-7_PaoxM41YaXW+KxwLK_K8AyJMaoi1m-3P-vZ9Kw@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] ovl: Add framework for verity support
To: Eric Biggers <ebiggers@kernel.org>
Cc: Alexander Larsson <alexl@redhat.com>, miklos@szeredi.hu, linux-unionfs@vger.kernel.org, 
	tytso@mit.edu, fsverity@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 12, 2023 at 7:32=E2=80=AFPM Eric Biggers <ebiggers@kernel.org> =
wrote:
>
> On Mon, Jun 12, 2023 at 12:27:17PM +0200, Alexander Larsson wrote:
> > +fs-verity support
> > +----------------------
> > +
> > +When metadata copy up is used for a file, then the xattr
> > +"trusted.overlay.verity" may be set on the metacopy file. This
> > +specifies the expected fs-verity digest of the lowerdata file. This
> > +may then be used to verify the content of the source file at the time
> > +the file is opened. During metacopy copy up overlayfs can also set
> > +this xattr.
> > +
> > +This is controlled by the "verity" mount option, which supports
> > +these values:
> > +
> > +- "off":
> > +    The verity xattr is never used. This is the default if verity
> > +    option is not specified.
> > +- "on":
> > +    Whenever a metacopy files specifies an expected digest, the
> > +    corresponding data file must match the specified digest.
> > +    When generating a metacopy file the verity xattr will be set
> > +    from the source file fs-verity digest (if it has one).
> > +- "require":
> > +    Same as "on", but additionally all metacopy files must specify a
> > +    verity xattr. This means metadata copy up will only be used if
> > +    the data file has fs-verity enabled, otherwise a full copy-up is
> > +    used.
>
> It looks like my request for improved documentation was not taken, which =
is
> unfortunate and makes this patchset difficult to review.
>

Which one?
IIRC, you had two requests.
One very broad to get the overlayfs.rst document up-to-date:
[1] https://lore.kernel.org/linux-unionfs/20230514190903.GC9528@sol.localdo=
main/

But I assume you mean the specific request about this sentence:
[2] https://lore.kernel.org/linux-unionfs/20230514192227.GE9528@sol.localdo=
main/

I must say, I re-read this paragraph and the email thread and I don't
understand what it is that you are asking for.

I am not trying to dismiss your request, I am trying to understand.
I understand that overlayfs.rst is not a high standard spec and that
"metacopy files" is not well defined and I am not saying that we cannot
improve the documentation.

But since you already spent the extra time understanding the inaccuracies
of overlayfs.rst during v2 review and we already tried to explain the
details of metacopy in v2 review, please elaborate what information
is actually missing that made the review of v3 harder for you, so
that we can try to improve those parts.

Let me try to tell this story in a different way

Imagine a feature:
   send/recv email attachments by reference
   instead of attaching files, drop them in a network share
   and send/recv a URL to that share with optional verity sig.
verity=3Doff:
   do not include verity sig when sending emails
   do not verify verity sig when receiving emails
verity=3Don:
   include verity sig when sending emails (if available)
   verify verity sig if it is included in received email
verity=3Drequire:
   same as verity=3Don, but if verity sig is not included
   in received email, do not follow URL.
   if verity sig not available when sending, attach the
   file itself instead of the URL -
   that is what "otherwise a full copy-up" means in the
   context above

To me this sounds exactly like the documentation above.
Is this story clear?
If it is, what in the doc above is missing to make it also clear?

Thanks,
Amir.
