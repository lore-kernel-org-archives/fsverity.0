Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F1B6117
	for <fsverity@lists.linux.dev>; Fri, 16 Jun 2023 11:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686915237;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hEgKL1iebVJmojI3Coxf5F0QBaEfl/n51D56oDQWgxM=;
	b=dAYr4xmSRnfpTmIbpBJcF6CKYrskpqtvQubTpFlcYNHYEOzxzMJ5x94MK8WqwS0+zyeri6
	tSumeYK3ao/u++lib/g//H4kWcpO8KI655BQsfruppQgRuQ9w8L8BXsqBsTzwFaOqX4JtH
	jFd1KGkRf+Fc/Bcx/mFDAOvMVQFJnMA=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-367-rvx9hKmAMnSLNxWlIWLUOA-1; Fri, 16 Jun 2023 07:33:56 -0400
X-MC-Unique: rvx9hKmAMnSLNxWlIWLUOA-1
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-77a1f4e92cdso124047639f.1
        for <fsverity@lists.linux.dev>; Fri, 16 Jun 2023 04:33:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686915236; x=1689507236;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hEgKL1iebVJmojI3Coxf5F0QBaEfl/n51D56oDQWgxM=;
        b=Mh8LXU0JEBKgbje0LSYX7xyRLztbxlnYKf1J9uxiG+ZVKTq+spmxiqr2Y3ibfOnVtG
         nYg0dGXdiYa8y3oUb3Fv4o0Jq5M1ni0vTuOyLmTlKjzyaKuNaJn96q1qdNIYfa0hNQm4
         RFOt1nq1107dSslwvq5EfZGU3cPUfXWwlGLwO+SHf3kysrs1fksyMhV1H7VLzmWokULH
         BCEyPsyXdY/4iTXebOsWA4gMVsGk0N9lFU+xmSDxXdP5obffeG3szBtKeZ0NnGicGpzQ
         7kWvQbWaOiw3Unan/5EBTKdvT1OiiP7ULYv5HNR1CdHuexHweCBvQNSnlZDojAedfcSU
         5Gfg==
X-Gm-Message-State: AC+VfDyeeEgV9QbGS1mpRVJvrK7IsL/wTa5lvJ0UNh5A1LS5fGVQC9ej
	l9geytHH7PiTaxRWVqJ/x2aUjvYDp99LCInHPBEoUN5IUpu8127Q5q/YZQy8Ao2lNlNgV3Yoa8z
	4YOBLsT7AQwEJQXxcq4vhjwgxisx26HHIlQc=
X-Received: by 2002:a92:d492:0:b0:340:b8a8:cf68 with SMTP id p18-20020a92d492000000b00340b8a8cf68mr1555726ilg.11.1686915235811;
        Fri, 16 Jun 2023 04:33:55 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ64AwDeERNhb8s+3/+4p9FrmoCu0sBtfoEpnmFy2EiVeb+5ao82tb5fwHGXrp6fNmemSmYMc8vyBLfdI3yGpME=
X-Received: by 2002:a92:d492:0:b0:340:b8a8:cf68 with SMTP id
 p18-20020a92d492000000b00340b8a8cf68mr1555723ilg.11.1686915235626; Fri, 16
 Jun 2023 04:33:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1683102959.git.alexl@redhat.com> <b58e57955e122b5d6c4e087cf2dd6ed664152c7b.1683102959.git.alexl@redhat.com>
 <20230514191647.GD9528@sol.localdomain> <CAOQ4uxhEq8u37YNnqQmLbybJy1Kkg3Qk0TVtRZQP-yHt8CMmWA@mail.gmail.com>
 <CAL7ro1Hqc29w-FuRuoEfcsxiXTnqqwHP73nwvmZRuKVRsz4D9w@mail.gmail.com>
 <CAOQ4uxh_y+YO3q7dB=ALCriq31RhapOHGt+jcXTQbOC7iVqYTw@mail.gmail.com>
 <CAL7ro1GTzJy5Nv1vH0buVEXUnUk7cXBhSJB2ap8Jt_hutk7nYw@mail.gmail.com>
 <CAOQ4uxgbMD2RdEqta7a2t3uVceLuZDxOWA9SBNDAgZSdO_532Q@mail.gmail.com>
 <CAL7ro1FF_q7FEJdevWrqvugkJ9S8bU5MxcoHHrLC3D834u4+zQ@mail.gmail.com>
 <CAOQ4uxgo9LOM3minBH0vw3huxjrHmO5O-caGfhgOUGCuT0B9Vg@mail.gmail.com>
 <20230616052444.GA181948@sol.localdomain> <CAOQ4uxjBfPvDb5921vV+jO1wtgoeWenEietmK6orP7Bh+gROqw@mail.gmail.com>
 <CAL7ro1FSPYL=P+h_qUXw=NHzPx89vR24dbZc8UOtVeYMqg5xrw@mail.gmail.com>
 <CAOQ4uxjSLwx3NsrXJAir5DLjY-Xo5e7Qs5NjK1gFygsbTO3E-g@mail.gmail.com>
 <CAL7ro1EYAPZYcqAiiR7r6HX2kp4XiWby0OBCEjYodNjP4VD18A@mail.gmail.com> <CAOQ4uxig=DHThgTr97ga4oGmoGshxa5f+or9gbjxXZ=qTDHHgg@mail.gmail.com>
In-Reply-To: <CAOQ4uxig=DHThgTr97ga4oGmoGshxa5f+or9gbjxXZ=qTDHHgg@mail.gmail.com>
From: Alexander Larsson <alexl@redhat.com>
Date: Fri, 16 Jun 2023 13:33:44 +0200
Message-ID: <CAL7ro1FUPQnwiN43jRZWAgdczPgYKj2H6Scx081gS-V+sC7cqA@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] ovl: Validate verity xattr when resolving lowerdata
To: Amir Goldstein <amir73il@gmail.com>
Cc: Eric Biggers <ebiggers@kernel.org>, miklos@szeredi.hu, linux-unionfs@vger.kernel.org, 
	tytso@mit.edu, fsverity@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 16, 2023 at 11:28=E2=80=AFAM Amir Goldstein <amir73il@gmail.com=
> wrote:
>
> On Fri, Jun 16, 2023 at 11:39=E2=80=AFAM Alexander Larsson <alexl@redhat.=
com> wrote:
> >
> > On Fri, Jun 16, 2023 at 10:12=E2=80=AFAM Amir Goldstein <amir73il@gmail=
.com> wrote:
> > >
> > >
> > > > I don't believe this format will actually need to change much.
> > > > However, I do agree
> > > > with the general requirement for *some* ability to move forward wit=
h
> > > > this format,
> > > > so I'm gonna go with a single version byte.
> > > >
> > >
> > > I disagree.
> > > If you present a real life use case why that really matters
> > > then I can reconsider.
> >
> > I disagree, but I'll add them.
> >
>
> Let's ask for a 3rd opinion.
> don't add them for now, unless Miklos says that you should.

I added them to the branch anyway for now. However, if we're going
full header + flags anyway, I wonder if we really need the
"overlay.digest" xattr at all? We could just put the header + optional
digest in the "overlay.metacopy" xattr, and then just read/store one
xattr. Right now metacopy is zero size, but adding some data to it
would not break ovl_check_metacopy_xattr() in older kernels.

Basically, during the lookup we get the metacopy xattr anyway, and
when we do we could record in a flag that there is a digest in it,
then during open we don't have to look for a separate digest xattr,
just re-load the metacopy xattr if the flag is set. With this in place
we can also easily add other flags to overlay.metacopy, which imho
makes a ton more sense than adding flags to overlay.digest.

I'll have a look at this.

--=20
=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D
 Alexander Larsson                                Red Hat, Inc
       alexl@redhat.com         alexander.larsson@gmail.com

