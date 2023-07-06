Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A54B8184F
	for <fsverity@lists.linux.dev>; Thu,  6 Jul 2023 07:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688629866;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2kVVtIZSoE8S9z1B4caCrql+YqVtIvzxCPgrjGJ9FzM=;
	b=M/KhcobUSVotCWD4mHzH2cI8IhLq0+REX7E/XDBANokSFLXcVn/YX5kKsJtJ3L3r0HUbFu
	KXI3QHWZrHFKLfZg859z8Fmr6cgenYPaCCSvhbUr3Gm0FHJVfwp3qVY8JAPjOQUTFxcOiM
	RxV1UDCCmOHe12wPPJUi3qOhwxLsPoA=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-582-HxAMxg9NPrmZBUxJK_YMpw-1; Thu, 06 Jul 2023 03:51:03 -0400
X-MC-Unique: HxAMxg9NPrmZBUxJK_YMpw-1
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-345b208ddafso1646865ab.2
        for <fsverity@lists.linux.dev>; Thu, 06 Jul 2023 00:51:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688629862; x=1691221862;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2kVVtIZSoE8S9z1B4caCrql+YqVtIvzxCPgrjGJ9FzM=;
        b=NiXZfIPDgX/Nh33I4Zgc2GuzxbMXFC7Am9o5kLGFEV9uzwFKwWP8hWpVICMuoAn0xX
         bGNGIb+Ire0oXjusnFOjFFCd8bCaYLf63832GYrPHW3fzX2t03qGAhPVKWVfmg+FO+0C
         JH/G4ssATeUO4ahYkzOs6GLvMxm9naWrK2RNAOMGJ55XpCUTiYeTM4+VOpSnnB4fr0NV
         qWegYKtYDa+P1QUo+hYJ+CKkcjl2IO4pKnrLktPoQP3o4Gbs0/P1W2cE0B5b0VguiyLZ
         bd75WgQrADpOQNOnOEc9W9N+qDkVq1whOEShFIyFLNighpdh3S4dVCTzQJ9aSbOE02Y3
         3MpQ==
X-Gm-Message-State: ABy/qLZ3pdjBaqsl4GyevIBQ3IuOU5cgMDHSo51Dy7e1+6YIm9ZCgaJK
	HcHqCnn8imHoITZqNZ77iedd4gl+oQFkdnf9iEzjNUEA99C2hr32xR7wM0rRo6rgGX+Iq0E5Mr/
	VgZh/+y9Sz0WMwHcxXI+6e+zVRUpMtQ5wctc=
X-Received: by 2002:a92:c841:0:b0:346:d51:9922 with SMTP id b1-20020a92c841000000b003460d519922mr1455435ilq.13.1688629862424;
        Thu, 06 Jul 2023 00:51:02 -0700 (PDT)
X-Google-Smtp-Source: APBJJlG7a0GhK3+Saee/CYGqC2wgFg3RwMjVJuW61vfPauNuP+k8RbTpRIBwqBpzenz0FE1yw3OZdau6SJbewpgWgJ4=
X-Received: by 2002:a92:c841:0:b0:346:d51:9922 with SMTP id
 b1-20020a92c841000000b003460d519922mr1455429ilq.13.1688629862197; Thu, 06 Jul
 2023 00:51:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1686565330.git.alexl@redhat.com> <CAOQ4uxgmV1KKCeq8=8FPkAciwqPpz8JiSM8WEuxDaZbVuYcQ7Q@mail.gmail.com>
 <CAL7ro1EiYOOOqexrKy+UXRzmpGyCaNec3+LHGxnA0YfmoMDN3A@mail.gmail.com>
 <CAL7ro1FKwgUY4e7N_vYi0cFsuVx6St0-oKvcBkiRFnzLH8D1eQ@mail.gmail.com>
 <CAOQ4uxgVnv7wtwFZaBnEotFCwQD1EZcSK2KW4K4vRD8d9fzCiw@mail.gmail.com>
 <CAL7ro1FY6OmhypFGDjinOkkjyJzymntVje4nRA558dKY+KsgzQ@mail.gmail.com>
 <CAOQ4uxjuhzxgTxmRXxczJLDrMzKKr-jzS3R8ESwkw4XQ+UyAfQ@mail.gmail.com>
 <CAL7ro1GYEdMvjn+e8Y8CmMC-s_5NZOXjsj=iv7s5NbnpTZz+Cg@mail.gmail.com>
 <CAOQ4uxjS9mTjCCTS9eS1HmZqKAQV97mh1wpkqJuShCHP_MKqag@mail.gmail.com>
 <CAOQ4uxjNMJG6TQcZiT2sx8eLTyybf+iLR3GtOKaaj7QydVr_0Q@mail.gmail.com>
 <CAL7ro1GhLcPK-xahOVmJAtL5pbgMVm0GVd2xW7tgO+_R4dbD5Q@mail.gmail.com> <CAOQ4uxhiU-y=dMocoSGb75Rze_jOLp82MctB26yFYPT3CMOM3g@mail.gmail.com>
In-Reply-To: <CAOQ4uxhiU-y=dMocoSGb75Rze_jOLp82MctB26yFYPT3CMOM3g@mail.gmail.com>
From: Alexander Larsson <alexl@redhat.com>
Date: Thu, 6 Jul 2023 09:50:50 +0200
Message-ID: <CAL7ro1HzspAnCMX-EK3gzaggPqTCEREv1qzeQSTuNhGyM8ESaQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] ovl: Add support for fs-verity checking of lowerdata
To: Amir Goldstein <amir73il@gmail.com>
Cc: ebiggers@kernel.org, tytso@mit.edu, miklos@szeredi.hu, 
	linux-unionfs@vger.kernel.org, fsverity@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 6, 2023 at 9:10=E2=80=AFAM Amir Goldstein <amir73il@gmail.com> =
wrote:
>
> On Mon, Jul 3, 2023 at 11:11=E2=80=AFAM Alexander Larsson <alexl@redhat.c=
om> wrote:
> >
> > Cool, I wanted to look at this, but was on PTO last week.
> > It looks good to me, and I synced this to:
> >   https://github.com/alexlarsson/xfstests/commits/verity-tests
> > To avoid drift.
> >
>
> I pushed the overlay-verity series to overlayfs-next, so you may
> expect "finishing touches" bug reports from bots in the near future.
> As long as they are minor fixes, you can fix your branch and let me know
> and I will update overlayfs-next.
>
> Miklos may yet have feedback on the final version, but I think all his
> comments were addressed including the ACK from Eric (thanks!).

Nice!

> Eric,
>
> There was no posting of v5 that addressed your v4 review comments,
> so we do not have your RVB/ACK for patches 2-4.
> Let me know if you want me to add that to the patches.
>
> Alex,
>
> wrt overlay verity-tests, please submit those tests along with the lowerd=
ata
> tests to fstests anytime between now and the 6.6 merge window.
> The tests are properly equipped to check for the feature and testers can
> use them to test linux-next.

I'll have a look at this soon.

> For test overlay/080 you may add:
> Reviewed-by: Amir Goldstein <amir73il@gmail.com>
> For test overlay/079 you may retain my authorship or assume authorship
> I don't mind as it was co-authored and you took it to the finish line.
>
> Thanks,
> Amir.
>


--=20
=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D
 Alexander Larsson                                Red Hat, Inc
       alexl@redhat.com         alexander.larsson@gmail.com

