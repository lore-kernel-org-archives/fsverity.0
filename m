Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F7BBA3E
	for <fsverity@lists.linux.dev>; Tue,  4 Apr 2023 15:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=H6mc1gZhtXSneS6nte5uW4UZFELa9ivi94Hze/v8bew=; b=kS4170334H5m+oxgCVnmmbfs8Z
	HGcIrZO4ewhSv2x0uhcAurkfo8ppu67vASYNQq3Qd/M7iEqY5WYIWA/GGhfxTL0EqayVfGzm0ZgHC
	RchX/7zGEAnuEBysywlPXrCE17YdeutDLtHd4/UKlCfF6zaadmNmMBQRlJl7JNc1aJGI1/8ZBFQSX
	oTFeOYFfjZrVqlcF0ADAK6KzacZHHooO5I7DqGlmnK4NjCY3zQqecMMXo+G0O9qTZWVipvtosDIJI
	LaE1ceqK0n3y/4ZeJwIN/yytH+VCppgyUpHfoyunWwsKECUUoQYnJ48JKxsRMHBOhpLOZ0mtdfMi1
	q75JIVDw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
	id 1pjidr-0020pf-02;
	Tue, 04 Apr 2023 15:32:15 +0000
Date: Tue, 4 Apr 2023 08:32:14 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Andrey Albershteyn <aalbersh@redhat.com>
Cc: djwong@kernel.org, dchinner@redhat.com, ebiggers@kernel.org,
	hch@infradead.org, linux-xfs@vger.kernel.org,
	fsverity@lists.linux.dev, rpeterso@redhat.com, agruenba@redhat.com,
	xiang@kernel.org, chao@kernel.org, damien.lemoal@opensource.wdc.com,
	jth@kernel.org, linux-erofs@lists.ozlabs.org,
	linux-btrfs@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com
Subject: Re: [PATCH v2 08/23] iomap: hoist iomap_readpage_ctx from the
 iomap_readahead/_folio
Message-ID: <ZCxC/pQixOq03ltH@infradead.org>
References: <20230404145319.2057051-1-aalbersh@redhat.com>
 <20230404145319.2057051-9-aalbersh@redhat.com>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230404145319.2057051-9-aalbersh@redhat.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Tue, Apr 04, 2023 at 04:53:04PM +0200, Andrey Albershteyn wrote:
> Make filesystems create readpage context, similar as
> iomap_writepage_ctx in write path. This will allow filesystem to
> pass _ops to iomap for ioend configuration (->prepare_ioend) which
> in turn would be used to set BIO end callout (bio->bi_end_io).
> 
> This will be utilized in further patches by fs-verity to verify
> pages on BIO completion by XFS.

Hmm.  Can't we just have a version of the readpage helper that just
gets the ops passed instead of creating all this boilerplate code?

For writepage XFS embedds the context in it's own structure, so it's
kindof needed, but I don't think we'll need that here.
