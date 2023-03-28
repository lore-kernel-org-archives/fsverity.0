Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17E122772D
	for <fsverity@lists.linux.dev>; Tue, 28 Mar 2023 21:37:21 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id t17-20020a05600c451100b003edc906aeeaso1267387wmo.1
        for <fsverity@lists.linux.dev>; Tue, 28 Mar 2023 14:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1680039440;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l9mUXY2fTp3NpOaMf13/AXwcN1BdLxB4JshaRfNkkvA=;
        b=LsC0TDGpc5Du89+i6T9O/0y/rdDEZpI33OIi6rTu0HJXqcnv10YD2NUgQykhUk1v/b
         A+b0IwRBQlkKyJB48ScP2fXhRLx3+WuuhabEiodSaO4Xz/8HiLtUxJ0w2QPe+atXlQRF
         xMaZo8OdLA8evF21KLR2tJanXPrAcRTPZj8JIlGnFQitATkZZbW4ibzqIeHlsOVrjZj+
         k9FKArAVlZxFkWgxGehyFi7mBvlEPsCFV5bQqyLaoRvQ2CaZcqgyxS2QYqk5lz9OJnTI
         A69ZJL7OLbAfOhssyltoYuAbAEb5ZVIof4zFH+2MXotfRoXF1g1x9tiDne74vTTNQC5R
         qUtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680039440;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l9mUXY2fTp3NpOaMf13/AXwcN1BdLxB4JshaRfNkkvA=;
        b=XpWV6u9sczWf2E6YttKiZRove+ogVuXOwbmCmqGa6tbNYuKKg6mx8H1SAvB6sA6MiV
         TXX56q49sCcIxbV7b6Ig+jKgSRVqCp+vEqUSeiXnA8EjB8mXkUZyCvUF4XEJevppU/kh
         56uvkR7EU+YBSLtPDV198YY+QswCu1c3qC6RctgCYPdIj+f22yZtHdu2yiguMrLEgRNA
         eCXVmh/L4BjIQUKMoL+ebJMpeuXDn/grgFvClefTvhdeZlZQrwqYx3YfKhlATg/HMdp1
         w3snMu/nGipsGN6OCQZvkzO++LysRjhLhzUY67fTgalpRnTUtUVDhj7upr1ogpC8TmAj
         TAdg==
X-Gm-Message-State: AO0yUKXrlvqAdNJWhMOjJziKCxfrz7EHZHVXwr931cteK3SWtUEAnRk+
	H2kYrff02IBW1VWCT5P3MbPR8xa1eHBjGHeazQsfSQ==
X-Google-Smtp-Source: AK7set/3zq6EZKdAG8vT7X0NpWPNFSiINcfJerOMaDKlpJ3vkgVdChsQLfIjZCF5YHgXXZGQ4WkEOetwa87H4mFEV3o=
X-Received: by 2002:a05:600c:228f:b0:3ed:5c86:d828 with SMTP id
 15-20020a05600c228f00b003ed5c86d828mr3765570wmf.6.1680039440043; Tue, 28 Mar
 2023 14:37:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230320210724.GB1434@sol.localdomain> <CAHk-=wgE9kORADrDJ4nEsHHLirqPCZ1tGaEPAZejHdZ03qCOGg@mail.gmail.com>
 <ZBlJJBR7dH4/kIWD@slm.duckdns.org> <CAHk-=wh0wxPx1zP1onSs88KB6zOQ0oHyOg_vGr5aK8QJ8fuxnw@mail.gmail.com>
 <ZBulmj3CcYTiCC8z@slm.duckdns.org> <CAHk-=wgT2TJO6+B=Pho1VOtND-qC_d1PM1FC-Snf+sRpLhR=hg@mail.gmail.com>
In-Reply-To: <CAHk-=wgT2TJO6+B=Pho1VOtND-qC_d1PM1FC-Snf+sRpLhR=hg@mail.gmail.com>
From: Nathan Huckleberry <nhuck@google.com>
Date: Tue, 28 Mar 2023 14:36:00 -0700
Message-ID: <CAJkfWY6JkiZKdM0AwS0QPsoVhxru0g3g9NWwM=5BbK61c1N5ZA@mail.gmail.com>
Subject: Re: [GIT PULL] fsverity fixes for v6.3-rc4
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Tejun Heo <tj@kernel.org>, Eric Biggers <ebiggers@kernel.org>, fsverity@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	"Theodore Ts'o" <tytso@mit.edu>, Victor Hsieh <victorhsieh@google.com>, 
	Lai Jiangshan <jiangshanlai@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hey all,
On Thu, Mar 23, 2023 at 11:04=E2=80=AFAM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Wed, Mar 22, 2023 at 6:04=E2=80=AFPM Tejun Heo <tj@kernel.org> wrote:
> >
> > Thanks for the pointers. They all seem plausible symptoms of work items
> > getting bounced across slow cache boundaries. I'm off for a few weeks s=
o
> > can't really dig in right now but will get to it afterwards.
>
> So just as a gut feeling, I suspect that one solution would be to
> always *start* the work on the local CPU (where "local" might be the
> same, or at least a sibling).
>
> The only reason to migrate to another CPU would be if the work is
> CPU-intensive, and I do suspect that is commonly not really the case.
>
> And I strongly suspect that our WQ_CPU_INTENSIVE flag is pure garbage,
> and should just be gotten rid of, because what could be considered
> "CPU intensive" in under one situation might not be CPU intensive in
> another one, so trying to use some static knowledge about it is just
> pure guess-work.
>
> The different situations might be purely contextual things ("heavy
> network traffic when NAPI polling kicks in"), but it might also be
> purely hardware-related (ie "this is heavy if we don't have CPU hw
> acceleration for crypto, but cheap if we do").
>
> So I really don't think it should be some static decision, either
> through WQ_CPU_INTENSIVE _or_ through "WQ_UNBOUND means schedule on
> first available CPU".

I agree that these flags are prone to misuse. In most cases, there's
no explanation for why the flags are being used. Either the flags were
enabled unintentionally or the author never posted a performance
justification.

Imo figuring out which set of flags to set on which architecture is
too much of a burden for each workqueue user.

>
> Wouldn't it be much nicer if we just noticed it dynamically, and
> WQ_UNBOUND would mean that the workqueue _can_ be scheduled on another
> CPU if it ends up being advantageous?
>
> And we actually kind of have that dynamic flag already, in the form of
> the scheduler. It might even be explicit in the context of the
> workqueue (with "need_resched()" being true and the workqueue code
> itself might notice it and explicitly then try to spread it out), but
> with preemption it's more implicit and maybe it needs a bit of
> tweaking help.
>
> So that's what I mean by "start the work as local CPU work" - use that
> as the baseline decision (since it's going to be the case that has
> cache locality), and actively try to avoid spreading things out unless
> we have an explicit reason to, and that reason we could just get from
> the scheduler.

This would work for the use cases I'm worried about. Most of the work
items used for IO post-processing are really fast. I suspect that the
interaction between frequency scaling and WQ_UNBOUND is causing the
slowdowns.

>
> The worker code already has that "wq_worker_sleeping()" callback from
> the scheduler, but that only triggers when a worker is going to sleep.
> I'm saying that the "scheduler decided to schedule out a worker" case
> might be used as a "Oh, this is CPU intensive, let's try to spread it
> out".
>
> See what I'm trying to say?
>
> And yes, the WQ_UNBOUND case does have a weak "prefer local CPU" in
> how it basically tends to try to pick the current CPU unless there is
> some active reason not to (ie the whole "wq_select_unbound_cpu()"
> code), but I suspect that is then counter-acted by the fact that it
> will always pick the workqueue pool by node - so the "current CPU"
> ends up probably being affected by what random CPU that pool was
> running on.
>
> An alternative to any scheduler interaction thing might be to just
> tweak "first_idle_worker()". I get the feeling that that choice is
> just horrid, and that is another area that could really try to take
> locality into account. insert_work() realyl seems to pick a random
> worker from the pool - which is fine when the pool is per-cpu, but
> when it's the unbound "random node" pool, I really suspect that it
> might be much better to try to pick a worker that is on the right cpu.
>
> But hey, I may be missing something. You know this code much better than =
I do.
>
>                   Linus

Thanks,
Huck
