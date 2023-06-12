Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6991618AE1
	for <fsverity@lists.linux.dev>; Mon, 12 Jun 2023 10:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686565654;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=nIopUTyQC6au4qt8cPbc4MGLTADYeT6LypbQFqATEMA=;
	b=QxJ8awFXO5+6kMYqYd+w93YL/h4s8CANmWpV66NAubYq8FNWFs4oWOJk9pC0dPxNLPv7hJ
	wlFF4VO/c9Wz7M1fIuO+NyUagbItbBLeS2uHHl+2BRDFlkvm8dYhkiA+7hivJQzUAdHaMb
	+rw922zhj6r3tbeFKSAAoIkcXkFhoW4=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-646-vStrxnv8PE2wBFsORGFpOQ-1; Mon, 12 Jun 2023 06:27:32 -0400
X-MC-Unique: vStrxnv8PE2wBFsORGFpOQ-1
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-2b1b554e946so29636171fa.2
        for <fsverity@lists.linux.dev>; Mon, 12 Jun 2023 03:27:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686565651; x=1689157651;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nIopUTyQC6au4qt8cPbc4MGLTADYeT6LypbQFqATEMA=;
        b=lOIvtH/UGrgHHGwC+dUVLUaSdp30UZuvbIdjn6bDqssZgbGshlsZBi/zHZkme4uE29
         Z6GaYKILmyD3n/x+5P0wiu526xXwx20sO1K3KnsU92zsXEgG067JPxB9DnoJmLLA1tJs
         RVn2DnL0qMq6T9uRiJtuVEJ2JU2hUf3A+q+KwtonACyIr80YMMn4kU7FcOXUoAFniv/K
         R/eXqubuNtH4vvtoHWKIFuZrBO52+uTVlZmSrhjuPojdKyFYdzn/r5OiJGYzn1bHiM0r
         2r6f0TFuUznfPXkqfQjNtbAHQNjf1Rk6nmaCJDXf9Gd64eAovjAqxjiTP6NiYFDH0on0
         ZnpQ==
X-Gm-Message-State: AC+VfDyHcRQsa/4tZ0GMPykgWsZGZRRxQk2ezPTkR0PzFv66gTnOJDmq
	bFchvhfjvOxyvOC4dSvHFAAi3SDAYZJB/l3WWbzn8oPCTHbkUh5b/xZIKgcYh2cZ3FZwD03m7s0
	kBUDR1ljF13qpzLZc2Jw=
X-Received: by 2002:a2e:a0d6:0:b0:2b2:5d2:ce63 with SMTP id f22-20020a2ea0d6000000b002b205d2ce63mr2284405ljm.35.1686565651464;
        Mon, 12 Jun 2023 03:27:31 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4nQkV7krvCUS5noWSCi/+YY7Mpv3aM8Bw9QBw1jPHWqpiUiKRpBdNmLX5+v5jh05Zn0VTOPQ==
X-Received: by 2002:a2e:a0d6:0:b0:2b2:5d2:ce63 with SMTP id f22-20020a2ea0d6000000b002b205d2ce63mr2284389ljm.35.1686565651045;
        Mon, 12 Jun 2023 03:27:31 -0700 (PDT)
Received: from localhost.localdomain (c-e6a5e255.022-110-73746f36.bbcust.telenor.se. [85.226.165.230])
        by smtp.googlemail.com with ESMTPSA id m25-20020a2e8719000000b002b1fc6e70a1sm1709095lji.21.2023.06.12.03.27.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 03:27:30 -0700 (PDT)
From: Alexander Larsson <alexl@redhat.com>
To: miklos@szeredi.hu
Cc: linux-unionfs@vger.kernel.org,
	amir73il@gmail.com,
	ebiggers@kernel.org,
	tytso@mit.edu,
	fsverity@lists.linux.dev,
	Alexander Larsson <alexl@redhat.com>
Subject: [PATCH v3 0/4] ovl: Add support for fs-verity checking of lowerdata
Date: Mon, 12 Jun 2023 12:27:15 +0200
Message-Id: <cover.1686565330.git.alexl@redhat.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patchset adds support for using fs-verity to validate lowerdata
files by specifying an overlay.verity xattr on the metacopy
files.

This is primarily motivated by the Composefs usecase, where there will
be a read-only EROFS layer that contains redirect into a base data
layer which has fs-verity enabled on all files. However, it is also
useful in general if you want to ensure that the lowerdata files
matches the expected content over time.

I have also added some tests for this feature to xfstests[1].

I'm also CC:ing the fsverity list and maintainers because there is one
(tiny) fsverity change, and there may be interest in this usecase.

Changes since v2:
 * Rebased on top of overlayfs-next
 * We now alway do verity verification the first time the file content
   is used, rather than doing it at lookup time for the non-lazy lookup
   case.

Changes since v1:
 * Rebased on v2 lazy lowerdata series
 * Dropped the "validate" mount option variant. We now only support
   "off", "on" and "require", where "off" is the default.
 * We now store the digest algorithm used in the overlay.verity xattr.
 * Dropped ability to configure default verity options, as this could
   cause problems moving layers between machines.
 * We now properly resolve dependent mount options by automatically
   enabling metacopy and redirect_dir if verity is on, or failing
   if the specified options conflict.
 * Streamlined and fixed the handling of creds in ovl_ensure_verity_loaded().
 * Renamed new helpers from ovl_entry_path_ to ovl_e_path_

[1] https://github.com/alexlarsson/xfstests/commits/verity-tests

Alexander Larsson (4):
  fsverity: Export fsverity_get_digest
  ovl: Add framework for verity support
  ovl: Validate verity xattr when resolving lowerdata
  ovl: Handle verity during copy-up

 Documentation/filesystems/overlayfs.rst |  27 +++++
 fs/overlayfs/copy_up.c                  |  33 +++++-
 fs/overlayfs/file.c                     |   8 +-
 fs/overlayfs/namei.c                    |  54 +++++++++-
 fs/overlayfs/overlayfs.h                |  12 ++-
 fs/overlayfs/ovl_entry.h                |   3 +
 fs/overlayfs/super.c                    |  79 +++++++++++++-
 fs/overlayfs/util.c                     | 133 ++++++++++++++++++++++++
 fs/verity/measure.c                     |   1 +
 9 files changed, 340 insertions(+), 10 deletions(-)

-- 
2.40.1

