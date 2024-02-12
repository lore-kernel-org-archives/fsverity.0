Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 489D23FB35
	for <fsverity@lists.linux.dev>; Mon, 12 Feb 2024 17:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707757225; cv=none; b=m8FUVIlWM+d4mLvWGFTVhD4LMzChgkreOaNGtNXNUkaHi74KaNuSx1kwXMfirj2AMybEyFAXrTKaiOS7XFXtoga9+zbPnThEg5QehDmNsY91jtsmoXMHmdJQ42Bu/YO/SFnvFuJxckX/lrdHhBhW3OGE8ejKVUAKSvxuXAURvZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707757225; c=relaxed/simple;
	bh=L31YpI5cHGwgxPGXiju5BCSchrSCFM+W/kdnKuUSicg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uAJhehZnbTQR92OOb9LzZ1bDtALZ1yFXUPhR3xMwQhsqFqFYk77H5siCAupqRLZcYxa9vi4rtwlVHdzSXFHYf0XMYxOd+kyrb873YFcIrEyOfS5ccMjFDrkCUM3sg67qTBdWNPaHUZELqOEavjPm4VFo8jWlIG/RWkv/ywa/Da0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=C8rKr6pU; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="C8rKr6pU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707757223;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v8DMtYJWCVCHSCEWBZfbGi3INfqAeJCCNzs6AgTs1hw=;
	b=C8rKr6pUq2EyBmE7eLPWRkcudXT7BUc3kZWOdMXsH9AvNI9S5C9XJq7tVysMwEpTnTZahK
	OIrtLD2h344WSKGQTMNh9LPl5/n09UtuK9CnhjGNosdXaKhGLqGgGWseHC5RtBsLwfPJl+
	8BUzE4fsEdfrUjGHGKZiGUS66ohoOLI=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-693-iofULLagPymuJ8Nl445yOw-1; Mon, 12 Feb 2024 12:00:21 -0500
X-MC-Unique: iofULLagPymuJ8Nl445yOw-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-5600ba5a037so28303a12.0
        for <fsverity@lists.linux.dev>; Mon, 12 Feb 2024 09:00:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707757220; x=1708362020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v8DMtYJWCVCHSCEWBZfbGi3INfqAeJCCNzs6AgTs1hw=;
        b=pz2A4/dUwEVMtycJocXpml5As7380JgSXl4HH7Pcm22SMge41YYgKKqO0ev2941qyt
         ZX8ys7nXcYiaAjAvQc4FmvZrAYd0/9CndWkZ6Db7Y0jvu3rGMGMYkg/Z3Bsb3rXsURXp
         FVwUnP2L5wmtrnud0Xye65/taW43kCVvVxrQJD30ToMzBbJRDtOtOREOwzuiHaoaq8Cs
         b/txxFpE4R9lMZbE75cx6H0W+gruN0er+RhJQGoaemx8c+uw6GP04R1JCCRkAniKOcnl
         UhLdm19r97Ufdql+JopA4plJ8PDsJvFZjqZnJ+BvWwj8T10e3xqSUCYWjO4FFwkJL5WN
         X9Wg==
X-Gm-Message-State: AOJu0YyOpkjP2n5SvhxoZEEZMA9p0+4LvNtLKzRkbpPUNxfnwRlAJ8+j
	0TavQiSy/ux9XD+uWrL53GUFqjjrwqr7H7i5GCGcL6GpZkKZvbnJK5QN9b+KTUpsl2jNJJwyQum
	uLpvYYLg9KEQ/+OVnhUlIpuNcgCJ9GBu+H18eEa+mjlBFOgbVhEbyFsdQd4sdOFdhpWGJBqsTnN
	4rOBZIj3JKKhXNe4bvzPsf/zZ6ZrYdWMIUw9zTVQE=
X-Received: by 2002:aa7:c71a:0:b0:560:4e6:c442 with SMTP id i26-20020aa7c71a000000b0056004e6c442mr4968913edq.1.1707757219988;
        Mon, 12 Feb 2024 09:00:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHdqLzEkltOhv90/mdAnBYzqC7IUdmnma0K+szge3JGNVz0tYyEgI2sp8chHtI9P5lmUmCjVA==
X-Received: by 2002:aa7:c71a:0:b0:560:4e6:c442 with SMTP id i26-20020aa7c71a000000b0056004e6c442mr4968893edq.1.1707757219573;
        Mon, 12 Feb 2024 09:00:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV3N3pdtpy2jDzzn9qjG81jBQ/X5sQeRIfOLG26RPUaUSSngS8BpTycQ3WIoFOMcO1xf9fGHYsQ94U8TsvWWVkCU0bbz6k8resLyTmPIDI5OyfbJpA2iDbStA3VZbVuuwCWj0Pl2k/t2JENFurvj357mNiz0AQE7dVAMsSi0pfW6BEUDkievBaQHTIkytdug4eYIOID5DxYHpZ/cNdPZgzsTnz9sQ8Gv1PX
Received: from thinky.redhat.com ([109.183.6.197])
        by smtp.gmail.com with ESMTPSA id 14-20020a0564021f4e00b0056176e95a88sm2620261edz.32.2024.02.12.09.00.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 09:00:18 -0800 (PST)
From: Andrey Albershteyn <aalbersh@redhat.com>
To: fsverity@lists.linux.dev,
	linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	chandan.babu@oracle.com,
	djwong@kernel.org,
	ebiggers@kernel.org
Cc: Andrey Albershteyn <aalbersh@redhat.com>
Subject: [PATCH v4 21/25] xfs: disable direct read path for fs-verity files
Date: Mon, 12 Feb 2024 17:58:18 +0100
Message-Id: <20240212165821.1901300-22-aalbersh@redhat.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240212165821.1901300-1-aalbersh@redhat.com>
References: <20240212165821.1901300-1-aalbersh@redhat.com>
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
 fs/xfs/xfs_file.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/fs/xfs/xfs_file.c b/fs/xfs/xfs_file.c
index ed36cd088926..011c311efe22 100644
--- a/fs/xfs/xfs_file.c
+++ b/fs/xfs/xfs_file.c
@@ -281,7 +281,8 @@ xfs_file_dax_read(
 	struct kiocb		*iocb,
 	struct iov_iter		*to)
 {
-	struct xfs_inode	*ip = XFS_I(iocb->ki_filp->f_mapping->host);
+	struct inode		*inode = iocb->ki_filp->f_mapping->host;
+	struct xfs_inode	*ip = XFS_I(inode);
 	ssize_t			ret = 0;
 
 	trace_xfs_file_dax_read(iocb, to);
@@ -334,10 +335,18 @@ xfs_file_read_iter(
 
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
+		 * IOCB_DIRECT is set and need to be cleared (see
+		 * generic_file_read_iter())
+		 */
+		iocb->ki_flags &= ~IOCB_DIRECT;
 		ret = xfs_file_buffered_read(iocb, to);
+	}
 
 	if (ret > 0)
 		XFS_STATS_ADD(mp, xs_read_bytes, ret);
-- 
2.42.0

