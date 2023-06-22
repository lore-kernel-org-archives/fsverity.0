Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D36DF1F959
	for <fsverity@lists.linux.dev>; Thu, 22 Jun 2023 16:12:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20F80C433C8;
	Thu, 22 Jun 2023 16:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687450331;
	bh=TKZRfnR4n/iTZWADKYS9VFZow7KLOzVKoauwE1u0x6I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jm5l9bSMvfTDnE/vlS5Va1isUeLA2b3InhneuY3jrz8U050HpDzSzSWgRnMkRR5fQ
	 c3s2OOZs+l8ESUnKfy3cZgaFtpMMjKUqu50ZDFlG48I6LVnlFZPwKxoc45MyrL0+zu
	 ftq58+45eP3zXHlxEuuhFMPQmgT1UBmHNpLQc8CuwQ4O65B+/CZLvJo+7yEQ65Jdvw
	 aykPpEETJbRz4IJIAnk3jL2vi8RiSIWa2xjrkV8eOcNvwaSssloQJJ9IMSiqczbi8v
	 WiOgIUgzJRnF2PC4CsGaNcJA2qaPlfoEQCA0awKjAco4h/OjdEi75pI4PV2fA+AY+8
	 L7CySAVBUjySQ==
Date: Thu, 22 Jun 2023 09:12:09 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Amir Goldstein <amir73il@gmail.com>
Cc: Alexander Larsson <alexl@redhat.com>, tytso@mit.edu, miklos@szeredi.hu,
	linux-unionfs@vger.kernel.org, fsverity@lists.linux.dev
Subject: Re: [PATCH v3 0/4] ovl: Add support for fs-verity checking of
 lowerdata
Message-ID: <20230622161209.GA1191@sol.localdomain>
References: <cover.1686565330.git.alexl@redhat.com>
 <CAOQ4uxgmV1KKCeq8=8FPkAciwqPpz8JiSM8WEuxDaZbVuYcQ7Q@mail.gmail.com>
 <CAL7ro1EiYOOOqexrKy+UXRzmpGyCaNec3+LHGxnA0YfmoMDN3A@mail.gmail.com>
 <CAL7ro1FKwgUY4e7N_vYi0cFsuVx6St0-oKvcBkiRFnzLH8D1eQ@mail.gmail.com>
 <CAOQ4uxgVnv7wtwFZaBnEotFCwQD1EZcSK2KW4K4vRD8d9fzCiw@mail.gmail.com>
 <CAL7ro1FY6OmhypFGDjinOkkjyJzymntVje4nRA558dKY+KsgzQ@mail.gmail.com>
 <CAOQ4uxjuhzxgTxmRXxczJLDrMzKKr-jzS3R8ESwkw4XQ+UyAfQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOQ4uxjuhzxgTxmRXxczJLDrMzKKr-jzS3R8ESwkw4XQ+UyAfQ@mail.gmail.com>

Hi Amir,

On Thu, Jun 22, 2023 at 12:36:59PM +0300, Amir Goldstein wrote:
> > > What do I need to do in order to enable verity on ext4 besides
> > > enabling FS_VERITY in the kernel?
> > >
> > > I'm getting these on verity tests on ext4 in the default 4k config.
> > > _require_scratch_verity() doesn't mention any requirement other
> > > that 4K blocks and extent format files.
> > >
> > > Thanks,
> > > Amir.
> > >
> > > BEGIN TEST 4k (10 tests): Ext4 4k block Wed Jun 14 06:04:25 UTC 2023
> > > DEVICE: /dev/vdb
> > > EXT_MKFS_OPTIONS: -b 4096
> > > EXT_MOUNT_OPTIONS: -o block_validity
> > > FSTYP         -- ext4
> > > PLATFORM      -- Linux/x86_64 kvm-xfstests
> > > 6.4.0-rc2-xfstests-00026-g35774ba7f07c #1596 SMP PREEMPT_DYNAMIC Tue
> > > Jun 13 18:16:59 IDT 2023
> > > MKFS_OPTIONS  -- -F -q -b 4096 /dev/vdc
> > > MOUNT_OPTIONS -- -o acl,user_xattr -o block_validity /dev/vdc /vdc
> > >
> > > generic/572        [06:04:42] [06:04:47] [not run]
> > > generic/572 -- ext4 verity isn't usable by default with these mkfs options
> > > ...
> >
> > You need to "tune2fs -O verity" (or pass -O verity to mkfs.ext4).
> >
> 
> That was indeed missing in my setup, but it did not fix the problem.
> 
> Turned out that I had a very old version of fsverity installed in my
> kvm-xfstest test VM, where there is no --block-size option to
> fsverity enable would always fail.

That would do it.  So the tests were in fact skipping themselves as expected;
just the skip message was not clear.

> 
> Eric,
> 
> You may consider adding a check for minimal version of
> fsverity or check for support of --block-size option to make
> this error reason more clear for testers.

I'm thinking it wouldn't be worth bothering, as the --block-size option was in
the first actual release of fsverity-utils (v1.0).  You must have pulled down a
work-in-progress version of fsverity-utils back in 2018 or early 2019, well
before the kernel support for fsverity was upstreamed, and then never updated
it.  I expect this issue affects very few people.

> Ted,
> 
> FYI, FSVERITY_GIT in fstests-bld/config points to an out of date URL

It was already updated several months ago.  Please run 'git pull'.

> 
> How come there is no ext4/cfg/verity in fstests-bld?

xfstests has a verity test *group*, which contains the tests that were written
specifically to test verity.

An xfstests-bld test config is something that applies to all tests.  Features
like "encrypt" have an xfstests-bld test config since there is a way to
enable/use those features in all tests.  In the case of encrypt that means
mounting the filesystem with "-o test_dummy_encryption".

In the case of verity, there is no way to enable/use verity in all tests.  (It
would be possible to always enable "-O verity" on the filesystem, but that does
nothing to make verity actually be used/tested.)  Hence, it doesn't have an
xfstests-bld test config.

> Are you guys not testing fsverity with fstests-bld?

We are.  The documented way to test fsverity is to use kvm-xfstests:
https://www.kernel.org/doc/html/latest/filesystems/fsverity.html#tests

> Should we just add fsverity config or add verity to ext4/cfg/encrypt
> instead to avoid growing the test matrix?
> 
> I can send patches for fstests-bld fixing the above if you like.

As per the above, I don't think there is anything to fix.

- Eric
