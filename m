Received: from r3-19.sinamail.sina.com.cn (r3-19.sinamail.sina.com.cn [202.108.3.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EEFAED0
	for <fsverity@lists.linux.dev>; Fri, 10 Mar 2023 07:30:40 +0000 (UTC)
Received: from unknown (HELO localhost.localdomain)([114.249.61.130])
	by sina.com (172.16.97.35) with ESMTP
	id 640AD441000361A4; Fri, 10 Mar 2023 14:54:58 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
X-SMAIL-MID: 27839015074332
From: Hillf Danton <hdanton@sina.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Nathan Huckleberry <nhuck@google.com>,
	fsverity@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] fsverity: Remove WQ_UNBOUND from fsverity read workqueue
Date: Fri, 10 Mar 2023 14:55:11 +0800
Message-Id: <20230310065511.2390-1-hdanton@sina.com>
In-Reply-To: <ZAq8Ey8CZ5I2xcpW@sol.localdomain>
References: <20230309213742.572091-1-nhuck@google.com>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 9 Mar 2023 21:11:47 -0800 Eric Biggers <ebiggers@kernel.org>
> On Thu, Mar 09, 2023 at 01:37:41PM -0800, Nathan Huckleberry wrote:
> > WQ_UNBOUND causes significant scheduler latency on ARM64/Android.  This
> > is problematic for latency sensitive workloads like I/O post-processing.
> > 
> > Removing WQ_UNBOUND gives a 96% reduction in fsverity workqueue related
> > scheduler latency and improves app cold startup times by ~30ms.
> 
> Maybe mention that WQ_UNBOUND was recently removed from the dm-verity workqueue
> too, for the same reason?
> 
> I'm still amazed that it's such a big improvement!  I don't really need it to
> apply this patch, but it would be very interesting to know exactly why the
> latency is so bad with WQ_UNBOUND.
> 
> > This code was tested by running Android app startup benchmarks and
> > measuring how long the fsverity workqueue spent in the ready queue.
> > 
> > Before
> > Total workqueue scheduler latency: 553800us
> > After
> > Total workqueue scheduler latency: 18962us

Given the gap between data above and the 15253 us in diagram[1], and
the SHA instructions[2], could you specify a bit on your test?

[1] https://lore.kernel.org/linux-erofs/20230106073502.4017276-1-dhavale@google.com/
[2] https://lore.kernel.org/lkml/CAJkfWY490-m6wNubkxiTPsW59sfsQs37Wey279LmiRxKt7aQYg@mail.gmail.com/
