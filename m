Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08FD6100C6
	for <fsverity@lists.linux.dev>; Mon,  3 Jul 2023 19:24:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35B31C433C7;
	Mon,  3 Jul 2023 19:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688412276;
	bh=24gB9uuPVMuPz9sNUw7Be/LhVJMoNfTXJbJI9B/QOEw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KvgfO2DdoSbye16XkswC3wWkB5rPSZ4yJ8iyC/2ijq5hhJiPjJqXj9L6RmRon0LyA
	 Zv9ez0fQ69FyewP/iPFoDIroWy7wmUfAw03NVAQ9RUQIeJaikaxO/vWlD0v1XkrPRo
	 1tLLoHgMKst78DHH4c1dFN05Emlo6ltIfGm9pk8MxY6UojeC9m6j1SJyGWF/i/NlbN
	 fA08XPXrDCXZl/QVfnYt3+3KJlreOQQXHTvzRqMjxqmNDtckBaaC7OZbxOHqygaOcj
	 MwrNaZ8wVdqGg5iI233M59YPUsnEztdFtawV4AcajEux7kl1yl9KJMFSrTy5XzM2iB
	 r/a0jOGTtSgOg==
Date: Mon, 3 Jul 2023 12:24:34 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Alexander Larsson <alexl@redhat.com>
Cc: miklos@szeredi.hu, linux-unionfs@vger.kernel.org, amir73il@gmail.com,
	tytso@mit.edu, fsverity@lists.linux.dev
Subject: Re: [PATCH v4 3/4] ovl: Validate verity xattr when resolving
 lowerdata
Message-ID: <20230703192434.GD1194@sol.localdomain>
References: <cover.1687345663.git.alexl@redhat.com>
 <5dfdecee8f0260729c4a8e8150587f128a731ccb.1687345663.git.alexl@redhat.com>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5dfdecee8f0260729c4a8e8150587f128a731ccb.1687345663.git.alexl@redhat.com>

On Wed, Jun 21, 2023 at 01:18:27PM +0200, Alexander Larsson wrote:
> +static int ovl_ensure_verity_loaded(struct path *datapath)
> +{
> +	struct inode *inode = d_inode(datapath->dentry);
> +	const struct fsverity_info *vi;
> +	struct file *filp;
> +
> +	vi = fsverity_get_info(inode);
> +	if (vi == NULL && IS_VERITY(inode)) {

Can you please use '!fsverity_active(inode)' instead of
'fsverity_get_info(inode) == NULL'?  The result is exactly the same, but
fsverity_active() is the intended "API" for code outside fs/verity/.
fsverity_get_info() is in the header only because fsverity_active() calls it.

Same comment in ovl_need_meta_copy_up().

- Eric
