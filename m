Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08F93628
	for <fsverity@lists.linux.dev>; Mon, 26 Jun 2023 01:54:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93038C433C0;
	Mon, 26 Jun 2023 01:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687744456;
	bh=5oeqP+MWXjh5TRebKQMUswKua+sGjBsaB33i76j0bxo=;
	h=Date:From:To:Cc:Subject:From;
	b=f6LGIex6z5K0RASvaouow8y8XMHsFXoUr7TZ2cVN0jTQhZ5CbZsJSJjkPCK82EaXb
	 WHfnKAp5TSnsepIqO1p3s1SAmJiku6aewaNrrd87VPbThmmT/S4Ga01IoS9OjHJE20
	 B09EP3Cz4HjqEmXElkhJYpdF4Jqe8u7PXQ1pMvxTa/05AdzLs4jvhT8Rb1yFzGsq2U
	 7mBc9xEZTHIDlv+nXA0qT+x/WEWAnFQiD+5AzmtJ9OX4B/+/eox2gxUj/O0jY3Ga6u
	 9g7sm5ShVE5ovqJDmng6IGODDnQIWY567sJ5ydCm5DMuhMP0bA131SUwh4MGJNFNTU
	 FuhaSQE4Vft2Q==
Date: Sun, 25 Jun 2023 18:54:15 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: fsverity@lists.linux.dev, linux-fsdevel@vger.kernel.org,
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	Theodore Ts'o <tytso@mit.edu>, Alexander Larsson <alexl@redhat.com>
Subject: [GIT PULL] fsverity updates for 6.5
Message-ID: <20230626015415.GB1024@sol.localdomain>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit f1fcbaa18b28dec10281551dfe6ed3a3ed80e3d6:

  Linux 6.4-rc2 (2023-05-14 12:51:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/fs/fsverity/linux.git tags/fsverity-for-linus

for you to fetch changes up to 672d6ef4c775cfcd2e00172e23df34e77e495e85:

  fsverity: improve documentation for builtin signature support (2023-06-20 22:47:55 -0700)

----------------------------------------------------------------

Several updates for fs/verity/:

- Do all hashing with the shash API instead of with the ahash API.  This
  simplifies the code and reduces API overhead.  It should also make
  things slightly easier for XFS's upcoming support for fsverity.  It
  does drop fsverity's support for off-CPU hash accelerators, but that
  support was incomplete and not known to be used.

- Update and export fsverity_get_digest() so that it's ready for
  overlayfs's upcoming support for fsverity checking of lowerdata.

- Improve the documentation for builtin signature support.

- Fix a bug in the large folio support.

----------------------------------------------------------------
Eric Biggers (6):
      fsverity: use shash API instead of ahash API
      fsverity: constify fsverity_hash_alg
      fsverity: don't use bio_first_page_all() in fsverity_verify_bio()
      fsverity: simplify error handling in verify_data_block()
      fsverity: rework fsverity_get_digest() again
      fsverity: improve documentation for builtin signature support

 Documentation/filesystems/fsverity.rst | 192 +++++++++++++++++++++------------
 fs/verity/Kconfig                      |  16 +--
 fs/verity/enable.c                     |  21 ++--
 fs/verity/fsverity_private.h           |  23 ++--
 fs/verity/hash_algs.c                  | 139 +++++-------------------
 fs/verity/measure.c                    |  37 +++++--
 fs/verity/open.c                       |  12 +--
 fs/verity/read_metadata.c              |   4 +-
 fs/verity/signature.c                  |   8 ++
 fs/verity/verify.c                     | 164 +++++++++++-----------------
 include/linux/fsverity.h               |  14 ++-
 security/integrity/ima/ima_api.c       |  31 +++---
 12 files changed, 299 insertions(+), 362 deletions(-)
