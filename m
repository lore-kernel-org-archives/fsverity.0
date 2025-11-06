Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21735335579
	for <fsverity@lists.linux.dev>; Thu,  6 Nov 2025 20:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762461894; cv=none; b=nwxvYlssupH1GQLBCuHmI7pePIt8OEXNk3ZkF3bhkJTluGen33g22/Qg5lJ5w6z64jZ/nE62IQ8VzvKEyUjql9HhHVqT5VoE632j8cncu1D5S899YExOSqdAV8xYDKCBJrRK8YgwwO/W8KmWeDfQgt7zsz1C47E1H3DM5hx0zcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762461894; c=relaxed/simple;
	bh=pvIZZlMlLf0oqJ/g4+4Jkk+3q2pj4jG0JzD5xSPtdPY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JtcLGGo9cvEaP/MuAbrb5LALxsLoRGy3T5m+EoasD7OLThFil8YJ57gw4O8JNzqNEl8enkuFdUsJ37/GFgt6j8exha0y4KePw9bEWnwQH52nT/wk/Bpf+F+b0KoxJAyFme84Bb0lx34BIEKvHWiYJ8kRkeMIZLA/zZrJ5RAbNrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qzl0EgD+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qzl0EgD+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89BFBC4CEFB;
	Thu,  6 Nov 2025 20:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762461893;
	bh=pvIZZlMlLf0oqJ/g4+4Jkk+3q2pj4jG0JzD5xSPtdPY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qzl0EgD+mJAPWuSSFqe8H4D7KfYNy8vbnJvleG931SWG776aDgdyPy+6TCKgWEHA4
	 9GD2GdEelEkX3onGa6j/0h1+GNsETcJsa8Mbfwmn+lb0E8JhiaXYwHIfXyY4fvMwSK
	 L9EyQTOuivajOfupo4g81KsNZ97WGpQXH+kR/+GZXkRw7bWbotijfd/QsknQmdsx0E
	 xg+avhyZo+3ETSF71HMyFhyYR+aUHIronrfC2dqa5JQ5NhKGKqK5yD1MU1RaCR0E5L
	 LXeheCPE/IpP75roBOhnpzSKFYxS4qkjfQRVsY0iHuwRKvXlSy4VpN/AyMpEU8oyFi
	 9YHvl0eJ7jaQA==
Date: Thu, 6 Nov 2025 12:44:51 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Baokun Li <libaokun@huaweicloud.com>
Cc: fsverity@lists.linux.dev, Theodore Ts'o <tytso@mit.edu>
Subject: Re: [QUESTION] Does fs-verity support large folios / large block
 size in ext4?
Message-ID: <20251106204451.GC7015@quark>
References: <10f8d4f8-14c8-46a9-be6e-07758b96bb59@huaweicloud.com>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <10f8d4f8-14c8-46a9-be6e-07758b96bb59@huaweicloud.com>

On Thu, Nov 06, 2025 at 09:02:53PM +0800, Baokun Li wrote:
> I have recently been working on enabling large block size support in ext4.
> I had assumed that fs-verity does not support large folios / large block
> size. However, when testing with 64k LBS using:
> 
>     `kvm-xfstests -c ext4/64k -g verity -x encrypt`
> 
> the tests passed successfully.
> 
> Is this just a coincidence, or has fs-verity code already been updated to
> support large block size / large folios?

It might work already.  I already added support for verifying data from
large folios several years ago:

    commit 5d0f0e57ed900917836385527ce5b122fa1425a3
    Author: Eric Biggers <ebiggers@google.com>
    Date:   Fri Jan 27 14:15:29 2023 -0800

        fsverity: support verifying data from large folios

Note that the Merkle tree block size is still limited to <= PAGE_SIZE.
But that's fine for now; generally people want 4K Merkle tree blocks
anyway.  So the configuration in question, which should be getting
tested when you run that command and should theoretically work, should
be: filesystem_block_size=64K, PAGE_SIZE=4K, merkle_tree_block_size=4K.

Is there a git tree with your work that I can take a look at and confirm
that this is happening?

- Eric
