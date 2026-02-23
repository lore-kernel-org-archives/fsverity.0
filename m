Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD4C33C19C
	for <fsverity@lists.linux.dev>; Mon, 23 Feb 2026 18:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771870767; cv=none; b=RQRaiHxrKMRfOlpW4s12BYVLGhQqVzuqw5Xh0MCyvNrMoks2boD+rzDWhBV0extK197pkst/JZVSl+M8vGZSelKWDUxczD9WshFctWFN3kgkQXH0bKaRtwVp0h7YDJy3exQQls1A7KVlylnB7PXvNgpjty1fMCsHu/PIHsuAVIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771870767; c=relaxed/simple;
	bh=tYg6lKXCrXqkSRjroh8xnR35YcUacejrcTuL0nB1Jg4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=Vh/iHGchOP6D4HAEcPZkoGjy+18ExVmcTeZ6Dc60yNMoH1pAZDyEaCvCw3AIb2RdTsTaVgajcYidvnFypT3rCbqbXs2vOcUYO67Ii8VLELWZf5xyOnrduiD+UGURXqHhSd3pITe+Xm55BINDad0NDjhnxCfs/CLzwVXOxK/v430=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aB+cCavL; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aB+cCavL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771870763;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5ifqmgc0Bd/dYXqGP8nteQfhBSpKJvq3ZUBjnYwveQk=;
	b=aB+cCavLs+zm+jpCb/2mr4KCcVI/Ye/8MYApgLMtX5j7MYq1uXd+NlqcWmpRPy1Bne+oJK
	HJ7m+/COGrks5e/ZXSRHHju9+yTkdGv4eL9Q4j6k4qSsw1kqKrJDDvORih7AmSTBGd9Zrh
	BqLhXxpQEayspziUcGESAyr1LNHaKtQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-383-nxVE_OqPOAiDTya2A3aVaQ-1; Mon, 23 Feb 2026 13:19:21 -0500
X-MC-Unique: nxVE_OqPOAiDTya2A3aVaQ-1
X-Mimecast-MFC-AGG-ID: nxVE_OqPOAiDTya2A3aVaQ_1771870760
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-435aadfaf4eso3204771f8f.2
        for <fsverity@lists.linux.dev>; Mon, 23 Feb 2026 10:19:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771870760; x=1772475560;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5ifqmgc0Bd/dYXqGP8nteQfhBSpKJvq3ZUBjnYwveQk=;
        b=BaIbv7GPu7q34w5yiBWriupybps9tA8Ck9zk7t3GUXjIdL2IZg0BAQZo2X/2M4bFpO
         E7MWmsSfRFO6+j1YKSyg5GctHCDLOKU4gQiee0DfPMFeCR1pE2Oa1jpInZ4fBRXH5lT2
         odLcFuOYKd1KIQP8CGIsPDOxnXZQEWcYUrBH3si7yJyETVWqQL/hSj5BH9dL72Dxmtj9
         SZ+wDlf7AfnxxWDmAWx/LzzCmCN3guinIMDL/LLJ2iS7C2BWEd3sZT0KwR5h+jfOb3AM
         qr/sms7fWeNp5O60PupQCsxuuYGLMQseuYNDTQLrNlQr47FUjWF2XbO5V9F+jHVoYim5
         CTTA==
X-Forwarded-Encrypted: i=1; AJvYcCWcepUV5GAl4/pr7zuDAQnR7OMJMbwvDuNfiRI2g50CmU5S1IEj4zaaR8K+Bu03xXT5EHRVhfSEYg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx/o577FPHbA2/rAtQgKRmXanVv/q8bNTfbtH2bCjOlo9YKfJdf
	7vpMVk1UVW9kWA+wjpFw5dE3U+7VVu9Uv7myfPak26nW7jlyEnkpdOuKf0fecBHgbuu5y4iJtJA
	wW0kptQZS3ATZgirxayKxu84sifg6tegtd1rKiuRv7mvo2J+2t3/KkPvQCMI=
X-Gm-Gg: ATEYQzyIKlZxosrRXHwSbrRIjfMn+IncbWstFmvvRMF7KDPAjUn7a82VelFv2kSVbau
	pjqE3yH9bY1q7qv4tr4TQp4bpOUkm2tmqfeBhyyDhMQcS+NBZKwGAMEwSDFt5h5j2hqB+6zcWa4
	1OWKzLDJE3oJx7AbjDoljJUindcvpIHCWdinDoSC5VJF6j9XM873OOOrYgFr0eOoda5F/zYpxzR
	WK4xAZiZhvxoX7Lrq6dAz0VGQI5trFqaSM9UStJITmlw7lZ3mlvGXnbqmW54MVoWc1qpPlCCBQQ
	DFsvqciTbcDsh6RboWC0Af2k6s7Zu4bkLRlKxxZCHDqQOJzUPLI4Ld2JN1F438p0yl9lCPpZOuf
	vFYD+aDKrIEg=
X-Received: by 2002:a05:6000:2301:b0:435:a501:359 with SMTP id ffacd0b85a97d-4396f18a666mr17997604f8f.41.1771870760127;
        Mon, 23 Feb 2026 10:19:20 -0800 (PST)
X-Received: by 2002:a05:6000:2301:b0:435:a501:359 with SMTP id ffacd0b85a97d-4396f18a666mr17997554f8f.41.1771870759664;
        Mon, 23 Feb 2026 10:19:19 -0800 (PST)
Received: from thinky ([217.30.74.39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970c08b9csm23518931f8f.16.2026.02.23.10.19.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 10:19:19 -0800 (PST)
Date: Mon, 23 Feb 2026 19:19:18 +0100
From: Andrey Albershteyn <aalbersh@redhat.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: Andrey Albershteyn <aalbersh@kernel.org>, linux-xfs@vger.kernel.org, 
	fsverity@lists.linux.dev, linux-fsdevel@vger.kernel.org, ebiggers@kernel.org, hch@lst.de
Subject: Re: [PATCH v3 33/35] xfs: introduce health state for corrupted
 fsverity metadata
Message-ID: <zv5rshpef3fti4ldwhfcaekmjjzcwtxr3fgtabwyufkhcn4gvw@uk4ojtvmxquc>
References: <20260217231937.1183679-1-aalbersh@kernel.org>
 <20260217231937.1183679-34-aalbersh@kernel.org>
 <20260219173427.GL6490@frogsfrogsfrogs>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260219173427.GL6490@frogsfrogsfrogs>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: TBEt-ZTIKXhxRKQktXGhUJ3SkGbAS3R9sydX0oM6vb0_1771870760
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2026-02-19 09:34:27, Darrick J. Wong wrote:
> On Wed, Feb 18, 2026 at 12:19:33AM +0100, Andrey Albershteyn wrote:
> > Report corrupted fsverity descriptor through health system.
> > 
> > Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org>
> 
> Looks good to me, though I'll have to revisit this with a sharper eye
> for what happens if/when you rebase to use fserror_*.
> 
> IIRC inconsistencies between the merkle tree and the file data are
> reported as -EIO, right?

iomap reports -EIO on the file data read, and fsverity_verify_bio()
will report block size failure with fserror_report_data_lost().

> And at that point we have the file range
> information, so we could actually use fserror_report_data_lost.
> 
> I forget, what do we do for inconsistencies between an internal node of
> the merkle tree and the next level down?  That sounds like something
> that should set XFS_SICK_INO_FSVERITY, right?

It's done by fsverity itself in verify_data_block() and will be
reported with fserror_report_data_lost().

> For this bit involving just the fsverity descriptor,
> Reviewed-by: "Darrick J. Wong" <djwong@kernel.org>

Thanks!

> 
> --D
> 
> > ---
> >  fs/xfs/libxfs/xfs_fs.h     |  1 +
> >  fs/xfs/libxfs/xfs_health.h |  4 +++-
> >  fs/xfs/xfs_fsverity.c      | 13 ++++++++++---
> >  fs/xfs/xfs_health.c        |  1 +
> >  4 files changed, 15 insertions(+), 4 deletions(-)
> > 
> > diff --git a/fs/xfs/libxfs/xfs_fs.h b/fs/xfs/libxfs/xfs_fs.h
> > index 36a87276f0b7..d8be7fe93382 100644
> > --- a/fs/xfs/libxfs/xfs_fs.h
> > +++ b/fs/xfs/libxfs/xfs_fs.h
> > @@ -423,6 +423,7 @@ struct xfs_bulkstat {
> >  #define XFS_BS_SICK_PARENT	(1 << 7)  /* parent pointers */
> >  #define XFS_BS_SICK_DIRTREE	(1 << 8)  /* directory tree structure */
> >  #define XFS_BS_SICK_DATA	(1 << 9)  /* file data */
> > +#define XFS_BS_SICK_FSVERITY	(1 << 10) /* fsverity metadata */
> >  
> >  /*
> >   * Project quota id helpers (previously projid was 16bit only
> > diff --git a/fs/xfs/libxfs/xfs_health.h b/fs/xfs/libxfs/xfs_health.h
> > index fa91916ad072..c534aacf3199 100644
> > --- a/fs/xfs/libxfs/xfs_health.h
> > +++ b/fs/xfs/libxfs/xfs_health.h
> > @@ -105,6 +105,7 @@ struct xfs_rtgroup;
> >  #define XFS_SICK_INO_FORGET	(1 << 12)
> >  #define XFS_SICK_INO_DIRTREE	(1 << 13)  /* directory tree structure */
> >  #define XFS_SICK_INO_DATA	(1 << 14)  /* file data */
> > +#define XFS_SICK_INO_FSVERITY	(1 << 15)  /* fsverity metadata */
> >  
> >  /* Primary evidence of health problems in a given group. */
> >  #define XFS_SICK_FS_PRIMARY	(XFS_SICK_FS_COUNTERS | \
> > @@ -142,7 +143,8 @@ struct xfs_rtgroup;
> >  				 XFS_SICK_INO_SYMLINK | \
> >  				 XFS_SICK_INO_PARENT | \
> >  				 XFS_SICK_INO_DIRTREE | \
> > -				 XFS_SICK_INO_DATA)
> > +				 XFS_SICK_INO_DATA | \
> > +				 XFS_SICK_INO_FSVERITY)
> >  
> >  #define XFS_SICK_INO_ZAPPED	(XFS_SICK_INO_BMBTD_ZAPPED | \
> >  				 XFS_SICK_INO_BMBTA_ZAPPED | \
> > diff --git a/fs/xfs/xfs_fsverity.c b/fs/xfs/xfs_fsverity.c
> > index 5a2874236c3c..d89512d59328 100644
> > --- a/fs/xfs/xfs_fsverity.c
> > +++ b/fs/xfs/xfs_fsverity.c
> > @@ -197,16 +197,23 @@ xfs_fsverity_get_descriptor(
> >  		return error;
> >  
> >  	desc_size = be32_to_cpu(d_desc_size);
> > -	if (XFS_IS_CORRUPT(mp, desc_size > FS_VERITY_MAX_DESCRIPTOR_SIZE))
> > +	if (XFS_IS_CORRUPT(mp, desc_size > FS_VERITY_MAX_DESCRIPTOR_SIZE)) {
> > +		xfs_inode_mark_sick(XFS_I(inode), XFS_SICK_INO_FSVERITY);
> >  		return -ERANGE;
> > -	if (XFS_IS_CORRUPT(mp, desc_size > desc_size_pos))
> > +	}
> > +
> > +	if (XFS_IS_CORRUPT(mp, desc_size > desc_size_pos)) {
> > +		xfs_inode_mark_sick(XFS_I(inode), XFS_SICK_INO_FSVERITY);
> >  		return -ERANGE;
> > +	}
> >  
> >  	if (!buf_size)
> >  		return desc_size;
> >  
> > -	if (XFS_IS_CORRUPT(mp, desc_size > buf_size))
> > +	if (XFS_IS_CORRUPT(mp, desc_size > buf_size)) {
> > +		xfs_inode_mark_sick(XFS_I(inode), XFS_SICK_INO_FSVERITY);
> >  		return -ERANGE;
> > +	}
> >  
> >  	desc_pos = round_down(desc_size_pos - desc_size, blocksize);
> >  	error = xfs_fsverity_read(inode, buf, desc_size, desc_pos);
> > diff --git a/fs/xfs/xfs_health.c b/fs/xfs/xfs_health.c
> > index b851651c02b2..e52ee02f7d7c 100644
> > --- a/fs/xfs/xfs_health.c
> > +++ b/fs/xfs/xfs_health.c
> > @@ -488,6 +488,7 @@ static const struct ioctl_sick_map ino_map[] = {
> >  	{ XFS_SICK_INO_SYMLINK_ZAPPED,	XFS_BS_SICK_SYMLINK },
> >  	{ XFS_SICK_INO_DIRTREE,	XFS_BS_SICK_DIRTREE },
> >  	{ XFS_SICK_INO_DATA,	XFS_BS_SICK_DATA },
> > +	{ XFS_SICK_INO_FSVERITY,	XFS_BS_SICK_FSVERITY },
> >  };
> >  
> >  /* Fill out bulkstat health info. */
> > -- 
> > 2.51.2
> > 
> > 
> 

-- 
- Andrey

