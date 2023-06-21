Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEE37DF5C
	for <fsverity@lists.linux.dev>; Wed, 21 Jun 2023 11:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687346325;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=IO5VVrvlt4yaLcBQDvZ3hx40/hKZEJoz2Z1VJGTPERo=;
	b=daiAHlR7CNEEwb7+AndAPYXPz1jG9kYBTijISN+HBf8qTLZcJiBNM9fO/U1DcFtvIyF+qp
	g1mGDUbbwy8wluNQj61EKd9U1X/jBCkXaUFV0VLADnlXtPwVbhROoxYxCCU5eiGCJN+72f
	x3R02ZQxCgig44FyP2dDO2AWij8RAbE=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-595-4XTNHQCOPeWmFlo_H80WTw-1; Wed, 21 Jun 2023 07:18:44 -0400
X-MC-Unique: 4XTNHQCOPeWmFlo_H80WTw-1
Received: by mail-lj1-f199.google.com with SMTP id 38308e7fff4ca-2b1d8fa45a6so42871021fa.0
        for <fsverity@lists.linux.dev>; Wed, 21 Jun 2023 04:18:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687346323; x=1689938323;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IO5VVrvlt4yaLcBQDvZ3hx40/hKZEJoz2Z1VJGTPERo=;
        b=iERMzXWUOTxu1eaOs0nqrT85DOzKbhGGukqxfHQmR7e9A3Oz+1AwipNQfMZLgg4852
         z/XqKUh+nqFAFLE/A7kNjWkSrVDvzMlDjQSZPDe5rrqtjBnpCte9lhNvfiAVLeBUJtIU
         GSji9X5if3fQeLgtBCglbN4/B5/V1ybzxdlB9dFw+ZaMMWwPH8ouZb+xxvH7tjzNoPaz
         ndzf3YhvB256Om4JwvRehOzwT8rrYLXFVG4Fsp/1uhjwjH49swLsWFwbUI1oGsJh7yPd
         owSfGLlCWfZUhiptFbt4nEbB4rRmhod1xRKFaFFPUEUzh1xg1KpuwymWpKd0YwNhkn7M
         kxqQ==
X-Gm-Message-State: AC+VfDw1RVxc1N8l22nKRT4sCI/Nd2VgT9HsTKcKokfiBeY9UIeSQgaa
	XA3XQgmVVLcGTAyaCTqUUJXHElp0R+vSj38VswdzB9VVVtnfufAtk/eHTHMHV/zic89eFLkIDkW
	7hSs4avt3qQkmGjzSBvo=
X-Received: by 2002:a2e:8654:0:b0:2b4:6c47:6258 with SMTP id i20-20020a2e8654000000b002b46c476258mr8277790ljj.21.1687346322940;
        Wed, 21 Jun 2023 04:18:42 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ75STI+9YmMxhyOMTB2nW8t1lI8hVUiHvnl+SYoP8Cj8j7VpblaN//ktHoJZboKXjcN34nMPw==
X-Received: by 2002:a2e:8654:0:b0:2b4:6c47:6258 with SMTP id i20-20020a2e8654000000b002b46c476258mr8277768ljj.21.1687346322575;
        Wed, 21 Jun 2023 04:18:42 -0700 (PDT)
Received: from localhost.localdomain (c-e6a5e255.022-110-73746f36.bbcust.telenor.se. [85.226.165.230])
        by smtp.googlemail.com with ESMTPSA id 3-20020a05651c00c300b002b31ec01c97sm864436ljr.15.2023.06.21.04.18.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 04:18:42 -0700 (PDT)
From: Alexander Larsson <alexl@redhat.com>
To: miklos@szeredi.hu
Cc: linux-unionfs@vger.kernel.org,
	amir73il@gmail.com,
	ebiggers@kernel.org,
	tytso@mit.edu,
	fsverity@lists.linux.dev,
	Alexander Larsson <alexl@redhat.com>
Subject: [PATCH v5 0/4] ovl: Add support for fs-verity checking of lowerdata
Date: Wed, 21 Jun 2023 13:18:24 +0200
Message-Id: <cover.1687345663.git.alexl@redhat.com>
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

This series depends on commits from overlay-next, fs-verity-next and
vfs.all, so I based it on:

  https://github.com/amir73il/linux/tree/next

Which contains all of these

This series is also available in git here:
  https://github.com/alexlarsson/linux/tree/overlay-verity

Changes since v4:
 * Rebased also on vfs.all

 * Refactored patch series with the new overlay.metadata versioned
   xattr header in its own patch.

 * Some documentation updates

 * Fixes for issues reported in review from Amir.

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

Alexander Larsson (4):
  ovl: Add framework for verity support
  ovl: Add versioned header for overlay.metacopy xattr
  ovl: Validate verity xattr when resolving lowerdata
  ovl: Handle verity during copy-up

 Documentation/filesystems/fsverity.rst  |   2 +
 Documentation/filesystems/overlayfs.rst |  47 +++++++
 fs/overlayfs/copy_up.c                  |  47 ++++++-
 fs/overlayfs/file.c                     |   8 +-
 fs/overlayfs/namei.c                    |  82 +++++++++++-
 fs/overlayfs/overlayfs.h                |  44 ++++++-
 fs/overlayfs/ovl_entry.h                |   1 +
 fs/overlayfs/super.c                    |  66 +++++++++-
 fs/overlayfs/util.c                     | 158 +++++++++++++++++++++++-
 9 files changed, 432 insertions(+), 23 deletions(-)

-- 
2.40.1

