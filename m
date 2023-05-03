Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92767746A
	for <fsverity@lists.linux.dev>; Wed,  3 May 2023 08:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683103919;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=4a+f8Fz30tFWUstPUy0HitI6O2dH+5DYRSPePkoVA7E=;
	b=DzTZis4lghkyHNZBH5UrLhOFqpHKsgXzWrlhdhNIvyOQfBx9cLR8ASvksB/Y7KnJaRsSgP
	oP/qTQzYQY7vJk6yluZ4k8J6UrBB7UZuFSCREd64yZ2hNYxx5GUvpDmJg+k4iAqHn3h8Dt
	8+yfrQkKDkfBDKeoj4jNsIWOiONoAuw=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-418-aRRCUdOwMtykVz7bzKtFtw-1; Wed, 03 May 2023 04:51:56 -0400
X-MC-Unique: aRRCUdOwMtykVz7bzKtFtw-1
Received: by mail-lj1-f200.google.com with SMTP id 38308e7fff4ca-2a9f9b317cfso24049191fa.2
        for <fsverity@lists.linux.dev>; Wed, 03 May 2023 01:51:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683103915; x=1685695915;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4a+f8Fz30tFWUstPUy0HitI6O2dH+5DYRSPePkoVA7E=;
        b=gOeX1MFIfmSoj4nPCZMl7mCxgA7DJhLYsFiMH/LAyP/AVmFuv9j3v76S89U0kC3EVZ
         +Wc9hs3dmCcJ6jesY8TZMnLKZwpIjuZQwfoSjJipfe6Lg2ctBY4X4HlfnBskjsD1XbHp
         2VSlpGHSGRr/w/aKG7uBn3wb9lJuxmhhqcO428Tocy1NlFBGClWxcSkIt7aXIxZ6P0Cx
         01oJojh55R0dbqb6WSm5e8kqow2+TQZNQQsJxpLKFvDuIo9bt9Yi30NCRxvmKDyR7Fxz
         xfwlFZPV2hrlG+TzsqHvRMc2CQuK26IR3fJLhQHs2EH4QsMO0TzabYrrrkG8n/OZydqY
         415Q==
X-Gm-Message-State: AC+VfDyg20vQ5bqimoSXJUpCjVoL6dDOET3IoFquzg0nC0yr3vzu11wJ
	swK/87emoRXFJaLMYnlnEHoS37kbuNKENz+K9Jt1XgN4xMQSbg1wiNN5D98D3JKpMCUYA762oKA
	+gEP7z2dNC0NpctY4H/A=
X-Received: by 2002:ac2:4468:0:b0:4dc:82b0:4c68 with SMTP id y8-20020ac24468000000b004dc82b04c68mr640877lfl.50.1683103914866;
        Wed, 03 May 2023 01:51:54 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6Xzkn0lqidzGMiyCQRL8W1ti01Ujxk2+TA/bge7mKgJluQVT0T2m86kotF44T0gebhvbFgdg==
X-Received: by 2002:ac2:4468:0:b0:4dc:82b0:4c68 with SMTP id y8-20020ac24468000000b004dc82b04c68mr640867lfl.50.1683103914526;
        Wed, 03 May 2023 01:51:54 -0700 (PDT)
Received: from localhost.localdomain (c-e6a5e255.022-110-73746f36.bbcust.telenor.se. [85.226.165.230])
        by smtp.googlemail.com with ESMTPSA id j6-20020ac24546000000b004ed4fa5f20fsm5907089lfm.25.2023.05.03.01.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 01:51:53 -0700 (PDT)
From: Alexander Larsson <alexl@redhat.com>
To: miklos@szeredi.hu
Cc: linux-unionfs@vger.kernel.org,
	amir73il@gmail.com,
	ebiggers@kernel.org,
	tytso@mit.edu,
	fsverity@lists.linux.dev,
	Alexander Larsson <alexl@redhat.com>
Subject: [PATCH v2 0/6] ovl: Add support for fs-verity checking of lowerdata
Date: Wed,  3 May 2023 10:51:33 +0200
Message-Id: <cover.1683102959.git.alexl@redhat.com>
X-Mailer: git-send-email 2.39.2
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

This patch series is based on the lazy lowerdata patch series by Amir[1].

I have also added some tests for this feature to xfstests[2].

I'm also CC:ing the fsverity list and maintainers because there is one
(tiny) fsverity change, and there may be interest in this usecase.

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

[1] https://lore.kernel.org/linux-unionfs/20230427130539.2798797-1-amir73il@gmail.com/T/#m3968bf64a31946e77bdba8e3d07688a34cf79982
[2] https://github.com/alexlarsson/xfstests/commits/verity-tests

Alexander Larsson (6):
  fsverity: Export fsverity_get_digest
  ovl: Break out ovl_e_path_real() from ovl_i_path_real()
  ovl: Break out ovl_e_path_lowerdata() from ovl_path_lowerdata()
  ovl: Add framework for verity support
  ovl: Validate verity xattr when resolving lowerdata
  ovl: Handle verity during copy-up

 Documentation/filesystems/overlayfs.rst |  27 ++++
 fs/overlayfs/copy_up.c                  |  31 +++++
 fs/overlayfs/namei.c                    |  42 +++++-
 fs/overlayfs/overlayfs.h                |  12 ++
 fs/overlayfs/ovl_entry.h                |   3 +
 fs/overlayfs/super.c                    |  74 ++++++++++-
 fs/overlayfs/util.c                     | 165 ++++++++++++++++++++++--
 fs/verity/measure.c                     |   1 +
 8 files changed, 343 insertions(+), 12 deletions(-)

-- 
2.39.2

