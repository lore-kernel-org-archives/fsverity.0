Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EFAE8F6A
	for <fsverity@lists.linux.dev>; Tue, 24 Jan 2023 21:46:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2990C433EF;
	Tue, 24 Jan 2023 21:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674596770;
	bh=tyYq5kUwEdbE7CszQ0qp7rYJOubbzA7XgZByp+TgBuE=;
	h=Date:From:To:Cc:Subject:From;
	b=a67hXsCak5/DDjwXlochSLbzo2jyntzGsVFzV6DfzO3Uo/VTQsvwwioY2Q6ILzTDn
	 5DoKfDXpVNHePMTUA+BqAf6F8L4VxetlP4oJXnqYF2Z1in4OQsWr0b/vXSeANFC52Z
	 +ae22Zi2kWJrQX8yFR1fCvnGkg/8UBgKGfOHtgW6OEaCjglObDt0R2H2mo5sNeh5lm
	 DSZkMU7y5sTP2lSs4qsvxnaE7hTVOr+rYOLGlIRUfvBx4yHstQ+eiXIGqp5mn8XdPh
	 ZKGCNwtyBFpjZcUKuw2gRKhIGJv3a3Yzl6e5dg2LeMJruHsg7c9UxVSRrtNN3Lxv90
	 OVPsda5y3DQqA==
Date: Tue, 24 Jan 2023 13:46:08 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org
Cc: "Theodore Y. Ts'o" <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>,
	linux-fscrypt@vger.kernel.org, fsverity@lists.linux.dev
Subject: Please update fscrypt and fsverity branches in linux-next
Message-ID: <Y9BRoE/SIg1aUh+P@sol.localdomain>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Stephen,

I've moved the fscrypt and fsverity development branches to split them up
properly and make it clear what each branch is for.  Therefore, can you please
remove the following branches from linux-next:

	Repo:      git://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git
	Branches:  master, for-stable, and fsverity

And please add the following branches to linux-next:

	Repo:      https://git.kernel.org/pub/scm/fs/fscrypt/linux.git
	Branches:  for-next and for-current

	Repo:      https://git.kernel.org/pub/scm/fs/fsverity/linux.git
	Branches:  for-next and for-current

Also please ensure the contacts match the corresponding MAINTAINERS file
entries.  For fscrypt that is:

	M:      Eric Biggers <ebiggers@kernel.org>
	M:      Theodore Y. Ts'o <tytso@mit.edu>
	M:      Jaegeuk Kim <jaegeuk@kernel.org>

and for fsverity that is:

	M:      Eric Biggers <ebiggers@kernel.org>
	M:      Theodore Y. Ts'o <tytso@mit.edu>

Thanks!

- Eric
