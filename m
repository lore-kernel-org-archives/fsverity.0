Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A35654
	for <fsverity@lists.linux.dev>; Mon, 28 Aug 2023 03:47:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5BBEC433C7;
	Mon, 28 Aug 2023 03:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693194462;
	bh=BuWINHrRquDDWmHEVhKsAhSrCUkzcCM2neHXaS8GC/E=;
	h=Date:From:To:Cc:Subject:From;
	b=sf9DLcuyCilCSPUJnCQ6uHZqUz6wLm2jQhxc9NarLw9h4Ln+pCjpdbdJT0SL9IofC
	 A4OqQs4lhkRuUlPm/Ge9OmyBgaVc71QXPR/tOZ5En9tkWHh8OC6IWCZxXM+Xzen8c4
	 0VJ5sxNNURtggbgRnfUceWc3s9mYBT48jdvXdKjyuGvedzL4BWw0oMBlSan37ykgsl
	 W4b/MQLmXjaOEcTRRsGkLdxM0S/do0rC85ZSYHPUsqOtw69X4EuGb82lBDJ2QmbNhr
	 1KF5PQFcUTjX0MA+2V6Ki2KE8MT+6zvZEkwiVyGjcJvAdxiGvqjH+YlgCjwIIvnUtp
	 F+O6uiEYw9Abw==
Date: Sun, 27 Aug 2023 20:47:41 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: fsverity@lists.linux.dev, linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>
Subject: [GIT PULL] fsverity updates for 6.6
Message-ID: <20230828034741.GB5028@sol.localdomain>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:

  Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/fs/fsverity/linux.git tags/fsverity-for-linus

for you to fetch changes up to 919dc320956ea353a7fb2d84265195ad5ef525ac:

  fsverity: skip PKCS#7 parser when keyring is empty (2023-08-20 10:33:43 -0700)

----------------------------------------------------------------

Several cleanups for fs/verity/, including two commits that make the
builtin signature support more cleanly separated from the base feature.

----------------------------------------------------------------
Eric Biggers (4):
      fsverity: explicitly check that there is no algorithm 0
      fsverity: simplify handling of errors during initcall
      fsverity: move sysctl registration out of signature.c
      fsverity: skip PKCS#7 parser when keyring is empty

 fs/verity/fsverity_private.h | 12 +++----
 fs/verity/hash_algs.c        |  8 +++++
 fs/verity/init.c             | 56 ++++++++++++++++++++------------
 fs/verity/open.c             | 18 +++--------
 fs/verity/signature.c        | 77 ++++++++++++++------------------------------
 fs/verity/verify.c           | 11 ++-----
 6 files changed, 79 insertions(+), 103 deletions(-)

