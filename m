Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B0AD8F70
	for <fsverity@lists.linux.dev>; Tue, 24 Jan 2023 22:19:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 885CEC433EF;
	Tue, 24 Jan 2023 22:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674598745;
	bh=U85zQgZaGptirm1FMFBd9riQ9xroftiQcp0//6ql7pM=;
	h=Date:From:To:Cc:Subject:From;
	b=RJLaBl7HvSbm+MpCR+0mN3BK9lHqfNpQTw8LhfL1+E/zYND/9VH6iOA02F+whWIYT
	 MBO+1bzKu/HqapvdzmN/o/Ln0c61wWzjMwcs0hBCjpYZVFEdi0RCglOICthtf56fvx
	 gsGAdIaYeglG//fL6OR9ZLiP+CRRvY23GEKvp5OVlQ9K4MpT4du9fNVJSvKLb9QzJT
	 xZIO9mbNqRoSwh0ptq2Vu2xwAeb/qC4XIhZca9hDKFGq6g0AcyZ7pM2OuUoZ12ogTt
	 ihOYq7FR+sb7apou6uuKQ0aD6B+cxZmj5t7gxDR/cc1Y+8KeT2K3oJUYJe+FG0Q+Gt
	 YIyg4+k6E/iwQ==
Date: Tue, 24 Jan 2023 14:19:03 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: fsverity@lists.linux.dev
Cc: linux-fscrypt@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, linux-btrfs@vger.kernel.org,
	linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: [ANNOUNCE] New mailing list for fsverity development
Message-ID: <Y9BZVw01GbP6T3XY@sol.localdomain>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

fsverity development (both the kernel part and fsverity-utils) is now using the
mailing list fsverity@lists.linux.dev instead of linux-fscrypt@vger.kernel.org.
linux-fscrypt@vger.kernel.org is now for fscrypt only.

When sending any fsverity-related patches, please always include the new list.

If you're interested, please also subscribe to the new list by sending an email
to fsverity+subscribe@lists.linux.dev.

The new list is being archived at https://lore.kernel.org/fsverity/.

- Eric
