Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F3004436
	for <fsverity@lists.linux.dev>; Tue, 11 Apr 2023 08:58:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D1F9C433EF;
	Tue, 11 Apr 2023 08:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681203488;
	bh=k4ge5HqnVcBGWNMlqm6Oo2tJAFivoB8nrqwqk8ZUbjg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ouJXDogODS75tgfWWbqqtrgkaSB8DNavqQkmT8J7sYznPTElWBYkWxEYRBfuAnBiO
	 t8gQab2TFRQNvAVlxpWJOQlOGAXF3XGbXU6DDR+9KSZkimnjSJGmQJE9oAmxaldxjG
	 2efHCilCeMQVIFXzx8+GqyPFkXUHbTusaZ32aOZTfPOHjlkJiMqjx903gPtkuYYAIu
	 AZfIwz/jz/0QjHwHV27jlg/vCGHmXs8T12aPzMxcUZm7vWxEpM2I/uPxgmzXUihhrj
	 JyfJIHvLxIPTXScdlab/ymvEMW6lN+K77F0WsO1FV/IoV3+Z+y1eKIoMK9wzrMnzwY
	 OJ0aZSlAEfXzA==
Date: Tue, 11 Apr 2023 10:58:03 +0200
From: Christian Brauner <brauner@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Cc: fsverity@lists.linux.dev, linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org, Chaitanya Kulkarni <kch@nvidia.com>
Subject: Re: [PATCH v2] fsverity: use WARN_ON_ONCE instead of WARN_ON
Message-ID: <20230411-duktus-leitsatz-33c2dc2c7bde@brauner>
References: <20230406181542.38894-1-ebiggers@kernel.org>
 <20230406182525.GA1190@sol.localdomain>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230406182525.GA1190@sol.localdomain>

On Thu, Apr 06, 2023 at 11:25:25AM -0700, Eric Biggers wrote:
> On Thu, Apr 06, 2023 at 11:15:42AM -0700, Eric Biggers wrote:
> > From: Eric Biggers <ebiggers@google.com>
> > 
> > As per Linus's suggestion
> > (https://lore.kernel.org/r/CAHk-=whefxRGyNGzCzG6BVeM=5vnvgb-XhSeFJVxJyAxAF8XRA@mail.gmail.com),
> > use WARN_ON_ONCE instead of WARN_ON.  This barely adds any extra
> > overhead, and it makes it so that if any of these ever becomes reachable
> > (they shouldn't, but that's the point), the logs can't be flooded.
> > 
> > Reviewed-by: Chaitanya Kulkarni <kch@nvidia.com>
> > Signed-off-by: Eric Biggers <ebiggers@google.com>
> > ---
> >  fs/verity/enable.c       | 4 ++--
> >  fs/verity/hash_algs.c    | 4 ++--
> >  fs/verity/open.c         | 2 +-
> >  include/linux/fsverity.h | 6 +++---
> >  4 files changed, 8 insertions(+), 8 deletions(-)
> 
> Sorry, forgot changelog:
> 
> v2: also convert the three WARN_ON in include/linux/fsverity.h

Looks good to me,
Reviewed-by: Christian Brauner <brauner@kernel.org>
