Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 796781FA9
	for <fsverity@lists.linux.dev>; Fri,  7 Apr 2023 08:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=M7NmYC/Iylm9myghHwqILim55SAUt9QrM+UZYk0eJlw=; b=u92BVdgQKegL160NbY8VQjrkAm
	FthmCgSAk57TlSJXN246SaiNK2vFGb4hHkEj950B4r8dlHMAUKp9AbGj1xRMTh2Af6eJ2dFqfOTzM
	z2AfxEQG43NGWlWyR1LF97r0DjaH9wew6/C2T1Ussf30U6+H2fIb5GNXY/sXQcNZmUg0m7NhGqF2I
	dxRMtwXhs6yjCi0w2fo2cTMtePsBgzcq0a1Ig+ZhmrqT1/tiyaf5keLcwFRHIzbuUilhwlvWvqC2T
	mTGgHN6FH0OUq15vDekea+pl392Pqz2fiBcdEYpGNtD/hJejR9gSE58fqHmZJDwLv7rNVe59Jghet
	7VNSI1Ow==;
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
	id 1pkhA4-009RsN-2O;
	Fri, 07 Apr 2023 08:09:32 +0000
Date: Fri, 7 Apr 2023 01:09:32 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Eric Biggers <ebiggers@kernel.org>
Cc: fsverity@lists.linux.dev, linux-fsdevel@vger.kernel.org,
	stable@vger.kernel.org,
	syzbot+51177e4144d764827c45@syzkaller.appspotmail.com
Subject: Re: [PATCH] fsverity: reject FS_IOC_ENABLE_VERITY on mode 3 fds
Message-ID: <ZC/PvPK/e0j5mZ7o@infradead.org>
References: <20230406215106.235829-1-ebiggers@kernel.org>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230406215106.235829-1-ebiggers@kernel.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>
