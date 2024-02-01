Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB33D15AABD
	for <fsverity@lists.linux.dev>; Thu,  1 Feb 2024 10:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706783125; cv=none; b=Zj2BAp98XDZbmCJY7bRFg67EvOxcqbLB0XkWuhiUjLfLlXqoDshKN7Y5g699iYJOcR0zLU+KrRkSxfGI/0yVIhIS+kKDyEvpRsiFqWZeLJ1gGMhtCVUFqaQf0qqFbSXgWZlrdjW8n2Cg1mNwSzl2S48cpy32kZ8MhuUsZS57Q2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706783125; c=relaxed/simple;
	bh=Sgli+mvEghyxxcrAMgn+BqWLNDfXHM4Mvef9bMKLak4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=qsuLzdEvbVd0YsRddqmwQUCshq3G/KDccaAb7/BZqA/0lN4Ye67e5BYfxeA9c9DuZoAnK4s01iP3afMxoR+T6db6RZNb5/OvN9HAo6o1NqVp3j67k3D2ow/7z602480ETK+7m41crm/W/wnBb0zWY6CzwYKnJlyIig24l0kkVR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YDK2cR2q; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YDK2cR2q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706783122;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jOtf7mtNbAdb12Y7lACWJQQNjQvVvmCDZUHpQwG38sQ=;
	b=YDK2cR2q+sEcDZua0dgb561Y7LV+yqS/OaxTPNWUY1Wi9OcyRQZ5xdDQIzmQXjCtzjuPp4
	KWUw4hdCOjkuDrokxMAMtU8Kka6N5mxvi3rn22BJEG4UlXu8qBj4FXEavslG+/B5dfxyR0
	LxZTTfhPbIkYDVegeo9ZL6myRL0AY0A=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-259-59ViG-J2MmyVYlSompiOwA-1; Thu, 01 Feb 2024 05:25:21 -0500
X-MC-Unique: 59ViG-J2MmyVYlSompiOwA-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-33b12b75b70so277722f8f.3
        for <fsverity@lists.linux.dev>; Thu, 01 Feb 2024 02:25:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706783120; x=1707387920;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jOtf7mtNbAdb12Y7lACWJQQNjQvVvmCDZUHpQwG38sQ=;
        b=PF90AmLEmbP4l71CBafKgYmFzm5QWVpvok922jf6ZPBZAghd8aS+fHrpKXR120Fxlv
         BjPKoqzpdJEjNBY7Aru2KXVGOQkNwMgxT5ZjNGKwZEPW84RhXlm6n855Bo3l3bsdAWNs
         A7E0cBfq400XMSoAYuTZJu5DDhzGf7Ymf1GZJ1vUkTwBmp48dnYd0+qQLQdI4DWZJtI1
         HloPGBnJOa6YGBnzmNlasXl9XfLwp/s3MYNq1RA/GvS5gUlFvbQdvXk7PJNF2BOVscr8
         74yK5eSGWTqu9fbE4sV5A8+Wjd25VURvFbxpnbvgfm3qxitkgt4nBClgB9jo+Am6WdEC
         ByBw==
X-Gm-Message-State: AOJu0Yy5+EnbUjEZbbmi+I/PZHZiTH3mcGOQDpbYu5iV8qD2ehkavswr
	3M68tVmQ+QgcEl6NuJeuyxucNJrbTFsARtgq71Kxmc2GBgI+o4x7gTtuNQjmPzQ1FWkW71oPKwG
	CeBKUGOMm9ZOHY+J8fWEgd9v/COeDnFsCf4UIl8M6OddNvrkTQBQlo+5MIWGuq8o=
X-Received: by 2002:a5d:55cb:0:b0:33b:1624:f15d with SMTP id i11-20020a5d55cb000000b0033b1624f15dmr784402wrw.25.1706783119969;
        Thu, 01 Feb 2024 02:25:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE8vLEadlWIyOXR1PBkukpFIOQTi+A2FnpWa4BYcxEd9rsuuAKCWtecvZ4Gcdgy6ykakLjLeQ==
X-Received: by 2002:a5d:55cb:0:b0:33b:1624:f15d with SMTP id i11-20020a5d55cb000000b0033b1624f15dmr784387wrw.25.1706783119565;
        Thu, 01 Feb 2024 02:25:19 -0800 (PST)
Received: from thinky ([109.183.6.197])
        by smtp.gmail.com with ESMTPSA id ba15-20020a0560001c0f00b0033ae54cdd97sm13456336wrb.100.2024.02.01.02.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 02:25:19 -0800 (PST)
Date: Thu, 1 Feb 2024 11:25:18 +0100
From: Andrey Albershteyn <aalbersh@redhat.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: fsverity@lists.linux.dev
Subject: Re: [PATCH v2] fsverity: remove hash page spin lock
Message-ID: <kkgu2qxuuhrqctuvnttfakojfkumrl6zvdarqpqrw7xqlvqjp4@qhwox5kqi7se>
References: <20240201052813.68380-1-ebiggers@kernel.org>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20240201052813.68380-1-ebiggers@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2024-01-31 21:28:13, Eric Biggers wrote:
> From: Andrey Albershteyn <aalbersh@redhat.com>
> 
> The spin lock is not necessary here as it can be replaced with
> memory barrier which should be better performance-wise.
> 
> When Merkle tree block size differs from page size, in
> is_hash_block_verified() two things are modified during check - a
> bitmap and PG_checked flag of the page.
> 
> Each bit in the bitmap represent verification status of the Merkle
> tree blocks. PG_checked flag tells if page was just re-instantiated
> or was in pagecache. Both of this states are shared between
> verification threads. Page which was re-instantiated can not have
> already verified blocks (bit set in bitmap).
> 
> The spin lock was used to allow only one thread to modify both of
> these states and keep order of operations. The only requirement here
> is that PG_Checked is set strictly after bitmap is updated.
> This way other threads which see that PG_Checked=1 (page cached)
> knows that bitmap is up-to-date. Otherwise, if PG_Checked is set
> before bitmap is cleared, other threads can see bit=1 and therefore
> will not perform verification of that Merkle tree block.
> 
> However, there's still the case when one thread is setting a bit in
> verify_data_block() and other thread is clearing it in
> is_hash_block_verified(). This can happen if two threads get to
> !PageChecked branch and one of the threads is rescheduled before
> resetting the bitmap. This is fine as at worst blocks are
> re-verified in each thread.
> 
> Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
> [ebiggers: improved the comment and removed the 'verified' variable]
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>  fs/verity/fsverity_private.h |  1 -
>  fs/verity/open.c             |  1 -
>  fs/verity/verify.c           | 48 ++++++++++++++++++------------------
>  3 files changed, 24 insertions(+), 26 deletions(-)
> 
> diff --git a/fs/verity/fsverity_private.h b/fs/verity/fsverity_private.h
> index a6a6b27492414..b3506f56e180b 100644
> --- a/fs/verity/fsverity_private.h
> +++ b/fs/verity/fsverity_private.h
> @@ -62,21 +62,20 @@ struct merkle_tree_params {
>   * caches information about the Merkle tree that's needed to efficiently verify
>   * data read from the file.  It also caches the file digest.  The Merkle tree
>   * pages themselves are not cached here, but the filesystem may cache them.
>   */
>  struct fsverity_info {
>  	struct merkle_tree_params tree_params;
>  	u8 root_hash[FS_VERITY_MAX_DIGEST_SIZE];
>  	u8 file_digest[FS_VERITY_MAX_DIGEST_SIZE];
>  	const struct inode *inode;
>  	unsigned long *hash_block_verified;
> -	spinlock_t hash_page_init_lock;
>  };
>  
>  #define FS_VERITY_MAX_SIGNATURE_SIZE	(FS_VERITY_MAX_DESCRIPTOR_SIZE - \
>  					 sizeof(struct fsverity_descriptor))
>  
>  /* hash_algs.c */
>  
>  extern struct fsverity_hash_alg fsverity_hash_algs[];
>  
>  const struct fsverity_hash_alg *fsverity_get_hash_alg(const struct inode *inode,
> diff --git a/fs/verity/open.c b/fs/verity/open.c
> index 6c31a871b84bc..fdeb95eca3af3 100644
> --- a/fs/verity/open.c
> +++ b/fs/verity/open.c
> @@ -232,21 +232,20 @@ struct fsverity_info *fsverity_create_info(const struct inode *inode,
>  			vi->tree_params.tree_pages <<
>  			vi->tree_params.log_blocks_per_page;
>  
>  		vi->hash_block_verified = kvcalloc(BITS_TO_LONGS(num_bits),
>  						   sizeof(unsigned long),
>  						   GFP_KERNEL);
>  		if (!vi->hash_block_verified) {
>  			err = -ENOMEM;
>  			goto fail;
>  		}
> -		spin_lock_init(&vi->hash_page_init_lock);
>  	}
>  
>  	return vi;
>  
>  fail:
>  	fsverity_free_info(vi);
>  	return ERR_PTR(err);
>  }
>  
>  void fsverity_set_info(struct inode *inode, struct fsverity_info *vi)
> diff --git a/fs/verity/verify.c b/fs/verity/verify.c
> index 904ccd7e8e162..4fcad0825a120 100644
> --- a/fs/verity/verify.c
> +++ b/fs/verity/verify.c
> @@ -12,21 +12,20 @@
>  
>  static struct workqueue_struct *fsverity_read_workqueue;
>  
>  /*
>   * Returns true if the hash block with index @hblock_idx in the tree, located in
>   * @hpage, has already been verified.
>   */
>  static bool is_hash_block_verified(struct fsverity_info *vi, struct page *hpage,
>  				   unsigned long hblock_idx)
>  {
> -	bool verified;
>  	unsigned int blocks_per_page;
>  	unsigned int i;
>  
>  	/*
>  	 * When the Merkle tree block size and page size are the same, then the
>  	 * ->hash_block_verified bitmap isn't allocated, and we use PG_checked
>  	 * to directly indicate whether the page's block has been verified.
>  	 *
>  	 * Using PG_checked also guarantees that we re-verify hash pages that
>  	 * get evicted and re-instantiated from the backing storage, as new
> @@ -36,53 +35,54 @@ static bool is_hash_block_verified(struct fsverity_info *vi, struct page *hpage,
>  		return PageChecked(hpage);
>  
>  	/*
>  	 * When the Merkle tree block size and page size differ, we use a bitmap
>  	 * to indicate whether each hash block has been verified.
>  	 *
>  	 * However, we still need to ensure that hash pages that get evicted and
>  	 * re-instantiated from the backing storage are re-verified.  To do
>  	 * this, we use PG_checked again, but now it doesn't really mean
>  	 * "checked".  Instead, now it just serves as an indicator for whether
> -	 * the hash page is newly instantiated or not.
> +	 * the hash page is newly instantiated or not.  If the page is new, as
> +	 * indicated by PG_checked=0, we clear the bitmap bits for the page's
> +	 * blocks since they are untrustworthy, then set PG_checked=1.
> +	 * Otherwise we return the bitmap bit for the requested block.
>  	 *
> -	 * The first thread that sees PG_checked=0 must clear the corresponding
> -	 * bitmap bits, then set PG_checked=1.  This requires a spinlock.  To
> -	 * avoid having to take this spinlock in the common case of
> -	 * PG_checked=1, we start with an opportunistic lockless read.
> +	 * Multiple threads may execute this code concurrently on the same page.
> +	 * This is safe because we use memory barriers to ensure that if a
> +	 * thread sees PG_checked=1, then it also sees the associated bitmap
> +	 * clearing to have occurred.  Also, all writes and their corresponding
> +	 * reads are atomic, and all writes are safe to repeat in the event that
> +	 * multiple threads get into the PG_checked=0 section.  (Clearing a
> +	 * bitmap bit again at worst causes a hash block to be verified
> +	 * redundantly.  That event should be very rare, so it's not worth using
> +	 * a lock to avoid.  Setting PG_checked again has no effect.)

Thanks! That's much more clear now. LGTM
Reviewed-by: Andrey Albershteyn <aalbersh@redhat.com>

-- 
- Andrey

