Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3494EDA96
	for <fsverity@lists.linux.dev>; Fri, 10 Mar 2023 19:10:08 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id c18so4117414wmr.3
        for <fsverity@lists.linux.dev>; Fri, 10 Mar 2023 11:10:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1678475406;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cUHbwYiner6YWWsz85bbEgaPM/h3afo2jYmrpleK+vE=;
        b=rZ8J35Zy4a5UNeiY0zKCgGpGCDSqJvpCJBHyr2aL0aNWu2LVnruvhIiZvRPwj43RA7
         pVOYlwrDYASf3v7G5oIYZrvNXkqELixFJVAFqaHW5/cq4e3Lqc6cuQMptJL5/n9jimSf
         TbpnVYHlHNYsfnS1pzkrNHp3f27uB/YOniDwlLkWd5iCWmhxO+XuDzdYYM/gL3GPXlE2
         8WZo21fE1fFXugrmhhZth3eDSF9twfYBkTwupNQ3WCiAEVMZI42hq7u6GrpCRPUVJk4i
         RPsb5i+QjMyf4AM7NKx0YZHwm/bcT+Itn/ZNJsK0MJGFiRhN5W3nkljaV5ViavA4Ortk
         TDJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678475406;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cUHbwYiner6YWWsz85bbEgaPM/h3afo2jYmrpleK+vE=;
        b=o+uFTExzsAAGKj00SpG/3tQQZKhghLq189A7fc3ufY1Jpatv/Rm3hsO/ApnxiTgbc6
         7xUks5L6NIxXmZ9owaVgYYakQt1dNMwMW9Lj4flD2k2MRIwdM/VbmbowGzmLupXbgHgR
         ebuzVH4xaop9CsdQwpsnTsdyTaM6HgLqZ4WynEUAEr48xMtjCE99mcu6x6aeueJ90mS/
         n9ad3BbnfgMVzk1BkYyzO4wAtuTufcVv0WRdkTfCfFB1Rbfd2YsdM30z0/EOA/b25g1O
         Pj5LikNhsf+cQqnZUkQ4G8sd/VRov7F+CmuS82vAmulhWpE4qYPnv+R7raYt+EKMl9yQ
         5xAw==
X-Gm-Message-State: AO0yUKXk4IewkLC03WmkAqgVZwNDeBwWJ7v7pqlY74HGyvELnV6E9F7J
	6mKy/OxLQOyrq6zc8yzJf9tP1A7GllJsb6PVqjtRGg==
X-Google-Smtp-Source: AK7set9gS2QTGUszwInb5cwaSN89LsS0pyJZW7wVQdRjjaK2gGc6BDOXQq285jV3s5OSsm0S1MCyovF3RiLpgKIv8co=
X-Received: by 2002:a7b:c2b1:0:b0:3eb:5824:f0ee with SMTP id
 c17-20020a7bc2b1000000b003eb5824f0eemr1146298wmk.2.1678475406234; Fri, 10 Mar
 2023 11:10:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230309213742.572091-1-nhuck@google.com> <ZAq8Ey8CZ5I2xcpW@sol.localdomain>
 <20230310065511.2390-1-hdanton@sina.com>
In-Reply-To: <20230310065511.2390-1-hdanton@sina.com>
From: Nathan Huckleberry <nhuck@google.com>
Date: Fri, 10 Mar 2023 11:09:55 -0800
Message-ID: <CAJkfWY6xWhcwfV-E5brz_qvW0v-ebqp8wYhgg_ZWyD9cUp-EJg@mail.gmail.com>
Subject: Re: [PATCH] fsverity: Remove WQ_UNBOUND from fsverity read workqueue
To: Hillf Danton <hdanton@sina.com>
Cc: Eric Biggers <ebiggers@kernel.org>, fsverity@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 10, 2023 at 12:01=E2=80=AFAM Hillf Danton <hdanton@sina.com> wr=
ote:
>
> On 9 Mar 2023 21:11:47 -0800 Eric Biggers <ebiggers@kernel.org>
> > On Thu, Mar 09, 2023 at 01:37:41PM -0800, Nathan Huckleberry wrote:
> > > WQ_UNBOUND causes significant scheduler latency on ARM64/Android.  Th=
is
> > > is problematic for latency sensitive workloads like I/O post-processi=
ng.
> > >
> > > Removing WQ_UNBOUND gives a 96% reduction in fsverity workqueue relat=
ed
> > > scheduler latency and improves app cold startup times by ~30ms.
> >
> > Maybe mention that WQ_UNBOUND was recently removed from the dm-verity w=
orkqueue
> > too, for the same reason?
> >
> > I'm still amazed that it's such a big improvement!  I don't really need=
 it to
> > apply this patch, but it would be very interesting to know exactly why =
the
> > latency is so bad with WQ_UNBOUND.

My current guess for the root cause is excessing saving/restoring of
the FPSIMD state.

> >
> > > This code was tested by running Android app startup benchmarks and
> > > measuring how long the fsverity workqueue spent in the ready queue.
> > >
> > > Before
> > > Total workqueue scheduler latency: 553800us
> > > After
> > > Total workqueue scheduler latency: 18962us
>
> Given the gap between data above and the 15253 us in diagram[1], and
> the SHA instructions[2], could you specify a bit on your test?

The test I'm running opens the Android messaging APK which is
validated with fsverity. It opens the messaging app 25 times, dropping
caches each time. The benchmark produces a Perfetto trace which we use
to compute the scheduler latency. We sum up the amount of time that
each fsverity worker spent in the ready state. The test in [1] is
similar, but may be using a different APK. These tests are not in
AOSP, so I can't share a link to them, but I would expect that fio on
a ramdisk would produce similarly good results.

>
> [1] https://lore.kernel.org/linux-erofs/20230106073502.4017276-1-dhavale@=
google.com/
> [2] https://lore.kernel.org/lkml/CAJkfWY490-m6wNubkxiTPsW59sfsQs37Wey279L=
miRxKt7aQYg@mail.gmail.com/
