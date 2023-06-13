Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AD58522B
	for <fsverity@lists.linux.dev>; Tue, 13 Jun 2023 13:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686664682;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UEJ8D9gbYcwWPQg40ZDw3VfrRidvBZYa0oUX+g7tSYE=;
	b=GucNqLB6oY2ygiJ4S1XqrdQdXrGqFvg9C13VyaSOZEEnFbObH5OxxQ9Dq9UJz5oIYRB4ve
	nWo+i66OR721P3Sq4YEKAXleNsgCvyZvOA63FkIsZ6Jx8ycVFR1hP2tCuEoPVyiIj7pAKQ
	up3u3CFqlbaLL9QL5tRDFuIpfCKdNFs=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-615-TL5rMYI-MIuz5MNfuEqbJw-1; Tue, 13 Jun 2023 09:58:00 -0400
X-MC-Unique: TL5rMYI-MIuz5MNfuEqbJw-1
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-33fc2f90703so35268435ab.1
        for <fsverity@lists.linux.dev>; Tue, 13 Jun 2023 06:58:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686664680; x=1689256680;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UEJ8D9gbYcwWPQg40ZDw3VfrRidvBZYa0oUX+g7tSYE=;
        b=DMp9g4KkT8k2D1RndpeeD026FhQamKsLipwuuCdIHeyO+z30seAZRGkeab4n1WpYxm
         lizkOjvJSWTmwnJTivoCfQm3CLe8ecA6p14TtGl9oPG0xrv39ysmJBoS2rhAbxBcqmNE
         fmI1GnuYJKFYMiV27QZl0HzzeW7Qw9tdT4DrHB+px8jiFEoqS1GtuIXYnK0thyS9frC9
         EduhZw1oGtLBahZyQremh4SrmWhMYFFTs1TDCD86Ohz5uwzdF/3vnGMuPl144rspU15x
         mZ8XHN+LNDOmySN7Yri+t+kRrixw2ojVFiLKO6E07XFIJtrujqCW756p8+Ut8Ui3KWhP
         tt7w==
X-Gm-Message-State: AC+VfDwwsuDuCRmtMFet+sTZPZ4WXyIwsd0u/HAqCLr4bLXIc7aLJPn7
	28YameFW20KLz3BWIlSk4Trhq1aICQk2eWGw6CVbBIBGYx7BMuFx6h3pGNcdFGkbRE4oa3GzmqR
	LvAE3j+eUTZHKzir4s5W0CujQNrrZi9u6rW8=
X-Received: by 2002:a92:c686:0:b0:334:de38:d600 with SMTP id o6-20020a92c686000000b00334de38d600mr9335762ilg.3.1686664679843;
        Tue, 13 Jun 2023 06:57:59 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6bVatOmIWP1/VH2aADCiQGu+mBCtCJT8G2qu0r5Kk4teagU5wnCK7nNljakyvJ21X4ixpwPBYlZDS7B+HmYbg=
X-Received: by 2002:a92:c686:0:b0:334:de38:d600 with SMTP id
 o6-20020a92c686000000b00334de38d600mr9335744ilg.3.1686664679516; Tue, 13 Jun
 2023 06:57:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1686565330.git.alexl@redhat.com>
In-Reply-To: <cover.1686565330.git.alexl@redhat.com>
From: Alexander Larsson <alexl@redhat.com>
Date: Tue, 13 Jun 2023 15:57:48 +0200
Message-ID: <CAL7ro1EWzvWvwsO4dTc28HVj9nGfniz8HFix=pm40giTGv3YAg@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] ovl: Add support for fs-verity checking of lowerdata
To: miklos@szeredi.hu
Cc: linux-unionfs@vger.kernel.org, amir73il@gmail.com, ebiggers@kernel.org, 
	tytso@mit.edu, fsverity@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 12, 2023 at 12:27=E2=80=AFPM Alexander Larsson <alexl@redhat.co=
m> wrote:
>
> This patchset adds support for using fs-verity to validate lowerdata
> files by specifying an overlay.verity xattr on the metacopy
> files.
>
> This is primarily motivated by the Composefs usecase, where there will
> be a read-only EROFS layer that contains redirect into a base data
> layer which has fs-verity enabled on all files. However, it is also
> useful in general if you want to ensure that the lowerdata files
> matches the expected content over time.
>
> I have also added some tests for this feature to xfstests[1].
>
> I'm also CC:ing the fsverity list and maintainers because there is one
> (tiny) fsverity change, and there may be interest in this usecase.
>
> Changes since v2:
>  * Rebased on top of overlayfs-next
>  * We now alway do verity verification the first time the file content
>    is used, rather than doing it at lookup time for the non-lazy lookup
>    case.
>
> Changes since v1:
>  * Rebased on v2 lazy lowerdata series
>  * Dropped the "validate" mount option variant. We now only support
>    "off", "on" and "require", where "off" is the default.
>  * We now store the digest algorithm used in the overlay.verity xattr.
>  * Dropped ability to configure default verity options, as this could
>    cause problems moving layers between machines.
>  * We now properly resolve dependent mount options by automatically
>    enabling metacopy and redirect_dir if verity is on, or failing
>    if the specified options conflict.
>  * Streamlined and fixed the handling of creds in ovl_ensure_verity_loade=
d().
>  * Renamed new helpers from ovl_entry_path_ to ovl_e_path_
>
> [1] https://github.com/alexlarsson/xfstests/commits/verity-tests

I pushed a new version of this branch with the following changes:

 * Includes and uses the new fsverity_get_digest() rework from Eric
 * The above means we now use the FS_VERITY_ALG_* enum values in the xattr
 * Made the overlayfs.rst document change a bit more explicit on what
happens and by whom
 * Ignore EOPNOTSUPP failure from removexattrs as pointed out by Amir

The previous patchset is available as the overlay-verity-v3 tag so you
can compare the differences.

