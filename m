Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D966C8F4E
	for <fsverity@lists.linux.dev>; Mon, 13 Mar 2023 22:59:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 723FBC433EF;
	Mon, 13 Mar 2023 22:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678748345;
	bh=ZC4ulABqNwkVt6bBtqh6aW13P8sDyfHwW1mYMpHgEpg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hyHav+RtbXhY0kDc3EURUG49lMtu8OWHEYukDYWVN2zek4K73zFK8osswDbTggEEt
	 XTS5vun594fgFROpMk7/X1K85b6k454IA0HLhTug7UpvI/D/Rk3ml3umTMmio8yKnR
	 9HA9z0js4QKnSb+AFynC5Bm8sQtm8IbtjJMxPo4WUNzfOvuvQZjAhKUHXouX6TV0UN
	 zcZD+qQN/U5OT7997yjyPKuURRe2j6IQ6WLc6rKxZ9dd7CgfiMS3qVZJ9nO9danpE9
	 qVYic3sQmJHW6OX9gHNZpal2gG82M4Dznodw7XbOxSwMNcjn+tcNye8HQqu9IsNwi4
	 VIgCTy5jxr5Vg==
Date: Mon, 13 Mar 2023 15:59:03 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Nathan Huckleberry <nhuck@google.com>
Cc: "Theodore Y. Ts'o" <tytso@mit.edu>, fsverity@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] fsverity: Remove WQ_UNBOUND from fsverity read
 workqueue
Message-ID: <ZA+qt0gakiyAoacr@sol.localdomain>
References: <20230310193325.620493-1-nhuck@google.com>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230310193325.620493-1-nhuck@google.com>

On Fri, Mar 10, 2023 at 11:33:25AM -0800, Nathan Huckleberry wrote:
> WQ_UNBOUND causes significant scheduler latency on ARM64/Android.  This
> is problematic for latency sensitive workloads, like I/O
> post-processing.
> 
> Removing WQ_UNBOUND gives a 96% reduction in fsverity workqueue related
> scheduler latency and improves app cold startup times by ~30ms.
> WQ_UNBOUND was also removed from the dm-verity workqueue for the same
> reason [1].
> 
> This code was tested by running Android app startup benchmarks and
> measuring how long the fsverity workqueue spent in the runnable state.
> 
> Before
> Total workqueue scheduler latency: 553800us
> After
> Total workqueue scheduler latency: 18962us
> 
> [1]: https://lore.kernel.org/all/20230202012348.885402-1-nhuck@google.com/
> 
> Signed-off-by: Nathan Huckleberry <nhuck@google.com>
> ---
> Changelog:
> v1 -> v2:
> - Added comment about WQ_UNBOUND
> - Added info about related dm-verity patches in commit message
> 
>  fs/verity/verify.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/fs/verity/verify.c b/fs/verity/verify.c
> index f50e3b5b52c9..782b8b4a24c1 100644
> --- a/fs/verity/verify.c
> +++ b/fs/verity/verify.c
> @@ -387,15 +387,15 @@ EXPORT_SYMBOL_GPL(fsverity_enqueue_verify_work);
>  int __init fsverity_init_workqueue(void)
>  {
>  	/*
> -	 * Use an unbound workqueue to allow bios to be verified in parallel
> -	 * even when they happen to complete on the same CPU.  This sacrifices
> -	 * locality, but it's worthwhile since hashing is CPU-intensive.
> -	 *
>  	 * Also use a high-priority workqueue to prioritize verification work,
>  	 * which blocks reads from completing, over regular application tasks.
> +	 *
> +	 * This workqueue is not marked as unbound for performance reasons.
> +	 * Using an unbound workqueue for crypto operations causes excessive
> +	 * scheduler latency on ARM64.
>  	 */
>  	fsverity_read_workqueue = alloc_workqueue("fsverity_read_queue",
> -						  WQ_UNBOUND | WQ_HIGHPRI,
> +						  WQ_HIGHPRI,
>  						  num_online_cpus());

Applied to https://git.kernel.org/pub/scm/fs/fsverity/linux.git/log/?h=for-next

I adjusted the comment slightly so that the first paragraph doesn't start with
"Also".

- Eric
