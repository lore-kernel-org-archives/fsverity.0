Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 462B233FD
	for <fsverity@lists.linux.dev>; Wed, 12 Apr 2023 12:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=E0KHAAQwHuVG+JUkhMNXRzfAxWNr8pB44DMS1FIDYiU=; b=VL2Xq3mXsX5zJ0mUpgFdjyqzch
	uwDtv5eusczS8yue8CmgTqmgQlhiERF1JwLtsis14nYKk+RIdUpZM47LPD2BFHt6UpXsa1xX7MUlq
	QnekFKGKo9ViGfaiGcAq6s4YKopGqFR+iW722YWss5oQKb9l+u8zu789Ruzb9HbRx/zZzFsQ0umAx
	slzq+P5/cNMhF2GmdH3M1qVbcfQCtTUpgUHQhqO9u68CXXozNoINOdCVMV5plzm+dz1gNP7jGrZvE
	ZlrzIKFvEvvcxXN0E09iz3XsChVPky8ItYBLK1I+opyB93pWAQHQtWawRH5b332rI/xu7+YxbuakL
	SS0C2vgQ==;
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
	id 1pmZlw-003AdB-0z;
	Wed, 12 Apr 2023 12:40:24 +0000
Date: Wed, 12 Apr 2023 05:40:24 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Christoph Hellwig <hch@infradead.org>,
	Andrey Albershteyn <aalbersh@redhat.com>, djwong@kernel.org,
	dchinner@redhat.com, linux-xfs@vger.kernel.org,
	fsverity@lists.linux.dev, rpeterso@redhat.com, agruenba@redhat.com,
	xiang@kernel.org, chao@kernel.org, damien.lemoal@opensource.wdc.com,
	jth@kernel.org, linux-erofs@lists.ozlabs.org,
	linux-btrfs@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com
Subject: Re: [PATCH v2 00/23] fs-verity support for XFS
Message-ID: <ZDamuPYV8khwDzRJ@infradead.org>
References: <20230404145319.2057051-1-aalbersh@redhat.com>
 <ZDTt8jSdG72/UnXi@infradead.org>
 <20230412023319.GA5105@sol.localdomain>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230412023319.GA5105@sol.localdomain>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Tue, Apr 11, 2023 at 07:33:19PM -0700, Eric Biggers wrote:
> It seems it's really just the Merkle tree caching interface that is causing
> problems, as it's currently too closely tied to the page cache?  That is just an
> implementation detail that could be reworked along the lines of what is being
> discussed.

Well, that and some of the XFS internal changes that seem a bit ugly.

But it's not only very much tied to the page cache, but also to
page aligned data, which is really part of the problem.

> But anyway, it is up to the XFS folks.  Keep in mind there is also the option of
> doing what btrfs is doing, where it stores the Merkle tree separately from the
> file data stream, but caches it past i_size in the page cache at runtime.

That seems to be the worst of both worlds.

> I guess there is also the issue of encryption, which hasn't come up yet since
> we're talking about fsverity support only.  The Merkle tree (including the
> fsverity_descriptor) is supposed to be encrypted, just like the file contents
> are.  Having it be stored after the file contents accomplishes that easily...
> Of course, it doesn't have to be that way; a separate key could be derived, or
> the Merkle tree blocks could be encrypted with the file contents key using
> indices past i_size, without them physically being stored in the data stream.

xattrs contents better be encrypted as well, fsverity or not.
