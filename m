Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9844A12FF6B
	for <fsverity@lists.linux.dev>; Fri, 16 Feb 2024 16:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708100971; cv=none; b=FYJZuNE2xj40TYchbaZCjwrO7o2LLQXLmcf6hN8mODRf2Z7H48oQOuB9HN27JH6fQGDB+7IlQemDwdTBDNUBd0ogxiMVUiXl0WgeiZQFZ3xLsuiilxb7yC0+nqWbtdUOEPJmxZHW15KQcFblK8sCQVpeSeurptmphAzKXXgAhTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708100971; c=relaxed/simple;
	bh=dvdlmbjlJ3GuRDZvLi0MzRL4py/dv5/OnvQNiFXPi74=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=AWHW/YuIjo5cILQPRJv7kbQzTZAwi2MpLisj/sOUcE3XLQ7wVjiZ1MGBgaJenx2/XILRUn+2AyxoXBbTA16o26lDMmdsHxLilkyk+DjMtTlpx4NrZIO5HS4CK5IViGoPlYZ+TqhKp7Jr8dMoGklU9YQb3leCvsOo92i/7Vs6Xrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=G3atNjUf; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="G3atNjUf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708100968;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pa/Tudz7G/ijD1sfm+x8tYnDVUPDFcVz5YLbnbE9neI=;
	b=G3atNjUfzFObXRPKYsg3mSJEY//CBCoYZ6mElqiKcN7X8UOzf2EWEOpKJdWA3jgPgyK2+6
	+SEKejDwTvsCVK4nK01or6KA+XupwcxXFrEDcJ/pUGh2n8MOIx+xM48MJi47Rxs5caGyWE
	Gu+2l8gv/kdvmavEdyfHdBEXeh6+62Y=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-52-lb7PjWrnPVOK6Bt53GqzTg-1; Fri, 16 Feb 2024 11:29:26 -0500
X-MC-Unique: lb7PjWrnPVOK6Bt53GqzTg-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-563e2fec088so610512a12.0
        for <fsverity@lists.linux.dev>; Fri, 16 Feb 2024 08:29:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708100964; x=1708705764;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pa/Tudz7G/ijD1sfm+x8tYnDVUPDFcVz5YLbnbE9neI=;
        b=D+1E1V28OuQmo/MYh+TryZzsQwVqnjkZFdkQxjz9mKjJzNwlsJxcfQ2sZ8CbMx9Hc4
         MdzSBpnnAXMUp5yqab/KKws07VcUwfVsJZ52kt7ZhBYlaW/lTWsEYzy5Z6EuAMdYjzlI
         3Xo41Dj1JemqoB7UOBjQlIbKr9iKLFdN9jIwWrvWPCtGmI891FRa2Jw4U4mVhdXXFYmf
         rxGpwj9l1L1o5VX3inHtLGtNgO5XpQ3tENJop76D+Iuj7w+F/byDaQ8LTyQkrNYSKyVv
         hOPHJuIqhm33sAEqYeI5Xbcp3nrCy4O7PvNQV+C600givXa4rUL/3rON+cerGi1zKmXv
         4MOQ==
X-Gm-Message-State: AOJu0YxfD9sq0ReK8RtA4+WcU6wCWA3iAd2hgZVXfiEr3ImMbR6c5oAE
	7wWnrmW1KoWZpfkuICtIDSDO8FZ8DEk75z183N9rCzvRKOPROAHZQl+k95yHUj1NyAZUL60K9UW
	dRBqCXijw96hsSCC6+/SazZqNqTKEiCiKrKAZtM5Mo+1j2HrP7EfvzLU=
X-Received: by 2002:aa7:ce09:0:b0:564:154:6802 with SMTP id d9-20020aa7ce09000000b0056401546802mr883578edv.40.1708100964656;
        Fri, 16 Feb 2024 08:29:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE4jRXgtyh73ev3q/+fw3PvRMngLjahNFvkiBdPMAbULHS6c6Fgzuo2+wM7TJ0hQ9xOZBksAw==
X-Received: by 2002:aa7:ce09:0:b0:564:154:6802 with SMTP id d9-20020aa7ce09000000b0056401546802mr883574edv.40.1708100964330;
        Fri, 16 Feb 2024 08:29:24 -0800 (PST)
Received: from thinky ([109.183.6.197])
        by smtp.gmail.com with ESMTPSA id b17-20020aa7d491000000b00563ffa219b5sm119760edr.97.2024.02.16.08.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 08:29:24 -0800 (PST)
Date: Fri, 16 Feb 2024 17:29:23 +0100
From: Andrey Albershteyn <aalbersh@redhat.com>
To: Dave Chinner <david@fromorbit.com>
Cc: fsverity@lists.linux.dev, linux-xfs@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, chandan.babu@oracle.com, djwong@kernel.org, ebiggers@kernel.org
Subject: Re: [PATCH v4 13/25] xfs: introduce workqueue for post read IO work
Message-ID: <5frc5j7vce6q3hfjmhow3dk7zmmndzxjdxvda4uqjociws7x52@4rjglu2e3x7d>
References: <20240212165821.1901300-1-aalbersh@redhat.com>
 <20240212165821.1901300-14-aalbersh@redhat.com>
 <Zc6MHxQ0PTJ7Qck0@dread.disaster.area>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <Zc6MHxQ0PTJ7Qck0@dread.disaster.area>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2024-02-16 09:11:43, Dave Chinner wrote:
> On Mon, Feb 12, 2024 at 05:58:10PM +0100, Andrey Albershteyn wrote:
> > As noted by Dave there are two problems with using fs-verity's
> > workqueue in XFS:
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
> > work.
> > 
> > Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
> > ---
> >  fs/xfs/xfs_aops.c  | 15 +++++++++++++--
> >  fs/xfs/xfs_linux.h |  1 +
> >  fs/xfs/xfs_mount.h |  1 +
> >  fs/xfs/xfs_super.c |  9 +++++++++
> >  4 files changed, 24 insertions(+), 2 deletions(-)
> > 
> > diff --git a/fs/xfs/xfs_aops.c b/fs/xfs/xfs_aops.c
> > index 7a6627404160..70e444c151b2 100644
> > --- a/fs/xfs/xfs_aops.c
> > +++ b/fs/xfs/xfs_aops.c
> > @@ -548,19 +548,30 @@ xfs_vm_bmap(
> >  	return iomap_bmap(mapping, block, &xfs_read_iomap_ops);
> >  }
> >  
> > +static inline struct workqueue_struct *
> > +xfs_fsverity_wq(
> > +	struct address_space	*mapping)
> > +{
> > +	if (fsverity_active(mapping->host))
> > +		return XFS_I(mapping->host)->i_mount->m_postread_workqueue;
> > +	return NULL;
> > +}
> > +
> >  STATIC int
> >  xfs_vm_read_folio(
> >  	struct file		*unused,
> >  	struct folio		*folio)
> >  {
> > -	return iomap_read_folio(folio, &xfs_read_iomap_ops, NULL);
> > +	return iomap_read_folio(folio, &xfs_read_iomap_ops,
> > +				xfs_fsverity_wq(folio->mapping));
> >  }
> >  
> >  STATIC void
> >  xfs_vm_readahead(
> >  	struct readahead_control	*rac)
> >  {
> > -	iomap_readahead(rac, &xfs_read_iomap_ops, NULL);
> > +	iomap_readahead(rac, &xfs_read_iomap_ops,
> > +			xfs_fsverity_wq(rac->mapping));
> >  }
> 
> Ok, Now I see how this workqueue is specified, I just don't see
> anything XFS specific about this, and it adds complexity to the
> whole system by making XFS special.
> 
> Either the fsverity code provides a per-sb workqueue instance, or
> we use the global fsverity workqueue. i.e. the filesystem itself
> should not have to supply this, nor should it be plumbed into
> generic iomap IO path.
> 
> We already do this with direct IO completion to use a
> per-superblock workqueue for defering write completions
> (sb->s_dio_done_wq), so I think that is what we should be doing
> here, too. i.e. a generic per-sb post-read workqueue.
> 
> That way iomap_read_bio_alloc() becomes:
> 
> +#ifdef CONFIG_FS_VERITY
> +	if (fsverity_active(inode)) {
> +		bio = bio_alloc_bioset(bdev, nr_vecs, REQ_OP_READ, gfp,
> +					&iomap_fsverity_bioset);
> +		if (bio) {
> +			bio->bi_private = inode->i_sb->i_postread_wq;
> +			bio->bi_end_io = iomap_read_fsverity_end_io;
> +		}
> +		return bio;
> +	}
> 
> And we no longer need to pass a work queue through the IO stack.
> This workqueue can be initialised when we first initialise fsverity
> support for the superblock at mount time, and it would be relatively
> trivial to convert all the fsverity filesytsems to use this
> mechanism, getting rid of the global workqueue altogether.

Thanks, haven't thought about that. I will change it.

-- 
- Andrey

