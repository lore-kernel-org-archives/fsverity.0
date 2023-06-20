Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A461774F
	for <fsverity@lists.linux.dev>; Tue, 20 Jun 2023 16:15:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46F09C433C8;
	Tue, 20 Jun 2023 16:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687277709;
	bh=knteJC5PVvOfnbRwO/RZ3TKEht6Hors3/XkV5/hWREg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bUlVPvysXbVqhoD81KTRiTbkbYMNr3oaKLqzT4fIVVGSlzQ97XqI9ZnpbnQEL5peT
	 mwMl4bM+7sChRWvrylK/MNm5itIZ8QdzTR3yFTMQfgpctpUJhsE2IUM6Gl1Aq4r38I
	 w0Roe2w75Cp1BG/EEO/N178DIp6HGhHoBLLMyICZEsIsFdqK4VIsrFpbdcfekXfyuU
	 C3di2//NauDqUiLxOjFmKBAm58sXogoqQ9/qCjgNpVqpSm1XVwIx1aEXnd8WVcNjyO
	 EK3pC9dn5pjSgyw5rAc47VjxC97unWFEay9JAbONTB9n7UCZavxmc3GjxVOsJ0keAE
	 ktRwn67ruTA+A==
Date: Tue, 20 Jun 2023 09:15:07 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Alexander Larsson <alexl@redhat.com>
Cc: miklos@szeredi.hu, linux-unionfs@vger.kernel.org, amir73il@gmail.com,
	tytso@mit.edu, fsverity@lists.linux.dev
Subject: Re: [PATCH v4 0/3] ovl: Add support for fs-verity checking of
 lowerdata
Message-ID: <20230620161507.GA864@sol.localdomain>
References: <cover.1687255035.git.alexl@redhat.com>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1687255035.git.alexl@redhat.com>

On Tue, Jun 20, 2023 at 12:15:15PM +0200, Alexander Larsson wrote:
> This series depends on the commit
>   fsverity: rework fsverity_get_digest() again
> Which is in the "for-next" branch of 
>   https://git.kernel.org/pub/scm/fs/fsverity/linux.git/
> 
> This series, plus the above commit are also in git here:
>   https://github.com/alexlarsson/linux/tree/overlay-verity
> 
> I would love to see this go into 6.5. So Eric, could you maybe Ack the
> implementation patches separately from the documentation patches? Then
> maybe we can get this in early, and I promise to try to get the
> documentation up to standard during the 6.5 cycle as needed.

I think it's gotten too late for 6.5.  If there is no 6.4-rc8, then the 6.5
merge window will open just 5 days from now.  This series has recently gone
through some significant changes, including in the version just sent out today
which I haven't had a chance to review yet.

Please don't try to rush things in when they involve UAPI and on-disk format
changes, which will have to be supported forever.  We need to take the time to
get them right.
 
I also see that the overlayfs tree is already very busy in 6.5, with the support
for data-only lower layers, lazy lookup of lowerdata, and the new mount API.

I think 6.6 would be a more realistic target.  That would give time to write
proper documentation as well, which is super important.  (Very often while
writing documentation, I realize that I should do something differently in the
code.  Please don't think of documentation as something can be done "later".)

- Eric
