Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27BD914263
	for <fsverity@lists.linux.dev>; Mon, 26 Jun 2023 20:02:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EDF64C433C0;
	Mon, 26 Jun 2023 20:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687809759;
	bh=NxxnjZZAxPhJTnl5+BHG9TFV/wjyN/XPRp2AViKTMf8=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=cMm8pK+d6eXxtRqk/jrRlOFhw7pPyCTXL/gbz7yWi5bWYEVwz1SmPBkhUZUxua+d7
	 wvFQ7rzw9nzDHaiE0byDaUobvJGwXHItEG2kBEACEphBj8w5VpygisndylpLxHXYsE
	 9eLytnF7Q8p2fttQKr1h5m3RkMINVGvlPC+oY5lEaJ2Lz3U1JbfUoyzJdspt4PeRts
	 BVWqo+gq7BEciZToZTm7XkiUItTv0gNUqf8T0Bd9O/QmhIHPL9/6DP2KmrlWEJCM4e
	 9D4bcc5iQV0TeHZTuy9p0e8VKMCMBJ1DuRFKsh7raLFy5lRr3E/9FNGRoOxYPQEyjC
	 qCt+NuMB/AXdw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D6C75C43170;
	Mon, 26 Jun 2023 20:02:38 +0000 (UTC)
Subject: Re: [GIT PULL] fsverity updates for 6.5
From: pr-tracker-bot@kernel.org
In-Reply-To: <20230626015415.GB1024@sol.localdomain>
References: <20230626015415.GB1024@sol.localdomain>
X-PR-Tracked-List-Id: <fsverity.lists.linux.dev>
X-PR-Tracked-Message-Id: <20230626015415.GB1024@sol.localdomain>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/fs/fsverity/linux.git tags/fsverity-for-linus
X-PR-Tracked-Commit-Id: 672d6ef4c775cfcd2e00172e23df34e77e495e85
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 74774e243c5ff0903df22dff67be01f2d4a7f00c
Message-Id: <168780975887.7651.4555094720412338997.pr-tracker-bot@kernel.org>
Date: Mon, 26 Jun 2023 20:02:38 +0000
To: Eric Biggers <ebiggers@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, fsverity@lists.linux.dev, linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>, Alexander Larsson <alexl@redhat.com>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>

The pull request you sent on Sun, 25 Jun 2023 18:54:15 -0700:

> https://git.kernel.org/pub/scm/fs/fsverity/linux.git tags/fsverity-for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/74774e243c5ff0903df22dff67be01f2d4a7f00c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
