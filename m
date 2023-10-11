Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C9576124;
	Wed, 11 Oct 2023 03:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GpdinCFP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B577FC433C7;
	Wed, 11 Oct 2023 03:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696994234;
	bh=V79xg3KCT1tQ1nUFhjdvmntXaR26mB3eZLNiDgp6tK8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GpdinCFPfQ2tNBR1EQsWXu0GsoKYcNSFmUGLV2kS7QtJZU3Ciq1pDzaWabKVFjxax
	 mpG7wRfKW03+bDcIYcn+hfPg76cHgpzN/T8v8F/tV8vlVA54fLenAjMgoNz01elX3C
	 R2h55LGMm+s8+x96CgLZXCgQXRHaaHmRdF1LFMFgg9hObPMSBwa5JQtn3cDc8eqtTJ
	 EkkRzsXNRoSJMxkhSg9AiRgkAtU1L/mZIhbo0L2tGb5rcppy1OQBNE/8SUIxLWAas7
	 0V1/LJ4tiEh7QA1WTxDxvW+IbABq3Zens9UGwo/mEQdmveem1jmGX0cjliQD2Fhs2C
	 ynEUp9q/6aqcQ==
Date: Tue, 10 Oct 2023 20:17:12 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Andrey Albershteyn <aalbersh@redhat.com>
Cc: linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	fsverity@lists.linux.dev, djwong@kernel.org, david@fromorbit.com,
	dchinner@redhat.com
Subject: Re: [PATCH v3 08/28] fsverity: pass Merkle tree block size to
 ->read_merkle_tree_page()
Message-ID: <20231011031712.GC1185@sol.localdomain>
References: <20231006184922.252188-1-aalbersh@redhat.com>
 <20231006184922.252188-9-aalbersh@redhat.com>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231006184922.252188-9-aalbersh@redhat.com>

On Fri, Oct 06, 2023 at 08:49:02PM +0200, Andrey Albershteyn wrote:
> diff --git a/include/linux/fsverity.h b/include/linux/fsverity.h
> index 6514ed6b09b4..252b2668894c 100644
> --- a/include/linux/fsverity.h
> +++ b/include/linux/fsverity.h
> @@ -103,7 +103,8 @@ struct fsverity_operations {
>  	 */
>  	struct page *(*read_merkle_tree_page)(struct inode *inode,
>  					      pgoff_t index,
> -					      unsigned long num_ra_pages);
> +					      unsigned long num_ra_pages,
> +					      u8 log_blocksize);

XFS doesn't actually use this, though.  In patch 10 you add
read_merkle_tree_block, and that is used instead.

So this patch seems unnecessary.

- Eric
