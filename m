Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F88F33F0
	for <fsverity@lists.linux.dev>; Tue, 21 Mar 2023 18:31:55 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id cn12so17761902edb.4
        for <fsverity@lists.linux.dev>; Tue, 21 Mar 2023 11:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1679423513;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rarCJTaTo4fdrlFa6VngK6oUmjz7+X/mzHPYdyRgEGI=;
        b=FF1iHk/5Gnr8aDscZUit9Y8GtXIQAL1e5mjGc2AbjwpZTDOWsV8MomqzMfskU2blnF
         jmgmomSxcT8rAbFK2fSSYTEs0Hx+ZkUdL++GsJuGjv1xJzo9K3QX8dX2PV34A7FHquep
         x2+CXrgMgneDP3vHP+8mC3TlA6H/uZyKBD1tM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679423513;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rarCJTaTo4fdrlFa6VngK6oUmjz7+X/mzHPYdyRgEGI=;
        b=lYV2WNX9DVDb+wTDYK3rICtfrtpqooUXmz3EGv+Wy1PcsVO7U94Ve2LPtcBi8Xtukp
         8Fc9T0lnJbY99/THIhJ2+3qPt3O74TI9qGnhmfWt055vI2HIKpDoZcjZr9F7DiL2vNC0
         2Linbo1yT2g2ufd/nO4/VmQaTnuLVFFUYG2yX859/uwo0taGwWHjdops0JqNhlQ+FqLU
         R6u+tOpbLLSGILqK5sJDYfl7sLLGZsb9Wbn0j+g6fHDU8d2PrcFEZ49f3K25L/ipzjO2
         DCxU/DNNXFP464HWhffDS41ztoJoqtcvy30cGGXvDqRBZuP11ps6UcZdjde9u7dlNswi
         PybA==
X-Gm-Message-State: AO0yUKXFNUKYchfMgSqesYYS/WTpoua4uZEQ7HgkreCm3lQE/RhlQezD
	/vVqMtJCQYJAEcymENj9zjymnf+DrgfemEttm+PXPA==
X-Google-Smtp-Source: AK7set/7fqBszGCIlNterizmtix/oh6jjxsAcvAsv6WcykQW7apfXp2wAvtXltwKECUkUBJPtpUhQA==
X-Received: by 2002:a17:906:5a81:b0:932:217c:b85d with SMTP id l1-20020a1709065a8100b00932217cb85dmr3585764ejq.37.1679423513262;
        Tue, 21 Mar 2023 11:31:53 -0700 (PDT)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com. [209.85.208.48])
        by smtp.gmail.com with ESMTPSA id k22-20020a170906129600b00931508e55dasm6101765ejb.202.2023.03.21.11.31.52
        for <fsverity@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Mar 2023 11:31:52 -0700 (PDT)
Received: by mail-ed1-f48.google.com with SMTP id ew6so420731edb.7
        for <fsverity@lists.linux.dev>; Tue, 21 Mar 2023 11:31:52 -0700 (PDT)
X-Received: by 2002:a17:907:9b03:b0:932:da0d:9375 with SMTP id
 kn3-20020a1709079b0300b00932da0d9375mr2384431ejc.4.1679423512122; Tue, 21 Mar
 2023 11:31:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230320210724.GB1434@sol.localdomain> <CAHk-=wgE9kORADrDJ4nEsHHLirqPCZ1tGaEPAZejHdZ03qCOGg@mail.gmail.com>
 <ZBlJJBR7dH4/kIWD@slm.duckdns.org>
In-Reply-To: <ZBlJJBR7dH4/kIWD@slm.duckdns.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 21 Mar 2023 11:31:35 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh0wxPx1zP1onSs88KB6zOQ0oHyOg_vGr5aK8QJ8fuxnw@mail.gmail.com>
Message-ID: <CAHk-=wh0wxPx1zP1onSs88KB6zOQ0oHyOg_vGr5aK8QJ8fuxnw@mail.gmail.com>
Subject: Re: [GIT PULL] fsverity fixes for v6.3-rc4
To: Tejun Heo <tj@kernel.org>
Cc: Eric Biggers <ebiggers@kernel.org>, fsverity@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	"Theodore Ts'o" <tytso@mit.edu>, Nathan Huckleberry <nhuck@google.com>, Victor Hsieh <victorhsieh@google.com>, 
	Lai Jiangshan <jiangshanlai@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 20, 2023 at 11:05=E2=80=AFPM Tejun Heo <tj@kernel.org> wrote:
>
> Do you remember what the other case was? Was it also on heterogenous arm
> setup?

Yup. See commit c25da5b7baf1 ("dm verity: stop using WQ_UNBOUND for verify_=
wq")

But see also 3fffb589b9a6 ("erofs: add per-cpu threads for
decompression as an option").

And you can see the confusion this all has in commit 43fa47cb116d ("dm
verity: remove WQ_CPU_INTENSIVE flag since using WQ_UNBOUND"), which
perhaps should be undone now.

> There aren't many differences between unbound workqueues and percpu ones
> that aren't concurrency managed. If there are significant performance
> differences, it's unlikely to be directly from whatever workqueue is doin=
g.

There's a *lot* of special cases for WQ_UNBOUND in the workqueue code,
and they are a lot less targeted than the other WQ_xyz flags, I feel.
They have their own cpumask logic, special freeing rules etc etc.

So I would say that the "aren't many differences" is not exactly true.
There are subtle and random differences, including the very basic
"queue_work()" workflow.

Now, I assume that the arm cases don't actually use
wq_unbound_cpumask, so I assume it's mostly the "instead of local cpu
queue, use the local node queue", and so it's all on random CPU's
since nobody uses NUMA nodes.

And no, if it's caching effects, doing it on LLC boundaries isn't
rigth *either*. By default it should probably be on L2 boundaries or
something, with most non-NUMA setups likely having one single LLC but
multiple L2 nodes.

              Linus
