Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8DB718E2A
	for <fsverity@lists.linux.dev>; Sat, 24 Feb 2024 14:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708783865; cv=none; b=arwo4w6ZOfly4Vl5IBsoPRKmkh3aYU2aemNOwY6VRUbQUWuSPAspHieninUQxsqH4vquARqQrzWG4I8/KXLRyAjhr50JCJRUFNQ5pP0+N+c70waT2NTKz5bV8PXIqqrtIodJvv12xxGBxn56Bgm4rksorXJfia6U0dO+a9nsLBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708783865; c=relaxed/simple;
	bh=wAQeGIpU/b8zq/c8phVMxTlln1DrdldGBZvQmeoDpLs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=TQyw+1ecF+pTSzF8WgR1tzgbtYRWpf+oCGqs5o1GbKsnitEwvcOpNA2CuvOaJinifmSE9vfldeC3IX0doqKonlwy0dUsn/NO0tivpQ8/305qxzgdOGaA2+xbeouLgv8lGjV3brynTsNUoIb1e2Up7cmg3rFzPOWbI91hm7hw10o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NXbVnqS3; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NXbVnqS3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708783862;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AmvOSjy0MC5pHW1g/j3NOZPW4U2msOE708+NWPvQghI=;
	b=NXbVnqS3Ax7cGdRJpGDax0uizvli5wsiuJmF7z3vUBLuxjfs6l51hPPro0xmT1nmu9kLAX
	M55xpVRNmny/duu47+1Kvo5yzg1qzZralFGrxIZAPgWhk9boutzDURueBYNVFN18vlvXDx
	XOriRLQq+fU1mZ6pEdITYZRRJIXcvF4=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-571-dCUjKkvYOFaG1SmuKRLBEg-1; Sat, 24 Feb 2024 09:11:01 -0500
X-MC-Unique: dCUjKkvYOFaG1SmuKRLBEg-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-563f8cf9f56so748683a12.1
        for <fsverity@lists.linux.dev>; Sat, 24 Feb 2024 06:11:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708783860; x=1709388660;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AmvOSjy0MC5pHW1g/j3NOZPW4U2msOE708+NWPvQghI=;
        b=pv/kJS7/QjKiD0V1yXIeSrAuE77mqhUKjfFl+/SWE/f0QaGFY8SDn9kfrgbQinN09t
         EPfYllKLmJ8iAYeWawgEtwfjN+wQcwv2MX6wzNKPy2iTz+ezFtVASP5IRVNmeFmz9Par
         ZekuEEDLk8OIswEQwKaTpqJSDRx3qI1UKQv3TSvqs+tGYiSEY2c3NkUNuyK8CS2dRoKH
         GRsylatybcVZfkhTMbuHl7Snebih566Bpy4hoLOrOdH0IY6sNDo9qvQ6CFLh0Y16mBYl
         hOavJpuGpLEg+LaWd9csPDeMDguY6Q/72X8n854z8ztbYGiAGVOsTvxhfw+/6cEL20Vg
         GVhg==
X-Gm-Message-State: AOJu0YzfXSk+2mPKw5Pxzxe44icxOPgSx0YHjbmH30pj960boJYz8cAb
	4FPP2EtSPoT2vXGQY9htGBHijJf/wmRON4H/zYLZWauTUEIZWI7ltHZTrCLb5J/L4MgtFVZZVQP
	tvjr4Sm8FI8gonH9yWw301QD4BC6cr4mq37U1PlOz2eQ5h+tSbVy2ouM=
X-Received: by 2002:aa7:d349:0:b0:565:be3f:bc4e with SMTP id m9-20020aa7d349000000b00565be3fbc4emr140220edr.29.1708783859906;
        Sat, 24 Feb 2024 06:10:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGew91maGa6l3f9rKld2WFHMZa748gpse/xrdGzF3S87LGuem4A2sqelzLeBZShQmbV+ViTJw==
X-Received: by 2002:aa7:d349:0:b0:565:be3f:bc4e with SMTP id m9-20020aa7d349000000b00565be3fbc4emr140209edr.29.1708783859588;
        Sat, 24 Feb 2024 06:10:59 -0800 (PST)
Received: from thinky ([109.183.6.197])
        by smtp.gmail.com with ESMTPSA id r26-20020aa7cb9a000000b00565b8f955b8sm209020edt.57.2024.02.24.06.10.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Feb 2024 06:10:59 -0800 (PST)
Date: Sat, 24 Feb 2024 15:10:58 +0100
From: Andrey Albershteyn <aalbersh@redhat.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: fsverity@lists.linux.dev, linux-xfs@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, chandan.babu@oracle.com, djwong@kernel.org
Subject: Re: [PATCH v4 07/25] fsverity: support block-based Merkle tree
 caching
Message-ID: <brwo67ff3o3tvkswlgbjselabvhh5hbsagg47hiiogpltkrcr7@yff2orlvntvs>
References: <20240212165821.1901300-1-aalbersh@redhat.com>
 <20240212165821.1901300-8-aalbersh@redhat.com>
 <20240223052459.GC25631@sol.localdomain>
 <qojmht7l3lgx5hy7sqh5tru7u3uuowl5siszzcj3futgyqtbtv@pth44gm7ueog>
 <20240223180732.GC1112@sol.localdomain>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20240223180732.GC1112@sol.localdomain>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2024-02-23 10:07:32, Eric Biggers wrote:
> On Fri, Feb 23, 2024 at 05:02:45PM +0100, Andrey Albershteyn wrote:
> > > > +void fsverity_drop_block(struct inode *inode,
> > > > +		struct fsverity_blockbuf *block)
> > > > +{
> > > > +	if (inode->i_sb->s_vop->drop_block)
> > > > +		inode->i_sb->s_vop->drop_block(block);
> > > > +	else {
> > > > +		struct page *page = (struct page *)block->context;
> > > > +
> > > > +		/* Merkle tree block size == PAGE_SIZE; */
> > > > +		if (block->verified)
> > > > +			SetPageChecked(page);
> > > > +
> > > > +		kunmap_local(block->kaddr);
> > > > +		put_page(page);
> > > > +	}
> > > > +}
> > > 
> > > I don't think this is the logical place for the call to SetPageChecked().
> > > verity_data_block() currently does:
> > > 
> > >         if (vi->hash_block_verified)
> > >                 set_bit(hblock_idx, vi->hash_block_verified);
> > >         else
> > >                 SetPageChecked(page);
> > > 
> > > You're proposing moving the SetPageChecked() to fsverity_drop_block().  Why?  We
> > > should try to do things in a consistent place.
> > > 
> > > Similarly, I don't see why is_hash_block_verified() shouldn't keep the
> > > PageChecked().
> > > 
> > > If we just keep PG_checked be get and set in the same places it currently is,
> > > then adding fsverity_blockbuf::verified wouldn't be necessary.
> > > 
> > > Maybe you intended to move the awareness of PG_checked out of fs/verity/ and
> > > into the filesystems?
> > 
> > yes
> > 
> > > Your change in how PG_checked is get and set is sort of a
> > > step towards that, but it doesn't complete it.  It doesn't make sense to leave
> > > in this half-finished state.
> > 
> > What do you think is missing? I didn't want to make too many changes
> > to fs which already use fs-verity and completely change the
> > interface, just to shift page handling stuff to middle layer
> > functions. So yeah kinda "step towards" only :)
> 
> In your patchset, PG_checked is get and set by fsverity_drop_block() and
> fsverity_read_merkle_tree_block(), which are located in fs/verity/ and called by
> other code in fs/verity/.  I don't see this as being a separate layer from the
> rest of fs/verity/.  If it was done by the individual filesystems (e.g.
> fs/ext4/) that would be different, but it's not.  I think keeping fs/verity/
> aware of PG_checked is the right call, and it's not necessary to do the half-way
> move that sort of moves it to a different place in the stack but not really.
> 
> - Eric
> 

I see, thanks! I will move back

-- 
- Andrey

