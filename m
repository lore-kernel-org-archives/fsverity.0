Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E117B
	for <fsverity@lists.linux.dev>; Mon, 20 Mar 2023 23:16:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10566C433EF;
	Mon, 20 Mar 2023 23:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679354200;
	bh=0PLTJ2dlKHeW64kUvuueODi7+5ERkPhRoGqtheiUaBA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OUfI0d4BAbv/e/2rcIkkIJ0b1vtb5U3AFJr+IDOJ7MbdRQxCUaqsd/pI0n9Iw9A9h
	 DuhjSPqK0SX9EEpkk9BkeOVxEAdEHW/4UkbaEm3rvQs7TMGO+rpSvWl3AKPvtBN9th
	 jD5jC3fIGkVLwtKF193NHP6olBPkILFYCXuE7QCkFxoAYoXavYCjsUFQng9SuDaFj7
	 w+g2IhMXFYT0C4ec6vGf0K+yfMVq2qYv0FPgnGsSZX/DmsaZgNeUus/ZqZgUutkiTZ
	 CvOiN6UwuIZq0N0vMLqT1lmSK4Y1X8E6MBJ7cGkg2UMsX+fxPAEhaitMLLlNvWBKWB
	 oL6r6v/0o67Eg==
Date: Mon, 20 Mar 2023 16:16:38 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Tejun Heo <tj@kernel.org>, fsverity@lists.linux.dev,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	Theodore Ts'o <tytso@mit.edu>,
	Nathan Huckleberry <nhuck@google.com>,
	Victor Hsieh <victorhsieh@google.com>
Subject: Re: [GIT PULL] fsverity fixes for v6.3-rc4
Message-ID: <20230320231638.GC21979@sol.localdomain>
References: <20230320210724.GB1434@sol.localdomain>
 <CAHk-=wgE9kORADrDJ4nEsHHLirqPCZ1tGaEPAZejHdZ03qCOGg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHk-=wgE9kORADrDJ4nEsHHLirqPCZ1tGaEPAZejHdZ03qCOGg@mail.gmail.com>

On Mon, Mar 20, 2023 at 03:31:13PM -0700, Linus Torvalds wrote:
> On Mon, Mar 20, 2023 at 2:07 PM Eric Biggers <ebiggers@kernel.org> wrote:
> >
> > Nathan Huckleberry (1):
> >       fsverity: Remove WQ_UNBOUND from fsverity read workqueue
> 
> There's a *lot* of other WQ_UNBOUND users. If it performs that badly,
> maybe there is something wrong with the workqueue code.
> 
> Should people be warned to not use WQ_UNBOUND - or is there something
> very special about fsverity?
> 
> Added Tejun to the cc. With one of the main documented reasons for
> WQ_UNBOUND being performance (both implicit "try to start execution of
> work items as soon as possible") and explicit ("CPU intensive
> workloads which can be better managed by the system scheduler"), maybe
> it's time to reconsider?
> 
> WQ_UNBOUND adds a fair amount of complexity and special cases to the
> workqueues, and this is now the second "let's remove it because it's
> hurting things in a big way".
> 
>               Linus

So, Nathan has been doing most of the investigation and testing on this, and
he's out of office at the moment.

But, my understanding is that since modern CPUs have acceleration for all the
common crypto algorithms (including fsverity's SHA-256), the work items just
don't take long enough for the overhead of a context switch to be worth it.
WQ_UNBOUND seems to be optimized for much longer running work items.

Additionally, the WQ_UNBOUND overhead is particularly bad on arm64.  We aren't
sure of the reason for this.  Nathan thinks this is probably related to overhead
of saving/restoring the FPU+SIMD state.  My theory is that it's mainly caused by
heterogeneous processors, where work that would ordinarily run on the fastest
CPU core gets scheduled on a slow CPU core.  Maybe it's a combination of both.

WQ_UNBOUND has been shown to be detrimental to EROFS decompression and to
dm-verity too, so this isn't specific to fsverity.  (fscrypt is still under
investigation.  I'd guess the same applies, but it's been less of a priority
since fscrypt doesn't use a workqueue when inline encryption is being used.)

These are all "I/O post-processing cases", though, so all sort of similar.

- Eric
