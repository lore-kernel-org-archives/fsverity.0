Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E31133E3
	for <fsverity@lists.linux.dev>; Tue, 13 Jun 2023 17:58:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A787C433F1;
	Tue, 13 Jun 2023 17:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686679081;
	bh=0rOGKEoCLIUg2rO2l+2MHxMSnXBq7nKNEyzr5jQIlNk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JKB3vrp0G66zHSuHf8weQcyTWcHBKUaX+KEg69Q8j1ARgNXWDZyl0wNr0ZnUqvbit
	 x1YVXi0xcboKVbbYcrdgiiQ821pqBqn1SFXVcA59tNVd4s4JJCGCeLt+ogZKR1gmC+
	 aiOQLT+zeAUxi0gAsuObxkp1Hr8z5UiWjNMl95X77SNNPsBexRIZXaeZv9P6ZotbBw
	 LgqX2bS6mOBwk/vpTbYmBhr0qFdCpFr0JWiqCxGJXgKhkHyqt1lEoesk4RFfo7k1XK
	 t1XOsTc1rTUEarIEOf0tcwtNfxS/V8ENTmwOnp8QmEv2jlDxerRfF3VBkOa3K+xdpJ
	 tba15f8MCThdA==
Date: Tue, 13 Jun 2023 10:57:59 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Alexander Larsson <alexl@redhat.com>
Cc: miklos@szeredi.hu, linux-unionfs@vger.kernel.org, amir73il@gmail.com,
	tytso@mit.edu, fsverity@lists.linux.dev
Subject: Re: [PATCH v3 3/4] ovl: Validate verity xattr when resolving
 lowerdata
Message-ID: <20230613175759.GA1139@sol.localdomain>
References: <cover.1686565330.git.alexl@redhat.com>
 <dd294a44e8f401e6b5140029d8355f88748cd8fd.1686565330.git.alexl@redhat.com>
 <20230612190944.GB847@sol.localdomain>
 <CAL7ro1Feep_aQimxEJzKk+4cv6-UNgco3VNDKZrrC3y2u04DCw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL7ro1Feep_aQimxEJzKk+4cv6-UNgco3VNDKZrrC3y2u04DCw@mail.gmail.com>

On Tue, Jun 13, 2023 at 01:41:34PM +0200, Alexander Larsson wrote:
> > Can you consider
> > https://lore.kernel.org/r/20230612190047.59755-1-ebiggers@kernel.org which would
> > make fsverity_get_digest() support both types of IDs?  Then you can use
> > FS_VERITY_HASH_ALG_*, which I think would make things slightly easier for you.
> 
> Sounds very good to me. I'll rebase the patchset on top of it. Not
> sure how to best land this though, are you ok with this landing via
> overlayfs-next?

If you're confident that this series will land in v6.4, then sure, you can apply
my patch "fsverity: rework fsverity_get_digest() again" to overlayfs-next,
instead of me taking it through fsverity/for-next.  (Hopefully the IMA
maintainer will ack it as well, as it touches security/integrity/.)

Just be careful about being overly-optimistic about features landing in the next
release.  I've had experience with cases like this before, where I didn't apply
something for a reason like this, but then the series didn't make it in right
away so it was worse than me just taking the patch in the first place.

I do see that the other prerequisites were just applied to overlayfs-next, so
maybe this is good to go now.  It's up to the other overlayfs folks.

- Eric
