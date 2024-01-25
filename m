Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A25831388
	for <fsverity@lists.linux.dev>; Thu, 25 Jan 2024 02:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706148520; cv=none; b=VJZmK1LxPxe4jvBHBMa8F3X1PfNitq4fGSoiLI+EnvbSV+J3yKcHdUtN9Echx6sxPEs4frqKufhCeBghE8bGPjsvLZrhUzZsET7AvZWaRuG+WeaJxOi6EPb19L+r9ddg3nPQTx0MIxwfzb/MEK1o+MTIQDrBv4PYcJvthCxN9e0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706148520; c=relaxed/simple;
	bh=0wmaELWiCyj31A1/S21EB/0fbu0P78Arap/jrJONFcs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VfjTnaJFcgw/6y0ZWClbUtwdBZbsw3JjggkCnPRs4GsNUXYoVXlHhAIVTONOvNLJvsr5glgqV/SHqxO70Q5B7+YvaMg0pU6ZJbh9Ld4r0dnIAplNmIAylxKPf/qCa/p3OTepw3FDFYIvpAfPNVT8H7MmhZuWYh6RtkYCMNkffMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZbTyHH6H; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZbTyHH6H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51356C433C7;
	Thu, 25 Jan 2024 02:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706148520;
	bh=0wmaELWiCyj31A1/S21EB/0fbu0P78Arap/jrJONFcs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZbTyHH6Hczo3bZCIUNAYwymaL6VBPF6aDml5yCq7M581RCJto8ctp18mDh5AMAPNB
	 D1KXOtvZ2B9dOPs2r1EV6yPoF04Ij10B/GO7qjxTO9TjTehsp7QBtt+YTSl7Mk8RVA
	 hwaMfaAEdC9OyxqKLNGafVlqTIIEoN09K6lk+eO31wzYO2UUrZs77wPZCnjg5qZj0/
	 HXQUOtR+4kebwFKfyLQDU+UjfVhJ/xYxxxOi7aWfxzGa5RGlosYxZ4AA6wzLa0wsfU
	 ZerEEtdbnL+xgnFud5TEd6vF+DVOq/z1KqRN58FaDbOK1/wan07nZdotRukM2K+rxg
	 KkDBU/1J1p+CA==
Date: Wed, 24 Jan 2024 18:08:38 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Andrey Albershteyn <aalbersh@redhat.com>
Cc: fsverity@lists.linux.dev
Subject: Re: fs-verity spinlock in is_hash_block_verified()
Message-ID: <20240125020838.GH1088@sol.localdomain>
References: <vry5tz5aaqaewaaei4e6yux7knb27zf4sm774hqqyisgfj6go7@7x2htyodqfjc>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <vry5tz5aaqaewaaei4e6yux7knb27zf4sm774hqqyisgfj6go7@7x2htyodqfjc>

Hi Andrey,

On Thu, Jan 25, 2024 at 12:02:07AM +0100, Andrey Albershteyn wrote:
> Hi Eric,
> 
> I'm continuing my attempts in adding fs-verity support into XFS :)
> And I have a question
> 
> I'm trying to not break stuff for ext4 and keep all the
> optimizations in place but I got a little bit confused about the
> spinlock in is_hash_block_verified().
> 
> If we drop opportunistic lockless read for simplicity [1], we get
> something like this:
> 
> static bool is_hash_block_verified(struct fsverity_info *vi, struct page *hpage,
> 				   unsigned long hblock_idx)
> {
> 	bool verified;
> 	unsigned int blocks_per_page;
> 	unsigned int i;
> 
> 	if (!vi->hash_block_verified)
> 		return PageChecked(hpage);
> 
> 	spin_lock(&vi->hash_page_init_lock);
> 	if (PageChecked(hpage)) {
> 		verified = test_bit(hblock_idx, vi->hash_block_verified);
> 	} else {
> 		blocks_per_page = vi->tree_params.blocks_per_page;
> 		hblock_idx = round_down(hblock_idx, blocks_per_page);
> 		for (i = 0; i < blocks_per_page; i++)
> 			clear_bit(hblock_idx + i, vi->hash_block_verified);
> 		SetPageChecked(hpage);
> 		verified = false;
> 	}
> 	spin_unlock(&vi->hash_page_init_lock);
> 	return verified;
> }
> 
> As you wrote in the comment [2] the spinlock is needed to set bitmap
> and PG_checked together. But why do we need spinlock? Isn't memory
> barrier between 'for loop' and SetPageChecked() enough?
> 
> 		...
> 		for (i = 0; i < blocks_per_page; i++)
> 			clear_bit(hblock_idx + i, vi->hash_block_verified);
> 		smp_wmb();
> 		SetPageChecked(hpage);
> 		...
> 
> Even if two threads get into PG_checked == 0 case they will clear
> bits and set page flag. The only requirement, I can see, is order
> that page flag is set after bitmap bits, so, no other threads will
> skip blocks which were evicted from memory but still have bit set to
> 1. As we clear bits we won't get false positive for not verified
> block.
> 
> Other threads, which already passed verification and want to set bit
> to 1 won't be affected by any of this; as they do verification they
> have a reference to page, therefore, PG_checked was already set for
> them.
> 
> Maybe I'm missing a case where things can go bad? Can you describe
> in more details why you used spinklock here?
> 
> Thanks,
> Andrey
> 
> [1]: https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git/tree/fs/verity/verify.c#n19
> [2]: https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git/tree/fs/verity/verify.c#n39

I think you're correct that the spin lock isn't actually needed, considering
that all the operations are atomic and are properly ordered.  It does seem a
little weird that without the spinlock, one thread can be clearing a block's
verified bit concurrently with another thread setting it.  (That can happen if
the threads enter is_hash_block_verified() at the same time and both see
!PageChecked, and then one thread gets scheduled out before it clears the bits.)
But it works out because at worst the block gets verified more than once.  That
case should be super rare, so removing the spinlock should be better
performance-wise.  Are you interested in sending a patch that does that?

- Eric
