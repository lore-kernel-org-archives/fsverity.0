Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7B57EB
	for <fsverity@lists.linux.dev>; Wed,  5 Apr 2023 10:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680691153;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sBkFB8fAWBN3smTHXDCk9Sdy8T63XJRLVaCuva4Dlh8=;
	b=IZ+80HHyflA0PA7JbWhpmorV4w26vqCt95GTbtlvNBsGt1R1wNgXV+S9kHlYM/EbLUW1p9
	gaCq4dIKPNr/PRlXUCsiQnZZM+ko1a6jwgAMCVBqJ6n9jT+5egVYiKZsJ53tz1GpGircO9
	Lp7SmEsPz5jWvo51V5SivpQin+t8f0A=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-526-5hORl04mPD6kkapCRNy4Eg-1; Wed, 05 Apr 2023 06:39:11 -0400
X-MC-Unique: 5hORl04mPD6kkapCRNy4Eg-1
Received: by mail-qk1-f198.google.com with SMTP id r197-20020a37a8ce000000b0074a59c12b10so2049847qke.5
        for <fsverity@lists.linux.dev>; Wed, 05 Apr 2023 03:39:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680691151;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sBkFB8fAWBN3smTHXDCk9Sdy8T63XJRLVaCuva4Dlh8=;
        b=7yX8UILSKC2F456TSsLEB/zU2cAO1Wfi7or/erq6Q7c/XNygQ93g42FF5mijxeQQnT
         6LR5jjjwYmbiZ93HYwkmXrcE7z4YdKbJzkIaFuwl5dyS3YKmUWxrEZ+V6IHrVlGae6in
         K9YJVnH+juijWxwSoTBIvBA3v4BIFdZDJBfejcyG7oQ1yofCeaaxibAcO/6Eu9FlvY6I
         Gv1j0rOlohmJ91N5qiQ3SFSxm6gi2xAJoDE2aaqXIuclSABA9KkXR+4CHLK0nVLvWOfF
         94trg5cC8PWs5RDo+qWb8IAXWCVTeeyw98fHVgkafpwzlZEIWKXNoYwQ3lOQRUSUVZHB
         k3ww==
X-Gm-Message-State: AAQBX9c6V7mea1rrb3/GsynZ6xEsj10HsHRrbPqHnkUtzmILuJec2Ww+
	mzr8Kfct8+RHHXbiSXI/YLugwdPpu+/ALd1wXdX7VguZ6HE8aCVmpFioyPhErvzzj2FbIYJh4qn
	dPwYN538+Nbn+0sU3EQ==
X-Received: by 2002:ac8:7e96:0:b0:3b6:323d:bcac with SMTP id w22-20020ac87e96000000b003b6323dbcacmr4150874qtj.32.1680691151328;
        Wed, 05 Apr 2023 03:39:11 -0700 (PDT)
X-Google-Smtp-Source: AKy350aYAf0v49WL6o/QofipBP4L4y6flhFYcYqZzNpajsevFC+xcPnxT0A0hb6dINwVq/YpVvvMSw==
X-Received: by 2002:ac8:7e96:0:b0:3b6:323d:bcac with SMTP id w22-20020ac87e96000000b003b6323dbcacmr4150840qtj.32.1680691150879;
        Wed, 05 Apr 2023 03:39:10 -0700 (PDT)
Received: from aalbersh.remote.csb ([109.183.6.197])
        by smtp.gmail.com with ESMTPSA id r206-20020a3744d7000000b0074a0051fcd4sm4331706qka.88.2023.04.05.03.39.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 03:39:10 -0700 (PDT)
Date: Wed, 5 Apr 2023 12:39:04 +0200
From: Andrey Albershteyn <aalbersh@redhat.com>
To: Dave Chinner <david@fromorbit.com>
Cc: djwong@kernel.org, dchinner@redhat.com, ebiggers@kernel.org,
	hch@infradead.org, linux-xfs@vger.kernel.org,
	fsverity@lists.linux.dev, rpeterso@redhat.com, agruenba@redhat.com,
	xiang@kernel.org, chao@kernel.org, damien.lemoal@opensource.wdc.com,
	jth@kernel.org, linux-erofs@lists.ozlabs.org,
	linux-btrfs@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com
Subject: Re: [PATCH v2 06/23] fsverity: add drop_page() callout
Message-ID: <20230405103904.2ugfxqmuuqjd7itz@aalbersh.remote.csb>
References: <20230404145319.2057051-1-aalbersh@redhat.com>
 <20230404145319.2057051-7-aalbersh@redhat.com>
 <20230404234019.GM3223426@dread.disaster.area>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20230404234019.GM3223426@dread.disaster.area>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dave,

On Wed, Apr 05, 2023 at 09:40:19AM +1000, Dave Chinner wrote:
> On Tue, Apr 04, 2023 at 04:53:02PM +0200, Andrey Albershteyn wrote:
> > Allow filesystem to make additional processing on verified pages
> > instead of just dropping a reference. This will be used by XFS for
> > internal buffer cache manipulation in further patches. The btrfs,
> > ext4, and f2fs just drop the reference.
> > 
> > Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
> > ---
> >  fs/btrfs/verity.c         | 12 ++++++++++++
> >  fs/ext4/verity.c          |  6 ++++++
> >  fs/f2fs/verity.c          |  6 ++++++
> >  fs/verity/read_metadata.c |  4 ++--
> >  fs/verity/verify.c        |  6 +++---
> >  include/linux/fsverity.h  | 10 ++++++++++
> >  6 files changed, 39 insertions(+), 5 deletions(-)
> > 
> > diff --git a/fs/btrfs/verity.c b/fs/btrfs/verity.c
> > index c5ff16f9e9fa..4c2c09204bb4 100644
> > --- a/fs/btrfs/verity.c
> > +++ b/fs/btrfs/verity.c
> > @@ -804,10 +804,22 @@ static int btrfs_write_merkle_tree_block(struct inode *inode, const void *buf,
> >  			       pos, buf, size);
> >  }
> >  
> > +/*
> > + * fsverity op that releases the reference obtained by ->read_merkle_tree_page()
> > + *
> > + * @page:  reference to the page which can be released
> > + *
> > + */
> > +static void btrfs_drop_page(struct page *page)
> > +{
> > +	put_page(page);
> > +}
> > +
> >  const struct fsverity_operations btrfs_verityops = {
> >  	.begin_enable_verity     = btrfs_begin_enable_verity,
> >  	.end_enable_verity       = btrfs_end_enable_verity,
> >  	.get_verity_descriptor   = btrfs_get_verity_descriptor,
> >  	.read_merkle_tree_page   = btrfs_read_merkle_tree_page,
> >  	.write_merkle_tree_block = btrfs_write_merkle_tree_block,
> > +	.drop_page		 = &btrfs_drop_page,
> >  };
> 
> Ok, that's a generic put_page() call.
> 
> ....
> > diff --git a/fs/verity/verify.c b/fs/verity/verify.c
> > index f50e3b5b52c9..c2fc4c86af34 100644
> > --- a/fs/verity/verify.c
> > +++ b/fs/verity/verify.c
> > @@ -210,7 +210,7 @@ verify_data_block(struct inode *inode, struct fsverity_info *vi,
> >  		if (is_hash_block_verified(vi, hpage, hblock_idx)) {
> >  			memcpy_from_page(_want_hash, hpage, hoffset, hsize);
> >  			want_hash = _want_hash;
> > -			put_page(hpage);
> > +			inode->i_sb->s_vop->drop_page(hpage);
> >  			goto descend;
> 
> 			fsverity_drop_page(hpage);
> 
> static inline void
> fsverity_drop_page(struct inode *inode, struct page *page)
> {
> 	if (inode->i_sb->s_vop->drop_page)
> 		inode->i_sb->s_vop->drop_page(page);
> 	else
> 		put_page(page);
> }
> 
> And then you don't need to add the functions to each of the
> filesystems nor make an indirect call just to run put_page().

Sure, this makes more sense, thank you!

-- 
- Andrey

