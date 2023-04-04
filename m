Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F27983C07
	for <fsverity@lists.linux.dev>; Tue,  4 Apr 2023 23:37:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24D67C433EF;
	Tue,  4 Apr 2023 23:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680651435;
	bh=28csmTGeSXq8H7xfZ7A9tZkyNtsYsSc6KAk1TE12n9Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MzRMCxrEdCfSJr+egFiRRoe3pwGPEZcD99zxZrYbt5ciHtwXGms9CUOlfLkUIsf3n
	 Dq43lH7ZE8DC7AIwuA0rGofhxf6xABvBNbtWaHUv+oOCfnPeR0ROwg+1Ai+ZlgQb5I
	 +8wPKWKn9HJIM/PdRtaqDctfJPytasl9aS/ekuyXlrcTDKEKwpxvBRAlPUIIKaD2D3
	 NPRMXTl4LyGxzqCx4Dp97UM9fJe1HBjc+21snGc7Qxw54p9XORNR8EB+byaaoavD+E
	 VVQpmcJF+uIuCzlRajzE5SxibJTalb1plXMeva9WeuOTsFJBk66cqpXDXkODEpG4zU
	 zFmJFk59vKE8w==
Date: Tue, 4 Apr 2023 16:37:13 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Andrey Albershteyn <aalbersh@redhat.com>
Cc: djwong@kernel.org, dchinner@redhat.com, hch@infradead.org,
	linux-xfs@vger.kernel.org, fsverity@lists.linux.dev,
	rpeterso@redhat.com, agruenba@redhat.com, xiang@kernel.org,
	chao@kernel.org, damien.lemoal@opensource.wdc.com, jth@kernel.org,
	linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org,
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	cluster-devel@redhat.com
Subject: Re: [PATCH v2 00/23] fs-verity support for XFS
Message-ID: <20230404233713.GF1893@sol.localdomain>
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

On Tue, Apr 04, 2023 at 04:52:56PM +0200, Andrey Albershteyn wrote:
> The patchset is tested with xfstests -g auto on xfs_1k, xfs_4k,
> xfs_1k_quota, and xfs_4k_quota. Haven't found any major failures.

Just to double check, did you verify that the tests in the "verity" group are
running, and were not skipped?

- Eric
