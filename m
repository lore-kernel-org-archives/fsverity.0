Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89106BA3E
	for <fsverity@lists.linux.dev>; Tue,  4 Apr 2023 15:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=oRUY6/nVUdkJWa+BgfeeaayCjIWt7sUTbaMHlXagjNw=; b=Fn5hZQrai6OxRnc53wDWJvsQUi
	l0f2jY/0e+u5hzy8V4qA0uX6eNIA0HL+/ThjvZ+58OfHp5yJqwS4UwWtJa85+FoQv1YOF18PQ8y/e
	fZlpCpeR10Vlao2xf/ZiIbKLawae3/lvFHmhVGCbU5EseY8BqD2Zq9XQmLqu1Rs3Ie8J+zOpNJhqg
	WOPGvV+nuedhEDvyiMY4PKQZIb21ECVPvSGrC0nkv5nmqQuhLqlykdFWXGNzzFth3lMtIfRXD4Co3
	i32ooWz4rlCAa8EN+liRSIfzaYutkEpt2RTf3KItD2VFGXXaziebwy1oggfRtL771dhH2RwYQSCtU
	E2Ik6G2g==;
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
	id 1pjicG-0020iL-1q;
	Tue, 04 Apr 2023 15:30:36 +0000
Date: Tue, 4 Apr 2023 08:30:36 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Andrey Albershteyn <aalbersh@redhat.com>
Cc: djwong@kernel.org, dchinner@redhat.com, ebiggers@kernel.org,
	hch@infradead.org, linux-xfs@vger.kernel.org,
	fsverity@lists.linux.dev, rpeterso@redhat.com, agruenba@redhat.com,
	xiang@kernel.org, chao@kernel.org, damien.lemoal@opensource.wdc.com,
	jth@kernel.org, linux-erofs@lists.ozlabs.org,
	linux-btrfs@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com
Subject: Re: [PATCH v2 05/23] fsverity: make fsverity_verify_folio() accept
 folio's offset and size
Message-ID: <ZCxCnC2lM9N9qtCc@infradead.org>
References: <20230404145319.2057051-1-aalbersh@redhat.com>
 <20230404145319.2057051-6-aalbersh@redhat.com>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230404145319.2057051-6-aalbersh@redhat.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Tue, Apr 04, 2023 at 04:53:01PM +0200, Andrey Albershteyn wrote:
> Not the whole folio always need to be verified by fs-verity (e.g.
> with 1k blocks). Use passed folio's offset and size.

Why can't those callers just call fsverity_verify_blocks directly?
