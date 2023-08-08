Received: from box.fidei.email (box.fidei.email [71.19.144.250])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 215F513AFA
	for <fsverity@lists.linux.dev>; Tue,  8 Aug 2023 18:46:29 +0000 (UTC)
Received: from authenticated-user (box.fidei.email [71.19.144.250])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by box.fidei.email (Postfix) with ESMTPSA id 5BD3580C15;
	Tue,  8 Aug 2023 14:46:28 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dorminy.me; s=mail;
	t=1691520389; bh=zboWyX3LOqJT54iC6p239R9WSjBQ9u2mjNYR6izqaxw=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=YTboS0nEd5b0R7WsONge72lwyMWoG8E8DpBn0OTG5htDaLIGa5AAjcXkNKqmpGG3v
	 YPvTCUxG76My5eWBV1d703zsOBLQzsnoogNlDEquv8PieKLeVRafS5/BlSnAFe6aW6
	 RndnupZ2+KnMm1rMO+jVQBjA3y+4ILRv6bVAdJhO4E/++L5YH3pWMIM5375LveK+A4
	 QQOU2NvxIehNSDsQZ1Qm8QbHsZOJeOwd2K7qb8Xd0s122taP0HiC9e0hvyliVLag+l
	 V9xYRwmz9l34rKHfpOMcbnvNZTvKypUefmoMcqGUqmvAyPVdoXzncKskNmvouaeOG8
	 wI/RwM93PXvgQ==
Message-ID: <1b838929-f349-559c-5f69-560c635c1d24@dorminy.me>
Date: Tue, 8 Aug 2023 14:46:27 -0400
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [RFC PATCH v3 9/9] btrfs: test snapshotting encrypted subvol
Content-Language: en-US
To: linux-btrfs@vger.kernel.org, fstests@vger.kernel.org,
 kernel-team@meta.com, ebiggers@google.com, anand.jain@oracle.com,
 fdmanana@suse.com, linux-fscrypt@vger.kernel.org, fsverity@lists.linux.dev,
 zlang@kernel.org
References: <cover.1691530000.git.sweettea-kernel@dorminy.me>
 <400435f749f54e07a23e8e3c67bb717646747cc4.1691530000.git.sweettea-kernel@dorminy.me>
From: Sweet Tea Dorminy <sweettea-kernel@dorminy.me>
In-Reply-To: <400435f749f54e07a23e8e3c67bb717646747cc4.1691530000.git.sweettea-kernel@dorminy.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 8/8/23 13:21, Sweet Tea Dorminy wrote:
> Make sure that snapshots of encrypted data are readable and writeable.
> 
> Test deliberately high-numbered to not conflict.
> 
> Signed-off-by: Sweet Tea Dorminy <sweettea-kernel@dorminy.me>
> ---
>   tests/btrfs/614     |  76 ++++++++++++++++++++++++++++++
>   tests/btrfs/614.out | 111 ++++++++++++++++++++++++++++++++++++++++++++
>   2 files changed, 187 insertions(+)
>   create mode 100755 tests/btrfs/614
>   create mode 100644 tests/btrfs/614.out
> 
> diff --git a/tests/btrfs/614 b/tests/btrfs/614
> new file mode 100755
> index 00000000..87dd27f9
> --- /dev/null
> +++ b/tests/btrfs/614
> @@ -0,0 +1,76 @@
> +#! /bin/bash
> +# SPDX-License-Identifier: GPL-2.0
> +# Copyright (c) 2023 Meta Platforms, Inc.  All Rights Reserved.
> +#
> +# FS QA Test 614
> +#
> +# Try taking a snapshot of an encrypted subvolume. Make sure the snapshot is
> +# still readable. Rewrite part of the subvol with the same data; make sure it's
> +# still readable.
> +#
> +. ./common/preamble
> +_begin_fstest auto encrypt
> +
> +# Import common functions.
> +. ./common/encrypt
> +. ./common/filter
> +
> +# real QA test starts here
> +_supported_fs btrfs
> +
> +_require_test
> +_require_scratch
> +_require_scratch_encryption -v 2
> +_require_command "$KEYCTL_PROG" keyctl
> +
> +_scratch_mkfs_encrypted &>> $seqres.full
> +_scratch_mount
> +
> +udir=$SCRATCH_MNT/reference
> +dir=$SCRATCH_MNT/subvol
> +dir2=$SCRATCH_MNT/subvol2
> +$BTRFS_UTIL_PROG subvolume create $dir >> $seqres.full
> +mkdir $udir
> +
> +_set_encpolicy $dir $TEST_KEY_IDENTIFIER
> +_add_enckey $SCRATCH_MNT "$TEST_RAW_KEY"
> +
> +# get files with lots of extents by using backwards writes.
> +for j in `seq 0 50`; do
> +	for i in `seq 20 -1 1`; do
> +		$XFS_IO_PROG -f -d -c "pwrite $(($i * 4096)) 4096" \
> +		$dir/foo-$j >> $seqres.full | _filter_xfs_io
> +		$XFS_IO_PROG -f -d -c "pwrite $(($i * 4096)) 4096" \
> +		$udir/foo-$j >> $seqres.full | _filter_xfs_io
> +	done
> +done
> +
> +$BTRFS_UTIL_PROG subvolume snapshot $dir $dir2 | _filter_scratch
> +
> +_scratch_remount
> +_add_enckey $SCRATCH_MNT "$TEST_RAW_KEY"
> +sleep 30
Just noticed this sleep, will remove it in the next version.
