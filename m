Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F495240
	for <fsverity@lists.linux.dev>; Mon, 12 Jun 2023 19:09:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10BCAC433EF;
	Mon, 12 Jun 2023 19:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686596986;
	bh=z7Qll7wruvbMSWdRadY39Fbgr4QmI9bZ6PSh0JewKao=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Kq23+ogWVwqQLozKTxDoU/C8HsUvyH8ypL2joJlZwKAp0uoI5J3FFrKDUDLDg3G2D
	 UweKZB3RgO460wPWkd3yGDLkXCjl1D6MeOGmzXK3BGSP1OfdPtpKYOoaaJ16jOgPPA
	 Wuqc+FEAxYYqCJs5zpDZu7J9g/3D6yCNnQUt39N6DkON1ZJj6mY/7dUwTsUc3T75Hg
	 qmFHbg10oTH/sp17cTYphkKB3KMsziF5xvbZyBO1BZvuD7adsiSyTzYjXOLuv5bNwu
	 449qTFlldutzHhYeYfi32WzkaRt0k3Q/SJqkaIEb5h8oqz+RpPOgEPf+bzWrsx8bhq
	 fsfICYTY8jUdw==
Date: Mon, 12 Jun 2023 12:09:44 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Alexander Larsson <alexl@redhat.com>
Cc: miklos@szeredi.hu, linux-unionfs@vger.kernel.org, amir73il@gmail.com,
	tytso@mit.edu, fsverity@lists.linux.dev
Subject: Re: [PATCH v3 3/4] ovl: Validate verity xattr when resolving
 lowerdata
Message-ID: <20230612190944.GB847@sol.localdomain>
References: <cover.1686565330.git.alexl@redhat.com>
 <dd294a44e8f401e6b5140029d8355f88748cd8fd.1686565330.git.alexl@redhat.com>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dd294a44e8f401e6b5140029d8355f88748cd8fd.1686565330.git.alexl@redhat.com>

On Mon, Jun 12, 2023 at 12:28:17PM +0200, Alexander Larsson wrote:
> +int ovl_validate_verity(struct ovl_fs *ofs,
> +			struct path *metapath,
> +			struct path *datapath)
> +{
> +	u8 xattr_data[1+FS_VERITY_MAX_DIGEST_SIZE];
> +	u8 actual_digest[FS_VERITY_MAX_DIGEST_SIZE];
> +	enum hash_algo verity_algo;
> +	int xattr_len;
> +	int err;
> +
> +	if (!ofs->config.verity ||
> +	    /* Verity only works on regular files */
> +	    !S_ISREG(d_inode(metapath->dentry)->i_mode))
> +		return 0;
> +
> +	xattr_len = sizeof(xattr_data);
> +	err = ovl_get_verity_xattr(ofs, metapath, xattr_data, &xattr_len);
> +	if (err == -ENODATA) {
> +		if (ofs->config.require_verity) {
> +			pr_warn_ratelimited("metacopy file '%pd' has no overlay.verity xattr\n",
> +					    metapath->dentry);
> +			return -EIO;
> +		}
> +		return 0;
> +	}
> +	if (err < 0)
> +		return err;
> +
> +	err = ovl_ensure_verity_loaded(datapath);
> +	if (err < 0) {
> +		pr_warn_ratelimited("lower file '%pd' failed to load fs-verity info\n",
> +				    datapath->dentry);
> +		return -EIO;
> +	}
> +
> +	err = fsverity_get_digest(d_inode(datapath->dentry), actual_digest, &verity_algo);
> +	if (err < 0) {
> +		pr_warn_ratelimited("lower file '%pd' has no fs-verity digest\n", datapath->dentry);
> +		return -EIO;
> +	}
> +
> +	if (xattr_len != 1 + hash_digest_size[verity_algo] ||
> +	    xattr_data[0] != (u8) verity_algo ||
> +	    memcmp(xattr_data+1, actual_digest, xattr_len - 1) != 0) {
> +		pr_warn_ratelimited("lower file '%pd' has the wrong fs-verity digest\n",
> +				    datapath->dentry);
> +		return -EIO;
> +	}
> +
> +	return 0;
> +}

This means the overlayfs verity xattr contains the algorithm ID of the fsverity
digest as a HASH_ALGO_* value.

That works, but I think HASH_ALGO_* is somewhat of an IMA-ism.  fsverity
actually uses FS_VERITY_HASH_ALG_* everywhere else, including in the UAPI and in
fsverity-utils which includes libfsverity
(https://git.kernel.org/pub/scm/fs/fsverity/fsverity-utils.git/tree/include/libfsverity.h).

I'm guessing that you used HASH_ALGO_* not because you really wanted to, but
rather just because it's what fsverity_get_digest() happens to return, as IMA is
currently its only user.

Can you consider
https://lore.kernel.org/r/20230612190047.59755-1-ebiggers@kernel.org which would
make fsverity_get_digest() support both types of IDs?  Then you can use
FS_VERITY_HASH_ALG_*, which I think would make things slightly easier for you.

- Eric
