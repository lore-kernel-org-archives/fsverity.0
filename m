Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC4CF8464
	for <fsverity@lists.linux.dev>; Tue, 20 Jun 2023 10:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687256132;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=4kAOgXpY7nv0aA6tKuGnVIvTOJljbCAPrQYz8VNVmek=;
	b=OW8VMU3CITEIre2ulw3dvlJs1BBjLOA9hcls9YN/+tDfZNMROj9vQjrdPYJyuejEuI4iDu
	nRkdRTAyA9kj+ZrLV14FhA7PEgewNay5fqz0pmjuYv6FOSScCoQKR0Y/RMdFXS54Rw8c/P
	qcq/3rYgkm5d58CFi5IrNVZcEndEjgE=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-482-qq3yEPIBPuq5u6rsZz4y7Q-1; Tue, 20 Jun 2023 06:15:30 -0400
X-MC-Unique: qq3yEPIBPuq5u6rsZz4y7Q-1
Received: by mail-lj1-f198.google.com with SMTP id 38308e7fff4ca-2b46cfde570so18121721fa.2
        for <fsverity@lists.linux.dev>; Tue, 20 Jun 2023 03:15:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687256129; x=1689848129;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4kAOgXpY7nv0aA6tKuGnVIvTOJljbCAPrQYz8VNVmek=;
        b=AIMXBvbA/EcHs/MZ7Y7mlGXuuGZsCpwgKe1KUui1xg+sOI+TlJD3efaJmH/AeQbUBz
         fkZifb0aYx1KPA8p/KDWrzrUpe5PFmgdGAPnv5X1j28udmfpa7VOR3tc7LMTgOWB/MGs
         Vy5SxZWtRaSDqe7Mp63K/S8bBhaY3Uh3JL/zYo1MIHQrF9TQ6hxuGHEIt1Tn5/o1Efm4
         3Ul9EDm7uKnPNXAORFK8AVT3E/cewoTajULYsf3BNm0vdXVUCc1J2DQvrBpoT6IcKLuK
         f7lXfLF3lIaawRXtDxQL6BV9NKeEoyplqW/BX4EyQ1ltrNh1GZMUG5bJj6Lrd0cvD/rF
         OjEg==
X-Gm-Message-State: AC+VfDx8u1BRyfYEfOiFFnyNlwTr4c4LRlgQmfknOia4x28708OHIsrG
	yxAXZ5URzqc5Ac7c3rQi3Jw+48vjtdhnB1B4uWKzk4D482DzdGjT0QeB8gLeNI/8R98RE9AaKbR
	1x/TN6japi7+yTWenPro=
X-Received: by 2002:a05:651c:115:b0:2b5:7fd2:ec36 with SMTP id a21-20020a05651c011500b002b57fd2ec36mr579746ljb.21.1687256129300;
        Tue, 20 Jun 2023 03:15:29 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6HU11F2Aqa+nlbBU5hBNijgW9gOPsUiuovV0S1O91k3qJT1L4n1XJZMhOwkyniYeEYQx/zFA==
X-Received: by 2002:a05:651c:115:b0:2b5:7fd2:ec36 with SMTP id a21-20020a05651c011500b002b57fd2ec36mr579733ljb.21.1687256128958;
        Tue, 20 Jun 2023 03:15:28 -0700 (PDT)
Received: from localhost.localdomain (c-e6a5e255.022-110-73746f36.bbcust.telenor.se. [85.226.165.230])
        by smtp.googlemail.com with ESMTPSA id h9-20020a2e9009000000b002b326e7e76csm337280ljg.64.2023.06.20.03.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jun 2023 03:15:28 -0700 (PDT)
From: Alexander Larsson <alexl@redhat.com>
To: miklos@szeredi.hu
Cc: linux-unionfs@vger.kernel.org,
	amir73il@gmail.com,
	ebiggers@kernel.org,
	tytso@mit.edu,
	fsverity@lists.linux.dev,
	Alexander Larsson <alexl@redhat.com>
Subject: [PATCH v4 0/3] ovl: Add support for fs-verity checking of lowerdata
Date: Tue, 20 Jun 2023 12:15:15 +0200
Message-Id: <cover.1687255035.git.alexl@redhat.com>
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

This series depends on the commit
  fsverity: rework fsverity_get_digest() again
Which is in the "for-next" branch of 
  https://git.kernel.org/pub/scm/fs/fsverity/linux.git/

This series, plus the above commit are also in git here:
  https://github.com/alexlarsson/linux/tree/overlay-verity

I would love to see this go into 6.5. So Eric, could you maybe Ack the
implementation patches separately from the documentation patches? Then
maybe we can get this in early, and I promise to try to get the
documentation up to standard during the 6.5 cycle as needed.

Changes since v3:
 * Instead of using a overlay.digest xattr we extend the current
   overlay.metacopy xattr with version, flags and digest. This makes
   it flexible for later changes and allows us to use the existing
   xattr lookup to know ahead of time whether a file needs to have
   verity validated.

   I've done some performance checks on this new layout, and the
   results are essentially the same as before.

 * This is rebased on top of the latest overlayfs-next, which includes
   the changes to the new mount API, so that part has been redone.

 * The documentation changes have been rewritten to try to be more
   clear about the behaviour of i/o verification when verity is used.

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

Alexander Larsson (3):
  ovl: Add framework for verity support
  ovl: Validate verity xattr when resolving lowerdata
  ovl: Handle verity during copy-up

 Documentation/filesystems/fsverity.rst  |   2 +
 Documentation/filesystems/overlayfs.rst |  48 ++++++++
 fs/overlayfs/copy_up.c                  |  47 ++++++-
 fs/overlayfs/file.c                     |   8 +-
 fs/overlayfs/namei.c                    |  97 +++++++++++++--
 fs/overlayfs/overlayfs.h                |  53 ++++++--
 fs/overlayfs/ovl_entry.h                |   1 +
 fs/overlayfs/super.c                    |  69 +++++++++--
 fs/overlayfs/util.c                     | 156 +++++++++++++++++++++++-
 9 files changed, 448 insertions(+), 33 deletions(-)

-- 
2.40.1

