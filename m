Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 467171F5ED
	for <fsverity@lists.linux.dev>; Wed, 11 Oct 2023 13:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jGoOLywZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697029444;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vcjxFApevYb82qtuqxNQX9mHDiHm2BlEhPt3ZccGP80=;
	b=jGoOLywZHt5KVsZQlbA04IYLDU5cwVjd2lT6ku0xC1zq1hzxtDsRg7OwKpfXZIKELWSakX
	6fFAt5Qovhlrfh/wBk5x3tU3HwCr3Wi8vV/HJ6F6xuZqO5V+ERaZ+WxEb+MqmecW6rq0Wt
	X29UMY3As/gsnqFesloh/Ud3VPeCMFM=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-554-poK3oIo-NZ-fm1nofQpn6g-1; Wed, 11 Oct 2023 09:03:57 -0400
X-MC-Unique: poK3oIo-NZ-fm1nofQpn6g-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-53bc1e80999so1103703a12.1
        for <fsverity@lists.linux.dev>; Wed, 11 Oct 2023 06:03:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697029437; x=1697634237;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vcjxFApevYb82qtuqxNQX9mHDiHm2BlEhPt3ZccGP80=;
        b=LpHGa2kKmhxkBB4two/GyiZQmZE+iPP6qpRNkL2JLrfviyqqnaTG/uiXaCfbSD8cWy
         MFf19Xz4pHvSMbqh8iYuWt2WVymi01+pFSpaKuOejbmeTli8US2PjIXezEva2S4j1n29
         dsiIfWPQS5V8zR0C0LW1TcoqTZp8eBUe16RSvmczmt5HfzpYp/XOyZ8e24sJtFcdTHqI
         EO/vk0hs8qBYOxiaS+0V2vAbsCQjcgKdRdzhI48MTxyTC08jxT0CBCYnSP7gaBCB55Xt
         rgTedVVZJO87zAhdr6MqU5EPvD/UomEXPCopuz9GE6mdxSpxOzdxZXfuxQoSn3lBPif1
         gKQg==
X-Gm-Message-State: AOJu0YwqHZUgKwo7Rohgh0PFquNYtbHrh3iqgtds1YZcVKkI5A8n6r2Q
	fPblFKIDA/XQhMDrKRyKqbdoMOPwIc9sUMzWAd4zsX/SYbra+2Ura+fA4xJpW6xgU+a/ZLmDLGY
	Muo9hgvOlzmsjca2ZEQ==
X-Received: by 2002:a05:6402:22a2:b0:52f:86a1:3861 with SMTP id cx2-20020a05640222a200b0052f86a13861mr16163325edb.7.1697029436839;
        Wed, 11 Oct 2023 06:03:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZEvueQYrwAAq5x464YyQHDNKA6a56GKCk88BLyTHffcIh2aUnXX9p1BjNOaOf1lgPTbG4wg==
X-Received: by 2002:a05:6402:22a2:b0:52f:86a1:3861 with SMTP id cx2-20020a05640222a200b0052f86a13861mr16163315edb.7.1697029436539;
        Wed, 11 Oct 2023 06:03:56 -0700 (PDT)
Received: from thinky ([109.183.6.197])
        by smtp.gmail.com with ESMTPSA id cw2-20020a056402228200b0053dea07b669sm467377edb.87.2023.10.11.06.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 06:03:56 -0700 (PDT)
Date: Wed, 11 Oct 2023 15:03:55 +0200
From: Andrey Albershteyn <aalbersh@redhat.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	fsverity@lists.linux.dev, djwong@kernel.org, david@fromorbit.com, dchinner@redhat.com
Subject: Re: [PATCH v3 07/28] fsverity: always use bitmap to track verified
 status
Message-ID: <q75t2etmyq2zjskkquikatp4yg7k2yoyt4oab4grhlg7yu4wyi@6eax4ysvavyk>
References: <20231006184922.252188-1-aalbersh@redhat.com>
 <20231006184922.252188-8-aalbersh@redhat.com>
 <20231011031543.GB1185@sol.localdomain>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20231011031543.GB1185@sol.localdomain>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2023-10-10 20:15:43, Eric Biggers wrote:
> On Fri, Oct 06, 2023 at 08:49:01PM +0200, Andrey Albershteyn wrote:
> > The bitmap is used to track verified status of the Merkle tree
> > blocks which are smaller than a PAGE. Blocks which fits exactly in a
> > page - use PageChecked() for tracking "verified" status.
> > 
> > This patch switches to always use bitmap to track verified status.
> > This is needed to move fs-verity away from page management and work
> > only with Merkle tree blocks.
> 
> How complicated would it be to keep supporting using the page bit when
> merkle_tree_block_size == page_size and the filesystem supports it?  It's an
> efficient solution, so it would be a shame to lose it.  Also it doesn't have the
> max file size limit that the bitmap has.

Well, I think it's possible but my motivation was to step away from
page manipulation as much as possible with intent to not affect other
filesystems too much. I can probably add handling of this case to
fsverity_read_merkle_tree_block() but fs/verity still will create
bitmap and have a limit. The other way is basically revert changes
done in patch 09, then, it probably will be quite a mix of page/block
handling in fs/verity/verify.c

> > Also, this patch removes spinlock. The lock was used to reset bits
> > in bitmap belonging to one page. This patch works only with one
> > Merkle tree block and won't reset other blocks status.
> 
> The spinlock is needed when there are multiple Merkle tree blocks per page and
> the filesystem is using the page-based caching.  So I don't think you can remove
> it.  Can you elaborate on why you feel it can be removed?

With this patch is_hash_block_verified() doesn't reset bits for
blocks belonging to the same page. Even if page is re-instantiated
only one block is checked in this case. So, when other blocks are
checked they are reset.

	if (block_cached)
		return test_bit(hblock_idx, vi->hash_block_verified);

> > -	if (PageChecked(hpage)) {
> > -		/*
> > -		 * A read memory barrier is needed here to give ACQUIRE
> > -		 * semantics to the above PageChecked() test.
> > -		 */
> > -		smp_rmb();
> > +	if (block_cached)
> >  		return test_bit(hblock_idx, vi->hash_block_verified);
> 
> It's not clear what block_cached is supposed to mean here.

If block was re-instantiated or was in cache. I can try to come up
with better name.

-- 
- Andrey

