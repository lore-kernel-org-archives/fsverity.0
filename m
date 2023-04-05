Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E2BE6ABC
	for <fsverity@lists.linux.dev>; Wed,  5 Apr 2023 15:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=L2Oxdk6Soo+QR4xtEQGW5VILqYT7VRJvcfzUGwIeljQ=; b=nhp8jPH1vFH/iElJAx8aqwqR7U
	g+xNujT+vjE4bWfEwqW3BKCVZa4Mt0/Os0v8HNGaILCF8OxUyB5wOqjJRRpRA4EdpvAVUmjmNpbUS
	xkkVJUA0KsaMSSkpRr0JlE4M1+DBZDaIQxvYn//4LCcIK59VgiSAZSjv0vYFxMXkpvfRkqksNjcIh
	y51QOMTrJAHIz0LcXkH9uZr7QtDhk9rdjErAs88IgJs0sz2xDsOZzPZLp0udpmqvU1b1ygELVNTYI
	iSiGvjkivARv/BdG0FSgDDxaGZQyG6ztn11VMyNGMNQ9EBNfqxUReAe+RWRMOy2AHxViuHKIoXkUf
	RV7SaN/w==;
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
	id 1pk5Ok-0050qZ-1c;
	Wed, 05 Apr 2023 15:50:10 +0000
Date: Wed, 5 Apr 2023 08:50:10 -0700
From: Christoph Hellwig <hch@infradead.org>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: Andrey Albershteyn <aalbersh@redhat.com>, dchinner@redhat.com,
	ebiggers@kernel.org, hch@infradead.org, linux-xfs@vger.kernel.org,
	fsverity@lists.linux.dev, rpeterso@redhat.com, agruenba@redhat.com,
	xiang@kernel.org, chao@kernel.org, damien.lemoal@opensource.wdc.com,
	jth@kernel.org, linux-erofs@lists.ozlabs.org,
	linux-btrfs@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com
Subject: Re: [PATCH v2 19/23] xfs: disable direct read path for fs-verity
 sealed files
Message-ID: <ZC2YsgYRsvBejGYY@infradead.org>
References: <20230404145319.2057051-1-aalbersh@redhat.com>
 <20230404145319.2057051-20-aalbersh@redhat.com>
 <20230404161047.GA109974@frogsfrogsfrogs>
 <20230405150142.3jmxzo5i27bbc4c4@aalbersh.remote.csb>
 <20230405150927.GD303486@frogsfrogsfrogs>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230405150927.GD303486@frogsfrogsfrogs>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Wed, Apr 05, 2023 at 08:09:27AM -0700, Darrick J. Wong wrote:
> Thinking about this a little more -- I suppose we shouldn't just go
> breaking directio reads from a verity file if we can help it.  Is there
> a way to ask fsverity to perform its validation against some arbitrary
> memory buffer that happens to be fs-block aligned?

That would be my preference as well.  But maybe Eric know a good reason
why this hasn't been done yet.

