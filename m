Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD51238E5FF
	for <fsverity@lists.linux.dev>; Tue, 13 Jan 2026 12:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768306997; cv=none; b=IKw8E4whfgzYss7y+9SeZaHus2CpCy1mSu+Td+g7Xf2XL8uwti+cmajpJQiBYNC5+klb4TZhSGkNWqjgDHwzE1MHkjcOK+wk6hl0STqIQGji1aRFIYEHSgaCkbtVxP3mlotVNYWFp7/FrGKWJcMzhlKFnOytPzALaLly24MeD+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768306997; c=relaxed/simple;
	bh=Tg/j/+VkXSR2euQ1Kk7x1AhIGsUY+p/+rckmcuTxqY4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=YO3Jq+DnXm1+kHg0t2M2fmy/4dGE7CDa7197UHk56I9yQV99aX3iKCem2uFjLdvE0JvpD8QGoQjtcQ9rJTUPXiwrM5NaS1pbYe5YXP8b2OYxZHbUGu8x9K8kkYX+/2KkLTtVXuu4hy9H0tebPDn085duwOy6pbpEh3kAXA9JmFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bIq1vMYU; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bIq1vMYU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768306992;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/TuVoqMaQZ1pYUPaWYEfmSsILrC0krVKandDz6n8dcw=;
	b=bIq1vMYUiHZppLx1Rz7e/iHD/fqKWdvdkKqXUzD0b/X94uPtgdRyonzSsUeQ01G+y/EYxR
	ir76qEXOj3fxuiQ35S8hfGb+j/qOwUYWbuljUt7hfwNY3xWTpc/Ch0uwc2GKW1kaZzBD1y
	gSAu7FtKiIwOLwnywW7hy4D/Nlh9bL8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-558-J_YxVdJwMzueHPR7hYmBcQ-1; Tue, 13 Jan 2026 07:23:09 -0500
X-MC-Unique: J_YxVdJwMzueHPR7hYmBcQ-1
X-Mimecast-MFC-AGG-ID: J_YxVdJwMzueHPR7hYmBcQ_1768306988
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-477964c22e0so45520875e9.0
        for <fsverity@lists.linux.dev>; Tue, 13 Jan 2026 04:23:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768306988; x=1768911788;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/TuVoqMaQZ1pYUPaWYEfmSsILrC0krVKandDz6n8dcw=;
        b=KU4CYrO1VBhmCf7iQgcRdEySEW3dDrCPbccXUh0XqXmx9zfCbMQNybO+xGDCbBOHIU
         I1DZxNuZ2pGyUeiGcD4Lz22I0HzTNPQDLc8xP1pe8M+pgDfMZNTEDKASfrqTqEJMU/sg
         2ojNqOfgkGFRThJ+zwi50vPXHW+DjKdtlUyMHA1ntFAOHQVny8CJsWnvRdqRQs5mbnWJ
         ZN+tWAC2O2EqIHiqudmNqV4j1wNhkqv7k9h3MCbhZD6UHbo1MA+hIa7S8ldiL8HHdnr3
         DMHy36/6SffMFIauv+T5Cq+NyNRntt1XOygv3BUeCL9sDZRUZxSBTU62LKRYoMwSnV5v
         l8RQ==
X-Gm-Message-State: AOJu0YwTBhzrAuhNb4LVJ85NnQwOfvMHy/5Y9hpKZ/s5Npq7ZyV35Tt1
	xxgfXDEcxIwjLPVBB5X94EM3Z1NUaZsA4Ih9zlv+AxpinHQoXZAYKXtzNut6irW7JNZDreyaBoh
	umbIoKgQyiwkUa6MBDhivFDF4eHs54clXVcKowUgPlqfHXq2aU65xET6Po58=
X-Gm-Gg: AY/fxX6ChfHZjtWa87QuTSf6mUu28vL+iPmhoK/yUf0Pkh7Arj2aBDjUTCjNOn7T6ff
	zZygnaxW4rL4JmPk6IOF8fqCjBpgMDp/Ra/kVRQp32DHwQpKcbMTSgCUPPsz0C7zCR2jeAvrU/Q
	od4dUdRKNhejxXHkrUyt4wKQST9JFrmcueMQd0iSI0/2OkQmCamtBuK9aa9mHQeSWEuDMKKjjnt
	5d6bvGkdvFsOByFnx4g8m7LS2FqQlhaFXF1PvMlxzKRRQ/DKRC7jNaQ9tLbVXk6hRvIsvhEbzjJ
	Bq4VyFr+K7PHjs8rX8KCoW7qDRIkRy6Z1RcnP02r1TBqW76/JbJw4hIygdjoBbLNx/88DHuVNc0
	=
X-Received: by 2002:a05:600c:c48f:b0:47d:403a:277 with SMTP id 5b1f17b1804b1-47ed7bfd511mr35482115e9.4.1768306988356;
        Tue, 13 Jan 2026 04:23:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEr0RACpmZBlMe7kT+6LC1QjSW7gAHd8MZ6pSzcyVRIgTjA8m3UJl2GbG2kQczOY+RVn3cfeA==
X-Received: by 2002:a05:600c:c48f:b0:47d:403a:277 with SMTP id 5b1f17b1804b1-47ed7bfd511mr35481655e9.4.1768306987799;
        Tue, 13 Jan 2026 04:23:07 -0800 (PST)
Received: from thinky ([217.30.74.39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5edd51sm43942503f8f.29.2026.01.13.04.23.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 04:23:07 -0800 (PST)
Date: Tue, 13 Jan 2026 13:23:06 +0100
From: Andrey Albershteyn <aalbersh@redhat.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: fsverity@lists.linux.dev, linux-xfs@vger.kernel.org, 
	ebiggers@kernel.org, linux-fsdevel@vger.kernel.org, aalbersh@kernel.org, 
	david@fromorbit.com, hch@lst.de
Subject: Re: [PATCH v2 13/22] xfs: introduce XFS_FSVERITY_REGION_START
 constant
Message-ID: <5ax7476dl472kpg3djnlojoxo2k4pmfbzwzsw4mo4jnaoqumeh@t3l4aesjfhwz>
References: <cover.1768229271.patch-series@thinky>
 <qwtd222f5dtszwvacl5ywnommg2xftdtunco2eq4sni4pyyps7@ritrh57jm2eg>
 <20260112224631.GO15551@frogsfrogsfrogs>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260112224631.GO15551@frogsfrogsfrogs>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: B3d4wf9Saf9Yk31_Iy8eqG6rwxGEk6-tI7HugYqm_wg_1768306988
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On 2026-01-12 14:46:31, Darrick J. Wong wrote:
> On Mon, Jan 12, 2026 at 03:51:25PM +0100, Andrey Albershteyn wrote:
> > This constant defines location of fsverity metadata in page cache of
> > an inode.
> > 
> > Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org>
> > ---
> >  fs/xfs/libxfs/xfs_fs.h | 22 ++++++++++++++++++++++
> >  1 file changed, 22 insertions(+), 0 deletions(-)
> > 
> > diff --git a/fs/xfs/libxfs/xfs_fs.h b/fs/xfs/libxfs/xfs_fs.h
> > index 12463ba766..b73458a7c2 100644
> > --- a/fs/xfs/libxfs/xfs_fs.h
> > +++ b/fs/xfs/libxfs/xfs_fs.h
> > @@ -1106,4 +1106,26 @@
> >  #define BBTOB(bbs)	((bbs) << BBSHIFT)
> >  #endif
> >  
> > +/* Merkle tree location in page cache. We take memory region from the inode's
> 
> Dumb nit: new line after opening the multiline comment.
> 
> /*
>  * Merkle tree location in page cache...
> 
> also, isn't (1U<<53) the location of the Merkle tree ondisk in addition
> to its location in the page cache?

yes, it's file offset

> 
> That occurs to me, what happens on 32-bit systems where the pagecache
> can only address up to 16T of data?  Maybe we just don't allow fsverity
> on 32-bit xfs.

hmm right, check in begin_enable() will be probably enough

> 
> > + * address space for Merkle tree.
> > + *
> > + * At maximum of 8 levels with 128 hashes per block (32 bytes SHA-256) maximum
> > + * tree size is ((128^8 − 1)/(128 − 1)) = 567*10^12 blocks. This should fit in 53
> > + * bits address space.
> > + *
> > + * At this Merkle tree size we can cover 295EB large file. This is much larger
> > + * than the currently supported file size.
> > + *
> > + * For sha512 the largest file we can cover ends at 1 << 50 offset, this is also
> > + * good.
> > + *
> > + * The metadata is stored on disk as follows:
> > + *
> > + *	[merkle tree...][descriptor.............desc_size]
> > + *	^ (1 << 53)     ^ (block border)                 ^ (end of the block)
> > + *	                ^--------------------------------^
> > + *	                Can be FS_VERITY_MAX_DESCRIPTOR_SIZE
> > + */
> > +#define XFS_FSVERITY_REGION_START (1ULL << 53)
> 
> Is this in fsblocks or in bytes?  I think the comment should state that
> explicitly.

sure, will add it

-- 
- Andrey

