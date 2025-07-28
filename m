Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3197F1F3B89
	for <fsverity@lists.linux.dev>; Mon, 28 Jul 2025 20:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753734706; cv=none; b=ns6gwPE1C5IRaZteTgor1nZZeevxVBz1ch9AQ5pGpMrl7/oXXnIe9kRLSkZxQXtQNkXZTa93E6qY//mi8U26dn16yC8SkbgiqZhwD1NRSEFzEroWOSso+ZU6SWrdm7HwjYlQAV9vXHuDbMuqVcgR6p62fF0hfzMFSxRwtzD36iQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753734706; c=relaxed/simple;
	bh=9p3je7ovaq0B8RD2/pr9rtueolxe1jVdbp+fSNss1tA=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=sX1nQPx99cfkHtRnvzgkRU+C3Tdl0vycp9HRyinb/Kx4+FSGpgYvSxcevIwzmEuyUIBwqaARIZPsIHKwls+kPt+vu+O+RW0jqdiuCK6EACh9Qm7hBqKvn0zc/PMO4xmvdnquCMsNkD8X7sUsNWfRfpnrOWC9rfiOFnJTBJeYceY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LSoZkg46; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LSoZkg46"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753734704;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QtQJvCPxeTpstVyjgZAbXZc0G2YxyuH7YAlXrLlQnu0=;
	b=LSoZkg46J91hKY01A7NmOzaGruYz3RcvKn1VvndTcStR3E+bEjGMiGOTJtOkSb0/rAZRkN
	dzyx8+GqLLwVqYuTfMp66EVHLLpyPfBG7aqXmISwlBrnahfrlnjeev76fW74uI6PWzSsNG
	f3hsm0IDUnHxgPCHQ5yIuWphMg3+Z6I=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-682-SPEjtbHIM_yCcF4hYwkf0Q-1; Mon, 28 Jul 2025 16:31:43 -0400
X-MC-Unique: SPEjtbHIM_yCcF4hYwkf0Q-1
X-Mimecast-MFC-AGG-ID: SPEjtbHIM_yCcF4hYwkf0Q_1753734701
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-61563bdc8daso318972a12.2
        for <fsverity@lists.linux.dev>; Mon, 28 Jul 2025 13:31:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753734700; x=1754339500;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QtQJvCPxeTpstVyjgZAbXZc0G2YxyuH7YAlXrLlQnu0=;
        b=NblulGdqVNAth/G7i/GZuUpeWowgyS37tulMbcFuAzD+ggcm37F+b4TVoecjxeIvIz
         LkUyYTypZI/Ak398lm2SWOE5YR5NAdmukdehWTf0G1fNNjJShsFphELBwpsjUWUGuald
         5VSTDy7imE7gkkW3gA9fZYWVBUcm3H3JFLQn6M7B6c/5oebFA5QTWCBLFsGGSOlKXP7w
         3sw1B0820CkU1RlS2koOXleIkHKB2xGgt74etAQKvGNXe1SQcB722O4Eb+gXjQwpcTSz
         ADdUnonuEgjDIwxkepmD4XISKiTPHThuHQl3J3jLs/jF0sLXsMMjeEnASQ43e9RiNvPi
         F0uA==
X-Gm-Message-State: AOJu0YxtXzaHruHiAMSuqyh27h4GaF3z0QCs9HyJpA95oUu+4inonAql
	wEdqTGMt0xbpnKCQdH6eqEsg5oOiC40WEcFJy9pyj/U9+hr/8k9vEpUMyzKIvAPK4gK7fWIEGNR
	zOSSrwziWMl27VvIZTXOni9mGrvmy0dysBRqOHPCz5iylAsYNzNUmYQQOt326RupxImM=
X-Gm-Gg: ASbGnct8rzX1I2evi1mi0BNWw0tG598Kk2UD2fF8T5eKRO64x+x7hZ+9srzJHMBUrgO
	Gw53lmv0g0wbzPPsZYhjOwNhT+cfxottELHVUXEzeRBNLyfqgq5ZE+mIn48sdrSab8Ybsg+TWYc
	/yUIiwNoYyI2w2asr7WbQZL4DVyXYA4YFa61VGu2lG06ay6InKsWptwSEkl9yUc3a90YQn5xCP2
	9Cyw422kceUmKPVctLSSfPhvMfs9DMWEb2osTU1tIRbcJGPymM3Xq/Nq6bj4pV6f/OjYePW9il5
	iRgHHUNhTBgyiaSU3ckMhuSaz8g/wQOew2b65Unr21+IXQ==
X-Received: by 2002:a05:6402:84e:b0:607:f082:5fbf with SMTP id 4fb4d7f45d1cf-614f1bc4e08mr12085047a12.12.1753734700495;
        Mon, 28 Jul 2025 13:31:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFEm3mB3ElwGqIqkRyBhO2Z5hZvB74PuXLKq9UDjvFTGDUQy/f5zCpnhAQLNFtZgZRIeyuyWA==
X-Received: by 2002:a05:6402:84e:b0:607:f082:5fbf with SMTP id 4fb4d7f45d1cf-614f1bc4e08mr12085030a12.12.1753734700033;
        Mon, 28 Jul 2025 13:31:40 -0700 (PDT)
Received: from [127.0.0.2] (ip-217-030-074-039.aim-net.cz. [217.30.74.39])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615226558d3sm2730656a12.45.2025.07.28.13.31.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 13:31:39 -0700 (PDT)
From: Andrey Albershteyn <aalbersh@redhat.com>
X-Google-Original-From: Andrey Albershteyn <aalbersh@kernel.org>
Date: Mon, 28 Jul 2025 22:30:23 +0200
Subject: [PATCH RFC 19/29] xfs: disable direct read path for fs-verity
 files
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <20250728-fsverity-v1-19-9e5443af0e34@kernel.org>
References: <20250728-fsverity-v1-0-9e5443af0e34@kernel.org>
In-Reply-To: <20250728-fsverity-v1-0-9e5443af0e34@kernel.org>
To: fsverity@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
 linux-xfs@vger.kernel.org, david@fromorbit.com, djwong@kernel.org, 
 ebiggers@kernel.org, hch@lst.de
Cc: Andrey Albershteyn <aalbersh@redhat.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1542; i=aalbersh@kernel.org;
 h=from:subject:message-id; bh=pMZQbXtMrVBz6SrzAXMqrLN3V7mq4bHJ3sncK2j8+2g=;
 b=owJ4nJvAy8zAJea2/JXEGuOHHIyn1ZIYMtrvSXxXVRT749GyXdn3V8Wy/1NWLajpunhedsr8p
 PdVBb+qMxk7SlkYxLgYZMUUWdZJa01NKpLKP2JQIw8zh5UJZAgDF6cATOTfKYZ/JpG5x6ae+WG9
 UHzu0bbHp/l1zJR3r2a6/kn4xPYVObVntBj+GeYfWnr/wBwvvidTpB3bFZ1ZZxxvVNr0zeXOi8w
 JTWfd2ACym0xK
X-Developer-Key: i=aalbersh@kernel.org; a=openpgp;
 fpr=AE1B2A9562721A6FC4307C1F46A7EA18AC33E108
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0LRNvYyf4jiDMFY04EZ6eBkMJ0mVougpXRJS5nWCzj8_1753734701
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

From: Andrey Albershteyn <aalbersh@redhat.com>

The direct path is not supported on verity files. Attempts to use direct
I/O path on such files should fall back to buffered I/O path.

Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
Reviewed-by: Darrick J. Wong <djwong@kernel.org>
[djwong: fix braces]
Signed-off-by: Darrick J. Wong <djwong@kernel.org>
---
 fs/xfs/xfs_file.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/fs/xfs/xfs_file.c b/fs/xfs/xfs_file.c
index da13162925d9..9680c97ee40f 100644
--- a/fs/xfs/xfs_file.c
+++ b/fs/xfs/xfs_file.c
@@ -259,7 +259,8 @@ xfs_file_dax_read(
 	struct kiocb		*iocb,
 	struct iov_iter		*to)
 {
-	struct xfs_inode	*ip = XFS_I(iocb->ki_filp->f_mapping->host);
+	struct inode		*inode = iocb->ki_filp->f_mapping->host;
+	struct xfs_inode	*ip = XFS_I(inode);
 	ssize_t			ret = 0;
 
 	trace_xfs_file_dax_read(iocb, to);
@@ -312,10 +313,18 @@ xfs_file_read_iter(
 
 	if (IS_DAX(inode))
 		ret = xfs_file_dax_read(iocb, to);
-	else if (iocb->ki_flags & IOCB_DIRECT)
+	else if ((iocb->ki_flags & IOCB_DIRECT) && !fsverity_active(inode))
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
2.50.0

