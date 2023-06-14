Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1BFE138E
	for <fsverity@lists.linux.dev>; Wed, 14 Jun 2023 05:39:19 +0000 (UTC)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-4301281573aso720583137.3
        for <fsverity@lists.linux.dev>; Tue, 13 Jun 2023 22:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686721158; x=1689313158;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0JOto0oV1KbYIXydS1unCesgaw4Xm/o4kcrhMQN7gU0=;
        b=FH9C+T6Bxk5czO7c6yApIJmidspEcPdBq2vduJ8rT+Z2Cb8S+ysQf7kPmhTBZCn7G8
         Sp35Kd69u6QIEzk/Vt3+PtJubNfPwijGELlYLW0Vnf2KpllPcq1PvkiLX1tLynpIscIH
         c+jHoYVmlTqNebRQZvLcMCwiDoK70Cx0CH6G4AryEHPZ4c8LJOp76AMOjJRL/cpY+cCS
         KrS+/l0pyMM5LjQTPevAoPBA3SY9Tg1cGfrXdPTa9OXKC1A7NZeoDq5Qv1A/E1BLAWk5
         TL5Ctg8vOwhwj1lNfbBbMeG8MIB8zfU37RjSuh6aXojxlFxN3WsC94V4JZyz9EbuEO8z
         FZhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686721158; x=1689313158;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0JOto0oV1KbYIXydS1unCesgaw4Xm/o4kcrhMQN7gU0=;
        b=iAtdd9LPHA2DmNtoz1nK/wxe3hfdMs+a6Ggf1PCWF2KYxBZwDlP+vDBMjf5qPs7Xtp
         lLGjVJ2B7+9UfEYGriLEpLFpjE7FCUqlkd3FLSM3HZqZ3r/rczjWOBN+9IS78Osyo6ue
         XYQGCG7S7D8cui+qzUqkTDFicL4rrwgskkYOf5ybnecRKPV4LO5WDdyo1CktcMR/py1E
         RTkDkVFil9ENRvU/2OvZIhXNeTFtOT5iZGTZ49paderKQiP9xDAi2ZCxzL+kATO80F86
         3diLL43pSvYQXNork7zBdmMZEsPI1he76MeGim+nZu6F/HVsZKvQ+MZ/WJ7tBJfyxQq2
         aOgA==
X-Gm-Message-State: AC+VfDxBhe20IrHuLZ4wrL+Ikhqkn90dHVVpccCJoJBcpkndgpp79kKR
	bt5INo3SPzGWFW+agpHxTQy50vp4LaBrsw/Rpxs=
X-Google-Smtp-Source: ACHHUZ6hzlkxJm8Et0uYbPgVEPBVMhFmphOWG9zzSZGc3yT/qQ7Jbwz2JdG9qP1msNbAt+Vlz+AWMr967nzli0af6VU=
X-Received: by 2002:a67:f705:0:b0:439:31ec:8602 with SMTP id
 m5-20020a67f705000000b0043931ec8602mr5131231vso.27.1686721158556; Tue, 13 Jun
 2023 22:39:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1686565330.git.alexl@redhat.com> <dd294a44e8f401e6b5140029d8355f88748cd8fd.1686565330.git.alexl@redhat.com>
 <20230612190944.GB847@sol.localdomain> <CAL7ro1Feep_aQimxEJzKk+4cv6-UNgco3VNDKZrrC3y2u04DCw@mail.gmail.com>
 <20230613175759.GA1139@sol.localdomain> <20230614032813.GA1146@sol.localdomain>
In-Reply-To: <20230614032813.GA1146@sol.localdomain>
From: Amir Goldstein <amir73il@gmail.com>
Date: Wed, 14 Jun 2023 08:39:07 +0300
Message-ID: <CAOQ4uxh2jS=MsM-xs_fgFkBzN40ypADizw9tvsdizrXuVOXtVQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] ovl: Validate verity xattr when resolving lowerdata
To: Eric Biggers <ebiggers@kernel.org>
Cc: Alexander Larsson <alexl@redhat.com>, miklos@szeredi.hu, linux-unionfs@vger.kernel.org, 
	tytso@mit.edu, fsverity@lists.linux.dev, Mimi Zohar <zohar@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 14, 2023 at 6:28=E2=80=AFAM Eric Biggers <ebiggers@kernel.org> =
wrote:
>
> On Tue, Jun 13, 2023 at 10:57:59AM -0700, Eric Biggers wrote:
> > On Tue, Jun 13, 2023 at 01:41:34PM +0200, Alexander Larsson wrote:
> > > > Can you consider
> > > > https://lore.kernel.org/r/20230612190047.59755-1-ebiggers@kernel.or=
g which would
> > > > make fsverity_get_digest() support both types of IDs?  Then you can=
 use
> > > > FS_VERITY_HASH_ALG_*, which I think would make things slightly easi=
er for you.
> > >
> > > Sounds very good to me. I'll rebase the patchset on top of it. Not
> > > sure how to best land this though, are you ok with this landing via
> > > overlayfs-next?
> >
> > If you're confident that this series will land in v6.4, then sure, you =
can apply
> > my patch "fsverity: rework fsverity_get_digest() again" to overlayfs-ne=
xt,
> > instead of me taking it through fsverity/for-next.  (Hopefully the IMA
> > maintainer will ack it as well, as it touches security/integrity/.)

Mimi,

Can you please take a look:

https://lore.kernel.org/linux-integrity/20230612190047.59755-1-ebiggers@ker=
nel.org/

> >
> > Just be careful about being overly-optimistic about features landing in=
 the next
> > release.  I've had experience with cases like this before, where I didn=
't apply
> > something for a reason like this, but then the series didn't make it in=
 right
> > away so it was worse than me just taking the patch in the first place.
> >
> > I do see that the other prerequisites were just applied to overlayfs-ne=
xt, so
> > maybe this is good to go now.  It's up to the other overlayfs folks.
>
> I meant to say 6.5, not 6.4.
>
> Anyway, just let me know if I should apply it or not, before it gets too =
late.

If you want to make sure that your patch lands in 6.5, you'd better take
it through your tree.

If you provide a stable branch with the patch, Miklos will be able to merge
your branch if he wishes to take Alex's patches for 6.5.

Thanks,
Amir.
