Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 191A320F0
	for <fsverity@lists.linux.dev>; Tue, 11 Apr 2023 05:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=6nX5sI6EN+QIsWtAaq5RhWz/W4vuyCGzISy2tTv8b6w=; b=k1nDyW9ThWdwLT7pSWirEu8vAz
	5gsYJWy42X4KvcpSpeCIEbOYds8a6VmdcdtnrFfTUZOMfEQkb0BOzhlbMIm5cunipw+jcMqtf6L/r
	FPpApigHLGsj0AbugbMiQtHKiTFGY9ozfe/zBscnPg1Mzgw7dPOExuqFoZe1d4/QjfAIxWMa+PTwM
	0e/gNRrYWpCr+ICTg8kD6Z7Kzqr7DVQAQCnWLRdiGK4HSeKC67KTJGD8gscP39JkuZlIwihkF+6hw
	gY+QlKY1Wbp8V4K0W3LfRl2b/hiI8yJJDxRKMbrd7FtzqjIBqzmCFNIpdbdq70XMfufV+YB7upDdm
	vTfdPYZg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
	id 1pm6Py-00GReU-09;
	Tue, 11 Apr 2023 05:19:46 +0000
Date: Mon, 10 Apr 2023 22:19:46 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Andrey Albershteyn <aalbersh@redhat.com>
Cc: djwong@kernel.org, dchinner@redhat.com, ebiggers@kernel.org,
	hch@infradead.org, linux-xfs@vger.kernel.org,
	fsverity@lists.linux.dev, rpeterso@redhat.com, agruenba@redhat.com,
	xiang@kernel.org, chao@kernel.org, damien.lemoal@opensource.wdc.com,
	jth@kernel.org, linux-erofs@lists.ozlabs.org,
	linux-btrfs@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com
Subject: Re: [PATCH v2 00/23] fs-verity support for XFS
Message-ID: <ZDTt8jSdG72/UnXi@infradead.org>
References: <20230404145319.2057051-1-aalbersh@redhat.com>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230404145319.2057051-1-aalbersh@redhat.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Dave is going to hate me for this, but..

I've been looking over some of the interfaces here, and I'm starting
to very seriously questioning the design decisions of storing the
fsverity hashes in xattrs.

Yes, storing them beyond i_size in the file is a bit of a hack, but
it allows to reuse a lot of the existing infrastructure, and much
of fsverity is based around it.  So storing them in an xattrs causes
a lot of churn in the interface.  And the XFS side with special
casing xattr indices also seems not exactly nice.
