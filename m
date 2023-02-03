Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F45BA3F
	for <fsverity@lists.linux.dev>; Fri,  3 Feb 2023 22:01:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 990B5C433EF
	for <fsverity@lists.linux.dev>; Fri,  3 Feb 2023 22:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675461718;
	bh=eC4NoQ/JqV70JKsMzBYbW75hc5aCFU5tYHVlcbaDVXQ=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=D0Jh9F/Dh9yC1rF0FP2c7p3A98nC8gp/tjp549AcSIJtuW6koONEhFItYOSUTfe8w
	 J8Nxngl3QuUjlBSME6+TQiPfdWoH9/zsccxHdDm//gKLSg4sv5nGml6A+fKC4B2sBc
	 92rJWUNEF0PIOm/Md/eWVZzsZliWlzGrjxHcMOH34m2TpoIRVot/VtBR2xnYeZZfkB
	 tcJtRR3zpNpC4Wq652Rj0voPF5YoG++hCsUUfcl1BqrjZD8RdrvLNZd214G4cSeQeR
	 /eICwbIHvZ7qGcwIut/l12g9jIwUBr5qqNq3xdm5Z5kMM6dYdolvY8sLzpukZKzWsK
	 MIJCpd8CLXxnw==
Date: Fri, 3 Feb 2023 14:01:56 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: fsverity@lists.linux.dev
Subject: Re: [PATCH] fsverity.rst: update git repo URL for fsverity-utils
Message-ID: <Y92EVBKeOF00Mmot@sol.localdomain>
References: <20230125203025.28187-1-ebiggers@kernel.org>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230125203025.28187-1-ebiggers@kernel.org>

On Wed, Jan 25, 2023 at 12:30:25PM -0800, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> The fsverity-utils git repo is moving out of my personal directory;
> see the announcement at
> https://lore.kernel.org/r/Y9GKm+hcm70myZkr@sol.localdomain.
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>  Documentation/filesystems/fsverity.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to https://git.kernel.org/pub/scm/fs/fsverity/linux.git/log/?h=for-next

- Eric
