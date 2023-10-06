Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EBF7328BC
	for <fsverity@lists.linux.dev>; Fri,  6 Oct 2023 18:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="e4V0qk9x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1696618353;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cbAra3ZTi+LxukZ164wISWciUbvDI2f96hncpD1Yjx0=;
	b=e4V0qk9xTzGYrXXGrwg1t6jdDYh6cS2OdmvFpOJH0v7pHQWVfrOwgHGRQTu85TqJe5nZX/
	TwBwhUA0VzdCfXqMNv2X40zCyRhcC02EY+Y1PZllRp9Tav9LuxE9Yq0kiXyyqV6SS15pyG
	mxRzddPStoNc2ibORo72BGJgZsjeveQ=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-500-ZuOM7fAkNh-JDbzyRyLBGQ-1; Fri, 06 Oct 2023 14:52:32 -0400
X-MC-Unique: ZuOM7fAkNh-JDbzyRyLBGQ-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-9ae686dafedso221658466b.3
        for <fsverity@lists.linux.dev>; Fri, 06 Oct 2023 11:52:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696618351; x=1697223151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cbAra3ZTi+LxukZ164wISWciUbvDI2f96hncpD1Yjx0=;
        b=YGu8CaDmjpurF7axUIwXCwPoFirsD3s/M/CUugmBBd3+WwvZslwQ9/bJY8Ji6APMYg
         j4ZpJ4kOJQi/iKNTw0ktvVfnem9eGhm/ZcGH7iNJif8HgGd22dlT67EQLkx88WCLwPsP
         4vJwEXNrBEgMiXdBy6GSFFjmdfpIkwbIdBwXzZ+wcTcBwzyJI9XsBjPwfuQXfqoltviA
         nPst1CVuyu9HWicWgtYHAuk7QoWPJtEn+5xIAmuWZXVpd1So8f8mFj+oZzadlNCQWf4I
         p/8ICyFn2cpnMfmxgr76eRE94U6xLWTziHDJocRxhW2uOkEF215UF6KPbi9PpvYzOXlj
         Klsw==
X-Gm-Message-State: AOJu0YwtucKFuj38eZmk3cR/WXa6Jl+drlhCXRQaR2H8aIPfshV5K9/r
	hEMG8p2PmPb+m9yjrvLmcRf5wbkWsz8G6lmQYKHRJFXt6ljMqLaY1eY+mVJovVuWpT7dHgYU85U
	5si9e3GxnBxogPSwGLA==
X-Received: by 2002:a17:906:29a:b0:9aa:23c9:aa52 with SMTP id 26-20020a170906029a00b009aa23c9aa52mr8067387ejf.20.1696618350853;
        Fri, 06 Oct 2023 11:52:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGAvtFtJNnveu1/9BEXcBJfWoGBg75gg0idvpFq2vl8+1sN7jevtwQabTLBIM8w3mhGcmlywA==
X-Received: by 2002:a17:906:29a:b0:9aa:23c9:aa52 with SMTP id 26-20020a170906029a00b009aa23c9aa52mr8067378ejf.20.1696618350585;
        Fri, 06 Oct 2023 11:52:30 -0700 (PDT)
Received: from localhost.localdomain ([109.183.6.197])
        by smtp.gmail.com with ESMTPSA id os5-20020a170906af6500b009b947f81c4asm3304741ejb.155.2023.10.06.11.52.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 11:52:29 -0700 (PDT)
From: Andrey Albershteyn <aalbersh@redhat.com>
To: linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	fsverity@lists.linux.dev
Cc: djwong@kernel.org,
	ebiggers@kernel.org,
	david@fromorbit.com,
	dchinner@redhat.com,
	Andrey Albershteyn <aalbersh@redhat.com>
Subject: [PATCH v3 13/28] xfs: add XBF_VERITY_CHECKED xfs_buf flag
Date: Fri,  6 Oct 2023 20:49:07 +0200
Message-Id: <20231006184922.252188-14-aalbersh@redhat.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231006184922.252188-1-aalbersh@redhat.com>
References: <20231006184922.252188-1-aalbersh@redhat.com>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

One of essential ideas of fs-verity is that pages which are already
verified won't need to be re-verified if they still in page cache.

XFS will store Merkle tree blocks in extended attributes. Each
attribute has one Merkle tree block. When read extended attribute
data is put into xfs_buf.

The data in the buffer is not aligned with xfs_buf pages and we
don't have a reference to these pages. Moreover, these pages are
released when value is copied out in xfs_attr code. In other words,
we can not directly mark underlying xfs_buf's pages as verified.

One way to track that these pages were verified is to mark xattr's
buffer as verified instead. If buffer is evicted the incore
XBF_VERITY_CHECKED flag is lost. When the xattr is read again
xfs_attr_get() returns new buffer without the flag. The xfs_buf's
flag is then used to tell fs-verity if it's new page or cached one.

The meaning of the flag is that value of the extended attribute in
the buffer is verified.

Note that, the underlying pages have PageChecked() == false (the way
fs-verity identifies verified pages).

The flag is being used later to SetPageChecked() on pages handed to
the fs-verity.

Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
---
 fs/xfs/xfs_buf.h | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/fs/xfs/xfs_buf.h b/fs/xfs/xfs_buf.h
index df8f47953bb4..d0fadb6d4b59 100644
--- a/fs/xfs/xfs_buf.h
+++ b/fs/xfs/xfs_buf.h
@@ -24,14 +24,15 @@ struct xfs_buf;
 
 #define XFS_BUF_DADDR_NULL	((xfs_daddr_t) (-1LL))
 
-#define XBF_READ	 (1u << 0) /* buffer intended for reading from device */
-#define XBF_WRITE	 (1u << 1) /* buffer intended for writing to device */
-#define XBF_READ_AHEAD	 (1u << 2) /* asynchronous read-ahead */
-#define XBF_NO_IOACCT	 (1u << 3) /* bypass I/O accounting (non-LRU bufs) */
-#define XBF_ASYNC	 (1u << 4) /* initiator will not wait for completion */
-#define XBF_DONE	 (1u << 5) /* all pages in the buffer uptodate */
-#define XBF_STALE	 (1u << 6) /* buffer has been staled, do not find it */
-#define XBF_WRITE_FAIL	 (1u << 7) /* async writes have failed on this buffer */
+#define XBF_READ		(1u << 0) /* buffer intended for reading from device */
+#define XBF_WRITE		(1u << 1) /* buffer intended for writing to device */
+#define XBF_READ_AHEAD		(1u << 2) /* asynchronous read-ahead */
+#define XBF_NO_IOACCT		(1u << 3) /* bypass I/O accounting (non-LRU bufs) */
+#define XBF_ASYNC		(1u << 4) /* initiator will not wait for completion */
+#define XBF_DONE		(1u << 5) /* all pages in the buffer uptodate */
+#define XBF_STALE		(1u << 6) /* buffer has been staled, do not find it */
+#define XBF_WRITE_FAIL		(1u << 7) /* async writes have failed on this buffer */
+#define XBF_VERITY_CHECKED	(1u << 8) /* buffer was verified by fs-verity*/
 
 /* buffer type flags for write callbacks */
 #define _XBF_INODES	 (1u << 16)/* inode buffer */
-- 
2.40.1

