Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C6218B07
	for <fsverity@lists.linux.dev>; Tue, 12 Sep 2023 14:56:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C3E5C433C8;
	Tue, 12 Sep 2023 14:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694530586;
	bh=AqTUN8VgBwJig4Ntk2M0C5XZpt8OG5zLie1KwqbjcHg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XMQuvX44R8tcegLal9BwXhl0+gbPtU8qVc4Wbg5yLdRdGlAVXbsbdL3ptXwaECxiv
	 v2l8sciTHgL+5K/JJOTzSoGg/VQb51atgxO1wyYKeJaX2nlevH+iOn7Dz55fg705vz
	 WhfzPHhjr1CeWiJVoalZTPTmR78LUHfjGKQcJjLR6v1Xk2RoGcGaUTxMwQMgjWDdSy
	 3zIjsjqVa3OdMhRD3MmocNxoph3WKATIN78guOWQ9DQY++QPIuzp9GUZJXsmI1JJFX
	 Sa6BsucgUIeXjq1zyKvvW/BfTG5CQJ4yqCRnPCOTo9sPF3O2JsSxCwd/Y+kkWoW8SG
	 Jj7Tzq9NP7Msg==
Date: Tue, 12 Sep 2023 07:56:25 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: Zorro Lang <zlang@redhat.com>
Cc: Andrey Albershteyn <aalbersh@redhat.com>, fstests@vger.kernel.org,
	fsverity@lists.linux.dev
Subject: Re: [PATCH] common/rc: make _get_max_file_size find file size on
 mount point
Message-ID: <20230912145625.GD28170@frogsfrogsfrogs>
References: <20230911200617.777985-1-aalbersh@redhat.com>
 <20230912124213.q5irip4lbhoasg5i@zlang-mailbox>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230912124213.q5irip4lbhoasg5i@zlang-mailbox>

On Tue, Sep 12, 2023 at 08:42:13PM +0800, Zorro Lang wrote:
> On Mon, Sep 11, 2023 at 10:06:17PM +0200, Andrey Albershteyn wrote:
> > Currently, _get_max_file_size finds max file size on $TEST_DIR.
> > The tests/generic/692 uses this function to detect file size and
> > then tries to create a file on $SCRATCH_MNT.
> > 
> > This works fine when test and scratch filesystems have the same
> > block size. However, it will fail if they differ, for example, TEST
> > is 4k and SCRATCH is 1k (file will be too big).
> 
> I thought we generally use same mkfs options on TEST_DEV and SCRATCH_DEV.
> If you'd like to test 1k blocksize ext4, shouldn't you make 1k blocksize
> ext4 on TEST_DEV before testing.

Agreed, TEST_DEV (AFAIK) is supposed to have the same options as
SCRATCH_MNT.

That said, I support adding the flexibility to supply a mount point,
since that would be generally useful given the number of tests that add
things to MKFS_OPTIONS...

> Thanks,
> Zorro
> 
> > 
> > Found this by running generic/692 on ext4 with -b 1024.
> > 
> > Make _get_max_file_size accept mount point on which to detect max
> > file size.
> > 
> > Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
> > ---
> >  common/rc         | 8 +++++++-
> >  tests/generic/299 | 2 +-
> >  tests/generic/485 | 2 +-
> >  tests/generic/692 | 2 +-
> >  4 files changed, 10 insertions(+), 4 deletions(-)
> > 
> > diff --git a/common/rc b/common/rc
> > index 68d2ad04..d17ec73a 100644
> > --- a/common/rc
> > +++ b/common/rc
> > @@ -4809,7 +4809,13 @@ _require_scratch_feature()
> >  # be UINT32_MAX * block_size, but other filesystems may allow up to LLONG_MAX.
> >  _get_max_file_size()
> >  {
> > -	local testfile=$TEST_DIR/maxfilesize.$seq
> > +	if [ -z $1 ] || [ ! -d $1 ]; then
> > +		echo "Missing mount point argument for _get_max_file_size"
> > +		exit 1
> > +	fi
> > +
> > +	local mnt=$1
> > +	local testfile=$mnt/maxfilesize.$seq
> >  	local l=0
> >  	local r=9223372036854775807 # LLONG_MAX
> >  
> > diff --git a/tests/generic/299 b/tests/generic/299
> > index d8ecff53..0cd12202 100755
> > --- a/tests/generic/299
> > +++ b/tests/generic/299
> > @@ -30,7 +30,7 @@ NUM_JOBS=$((4*LOAD_FACTOR))
> >  BLK_DEV_SIZE=`blockdev --getsz $SCRATCH_DEV`
> >  FILE_SIZE=$((BLK_DEV_SIZE * 512))
> >  
> > -max_file_size=$(_get_max_file_size)
> > +max_file_size=$(_get_max_file_size $TEST_DIR)
> >  if [ $max_file_size -lt $FILE_SIZE ]; then
> >  	FILE_SIZE=$max_file_size
> >  fi
> > diff --git a/tests/generic/485 b/tests/generic/485
> > index 3f7749ff..8bab450b 100755
> > --- a/tests/generic/485
> > +++ b/tests/generic/485
> > @@ -30,7 +30,7 @@ _require_xfs_io_command "finsert"
> >  _require_xfs_io_command "truncate"
> >  
> >  block_size=$(_get_file_block_size $TEST_DIR)
> > -max_file_size=$(_get_max_file_size)
> > +max_file_size=$(_get_max_file_size $TEST_DIR)
> >  max_blocks=$((max_file_size / block_size))
> >  testfile=$TEST_DIR/testfile.$seq
> >  
> > diff --git a/tests/generic/692 b/tests/generic/692
> > index 95f6ec04..3fb8ac01 100755
> > --- a/tests/generic/692
> > +++ b/tests/generic/692
> > @@ -40,7 +40,7 @@ _scratch_mount
> >  
> >  fsv_file=$SCRATCH_MNT/file.fsv
> >  
> > -max_sz=$(_get_max_file_size)
> > +max_sz=$(_get_max_file_size $SCRATCH_MNT)

...LGTM, so
Reviewed-by: Darrick J. Wong <djwong@kernel.org>

--D

> >  _fsv_scratch_begin_subtest "way too big: fail on first merkle block"
> >  truncate -s $max_sz $fsv_file
> >  _fsv_enable $fsv_file |& _filter_scratch
> > -- 
> > 2.40.1
> > 
> 
