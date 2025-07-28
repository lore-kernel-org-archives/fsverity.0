Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65F8627F16C
	for <fsverity@lists.linux.dev>; Mon, 28 Jul 2025 20:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753734701; cv=none; b=IcniQhRqyXzJFa9CrIeU65OdjcC5XHBgn/nqP+EGVTVaPCdP/xVSZv1i8noywr3DGb5k4JSe/7gvl7cFBrz+w79FIh8sGuUxGBGwAmqz9HpjrMdHCaRxGVFgpm0O4DulPv2licfKw2Nz5LxE79ABQK///Ql7AbFyaxXyFiUzBv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753734701; c=relaxed/simple;
	bh=tuQ8f/tR8bjNxLfdJGG+rXIm8Iltuw4mIWHpny+mKAw=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Content-Type; b=G6N6Uw26LKQ5dDMTS08iLyKBk1EczxP6rpFbX8dzFapRCIkd06oIZUq2BwYkE6GpZRpyjHqHwgk8vKi9hiccNJyAZY8HK0HLgKGJ9VlO78UGD8zPY3VVETid9w9jpsFcYVVTsc2wMV0Hr5OvVgl9wuNZFhsgsOD3qt9zBwXfKM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fHNa2Prm; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fHNa2Prm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753734699;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NhSSjYb+lsJdO2qb/nLz5H47+MobT7klHyOkyC/1bzQ=;
	b=fHNa2PrmJiKqe8Mcn1GuE3zQG6uaHUszipH4R3CRhLj2HK2i0tV/v5ryD/oDn/gHZ2ftmr
	ao+y8u6c7V8lrgxAUyOG0GC2PGAS/WC9onn40KFo+rlzgONXeb2Pxm/7HNJZLK/X+M1uhS
	dMwWuSkHFWFt4vd+1YGIDiY1n9V2/9E=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-551-wp_27bv6M-2wWaakVxXx8g-1; Mon, 28 Jul 2025 16:31:32 -0400
X-MC-Unique: wp_27bv6M-2wWaakVxXx8g-1
X-Mimecast-MFC-AGG-ID: wp_27bv6M-2wWaakVxXx8g_1753734691
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-612be84c047so5107770a12.2
        for <fsverity@lists.linux.dev>; Mon, 28 Jul 2025 13:31:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753734690; x=1754339490;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NhSSjYb+lsJdO2qb/nLz5H47+MobT7klHyOkyC/1bzQ=;
        b=uYEPInGJKLerOimqrrMK+V68urqNfwqjU7LZn7Q0rBJ6/gTJYFyiT2iBeXD/E7bPRj
         YL6z0KLFXErDZtyBpp3beKWbKhie+BUY+D4rPfi8q2MqUb3kEllmLJVK2jRA40jo456h
         I8cmktc88Zv4SpMcFyVLgoZA9Ar8QG7uDPl7VAH9obu7jwAlUxMwRtB3rJALIYCcPWlb
         j/n3C21+CDyCUSXBl1Nsh+zHOL6sj+B1hjf7tKEe9PKAd1HW3Uzl8+SuKlDSGi4foGkz
         t3Z9jTGHFwaJSmGDpDcAB2PWs0uV5Q4udjE12IZ/F1+UrIzkYRoAHujFnjsuI6iPJXt/
         1QuA==
X-Gm-Message-State: AOJu0YwgUZu0KidgdwltX7jinpGudBOiv58n0Lnorxlupmi6ncRo5HG1
	/KHE76jg+H0z/GW3gi2hVDtcFKHsNJXF6vceorYFEP+v1NLJVpDLc9syCRXHhtlA1r6MfrVis6D
	DIrN/5o/KC4qGZk5ZrinaQ9n8E51wkZ+RTysACDjr5Rfz+1moEa0QG8xnqd+pVPPQK+8=
X-Gm-Gg: ASbGncsQPgMFkWFGbMyK9DQ/2KVkpr2YK9o7s15vopB+0RgbmILuY7GHamaKn+PI5vd
	5vHZpoDVyxHlBo5Ny38pWH2FDeBTQYrUW2hEGW81xzQ4udiM+MZdd48XW/Spev6WxBIaZwcTHJo
	nxhpKBBi5FOZC7a/cPlydFaymUvCHe3KsNatXaWLAFh4S5BFagiADsFchHsbq9AsQ9bwQGlK/uX
	P9P24B0TSSLF6yQrClYt5O0ozJAKcLQWDjXjBR+CVYZaQi5D3dijOSC4dSzSqav2AtP6Cs80Zpy
	ruOoemIoQ8ZABDb6PWVLi5HASXhWL8LfyJwMYSDOcNsLtg==
X-Received: by 2002:a05:6402:51cb:b0:612:b723:4d95 with SMTP id 4fb4d7f45d1cf-614f1f2e494mr11033333a12.30.1753734690307;
        Mon, 28 Jul 2025 13:31:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHXBBqy/vXldtxYvrueHJwpZSvjKZbwQ5tpqwAu8FXFyHDjYlJYgONObn7uPdVanUULshRM+Q==
X-Received: by 2002:a05:6402:51cb:b0:612:b723:4d95 with SMTP id 4fb4d7f45d1cf-614f1f2e494mr11033310a12.30.1753734689864;
        Mon, 28 Jul 2025 13:31:29 -0700 (PDT)
Received: from [127.0.0.2] (ip-217-030-074-039.aim-net.cz. [217.30.74.39])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615226558d3sm2730656a12.45.2025.07.28.13.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 13:31:29 -0700 (PDT)
From: Andrey Albershteyn <aalbersh@redhat.com>
X-Google-Original-From: Andrey Albershteyn <aalbersh@kernel.org>
Date: Mon, 28 Jul 2025 22:30:13 +0200
Subject: [PATCH RFC 09/29] f2fs: use a per-superblock fsverity workqueue
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <20250728-fsverity-v1-9-9e5443af0e34@kernel.org>
References: <20250728-fsverity-v1-0-9e5443af0e34@kernel.org>
In-Reply-To: <20250728-fsverity-v1-0-9e5443af0e34@kernel.org>
To: fsverity@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
 linux-xfs@vger.kernel.org, david@fromorbit.com, djwong@kernel.org, 
 ebiggers@kernel.org, hch@lst.de
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1047; i=aalbersh@kernel.org;
 h=from:subject:message-id; bh=x2fKAqj6yt8VbdL2CBtiIb5g4L/wAAI+BQgEGBHb3is=;
 b=owJ4nJvAy8zAJea2/JXEGuOHHIyn1ZIYMtrviU9w/cd0wMBlz8mjEoUXGhI+xnT1muzczC9Xc
 r5SfdImZ8GOUhYGMS4GWTFFlnXSWlOTiqTyjxjUyMPMYWUCGcLAxSkAE9H+w/DPwCfpgdSX8PiN
 e6+ZROQZ9tyOVb66MuKFruz8jV1VC4tkGf7nfrzP47+oXuLCn38L324yOnHy1wvZTbMUfThP+Vz
 MsT3BCgB9sEqV
X-Developer-Key: i=aalbersh@kernel.org; a=openpgp;
 fpr=AE1B2A9562721A6FC4307C1F46A7EA18AC33E108
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Yr6pLj1pgkrpe76LbKKflfy9hqEZlbydX6w0xrE17DE_1753734691
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

From: "Darrick J. Wong" <djwong@kernel.org>

Switch f2fs to use a per-sb fsverity workqueue instead of a systemwide
workqueue.

Signed-off-by: Darrick J. Wong <djwong@kernel.org>
---
 fs/f2fs/super.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index bbf1dad6843f..043e76b8efae 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -4634,6 +4634,17 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 #endif
 #ifdef CONFIG_FS_VERITY
 	sb->s_vop = &f2fs_verityops;
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
+		goto free_bio_info;
 #endif
 	sb->s_xattr = f2fs_xattr_handlers;
 	sb->s_export_op = &f2fs_export_ops;

-- 
2.50.0

