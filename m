Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A689156C6F
	for <fsverity@lists.linux.dev>; Wed,  3 Apr 2024 22:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712182939; cv=none; b=MuabG1wi8x0dXxP4imJit0vuRoMAqx4l/Qp/rHSdc0K2HdOMiWoD0fW21HKvMoVWCoAak2tp13hbJhFwTY0FdJY4bJAngECuzpb3Hzxwg7lhFTe1ru/IHr3we+OufcHvd4DMXj0+5xDoao3zeiof0fYtfmwyUGR1dsKIh4Hx1jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712182939; c=relaxed/simple;
	bh=3KSVOJaDalXFFs+Rv4rVlWYBzeDs1N7n9QWb828tI/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qlHhtDXQnYq6b3fVwt7Sz+aZAI8Is6FV65efiTcYFYQutETQ7KolDd4Ok449clYEDpRF83QVVg05zeKDBm0b4guvpgp73bs0qxWNQmPzG0jh6IUGJHcYl4U8w8Vu8O3jJc5kY/xby9L8h8NzXGxizct6z85DHryaHZePFh8DHvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fromorbit.com; spf=pass smtp.mailfrom=fromorbit.com; dkim=pass (2048-bit key) header.d=fromorbit-com.20230601.gappssmtp.com header.i=@fromorbit-com.20230601.gappssmtp.com header.b=J4Wo8Bly; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fromorbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fromorbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fromorbit-com.20230601.gappssmtp.com header.i=@fromorbit-com.20230601.gappssmtp.com header.b="J4Wo8Bly"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1e034607879so2644615ad.0
        for <fsverity@lists.linux.dev>; Wed, 03 Apr 2024 15:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fromorbit-com.20230601.gappssmtp.com; s=20230601; t=1712182937; x=1712787737; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5mNHE/kgd6uGstPd0OsS5i1TQFRmNf9ft+suhfa4d/A=;
        b=J4Wo8Bly2g6sp189Gnks92aKTlmx3VZo6fypqB/ALNUUm2LWWQmtAAZVcl5qYMO74o
         4/maYXveocuchpENNtxJoVNGyvyziv3vs0OkhcD4ZoOixJ9yW5K6IoGXANajAd+UG7tb
         438h9o/P2v37N6ZYZsD/KEvqQTdaFzdLSR2KTmQ/IvlB+vT1aLy5gjsZuDgDOSNAry/J
         tPu6icX3AqbAWhPFjt0zLWoSmr4sYjcef6iPUVdtEpTvK7U/CuZjsytE76Ssq/fDjQjh
         Q5XKdW4z01ZwApuwTiXR0LpRSPl9OdmjgLHCKq01Jge56qFvWuwzadW2C5HeiHaAoINH
         74QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712182937; x=1712787737;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5mNHE/kgd6uGstPd0OsS5i1TQFRmNf9ft+suhfa4d/A=;
        b=tKzrWKh1eIue4f+Lb8glFoYKuQPC3rTuQqQ/oBY+YEwJvg5P7CIWyXeqESlkvZ/OQw
         wFufqq/ngdrrzUVRdM3Rrk23C27v9CMm878axz/K0qQu8C0MhOBp6PXmaoTCAwnPkdyB
         xJCvUGGYtmYrlF9+lYvoQSUiZHu1nSP/0uhtJkhQQoaz52UMesf+TB0RkHMG03ixWZUW
         4NLilKG+dTW1ZTo8lYozslur2yvasJEDVn/73qhab/9kp+SjrPEDxq6ohiKHhS5os5Qd
         gaQGWeRS7ujuI7oCWPzNXQ3alaCD+3T2KQDe700boLhbX4xqDKp5eEecufeWIbM8enbo
         g0Iw==
X-Forwarded-Encrypted: i=1; AJvYcCV7Gsi6GeqEm/nJ1qry8C5AhVCb3eI4AwYuRi/Cht+EOTAoWCj8+vBG4AZ6cox/mQk92BimbjTDQlM+Mnu+KiziXm0Z8lLmZs8=
X-Gm-Message-State: AOJu0Yw61f5o/FbvdF2qSchxjrRE5BJNbx603rvRUXpZtPv41SULWwqA
	zAN7MgfbhwHSzDXM6BFqchtXMP0fAVfU0APMcJuWeB3llVkDoCWMh9S7X3HDmtU=
X-Google-Smtp-Source: AGHT+IHgaAUVzNrztyNd/wvPHrxK+bRPIaaKmdlj58TK0lUvb6yHDmW+PB08lD3eeuxItg1GdhGR7g==
X-Received: by 2002:a17:902:f38c:b0:1e2:81c1:b35e with SMTP id f12-20020a170902f38c00b001e281c1b35emr609306ple.54.1712182937221;
        Wed, 03 Apr 2024 15:22:17 -0700 (PDT)
Received: from dread.disaster.area (pa49-181-56-237.pa.nsw.optusnet.com.au. [49.181.56.237])
        by smtp.gmail.com with ESMTPSA id w6-20020a170902e88600b001e2772fc413sm1717504plg.309.2024.04.03.15.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 15:22:16 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.96)
	(envelope-from <david@fromorbit.com>)
	id 1rs8zm-0030Er-18;
	Thu, 04 Apr 2024 09:22:14 +1100
Date: Thu, 4 Apr 2024 09:22:14 +1100
From: Dave Chinner <david@fromorbit.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: Colin Walters <walters@verbum.org>, Eric Biggers <ebiggers@kernel.org>,
	Andrey Albershteyn <aalbersh@redhat.com>,
	xfs <linux-xfs@vger.kernel.org>, linux-fsdevel@vger.kernel.org,
	fsverity@lists.linux.dev, Alexander Larsson <alexl@redhat.com>
Subject: Re: [PATCH 28/29] xfs: allow verity files to be opened even if the
 fsverity metadata is damaged
Message-ID: <Zg3WlmTNw6qJW3rE@dread.disaster.area>
References: <171175868489.1988170.9803938936906955260.stgit@frogsfrogsfrogs>
 <171175869022.1988170.16501260874882118498.stgit@frogsfrogsfrogs>
 <2afcf2b2-992d-4678-bf68-d70dce0a2289@app.fastmail.com>
 <20240402225216.GW6414@frogsfrogsfrogs>
 <992e84c7-66f5-42d2-a042-9a850891b705@app.fastmail.com>
 <20240403013903.GG6390@frogsfrogsfrogs>
 <Zgy3+ljJME0pky3d@dread.disaster.area>
 <20240403031910.GH6390@frogsfrogsfrogs>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240403031910.GH6390@frogsfrogsfrogs>

On Tue, Apr 02, 2024 at 08:19:10PM -0700, Darrick J. Wong wrote:
> On Wed, Apr 03, 2024 at 12:59:22PM +1100, Dave Chinner wrote:
> > On Tue, Apr 02, 2024 at 06:39:03PM -0700, Darrick J. Wong wrote:
> > > On Tue, Apr 02, 2024 at 08:10:15PM -0400, Colin Walters wrote:
> > > > >> I hesitate to say it but maybe there should be some ioctl for online
> > > > >> repair use cases only, or perhaps a new O_NOVERITY special flag to
> > > > >> openat2()?
> > > > >
> > > > > "openat2 but without meddling from the VFS"?  Tempting... ;)
> > > > 
> > > > Or really any lower level even filesystem-specific API for the online
> > > > fsck case.  Adding a blanket new special case for all CAP_SYS_ADMIN
> > > > processes covers a lot of things that don't need that.
> > > 
> > > I suppose there could be an O_NOVALIDATION to turn off data checksum
> > > validation on btrfs/bcachefs too.  But then you'd want to careful
> > > controls on who gets to use it.  Maybe not liblzma_la-crc64-fast.o.
> > 
> > Just use XFS_IOC_OPEN_BY_HANDLE same as xfs_fsr and xfsdump do. The
> > handle can be build in userspace from the inode bulkstat
> > information, and for typical inode contents verification purposes we
> > don't actually need path-based open access to the inodes. That would
> > then mean we can simple add our own open flag to return a fd that
> > can do data operations that short-circuit verification...
> 
> Heh, ok.  Are there any private flags that get passed via
> xfs_fsop_handlereq_t::oflags?  Or does that mean defining a top level
> O_FLAG that cannot be passed through openat but /can/ be sent via
> open_by_handle?

AIUI, open flags are arch specific, but I don't think any use the
high bits of the 32 bit space they are defined in.  So I think we
could probably use the high bits in that field for our own purposes
and not get conflicts with generic open flags...

-Dave.
-- 
Dave Chinner
david@fromorbit.com
