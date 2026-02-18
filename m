Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A3133D6E7
	for <fsverity@lists.linux.dev>; Wed, 18 Feb 2026 09:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771408664; cv=none; b=ZJaNLXtz8NqEPI+GbqAVgGKAMYICmBdT4B3rTb7ZN8AsYkqfBL+gDynw48LGUK/W0vrMccwmmRXAhlk2KE1lYKsaTM9HJoxjG3eB97p3vXKy9P526vALVm1hRV5uYYoZVRqiaeSXLBa5+k7q6W5ru6z4oN4VTu/ihguIXDMvuAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771408664; c=relaxed/simple;
	bh=6aOIQiPaQR+XKiGerpItA4/7Z/95kKFkL1ZGyjcNy1U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=Hrn0KyrGtysAyEhZVKpQopd4qS3gjld+Uy8cK8itA3LXWElkQT6t90c7dFkB34RSWV/ez3BeH1vJ5rKUN4vbjqrQ3EloknBVkgJjuXJpKDNpwpFJbKxtzSJJ1SYkV5N+aTLOeQXg611Tzcc9oqtX3c9lltrjvO+zxLFeLltZkcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Pmb/AyrD; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Pmb/AyrD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771408662;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=//uspxAcdKQl0NBbsDDK4OeRCiJdPlDUYGGqBQXBcNc=;
	b=Pmb/AyrDlGj8fjG4xU+w3JTcH3GQZhsaKZDzrneSlWkhZ1B0RapIQOJgeqeRbSmuom5syP
	8iG21Umbf1XPurqt5joaq59ZQhaT+4sdX0n7WYKzf3OEXwY0Y79Vsr7Z/uQuB2Tls2oxRu
	jQhd8Xt3hBQsC6QhgrRYd4Ogl8lZDRM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-131-CQD12_vrP2eYDipdKQYJiA-1; Wed, 18 Feb 2026 04:57:39 -0500
X-MC-Unique: CQD12_vrP2eYDipdKQYJiA-1
X-Mimecast-MFC-AGG-ID: CQD12_vrP2eYDipdKQYJiA_1771408658
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4836bf1a920so58758015e9.3
        for <fsverity@lists.linux.dev>; Wed, 18 Feb 2026 01:57:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771408657; x=1772013457;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=//uspxAcdKQl0NBbsDDK4OeRCiJdPlDUYGGqBQXBcNc=;
        b=YeaWOD65lz1MB6wKyW7f5gtD2PkYuBEVN5MPfQASXioVbCXFoSmalhYuGan7d5Rvml
         Knc37rrraU40tcJFq/PqENZGO400/yR9B1k01owuOf8A1KoJ9TM/hzjQz5Bt48h+YqV9
         F5TftZjE2L+dkwmcQB/Wb2f7lkd+Y0GxZWey2pCc2jiSB5UUWMpAbWLIVj7qggnHpnC+
         8g3r3zQNN05I1A8DBw5nkF2ztba9gtwJye1WNfE2+kn9az1cv0uico+HAyVTaixenqRQ
         op5GoSJAi4s6FGRRc2DVU/ESaY8Lf2W0P7TQbrlwePvAt9rXXIQnojV6yS1lYt64oLA0
         5Pvg==
X-Forwarded-Encrypted: i=1; AJvYcCUYPWwLzrQ5NitE0TOJQJ9KawQLjlQQ/t0/WTvfssS0QcO8T8nLnAfVg+TipaNjiGK71ZyxRITTTA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyOuNBBwLXa8R8KrlIBEaPiuqvSccFVaUKg6dcXq0V4CGDK42P/
	hFUgOmIn7Q4MEAgizL5TeJzIjQzqUIHvfogfXwFqWbqcaufv82gg6QXhd5oBhY1gJUqvlL+a7Bb
	W+kCIS8x2a34D5aKyS86DdoRf95y1AfpTLZxPcriWSGwSONA8gVBbZoqL3oA9KEfY1j8=
X-Gm-Gg: AZuq6aJT3oZ/EikwmqA2jZa2Jf1n+quKwaPYP8PsTyNgIz7p2kPEy7FypT7pYc1kJ/6
	m16zgpiAT1ZaOjbppwwqQbvubfmn61fOX3Wmcz99j///5/8zNKVCdhiCRlNweyUv4yJZuD1SRtg
	Iaug2An2s0LdRXpTC6eTFSTf6D5Sn/FFvzs4q7f+IWOYE52ot+2Y2UdgIyGKul2oV782EDTAcT1
	ltGaZXANfk9Z4EsN/xebGP2T5t8EWfJKTTQQ7H9/6WnO6cHHsPyfe/SP2i/nyNic0DVN/kjav/H
	jN8ATfztD+zdMnTnJdzbo0ODTjT0el5vCJ7Z9nigbh4O8XPIx2ij+Te2NIEFSwCz2bgvmmR752a
	0uj2RzMoysTE=
X-Received: by 2002:a05:600c:820f:b0:483:71f7:2797 with SMTP id 5b1f17b1804b1-48379b9f3a3mr224711105e9.14.1771408657369;
        Wed, 18 Feb 2026 01:57:37 -0800 (PST)
X-Received: by 2002:a05:600c:820f:b0:483:71f7:2797 with SMTP id 5b1f17b1804b1-48379b9f3a3mr224710785e9.14.1771408656858;
        Wed, 18 Feb 2026 01:57:36 -0800 (PST)
Received: from thinky ([217.30.74.39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4837b68e5adsm382224275e9.9.2026.02.18.01.57.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 01:57:36 -0800 (PST)
Date: Wed, 18 Feb 2026 10:57:35 +0100
From: Andrey Albershteyn <aalbersh@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Cc: Andrey Albershteyn <aalbersh@kernel.org>, linux-xfs@vger.kernel.org, 
	fsverity@lists.linux.dev, linux-fsdevel@vger.kernel.org, ebiggers@kernel.org, 
	djwong@kernel.org
Subject: Re: [PATCH v3 28/35] xfs: add fs-verity support
Message-ID: <mtnj4ahovgefkl4pexgwkxrreq6fm7hwpk5lgeaihxg7z5zdlz@tpzevymml5qx>
References: <20260217231937.1183679-1-aalbersh@kernel.org>
 <20260217231937.1183679-29-aalbersh@kernel.org>
 <20260218064429.GC8768@lst.de>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260218064429.GC8768@lst.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Qn26-lNDSYNLZNOYVMy6rv6kRWb5AJ_WOqWafRmxQhg_1771408658
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2026-02-18 07:44:29, Christoph Hellwig wrote:
> > +static int
> > +xfs_fsverity_read(
> > +	struct inode	*inode,
> > +	void		*buf,
> > +	size_t		count,
> > +	loff_t		pos)
> > +{
> > +	struct folio	*folio;
> > +	size_t		n;
> > +
> > +	while (count) {
> 
> It might be nice to lift this from ext4/f2fs into common code rather
> than adding yet another duplicate.

sure

> 
> > +static int
> > +xfs_fsverity_write(
> > +	struct file		*file,
> > +	loff_t			pos,
> > +	size_t			length,
> > +	const void		*buf)
> > +{
> > +	int			ret;
> > +	struct iov_iter		iiter;
> > +	struct kvec		kvec = {
> > +		.iov_base	= (void *)buf,
> > +		.iov_len	= length,
> > +	};
> > +	struct kiocb		iocb = {
> > +		.ki_filp	= file,
> > +		.ki_ioprio	= get_current_ioprio(),
> > +		.ki_pos		= pos,
> > +	};
> > +
> > +	iov_iter_kvec(&iiter, WRITE, &kvec, 1, length);
> > +
> > +	ret = iomap_file_buffered_write(&iocb, &iiter,
> > +				   &xfs_buffered_write_iomap_ops,
> > +				   &xfs_iomap_write_ops, NULL);
> > +	if (ret < 0)
> > +		return ret;
> > +	return 0;
> 
> I'd move this to fs/iomap/ as and pass in the ops.

sure

> 
> > +static int
> > +xfs_fsverity_drop_descriptor_page(
> > +	struct inode	*inode,
> > +	u64		offset)
> > +{
> > +	pgoff_t index = offset >> PAGE_SHIFT;
> > +
> > +	return invalidate_inode_pages2_range(inode->i_mapping, index, index);
> > +}
> 
> What is the rationale for this?  Why do ext4 and f2fs get away without
> it?

They don't skip blocks full of zero hashes and then synthesize them.
XFS has holes in the tree and this is handling for the case
fs block size < PAGE_SIZE when these tree holes are in one folio
with descriptor. Iomap can not fill them without getting descriptor
first.

Should I add this to the comment above? Not sure how well it's
described

> 
> > +	pgoff_t			index)
> > +{
> > +	pgoff_t			metadata_idx =
> > +		(fsverity_metadata_offset(inode) >> PAGE_SHIFT);
> > +	pgoff_t			idx = index + metadata_idx;
> > +
> > +	return generic_read_merkle_tree_page(inode, idx);
> 
> I'd write this the same way ext4/f2fs do:
> 
> 	idx += (fsverity_metadata_offset(inode) >> PAGE_SHIFT);
> 	return generic_read_merkle_tree_page(inode, idx);
> 

sure

> 
> 
> > +{
> > +	pgoff_t			metadata_idx =
> > +		(fsverity_metadata_offset(inode) >> PAGE_SHIFT);
> > +	pgoff_t			idx = index + metadata_idx;
> > +
> > +	generic_readahead_merkle_tree(inode, idx, nr_pages);
> 
> Same here.
> 
> > +	if ((i == size) && (size == ip->i_mount->m_sb.sb_blocksize))
> 
> No need for the inner braces.
> 

-- 
- Andrey

