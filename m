Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C9452FAE
	for <fsverity@lists.linux.dev>; Tue,  4 Apr 2023 14:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680620146;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WW1Er4PupDb0BosAfd03U+k3CW0R0JjVRop2pX5rde0=;
	b=CXS/yvxSHW7aMmP9GkOwqzD4bg7CzR+ZRs5qsYW63y6yTtC7bVwWDsaUyA4nlJCx2Bt3o0
	AP93FYq3siMuw0YEZCJ4mB4CPWVd3NWeDyX47f4AXiJDj7hfR5AjonoNczh/gP+6IN+qly
	XFj62FVL/4966KjAtfVq2ig0pcj8y9c=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-264-XIwmgqBIPmezZAqui9Zbww-1; Tue, 04 Apr 2023 10:55:45 -0400
X-MC-Unique: XIwmgqBIPmezZAqui9Zbww-1
Received: by mail-qt1-f198.google.com with SMTP id r4-20020ac867c4000000b003bfefb6dd58so22432296qtp.2
        for <fsverity@lists.linux.dev>; Tue, 04 Apr 2023 07:55:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680620145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WW1Er4PupDb0BosAfd03U+k3CW0R0JjVRop2pX5rde0=;
        b=iFlRxGV+96ajWeHmohvoTDPXsChekWVJhwF51gmEeu0WXhEFLeTDfwkOfV+sOeIix3
         P4+PWnO5a7FopK87OF6d69JvKj8725xj1YdZ91TYYvzwzwv1Dm3zfjSFpcEjAJ1clfK6
         7cEbTvSyL/MIo3GwqJPjA4897+qxj4bpCw7Oy5NVPEeLh0uRSZpjQ55GoFibI8ZTZq6Y
         /1dGr0ckcg4e9iTWz3PUOF/t49kcDADNBmq6KBpzDhONkp9PcNCI8fX2+smYWO4+8lsy
         5419bNwNwryRJGqM/zpHOq1mhxlnvcUuCPzboVkjDoALcJGMEa0hoNxvOSorQZkItuz7
         //JA==
X-Gm-Message-State: AAQBX9ekmQhU9qpoAVdYlFVI/tj7iZCG9y7MZbuF1nlrto//sU1goFkQ
	GUT2cocvmNSEnuK3qDOUr7Bj9eGW5BLVkSEmi0ghnKZEVLh0uMpU3OArsUp2yEJvYq0hgN5sN5K
	wstRi2PS99gi4oNyd6w==
X-Received: by 2002:ac8:5c84:0:b0:3bf:da69:8f74 with SMTP id r4-20020ac85c84000000b003bfda698f74mr3767018qta.39.1680620144598;
        Tue, 04 Apr 2023 07:55:44 -0700 (PDT)
X-Google-Smtp-Source: AKy350aLDs2V7JY0pZuUB09/Ptq0L7v7I2lb1rRcVAQ1NVCDKigQ1vtszHxXzaOscw9+3+n++r92jw==
X-Received: by 2002:ac8:5c84:0:b0:3bf:da69:8f74 with SMTP id r4-20020ac85c84000000b003bfda698f74mr3766987qta.39.1680620144232;
        Tue, 04 Apr 2023 07:55:44 -0700 (PDT)
Received: from aalbersh.remote.csb ([109.183.6.197])
        by smtp.gmail.com with ESMTPSA id j4-20020ac86644000000b003e6387431dcsm3296539qtp.7.2023.04.04.07.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 07:55:43 -0700 (PDT)
From: Andrey Albershteyn <aalbersh@redhat.com>
To: djwong@kernel.org,
	dchinner@redhat.com,
	ebiggers@kernel.org,
	hch@infradead.org,
	linux-xfs@vger.kernel.org,
	fsverity@lists.linux.dev
Cc: rpeterso@redhat.com,
	agruenba@redhat.com,
	xiang@kernel.org,
	chao@kernel.org,
	damien.lemoal@opensource.wdc.com,
	jth@kernel.org,
	linux-erofs@lists.ozlabs.org,
	linux-btrfs@vger.kernel.org,
	linux-ext4@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	cluster-devel@redhat.com,
	Andrey Albershteyn <aalbersh@redhat.com>
Subject: [PATCH v2 19/23] xfs: disable direct read path for fs-verity sealed files
Date: Tue,  4 Apr 2023 16:53:15 +0200
Message-Id: <20230404145319.2057051-20-aalbersh@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230404145319.2057051-1-aalbersh@redhat.com>
References: <20230404145319.2057051-1-aalbersh@redhat.com>
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

The direct path is not supported on verity files. Attempts to use direct
I/O path on such files should fall back to buffered I/O path.

Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
---
 fs/xfs/xfs_file.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/fs/xfs/xfs_file.c b/fs/xfs/xfs_file.c
index 947b5c436172..9e072e82f6c1 100644
--- a/fs/xfs/xfs_file.c
+++ b/fs/xfs/xfs_file.c
@@ -244,7 +244,8 @@ xfs_file_dax_read(
 	struct kiocb		*iocb,
 	struct iov_iter		*to)
 {
-	struct xfs_inode	*ip = XFS_I(iocb->ki_filp->f_mapping->host);
+	struct inode		*inode = iocb->ki_filp->f_mapping->host;
+	struct xfs_inode	*ip = XFS_I(inode);
 	ssize_t			ret = 0;
 
 	trace_xfs_file_dax_read(iocb, to);
@@ -297,10 +298,17 @@ xfs_file_read_iter(
 
 	if (IS_DAX(inode))
 		ret = xfs_file_dax_read(iocb, to);
-	else if (iocb->ki_flags & IOCB_DIRECT)
+	else if (iocb->ki_flags & IOCB_DIRECT && !fsverity_active(inode))
 		ret = xfs_file_dio_read(iocb, to);
-	else
+	else {
+		/*
+		 * In case fs-verity is enabled, we also fallback to the
+		 * buffered read from the direct read path. Therefore,
+		 * IOCB_DIRECT is set and need to be cleared
+		 */
+		iocb->ki_flags &= ~IOCB_DIRECT;
 		ret = xfs_file_buffered_read(iocb, to);
+	}
 
 	if (ret > 0)
 		XFS_STATS_ADD(mp, xs_read_bytes, ret);
-- 
2.38.4

