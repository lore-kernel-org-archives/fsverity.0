Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4139523D7
	for <fsverity@lists.linux.dev>; Wed,  5 Jul 2023 09:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688548165;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eiFA7P4RMGjmdgMoHl/w6ySnit/pa7gC/N0C4ZnDvgU=;
	b=CaRJ2LGfkiW7v5cUGRt5YMUrBFbO5I03Zd2LfB3Uv9MBgtEQqCA42jd2kfikcPst5rhL+Q
	lVKAUCleI2437fwB0IPKC69QlvVpUzHh/LqWntlw1ys3oC6S8DosJyV3VGzuOB34rhFlD+
	5SF+2jO6vYho4Dz/NepeKnap8DkakDM=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-453-carOlynuMjOAd7lw4lkoxg-1; Wed, 05 Jul 2023 05:09:24 -0400
X-MC-Unique: carOlynuMjOAd7lw4lkoxg-1
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-34603502e5aso23139055ab.1
        for <fsverity@lists.linux.dev>; Wed, 05 Jul 2023 02:09:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688548163; x=1691140163;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eiFA7P4RMGjmdgMoHl/w6ySnit/pa7gC/N0C4ZnDvgU=;
        b=hxWpUXc1R33xy5tYdLddR2/Okc0E6jw56W2gq/VYUjIKxmzZgiO6lV4uOYdqbGYbyo
         wPnd6kMkC1URbexIiIvFFDHQ7gDv1PeZdWmboe5PI52qKnTOb4D9X41OBjKzmWmVMeYQ
         c/M5TR3rIMpi5Wr5ZR/rfDYnC/ehbqMEJqIzWbNePRtlvvWezPH8D8rmsWxquqHNC4cy
         JMZBF62yUPxgdOdnALBT9fsZE+g9J3zL1y1IlW3zVWCx66ylRZNvC971LmKWtZbE7jHQ
         7JuzrQu1SQxIyn4M6xh9uMOaVg/1+zmFMLuwEQsRYZSzLOPN7/jTAI5b4iqsMPAU7DJa
         UytQ==
X-Gm-Message-State: ABy/qLbqSYWO9TEiCtoAWUCbJGXmG+QYDVzNTuFv4sXSpLtmdviKNH7x
	LlG3QEu4jbOz21leAuqa5haBnV/MmLfLE9Z/1B+7gULhxdqJWguR+wSPOg2BjQi6SYf+9CiPd3q
	4ijaOsPw43suHuz0Bopz1i+dDkzWSHFA5kFs=
X-Received: by 2002:a92:d710:0:b0:345:d326:9c7f with SMTP id m16-20020a92d710000000b00345d3269c7fmr14785014iln.29.1688548163730;
        Wed, 05 Jul 2023 02:09:23 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFkB4taqnhwZxeT8jJevExkCOnqfRT3EZ4R2Os2oQzvRu1q95PSSlutxrDmjLNuM/DNP6JZcVhVfJBvfLH//uM=
X-Received: by 2002:a92:d710:0:b0:345:d326:9c7f with SMTP id
 m16-20020a92d710000000b00345d3269c7fmr14785009iln.29.1688548163584; Wed, 05
 Jul 2023 02:09:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1687345663.git.alexl@redhat.com> <5dfdecee8f0260729c4a8e8150587f128a731ccb.1687345663.git.alexl@redhat.com>
 <20230703192434.GD1194@sol.localdomain>
In-Reply-To: <20230703192434.GD1194@sol.localdomain>
From: Alexander Larsson <alexl@redhat.com>
Date: Wed, 5 Jul 2023 11:09:12 +0200
Message-ID: <CAL7ro1FH33+bBbBM4bOdR75AZ4XjkezSfThHJ2Czb_GMTxw9MQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] ovl: Validate verity xattr when resolving lowerdata
To: Eric Biggers <ebiggers@kernel.org>
Cc: miklos@szeredi.hu, linux-unionfs@vger.kernel.org, amir73il@gmail.com, 
	tytso@mit.edu, fsverity@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 3, 2023 at 9:24=E2=80=AFPM Eric Biggers <ebiggers@kernel.org> w=
rote:
>
> On Wed, Jun 21, 2023 at 01:18:27PM +0200, Alexander Larsson wrote:
> > +static int ovl_ensure_verity_loaded(struct path *datapath)
> > +{
> > +     struct inode *inode =3D d_inode(datapath->dentry);
> > +     const struct fsverity_info *vi;
> > +     struct file *filp;
> > +
> > +     vi =3D fsverity_get_info(inode);
> > +     if (vi =3D=3D NULL && IS_VERITY(inode)) {
>
> Can you please use '!fsverity_active(inode)' instead of
> 'fsverity_get_info(inode) =3D=3D NULL'?  The result is exactly the same, =
but
> fsverity_active() is the intended "API" for code outside fs/verity/.
> fsverity_get_info() is in the header only because fsverity_active() calls=
 it.

Changed this in git:
https://github.com/alexlarsson/linux/tree/overlay-verity

--=20
=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D
 Alexander Larsson                                Red Hat, Inc
       alexl@redhat.com         alexander.larsson@gmail.com

