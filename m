Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 571F13C07
	for <fsverity@lists.linux.dev>; Tue,  4 Apr 2023 23:56:37 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id y2so22555760pfw.9
        for <fsverity@lists.linux.dev>; Tue, 04 Apr 2023 16:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fromorbit-com.20210112.gappssmtp.com; s=20210112; t=1680652597;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CiwVxtHqh7PtMKcIrbTly4vzLJ3BWefIHUj9tJBpUIs=;
        b=vimaQLlpEUMehiQFMsj9zfP0aw8/xBepI6GNmarhCk57b8UQ+tn2pqLKQED8ItRRuU
         yF8SeMM3vB+68/MfMN+3QVByH6UzFxwNuWFtq5ftE0qjeYhWqPjWaGxRRrCcG7s+Sq2t
         TZHNB2ng1SQRm73fUpFyK2Zs5RT6hgnCgmO7HkFUdKdL6knY6P5hyJf8HGbX6i8ol+oL
         LlqjwoN3yKJCKPqRPVUAAs623zJmSloPMxmKQY24W37dtqAQrT3uUIUAAgzZOPO1c5zR
         spxERhNZLoAfBmHPajMN/L3QcThXSpRgXAusvQ8ERdge4t8cKIJw6oM2DZo36HcqBMPC
         BQ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680652597;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CiwVxtHqh7PtMKcIrbTly4vzLJ3BWefIHUj9tJBpUIs=;
        b=SdCDGMNjAu+LY01iPQIuNPaxAmzRBg3XIPN9cYREDruDxRn7UmqDGyFkjLETtoazAj
         LhKA6WXZkwd3UPJ92n0TPZy/Gtb7wV0+NfgFLlrsUhbeZTlNBC1akS2sURa6N5gr2Lyf
         /OLyEaFOEq0SATK3YYSn6Y+RJyWNykpeQnSiFj2/1I8eUFQZGLu/12Ec3FT+H/UaVAct
         G93YK5uKwY+Wrwg94DkAAij0odsy7g6MCSZ2Zh9+V7ShOyQ8FhGqcQOb0qFTgFvtu4b7
         7KoFQFvXrWo4yU+7Bg77R7592dkrbRmriDvU9NeUKyRtoM0c/QhwZrbzLcor9ipbfBIr
         fFAg==
X-Gm-Message-State: AAQBX9ck9qs4eKr7+z++Dl/q/zDpDD7Ztn5QalpW4Q4gP8pD7QgZ31Q1
	uiB1B8cHu4gIHyZrItmdj7x45A==
X-Google-Smtp-Source: AKy350boc1NJttMEXbPWdN9rfQR7KWvZb/0IvD3DuAJJ+io4CZz0OVS7AP+iey99+szOCn0Wgij/bQ==
X-Received: by 2002:a62:6454:0:b0:626:7c43:7cb8 with SMTP id y81-20020a626454000000b006267c437cb8mr3631280pfb.20.1680652596758;
        Tue, 04 Apr 2023 16:56:36 -0700 (PDT)
Received: from dread.disaster.area (pa49-181-91-157.pa.nsw.optusnet.com.au. [49.181.91.157])
        by smtp.gmail.com with ESMTPSA id a18-20020a656412000000b005136b93f8e9sm8146027pgv.14.2023.04.04.16.56.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 16:56:36 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
	(envelope-from <david@fromorbit.com>)
	id 1pjqVt-00H7ij-6l; Wed, 05 Apr 2023 09:56:33 +1000
Date: Wed, 5 Apr 2023 09:56:33 +1000
From: Dave Chinner <david@fromorbit.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Andrey Albershteyn <aalbersh@redhat.com>, djwong@kernel.org,
	dchinner@redhat.com, hch@infradead.org, linux-xfs@vger.kernel.org,
	fsverity@lists.linux.dev, rpeterso@redhat.com, agruenba@redhat.com,
	xiang@kernel.org, chao@kernel.org, damien.lemoal@opensource.wdc.com,
	jth@kernel.org, linux-erofs@lists.ozlabs.org,
	linux-btrfs@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com
Subject: Re: [PATCH v2 16/23] xfs: add inode on-disk VERITY flag
Message-ID: <20230404235633.GN3223426@dread.disaster.area>
References: <20230404145319.2057051-1-aalbersh@redhat.com>
 <20230404145319.2057051-17-aalbersh@redhat.com>
 <20230404224123.GD1893@sol.localdomain>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230404224123.GD1893@sol.localdomain>

On Tue, Apr 04, 2023 at 03:41:23PM -0700, Eric Biggers wrote:
> Hi Andrey,
> 
> On Tue, Apr 04, 2023 at 04:53:12PM +0200, Andrey Albershteyn wrote:
> > Add flag to mark inodes which have fs-verity enabled on them (i.e.
> > descriptor exist and tree is built).
> > 
> > Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
> > ---
> >  fs/ioctl.c                 | 4 ++++
> >  fs/xfs/libxfs/xfs_format.h | 4 +++-
> >  fs/xfs/xfs_inode.c         | 2 ++
> >  fs/xfs/xfs_iops.c          | 2 ++
> >  include/uapi/linux/fs.h    | 1 +
> >  5 files changed, 12 insertions(+), 1 deletion(-)
> [...]
> > diff --git a/include/uapi/linux/fs.h b/include/uapi/linux/fs.h
> > index b7b56871029c..5172a2eb902c 100644
> > --- a/include/uapi/linux/fs.h
> > +++ b/include/uapi/linux/fs.h
> > @@ -140,6 +140,7 @@ struct fsxattr {
> >  #define FS_XFLAG_FILESTREAM	0x00004000	/* use filestream allocator */
> >  #define FS_XFLAG_DAX		0x00008000	/* use DAX for IO */
> >  #define FS_XFLAG_COWEXTSIZE	0x00010000	/* CoW extent size allocator hint */
> > +#define FS_XFLAG_VERITY		0x00020000	/* fs-verity sealed inode */
> >  #define FS_XFLAG_HASATTR	0x80000000	/* no DIFLAG for this	*/
> >  
> 
> I don't think "xfs: add inode on-disk VERITY flag" is an accurate description of
> a patch that involves adding something to the UAPI.

Well it does that, but it also adds the UAPI for querying the
on-disk flag via the FS_IOC_FSGETXATTR interface as well.  It
probably should be split up into two patches.

> Should the other filesystems support this new flag too?

I think they should get it automatically now that it has been
defined for FS_IOC_FSGETXATTR and added to the generic fileattr flag
fill functions in fs/ioctl.c.

> I'd also like all ways of getting the verity flag to continue to be mentioned in
> Documentation/filesystems/fsverity.rst.  The existing methods (FS_IOC_GETFLAGS
> and statx) are already mentioned there.

*nod*

-Dave.
-- 
Dave Chinner
david@fromorbit.com
