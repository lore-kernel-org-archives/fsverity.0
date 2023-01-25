Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F415F6FB1
	for <fsverity@lists.linux.dev>; Wed, 25 Jan 2023 20:01:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EA8FC433D2;
	Wed, 25 Jan 2023 20:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674676893;
	bh=myWWWUfa+USomgtlLWQAPpShELYL1rULYUvY5Mx89Cc=;
	h=Date:From:To:Cc:Subject:From;
	b=WgjBl4WwC9YLr9aiIUp58Y+c8r+2FAXfKH6a283SNCDQTNPev/0UeB5iMi083Ck/K
	 /SP8Yd760bV4nGkQ8QnU6q2xqgMGZMu/yXTEYebm3dblnHdVAENW8vkMhOmNOznnty
	 VlxwnGmIQTTvwSgKzK0BsSV0C2/MET38m4mG2xqmp/+zMi7VX9Be1lc8fSeiuP2Na9
	 eRVKoYGuGLj9ur8agX6AnzVatD+Uccl3R+9GMxMNK9VzjiDmmUPOQGTcHyr4+KFSp9
	 p/m+0mPALcXgMk9dpWbZLR8X8Kb1qlW4q5aSPTuvQWDJ1HcHT32k/ol4PG99g8Cf4N
	 nKx+qEjz7saAg==
Date: Wed, 25 Jan 2023 12:01:31 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: fsverity@lists.linux.dev
Cc: linux-fscrypt@vger.kernel.org
Subject: [ANNOUNCE] Moving the fsverity-utils git repo
Message-ID: <Y9GKm+hcm70myZkr@sol.localdomain>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

I'm moving the fsverity-utils git repo from the following path:

	https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/fsverity-utils.git

to the following path:

	https://git.kernel.org/pub/scm/fs/fsverity/fsverity-utils.git

This way, it's now owned by the "FSVerity FS Group" and isn't just in my
personal directory.  It's also now alongside the linux.git used for the kernel.

I'll keep the old repo around for a short time while I try to update the link in
a few places I know are using it.

- Eric
