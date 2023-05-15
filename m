Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80531FDF
	for <fsverity@lists.linux.dev>; Mon, 15 May 2023 06:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684131151;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Pdsn3qGgTLeTkiMuKjEiUFNwY2KoFNpZ7qP+V7Kd6v8=;
	b=b/sqnCwjuPfrQTh3lYNYU+H3MI25j24NPzTanHsW9pvhb5sl6+0BiYTmV7LExhF9XIje9K
	zSoDf3+nKj9oVUluB0AAnGBPjEb5EcKWA5RWC5zAwQ54AdgAd7qqWoZ4iYjeFPvpy418qk
	W6x/smJJDI6TrlLPi68dsXrzYCG5qIw=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-370-i6vCB4tQPxWLiFSbUm3XRg-1; Mon, 15 May 2023 02:12:29 -0400
X-MC-Unique: i6vCB4tQPxWLiFSbUm3XRg-1
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-331828cdc2dso78093605ab.3
        for <fsverity@lists.linux.dev>; Sun, 14 May 2023 23:12:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684131149; x=1686723149;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pdsn3qGgTLeTkiMuKjEiUFNwY2KoFNpZ7qP+V7Kd6v8=;
        b=Bx19PPv0DAIpSKrICf7FI1ZnF0qBtQVwzZBHsTGLacASuaR7dxJzUuftWxa9VVGRXl
         E+PjEdwWuxwsTHfQ6wfxcQhm5RCM6ErTkGoLCsRmUAlSk4UoZ/j1Ox/b79puai8dinPS
         dbIW1tUhGlm4tsGat045dwaGlfMw7KzieItxU7J23rFcxL/Vos2Z5SfguY9LbaBoQY2I
         PGZehoBez0p+evZaX1IAEHyRaD7i84aqHyCUycxd4kv4oxpVVlvU6DBw40cwkTtSm+f3
         nDYjFTpEXy+fFNOwBI5Sy9nS3YxkNWXUzlBWeiS3Q9VHg5siWtWj7DdOYvjtKCSLsdRm
         bZVA==
X-Gm-Message-State: AC+VfDzuGu8ofVyP3rhBjMNNw/xf28sYDlm5h3I95bDPa25Izhj61KEX
	+SE2aMkx3qZ5juvEcHDBxxC3/G9CpfNWgdFrhJog47UtSKIFQajrNp84rMyPYJu0gpL7AbhVc3+
	rey+yNLmHfxo1n+iF2b3cGearLg2WUMzMzSs=
X-Received: by 2002:a92:c8c8:0:b0:335:6e5d:afb4 with SMTP id c8-20020a92c8c8000000b003356e5dafb4mr16277205ilq.24.1684131148869;
        Sun, 14 May 2023 23:12:28 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7+SFq2BIIjvc+BvKCs4v8nadIsVzNIBKDXxvlsCxgbNdIFwNtfK1DgaxEPb0dFraJwECzelDL7oVTMKkSFifc=
X-Received: by 2002:a92:c8c8:0:b0:335:6e5d:afb4 with SMTP id
 c8-20020a92c8c8000000b003356e5dafb4mr16277193ilq.24.1684131148691; Sun, 14
 May 2023 23:12:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1683102959.git.alexl@redhat.com> <b58e57955e122b5d6c4e087cf2dd6ed664152c7b.1683102959.git.alexl@redhat.com>
 <20230514191647.GD9528@sol.localdomain>
In-Reply-To: <20230514191647.GD9528@sol.localdomain>
From: Alexander Larsson <alexl@redhat.com>
Date: Mon, 15 May 2023 08:12:17 +0200
Message-ID: <CAL7ro1G8q-n+LYAjD-JDHReM4685+TuR0h9yyGsoN+cXtjabYg@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] ovl: Validate verity xattr when resolving lowerdata
To: Eric Biggers <ebiggers@kernel.org>
Cc: miklos@szeredi.hu, linux-unionfs@vger.kernel.org, amir73il@gmail.com, 
	tytso@mit.edu, fsverity@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 14, 2023 at 9:16=E2=80=AFPM Eric Biggers <ebiggers@kernel.org> =
wrote:
>
> On Wed, May 03, 2023 at 10:51:38AM +0200, Alexander Larsson wrote:
> > When resolving lowerdata (lazily or non-lazily) we check the
> > overlay.verity xattr on the metadata inode, and if set verify that the
> > source lowerdata inode matches it (according to the verity options
> > enabled).
>
> Keep in mind that the lifetime of an inode's fsverity digest is from when=
 it is
> first opened to when the inode is evicted from the inode cache.
>
> If the inode gets evicted from cache and re-instantiated, it could have b=
een
> arbitrarily changed.
>
> Given that, does this verification happen in the right place?  I would ha=
ve
> expected it to happen whenever the file is opened, but it seems you do it=
 when
> the dentry is looked up instead.  Maybe that works too, but I'd appreciat=
e an
> explanation.

The overlayfs inode will, after lookup, keep a reference to the dentry
(and thus inode) of the lower file, until such a time that the overlay
inode is evicted from the cache. This will keep the fsverity digest on
the lower alive while the overlay inode is alive. If the overlay inode
is evicted, then we will re-validate the verity on lookup().

As amir mentioned, this may not be optimal, and it may be beneficial
to sometimes delay the digest validation, but that is more of a
performance detail.

--=20
=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D
 Alexander Larsson                                Red Hat, Inc
       alexl@redhat.com         alexander.larsson@gmail.com

