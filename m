Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E19CC2C0294
	for <fsverity@lists.linux.dev>; Mon, 12 Jan 2026 14:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768229487; cv=none; b=lXqkcvu53O+rs+WpI8deEpH1IlLtfBMyS0DvdX7f2CJXALNCrXgr8jzlleZcEOqiJ4IPFfOpn4v2kZ3whe6SVnFbOVt8iClW1G235h6KnPWy15tyXnWvayevUx1zWM6dNWAEob4nEobdP+W+bPXJzQ0E0POyD43FXFVpkwXeEsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768229487; c=relaxed/simple;
	bh=MxgptwcHFi+z4ifrlUMeCFEAHWtj2SNcmezFtEHqDpM=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=YTmKgAKcgC0x20Oz+0DeYxNjeeVcJkX4MBPQQrRULpbSjfgNFWMFKkxN5DjbVteqasySEOIRFDfanQxJarFb3SFkKA7RimL2pD7+jdB4OARUVktucqdPjw6IzThNNXgvbYMDhVB/qoYu4ycPQNhx1Twd6a0LIwWFhdTRVou0FvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SwdTmbn5; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SwdTmbn5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768229483;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wL9J1kXYNGpo3omk75dIbnVKK7rJ+xh/+WBR5nbHReI=;
	b=SwdTmbn58s8sS+YNyLVeafHWru6UpG54b03v3LGzMd05WglbJ3oqCOmBKQvKj4io8hChhv
	FKWzHqYDMzImT7Xrj1mmkpvu71HdxLH7A0w2VVWnG4RaaRgHyNmwl7/lvwSPKIE7ZhcpgM
	G92PW24zKofjXMNn/gK89vuo58cIWZ8=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-388-5ZNJQOEOM-W_8Qoi3Fu2QQ-1; Mon, 12 Jan 2026 09:51:22 -0500
X-MC-Unique: 5ZNJQOEOM-W_8Qoi3Fu2QQ-1
X-Mimecast-MFC-AGG-ID: 5ZNJQOEOM-W_8Qoi3Fu2QQ_1768229482
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-b807c651eefso935887366b.3
        for <fsverity@lists.linux.dev>; Mon, 12 Jan 2026 06:51:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768229481; x=1768834281;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wL9J1kXYNGpo3omk75dIbnVKK7rJ+xh/+WBR5nbHReI=;
        b=G6CU0FGrMAnLpWVdVF7UDU2neQMI/shTG8ykQlDjfSjxCxK1II1+EzeBx90AuGx+Ba
         oDZy8f/bnaQeEHL5Y1ELqmOVz16vtg4QzmLerTeWGyWGFB6Sq7QCyjf8V8+UsntQj706
         NPFFUtWAJ2TD0tg5YE3BqPeRdaR7n8n08eozom2blM6rJnNe2bOUcnQgXtZybUE9NHb9
         YuKbME+0vOQ3k5SeXvNMyd4VX96JrYsjnt1roT/66yIBa0yd3v3BOBsOO6YR1YJMsOVu
         PhjnCRx0iihMTmcvPXU3IVLtdqce8N4abr+6SQp/MrnAlXJSsGkwZI4k3v/xcaWO/Nlw
         W0Wg==
X-Gm-Message-State: AOJu0Yyl/JxZKPfJ2FDDLTF6IOQlgDgrnShP50sVv3gtLQ+SGWD8jbrF
	tFhUriGukLA0B3AW7Vkr79zECpGu8j1l+BYz45tPk3yknZDCzf8a3LtkVIV/TGUJ4Y1+PKVmzkn
	bCrcvT0n0eYUgx8nOY80pWo/bbh/ts1sqDP5aL42GAA+WmtEzQDmCFir8wGzgApR3gdbzpjvdJn
	+QLGomLUHkz9354s4t42+odl6Kco5JFUmQBcjI2UzFb3o=
X-Gm-Gg: AY/fxX5kHdjVL2h0wuZonC9g/BDb8Ipvoh3Nu6WnGSwMLIU/C8CKtGJ5bKDEOWmTXJr
	jzImTjTc/bLP2QYodWO2lsd4JupfkUsgmbFvCpsxundt6zgoKO2bfwLS7OxncIZpekPNRAHanZn
	8J8DYkLggKldrLoOT05tU8GqSthUnRQQlMNPj5SwwiOHuiHnB2lDN7QSx3ziHyhsRewibcVkEV5
	pH/RWR6ZWEUd1Vxp47jQlSb5Utn30eCZtKxWYLL7iEboCnxKYFXBQ5LkrUpodk7z5Gm487HgOGz
	i3f/3E/ccptl5DgAiMtGVpY0+Kafye4l9HdKY7rhkjCNApGkBFiIEt6SfEKuFZ736ZPRki29z3Y
	=
X-Received: by 2002:a17:907:7f90:b0:b87:33f3:605b with SMTP id a640c23a62f3a-b8733f37289mr5218666b.27.1768229481130;
        Mon, 12 Jan 2026 06:51:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFMB0JxHgMWzT9jlMyCtL8Tarhm33xjovmcnmuqowqS/Fr0c7wyM0JTrOTtbi8ZoddZMgmNgg==
X-Received: by 2002:a17:907:7f90:b0:b87:33f3:605b with SMTP id a640c23a62f3a-b8733f37289mr5215566b.27.1768229480682;
        Mon, 12 Jan 2026 06:51:20 -0800 (PST)
Received: from thinky ([217.30.74.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a2338cbsm1914558166b.14.2026.01.12.06.51.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 06:51:20 -0800 (PST)
From: Andrey Albershteyn <aalbersh@redhat.com>
X-Google-Original-From: Andrey Albershteyn <aalbersh@kernel.org>
Date: Mon, 12 Jan 2026 15:51:16 +0100
To: fsverity@lists.linux.dev, linux-xfs@vger.kernel.org, 
	ebiggers@kernel.org, linux-fsdevel@vger.kernel.org, aalbersh@kernel.org, 
	aalbersh@redhat.com, djwong@kernel.org
Cc: djwong@kernel.org, david@fromorbit.com, hch@lst.de
Subject: [PATCH v2 12/22] xfs: introduce XFS_FSVERITY_CONSTRUCTION inode flag
Message-ID: <bfcg5hug75qtvc2psw5yymfoudnz2uda3gg5dfzgnze46hwt6n@u67n3rdzzuo4>
References: <cover.1768229271.patch-series@thinky>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <cover.1768229271.patch-series@thinky>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rG5rxMRZtgZ3QPEGpaMP586qlD_4rQLA02aQf09-dpc_1768229482
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Add new flag meaning that merkle tree is being build on the inode.

Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org>
---
 fs/xfs/xfs_inode.h | 6 ++++++
 1 file changed, 6 insertions(+), 0 deletions(-)

diff --git a/fs/xfs/xfs_inode.h b/fs/xfs/xfs_inode.h
index f149cb1eb5..9373bf146a 100644
--- a/fs/xfs/xfs_inode.h
+++ b/fs/xfs/xfs_inode.h
@@ -420,6 +420,12 @@
  */
 #define XFS_IREMAPPING		(1U << 15)
 
+/*
+ * fs-verity's Merkle tree is under construction. The file is read-only, the
+ * only writes happening is the ones with Merkle tree blocks.
+ */
+#define XFS_VERITY_CONSTRUCTION	(1U << 16)
+
 /* All inode state flags related to inode reclaim. */
 #define XFS_ALL_IRECLAIM_FLAGS	(XFS_IRECLAIMABLE | \
 				 XFS_IRECLAIM | \

-- 
- Andrey

