Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA9943FC2
	for <fsverity@lists.linux.dev>; Wed, 26 Apr 2023 17:06:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8587DC433EF;
	Wed, 26 Apr 2023 17:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682528790;
	bh=vY3vR2SIoVfoXXvvxBzyFBrB8Bp1NwwLXPkNsWLh1iE=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=d/KJoUP67kXRAeEvgilxA5kgtwxhimwo54e5/VKwygQK4blC/NHxB/5DVZVuFQ74W
	 kFUUS6YZ6kB0hnBttiMcB8dj/u0q5YHOjoSn9SwrD09jbbp7ZHr8x7Xavc8OLHn3Ko
	 GA3DaAO6tAmQQ48KE+gxxguV8XGUL80+rSlNDL0UzBM6gBlCK87RRohMxf2ypdrBi4
	 V037PdFWzIkruFU2Xx+CMp/zPalsF7lT3yLGqrdMG8bvu3XuKCNrSRVeEnIwfxlxJo
	 0CmMXhkL30Cj+mBKAtDYjbIRfJg4yGkJ/0wpDi+Jd3DHPITrxISbmFv3d00por4nGl
	 xce4ufeNoj1TQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 704B9E5FFC8;
	Wed, 26 Apr 2023 17:06:30 +0000 (UTC)
Subject: Re: [GIT PULL] fsverity updates for 6.4
From: pr-tracker-bot@kernel.org
In-Reply-To: <20230425062707.GB77408@sol.localdomain>
References: <20230425062707.GB77408@sol.localdomain>
X-PR-Tracked-List-Id: <fsverity.lists.linux.dev>
X-PR-Tracked-Message-Id: <20230425062707.GB77408@sol.localdomain>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/fs/fsverity/linux.git tags/fsverity-for-linus
X-PR-Tracked-Commit-Id: 04839139213cf60d4c5fc792214a08830e294ff8
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c3558a6b2a75d9adacf15dd7fae79dbfffa7ebe4
Message-Id: <168252879044.19907.1440082376684042155.pr-tracker-bot@kernel.org>
Date: Wed, 26 Apr 2023 17:06:30 +0000
To: Eric Biggers <ebiggers@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, fsverity@lists.linux.dev, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>

The pull request you sent on Mon, 24 Apr 2023 23:27:07 -0700:

> https://git.kernel.org/pub/scm/fs/fsverity/linux.git tags/fsverity-for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c3558a6b2a75d9adacf15dd7fae79dbfffa7ebe4

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
