Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D46438D693
	for <fsverity@lists.linux.dev>; Wed, 25 Mar 2026 08:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774425629; cv=none; b=Cx+lgJ0w6NeEU0Yb6ioZyCcSngo75HVwvn997xbeTn/CqA7lZ7FOIF89w6eQ7YVUdrZp43dj2W2xrgRo3/IWNjNEysFaMXJtyjh4cSoYnpdLZgiHl2zOQ/+Zo4I4Vv5jkAenduu2+FyWUSTIhhV9D0NcnWbqETMEyVcn2FEs5o8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774425629; c=relaxed/simple;
	bh=+TbF8qoqrYiwMId3AG/uImgyCPdiJ26bUJuPjWAn2d8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K6Podp8NrSYBSus6LJ21KycZCOFbwnnzP2FtjvnKL6ma8Q9oQFudXjKna3QUCt0Sb9Pz3K/jn0DDnan/MzplVQAoJKLroCRjGbs6Z7kyf01/ouvMyRHmcc3YIElHA9bAJCHhQNE4LwNnAexG+6uv2uueO+byV/KwpePxrMgQxNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 8FF9C68D0A; Wed, 25 Mar 2026 09:00:22 +0100 (CET)
Date: Wed, 25 Mar 2026 09:00:21 +0100
From: Christoph Hellwig <hch@lst.de>
To: Andrey Albershteyn <aalbersh@kernel.org>
Cc: linux-xfs@vger.kernel.org, fsverity@lists.linux.dev,
	linux-fsdevel@vger.kernel.org, ebiggers@kernel.org, hch@lst.de,
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	linux-btrfs@vger.kernel.org, djwong@kernel.org
Subject: Re: [PATCH v5 07/25] iomap: introduce IOMAP_F_FSVERITY and teach
 writeback to handle fsverity
Message-ID: <20260325080021.GF952@lst.de>
References: <20260319170231.1455553-1-aalbersh@kernel.org> <20260319170231.1455553-8-aalbersh@kernel.org>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260319170231.1455553-8-aalbersh@kernel.org>
User-Agent: Mutt/1.5.17 (2007-11-01)

> @@ -353,9 +353,16 @@ static inline bool iomap_block_needs_zeroing(const struct iomap_iter *iter,
>  {
>  	const struct iomap *srcmap = iomap_iter_srcmap(iter);
>  
> -	return srcmap->type != IOMAP_MAPPED ||
> -		(srcmap->flags & IOMAP_F_NEW) ||
> -		pos >= i_size_read(iter->inode);
> +	if (srcmap->type != IOMAP_MAPPED)
> +		return true;
> +
> +	if (srcmap->flags & IOMAP_F_NEW)
> +		return true;
> +
> +	if (srcmap->flags & IOMAP_F_FSVERITY)
> +		return false;
> +
> +	return pos >= i_size_read(iter->inode);

This might be a good time to document the various reasons for needing
zeroing.

> +/*
> + * IO happens beyond inode EOF, fsverity metadata is stored there
> + */
> +#define IOMAP_F_FSVERITY	(1U << 10)

This comment feels a bit too sparse.  Here is my interpretation of what
this flag does:

/*
 * Indicates reads and writes of fsverity metadata.
 *
 * Fsverity metadata is stored after the regular file data and thus beyond
 * i_size.
 */

