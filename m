Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F3136FDB
	for <fsverity@lists.linux.dev>; Wed,  5 Apr 2023 16:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680712053;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xpkEDS6jt39qufg3GMcbXZKRt5qOSbn/1OJhbiuzI9E=;
	b=IofOlEqACMOcCzuQ8zDo5dyqBOLvXdb0QvuYAKZrtfen6rJemfyHcn0NzhYfrMe90AlLgw
	sCXlDbXL5AfxkB8L5tN7WQZjNBjcTD4zvgK1uGeauIk2xCLMzXyltZzqAigdMU2MFWboC3
	kBA0yYlZD3JoeCQK1YgJw9KbBIxHoOc=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-408-sLevsX5PM-C9jf4oJ7UA7w-1; Wed, 05 Apr 2023 12:27:32 -0400
X-MC-Unique: sLevsX5PM-C9jf4oJ7UA7w-1
Received: by mail-qt1-f198.google.com with SMTP id p22-20020a05622a00d600b003e38f7f800bso24451066qtw.9
        for <fsverity@lists.linux.dev>; Wed, 05 Apr 2023 09:27:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680712051;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xpkEDS6jt39qufg3GMcbXZKRt5qOSbn/1OJhbiuzI9E=;
        b=XbwkJd+a45mQvwvrNPWYk93BY6JuMn86rCB4bcb8i1paP6UF/V4XPdyXTVSStdYu6B
         TyeWQNybI4e6N3uL12cWvI04lmcNoJCgmXqnU/W7rJECH7koUaRL3dQLnD80Dk1TESJj
         NAaK+CN0V3jsJTAO+tOQs5NXTKvkTD25Cw6lwE5XjNPKrV79ecih4SnsU1cfJdsgzgB1
         tArSixJWp66yy+C72kmO0iNLX6laycjF5Qy6pmwxknk+T72qWcWrCg2eIyAlbUa2X54N
         8KquNzj+VhC4wrufiWaJ9pXz1TFXMp+XDF+BqH6lWBMllJuXnvsxvbl0xQoiHAz3Eqen
         RBiA==
X-Gm-Message-State: AAQBX9cjpwH+S5FnAfHOfHqZQRXLcig/NoTL8XeQFX97P8N7vPckYwbj
	vtdmz5fANWaYO+9HpTSxEWP4/qRMaaaSWIV9U1+HQzCsWU633YdbTq/uyLVqbg2N140laEXBRB0
	eaL62seMxyplv79IBQA==
X-Received: by 2002:a05:6214:1c8d:b0:5bb:eefc:1624 with SMTP id ib13-20020a0562141c8d00b005bbeefc1624mr9853055qvb.27.1680712051493;
        Wed, 05 Apr 2023 09:27:31 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZZl4q26mcUoNHuCokraSI3hi88peqAYHPpgY7Wvk0Gvn/BxgeqpN4NaYegoUGQwHkcsJ0yow==
X-Received: by 2002:a05:6214:1c8d:b0:5bb:eefc:1624 with SMTP id ib13-20020a0562141c8d00b005bbeefc1624mr9853021qvb.27.1680712051206;
        Wed, 05 Apr 2023 09:27:31 -0700 (PDT)
Received: from aalbersh.remote.csb ([109.183.6.197])
        by smtp.gmail.com with ESMTPSA id r206-20020a3744d7000000b0074a0051fcd4sm4559684qka.88.2023.04.05.09.27.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 09:27:30 -0700 (PDT)
Date: Wed, 5 Apr 2023 18:27:26 +0200
From: Andrey Albershteyn <aalbersh@redhat.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: dchinner@redhat.com, ebiggers@kernel.org, hch@infradead.org,
	linux-xfs@vger.kernel.org, fsverity@lists.linux.dev,
	rpeterso@redhat.com, agruenba@redhat.com, xiang@kernel.org,
	chao@kernel.org, damien.lemoal@opensource.wdc.com, jth@kernel.org,
	linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org,
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	cluster-devel@redhat.com
Subject: Re: [PATCH v2 00/23] fs-verity support for XFS
Message-ID: <20230405162726.4d7bu3uz63w4cdkz@aalbersh.remote.csb>
References: <20230404145319.2057051-1-aalbersh@redhat.com>
 <20230404163942.GD109974@frogsfrogsfrogs>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20230404163942.GD109974@frogsfrogsfrogs>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Darrick,

On Tue, Apr 04, 2023 at 09:39:42AM -0700, Darrick J. Wong wrote:
> On Tue, Apr 04, 2023 at 04:52:56PM +0200, Andrey Albershteyn wrote:
> > Hi all,
> > 
> > This is V2 of fs-verity support in XFS. In this series I did
> > numerous changes from V1 which are described below.
> > 
> > This patchset introduces fs-verity [5] support for XFS. This
> > implementation utilizes extended attributes to store fs-verity
> > metadata. The Merkle tree blocks are stored in the remote extended
> > attributes.
> > 
> > A few key points:
> > - fs-verity metadata is stored in extended attributes
> > - Direct path and DAX are disabled for inodes with fs-verity
> > - Pages are verified in iomap's read IO path (offloaded to
> >   workqueue)
> > - New workqueue for verification processing
> > - New ro-compat flag
> > - Inodes with fs-verity have new on-disk diflag
> > - xfs_attr_get() can return buffer with the attribute
> > 
> > The patchset is tested with xfstests -g auto on xfs_1k, xfs_4k,
> > xfs_1k_quota, and xfs_4k_quota. Haven't found any major failures.
> > 
> > Patches [6/23] and [7/23] touch ext4, f2fs, btrfs, and patch [8/23]
> > touches erofs, gfs2, and zonefs.
> > 
> > The patchset consist of four parts:
> > - [1..4]: Patches from Parent Pointer patchset which add binary
> >           xattr names with a few deps
> > - [5..7]: Improvements to core fs-verity
> > - [8..9]: Add read path verification to iomap
> > - [10..23]: Integration of fs-verity to xfs
> > 
> > Changes from V1:
> > - Added parent pointer patches for easier testing
> > - Many issues and refactoring points fixed from the V1 review
> > - Adjusted for recent changes in fs-verity core (folios, non-4k)
> > - Dropped disabling of large folios
> > - Completely new fsverity patches (fix, callout, log_blocksize)
> > - Change approach to verification in iomap to the same one as in
> >   write path. Callouts to fs instead of direct fs-verity use.
> > - New XFS workqueue for post read folio verification
> > - xfs_attr_get() can return underlying xfs_buf
> > - xfs_bufs are marked with XBF_VERITY_CHECKED to track verified
> >   blocks
> > 
> > kernel:
> > [1]: https://github.com/alberand/linux/tree/xfs-verity-v2
> > 
> > xfsprogs:
> > [2]: https://github.com/alberand/xfsprogs/tree/fsverity-v2
> 
> Will there any means for xfs_repair to check the merkle tree contents?
> Should it clear the ondisk inode flag if it decides to trash the xattr
> structure, or is it ok to let the kernel deal with flag set and no
> verity data?

The fsverity-util can calculate merkle tree offline, so, it's
possible for xfs_repair to do the same and compare, also it can
check that all merkle tree blocks are there. The flag without tree
is probably bad as all reading ops will fail and it won't be
possible to regenerate the tree (enable also checks for flag).

-- 
- Andrey

