Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 767B68F63
	for <fsverity@lists.linux.dev>; Tue, 24 Jan 2023 21:16:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1BB02C4339E;
	Tue, 24 Jan 2023 21:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674595019;
	bh=pEYX0+MZgf58CJyU0+5oXs+dmwVpMK09+9EkEuczC7E=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=LLgqk8B9/cvTRISTcuMuVRpGicEqq+7awe/wNiZC7fC8up/EGApdzPANmz7/jx2Ct
	 G1w04SZSXhNBTkZVYqz/JbGFulVvuLd9bILPF1ICl+IbKbPN4P/d1uVbM5VpCqlilc
	 aryjbg73Qs+lSgzS4gp8O4cy+QxBBl42QhBlilJLdVHL/6S9Oad2wjHNxY1oZgixV8
	 Ks0Ofd0XY7n3Q7MeCEfnUFfG9nOfcAmXexOvvrjF8AjPeEa1MrBIIOoY6ceVFb77O8
	 v3wpgEC/TLyBKzBDZOEdmzoOAy1IAJZ773Fk5j6ZDIaxqV4k1qLLKHGmFMtv5dS8WT
	 pR0syTOQDyf1w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 04593C5C7D4;
	Tue, 24 Jan 2023 21:16:59 +0000 (UTC)
Subject: Re: [GIT PULL] fsverity MAINTAINERS entry update for 6.2-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <Y88gdkbdscJPOqSX@sol.localdomain>
References: <Y88gdkbdscJPOqSX@sol.localdomain>
X-PR-Tracked-List-Id: <linux-fsdevel.vger.kernel.org>
X-PR-Tracked-Message-Id: <Y88gdkbdscJPOqSX@sol.localdomain>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/fs/fsverity/linux.git tags/fsverity-for-linus
X-PR-Tracked-Commit-Id: ef7592e466ef7b2595fdfdfd23559a779f4b211a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5149394c899808667e0f8444d3d39cba1dfb42f7
Message-Id: <167459501901.6044.16348460970361042850.pr-tracker-bot@kernel.org>
Date: Tue, 24 Jan 2023 21:16:59 +0000
To: Eric Biggers <ebiggers@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Theodore Ts'o <tytso@mit.edu>, fsverity@lists.linux.dev, linux-fsdevel@vger.kernel.org, linux-fscrypt@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>

The pull request you sent on Mon, 23 Jan 2023 16:04:06 -0800:

> https://git.kernel.org/pub/scm/fs/fsverity/linux.git tags/fsverity-for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5149394c899808667e0f8444d3d39cba1dfb42f7

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
