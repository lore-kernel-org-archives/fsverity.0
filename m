Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2787827A92E
	for <fsverity@lists.linux.dev>; Mon, 28 Jul 2025 20:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753734694; cv=none; b=XK4EZGaVmrs+/FBlQo+zWIn6LKLY9Y3grxa/uht42c0itxw1PECGJuvPl1N/KxEtNhYLYnilmaT1ZZAGQc1ADiZ7GqJtdqrzlBrQuB5aqAXyY/6kvCOAMoMg55FCBlMN2v6e+19N9pyFk/vRgw7TMz3xUnZ7Je5TCcZTcVSqrAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753734694; c=relaxed/simple;
	bh=oywUNdy9SXNgRvU0YoeafcjM/3VIs70znQ1LmSPU2B4=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Content-Type; b=Ino18Gq3UqHc45vlyhqEpoTKWSJCJEnLB4QGWHWdOqzcyLr1wd1LgB1Omo6FaNFmyR8oDbey1i5cE86e6JmdZu1o+vETXQxvLBhBPpIsxCnNPjMP3naUOhcXQ4bTRFgonimJxM9zgbbV9skreSB6oPytlNlkoxjfkMVTL4GzyR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EpJcShfa; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EpJcShfa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753734692;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Why2a90OOR2KPUrmkOK42TjhIsW0VoTnCqJDDVQ6oe4=;
	b=EpJcShfa57FW4xofjSUQG610BOU51qaUUHiWF2ki2QEbOTXpIcBg0j5KlN81MiFdWxT2kC
	mCJzv3eAjakoJvkI0sbRmQIrVQIo0BuZlNeYZpei4tpw/dMUpWOvWcUXpwXayeCZY2r8L1
	smSuFib+FckI8VfF+Oib23uj506+4Ik=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-372-eRRg8_tCMZe1L5q-A5LowA-1; Mon, 28 Jul 2025 16:31:30 -0400
X-MC-Unique: eRRg8_tCMZe1L5q-A5LowA-1
X-Mimecast-MFC-AGG-ID: eRRg8_tCMZe1L5q-A5LowA_1753734689
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-ae3c8477f1fso519069866b.3
        for <fsverity@lists.linux.dev>; Mon, 28 Jul 2025 13:31:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753734689; x=1754339489;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Why2a90OOR2KPUrmkOK42TjhIsW0VoTnCqJDDVQ6oe4=;
        b=C6EIzHZxHevwIwUhnRe8s5bRivn7liUMxVT9PGh3OmHBpg+PqxI60FrEfH86+ZgNgE
         Rpfl18nXQUqMObIp8Yn9m4XdFxLQPeTMxYpsRYTfZ1ombpgx5XQq9Nv6YPHCcdFeFE91
         kez3Z9tcRKWiXCGBT6WZ4OfyLr+4MDdjtEN3jFnAKU1xzFvWP5s86ZFrb9Ovzv7IJbMo
         204Jm63utqHo+X6+sF7M5LEWVKxrIGfeYX+fJ0+hES8nEauX83H5huSIutCAgpmfqYx/
         Pv9QGBbpHJki+1DxT76irJ7UYhSVyedluOQv8SazOZzNqQQEpfcdESDL5M/WlOVYjw3Q
         Y7Ig==
X-Gm-Message-State: AOJu0Yw6Kwns8MrAhjYjgwB6b9ZjYqISpUzJkMecVPZl7GmGGo6dUXtb
	To5zK5Y7SRc0gL9G4S15pOCi2P5SiBgn/yo3Zw/mm4mU/bxtx6JHtD5fWlQGPOGCCNAkZEPu0XB
	ERDmHutbBZmqCytVxPZB29FhEFdhYg+jRN2kAolKugwA71LKfZoVmOAXXjCM=
X-Gm-Gg: ASbGncu3m3r+WIG+XyjNfgvUTdPQI4qOKrWzeoMOCrkMqC4yZACbugSY3h5wEUTbID6
	+XNidEUJZTpCDyx74Pq6tSvxIKIsyxwi1ZiurIiFu5E9py0nXGcdPCJCh96UPPHL+UfLOfWC9Dn
	R6HpIrftnM0FUEQF+0w99+CdhaR9Xqij1v9PX/2/YklM8mD140BURiWDlCFsfZWhHRpO3rUwMq/
	uHL9FjLq/3ngbusbP9c4sAyxzPY2TEpzEFESD+/mniCQlWFhIB2T8vG8J9oET1shjUSYyAFHeVD
	2IVMhoeCJZFqCypWKqe1eIAheRpvSwivVOixD+yGDssGXA==
X-Received: by 2002:a17:907:7f0c:b0:ad8:9257:573a with SMTP id a640c23a62f3a-af616efc71dmr1429828966b.5.1753734689303;
        Mon, 28 Jul 2025 13:31:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IElqLNNpMpUzeIxl4kr/PFatnBAKdgVdcL/2FQoChJ3mBvf5eeLG5rjoJQ3gDbaVWDOhBqS3g==
X-Received: by 2002:a17:907:7f0c:b0:ad8:9257:573a with SMTP id a640c23a62f3a-af616efc71dmr1429825766b.5.1753734688875;
        Mon, 28 Jul 2025 13:31:28 -0700 (PDT)
Received: from [127.0.0.2] (ip-217-030-074-039.aim-net.cz. [217.30.74.39])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615226558d3sm2730656a12.45.2025.07.28.13.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 13:31:28 -0700 (PDT)
From: Andrey Albershteyn <aalbersh@redhat.com>
X-Google-Original-From: Andrey Albershteyn <aalbersh@kernel.org>
Date: Mon, 28 Jul 2025 22:30:12 +0200
Subject: [PATCH RFC 08/29] ext4: use a per-superblock fsverity workqueue
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <20250728-fsverity-v1-8-9e5443af0e34@kernel.org>
References: <20250728-fsverity-v1-0-9e5443af0e34@kernel.org>
In-Reply-To: <20250728-fsverity-v1-0-9e5443af0e34@kernel.org>
To: fsverity@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
 linux-xfs@vger.kernel.org, david@fromorbit.com, djwong@kernel.org, 
 ebiggers@kernel.org, hch@lst.de
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1033; i=aalbersh@kernel.org;
 h=from:subject:message-id; bh=8eioOXLwKFbWQjOAzR05yR6o85tqQ9fD9/ewRMN73qY=;
 b=owJ4nJvAy8zAJea2/JXEGuOHHIyn1ZIYMtrviStxfr8V+zzu88HeFq/NhRLCl9kXnNFsPcB6e
 /qJDIHzVtkdpSwMYlwMsmKKLOuktaYmFUnlHzGokYeZw8oEMoSBi1MAJmL/guF/6StJt4ZHu6Un
 uucKypWZSByuXP24xklOeHFOkcuX5k+VDP+07MNvHDm/Yo/UfNu9K/zj3jfwikiapM5v9Wv/+qO
 iei8/AGH0SCI=
X-Developer-Key: i=aalbersh@kernel.org; a=openpgp;
 fpr=AE1B2A9562721A6FC4307C1F46A7EA18AC33E108
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9eKl8QFLYhEBPlscRHdKuBoZ9mg6WbOS1GD3jgLTsRU_1753734689
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

From: "Darrick J. Wong" <djwong@kernel.org>

Switch ext4 to use a per-sb fsverity workqueue instead of a systemwide
workqueue.

Signed-off-by: Darrick J. Wong <djwong@kernel.org>
---
 fs/ext4/super.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/fs/ext4/super.c b/fs/ext4/super.c
index c7d39da7e733..dcb9d1933c2e 100644
--- a/fs/ext4/super.c
+++ b/fs/ext4/super.c
@@ -5373,6 +5373,17 @@ static int __ext4_fill_super(struct fs_context *fc, struct super_block *sb)
 #endif
 #ifdef CONFIG_FS_VERITY
 	sb->s_vop = &ext4_verityops;
+	/*
+	 * Use a high-priority workqueue to prioritize verification work, which
+	 * blocks reads from completing, over regular application tasks.
+	 *
+	 * For performance reasons, don't use an unbound workqueue.  Using an
+	 * unbound workqueue for crypto operations causes excessive scheduler
+	 * latency on ARM64.
+	 */
+	err = fsverity_init_wq(sb, WQ_HIGHPRI, num_online_cpus());
+	if (err)
+		goto failed_mount3a;
 #endif
 #ifdef CONFIG_QUOTA
 	sb->dq_op = &ext4_quota_operations;

-- 
2.50.0

