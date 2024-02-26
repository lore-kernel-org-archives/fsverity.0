Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BFDEE55F
	for <fsverity@lists.linux.dev>; Mon, 26 Feb 2024 02:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708914278; cv=none; b=LGL+k92pH/gN4WqdueRuIDZtATRSIYFj5I6PLlYeoLiPm7sn/pLOYoS2MsNRkz3N8FSDOHBTapPwq0HvCxEQ2D70HLOxbtrzhLbb8+q2rFW9r8eOo34LDbUWyQ/c25FpcPNG8UifnIZGGwNWVC/YzEmrZl8MtvBtxKybJyE3X38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708914278; c=relaxed/simple;
	bh=X3AP6Bp6b6ancxowuXLy3iTRG7qx8UMTyerNezwbvHU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cQ8VbWqLS9Y279znMiOKjPC46aTg0+A49i06B2MhEPorLzGg5nqnZr8VylO9dp8DqeU6iMtiHxOlB+2qZAin4h0uPo47y1I+wNm9vw+kwZgH76AMwoXFm2WcPcjaiye9KImtWmSIeR8J3aLRZxJ4WMd/Wiw3nHPyVCCKObqkqXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fromorbit.com; spf=pass smtp.mailfrom=fromorbit.com; dkim=pass (2048-bit key) header.d=fromorbit-com.20230601.gappssmtp.com header.i=@fromorbit-com.20230601.gappssmtp.com header.b=xted5inx; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fromorbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fromorbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fromorbit-com.20230601.gappssmtp.com header.i=@fromorbit-com.20230601.gappssmtp.com header.b="xted5inx"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-214def5da12so1506128fac.2
        for <fsverity@lists.linux.dev>; Sun, 25 Feb 2024 18:24:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fromorbit-com.20230601.gappssmtp.com; s=20230601; t=1708914276; x=1709519076; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=keFZRzXSEtuuqVK1R31f2mV75CisjCkl0caiItfXYno=;
        b=xted5inxaUnrLwTt3KRpzKXffQNCOerkMxOby7/nOG9B3IZKS6ECUtlZ+m95QvXfxR
         SOwWP5TC0rHrWy9f1am7qMIsAynsnzNAvR4r6c6y3DK0wVHAMeeGoCcSKzJ45F01VcNp
         PtFjtMZjVD32Bn6/qvhZIypcIWrEvflbve88j4B2xtarVaCzLQ+dIXLpmm0h4fygOg6+
         GjGoRT+PuarnNI2HGIzO7NbKEq2QnUXO11xVOcMzJHEmBE/Y8SQEDzfepKjOthMT6LG7
         2NwX3wRXywgc5gIxFgndZPi5O/LlmN13wD0jxSI4pO7Vt2vFmlIs79k60vPbTQhwmVvR
         WTog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708914276; x=1709519076;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=keFZRzXSEtuuqVK1R31f2mV75CisjCkl0caiItfXYno=;
        b=Vh0g5UU/sqaBUK/3fmTY8y9YcLcWZea0q4kAAg0gp5WIf9e6SlNX/LatOmF2bKkW2X
         sNBZxueaTK9IFH0j1zJZST/89uDCBr0Gz0c76sFpIJKnhvYMzo6wMAIXlcgjhbpwaUy0
         oz3A17QsqdlYmwOhyLxFH/HMhwfdf7WNxH/e4Q3eq+eJamAF8mrEJQSnah0I4C4zp5Wr
         tDPf2jvmhLYuTREhnw1lZ8xKMJvue5dgNBHy3eRhgTj3NYRYwwZ95nCmnfXC79HksX3d
         t/REJe40WkHv7x4WyjcvdDI1jFk/5ORjMS3bgANxIVqVt75qkOW1BE9p+GizhukCcikv
         mxRQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVeQ3XPOC+MSxO5mPgEUm6pXxY6agCoO5Od41ElAYIYVM8tgu9RYQ+LeRNr5P/6VtyJ1y7ZFHnBUAXn5N9I/vqyKtNSkNGyqg=
X-Gm-Message-State: AOJu0YzSdK4YsNrUXiNQLDl2dS+yH1GKdZGySq4K0GpmJfEw6xwrU1Tg
	T8DnoSXbB0ahZARG2NG4/CLAfssx0PYJqdMIHrsd+xOkiE7aLuTEnYnk9YUyPxg=
X-Google-Smtp-Source: AGHT+IEtjhVGkg7sspmH17FkZdrCNpnZ3s/M4MIQx1Fz9aip/f8ld7pswsn1rXp6cfSHQpxNfDG3WQ==
X-Received: by 2002:a05:6871:14a:b0:21e:8fb4:966a with SMTP id z10-20020a056871014a00b0021e8fb4966amr7455096oab.43.1708914276509;
        Sun, 25 Feb 2024 18:24:36 -0800 (PST)
Received: from dread.disaster.area (pa49-181-247-196.pa.nsw.optusnet.com.au. [49.181.247.196])
        by smtp.gmail.com with ESMTPSA id o7-20020a63f147000000b005dc9439c56bsm2913980pgk.13.2024.02.25.18.24.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 18:24:36 -0800 (PST)
Received: from dave by dread.disaster.area with local (Exim 4.96)
	(envelope-from <david@fromorbit.com>)
	id 1reQfR-00BYvq-0r;
	Mon, 26 Feb 2024 13:24:33 +1100
Date: Mon, 26 Feb 2024 13:24:33 +1100
From: Dave Chinner <david@fromorbit.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Andrey Albershteyn <aalbersh@redhat.com>, fsverity@lists.linux.dev,
	linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	chandan.babu@oracle.com, djwong@kernel.org
Subject: Re: [PATCH v4 09/25] fsverity: add tracepoints
Message-ID: <Zdv2YZP0sIzDA5UT@dread.disaster.area>
References: <20240212165821.1901300-1-aalbersh@redhat.com>
 <20240212165821.1901300-10-aalbersh@redhat.com>
 <20240223053156.GE25631@sol.localdomain>
 <copvwl7uhxj7iqlms2tv6shk4ky7lce54jqugg7uiuxgbv34am@3x6pelescjlb>
 <20240223182735.GD1112@sol.localdomain>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240223182735.GD1112@sol.localdomain>

On Fri, Feb 23, 2024 at 10:27:35AM -0800, Eric Biggers wrote:
> On Fri, Feb 23, 2024 at 02:23:52PM +0100, Andrey Albershteyn wrote:
> > On 2024-02-22 21:31:56, Eric Biggers wrote:
> > > On Mon, Feb 12, 2024 at 05:58:06PM +0100, Andrey Albershteyn wrote:
> > > > fs-verity previously had debug printk but it was removed. This patch
> > > > adds trace points to the same places where printk were used (with a
> > > > few additional ones).
> > > 
> > > Are all of these actually useful?  There's a maintenance cost to adding all of
> > > these.
> > > 
> > 
> > Well, they were useful for me while testing/working on this
> > patchset. Especially combining -e xfs -e fsverity was quite good for
> > checking correctness and debugging with xfstests tests. They're
> > probably could be handy if something breaks.
> > 
> > Or you mean if each of them is useful? The ones which I added to
> > signature verification probably aren't as useful as other; my
> > intention adding them was to also cover these code paths.
> 
> Well, I'll have to maintain all of these, including reviewing them, keeping them
> working as code gets refactored, and fixing any bugs that exist or may get
> introduced later in them.  They also increase the icache footprint of the code.
> I'd like to make sure that it will be worthwhile.  The pr_debug messages that I
> had put in fs/verity/ originally were slightly useful when writing fs/verity/
> originally, but after that I never really used them.  Instead I found they
> actually made patching fs/verity/ a bit harder, since I had to make sure to keep
> all the pr_debug statements updated as code changed around them.

pr_debug is largely useless outside of code development purposes.

The value in tracepoints is that they are available for diagnosing
problems on production systems and should be thought of as such.
Yes, you can also use them to debug development code, but in that
environment they are no substitute for custom trace_printk() debug
output.

However, when you have extensive tracepoints coverage, the amount of
custom trace_printk() stuff you need to add to a kernel to debug an
issue ends up being limited, because most of the key state and
object changes in the code are already covered by tracepoints.

> Maybe I am an outlier and other people really do like having these tracepoints
> around.  But I'd like to see a bit more feedback along those lines first.  If we
> could keep them to a more minimal set, that would also be helpful.

For people who are used to subsystems with extensive tracepoint
coverage (like XFS), the lack of tracepoints in all the surrounding
code is jarring. It makes the rest of the system feel like a black
hole where detailed runtime introspection is almost completely
impossible without a *lot* of work.

Extensive tracepoints help everyone in the production support
and diagnosis chain understand what is going on by providing easy to
access runtime introspection for the code. i.e. they provide
benefit to far more people than just the one kernel developer who
enables pr_debug on the subsystem when developing new code...

-Dave.
-- 
Dave Chinner
david@fromorbit.com
