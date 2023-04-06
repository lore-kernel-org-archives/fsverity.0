Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5DDCAD29
	for <fsverity@lists.linux.dev>; Thu,  6 Apr 2023 18:25:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5529AC433D2;
	Thu,  6 Apr 2023 18:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680805527;
	bh=TjkZqObnX6Ozi0JkMk8YeQobLclqYcS5rFl3Axh7jNI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EySMTc1+Gui6oWZ3Z73LoRaOkTzZnNKvZ5OShzR8luJnMJwt+oCjo1sSBbSzI+abI
	 jt6UrOwjuwQz1dykl2pTeGQoqJgiHjW93tnj5iZdIUUPaXLx0WhEDhbErqRH5kHp4c
	 HFCgYVOVuo5dEDfsEVteXRF9Fa2z2ia7HYRGBmW8zXvLSewntDNo4pRjclV218Ubjo
	 gNmq/ed3w5JuVZtcyIfCatHFZ1B/7wW7X+C8fPWhi392wagflK4w9xVSQen+UKeL7z
	 uTZ1ddwj/GcVRrf1NJGVKqSd5drJQvjyLx0vq8GYVD8b1wzcBBnRjGxSpZzsH/q0Ih
	 fAS5jgNIn8JMA==
Date: Thu, 6 Apr 2023 11:25:25 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: fsverity@lists.linux.dev
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	Chaitanya Kulkarni <kch@nvidia.com>
Subject: Re: [PATCH v2] fsverity: use WARN_ON_ONCE instead of WARN_ON
Message-ID: <20230406182525.GA1190@sol.localdomain>
References: <20230406181542.38894-1-ebiggers@kernel.org>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230406181542.38894-1-ebiggers@kernel.org>

On Thu, Apr 06, 2023 at 11:15:42AM -0700, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> As per Linus's suggestion
> (https://lore.kernel.org/r/CAHk-=whefxRGyNGzCzG6BVeM=5vnvgb-XhSeFJVxJyAxAF8XRA@mail.gmail.com),
> use WARN_ON_ONCE instead of WARN_ON.  This barely adds any extra
> overhead, and it makes it so that if any of these ever becomes reachable
> (they shouldn't, but that's the point), the logs can't be flooded.
> 
> Reviewed-by: Chaitanya Kulkarni <kch@nvidia.com>
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>  fs/verity/enable.c       | 4 ++--
>  fs/verity/hash_algs.c    | 4 ++--
>  fs/verity/open.c         | 2 +-
>  include/linux/fsverity.h | 6 +++---
>  4 files changed, 8 insertions(+), 8 deletions(-)

Sorry, forgot changelog:

v2: also convert the three WARN_ON in include/linux/fsverity.h

- Eric
