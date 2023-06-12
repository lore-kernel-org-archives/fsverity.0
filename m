Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6ED61B8E6
	for <fsverity@lists.linux.dev>; Mon, 12 Jun 2023 14:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686581647;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pIq65nhbapIlNGOmTQ9RE9QAfyaHMJANHZt0h3eD1Sw=;
	b=QY0zvzRyptGjitCHMOEMutpn5wSFOGsLgbY/oTvTgd+bVh9dVkr1LR+7V7TTZ//K/X9VOU
	6RtiXO9D0vBGRyY/Wcffxge/y1ypyctPx5eUnSsGkmYe2uVszfMhfq+k4xd8Oi2GBus+gt
	KbT/YqhXFvlMrQmifvEPguvMDG8jqog=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-265-gZrooFSuPQ6ichw6yFGhhQ-1; Mon, 12 Jun 2023 10:54:06 -0400
X-MC-Unique: gZrooFSuPQ6ichw6yFGhhQ-1
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-777a93b3277so448211239f.3
        for <fsverity@lists.linux.dev>; Mon, 12 Jun 2023 07:54:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686581645; x=1689173645;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pIq65nhbapIlNGOmTQ9RE9QAfyaHMJANHZt0h3eD1Sw=;
        b=idEO5stQ0tRIzcGNsOG0yKuzvD2OUirKDDKME2Hf8FgFexojWXS0YNLbcnQqtJb6pd
         htBAkVRwtQRQXsniZ31kaAjVS/HjrCwSw/w6tMwbVB3D3XHd2yK9wpBUHD/dLeP/qGZY
         g/JdVp7TjWElFQR/0VH/kdpWkaquMmEfF8olOU46jLYaQ1bgcVFJSxzGRfY42bfctoxg
         I9TilPIqWOaOwVsGwQAX+jwddMaT6236oGfSwL8hh+KlMuF+j93RA69PdbpOeQMqrprU
         mvIUzakxlHB+WUXtZdFfwZmbYopQQG+5JLQF5dnqT2oCxjtCJwpGKaTsbbCcEfSPiGRU
         lYZQ==
X-Gm-Message-State: AC+VfDxJgq/2QhKSwHiuElkRR8KAaFzPxdkmaLlOLX4zbodVXOyiI47G
	uxiUxrmzbfthtrIDuXDOL/unQWnRdHWNGtQIRQeUV8+IYeM7RPqRGdYoC/RVo5YD739wKFRyrjG
	STDTS4axHuFNx3/mMo8sxipp1aALv0o8uGAQ=
X-Received: by 2002:a92:dac5:0:b0:335:fc8:9b4 with SMTP id o5-20020a92dac5000000b003350fc809b4mr7760624ilq.19.1686581645534;
        Mon, 12 Jun 2023 07:54:05 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7/JtVsEvI5+bRqZI+OFWwwEpS5GPhyl9aMhmgJ12/OJ7wPGuWZlkJh0gdz2ngmVOk/PFY19NmDBBTQMzlC1A0=
X-Received: by 2002:a92:dac5:0:b0:335:fc8:9b4 with SMTP id o5-20020a92dac5000000b003350fc809b4mr7760618ilq.19.1686581645321;
 Mon, 12 Jun 2023 07:54:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1686565330.git.alexl@redhat.com> <CAOQ4uxgmV1KKCeq8=8FPkAciwqPpz8JiSM8WEuxDaZbVuYcQ7Q@mail.gmail.com>
 <CAL7ro1EiYOOOqexrKy+UXRzmpGyCaNec3+LHGxnA0YfmoMDN3A@mail.gmail.com>
In-Reply-To: <CAL7ro1EiYOOOqexrKy+UXRzmpGyCaNec3+LHGxnA0YfmoMDN3A@mail.gmail.com>
From: Alexander Larsson <alexl@redhat.com>
Date: Mon, 12 Jun 2023 16:53:54 +0200
Message-ID: <CAL7ro1FKwgUY4e7N_vYi0cFsuVx6St0-oKvcBkiRFnzLH8D1eQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] ovl: Add support for fs-verity checking of lowerdata
To: Amir Goldstein <amir73il@gmail.com>
Cc: miklos@szeredi.hu, linux-unionfs@vger.kernel.org, ebiggers@kernel.org, 
	tytso@mit.edu, fsverity@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 12, 2023 at 1:09=E2=80=AFPM Alexander Larsson <alexl@redhat.com=
> wrote:
>
> On Mon, Jun 12, 2023 at 12:54=E2=80=AFPM Amir Goldstein <amir73il@gmail.c=
om> wrote:
> >
> > On Mon, Jun 12, 2023 at 1:27=E2=80=AFPM Alexander Larsson <alexl@redhat=
.com> wrote:
> > >
> > > This patchset adds support for using fs-verity to validate lowerdata
> > > files by specifying an overlay.verity xattr on the metacopy
> > > files.
> > >
> > > This is primarily motivated by the Composefs usecase, where there wil=
l
> > > be a read-only EROFS layer that contains redirect into a base data
> > > layer which has fs-verity enabled on all files. However, it is also
> > > useful in general if you want to ensure that the lowerdata files
> > > matches the expected content over time.
> > >
> > > I have also added some tests for this feature to xfstests[1].
> >
> > I can't remember if there is a good reason why your test does
> > not include verify in a data-only layer.
> >
> > I think this test coverage needs to be added.
>
> Yeah. I'll add that.

Updated the git branch with some lowerdata tests.

=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D
 Alexander Larsson                                Red Hat, Inc
       alexl@redhat.com         alexander.larsson@gmail.com

