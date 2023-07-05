Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 946AA156DC
	for <fsverity@lists.linux.dev>; Wed,  5 Jul 2023 21:29:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A554DC433C7;
	Wed,  5 Jul 2023 21:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688592545;
	bh=n7svmHUh1Z6GbwcL6k4hTmYd2sPiWtLOTvwd8wlcx48=;
	h=From:To:Cc:Subject:Date:From;
	b=sb+zENMFLr0TYlhy6muwquT/CgUn1f+YoD+fgTheZs3ZaIo05qoY/oXk7FLYXWLHI
	 imptyVlAgYbrhXscBuZJ4ccYhKVhilV/ZaAGXTTasdep6+ZPYz4dqAkqWvXPaSG9S6
	 BxNF1CTgsJytitzcZZsA8r1qCY57EAh1knPg/Q03dPdfd+m01uKkyg3EV2ryNQs838
	 DyjWgrP4V9RQkq/Wmq3yrcldCMpaQ7vgAKNu9tlHWAuteZFQtzZs+iAethi1wuW8WI
	 19VnR7R4s2q/l/6ju2aoXYGbIlsfuko4q68BHDIKq2Zm2EPoK5fDFK7kg6KUFN5uT9
	 1WD0NGkvxG+EA==
From: Eric Biggers <ebiggers@kernel.org>
To: fsverity@lists.linux.dev
Cc: linux-ext4@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-btrfs@vger.kernel.org
Subject: [PATCH 0/2] fsverity: simplify initcall and move sysctl registration
Date: Wed,  5 Jul 2023 14:27:41 -0700
Message-ID: <20230705212743.42180-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series simplifies handling of errors during the fsverity_init()
initcall, and moves the sysctl registration out of signature.c so that
it is not unnecessarily tied to the builtin signature feature.

Eric Biggers (2):
  fsverity: simplify handling of errors during initcall
  fsverity: move sysctl registration out of signature.c

 fs/verity/fsverity_private.h | 12 +++----
 fs/verity/init.c             | 56 ++++++++++++++++++++-------------
 fs/verity/open.c             | 18 +++--------
 fs/verity/signature.c        | 61 +++++-------------------------------
 fs/verity/verify.c           | 11 ++-----
 5 files changed, 55 insertions(+), 103 deletions(-)


base-commit: ace1ba1c9038b30f29c5759bc4726bbed7748f15
-- 
2.41.0

