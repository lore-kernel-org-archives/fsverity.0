Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C7718EB8
	for <fsverity@lists.linux.dev>; Wed,  3 Apr 2024 02:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712110839; cv=none; b=Em5LsGzAkWpY28Jtx5RFv3ZkOTrCDm5pAg9U35w5FZJe3Vw9ETz/5mD6ZZ9Mg1pRkdXiBsyqEyVrqkawEPq3dLUQ3t9+rG5J8v3ciL6Nuf14tzS34aJdHbPb2/qmfoQ4WKiA4Z1RDKn7cwJueE/PNRj+hyZWLz722N7uT0DAxUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712110839; c=relaxed/simple;
	bh=HgAv7bgaGWBacE3qtSTQdy+getvc3iVH/eDKcw3tCco=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=PT4NjVMlTzoHAQFAJfbym7aWeAsaM9RNDiMrTXyADal4dbMSNQtyfvAfrs2iyAjs+roKBKKOk/3APsTAcCJOoeSAnfIFh1+a2ZbLTfKOdmthEt2QHQCKIFHBAQFZaiJAg5ehzw+RGEruZZYKZ7W7sdrzNYF9jhJ0HPg7+O4xcH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hjN3xxnj; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hjN3xxnj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712110836;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=kmfRIq1yytH17kLA4PVvtIEfIqgZ2kOCTL36rp6IAZw=;
	b=hjN3xxnj+Dj2zTQuZwHMDFSqt7NUtBHuVZow7wS1MBI9ZgCpfDHtDMgFC4C3UGQrXtSspZ
	Wnbi9RFOKNDKh8T2A+kd2mMvl4pqjAEj+otFRmoAssXgLbqLQsvIJUmkZrSTq96b7RO588
	n9CLcscOCI3gjjD9027RWW6WDXBC/LA=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-390-qqkjM1G6OveuRBnd5QI4_Q-1; Tue, 02 Apr 2024 22:20:34 -0400
X-MC-Unique: qqkjM1G6OveuRBnd5QI4_Q-1
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-5d396a57ea5so4085274a12.2
        for <fsverity@lists.linux.dev>; Tue, 02 Apr 2024 19:20:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712110832; x=1712715632;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kmfRIq1yytH17kLA4PVvtIEfIqgZ2kOCTL36rp6IAZw=;
        b=r0U2Z1+YgfdPivKzdIYnKa+we4J278Lz9tVifcwAMhvoboEfRdWbZThA0RUImIxjVk
         A2sJw8aIr0n/9q1wx+OwKgRAVtpNuDcXVTlHT5bUWMKAMtyuxS74PPFth2e1JU0QISmo
         LE7BkVFh6s5Es4T6aJxyCTFBiAWdYS5lfFiCdCObcfQ3wC1zDVUx+GP8iIN136jIycqk
         pfN/YubHoBVVGY9AfXkWjFenT+VB94kxEMNVuO5Cx4VPHU/N4xpKTglR7/nheRgC1/Ly
         gmDp09xFYpVxSlD5aNhM8d0o68tusU28saWLkr20PJHSqVj1+uPmbeN400/2d9W5A1x6
         v/WA==
X-Gm-Message-State: AOJu0YyiGCurA+qKVxAXvNVZ9LXr/3pWnzrdd1LRYJUbyJniz6D4928b
	VEN73442ZyTJurL0PiSOccqoZ8SWfC3uLttG+6cbogLhjDZVnMiA/81D7vu8UJNendDTm356DeH
	zgrsp7Guxht3kO2mwvrGIaqyjPXhfxHgBn5Nxh2efReDezxoZcS6HTZkrSfoqe/W41sB3/fVdwc
	jfOBoRdLRTkHUzdct1YockON6hgSv1/syAtLsc3OWKf4BI7Vs=
X-Received: by 2002:a05:6a20:d809:b0:1a5:6d42:b399 with SMTP id iv9-20020a056a20d80900b001a56d42b399mr16346922pzb.15.1712110831800;
        Tue, 02 Apr 2024 19:20:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGDixjuy/TSf4vrnRQVwEi1CyVD48G7cC27UEsQqEbcf2LFl+A5V5Cx+m6hpOG348UoQiH4PrBPgCQCCToo0i0=
X-Received: by 2002:a05:6a20:d809:b0:1a5:6d42:b399 with SMTP id
 iv9-20020a056a20d80900b001a56d42b399mr16346907pzb.15.1712110831489; Tue, 02
 Apr 2024 19:20:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Yi Zhang <yi.zhang@redhat.com>
Date: Wed, 3 Apr 2024 10:20:19 +0800
Message-ID: <CAHj4cs8DTSvR698UE040rs_pX1k-WVe7aR6N2OoXXuhXJPDC-w@mail.gmail.com>
Subject: [bug report] kmemleak observed after system boots up
To: fsverity@lists.linux.dev
Cc: ebiggers@kernel.org, tytso@mit.edu
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hello
I found this kmemleak after system boots up on the latest
linux-block/for-next, please help check it and let me know if you need
any testing/info about it, thanks.

# dmesg | grep kmemleak
[  474.750916] kmemleak: 1 new suspected memory leaks (see
/sys/kernel/debug/kmemleak)

# cat /sys/kernel/debug/kmemleak
unreferenced object 0xffff88824046a580 (size 96):
  comm "swapper/0", pid 1, jiffies 4294727564
  hex dump (first 32 bytes):
    a0 c2 0d 9b ff ff ff ff 00 00 00 00 00 00 00 00  ................
    01 00 00 00 01 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace (crc e7670296):
    [<ffffffff9412657c>] __kmalloc+0x37c/0x480
    [<ffffffff944cfbf8>] __register_sysctl_table+0x58/0x450
    [<ffffffff98680079>] fsverity_init+0x29/0x50
    [<ffffffff9360371e>] do_one_initcall+0xfe/0x5a0
    [<ffffffff985b70d8>] do_initcalls+0x138/0x1d0
    [<ffffffff985b7aac>] kernel_init_freeable+0x8bc/0xbe0
    [<ffffffff95dba94b>] kernel_init+0x1b/0x1e0
    [<ffffffff936a804d>] ret_from_fork+0x2d/0x70
    [<ffffffff93606e4a>] ret_from_fork_asm+0x1a/0x30

(gdb) l *(fsverity_init+0x29)
0xffffffff86080079 is in fsverity_init (fs/verity/init.c:33).
28
29 static void __init fsverity_init_sysctl(void)
30 {
31 fsverity_sysctl_header = register_sysctl("fs/verity",
32 fsverity_sysctl_table);
33 if (!fsverity_sysctl_header)
34 panic("fsverity sysctl registration failed");
35 }
36 #else /* CONFIG_SYSCTL */
37 static inline void fsverity_init_sysctl(void)


-- 
Best Regards,
  Yi Zhang

