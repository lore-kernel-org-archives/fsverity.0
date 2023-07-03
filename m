Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F7F100BC
	for <fsverity@lists.linux.dev>; Mon,  3 Jul 2023 19:13:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 137E0C433C8;
	Mon,  3 Jul 2023 19:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688411637;
	bh=CbvsmZDkrdm/fPzPiG4ZL3IEqdZ0jPtUXOtt+5MlGYU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fut02a1pni5bf9SKNRG9lXERoOdoBzH+cX8z6LN4dAuSScegw9Dx9/eGgUoTbTRYU
	 ajZXHeflVzFCD/k5B1nmWX2V5uppFJd4eboEuXi+V/UowyvETdKqmVPVBkmCZVXe9b
	 n5CEYykXsvqJVt2nk4jA4m32YYK2Mxghkgxx5+aakc1QKKDxs8x0pmtoMFUQYXq6l4
	 +rygpoFZekiztLO9qLbH96qewr1ieb3THCy2AP9VAF46FRsL4t1I+9EO8nFMV3LQcM
	 4YDMqRHMZLLWTQRFN1agMRcr4kC0BFc+vWw6q+ptKyNAv0PxCqYqPgUcSmb4h3L04a
	 HY11+CeJfEMGw==
Date: Mon, 3 Jul 2023 12:13:55 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Alexander Larsson <alexl@redhat.com>
Cc: miklos@szeredi.hu, linux-unionfs@vger.kernel.org, amir73il@gmail.com,
	tytso@mit.edu, fsverity@lists.linux.dev
Subject: Re: [PATCH v4 2/4] ovl: Add versioned header for overlay.metacopy
 xattr
Message-ID: <20230703191355.GC1194@sol.localdomain>
References: <cover.1687345663.git.alexl@redhat.com>
 <b7a2dfb80e35dda04edd942ad715dc88b784c218.1687345663.git.alexl@redhat.com>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b7a2dfb80e35dda04edd942ad715dc88b784c218.1687345663.git.alexl@redhat.com>

On Wed, Jun 21, 2023 at 01:18:26PM +0200, Alexander Larsson wrote:
> Historically overlay.metacopy was a zero-size xattr, and it's
> existence marked a metacopy file. This change adds a versioned header
> with a flag field, a length and a digest. The initial use-case of this
> will be for validating a fs-verity digest, but the flags field could
> also be used later for other new features.
> 
> ovl_check_metacopy_xattr() now returns the size of the xattr,
> emulating a size of OVL_METACOPY_MIN_SIZE for empty xattrs to
> distinguish it from the no-xattr case.
> 
> Signed-off-by: Alexander Larsson <alexl@redhat.com>
> ---
>  fs/overlayfs/namei.c     | 10 +++++-----
>  fs/overlayfs/overlayfs.h | 24 +++++++++++++++++++++++-
>  fs/overlayfs/util.c      | 37 +++++++++++++++++++++++++++++++++----
>  3 files changed, 61 insertions(+), 10 deletions(-)
> 
> diff --git a/fs/overlayfs/namei.c b/fs/overlayfs/namei.c
> index 57adf911735f..3dd480253710 100644
> --- a/fs/overlayfs/namei.c
> +++ b/fs/overlayfs/namei.c
> @@ -25,7 +25,7 @@ struct ovl_lookup_data {
>  	bool stop;
>  	bool last;
>  	char *redirect;
> -	bool metacopy;
> +	int metacopy;

Should this be called 'metacopy_size' now?

> -		err = ovl_check_metacopy_xattr(OVL_FS(d->sb), &path);
> +		err = ovl_check_metacopy_xattr(OVL_FS(d->sb), &path, NULL);
>  		if (err < 0)
>  			goto out_err;

This part is confusing because variables named 'err' conventionally contain only
0 or a negative errno value.  But this patch makes it possible for
ovl_check_metacopy_xattr() to return a positive size.

- Eric
