Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 252A129A9
	for <fsverity@lists.linux.dev>; Wed,  5 Apr 2023 15:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680706921;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ijdR/MHnRs9yin6C5jhmGmV2EeFx7fyGP+HaH521iTo=;
	b=KIkCxRzfMvxGH5h4Pan7mSRz8t6jMXSa6yX2n2J0I7AWgTwLnnstorlQQFSkyVBgId8HE8
	IU8IaA5lNvva0cRIm93CRUSVpaxwou7HI9AFQNi4oso9p6T4v5ywHYFxlxs4KqcYK5mFLZ
	HoApe6z89CNChvZUQiNbvGF63Zil8ik=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-398-SVJ-Ls3BPWG3OaDYYZKpAQ-1; Wed, 05 Apr 2023 11:01:54 -0400
X-MC-Unique: SVJ-Ls3BPWG3OaDYYZKpAQ-1
Received: by mail-qk1-f199.google.com with SMTP id r127-20020a374485000000b0074a6b927a49so655737qka.3
        for <fsverity@lists.linux.dev>; Wed, 05 Apr 2023 08:01:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680706911;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ijdR/MHnRs9yin6C5jhmGmV2EeFx7fyGP+HaH521iTo=;
        b=daMwXEsCvN3hCn3otKkdf/KNezfQdizBnzrWHwU1URMWfEUpR375mn5sBkQL2lhbK9
         ZvF+qIWgePFgU85/Jkl0RlgNtTmffBJaYZE9G+QCYsiuOuvsxF7nC0EHNL2mc6xT1PLv
         4yx3osZpTCGhJM0gjCCLlsM0z/l1bxZbhuxuyxPwd15KHYSELx40ang88F569oByHPzB
         UuKnrNiM5ZDRJnCpKAJGU+M8E1fLyXgOkc6q2hTRW2CkVA4lcHpQRtmIkcc7YvhQ+aNY
         1GYywDpHBVM7ruHrx1EadTbtdI/c9szGK0VAR0ujQZtDZcGCeBqvouyRj0rOx7K6bJCk
         2riw==
X-Gm-Message-State: AAQBX9ex7Ubq9gST3brYKNtrO111CKAN4jstqlrMqapzImtB58fAuPWs
	GXHnpiVi4OKDE7Bw0Nek1XOEUU+6K54uFdCVXRvrCPYfaG8831DQDM6LRB1UxcXUEhLnCJq4B1z
	K6hzChjcQp9pZktlpqw==
X-Received: by 2002:a05:6214:2504:b0:5a3:cbc6:8145 with SMTP id gf4-20020a056214250400b005a3cbc68145mr11557260qvb.19.1680706910925;
        Wed, 05 Apr 2023 08:01:50 -0700 (PDT)
X-Google-Smtp-Source: AKy350YVeAhEKCJSk+gIHwjGx6PP08vlMKC4voUohfc6ezEBe0HN6HJNbkVZpy9LxJ1aS1g8D9uc0g==
X-Received: by 2002:a05:6214:2504:b0:5a3:cbc6:8145 with SMTP id gf4-20020a056214250400b005a3cbc68145mr11557235qvb.19.1680706910656;
        Wed, 05 Apr 2023 08:01:50 -0700 (PDT)
Received: from aalbersh.remote.csb ([109.183.6.197])
        by smtp.gmail.com with ESMTPSA id o8-20020a0cc388000000b005dd8b93457dsm4236165qvi.21.2023.04.05.08.01.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 08:01:49 -0700 (PDT)
Date: Wed, 5 Apr 2023 17:01:42 +0200
From: Andrey Albershteyn <aalbersh@redhat.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: dchinner@redhat.com, ebiggers@kernel.org, hch@infradead.org,
	linux-xfs@vger.kernel.org, fsverity@lists.linux.dev,
	rpeterso@redhat.com, agruenba@redhat.com, xiang@kernel.org,
	chao@kernel.org, damien.lemoal@opensource.wdc.com, jth@kernel.org,
	linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org,
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	cluster-devel@redhat.com
Subject: Re: [PATCH v2 19/23] xfs: disable direct read path for fs-verity
 sealed files
Message-ID: <20230405150142.3jmxzo5i27bbc4c4@aalbersh.remote.csb>
References: <20230404145319.2057051-1-aalbersh@redhat.com>
 <20230404145319.2057051-20-aalbersh@redhat.com>
 <20230404161047.GA109974@frogsfrogsfrogs>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20230404161047.GA109974@frogsfrogsfrogs>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 04, 2023 at 09:10:47AM -0700, Darrick J. Wong wrote:
> On Tue, Apr 04, 2023 at 04:53:15PM +0200, Andrey Albershteyn wrote:
> > The direct path is not supported on verity files. Attempts to use direct
> > I/O path on such files should fall back to buffered I/O path.
> > 
> > Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
> > ---
> >  fs/xfs/xfs_file.c | 14 +++++++++++---
> >  1 file changed, 11 insertions(+), 3 deletions(-)
> > 
> > diff --git a/fs/xfs/xfs_file.c b/fs/xfs/xfs_file.c
> > index 947b5c436172..9e072e82f6c1 100644
> > --- a/fs/xfs/xfs_file.c
> > +++ b/fs/xfs/xfs_file.c
> > @@ -244,7 +244,8 @@ xfs_file_dax_read(
> >  	struct kiocb		*iocb,
> >  	struct iov_iter		*to)
> >  {
> > -	struct xfs_inode	*ip = XFS_I(iocb->ki_filp->f_mapping->host);
> > +	struct inode		*inode = iocb->ki_filp->f_mapping->host;
> > +	struct xfs_inode	*ip = XFS_I(inode);
> >  	ssize_t			ret = 0;
> >  
> >  	trace_xfs_file_dax_read(iocb, to);
> > @@ -297,10 +298,17 @@ xfs_file_read_iter(
> >  
> >  	if (IS_DAX(inode))
> >  		ret = xfs_file_dax_read(iocb, to);
> > -	else if (iocb->ki_flags & IOCB_DIRECT)
> > +	else if (iocb->ki_flags & IOCB_DIRECT && !fsverity_active(inode))
> >  		ret = xfs_file_dio_read(iocb, to);
> > -	else
> > +	else {
> > +		/*
> > +		 * In case fs-verity is enabled, we also fallback to the
> > +		 * buffered read from the direct read path. Therefore,
> > +		 * IOCB_DIRECT is set and need to be cleared
> > +		 */
> > +		iocb->ki_flags &= ~IOCB_DIRECT;
> >  		ret = xfs_file_buffered_read(iocb, to);
> 
> XFS doesn't usually allow directio fallback to the pagecache. Why
> would fsverity be any different?

Didn't know that, this is what happens on ext4 so I did the same.
Then it probably make sense to just error on DIRECT on verity
sealed file.

> 
> --D
> 
> > +	}
> >  
> >  	if (ret > 0)
> >  		XFS_STATS_ADD(mp, xs_read_bytes, ret);
> > -- 
> > 2.38.4
> > 
> 

-- 
- Andrey

