Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C75657F
	for <fsverity@lists.linux.dev>; Mon, 29 Apr 2024 01:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714355259; cv=none; b=FaFFaHNRRO+pqnPEaz2vCSngvRhMwBt+90BuqM/8dGpC7odzIqndwny/wuUveHJOzbsFK8W8VqVxXFwGKapeuACuL3GOh8jrez90McCLVQ3P7wdRt9bzs78/gVwHTiBrhS3v7pDuycbHeiYjCm8Mu6VGaafLbSz2RSe2PAr7UfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714355259; c=relaxed/simple;
	bh=bRM2vKyEBqlBvXfsnUlY3Skk0WxLiJq+f+7e7k1e0Rg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 Cc:Content-Type; b=u3Vn62OPOxB/BQrg4tXPW3PWqM3sUarOC3BZkRQYV3yL/SVwGAYcZnqTPMY41fZp03VaIruWApMywkbSHl+oxOSHlHQPvhMg/bGjv+q2CUeMcUeHzvhap4VMu8wsrYxT09GLoPZTN6UurwoFuZchkk0vDdyzU6MWGJ9c42/LqYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hXlBGAsY; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hXlBGAsY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714355256;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OfCno9HF18gXlPKoQnFpxFrt+SqdUSAKPnwfDBhr1vM=;
	b=hXlBGAsY3yiTJAIoZjztcKUAz6XiIqbWyX1ZX3C+VPFJVmD2fzJ4qESlH0GS1rq1/Qlsyj
	1E+yZoQ15piPVJusBIcLwXx1t9/9PKM1A1oo9dnWL4KtRA0atK68IrW4UlPrToWuB4uroG
	U1vLZHMrTMdF012RtIJB1kEng8lILVI=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-86-5qncWevEPZuMuesbtxffxA-1; Sun, 28 Apr 2024 21:47:35 -0400
X-MC-Unique: 5qncWevEPZuMuesbtxffxA-1
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2a2fe3c35a1so4342221a91.0
        for <fsverity@lists.linux.dev>; Sun, 28 Apr 2024 18:47:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714355252; x=1714960052;
        h=content-transfer-encoding:cc:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OfCno9HF18gXlPKoQnFpxFrt+SqdUSAKPnwfDBhr1vM=;
        b=JaJxRd2QaUXyFuSitIk9oNUhdFtFSgTLurshHK8f2MZOWrdZ/zcjCrpOEYyf2moOWN
         ELkhezgumrSmXnORyWOMkBPsRxdCPvLA2D+oKov54tTbLjLXsCB32Yrbofmd91S1V/yY
         1e60QMp9ZXVRBX8hYgI0fpbjHZ/SZVFpFcg1EqXO/R25RLHqN0pGSZNq00R+j66+aJPD
         jGIyrKEPw/l44VCG6CScwQ1gckPlnbgoaCUNY+SEJ47o06ObG8nnqpHq46yKuJZxsNPv
         D5DGMVgEa3/WONMwuNePbmFd+rA7H2PWv1FI5IoacPg+ceof7pjHPNYnyprjqwo4aar7
         h/kA==
X-Gm-Message-State: AOJu0YyniiOLhk768LlwR4XFOjt0KD4cdE8YPAJRucMox5oFTSRKmxoC
	mFDI3nVCaEtpKE306BWAMei315FBeBH2nwDxIf7SxUR/LruZuR4QUUsObmSDcSAUofdo2WoOIyy
	A5ogwqCWDDyNaJQffnAecoaiqwJM3bWAao0LN0W6QtwAr0Dqg8cqICdS2+mHzCsx7W7cY5ucCYt
	L1bGRi01yJdZUBz9aBLuIzwD1Psvnyf90W7vK9NeWTgg==
X-Google-Smtp-Source: AGHT+IEGNWlSRvo9nmnikyT1DxkV20/KfuQDgKWFa01DmlvrhVXjKGzqygDkzvcb3OFosgsbFqrw6WYLeHtteLfyOUQ=
X-Received: by 2002:a17:90a:290:b0:2ab:a991:6eb8 with SMTP id w16-20020a17090a029000b002aba9916eb8mr7983789pja.42.1714355252300;
        Sun, 28 Apr 2024 18:47:32 -0700 (PDT)
X-Received: by 2002:a17:90a:290:b0:2ab:a991:6eb8 with SMTP id
 w16-20020a17090a029000b002aba9916eb8mt7584180pja.42.1714355251908; Sun, 28
 Apr 2024 18:47:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAHj4cs8DTSvR698UE040rs_pX1k-WVe7aR6N2OoXXuhXJPDC-w@mail.gmail.com>
In-Reply-To: <CAHj4cs8DTSvR698UE040rs_pX1k-WVe7aR6N2OoXXuhXJPDC-w@mail.gmail.com>
From: Yi Zhang <yi.zhang@redhat.com>
Date: Mon, 29 Apr 2024 09:47:19 +0800
Message-ID: <CAHj4cs8oYFcN6ptCdLjc3vLWRgNHiS8X06OVj_HLbX-wPoT_Mg@mail.gmail.com>
Subject: Re: [bug report] kmemleak observed after system boots up
Cc: fsverity@lists.linux.dev, tytso@mit.edu
X-Mimecast-Spam-Score: 2
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Eric
Seems this issue was introduced from 6.6-rc1, do you have a chance to
check it, thanks.


On Wed, Apr 3, 2024 at 10:20=E2=80=AFAM Yi Zhang <yi.zhang@redhat.com> wrot=
e:
>
> Hello
> I found this kmemleak after system boots up on the latest
> linux-block/for-next, please help check it and let me know if you need
> any testing/info about it, thanks.
>
> # dmesg | grep kmemleak
> [  474.750916] kmemleak: 1 new suspected memory leaks (see
> /sys/kernel/debug/kmemleak)
>
> # cat /sys/kernel/debug/kmemleak
> unreferenced object 0xffff88824046a580 (size 96):
>   comm "swapper/0", pid 1, jiffies 4294727564
>   hex dump (first 32 bytes):
>     a0 c2 0d 9b ff ff ff ff 00 00 00 00 00 00 00 00  ................
>     01 00 00 00 01 00 00 00 00 00 00 00 00 00 00 00  ................
>   backtrace (crc e7670296):
>     [<ffffffff9412657c>] __kmalloc+0x37c/0x480
>     [<ffffffff944cfbf8>] __register_sysctl_table+0x58/0x450
>     [<ffffffff98680079>] fsverity_init+0x29/0x50
>     [<ffffffff9360371e>] do_one_initcall+0xfe/0x5a0
>     [<ffffffff985b70d8>] do_initcalls+0x138/0x1d0
>     [<ffffffff985b7aac>] kernel_init_freeable+0x8bc/0xbe0
>     [<ffffffff95dba94b>] kernel_init+0x1b/0x1e0
>     [<ffffffff936a804d>] ret_from_fork+0x2d/0x70
>     [<ffffffff93606e4a>] ret_from_fork_asm+0x1a/0x30
>
> (gdb) l *(fsverity_init+0x29)
> 0xffffffff86080079 is in fsverity_init (fs/verity/init.c:33).
> 28
> 29 static void __init fsverity_init_sysctl(void)
> 30 {
> 31 fsverity_sysctl_header =3D register_sysctl("fs/verity",
> 32 fsverity_sysctl_table);
> 33 if (!fsverity_sysctl_header)
> 34 panic("fsverity sysctl registration failed");
> 35 }
> 36 #else /* CONFIG_SYSCTL */
> 37 static inline void fsverity_init_sysctl(void)
>
>
> --
> Best Regards,
>   Yi Zhang



--=20
Best Regards,
  Yi Zhang

