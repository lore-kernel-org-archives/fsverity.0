Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FB297F
	for <fsverity@lists.linux.dev>; Wed, 14 Jun 2023 07:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686726913;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uJIs/hs3NIZh37+QvWYEbF0szH9F4CbUfRoYwtu+xK0=;
	b=XZ8UR9jAm3JtuDycBXaVqD57n5Q9g/kVK82yFwEnCEJnkOYj2GKYaWdR77uuc6bqLVMm1u
	cqIYWZhG59HmiYYAGSGHnkrwfTUFsVemwDhulbFn6C9UkoB5y9l0oiMPl8Cqb/XR37eJre
	ogfQhzJ7j+TAN2sXuU3FIyoFoXGfQfU=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-115-TEvgbLnGN9ah5xTWlTp6XA-1; Wed, 14 Jun 2023 03:15:12 -0400
X-MC-Unique: TEvgbLnGN9ah5xTWlTp6XA-1
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-34055a08934so22161475ab.1
        for <fsverity@lists.linux.dev>; Wed, 14 Jun 2023 00:15:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686726912; x=1689318912;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uJIs/hs3NIZh37+QvWYEbF0szH9F4CbUfRoYwtu+xK0=;
        b=OfbE2j8pS77C05ui07s84ArqdRhiOmLhYG0SN+MlEDcseHdsnIEGjxbxjnrk8AR3uy
         jVF1MlgF9mHC6I2aUvRjg0Bnor4NI4qdvhAgGDcvUOAwlK8Va8cIKhOXx4udac+H0jkF
         o8IwCpUGAOfGBH2y+wpxWVu8tHKLK31ewfRnDEvOYsBoKWvgJHwcuMeTV1HL97Uj/BJA
         zr5qPl53OhN2dlJ10pzJMPdx5q79gnH/zUyxe7kKENMHuJnyKpa+ZBnLlNzNk4gxAN26
         t/iQbaZvSK4vdbSnUrojnEwpfNl7izFmCYzIat78irOJ2/3tsJXb+JP8pHPRp4sMxfH2
         PGTw==
X-Gm-Message-State: AC+VfDxuxBJYpRKHdB4lSnwm4FCb9m6Ib5kdia1HQqXuMCgkr5zPO6ej
	nLhbvTdd+ZfpCSKTOu81mRZR9x0xsT2dDcQ57zQB90jjzEvp3FB5u3QXmyf6eFzALw68dB/mfAe
	1mGmomEDfMGAtea5KtQ8UUGi/dBfiBzFh2fE=
X-Received: by 2002:a92:4a10:0:b0:33d:2912:b15c with SMTP id m16-20020a924a10000000b0033d2912b15cmr12513612ilf.11.1686726911873;
        Wed, 14 Jun 2023 00:15:11 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7wT/JsQCu/LDqZFslfJmgnN77R7c4Oxdd1jRDKxKg8z8AMMmc4GHhl+3KY4XmGLNN6EXPpLLun6KjsFjsqBOA=
X-Received: by 2002:a92:4a10:0:b0:33d:2912:b15c with SMTP id
 m16-20020a924a10000000b0033d2912b15cmr12513603ilf.11.1686726911658; Wed, 14
 Jun 2023 00:15:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1686565330.git.alexl@redhat.com> <CAL7ro1EWzvWvwsO4dTc28HVj9nGfniz8HFix=pm40giTGv3YAg@mail.gmail.com>
 <20230613175927.GB1139@sol.localdomain>
In-Reply-To: <20230613175927.GB1139@sol.localdomain>
From: Alexander Larsson <alexl@redhat.com>
Date: Wed, 14 Jun 2023 09:15:00 +0200
Message-ID: <CAL7ro1E4rcW967yC6qiYcUKicEuWe739GgC-J2_4LOLZqgghMQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] ovl: Add support for fs-verity checking of lowerdata
To: Eric Biggers <ebiggers@kernel.org>
Cc: miklos@szeredi.hu, linux-unionfs@vger.kernel.org, amir73il@gmail.com, 
	tytso@mit.edu, fsverity@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 13, 2023 at 7:59=E2=80=AFPM Eric Biggers <ebiggers@kernel.org> =
wrote:
>
> On Tue, Jun 13, 2023 at 03:57:48PM +0200, Alexander Larsson wrote:
> >
> > I pushed a new version of this branch with the following changes:
> >
> >  * Includes and uses the new fsverity_get_digest() rework from Eric
> >  * The above means we now use the FS_VERITY_ALG_* enum values in the xa=
ttr
> >  * Made the overlayfs.rst document change a bit more explicit on what
> > happens and by whom
> >  * Ignore EOPNOTSUPP failure from removexattrs as pointed out by Amir
> >
> > The previous patchset is available as the overlay-verity-v3 tag so you
> > can compare the differences.
> >
>
> Where can I find the new version?

Sorry, its at https://github.com/alexlarsson/linux/commits/overlay-verity

--=20
=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D
 Alexander Larsson                                Red Hat, Inc
       alexl@redhat.com         alexander.larsson@gmail.com

