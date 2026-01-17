Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF4529B799
	for <fsverity@lists.linux.dev>; Sat, 17 Jan 2026 23:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768692799; cv=none; b=DDtNRa+nBKtI/K6bX6tYIZIR6Lv8V94e/bh9UPGlj9wzHgPIWtuBlCVxVaD2D3BU0ECxWO/rrHQaeF++Z6q4QzhR9//YuWYKK03YVarXuvjaTlx3pOI1qsXc3l42XcsBcLLNDIVz0FhVUKLMpj54FDP+SWCF/wvp5G/2yFlDfx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768692799; c=relaxed/simple;
	bh=V3TNcN1xxwFelPzblf99vEyVNkHmtVYFdI+i2Lt/HFE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZFG5/PnQ5kneOe2MvntrutqVD2F/acjWARbshvQ0RMV9pwVLUOgNjs3hlDmQlC7ujD6HX4kwFIfHUnR/4s7RpMkgn3AOrVommcGHti0+51wNDv7Gnipt7Xdd11HKWVckgkAXNqOrsNmkBXBtLNumDZYHxQGqjm64/bK5cZIgvD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fZ2sPs8u; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fZ2sPs8u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DB28C4CEF7;
	Sat, 17 Jan 2026 23:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768692798;
	bh=V3TNcN1xxwFelPzblf99vEyVNkHmtVYFdI+i2Lt/HFE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fZ2sPs8ud7bZEwVgjc/QWYB0SuyL3d7CQbflKFItsakusSQS2Jpen+Yd3K4JRBkxc
	 lA5J/PaW60vtKRbjZpg/zE2zOoRv/UK/dof0cxXskjBbIpCdSn7uJBi2Vg/uEpb2an
	 g+6k6jJRujOYFxe+srS642dqFI3MFlV8DdASNiyvgiCefeLXv9JxQgZ4oJf9YP/+XG
	 ORIY3Bz6a2uEa3AI2I5XyJRSQBqmZN+xPU6ykS9+uExX2ZOatLNjMnFAxfGDP2jSaV
	 BbugTlOC2YXjUjVWX+/LmjEPRgLNzhGOw/I65K7FIyIIIQIibhIItZ7hfFeiGbaW20
	 vQ6EoXXURoxBA==
Date: Sat, 17 Jan 2026 15:33:10 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Andrey Albershteyn <aalbersh@redhat.com>
Cc: fsverity@lists.linux.dev, aalbersh@kernel.org, djwong@kernel.org
Subject: Re: [PATCH 2/2] fsverity: add tracepoints
Message-ID: <20260117233310.GB74518@quark>
References: <cover.1768219885.patch-series@thinky>
 <3wrdpbzuximevxhielsz5kjzwkbdxhk6dhgzwug4dbj6c3r4ek@dvngy452w2jt>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3wrdpbzuximevxhielsz5kjzwkbdxhk6dhgzwug4dbj6c3r4ek@dvngy452w2jt>

On Mon, Jan 12, 2026 at 01:15:02PM +0100, Andrey Albershteyn wrote:
> fs-verity previously had debug printk but it was removed. This patch
> adds trace points to the same places where printk were used (with a
> few additional ones).

They're not the same places.  Which is the right choice: the locations
of the old debug messages aren't necessarily the places the tracepoints
should be.  But the commit message shouldn't claim otherwise.

> diff --git a/fs/verity/verify.c b/fs/verity/verify.c
> index 86067c8b40..47a66f088f 100644
> --- a/fs/verity/verify.c
> +++ b/fs/verity/verify.c
> @@ -135,6 +135,9 @@
>  		/* Byte offset of the wanted hash relative to @addr */
>  		unsigned int hoffset;
>  	} hblocks[FS_VERITY_MAX_LEVELS];
> +
> +	trace_fsverity_verify_data_block(inode, params, data_pos);
> +
>  	/*
>  	 * The index of the previous level's block within that level; also the
>  	 * index of that block's hash within the current level.
> @@ -214,6 +217,9 @@
>  			want_hash = _want_hash;
>  			kunmap_local(haddr);
>  			put_page(hpage);
> +			trace_fsverity_merkle_hit(inode, data_pos, hblock_idx,
> +					level,
> +					hoffset >> params->log_digestsize);
>  			goto descend;
>  		}
>  		hblocks[level].page = hpage;
> @@ -248,6 +254,9 @@
>  		want_hash = _want_hash;
>  		kunmap_local(haddr);
>  		put_page(hpage);
> +		trace_fsverity_verify_merkle_block(inode,
> +				hblock_idx << params->log_blocksize,
> +				level, hoffset >> params->log_digestsize);
>  	}

The second argument to trace_fsverity_verify_merkle_block() is wrong.
It's "unsigned long index", but the caller passes a byte position.  Note
that byte positions should be u64.  Perhaps you intended for it to be
"unsigned long hblock_idx", like trace_fsverity_merkle_hit(), and for
the caller to pass hblock_idx?

Also note that if the hash doesn't match, then
trace_fsverity_verify_merkle_block() isn't called.  Perhaps it should be
called before the hash check is done?  That's the case for
trace_fsverity_verify_data_block().

- Eric
