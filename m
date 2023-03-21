Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644DA1FA0
	for <fsverity@lists.linux.dev>; Tue, 21 Mar 2023 06:05:27 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id x11so12690217pja.5
        for <fsverity@lists.linux.dev>; Mon, 20 Mar 2023 23:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679378727;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y+SP907X/SeUBhM/PRlD7SkiAzVdHeJVpNjB8FbspAg=;
        b=IWxX3ncjwV8aVOOeyMwIHGxyzIurlBvEVpEHWSM02rtq0lQRKKn6Fd0ceiP5HP5QCA
         6Iri1BCPFS/QW60zHMp0smnIhWfzS7+bHfhpox3t/xQ/Ry+TUDdXsXQJm7+Gm99wsnlR
         8HxBaXwRi13UHPqf9E7LGmbTbWUCRPhblJv35s8FU5cpbihDifZ+Ymp6S50yCTfU5BZM
         SvIIkz7y+rDP17894DoDKBX3sFK4C8QVU+tLPJedkVVW13+wCwAw3+16cqW3+9UgOQJd
         6jfnb2hXYTZTyuVAGDM/MSimYpDNanwaDgOkLEBXrz9GYDk/mtC0jeGqosLeSFjmD/MR
         4jDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679378727;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y+SP907X/SeUBhM/PRlD7SkiAzVdHeJVpNjB8FbspAg=;
        b=OPoTmnPMDpa1Opbu2zLNSF3YmcHIE4gQD5qdqgywLmJMYI0rN7+K3FKAIzTZayqZuq
         XsyCr21ixd8A7jRiviXbONR090MGTpG119ld1DaNFeE4OEqhkCz6hTWBbnt3VO1HrZmx
         r8RaxCOBbZiO8WIaG4Bl58LZ/mzT3O/u3NRYXZbWabmQjJubNnbI04fniv5e5pSvesTU
         8LxWXnzcitk16u6ZiAE1JCjb5HOYw6wOeht0vo0t2cayyJIbc2VG/7h4BB6LyI5RHqlt
         GvZAL5W2K9Z9QYi7M2dZzyd6DUFsqCYcCa0wIiKBkV2/bjH5uxZOO/IkqEtnEyNytrxS
         OvYQ==
X-Gm-Message-State: AO0yUKXwZnoOnKE02YN8I9rOD7OQSMD6KdPPt2iHovJFxiXUN1kS4HKJ
	Vn82iQZOMm+hYJJrjhXCGGiquCrlcbV7Dw==
X-Google-Smtp-Source: AK7set9ukTQm402ocqVk6fh4G3GBri9ryQ7FuCaGIfmYvRLaDVN3QObvZpwlqD55VtxXguDqxQSq2w==
X-Received: by 2002:a17:902:db12:b0:1a1:d949:a52d with SMTP id m18-20020a170902db1200b001a1d949a52dmr1370406plx.65.1679378726453;
        Mon, 20 Mar 2023 23:05:26 -0700 (PDT)
Received: from localhost ([2600:380:4a39:cac0:d7fa:8e4d:47d8:f561])
        by smtp.gmail.com with ESMTPSA id 13-20020a63134d000000b004fb171df68fsm7157609pgt.7.2023.03.20.23.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 23:05:26 -0700 (PDT)
Sender: Tejun Heo <htejun@gmail.com>
Date: Mon, 20 Mar 2023 20:05:24 -1000
From: Tejun Heo <tj@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Eric Biggers <ebiggers@kernel.org>, fsverity@lists.linux.dev,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	Theodore Ts'o <tytso@mit.edu>,
	Nathan Huckleberry <nhuck@google.com>,
	Victor Hsieh <victorhsieh@google.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>
Subject: Re: [GIT PULL] fsverity fixes for v6.3-rc4
Message-ID: <ZBlJJBR7dH4/kIWD@slm.duckdns.org>
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

Hello,

(cc'ing Lai.)

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

Do you remember what the other case was? Was it also on heterogenous arm
setup?

There aren't many differences between unbound workqueues and percpu ones
that aren't concurrency managed. If there are significant performance
differences, it's unlikely to be directly from whatever workqueue is doing.

One obvious thing that comes to mind is that WQ_UNBOUND may be pushing tasks
across expensive cache boundaries (e.g. across cores that are living on
separate L3 complexes). This isn't a totally new problem and workqueue has
some topology awareness, by default, WQ_UNBOUND pools are segregated across
NUMA boundaries. This used to be fine but I think it's likely outmoded now.
given that non-trivial cache hierarchies on top of UMA or inside a node are
a thing these days.

Looking at f959325e6ac3 ("fsverity: Remove WQ_UNBOUND from fsverity read
workqueue"), I feel a bit uneasy. This would be fine on a setup which does
moderate amount of IOs on CPUs with quick enough accelration mechanisms, but
that's not the whole world. Use cases that generate extreme amount of IOs do
depend on the ability to fan out IO related work items across multiple CPUs
especially if the IOs coincide with network activities. So, my intuition is
that the commit is fixing a subset of use cases while likely regressing
others.

If the cache theory is correct, the right thing to do would be making
workqueue init code a bit smarter so that it segements unbound pools on LLC
boundaries rather than NUMA, which would make more sense on recent AMD chips
too. Nathan, can you run `hwloc-ls` on the affected setup (or `lstopo
out.pdf`) and attach the output?

As for the overhead of supporting WQ_UNBOUND, it does add non-trivial amount
of complexity but of the boring kind. It's all managerial stuff which isn't
too difficult to understand and relatively easy to understand and fix when
something goes wrong, so it isn't expensive in terms of supportability and
it does address classes of significant use cases, so I think we should just
fix it.

Thanks.

-- 
tejun
