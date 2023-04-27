Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D981FCC
	for <fsverity@lists.linux.dev>; Thu, 27 Apr 2023 07:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1682580190;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5jeqJ9HassJzAfQwWAImivyo69DUol104gIRj/UZUGc=;
	b=fVBajJn/PP1BarwcIKuG0FrarEV+jpP6DQXr9+0+PfIZ00kSaJSeZm37Y9EjRyk2igSyG4
	/3qux1knNsPWkfxp1W0e4dJAfRYeXM4qLDERx0sH7gcCSw/bJnn8uhPgrBp6Jtnccu4LRM
	k1qvI+Ddhe14Hc4Vu4B44Tc4e/IFCLU=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-311-ULbPMVEPMk-HD-cQ76wnng-1; Thu, 27 Apr 2023 03:23:08 -0400
X-MC-Unique: ULbPMVEPMk-HD-cQ76wnng-1
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-32ad0d95fdbso60556745ab.3
        for <fsverity@lists.linux.dev>; Thu, 27 Apr 2023 00:23:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682580188; x=1685172188;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5jeqJ9HassJzAfQwWAImivyo69DUol104gIRj/UZUGc=;
        b=e5FNg74BfUp2gWC1ikRvumobqwJK7ZK+PEXmEQ0ZwXXP7uI51BXuqsNza57crxSMsD
         BE2asP9VLIjWCQR26xj3SIBvwTb8NQtMW4JHsmjXNziGP9RqwsWaPu7ckxEnvlN5H6LX
         L3fMFZHlmjBBpL9hHd/qMRjJXCqGutjCudCc/MKCEAsbGJjip7xd/cREBetKPSaq6Ek8
         yRIBpjBSB408VT2q4NAr2weF5AFdkm0Ytr7Rs6KnQx2T3um2Shoy11C/zhyzjzGaEVNd
         WszfYZzxac553D8r6rM/ahqdwzTeHEsrhl0mSPn1lhp08cLrGarHKlPWv4gXIcbR/gOh
         jm9Q==
X-Gm-Message-State: AC+VfDzVYAiq6aeZUPsFI5Nt+HPsU2xWSqIiak38zhWBjh7AgpV+w5UE
	FZqPQZvMvs911R91lhzA9Jbnvd7m0gDAB3gUQ6HOP3wPipaPgLnXIYgGotl6WrKmKMSfwvQ/oMR
	Zgi3+LD5M2OtCNcwVaxnTyzXZuO5e1DMFE+I=
X-Received: by 2002:a92:cac8:0:b0:317:6ead:2e4e with SMTP id m8-20020a92cac8000000b003176ead2e4emr671924ilq.5.1682580188209;
        Thu, 27 Apr 2023 00:23:08 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7/5qop1vbx8tY3uDBO2RQRnX5LMLKyFzq26C7+s7nd9J1BQzKLWoIeyB+cY1Zrv0QdaIMEr2wBenDoUzKOLB8=
X-Received: by 2002:a92:cac8:0:b0:317:6ead:2e4e with SMTP id
 m8-20020a92cac8000000b003176ead2e4emr671916ilq.5.1682580188017; Thu, 27 Apr
 2023 00:23:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1681917551.git.alexl@redhat.com> <df41e9dc96ddad9f9e1e684e39c28f4e097e9d9b.1681917551.git.alexl@redhat.com>
 <20230426214743.GA58528@sol.localdomain>
In-Reply-To: <20230426214743.GA58528@sol.localdomain>
From: Alexander Larsson <alexl@redhat.com>
Date: Thu, 27 Apr 2023 09:22:57 +0200
Message-ID: <CAL7ro1EYZXUQM+Ygp3aO8-rWD0ULZyaJH4rN_+88LNS4h5p78w@mail.gmail.com>
Subject: Re: [PATCH 5/6] ovl: Validate verity xattr when resolving lowerdata
To: Eric Biggers <ebiggers@kernel.org>
Cc: miklos@szeredi.hu, linux-unionfs@vger.kernel.org, amir73il@gmail.com, 
	tytso@mit.edu, fsverity@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 26, 2023 at 11:47=E2=80=AFPM Eric Biggers <ebiggers@kernel.org>=
 wrote:
>
> On Thu, Apr 20, 2023 at 09:44:04AM +0200, Alexander Larsson wrote:
> > +     err =3D fsverity_get_digest(d_inode(datapath->dentry), actual_dig=
est, &verity_algo);
> > +     if (err < 0) {
> > +             pr_warn_ratelimited("lower file '%pd' has no fs-verity di=
gest\n", datapath->dentry);
> > +             return -EIO;
> > +     }
> > +
> > +     if (digest_len !=3D hash_digest_size[verity_algo] ||
> > +         memcmp(required_digest, actual_digest, digest_len) !=3D 0) {
> > +             pr_warn_ratelimited("lower file '%pd' has the wrong fs-ve=
rity digest\n",
> > +                                 datapath->dentry);
> > +             return -EIO;
> > +     }
> > +
> > +     return 0;
>
> This is incorrect because the digest algorithm is not being compared.

This is actually an interesting question. How much are things weakened
by comparing the digest size, but not comparing the digest type. Like,
suppose the xattr has a sha256 digest (32 bytes), how likely is there
to be another new supported verity algorithm of the same digest size
where you can force it to produce matching digests?

I ask because ideally we want to minimize the size of the xattrs,
since they are stored for each file, and not having to specify the
type for each saves space. Currently the only two supported algorithms
(sha256 and sha512) are different sizes, so we essentially compare
type by comparing the size.

I see three options here:
1) Only compare digest + size (like now)
2) Assume size 32 means sha256, and 64 means sha512 and validate that
3) Use more space in the xattr to store an algorithm type

Maybe alternative 2 is the best option on balance, less extensible,
but safe and uses least space.
Opinions?

--=20
=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D
 Alexander Larsson                                Red Hat, Inc
       alexl@redhat.com         alexander.larsson@gmail.com

