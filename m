Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFC557E
	for <fsverity@lists.linux.dev>; Thu, 13 Apr 2023 00:25:12 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id la3so13093140plb.11
        for <fsverity@lists.linux.dev>; Wed, 12 Apr 2023 17:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681345512; x=1683937512;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Lfvgtq1GkN0CrIBSozWhdgpFNVT9/wsnnGPGOgGQ6EQ=;
        b=Q8s/e44vAP/ox/zkk2jQIbetGwClWZ/k7XE7rQgc37xW35WHiGiXb/pc/QiCf8wSPk
         9H3CCVhyPwg8Xm6d9XT9WNneP+b+/AlbxhlN/ls3Sl7k1DyIX/mi/hnna8266KIcFg16
         7bFIxK0Qdi8sd9e31BpYOXJtYVlcfYeMTLKhZ92uv20n4CHJmOBnwDvYZxhGaSOL8ENm
         yJWJ3a4byBUU/mdFXdOoJvEe4UaZbHc+5OTz8mVq2Omq3FW5C5joCpJ7sIyeQuCbU3Nn
         Z5E2qrhz9SrNW63kux0zrmcBt4ZMTDa/chZ1qgvybWKK90lD1fOJombgk6miIeS2ohUZ
         Z15w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681345512; x=1683937512;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Lfvgtq1GkN0CrIBSozWhdgpFNVT9/wsnnGPGOgGQ6EQ=;
        b=kT2wMmnCUOSvOM2UQpykcFugfiEhYsqGtT1Sq+3h6EUqHxfvC2PcECGdgNmt4cLQl8
         VTqFXjBwaRzULeGK4V8YobPhxkIKkY7x8Mm/NzoMmBPXHIqs0fJFhl3+6bIV8D64MuGw
         c72aVjoNY+ftYowQaOaJ8J+tkEQ75hhtvBtkrdSk9E87JiFbDWJwdCvIH0QZB/Z+4r1w
         VYLjbs/kH+0x85pt3sdhSejtTW1DYH0p7pZntJftw4I4ujlrzMMaSs5YPjkXrkDvnw5y
         8xJC8QWP8V9NMfPKkZ4NXAl1hfI17UoFbCOstOga5iQ5u0iBebtNWCXV3q4RltPZxR/r
         2Z4A==
X-Gm-Message-State: AAQBX9d57kl5odsqxcfbobT01dvkuMgEFcQ07Fw2DX5UpYp/MPp4txQW
	GpPEchPAusKzs8FghvHPG70=
X-Google-Smtp-Source: AKy350adfUjwp3r+dZrmTD8NvBMDDm6dB1/WtEo95M9lbILkgNOG2NCxY2i3bsAsB2s7cFML7PAIcw==
X-Received: by 2002:a05:6a20:8b0a:b0:da:a7db:48bb with SMTP id l10-20020a056a208b0a00b000daa7db48bbmr187609pzh.42.1681345512215;
        Wed, 12 Apr 2023 17:25:12 -0700 (PDT)
Received: from localhost (2603-800c-1a02-1bae-a7fa-157f-969a-4cde.res6.spectrum.com. [2603:800c:1a02:1bae:a7fa:157f:969a:4cde])
        by smtp.gmail.com with ESMTPSA id m14-20020aa7900e000000b005d866d184b5sm52620pfo.46.2023.04.12.17.25.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Apr 2023 17:25:11 -0700 (PDT)
Sender: Tejun Heo <htejun@gmail.com>
Date: Wed, 12 Apr 2023 14:25:10 -1000
From: Tejun Heo <tj@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Eric Biggers <ebiggers@kernel.org>, fsverity@lists.linux.dev,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	Theodore Ts'o <tytso@mit.edu>,
	Nathan Huckleberry <nhuck@google.com>,
	Victor Hsieh <victorhsieh@google.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>
Subject: Re: [GIT PULL] fsverity fixes for v6.3-rc4
Message-ID: <ZDdL5s_wprnlF7ad@slm.duckdns.org>
References: <20230320210724.GB1434@sol.localdomain>
 <CAHk-=wgE9kORADrDJ4nEsHHLirqPCZ1tGaEPAZejHdZ03qCOGg@mail.gmail.com>
 <ZBlJJBR7dH4/kIWD@slm.duckdns.org>
 <CAHk-=wh0wxPx1zP1onSs88KB6zOQ0oHyOg_vGr5aK8QJ8fuxnw@mail.gmail.com>
 <ZBulmj3CcYTiCC8z@slm.duckdns.org>
 <CAHk-=wgT2TJO6+B=Pho1VOtND-qC_d1PM1FC-Snf+sRpLhR=hg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHk-=wgT2TJO6+B=Pho1VOtND-qC_d1PM1FC-Snf+sRpLhR=hg@mail.gmail.com>

Hello, Linus.

Okay, I'm now back online.

On Thu, Mar 23, 2023 at 11:04:25AM -0700, Linus Torvalds wrote:
> On Wed, Mar 22, 2023 at 6:04 PM Tejun Heo <tj@kernel.org> wrote:
> >
> > Thanks for the pointers. They all seem plausible symptoms of work items
> > getting bounced across slow cache boundaries. I'm off for a few weeks so
> > can't really dig in right now but will get to it afterwards.
> 
> So just as a gut feeling, I suspect that one solution would be to
> always *start* the work on the local CPU (where "local" might be the
> same, or at least a sibling).

Yeah, that seems like the sanest way to leverage the scheduler. The only
complication is around tracking which workers were on which CPUs and how
sticky the cpu association should be (e.g. we don't want to unnecessarily
jump workers across CPUs but we probably don't want to maintain strict
per-cpu worker pools either). I'll try to come up with a reasonable
trade-off which isn't too complicated.

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

Yeah, CPU_INTENSIVE was added as an easy (to implement) way out for cpu
hogging percpu work items. Given that percpu workers track the scheduling
events anyway whether from preemption or explicit schedule(), it should be
possible to remove it while maintaining most of the benefits of worker
concurrency management. Because the scheduler isn't aware of work item
boundaries, workqueue can't blindly use scheduling events but that's easy to
resolve with an extra timestamp.

I'll think more about whether it'd be a good idea to subject unbound workers
to concurrency management before it gets spread out so that the only
distinction between percpu and unbound is whether the work item can be
booted off cpu when they run for too long while being subject to the same
concurrency control before that point.

> So that's what I mean by "start the work as local CPU work" - use that
> as the baseline decision (since it's going to be the case that has
> cache locality), and actively try to avoid spreading things out unless
> we have an explicit reason to, and that reason we could just get from
> the scheduler.
> 
> The worker code already has that "wq_worker_sleeping()" callback from
> the scheduler, but that only triggers when a worker is going to sleep.
> I'm saying that the "scheduler decided to schedule out a worker" case
> might be used as a "Oh, this is CPU intensive, let's try to spread it
> out".
> 
> See what I'm trying to say?

Yeah, lemme look into it. It'd be great to simplify workqueue usage and
actually make it leverage what the scheduler knows about what should run
where.

Thanks.

-- 
tejun
