Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E32D738D
	for <fsverity@lists.linux.dev>; Mon, 12 Jan 2026 22:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768255378; cv=none; b=E9jy2hq1YJEKV/zXJP+SAg1ZIzJqtKbZ5VORBXE1AEIqm2ZQRtwqZKkD2PMTZlBhrS7WrHjwILzu7G0TBju3AxRT8mndYf+tIkLVOtSZ9jK/YvRIfmec0fPACtKBxBHTGNciOnpCpJgR6lAoXhdEGmHgmiJ1PLOUMdkZUOFz+eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768255378; c=relaxed/simple;
	bh=kscQBq26DUr9dVJdPtfurqeSTrNIlHfoRK+UNftyK8g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aTrfYM+zhr5QGsRi8KlRNeQQ1rIIFY98zxUiCwvz1S6BDRRXhavyrIyjdjJRFAr/wx4YJOuZYbvGwqs7Kd7PLfVZ5hbsO8uuGBKOcctT1hB8UyZD6GmIasAHdMOeUC5SkpJNArZ+JxAOJJL+gzScGXRTBdIxiWHrmU+5fjQ8PY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bcbSfszS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bcbSfszS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF327C116D0;
	Mon, 12 Jan 2026 22:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768255377;
	bh=kscQBq26DUr9dVJdPtfurqeSTrNIlHfoRK+UNftyK8g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bcbSfszSucazOc0hm7XT700NHkqWtr9oQoFSN9fYqYBBJQXbbI99529Y5YKldvTHy
	 m9oayDWZweuOeSE6Yt7OScmFFs+hB4UEFE+bASOo+ALHn35QppQbu5ZnMhnKwOY1ZI
	 erhd8uxucvqCgUSW6/DnFfkowrrh6Ql53mr2W7SzXhlztteYneu+dLjZcU8c/CQUcr
	 nD3f7xi4uL0VWMf78kZN8BDS8azVHAi/8XVOeIK79MvqVCAcG/oK21mRhYAdAmgjta
	 zNyT2Ij8zmc7h1Bzs2+6LtTkqZeZNEpO6lgT7PDBXFpwjcdpv6JYlFYRh5vIyQ6wbk
	 g9V9ooDj3hEtA==
Date: Mon, 12 Jan 2026 14:02:57 -0800
From: "Darrick J. Wong" <djwong@kernel.org>
To: Andrey Albershteyn <aalbersh@redhat.com>
Cc: fsverity@lists.linux.dev, ebiggers@kernel.org, aalbersh@kernel.org
Subject: Re: [PATCH 1/2] fs: add FS_XFLAG_VERITY for fs-verity files
Message-ID: <20260112220257.GG15551@frogsfrogsfrogs>
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
> ---
>  Documentation/filesystems/fsverity.rst | 16 ++++++++++++++++
>  fs/file_attr.c                         |  4 ++++
>  include/linux/fileattr.h               |  2 +-
>  include/uapi/linux/fs.h                |  1 +
>  4 files changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/filesystems/fsverity.rst b/Documentation/filesystems/fsverity.rst
> index 412cf11e32..541ac4af4b 100644
> --- a/Documentation/filesystems/fsverity.rst
> +++ b/Documentation/filesystems/fsverity.rst
> @@ -341,6 +341,22 @@
>  FS_IOC_GETFLAGS and FS_IOC_MEASURE_VERITY because it doesn't require
>  opening the file, and opening verity files can be expensive.
>  
> +FS_IOC_FSGETXATTR
> +-----------------
> +
> +Since Linux v6.19, the FS_IOC_FSGETXATTR ioctl sets FS_XFLAG_VERITY (0x00020000)

We're headed to v7.0 now, please update that.

> +in the returned flags when the file has verity enabled. Note that this attribute
> +cannot be set with FS_IOC_FSSETXATTR as enabling verity requires input
> +parameters. See FS_IOC_ENABLE_VERITY.
> +
> +file_getattr
> +------------
> +
> +Since Linux v6.19, the file_getattr() syscall sets FS_XFLAG_VERITY (0x00020000)
> +in the returned flags when the file has verity enabled. Note that this attribute
> +cannot be set with file_setattr() as enabling verity requires input parameters.
> +See FS_IOC_ENABLE_VERITY.
> +
>  .. _accessing_verity_files:
>  
>  Accessing verity files
> diff --git a/fs/file_attr.c b/fs/file_attr.c
> index 13cdb31a3e..f44c873af9 100644
> --- a/fs/file_attr.c
> +++ b/fs/file_attr.c
> @@ -37,6 +37,8 @@
>  		fa->flags |= FS_DAX_FL;
>  	if (fa->fsx_xflags & FS_XFLAG_PROJINHERIT)
>  		fa->flags |= FS_PROJINHERIT_FL;
> +	if (fa->fsx_xflags & FS_XFLAG_VERITY)
> +		fa->flags |= FS_VERITY_FL;
>  }
>  EXPORT_SYMBOL(fileattr_fill_xflags);
>  
> @@ -67,6 +69,8 @@
>  		fa->fsx_xflags |= FS_XFLAG_DAX;
>  	if (fa->flags & FS_PROJINHERIT_FL)
>  		fa->fsx_xflags |= FS_XFLAG_PROJINHERIT;
> +	if (fa->flags & FS_VERITY_FL)
> +		fa->fsx_xflags |= FS_XFLAG_VERITY;
>  }
>  EXPORT_SYMBOL(fileattr_fill_flags);
>  
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
>  
>  /* Flags to indicate valid value of fsx_ fields */
>  #define FS_XFLAG_VALUES_MASK \
> diff --git a/include/uapi/linux/fs.h b/include/uapi/linux/fs.h
> index 66ca526cf7..70b2b661f4 100644
> --- a/include/uapi/linux/fs.h
> +++ b/include/uapi/linux/fs.h
> @@ -253,6 +253,7 @@
>  #define FS_XFLAG_FILESTREAM	0x00004000	/* use filestream allocator */
>  #define FS_XFLAG_DAX		0x00008000	/* use DAX for IO */
>  #define FS_XFLAG_COWEXTSIZE	0x00010000	/* CoW extent size allocator hint */
> +#define FS_XFLAG_VERITY		0x00020000	/* fs-verity enabled */

Is the indentation broken       ^^^^^^^^ here?

Otherwise this looks fine to me.

--D

>  #define FS_XFLAG_HASATTR	0x80000000	/* no DIFLAG for this	*/
>  
>  /* the read-only stuff doesn't really belong here, but any other place is
> 
> -- 
> - Andrey
> 
