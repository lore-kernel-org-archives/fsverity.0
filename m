Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FD17A54
	for <fsverity@lists.linux.dev>; Fri, 10 Mar 2023 05:11:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E820EC433D2;
	Fri, 10 Mar 2023 05:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678425109;
	bh=Ir05dTnlKpuYrWYmjvIjByW9P/6rdMov7XP7tdTrXQ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V4Rf0u0mcIQEPNnYUmIksH/D6LdG5/lIZhK/9nMzWAtuq0XAHfXZvIpd5XTaR3xA9
	 GHyhPBS/CHpjDgdwI5+elrVHKU5FbdhW61kxYBPvhj/mmkIFgrfpTZDi2ObMFaaP3t
	 lZTal9Q/YC7FqzYc5Cm7wgv1LA/rcjIb9M0vI0gaX/+ORnrAkViI2aoiNAHrNm2GFF
	 AZBXPHVXQCGAF1P+8rheRliwk/5mpIudd5LIpEMpkCoc0TpPwBbSv/n+6P5WcLlZuk
	 JGmpMhTaRGPaznNzzslSi9/QDlyN9ewO80539+agcUvft43A7bL46p5bIQYDlbCF75
	 dJ3x20kq7xukQ==
Date: Thu, 9 Mar 2023 21:11:47 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Nathan Huckleberry <nhuck@google.com>
Cc: "Theodore Y. Ts'o" <tytso@mit.edu>, fsverity@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] fsverity: Remove WQ_UNBOUND from fsverity read workqueue
Message-ID: <ZAq8Ey8CZ5I2xcpW@sol.localdomain>
References: <20230309213742.572091-1-nhuck@google.com>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230309213742.572091-1-nhuck@google.com>

On Thu, Mar 09, 2023 at 01:37:41PM -0800, Nathan Huckleberry wrote:
> WQ_UNBOUND causes significant scheduler latency on ARM64/Android.  This
> is problematic for latency sensitive workloads like I/O post-processing.
> 
> Removing WQ_UNBOUND gives a 96% reduction in fsverity workqueue related
> scheduler latency and improves app cold startup times by ~30ms.

Maybe mention that WQ_UNBOUND was recently removed from the dm-verity workqueue
too, for the same reason?

I'm still amazed that it's such a big improvement!  I don't really need it to
apply this patch, but it would be very interesting to know exactly why the
latency is so bad with WQ_UNBOUND.

> 
> This code was tested by running Android app startup benchmarks and
> measuring how long the fsverity workqueue spent in the ready queue.
> 
> Before
> Total workqueue scheduler latency: 553800us
> After
> Total workqueue scheduler latency: 18962us
> 
> Change-Id: I693efee541757851ed6d229430111cd763d39067

No Change-Id in upstream patches, please.

> diff --git a/fs/verity/verify.c b/fs/verity/verify.c
> index f50e3b5b52c9..e8ec37774d63 100644
> --- a/fs/verity/verify.c
> +++ b/fs/verity/verify.c
> @@ -395,7 +395,7 @@ int __init fsverity_init_workqueue(void)
>  	 * which blocks reads from completing, over regular application tasks.
>  	 */
>  	fsverity_read_workqueue = alloc_workqueue("fsverity_read_queue",
> -						  WQ_UNBOUND | WQ_HIGHPRI,
> +						  WQ_HIGHPRI,
>  						  num_online_cpus());

There's a comment just above here that explains why WQ_UNBOUND is being used.
It needs to be updated to explain why WQ_UNBOUND is *not* being used.

- Eric
