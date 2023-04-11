Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA88220F0
	for <fsverity@lists.linux.dev>; Tue, 11 Apr 2023 05:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=KBhNfUOcD8iQz+TMuW2IJQH6CYVeRvhGPDElxngGpyE=; b=SuYCXB7pkcbxWbG1OHBZx7juNA
	pku0+MY68aN+S95h6lBSIC3+WUupYPcZ/eHTEqYAFMoLUQnYO8MeMYSbBdMCyQylUcDHHLHcmIXd7
	e5NqbRZSQB0gMOfbiVnUErygHRgsOtoOGaC/2EcI+J1zpIrNhA2wJV2TkXNBC4tU7LeHeSTqUrrZO
	VIlNf2JBzbM+1SJ8Gb7TZBAgltRuPGZead5QKLPM2er7apLZLYmpxUY511LIx0AYMvAIJ3J+L1juU
	k1OlPAFQtvgOTFojCSEo3+oOplG9rBmr5OVIw9zq4j1KxjAJOgfkDHNzOUYwe4/ft+nr670+zJOBn
	JIilyNgg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
	id 1pm68l-00GQYB-0D;
	Tue, 11 Apr 2023 05:01:59 +0000
Date: Mon, 10 Apr 2023 22:01:59 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Eric Biggers <ebiggers@kernel.org>
Cc: fsverity@lists.linux.dev, linux-crypto@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	linux-btrfs@vger.kernel.org
Subject: Re: [RFC PATCH] fsverity: use shash API instead of ahash API
Message-ID: <ZDTpx15RX/64lbjY@infradead.org>
References: <20230406003714.94580-1-ebiggers@kernel.org>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230406003714.94580-1-ebiggers@kernel.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Wed, Apr 05, 2023 at 05:37:14PM -0700, Eric Biggers wrote:
> Therefore, let's convert fs/verity/ from ahash to shash.  This
> simplifies the code, and it should also slightly improve performance for
> everyone who wasn't actually using one of these ahash-only crypto
> accelerators, i.e. almost everyone (or maybe even everyone)!

This looks like a very nice cleanup to me.  So unless someone really
uses async crypto offload heavily for fsverity and can come up with
a convincing argument for that, I'm all for the change.
