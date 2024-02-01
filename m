Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB9B71A290
	for <fsverity@lists.linux.dev>; Thu,  1 Feb 2024 05:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706765860; cv=none; b=VoEGQXKhSRlfJ6RIgDcWyLNPPURKm4uHpBi9waTMXIUD1tBdjoi8i5ifELo8f21b7UiBHTX9PJu+C0C6fMT/7PfjQsw2hbNzLOOv3I5knh3kwwaDg46GG+rIetX2/GWQRu6XkL9ETIor796ZAAEQxn8Nf/fjXtlTzBCwCXxChW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706765860; c=relaxed/simple;
	bh=t9+RrWSMdR9jA4bG0YMwKkPGIQKQmVve9n6XaQeheLE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K+p76ZHY5I0EjaOY4RCoHI90r9r8XqF0Xxc28whOnmks7XUSIPZMNTFIb30y2asyptutn3bOgPlrsVHO3okEqGpLUrQQsHiXE0F3aE7r+hWkypFYtb2/V6FS2T331IobVSHkfbnx/pRK8U4yAUWwXqG3kSapyv+bpXEuxL4cZ18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oPp/XLqe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oPp/XLqe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 097C6C433C7;
	Thu,  1 Feb 2024 05:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706765860;
	bh=t9+RrWSMdR9jA4bG0YMwKkPGIQKQmVve9n6XaQeheLE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oPp/XLqezM+LIQLxzuIpzLNO5N3IzGye3eI7Kr8QtxaXbuG2Lk5aizeWm/BS5D6PT
	 k4mAG3Mx1QRqeNeoDzy37G4xWxMjHMFGKUEpMV/qv1Zvf3v557k7BTqM39cimKW8R4
	 12zAU3b+qOPzgHNI42Fzob1YFncEuckTdkty4u2zakPpZlCxuBlzP76KHnDhnaCAt4
	 R1QP3X3u+CArcItVGbZxawoZstUn9azXs6Cdvny89LsrDL1jFCjZR1mKXcybsQ9Zc3
	 gIYu6W+uV79Qgudgl573GkbzgXLqVHuwy0ZS008cn4+nLSt2oK7YD74optR4EHAHIy
	 DpKVoCcOakjlQ==
Date: Wed, 31 Jan 2024 21:37:38 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Andrey Albershteyn <aalbersh@redhat.com>
Cc: fsverity@lists.linux.dev
Subject: Re: [PATCH] fsverity: remove hash page spin lock
Message-ID: <20240201053738.GC1526@sol.localdomain>
References: <20240131182021.2730678-1-aalbersh@redhat.com>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240131182021.2730678-1-aalbersh@redhat.com>

On Wed, Jan 31, 2024 at 07:20:23PM +0100, Andrey Albershteyn wrote:
> diff --git a/fs/verity/verify.c b/fs/verity/verify.c
> index 904ccd7e8e16..7759f6dbd16f 100644
> --- a/fs/verity/verify.c
> +++ b/fs/verity/verify.c
> @@ -46,20 +46,25 @@ static bool is_hash_block_verified(struct fsverity_info *vi, struct page *hpage,
>  	 * the hash page is newly instantiated or not.
>  	 *
>  	 * The first thread that sees PG_checked=0 must clear the corresponding
> -	 * bitmap bits, then set PG_checked=1.  This requires a spinlock.  To
> -	 * avoid having to take this spinlock in the common case of
> -	 * PG_checked=1, we start with an opportunistic lockless read.
> +	 * bitmap bits, then set PG_checked=1. The requirement is that
> +	 * PG_checked=1 is set after bits are cleared. Other threads could see
> +	 * the case of bit set to 1 and PG_checked=1 (block is verified and
> +	 * wasn't evicted from memory). This will lead to one of the thread
> +	 * skipping verification of a block. To restrict order of operations
> +	 * memory barrier is used.
> +	 *
> +	 * However, it can happen that two threads get into PG_checked=0
> +	 * section. This is fine as both of them will reset bits to 0 and do
> +	 * same verification job. This is not expected to happen often.
>  	 */
>  	if (PageChecked(hpage)) {
>  		/*
>  		 * A read memory barrier is needed here to give ACQUIRE
>  		 * semantics to the above PageChecked() test.
> +		 *
> +		 * Matching to the smp_wmb() in PG_checked=0
>  		 */
>  		smp_rmb();
> -		return test_bit(hblock_idx, vi->hash_block_verified);
> -	}
> -	spin_lock(&vi->hash_page_init_lock);
> -	if (PageChecked(hpage)) {
>  		verified = test_bit(hblock_idx, vi->hash_block_verified);
>  	} else {
>  		blocks_per_page = vi->tree_params.blocks_per_page;
> @@ -74,7 +79,7 @@ static bool is_hash_block_verified(struct fsverity_info *vi, struct page *hpage,
>  		SetPageChecked(hpage);
>  		verified = false;
>  	}
> -	spin_unlock(&vi->hash_page_init_lock);
> +
>  	return verified;
>  }

Thanks!  I made some changes to the comment to make the explanation more
complete and hopefully easier to understand, and removed the 'verified' variable
which is no longer necessary.  Sent out v2 at
https://lore.kernel.org/fsverity/20240201052813.68380-1-ebiggers@kernel.org.
Let me know if it looks good.

- Eric
