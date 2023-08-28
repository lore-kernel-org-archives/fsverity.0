Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E31134D4
	for <fsverity@lists.linux.dev>; Mon, 28 Aug 2023 20:15:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BF324C433C9;
	Mon, 28 Aug 2023 20:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693253704;
	bh=NebJ1diQTRARjdY4DTAfJWxFhFsjW4kzgWBqSnH8h+Y=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=HIqqDpLlHJGZpXcfxzyMqmmp/ST5p0gsTMUYdN7Nq25HCUYSiNEu40gz/WUniVLHG
	 bEokU8mfC7jlaxOrMxlUBDmTUTyAcl3sfyC29IRRpacJgEeKX0rZOamFZntxwfxOSN
	 ZHX+EV9Do4q8mT6FRaWJLowgO6l+WfmKHB9D0hu2f0X860Ov1h0R8zTeoZVCDyvpvB
	 HO4u1qCr5C6Gou3iqytM+qRVVEAkaty270VNNaGztUAaJu2cuwctsrNjIKul40C2hv
	 BK9MrZY3tiR2q3ep0LBw/NuRuoEdp1XVqG0tlBhNsEI44SSy8ulOy7TQm+d/AeT/Au
	 PLnpKg3KHPdyA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id ABD95C3274C;
	Mon, 28 Aug 2023 20:15:04 +0000 (UTC)
Subject: Re: [GIT PULL] fsverity updates for 6.6
From: pr-tracker-bot@kernel.org
In-Reply-To: <20230828034741.GB5028@sol.localdomain>
References: <20230828034741.GB5028@sol.localdomain>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20230828034741.GB5028@sol.localdomain>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/fs/fsverity/linux.git tags/fsverity-for-linus
X-PR-Tracked-Commit-Id: 919dc320956ea353a7fb2d84265195ad5ef525ac
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3bb156a55668800b368856818807677eac207c75
Message-Id: <169325370469.5740.17319498547370760123.pr-tracker-bot@kernel.org>
Date: Mon, 28 Aug 2023 20:15:04 +0000
To: Eric Biggers <ebiggers@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, fsverity@lists.linux.dev, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>

The pull request you sent on Sun, 27 Aug 2023 20:47:41 -0700:

> https://git.kernel.org/pub/scm/fs/fsverity/linux.git tags/fsverity-for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3bb156a55668800b368856818807677eac207c75

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
