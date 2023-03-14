Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD5C4D2F6
	for <fsverity@lists.linux.dev>; Tue, 14 Mar 2023 23:20:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 493E4C433D2;
	Tue, 14 Mar 2023 23:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678836048;
	bh=G7V+F0BGbBsl1yEsNsQszRtDU3hngdBR6xA/Ae9t9cw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kgSMSbZ6yEUH7WvjiWWIuyvGP+Yzlzvdr/Ipc33rpdyr0w9ncIkhUo1U10Sjz4ZpS
	 wS6lbA1Q+z/DD1RffOq78X7Lc1zyHjTk4bIu2TQ20LzA1eEArdjcS9xiFauv31nGDj
	 2Xac+w4DjAHJUgHIbpvZlfC393gRpN35mh9lE6AZRq7GoOHmgM1Vs1xi2sNuHbRFSM
	 YFwGMTpNwkaaKvJbjTjly4IuAeXNtmu5x+EsRCxmsNS7A9OBSsi8XAoz2K23tbEZOL
	 w1cy9aTv+yijF9AMC1VvLGf6so/ErqmUUluEnuVzt9BuGnK5gyv+cw5dAAkD1z5wWz
	 xM0kY4N95Tomw==
Date: Tue, 14 Mar 2023 16:20:46 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Nathan Huckleberry <nhuck@google.com>
Cc: "Theodore Y. Ts'o" <tytso@mit.edu>, fsverity@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] fsverity: Remove WQ_UNBOUND from fsverity read
 workqueue
Message-ID: <ZBEBTlboWjNW2LKl@sol.localdomain>
References: <20230310193325.620493-1-nhuck@google.com>
 <ZA+qt0gakiyAoacr@sol.localdomain>
 <CAJkfWY5eg2wLMUKUL5whU6zoHFogiUna1NPE+W8fPHm8YS-ReA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJkfWY5eg2wLMUKUL5whU6zoHFogiUna1NPE+W8fPHm8YS-ReA@mail.gmail.com>

On Mon, Mar 13, 2023 at 04:07:59PM -0700, Nathan Huckleberry wrote:
> >
> > Applied to https://git.kernel.org/pub/scm/fs/fsverity/linux.git/log/?h=for-next
> >
> > I adjusted the comment slightly so that the first paragraph doesn't start with
> > "Also".
> >

As discussed, this seems to be a significant enough improvement to call this a
"fix".  So I've also added:

    Fixes: 8a1d0f9cacc9 ("fs-verity: add data verification hooks for ->readpages()")
    Cc: stable@vger.kernel.org

and moved the commit to:

    https://git.kernel.org/pub/scm/fs/fsverity/linux.git/log/?h=for-current

- Eric
