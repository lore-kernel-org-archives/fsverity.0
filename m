Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C54A47F
	for <fsverity@lists.linux.dev>; Wed, 14 Jun 2023 07:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686727187;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/pCHUjyR9Iz29Lv6cKyWgShfYL2WKapdtIdczZk9ZcU=;
	b=D6GWRnVUrenCW+L94vkeqU67X1QE4s2BuSUdqcpd+4SyazAJf9nPzkhNp0OpgN1dotvuAt
	WBlc1PSQiuFfTzubcwruxVhaLx5hdP1R6xNPlamkgxvjzI3W2VP19doXpTdSZRKm5/uZi/
	st6EZMEyiWK8VXwzaOTL7562aPn0jFw=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-377-kcohYyl9NyeH0tB3rQrKRg-1; Wed, 14 Jun 2023 03:19:46 -0400
X-MC-Unique: kcohYyl9NyeH0tB3rQrKRg-1
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-34075d837abso10606635ab.1
        for <fsverity@lists.linux.dev>; Wed, 14 Jun 2023 00:19:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686727185; x=1689319185;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/pCHUjyR9Iz29Lv6cKyWgShfYL2WKapdtIdczZk9ZcU=;
        b=R0hDm+hlHHz9xEBzUob1wKiMqNTuVZ3S8LA7e55Dlo5evkq9r6Hfm//CRQjRa3tkF6
         eby69pLClA1AU3hvKiHmaoBA7+hZ0JjAqXZgteoNx1Uq/xV1YB5HPz0S7yJr//pDMD77
         sA/ADjt1uqEFH1BGnWVRzZpdmA/ckDSpc+1zoYBs+P/DitFFLN4FHcW2jRhKyTRIAZwT
         PvAbb4IPBsXuHwzz4aTdQvtgimzw7Bcenym31O437BcMR/SSq5JVGeyHEh/cktko6uUl
         pHuyO8ujIEZhv/S0rAzk5DIqTL/dKku6o3F2y9Kkgy+/TnyBqA9hoAw7ddYJOTN/tr6s
         7J+Q==
X-Gm-Message-State: AC+VfDxCJhejxBVx/Offlp3SOTfH/U9HI/LKKcHPuWFyvKjkT0cd3yIj
	gUUoaK0spuamh1AH4uoklvDLS2uZ450EoCdY7lL17JEHXG8PUtumNlQjWntgZLwemhbj39pKI8F
	HGvpZAJVsMUddvTpWqcS6a2WvOygB/u3ylPo=
X-Received: by 2002:a05:6e02:60b:b0:33e:325a:cc0d with SMTP id t11-20020a056e02060b00b0033e325acc0dmr820463ils.2.1686727185453;
        Wed, 14 Jun 2023 00:19:45 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6NvcK9EjuJTD90FDBzgLJXunqZKTfxqE9fL1zhDpVNZQcYTV1jLq4gBp10xsVhSHP4LjUt1ILT5e2UFwZC3wY=
X-Received: by 2002:a05:6e02:60b:b0:33e:325a:cc0d with SMTP id
 t11-20020a056e02060b00b0033e325acc0dmr820453ils.2.1686727185262; Wed, 14 Jun
 2023 00:19:45 -0700 (PDT)
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
From: Alexander Larsson <alexl@redhat.com>
Date: Wed, 14 Jun 2023 09:19:34 +0200
Message-ID: <CAL7ro1EA6kzojYuwXAkLvQNNGQ=bx2UmQmg_jaCD3omEPekAbA@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] ovl: Validate verity xattr when resolving lowerdata
To: Eric Biggers <ebiggers@kernel.org>
Cc: miklos@szeredi.hu, linux-unionfs@vger.kernel.org, amir73il@gmail.com, 
	tytso@mit.edu, fsverity@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 14, 2023 at 5:28=E2=80=AFAM Eric Biggers <ebiggers@kernel.org> =
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

Honestly, I have no idea about the timescale here. That is all up to
miklos really. Maybe best to do as amir say and take it through your
tree but on from a branch that milklos can merge into overlafs-next if
he wants to take it this cycle.

--=20
=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D
 Alexander Larsson                                Red Hat, Inc
       alexl@redhat.com         alexander.larsson@gmail.com

