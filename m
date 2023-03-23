Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5EA419C
	for <fsverity@lists.linux.dev>; Thu, 23 Mar 2023 01:04:29 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id l7so3029756pjg.5
        for <fsverity@lists.linux.dev>; Wed, 22 Mar 2023 18:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679533469;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3MwmtD+ic/YD9AyL8GSa44JOfk9u43RAIZVxl0paBN4=;
        b=nNWuSwOKH7BEiohFuQh8LGj92GHaM785BhB+8I7fhMFecxliFp4fYI96zs1ZmhCHja
         /a+Vi96g7rM+x8sytO1qBz2ktxxLSwRH6vFxoqVOkGR51RmwbYn/PrQvf6w88GVdvUd8
         L5U4qnUn5VDhkQ8Gw73+ibbp/vpz8pW4iw/+qXrbirP2l2pV1P3zccWs2j7vm/Ti5OzF
         MmplpwhLhrJiWm+yhk6D6jI/H2iATV6+rD0f9tUwQwgtpFSGoG99C/iskLw31MkwqZi1
         keFZu2EHthZgN/AMoALvbn0c5p8SYC0eXZxVmGHTCc5icFD4ydZxukQhXW4ad/Dqyn3S
         4M+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679533469;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3MwmtD+ic/YD9AyL8GSa44JOfk9u43RAIZVxl0paBN4=;
        b=hpnapEskADXPsgCWHnJOQdq8v+mzgY+th39pRGlrfkqpRqiTGz3r+7H1IW/JY3/W3G
         BU/MFWTwvXFcTIY7sSKREnmUZMv3A4Z3arhYrwntzOjHkNDtwkjkF7HzULAr7+81Vqcr
         Z2SDJoDHf6I9l0B4IfSAZnpY4j3qYkkSyZU5m7wjf0hOA+Y9zIoJk0EM9oz/tzmdcUff
         IUZBis+tlKFgFeYgFkrVwITrEQ0qeWta7RAf74hFzHiQLPI7OjUQVD00WtP9RSayVUh0
         s1WXbJ6VyFdxoDgFu5Vjx40nArlI1NZXOMFT1ltUG02K25wX5IS+3Ai4QGHiLEQnUlhJ
         Df9g==
X-Gm-Message-State: AO0yUKVCKZiq6fFrD0o8ovfRHFJ1aAQjsvfL/E1lvbU/fABzUbqRnj9Z
	qhiauHJB7sVJvVbybq6nSJo=
X-Google-Smtp-Source: AK7set/1gln3iAMgLULjYc0mJevIs3D097MVVyf2kRHldya7bcuKEj6gPk2dSI0VPDXHP267caITgw==
X-Received: by 2002:a17:903:430c:b0:19f:31cc:47fc with SMTP id jz12-20020a170903430c00b0019f31cc47fcmr3557378plb.39.1679533468693;
        Wed, 22 Mar 2023 18:04:28 -0700 (PDT)
Received: from localhost (2603-800c-1a02-1bae-a7fa-157f-969a-4cde.res6.spectrum.com. [2603:800c:1a02:1bae:a7fa:157f:969a:4cde])
        by smtp.gmail.com with ESMTPSA id o11-20020a1709026b0b00b0019a96d3b456sm7386086plk.44.2023.03.22.18.04.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 18:04:28 -0700 (PDT)
Sender: Tejun Heo <htejun@gmail.com>
Date: Wed, 22 Mar 2023 15:04:26 -1000
From: Tejun Heo <tj@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Eric Biggers <ebiggers@kernel.org>, fsverity@lists.linux.dev,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	Theodore Ts'o <tytso@mit.edu>,
	Nathan Huckleberry <nhuck@google.com>,
	Victor Hsieh <victorhsieh@google.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>
Subject: Re: [GIT PULL] fsverity fixes for v6.3-rc4
Message-ID: <ZBulmj3CcYTiCC8z@slm.duckdns.org>
References: <20230320210724.GB1434@sol.localdomain>
 <CAHk-=wgE9kORADrDJ4nEsHHLirqPCZ1tGaEPAZejHdZ03qCOGg@mail.gmail.com>
 <ZBlJJBR7dH4/kIWD@slm.duckdns.org>
 <CAHk-=wh0wxPx1zP1onSs88KB6zOQ0oHyOg_vGr5aK8QJ8fuxnw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHk-=wh0wxPx1zP1onSs88KB6zOQ0oHyOg_vGr5aK8QJ8fuxnw@mail.gmail.com>

Hello, Linus.

On Tue, Mar 21, 2023 at 11:31:35AM -0700, Linus Torvalds wrote:
> On Mon, Mar 20, 2023 at 11:05 PM Tejun Heo <tj@kernel.org> wrote:
> >
> > Do you remember what the other case was? Was it also on heterogenous arm
> > setup?
> 
> Yup. See commit c25da5b7baf1 ("dm verity: stop using WQ_UNBOUND for verify_wq")
> 
> But see also 3fffb589b9a6 ("erofs: add per-cpu threads for
> decompression as an option").
> 
> And you can see the confusion this all has in commit 43fa47cb116d ("dm
> verity: remove WQ_CPU_INTENSIVE flag since using WQ_UNBOUND"), which
> perhaps should be undone now.

Thanks for the pointers. They all seem plausible symptoms of work items
getting bounced across slow cache boundaries. I'm off for a few weeks so
can't really dig in right now but will get to it afterwards.

> > There aren't many differences between unbound workqueues and percpu ones
> > that aren't concurrency managed. If there are significant performance
> > differences, it's unlikely to be directly from whatever workqueue is doing.
> 
> There's a *lot* of special cases for WQ_UNBOUND in the workqueue code,
> and they are a lot less targeted than the other WQ_xyz flags, I feel.
> They have their own cpumask logic, special freeing rules etc etc.
>
> So I would say that the "aren't many differences" is not exactly true.
> There are subtle and random differences, including the very basic
> "queue_work()" workflow.

Oh yeah, pwq management side is pretty involved, being dynamic and all. I
just couldn't think of anything in the issue & execution path which would
explain the reported significant performance penalty. The issue path
differences come down to node selection and dynamic pwq release handling,
neither of which should be in play in this case.

> Now, I assume that the arm cases don't actually use
> wq_unbound_cpumask, so I assume it's mostly the "instead of local cpu
> queue, use the local node queue", and so it's all on random CPU's
> since nobody uses NUMA nodes.
> 
> And no, if it's caching effects, doing it on LLC boundaries isn't
> rigth *either*. By default it should probably be on L2 boundaries or
> something, with most non-NUMA setups likely having one single LLC but
> multiple L2 nodes.

Hmm... on recent x86 cpus, that'd just end up paring up the hyperthreads,
which would likely be too narrow especially given that l3's on recent cpus
seem pretty fast. I think what I need to do is generalizing the numa logic
so that it can sit on any of these topological boundaries and let arch
define the default boundary and let each wq to override the selection.

Another related shortcoming is that while the unbound wq's say "let the
scheduler figure out the best solution within the boundary", they don't
communicate the locality of work item to the scheduler at all, so within
each boundary, from scheduler pov, the assignment is completely random. Down
the line, it'd probably help if wq can provide some hints re. the expected
locality.

Thanks.

-- 
tejun
