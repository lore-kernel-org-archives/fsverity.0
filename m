Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC0B38DE9
	for <fsverity@lists.linux.dev>; Wed, 20 Mar 2024 10:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710931056; cv=none; b=mFAf91fU53FeR9JZsZq6JpSZZQOtJ7EqeLwzH/8oY7gloQ9/m4sceJoasvuZk+1OhMTZTYdPN3yZrFpZocbQ/kh6PNNG4yUfsmx7/JPbd4UuDmPP39oD+shaGE2Dt23RbCcDy+TKVSX5jz+TvFplLFY4hVUlc9cliLqyccItxbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710931056; c=relaxed/simple;
	bh=9UYs4ZwejA0f5HPmQh6g5I9ponZ+C0/FZF4IS9lsAzM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=er7TfAHuUXSsC6gobcFsgnQiCyQdhBVDYQFza3XLmZ0IlB6zhnkmjAXOaT7l6aJsGuTzqkiiLS0mvodrf1KbEoiPNR1go1bCMTetlbBfwlhfwxq0/0AKVORQ2VIsZGoM2ePUEyO5l/DLVur9nR6H5xbqMHKignUJEixZoC+qC28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=irOxKMZv; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="irOxKMZv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710931053;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ADJP39t1GFmXzKGwztEyWbu3Yu1GQbVpqFj8SngTSA0=;
	b=irOxKMZvknRAEvnJ6eqlPEvWWot60ztPvaVBRFJejWzIczMGPSqvFoo5Vs4RZzMcDYckbN
	lc2EC15eZf0+4rWwIocp59QB+HsOaIQ/qHvlQREwkl9NUmLZTG4EkSlsA1r0108gA2LniI
	H1/3Uk54zxIG5FX8mc3CJiVb/FGLHr4=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-176-W5UF5en4P_GWK1OMIY9sjw-1; Wed, 20 Mar 2024 06:37:32 -0400
X-MC-Unique: W5UF5en4P_GWK1OMIY9sjw-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a4698fc37dfso303280866b.2
        for <fsverity@lists.linux.dev>; Wed, 20 Mar 2024 03:37:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710931050; x=1711535850;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ADJP39t1GFmXzKGwztEyWbu3Yu1GQbVpqFj8SngTSA0=;
        b=JYPK/1f15aauOPNfKfL1G03m6ssq1T/PfaU8x53l2F2PzsUOSLIJTO2WVpuzq908k6
         SEABgVPg8suT7W6O5WpYeYIp3G3mszHoSJ0kfaRVKLbb2xNz0UXZyQT8+0cDrzutC4U+
         q8Z/kQSFunxnclg6bw1Bk5SqW3uUGEVINq98l+n8o+GJq9CPGy3DX1iKqv5uWUfcDD/q
         LYPUNzkFWvOWe0ayJvk6Z6gOmHQqzDDSgRben0UgQu5QdZsKAsWUiBso4rtlbnsVyg4E
         +5FJnRo47xOOaj4hZ4b3+sRfn3upU3gfMqEbpgeWRlL4oZt8EfebVw3IseYnReqNkFW9
         6ZhA==
X-Forwarded-Encrypted: i=1; AJvYcCV3lmUwrZymNJOQ/JYjYFigG4jcv0jwbNtLYBTmQuEymQFrgjUiYTAH4NX4BfBER2oV+Pe7agQufXg+L4jqyUzYhpZiNdwpgPs=
X-Gm-Message-State: AOJu0YxVLcQZ6sx3ewMLB3cBj6amI+w6B+LOG1uR0aQQL+3tBupzXBy9
	MH36oyvxZmhKiULSlEl3gcH+Mi31V5fJsKSPhKDBlMr3KZDAk2kHfKEzy1A2v2Ikj/ELozOc+m2
	t8fVJhvOX3oDGHIhn/WxvOCfiQ23OERmW7J+jA5AE647yKu9quP20bdsg4qla59Y=
X-Received: by 2002:a17:907:6d0d:b0:a46:a927:115e with SMTP id sa13-20020a1709076d0d00b00a46a927115emr10378525ejc.39.1710931050413;
        Wed, 20 Mar 2024 03:37:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGIJTAG9ko72Loy57po7F4TUY1dy0JWk8zC92Uf2ucyNg7WDekar5E7XdbMe/WRMTnJxVjXFg==
X-Received: by 2002:a17:907:6d0d:b0:a46:a927:115e with SMTP id sa13-20020a1709076d0d00b00a46a927115emr10378499ejc.39.1710931049760;
        Wed, 20 Mar 2024 03:37:29 -0700 (PDT)
Received: from thinky ([109.183.6.197])
        by smtp.gmail.com with ESMTPSA id wr6-20020a170907700600b00a4623030893sm7019903ejb.126.2024.03.20.03.37.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Mar 2024 03:37:29 -0700 (PDT)
Date: Wed, 20 Mar 2024 11:37:28 +0100
From: Andrey Albershteyn <aalbersh@redhat.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: ebiggers@kernel.org, linux-fsdevel@vger.kernel.org, 
	fsverity@lists.linux.dev, linux-xfs@vger.kernel.org
Subject: Re: [PATCH 08/29] fsverity: add per-sb workqueue for post read
 processing
Message-ID: <ktc3ofsctond43xfc3lerr4evy3a3hsclyxm24cmhf7fsxxfsw@gjqnq57cbeoy>
References: <171035223299.2613863.12196197862413309469.stgit@frogsfrogsfrogs>
 <171035223488.2613863.7583467519759571221.stgit@frogsfrogsfrogs>
 <20240319233010.GV1927156@frogsfrogsfrogs>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20240319233010.GV1927156@frogsfrogsfrogs>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2024-03-19 16:30:10, Darrick J. Wong wrote:
> On Wed, Mar 13, 2024 at 10:54:39AM -0700, Darrick J. Wong wrote:
> > From: Andrey Albershteyn <aalbersh@redhat.com>
> > 
> > For XFS, fsverity's global workqueue is not really suitable due to:
> > 
> > 1. High priority workqueues are used within XFS to ensure that data
> >    IO completion cannot stall processing of journal IO completions.
> >    Hence using a WQ_HIGHPRI workqueue directly in the user data IO
> >    path is a potential filesystem livelock/deadlock vector.
> > 
> > 2. The fsverity workqueue is global - it creates a cross-filesystem
> >    contention point.
> > 
> > This patch adds per-filesystem, per-cpu workqueue for fsverity
> > work. This allows iomap to add verification work in the read path on
> > BIO completion.
> > 
> > Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
> > Reviewed-by: Darrick J. Wong <djwong@kernel.org>
> > Signed-off-by: Darrick J. Wong <djwong@kernel.org>
> > ---
> >  fs/super.c               |    7 +++++++
> >  include/linux/fs.h       |    2 ++
> >  include/linux/fsverity.h |   22 ++++++++++++++++++++++
> >  3 files changed, 31 insertions(+)
> > 
> > 
> > diff --git a/fs/super.c b/fs/super.c
> > index d35e85295489..338d86864200 100644
> > --- a/fs/super.c
> > +++ b/fs/super.c
> > @@ -642,6 +642,13 @@ void generic_shutdown_super(struct super_block *sb)
> >  			sb->s_dio_done_wq = NULL;
> >  		}
> >  
> > +#ifdef CONFIG_FS_VERITY
> > +		if (sb->s_read_done_wq) {
> > +			destroy_workqueue(sb->s_read_done_wq);
> > +			sb->s_read_done_wq = NULL;
> > +		}
> > +#endif
> > +
> >  		if (sop->put_super)
> >  			sop->put_super(sb);
> >  
> > diff --git a/include/linux/fs.h b/include/linux/fs.h
> > index ed5966a70495..9db24a825d94 100644
> > --- a/include/linux/fs.h
> > +++ b/include/linux/fs.h
> > @@ -1221,6 +1221,8 @@ struct super_block {
> >  #endif
> >  #ifdef CONFIG_FS_VERITY
> >  	const struct fsverity_operations *s_vop;
> > +	/* Completion queue for post read verification */
> > +	struct workqueue_struct *s_read_done_wq;
> >  #endif
> >  #if IS_ENABLED(CONFIG_UNICODE)
> >  	struct unicode_map *s_encoding;
> > diff --git a/include/linux/fsverity.h b/include/linux/fsverity.h
> > index 0973b521ac5a..45b7c613148a 100644
> > --- a/include/linux/fsverity.h
> > +++ b/include/linux/fsverity.h
> > @@ -241,6 +241,22 @@ void fsverity_enqueue_verify_work(struct work_struct *work);
> >  void fsverity_invalidate_block(struct inode *inode,
> >  		struct fsverity_blockbuf *block);
> >  
> > +static inline int fsverity_set_ops(struct super_block *sb,
> > +				   const struct fsverity_operations *ops)
> > +{
> > +	sb->s_vop = ops;
> > +
> > +	/* Create per-sb workqueue for post read bio verification */
> > +	struct workqueue_struct *wq = alloc_workqueue(
> > +		"pread/%s", (WQ_FREEZABLE | WQ_MEM_RECLAIM), 0, sb->s_id);
> 
> Looking at this more closely, why is it that the fsverity_read_queue
> is unbound and tagged WQ_HIGHPRI, whereas this one is instead FREEZEABLE
> and MEM_RECLAIM and bound?
> 
> If it's really feasible to use /one/ workqueue for all the read
> post-processing then this ought to be a fs/super.c helper ala
> sb_init_dio_done_wq.  That said, from Eric's comments on the v5 thread
> about fsverity and fscrypt locking horns over workqueue stalls I'm not
> convinced that's true.

There's good explanation by Dave why WQ_HIGHPRI is not a good fit
for XFS (potential livelock/deadlock):

https://lore.kernel.org/linux-xfs/20221214054357.GI3600936@dread.disaster.area/

Based on his feedback I changed it to per-filesystem.

-- 
- Andrey

