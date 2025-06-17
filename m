Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2046D8BEC
	for <fsverity@lists.linux.dev>; Tue, 17 Jun 2025 03:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750130726; cv=none; b=SYCM7j42s43b5QXfoFxZnC1QEFSsHMA4JpTMSqKOvRl0jhmQBMs2h31sii93vKerV5cERtGCWpL4EWuEwvCKawl3PNebAfuabvvgKEWQ/GVI++4vPGaSo8s33lmClK5ypbdwVyImOvAAXiUtAjxLfYWcPCwoW8zN8U/1reYWYXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750130726; c=relaxed/simple;
	bh=0GTtVfvBliSS+zp23BaZZJfOr4WpeyIInlcCMtAc9XM=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qW2sa7jZYalWHTsTUlOw3nUMw2GjtAFaEqicl+40NLhVYbamYn1lRZ0TQJsseHkahXM/Cv5HdH1rye7xgB13EpfPUuhGSUZ8b8erwkSsficdfr+hNb/JlBtrvHDluRhAjGsSQy0jYtdnHp3q6yWks/uou8skM2KxayIA7cU7ff4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kXT+8/7v; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kXT+8/7v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99595C4CEEA
	for <fsverity@lists.linux.dev>; Tue, 17 Jun 2025 03:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750130725;
	bh=0GTtVfvBliSS+zp23BaZZJfOr4WpeyIInlcCMtAc9XM=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=kXT+8/7vHIAIZQoifqy2F1TGVUyOksXvv5OhZ3FsXHJ0oVpw1QGmkodm4JZq3Wu/v
	 hNNIsipaM70P6tQ48lx+oQr8FKAWNvsk/wwE5lGgY5nk1BcvJ8M0JhpqreIjNgk2zX
	 D7bwXprgGG+H6zQPb9UwWxnD3w0Tfxso3yJ7i/twcQMBscrHYv6X0k33MAoS6ZJwUS
	 1odXhkgQRPJTPUOsLoFtxYvMJzbh03MwNWd4/Oxg3mUqBu85GGndaex5KdNsjeJ3Qt
	 363cwGZwxI7b3rtgYk3im3eyLXjb53dOrg8OBoXQ7S79RpU4RaCgK9fWRVMsPCsUxu
	 KEihkG1T45sQA==
Date: Mon, 16 Jun 2025 20:24:55 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: fsverity@lists.linux.dev
Subject: Re: [PATCH] fsverity: explicitly include <linux/export.h>
Message-ID: <20250617032455.GA8289@sol>
References: <20250614221723.131827-1-ebiggers@kernel.org>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250614221723.131827-1-ebiggers@kernel.org>

On Sat, Jun 14, 2025 at 03:17:23PM -0700, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Fix build warnings with W=1 that started appearing after
> commit a934a57a42f6 ("scripts/misc-check: check missing #include
> <linux/export.h> when W=1").
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
> 
> This patch applies to v6.16-rc1 and is targeting fsverity/for-next
> 
>  fs/verity/enable.c        | 1 +
>  fs/verity/measure.c       | 1 +
>  fs/verity/open.c          | 1 +
>  fs/verity/read_metadata.c | 1 +
>  fs/verity/verify.c        | 1 +
>  5 files changed, 5 insertions(+)

Applied to https://git.kernel.org/pub/scm/fs/fsverity/linux.git/log/?h=for-next

- Eric
