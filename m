Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62EE2381C7
	for <fsverity@lists.linux.dev>; Thu,  7 Mar 2024 22:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709852135; cv=none; b=Jm/GwkiiwIC4rDfm0eOQiQ+OJ1JJTdU7S4UvzDmHbXUj95b6V83a1pJQydXgm+6DzDpFUpgyn7yoggWgR0euMgPDr1LG1juxzDpxkCPZnhqyAjx1DYrOjlYSkPWitz8pRbt34v7RLktm/6QqTdH6QNUCXdxGMp2AiwV6DEkv0UE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709852135; c=relaxed/simple;
	bh=mgEkYG6JDq+N5X9EAy4and47TeyQVlJo1Bziuom5wxM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qkvcMnYnD7B0HB7v/P2hbrYfysr/iO8zU7Z7DayeBggD5rrZh3uwKwBZPyJQnIrfBDnpedgLVsMOGKpiPZV5WBAeCftLMkjsAcqEH7FU14DD11wxAt2CtfAJWAsONbiBf/+Y1MArUsCFy8VT4XFkkniRjonbz2Q3st3685aCnLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fromorbit.com; spf=pass smtp.mailfrom=fromorbit.com; dkim=pass (2048-bit key) header.d=fromorbit-com.20230601.gappssmtp.com header.i=@fromorbit-com.20230601.gappssmtp.com header.b=UeCJnHOL; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fromorbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fromorbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fromorbit-com.20230601.gappssmtp.com header.i=@fromorbit-com.20230601.gappssmtp.com header.b="UeCJnHOL"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6e6082eab17so1374759b3a.1
        for <fsverity@lists.linux.dev>; Thu, 07 Mar 2024 14:55:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fromorbit-com.20230601.gappssmtp.com; s=20230601; t=1709852132; x=1710456932; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LVJsO6fx+sT7Z8lY8puxf866746LEHhyhNnsriUumzk=;
        b=UeCJnHOLqZD8Eoaqz8nGvg3WXgAtm3fmuHVtOogHQ128PassTRWIdDBV6PzKmgQAU0
         arcLN99byxXe7e7a7mxXscmLEJ7VzrjbzEA3gVN7tVgUkDc01g5ekQoZCrpKlXvMBL7k
         QxUHhI+qXp2t9J0ro5irH7AI0puytHbELzGFwsiMCaeqvFchqSMNpbApmnG3wu48FViF
         PWusAlQ6z/REos+OzdFpzWbrBqRMAFPd/GhLAugi2CepsCRfs+V/t84Mnk5MtX6yGHTn
         XzGyT7z4ii15n3wbBeuriXrafZGDhgKE9mLRgcnF7U2ETb+sYihvp0TSMTwUWMyMIFpJ
         KWYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709852132; x=1710456932;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LVJsO6fx+sT7Z8lY8puxf866746LEHhyhNnsriUumzk=;
        b=POWdCbtwbk6tl5mv+AfOWCN3iE1p/MONY9PIiJykNlcY4ZRFBn1gKTwx+UiOOg16vl
         G+gC3vAyc3v83fRA7S2qIEMgT2qtDCnr2y5FisptQKNZ0S3pMMXwKyEaNtf2gMLiCGlr
         GktPdlXMqWv23rt6fbWK9bqCLvcX1IAvxi/0w07pdNTcVP5L55LDK+8Qd6kbu8k/Vlbb
         CKT7JW2H6JeFa+29NRP6ipmmNmigHmQ+gbtpvDK7RcUjdHssVike5Q5mgUKCEVit9L8/
         n7mYoq3tFcw6/htpz/3UYT3WvcNwfNdLyDl6SIS2IAEIarOJYa6XEgcnBfWnVebQmH/l
         hWjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUaasGO5IPZEePM9brv30HGpDFQoiio0DZo16ZlNaStk8a0O44kbV6wcL7DPzbSQYLbHgx9PHMCvw4Z/CVbSIZ1TgRqUh3cQFY=
X-Gm-Message-State: AOJu0YyZbmuvrVdw2IgmjR9rHk+/0hzgOlZYxQfWviXqCtCxZnnAa/R+
	1cDHEBfpW8sW7+v5NzzLqg6K7uoCUrpdcYqV97rtF4ltx7IUGSG3jD/Y6RtczQQ=
X-Google-Smtp-Source: AGHT+IGvAKTIKpdXHilR8JjRJDZQqBcdKvQUhJRqeoc1DZ0G4W6lMxeZ5gViaMxOem0ULRgSkX7SfA==
X-Received: by 2002:a05:6a00:ad1:b0:6e6:276a:8ea4 with SMTP id c17-20020a056a000ad100b006e6276a8ea4mr15203940pfl.33.1709852132449;
        Thu, 07 Mar 2024 14:55:32 -0800 (PST)
Received: from dread.disaster.area (pa49-179-47-118.pa.nsw.optusnet.com.au. [49.179.47.118])
        by smtp.gmail.com with ESMTPSA id z19-20020aa785d3000000b006e583a649b4sm13038175pfn.210.2024.03.07.14.55.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 14:55:31 -0800 (PST)
Received: from dave by dread.disaster.area with local (Exim 4.96)
	(envelope-from <david@fromorbit.com>)
	id 1riMe9-00GS6j-0o;
	Fri, 08 Mar 2024 09:55:29 +1100
Date: Fri, 8 Mar 2024 09:55:29 +1100
From: Dave Chinner <david@fromorbit.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: Eric Biggers <ebiggers@kernel.org>,
	Andrey Albershteyn <aalbersh@redhat.com>, fsverity@lists.linux.dev,
	linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	chandan.babu@oracle.com
Subject: Re: [PATCH v5 08/24] fsverity: add per-sb workqueue for post read
 processing
Message-ID: <ZepF4aeI+uskr3zu@dread.disaster.area>
References: <20240304191046.157464-2-aalbersh@redhat.com>
 <20240304191046.157464-10-aalbersh@redhat.com>
 <20240305010805.GF17145@sol.localdomain>
 <20240307215857.GS1927156@frogsfrogsfrogs>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240307215857.GS1927156@frogsfrogsfrogs>

On Thu, Mar 07, 2024 at 01:58:57PM -0800, Darrick J. Wong wrote:
> On Mon, Mar 04, 2024 at 05:08:05PM -0800, Eric Biggers wrote:
> > On Mon, Mar 04, 2024 at 08:10:31PM +0100, Andrey Albershteyn wrote:
> > > For XFS, fsverity's global workqueue is not really suitable due to:
> > > 
> > > 1. High priority workqueues are used within XFS to ensure that data
> > >    IO completion cannot stall processing of journal IO completions.
> > >    Hence using a WQ_HIGHPRI workqueue directly in the user data IO
> > >    path is a potential filesystem livelock/deadlock vector.
> > > 
> > > 2. The fsverity workqueue is global - it creates a cross-filesystem
> > >    contention point.
> > > 
> > > This patch adds per-filesystem, per-cpu workqueue for fsverity
> > > work. This allows iomap to add verification work in the read path on
> > > BIO completion.
> > > 
> > > Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
> > 
> > Should ext4 and f2fs switch over to this by converting
> > fsverity_enqueue_verify_work() to use it?  I'd prefer not to have to maintain
> > two separate workqueue strategies as part of the fs/verity/ infrastructure.
> 
> (Agreed.)
> 
> > > diff --git a/include/linux/fs.h b/include/linux/fs.h
> > > index 1fbc72c5f112..5863519ffd51 100644
> > > --- a/include/linux/fs.h
> > > +++ b/include/linux/fs.h
> > > @@ -1223,6 +1223,8 @@ struct super_block {
> > >  #endif
> > >  #ifdef CONFIG_FS_VERITY
> > >  	const struct fsverity_operations *s_vop;
> > > +	/* Completion queue for post read verification */
> > > +	struct workqueue_struct *s_read_done_wq;
> > >  #endif
> > 
> > Maybe s_verity_wq?  Or do you anticipate this being used for other purposes too,
> > such as fscrypt?  Note that it's behind CONFIG_FS_VERITY and is allocated by an
> > fsverity_* function, so at least at the moment it doesn't feel very generic.
> 
> Doesn't fscrypt already create its own workqueues?

Yes, but iomap really needs it to be a generic sb workqueue like the
sb->s_dio_done_wq.

i.e. the completion processing in task context is not isolated to
fsverity - it will likely also be needed for fscrypt completion and
decompression on read completion, when they get supported by the
generic iomap IO infrastruture. i.e. Any read IO that needs a task
context for completion side data processing will need this.

The reality is that the major filesytsems are already using either
generic or internal per-fs workqueues for DIO completion and
buffered write completions. Some already use buried workqueues on
read IO completion, too, so moving this to being supported by the
generic IO infrastructure rather than reimplmenting it just a little
bit differently in every filesystem makes a lot of sense.

-Dave.
-- 
Dave Chinner
david@fromorbit.com
