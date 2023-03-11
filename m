Received: from r3-24.sinamail.sina.com.cn (r3-24.sinamail.sina.com.cn [202.108.3.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C6257E2
	for <fsverity@lists.linux.dev>; Sat, 11 Mar 2023 00:20:51 +0000 (UTC)
Received: from unknown (HELO localhost.localdomain)([114.249.61.130])
	by sina.com (172.16.97.23) with ESMTP
	id 640BC80600036AD9; Sat, 11 Mar 2023 08:15:04 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
X-SMAIL-MID: 35843754919500
From: Hillf Danton <hdanton@sina.com>
To: Nathan Huckleberry <nhuck@google.com>
Cc: Eric Biggers <ebiggers@kernel.org>,
	fsverity@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] fsverity: Remove WQ_UNBOUND from fsverity read workqueue
Date: Sat, 11 Mar 2023 08:15:15 +0800
Message-Id: <20230311001515.2472-1-hdanton@sina.com>
In-Reply-To: <CAJkfWY6xWhcwfV-E5brz_qvW0v-ebqp8wYhgg_ZWyD9cUp-EJg@mail.gmail.com>
References: <20230309213742.572091-1-nhuck@google.com> <ZAq8Ey8CZ5I2xcpW@sol.localdomain> <20230310065511.2390-1-hdanton@sina.com>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 10 Mar 2023 11:09:55 -0800 Nathan Huckleberry <nhuck@google.com>
> On Fri, Mar 10, 2023 at 12:01=E2=80=AFAM Hillf Danton <hdanton@sina.com> wr=
> ote:
> >
> > On 9 Mar 2023 21:11:47 -0800 Eric Biggers <ebiggers@kernel.org>
> > > On Thu, Mar 09, 2023 at 01:37:41PM -0800, Nathan Huckleberry wrote:
> > > > WQ_UNBOUND causes significant scheduler latency on ARM64/Android.  Th=
> is
> > > > is problematic for latency sensitive workloads like I/O post-processi=
> ng.
> > > >
> > > > Removing WQ_UNBOUND gives a 96% reduction in fsverity workqueue relat=
> ed
> > > > scheduler latency and improves app cold startup times by ~30ms.
> > >
> > > Maybe mention that WQ_UNBOUND was recently removed from the dm-verity w=
> orkqueue
> > > too, for the same reason?
> > >
> > > I'm still amazed that it's such a big improvement!  I don't really need=
>  it to
> > > apply this patch, but it would be very interesting to know exactly why =
> the
> > > latency is so bad with WQ_UNBOUND.
> 
> My current guess for the root cause is excessing saving/restoring of
> the FPSIMD state.
> 
> > >
> > > > This code was tested by running Android app startup benchmarks and
> > > > measuring how long the fsverity workqueue spent in the ready queue.
> > > >
> > > > Before
> > > > Total workqueue scheduler latency: 553800us
> > > > After
> > > > Total workqueue scheduler latency: 18962us
> >
> > Given the gap between data above and the 15253 us in diagram[1], and
> > the SHA instructions[2], could you specify a bit on your test?
> 
> The test I'm running opens the Android messaging APK which is
> validated with fsverity. It opens the messaging app 25 times, dropping
> caches each time. The benchmark produces a Perfetto trace which we use
> to compute the scheduler latency. We sum up the amount of time that
> each fsverity worker spent in the ready state. The test in [1] is
> similar, but may be using a different APK. These tests are not in
> AOSP, so I can't share a link to them, but I would expect that fio on
> a ramdisk would produce similarly good results.

Thanks for your introduction to the test.
Are the similar results ARM64/Android specific? Could this patch help X86?
> 
> >
> > [1] https://lore.kernel.org/linux-erofs/20230106073502.4017276-1-dhavale@=
> google.com/
> > [2] https://lore.kernel.org/lkml/CAJkfWY490-m6wNubkxiTPsW59sfsQs37Wey279L=
> miRxKt7aQYg@mail.gmail.com/
