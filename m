Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA9A1C8E9
	for <fsverity@lists.linux.dev>; Mon,  4 Sep 2023 18:11:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5532FC116A3;
	Mon,  4 Sep 2023 18:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693851069;
	bh=kDblhT9YU6Z13oCtuFpW2rqTqYaBtsASH9dKHi3/gS0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=KCIPdf7Q0FJfi462+L+9hLlIq0BX3t5I5nU+KyC3JUzPxLXnAhbxymMCPphIjkZk2
	 nAsEm8alo/h9yzDnwp6A8LVb7rfbQMxy2RfjbpRRrEaQ/eBashGE75ZiLRId6mtGSt
	 n174WOpZJUMdgC0EjnVVC2vm5+7uig8ReNTtltsXQsPxwJ4Heo6W2elu0nWCCAFa+P
	 IPwUZr1zyeD6ymPLFhgxMaBz9kyOb8bPnob2+yLx+ge2NU+glqZFicKWUrFr0q5nEO
	 oYTUotqMOD89YLI/lMJVg/6rp/a47wySfbJ7iLUnBpXB+H2O664scK9VXRyIFBHpkL
	 AGY3UbxOXs2Pw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 1F4B9C0C3FD;
	Mon,  4 Sep 2023 18:11:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [f2fs-dev] [PATCH 0/2] fsverity: simplify initcall and move sysctl
 registration
From: patchwork-bot+f2fs@kernel.org
Message-Id: 
 <169385106912.19669.17692351155547248889.git-patchwork-notify@kernel.org>
Date: Mon, 04 Sep 2023 18:11:09 +0000
References: <20230705212743.42180-1-ebiggers@kernel.org>
In-Reply-To: <20230705212743.42180-1-ebiggers@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Cc: fsverity@lists.linux.dev, linux-ext4@vger.kernel.org,
 linux-btrfs@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Eric Biggers <ebiggers@google.com>:

On Wed,  5 Jul 2023 14:27:41 -0700 you wrote:
> This series simplifies handling of errors during the fsverity_init()
> initcall, and moves the sysctl registration out of signature.c so that
> it is not unnecessarily tied to the builtin signature feature.
> 
> Eric Biggers (2):
>   fsverity: simplify handling of errors during initcall
>   fsverity: move sysctl registration out of signature.c
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,1/2] fsverity: simplify handling of errors during initcall
    https://git.kernel.org/jaegeuk/f2fs/c/e77000ccc531
  - [f2fs-dev,2/2] fsverity: move sysctl registration out of signature.c
    https://git.kernel.org/jaegeuk/f2fs/c/456ae5fe9b44

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


