Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F31E2C6B2
	for <fsverity@lists.linux.dev>; Mon, 29 Apr 2024 10:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714385763; cv=none; b=ej8XZJfThrjPIFQfJZQYBKTADegU4lFCKB42QEZCsfdhxyZqxTNWg9Wv41E0phxWK+PeMihxdMzqDLHQUx2ADK2jcpC8TjWJj38axOviJv8yv+Gvs2RMO4Lrbr0PLP3JfjykPX73863mVE+U6fosWZH7FxdGV78mjePBZsQVVKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714385763; c=relaxed/simple;
	bh=lKTOU9N+85BvqC3gloCf/TwFceRQrNXCqbIxxTFKCTo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=IWbdrU72pNssI6keTMA2v8gYH7gXvglQbXlxAWl1oprL+wXYXwkwfv+qw5jq4PVDGkphZ3cRQR3pMod8clq/iRm20J4Idp4By4GLomj68ZcvXjoPCdRXu4mZy/fDaUGDKSD6BD2EfE/O729u1bieK7PkaqDB2/gX0a4JeIYFAKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=f8zreU4S; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="f8zreU4S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714385761;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JNchlTgOKwFFInGOdGwC6RbeyHgd+ZHvemJPoJarTq4=;
	b=f8zreU4SMNuOodLF6kg+XzyTNOh8RtmtS2hKaTCP4TKVBdIqThczDGsRwxXAh3TNmyQrop
	jT4l23+jjUk53iv7cRWg4gOm+evpkpYvodW6JE06B1FDc940osGknqVytE4zCx27aFC3LK
	Sun3v9Fp62/dxZjWlQyTMfPEn87rdgw=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-217-gq2evYPJOe6LOQVxvJWXSQ-1; Mon, 29 Apr 2024 06:15:59 -0400
X-MC-Unique: gq2evYPJOe6LOQVxvJWXSQ-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-56c1ac93679so3351158a12.2
        for <fsverity@lists.linux.dev>; Mon, 29 Apr 2024 03:15:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714385758; x=1714990558;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JNchlTgOKwFFInGOdGwC6RbeyHgd+ZHvemJPoJarTq4=;
        b=LbZlkty3y0+wfHscOrQmvePScTHdbPw5PUJU6TEbKP7TQbS9kdMQ2CmSXqbN9YdLrU
         c4GdNcz+sfiCt7SVNXmsW36wFZ2GGObN1E2CzGhOpvJDE5fP7B3gvCQB1zgHISF9fnit
         nByTLhttdpsmdOguLpT/KyB1caWtDVlbLCQcUW5PUB5AH7rWVFDjMKeNIBTAavkk4EHk
         RF2s6BnnVslkyJauneGxkKZ3nvgWkKC049fSYbLH90iMKKAWC2eL6xSdU1yBHAay6IwS
         Jlj7vXKMEioyX6njk5R98/xArvkdeFXB/ypCWjQgZJ1ODImgwvKBzioSYoaPFufxqv9B
         s9ZA==
X-Forwarded-Encrypted: i=1; AJvYcCUlfS75RrsYOJddvhVv/8rfDG9cNBQQJg4efuHsXuITYpomkr0vhD8jGYWsFZzLgwSB68OjMqVITcrF74RrTZdQa+4yCRpT5gI=
X-Gm-Message-State: AOJu0YwpQzT7OXlf/tPkcKL+DlX+EBBulKgzUduhpp24a9L2I0FhjmSr
	kXSkZ0BNPxtUZkBvT3rxAeQjmTN5+rvI3JPp/Mnnq0yxBAl6zrB9/QrGTZQD00VRFFjHjcO9wJJ
	Dgqnr4BEoE60JXgcDA9X67JWnbu0N/LYihkZckq1Q7Nw8E3y9S6ECVaKnEJW7ln8=
X-Received: by 2002:a50:ab0a:0:b0:570:369:3e06 with SMTP id s10-20020a50ab0a000000b0057003693e06mr6735117edc.19.1714385757765;
        Mon, 29 Apr 2024 03:15:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IERi+njQq/kNI4MqXnZavZnU6Y9BVUhxt3DFboXnNrfq5klNd0Tca0cq3Xwn4hhEyNxQ3/zUw==
X-Received: by 2002:a50:ab0a:0:b0:570:369:3e06 with SMTP id s10-20020a50ab0a000000b0057003693e06mr6735084edc.19.1714385757195;
        Mon, 29 Apr 2024 03:15:57 -0700 (PDT)
Received: from thinky ([109.183.6.197])
        by smtp.gmail.com with ESMTPSA id ek17-20020a056402371100b0057266474cd2sm2854873edb.15.2024.04.29.03.15.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 03:15:56 -0700 (PDT)
Date: Mon, 29 Apr 2024 12:15:55 +0200
From: Andrey Albershteyn <aalbersh@redhat.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: Eric Biggers <ebiggers@kernel.org>, linux-xfs@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, fsverity@lists.linux.dev
Subject: Re: [PATCH 12/13] fsverity: remove system-wide workqueue
Message-ID: <j6a357qbjsf346khicummgmutjvkircf7ff7gd7for2ajn4k7q@q6dw22io6dcp>
References: <171175867829.1987804.15934006844321506283.stgit@frogsfrogsfrogs>
 <171175868064.1987804.7068231057141413548.stgit@frogsfrogsfrogs>
 <20240405031407.GJ1958@quark.localdomain>
 <20240424180520.GJ360919@frogsfrogsfrogs>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20240424180520.GJ360919@frogsfrogsfrogs>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2024-04-24 11:05:20, Darrick J. Wong wrote:
> On Thu, Apr 04, 2024 at 11:14:07PM -0400, Eric Biggers wrote:
> > On Fri, Mar 29, 2024 at 05:35:48PM -0700, Darrick J. Wong wrote:
> > > From: Darrick J. Wong <djwong@kernel.org>
> > > 
> > > Now that we've made the verity workqueue per-superblock, we don't need
> > > the systemwide workqueue.  Get rid of the old implementation.
> > 
> > This commit message needs to be rephrased because this commit isn't just
> > removing unused code.  It's also converting ext4 and f2fs over to the new
> > workqueue type.  (Maybe these two parts belong as separate patches?)
> 
> Yes, will fix that.
> 
> > Also, if there are any changes in the workqueue flags that are being used for
> > ext4 and f2fs, that needs to be documented.
> 
> Hmm.  The current codebase does this:
> 
> 	fsverity_read_workqueue = alloc_workqueue("fsverity_read_queue",
> 						  WQ_HIGHPRI,
> 						  num_online_cpus());
> 
> Looking at commit f959325e6ac3 ("fsverity: Remove WQ_UNBOUND from
> fsverity read workqueue"), I guess you want a bound workqueue so that
> the CPU that handles the readahead ioend will also handle the verity
> validation?
> 
> Why do you set max_active to num_online_cpus()?  Is that because the
> verity hash is (probably?) being computed on the CPUs, and there's only
> so many of those to go around, so there's little point in making more?
> Or is it to handle systems with more than WQ_DFL_ACTIVE (~256) CPUs?
> Maybe there's a different reason?
> 
> If you add more CPUs to the system later, does this now constrain the
> number of CPUs that can be participating in verity validation?  Why not
> let the system try to process as many read ioends as are ready to be
> processed, rather than introducing a constraint here?
> 
> As for WQ_HIGHPRI, I wish Dave or Andrey would chime in on why this
> isn't appropriate for XFS.  I think they have a reason for this, but the
> most I can do is speculate that it's to avoid blocking other things in
> the system.

The log uses WQ_HIGHPRI for journal IO completion
log->l_ioend_workqueue, as far I understand some data IO completion
could require a transaction which make a reservation which
could lead to data IO waiting for journal IO. But if data IO
completion will be scheduled first this could be a possible
deadlock... I don't see a particular example, but also I'm not sure
why to make fs-verity high priority in XFS.

> In Andrey's V5 patch, XFS creates its own the workqueue like this:
> https://lore.kernel.org/linux-xfs/20240304191046.157464-10-aalbersh@redhat.com/
> 
> 	struct workqueue_struct *wq = alloc_workqueue(
> 		"pread/%s", (WQ_FREEZABLE | WQ_MEM_RECLAIM), 0, sb->s_id);
> 
> I don't grok this either -- read ioend workqueues aren't usually
> involved in memory reclaim at all, and I can't see why you'd want to
> freeze the verity workqueue during suspend.  Reads are allowed on frozen
> filesystems, so I don't see why verity would be any different.

Yeah maybe freezable can go away, initially I picked those flags as
most of the other workqueues in xfs are in same configuration.

-- 
- Andrey

