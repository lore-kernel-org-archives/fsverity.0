Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3646A3A3826
	for <fsverity@lists.linux.dev>; Wed, 20 May 2026 13:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779283488; cv=pass; b=OFPZY98eorqGjamX8B5V/4rAxNS39Ufeygx4whKfzh+0qU20sS9GhaT+rKVQXcgHUaLQd3emfQQjKz/4Yo5V46aTF5w66njeip0XQ9TyKc/TmxxKHDaleGKdDRexuPoaj191QaeEsKtmYm9lh/iWfYdl958sLbXW3FBqcPn2E2M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779283488; c=relaxed/simple;
	bh=Rit3XOj+nAqSskgBa3AwkCsmGpVaId+gpzvsbFjHRsc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GfE0ST/SNKUpVbyRYLqWW+AEq9w970Ar8OY3hcWNZGTE9dRQOJoO66Q8ROiTjnd5WZ8ovhtazncTqbIdV9NvDJf45+1bMDO7UJAYs2wgPwUz7MhvLu6eDtjZOVrWfpAav3s2QnCS0yuPjUQ8/RjoTRpLp+HMQSUs75IzHfVuL88=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=soIPX58t; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="soIPX58t"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-672645dbfeaso6485589a12.0
        for <fsverity@lists.linux.dev>; Wed, 20 May 2026 06:24:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779283485; cv=none;
        d=google.com; s=arc-20240605;
        b=UBF0tzM+WUzdb9UGo9Q5guKR56BOtHvCjADwuOONpto8FZhnRAM2UHmeEZrzD62JVT
         Y3cPbN4FPZNvkEB4NTECs41okhi+6UmAA2OWJ0eZAw2sXXaN0TOx1tRxX2cvCnCfC9EY
         Ra1xZE8nBvBZm97gY43d1AQX7gWke80fQPnxEfA702jKZPZo4CzvoQDwWBQAvXr9wbSv
         xPR+cgRNN5lfvnhebPg6hpCW7jN9lGaIU/fxPm6U3rliz6K1lG5id2Jb1PwSf9jKE02q
         l/HNlcdLEOr7fbE8+EJQaIPUbu1xFH4GHcvJQiwk7yipNphWm2XTStfJT/LGl0ssjbKJ
         dS0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Rit3XOj+nAqSskgBa3AwkCsmGpVaId+gpzvsbFjHRsc=;
        fh=3ZX7NAThSYKnssAyQQXDVTMHBkOfzQpx/SUSjxXBKvs=;
        b=SYPdvqqaaQL2wCwssVZ41xgVTESjD6MWAIQy5IJ9iW8p+yomhoZJv+8DJDt8M4chxi
         oGYWwKGn2tS4zM9ipTWZBa17MlcUEYvRlVc+1O6XyweNyHt3xcynAplIXAYEEbHo3ieW
         NQAJ2SLqf8UX+BdGlVcJo1fp+5JI5cfxkmRTy3s1SQa01RnBDv1gaIup6izOb7bcIPL/
         2iK41kvDd3WXAxMWz1xaprkpvuyLwkhM9noUk6P+EroptBXK37xv5KlsJvj6UEx9/LrK
         llaG9Up+eJJUF7G0e0e2ZHh+t4uT0q4v+Hz+foe8un+Paltgfg3cCC4OOHTt8meYhDe/
         xfqw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779283485; x=1779888285; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rit3XOj+nAqSskgBa3AwkCsmGpVaId+gpzvsbFjHRsc=;
        b=soIPX58tSlE7rXoxdMtwxnge8lOQjs/yYokVUjGLHT3/MoM4W+Ga6OCIglkb0K/ukR
         smLtiWTlQloAtgtayQ2eaCNxEy+CVVO6WDur7FuFFDNMrv2ILq+eTlncr7IN9RDSfwzg
         8Ydex1gxC1sLXUvmfLKNHFrxJGZUCIdyZU+ioXSc/SJkAiRmRYZX7wj6FuWlYJGJLyhA
         LtWA0ygQyxdi1iNl2V0H31txjdlQ2n88YKcTkJ2drgiJQTwtyI76xyEFDS9IPYj8wWvD
         6b0WmzA0dEv0Pykzvf0Aqws79XPrAxWnBY4uGtcOb+skTfESYUceMIByUPiyCs/tUfLo
         lTbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779283485; x=1779888285;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Rit3XOj+nAqSskgBa3AwkCsmGpVaId+gpzvsbFjHRsc=;
        b=ku8oP5zfZeMn6ee6kW0eEp6Rub0MW+RhwShRzEGiYNQzzlpzKmBnnfUtSBSnw16wBz
         bsQfl/iThnDyDzgsb2o2/EBxFloGRYCK+FoIFZzIgzi9cqdnh8FgCMUI5W6jbfLwzRnC
         1LvPz55JkAoZ6NUJeN1ub2htXIYa8vwiUGz++t1Zrm4IplU4ZqqgyYY3vlJfEsUY2AOb
         xs2oxXmSzS6umesIXX0I3NbXTshVnGG+XAiuFOLkCqgKq8/nViVn/U46qfS8vbErL1nX
         SwvJ7vlqlPFFT9OZlqKmXhHdxlZkmKU17sdtawWVlPsQjbfK+XG5E9GP2T4Kh8yjT0iV
         9BaQ==
X-Forwarded-Encrypted: i=1; AFNElJ+zNc64rkkFP/FeNwWgBodLfXLf5VY7zl0+Yy+P3C6Mb6Z8jCNQBnxdRvj4rZaI21/MsPj6TGQDyQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwUpEmMkc6icmGuh8L6Ac+zz2KtDgtUG3N67IbiMAStktTlwYZ/
	AZsp2Xv/I/VyAs/Ylv0hJ2xOFwx6XXzCSsj0QYKPsdy39Suh1FAVHMdJnWf27EWprrdcciotdg1
	FbsI7F/DtCRMPgzZj/f/soDv12DHSBFg=
X-Gm-Gg: Acq92OEnyxnd2EtrR2ltWEPPd2IOlJSxC4WZZXzDoVnPR4YcX2vpJJMqlp8gt4z4Sn3
	6GsAdtCELxvauaHAO8sM5tWEyQjFdlhAE5DtT32znylby2IaEx3feho6N++yiw6IqyALPWMUa3B
	2WKgCEtNR328FUhjOJwjSLcBuyezOL032K4lWym7OIMiV4uoGSQ0f1Cvzo6VzECre9XajZwJ/It
	eLtqsrckNIvzaJyB+GXMDf8I1yVhIxCtdJklSTeA1MeR9QxKd01F5JDAKxxW24Fi1bYlZR7Nbhi
	Y5vqZrVAKGP2WZWOvy3zj8YEq8q6LPpYJosMZ9zUnHTXoVfuAG05
X-Received: by 2002:a05:6402:4313:b0:687:285d:44a3 with SMTP id
 4fb4d7f45d1cf-687285d465fmr1620985a12.15.1779283484506; Wed, 20 May 2026
 06:24:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260520123722.405752-1-aalbersh@kernel.org> <20260520123722.405752-4-aalbersh@kernel.org>
 <n67pde3prjxt2c2u2pvjytfw7uzwbeij2yljlrwh7fixcgnzhp@piqsltgpcc4v>
In-Reply-To: <n67pde3prjxt2c2u2pvjytfw7uzwbeij2yljlrwh7fixcgnzhp@piqsltgpcc4v>
From: Amir Goldstein <amir73il@gmail.com>
Date: Wed, 20 May 2026 15:24:33 +0200
X-Gm-Features: AVHnY4Jb9lW17aXG5JPAYjGDiGqwrTNH7OJH9zvcsbDKfZCeeZ6RTdTNxiDlapc
Message-ID: <CAOQ4uxiNN3U4datJb8kxxGVp7VNRFZB6_zEnO76kh9oEjE_-bg@mail.gmail.com>
Subject: Re: [PATCH v10 03/22] ovl: use core fsverity ensure info interface
To: Andrey Albershteyn <aalbersh@kernel.org>
Cc: linux-xfs@vger.kernel.org, fsverity@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, ebiggers@kernel.org, hch@lst.de, 
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
	linux-btrfs@vger.kernel.org, linux-unionfs@vger.kernel.org, djwong@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 20, 2026 at 2:54=E2=80=AFPM Andrey Albershteyn <aalbersh@kernel=
.org> wrote:
>
> On 2026-05-20 14:37:01, Andrey Albershteyn wrote:
> > fsverity now exposes fsverity_ensure_verity_info() which could be used
> > instead of opening file to ensure that fsverity info is loaded and
> > attached to inode.
> >
> > Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org>
> > Acked-by: Amir Goldstein <amir73il@gmail.com>
>
> Amir, Eric, this is the last patch missing a review. Could one of
> you have a look at it. Not sure who should review this.

Feel free to upgrade my ack to:

Reviewed-by: Amir Goldstein <amir73il@gmail.com>

Thanks,
Amir.
