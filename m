Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A767280318
	for <fsverity@lists.linux.dev>; Thu,  2 Apr 2026 14:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775138576; cv=none; b=F9EbSh3LEWeIR4zxRC7S3RgwleFwBTt2ZJ7DfoKNkCcCwM8Xdk1lSs53f4acVWYkNg7ErhlBNIzFi+FKD/HPGuV5fXNY7vpZXVvk0Pwn2X8/60o3yC+24Y/wDTwhSocWYMJNznpXdFFXMAU77dnZJhTDjAqqKpoZhKHUkqMQMms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775138576; c=relaxed/simple;
	bh=9Fkhm2ZSRSyJHuWQcaBHkcSrvxp8mNJsd/iY+/b2TWE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=uxrjC6YXZrQ+bZXrN1f2eSFxHOZIZyGs3ten2XbJhEbUL+NMxL8+/GIZkiTxGGliChDMDNW79ps/CS7TJQ3Ikeae3U+Zq2c8L5bGJo5qChwhe4DvmEQ0EeEkg3ja/kfVvreMuhrtzMThWU2S4qcC6/R+YNWUU4fIGi88IRhMnE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VysHaBO7; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VysHaBO7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775138574;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=c8VJHK7d7kEAfjuBkOl9dg73X5S+EbES2+s86mo3ZVk=;
	b=VysHaBO7HAjwqFdJ9aJjBRJUHwSd9Ak8hSy+RcJo2xHf5cVJkPhA2MJK4E0pElpO86OEKQ
	2yHF7waxuQraMezfV90yGrIWp/gk/7g4KUOowCgEozS8fLhp5yd+vqOJWLmFtl+iKSHQkj
	jTr/XsqW9XviBLR6pdbUVeKSXusHz/0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-576-NHGLnygoMwuDkcmziKMalg-1; Thu, 02 Apr 2026 10:02:53 -0400
X-MC-Unique: NHGLnygoMwuDkcmziKMalg-1
X-Mimecast-MFC-AGG-ID: NHGLnygoMwuDkcmziKMalg_1775138571
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-48886f1bbd4so7220785e9.1
        for <fsverity@lists.linux.dev>; Thu, 02 Apr 2026 07:02:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775138571; x=1775743371;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c8VJHK7d7kEAfjuBkOl9dg73X5S+EbES2+s86mo3ZVk=;
        b=BTblfXLDwm6v8AHHtm+Q4ZY+slcf3kJODWrolVl2mEqiLI55J/mwsmgF2/Featk/Ju
         nBrfHzMkOXLqm7VJBJR7JnYD/bvBo/SjpkMe5+DfG652+dJgOlYzUJAqfNdAP0UkImYM
         AC63AUZrpC51v0PP0CG9Xmp/Q0fnL9n0V5I9tv5GtSatjS0YYnJEBZPKKhVhSpRVP7k5
         OXrHni/J1SRb+h3Go5iH0jwvDOgjsFJau39KQW+Lif3bcQQnw6x8INW2tAlIqU8xLGL8
         sQkKZ2tM/il7VGNnfmL2GwDlfHG4+inY9sdHlDxKhC3+iGgvHEcZ+2P5ralL8gK5HjIH
         S4Jw==
X-Forwarded-Encrypted: i=1; AJvYcCWr2FxiT1J+gAlWTbVdED76AJ+5jrTqOcgZ/R9R2KUx2HGz+stbzONsfWKNy7dFGkaKM4Um5i47uw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy0nrE+xkNAzdSKdCv2JSk30xI4kQAGzWt4awpJkazQOhl4eum2
	fnnXVd0+8bImNHcelHTLtHtftEKA7gYx9xsmZLxqvtsXA9wYZ1di6m3k0p7/MBEdHyxs8DKZ1NR
	b+IOo/PFGxSgOwWdXOuLyKuFQz9xstlpbWfTspGFYgF6MhBmrwsYcJNdpIzs=
X-Gm-Gg: ATEYQzxv41HS5m7B9W2xu9yugMODy4xuBG4D7eY+8kNDs8uE192wysnGiD3HdV4W1Ce
	jdEL+ReN8Cyejg1CfNKV6dzBZzzN+kvjP7p30udxMiVjNSHD5hNSGrlsFeqj3FwxrKCUejFsy2i
	M4xV6xVY7D6H9y2byqpiOqvC2FyQEKx6J/L31eh25tQl4llnGv5I+2kJX0g7OVRrkcAPnNi6r5O
	Bp5Rd5zE/mdBA06pXGRSli+CkMb6sWRCic9W0uK6qjtJEjfoDWXGmg2mFn+x+mSv5zfG4XPou5N
	t9UZs8KhvYRb8oCrqj8+mnkfJKiFyNB05LaopdLRp7OCaZAHOBhplr1eoNiLJ3ftiQWxgMiDIHZ
	kGwyYYxSR3s0mpA==
X-Received: by 2002:a05:600c:310d:b0:487:18c:7acf with SMTP id 5b1f17b1804b1-48883599311mr128837365e9.25.1775138570819;
        Thu, 02 Apr 2026 07:02:50 -0700 (PDT)
X-Received: by 2002:a05:600c:310d:b0:487:18c:7acf with SMTP id 5b1f17b1804b1-48883599311mr128836745e9.25.1775138570201;
        Thu, 02 Apr 2026 07:02:50 -0700 (PDT)
Received: from thinky ([91.245.205.131])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4e6224sm8771795f8f.25.2026.04.02.07.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 07:02:49 -0700 (PDT)
Date: Thu, 2 Apr 2026 16:02:47 +0200
From: Andrey Albershteyn <aalbersh@redhat.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Andrey Albershteyn <aalbersh@kernel.org>, linux-xfs@vger.kernel.org, 
	fsverity@lists.linux.dev, linux-fsdevel@vger.kernel.org, hch@lst.de, 
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
	linux-btrfs@vger.kernel.org, djwong@kernel.org
Subject: Re: [PATCH v6 02/22] fsverity: expose ensure_fsverity_info()
Message-ID: <giol5m6uy5ech26k4cnthqicx7qjzbg6kt6mfg7cyrvbrwwcjd@yi53k4epbu3q>
References: <20260331212827.2631020-1-aalbersh@kernel.org>
 <20260331212827.2631020-3-aalbersh@kernel.org>
 <20260401220241.GG2466@quark>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260401220241.GG2466@quark>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: kfNI9yx4J2C_elA-Lc4rdbeukelZGIubtk5vm4SrpVs_1775138571
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2026-04-01 15:02:41, Eric Biggers wrote:
> On Tue, Mar 31, 2026 at 11:28:03PM +0200, Andrey Albershteyn wrote:
> > This function will be used by XFS's scrub to force fsverity activation,
> > therefore, to read fsverity context.
> > 
> > Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org>
> > Reviewed-by: "Darrick J. Wong" <djwong@kernel.org>
> > ---
> 
> Acked-by: Eric Biggers <ebiggers@kernel.org>
> 
> > +/**
> > + * fsverity_ensure_verity_info() - create verity info if it's not in memory yet
> > + * @inode: the inode for which verity info should be created
> > + *
> > + * Ensure this inode has verity info attached to it. Read fsverity descriptor
> > + * and creates verity based on that. Inodes opened outside of
> > + * file_operations->open will not have any verity info attached. This
> > + * info is required for any fsverity related operations.
> > + *
> > + * Return: 0 on success, -errno on failure
> > + */
> > +int fsverity_ensure_verity_info(struct inode *inode);
> 
> As Christoph mentioned, fs/verity/ uses the convention of the kerneldoc
> for functions being above the function definition.
> 
> I think the comment could also be clearer:
> 
> > create verity info if it's not in memory yet
> 
> Maybe "cache verity info if it's not already cached", to avoid potential
> confusion with enabling fsverity on the file.
> 
> > Ensure this inode has verity info attached to it.
> 
> Maybe add: "It's assumed the inode already has fsverity enabled."
> 
> > Inodes opened outside of file_operations->open will not have any
> > verity info attached. This info is required for any fsverity
> > related operations.
> 
> The first sentence could be misinterpreted as saying that this function
> won't do anything in that case.  The second sentence isn't clear what
> counts as "any fsverity related operation".  Also "opened" doesn't seem
> like the right word to use when talking about a filesystem-internal read
> that occurs without a file descriptor having been opened.
> 
> Maybe replace with:
> 
> * This needs to be called at least once before any of the inode's data
> * can be verified (and thus read at all) or the inode's fsverity digest
> * retrieved.  fsverity_file_open() calls this already, which handles
> * normal file accesses.  If a filesystem does any internal (i.e. not
> * associated with a file descriptor) reads of the file's data or
> * fsverity digest, it must call this explicitly before doing so.
> 
> By the way, should there be a patch that converts
> ovl_ensure_verity_loaded() to use this?

sure, I will add a patch on top replacing ovl's function

-- 
- Andrey

