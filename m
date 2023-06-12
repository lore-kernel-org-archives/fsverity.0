Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 497BF19BA9
	for <fsverity@lists.linux.dev>; Mon, 12 Jun 2023 15:06:07 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-662b85f4640so3642238b3a.0
        for <fsverity@lists.linux.dev>; Mon, 12 Jun 2023 08:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686582366; x=1689174366;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/3pYtOGXDogEBQ6xIjJX27mG5gsIGFXsHtKucgzZkts=;
        b=bVijmNztXh/iD4oZjc9DGd4C0nSkORDqOqDV/o9JrxWHqg/lRO84MKMNqzz9ZgtZWr
         oF43Z1jBZ4GaoeuSqTOBNaaL09lsbbRAR/poyFKbX3qsSDE7ekXI6zWe8K2IcJaHXu8q
         r8p/XbZUuaEWgBNc5pQ+Fa0GskszBwp9kH0JTHgytJERf1nva/NAPIZgpA4uLRDSF4A3
         hvCfW6b0C+Pb8w/0G0J+bbDZXgMRZBAH1pRe59MujdzlmjeoUd1lR1OcujLUbu55GQXM
         66KuxpCN3NkpyLcMdZ79GsHpV2C1T9bgmqPghfR5ahMfDEtN3BFA8LgIw6ryN76QPYVI
         r4aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686582366; x=1689174366;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/3pYtOGXDogEBQ6xIjJX27mG5gsIGFXsHtKucgzZkts=;
        b=f9m755XGP3VFLmsTCG2mEfqDMP8TJNgXN0gFUfs3cIcuMzioofC4n2WT3xnLnyZp49
         h1BWUBEQ6YkjHyD7XnXNtBVUIAUzYgualNwJ3XPCMNWi9alQ3EX1eN8FK3YDB1Tt2tll
         VLuhvQK9SsXvU9aIParWJdAuWWo/EfAlwnHmvHbltFCtmVJSQ9T+UvOAzD/BiiBmQtvJ
         wkw/D9E+rdQGMKS+yiziIPiyUtpS7KBMbFILv81NUVpjCCUDTIRg5//eQqBbPJKzNHCX
         EYmZ/u/DQYzIkvINxZ0QXsVebZtX5rDNIvtKavMQU2dTCUqM2F+BMgCNpXaFAZt3Aqng
         DCZg==
X-Gm-Message-State: AC+VfDxjGEGKhdPKP0TCIPczgtU8ecsdF+CTx2LUEeUx1f1OIGgxjBN6
	g7s7TJc07BoCdkxfu9CF6fniqLgtsoxP82cQlWPCDuwp
X-Google-Smtp-Source: ACHHUZ4ZjWWJcFBET16riQJv8ouBKK7sZ6IlAtaweztePXxgGYhBPEEM9lrXigd5PUcanOpgSWzt6tkI8FpVxTrYMOE=
X-Received: by 2002:a17:902:860a:b0:1b0:499f:7a8d with SMTP id
 f10-20020a170902860a00b001b0499f7a8dmr6295069plo.9.1686582366435; Mon, 12 Jun
 2023 08:06:06 -0700 (PDT)
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
Date: Mon, 12 Jun 2023 18:05:55 +0300
Message-ID: <CAOQ4uxj9MPVnxt10MGGL+50tt2JMK_tU7BTxyDxcoOiL9TNR2w@mail.gmail.com>
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

Nice!

Thanks,
Amir.
