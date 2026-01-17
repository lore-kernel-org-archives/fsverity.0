Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B3F14A91
	for <fsverity@lists.linux.dev>; Sat, 17 Jan 2026 23:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768691727; cv=none; b=PUhMuR8rUcIvM7bNF11Owu7ZH3fTy6wx3aD5OhuAYKsftdrYnZd7OyBLu0PIPkObsfUw+wEyNsdIzwBVFKCdL7xKsT5Fq5I4qkyztQlZmP8eBLAToBIq8CIX8Szr1EnsAezHSi86hS92C9bhEayMOR3NQfkvnzEEynx2+G0rGsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768691727; c=relaxed/simple;
	bh=bnX8R95JQ02kNa85Ys1NdRSvbEyzxWJMo6zUz813ql4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KqzM9PvA9dp69PTDP805ROyI0ZDT6weXyiYXLFo7QrmWd4mrHiqbMB7FRELTXoR1kaXXnzNCkgBfWcip3ozUD+ZXvnF7zr6lvfG9BxS/ZDnZrWxjLCkwAiz8T0+xTZufFKaYC04cOnv+MRaxo8TtRel/eH6VqbAYbMQD5MTbRHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E7DI5JH7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E7DI5JH7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ED3CC4CEF7;
	Sat, 17 Jan 2026 23:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768691727;
	bh=bnX8R95JQ02kNa85Ys1NdRSvbEyzxWJMo6zUz813ql4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E7DI5JH7Lqz4DP2KZUb2UCufQD+Twzaz58vZDkkwiUFXsib8yeE7i/NjNhfM0sP1N
	 5dhcjNDsib9p75iZz7ChPUl3AduVbej2A0sX5XDBz5pcTnUF3FKVVZhR3CFMoKDu7d
	 S6R55Pc58B1xYj2WJgMBKfJFQdFdQ/yth5eKK2WvkakJts03MqsCK7dJRP7AUgwtkA
	 BdHqjXPW16S6U+5RSnu/BBl1FqXsYeAwuNuwMfdqegjXXE1Cj8mVR2EnMllMotqJmo
	 5BxRjpbpXCcuEgHgNZ7W+HnPI1te2ePiFTp9kLJzDv08SaftJhQUVo+kA6pd5LgwkZ
	 kRmKvVkU1ntBg==
Date: Sat, 17 Jan 2026 15:15:19 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Andrey Albershteyn <aalbersh@redhat.com>
Cc: fsverity@lists.linux.dev, aalbersh@kernel.org, djwong@kernel.org
Subject: Re: [PATCH 1/2] fs: add FS_XFLAG_VERITY for fs-verity files
Message-ID: <20260117231519.GA74518@quark>
References: <cover.1768219885.patch-series@thinky>
 <osw6nyp4khzjirdl5mf7ebpcuxlqxqggfez62vcx7bfj5kgksv@pt2bvkxmb5t3>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <osw6nyp4khzjirdl5mf7ebpcuxlqxqggfez62vcx7bfj5kgksv@pt2bvkxmb5t3>

On Mon, Jan 12, 2026 at 01:14:21PM +0100, Andrey Albershteyn wrote:
> fs-verity introduced inode flag for inodes with enabled fs-verity on
> them. This patch adds FS_XFLAG_VERITY file attribute which can be
> retrieved with FS_IOC_FSGETXATTR ioctl() and file_getattr() syscall. This
> flag is read-only and can not be set with corresponding set ioctl() and
> file_setattr().
> 
> Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org>

Sender and signed-off-by email addresses don't match:

    WARNING: From:/Signed-off-by: email address mismatch: 'From: Andrey Albershteyn <aalbersh@redhat.com>' != 'Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org>'

> diff --git a/include/linux/fileattr.h b/include/linux/fileattr.h
> index f89dcfad3f..6aebfd63bd 100644
> --- a/include/linux/fileattr.h
> +++ b/include/linux/fileattr.h
> @@ -16,7 +16,7 @@
>  
>  /* Read-only inode flags */
>  #define FS_XFLAG_RDONLY_MASK \
> -	(FS_XFLAG_PREALLOC | FS_XFLAG_HASATTR)
> +	(FS_XFLAG_PREALLOC | FS_XFLAG_HASATTR | FS_XFLAG_VERITY)

Don't FS_COMMON_FL and FS_XFLAG_COMMON need to be updated too?

- Eric
