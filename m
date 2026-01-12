Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B679818A6D4
	for <fsverity@lists.linux.dev>; Mon, 12 Jan 2026 14:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768229490; cv=none; b=VzURB/R3c8xIZrW+PNK2rzeePSJMlW9YiEyjJwTnqD1dPMy53mjqQyHTDjxohit06FkfstUflbSMTW+k4RJm/omPo4AIkRg9yqpTbCb4Psc2XAj284LYi/+JZkeBezPM4owetvM0gyTeXg81jcC4yjP6Lpd8pDstQ5ho8J2ocgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768229490; c=relaxed/simple;
	bh=juaXjaWCdJhgUxdxDnPo/I5g1bovOuzvfAho0L4f/bA=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=Kj+nQekz782mLB5nGyffWTadsM8Kx+cKOR13zkfOyxEsCAzG1cG10po9s8OJ6zh0gmiNIXxk2C4pdIYRDX83nB/FGsUb94CWtxc22stmXfdxd3OIn3uT2FWkawcyOXMrLPP/BWyCJTOk0N/RVcWp5OUEufhLlZAo1GIP54Wo8hQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TIwnBj7B; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TIwnBj7B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768229488;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=R3lmcg/cu75BB25Wlh2Ox4/Pwg0aDpFEC5S3Bq4BJXs=;
	b=TIwnBj7BwqSqmGAk4crcYvmXbPJRY8CH8Cuhh5ArZ5AsSUGL+8D8JLr2ODBIDRhEjkX0AY
	SIbJmeoo6M5xJfkR/ePNv9nlOQ33p/sBeqpQRX9yKpXe5/LDo9hefds0PZgSBzP3/XOFoY
	jQ5uRkjxX6JAAfDauJ2T3htmC7OnegQ=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-563-oFIHCK6yPiW-0FifX23akw-1; Mon, 12 Jan 2026 09:51:06 -0500
X-MC-Unique: oFIHCK6yPiW-0FifX23akw-1
X-Mimecast-MFC-AGG-ID: oFIHCK6yPiW-0FifX23akw_1768229465
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-b872c88d115so56949966b.2
        for <fsverity@lists.linux.dev>; Mon, 12 Jan 2026 06:51:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768229465; x=1768834265;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R3lmcg/cu75BB25Wlh2Ox4/Pwg0aDpFEC5S3Bq4BJXs=;
        b=F6xLDNiK3s57nRWoLSoF9PgusvYq8IqhyZ8QtNcYC+0cWmIDYcK6FPpc4851FZsZp0
         pD+vFW4zzTXfZk+/WYIHCSdmX9eJXRi00TBRrwlosIZMh7mJvjXcysakL8ljGlqTK2tI
         D/RUK4IoS9vcF6EUIdOczbOAKFWhjJQpX4qg1ne7rZEebZucsrFirdh5wtRina/tCDoy
         nY56RYdeqk+6zaq0aLZQP05WTnMulzGANl+zkTKoZzkNUFdY2J0hISbqnCm7i56HFRgm
         imqAy1BFNE9ybz0BIta4evqRiHaUXAHM7ELBFBDWMVgbcfXQ1C8xYYqriifgEkAxV9fs
         rtcg==
X-Gm-Message-State: AOJu0YxhVAme/VNbcN26OkW0qidlV2UfIixM1uo2Yk6uELnv4aafNgPu
	PZBUsnP0kpx4aLfhtQ7L3iSJ3hSbdfPAgsfeRVPzNOr1BRcWlfAvZXV0bHEXO1Fs2BmvPNUcIEZ
	iSSoqpLt41zE2uJjJ/I5UG4phmpoXyDP/ZsMJcLX4gHxclXd9OL/gHpGY38JbkPxlLE+Wanl6XY
	KhvaBnyo5lHteeFVGDaRWdiKWm5as49ARP5chX5elPWqk=
X-Gm-Gg: AY/fxX5qaz+WqAWyqu6zjyjfmjH++6187cHGQ1omOETySJA1IcKTQpZA2xvW5ViAoxS
	3P4Ehxt5r6vbMM9DE16wIQkvGHUqFv45PrqwTbpiLkqeQMTKHLZ0VlG5rf5mfS7rJJMv+PYYloC
	1GpZMtsepbjrpDvfEQsiffY94KY5FmAyc4a6XTBKjHRvdf3E7BQbpGwlkn8zF5P0/hTpTk8VbN+
	+PQyFUQ927Y0oR/VG0CzpA1sZJuDC5qvmCPLGhWe2pYMiRO/X34EbopV7gtgZHEOiYPiazvoz13
	3ck6OfN1eM5GWORVvpnePHuX5yEP4OXoUVIZQrBMVSpeotp0wZGiLeehScWCJXypoDIaLXX4B80
	=
X-Received: by 2002:a17:907:968b:b0:b87:15a7:85e0 with SMTP id a640c23a62f3a-b8715a78b2cmr338221966b.26.1768229465088;
        Mon, 12 Jan 2026 06:51:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IET2nU/xS7rTGGJI9aaTqCSFphZHua3LUHkxfJzBhZsDQMy1yw4maDpAej9bQDC3iRtIDmAUg==
X-Received: by 2002:a17:907:968b:b0:b87:15a7:85e0 with SMTP id a640c23a62f3a-b8715a78b2cmr338218666b.26.1768229464502;
        Mon, 12 Jan 2026 06:51:04 -0800 (PST)
Received: from thinky ([217.30.74.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b870776b642sm529509066b.21.2026.01.12.06.51.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 06:51:04 -0800 (PST)
From: Andrey Albershteyn <aalbersh@redhat.com>
X-Google-Original-From: Andrey Albershteyn <aalbersh@kernel.org>
Date: Mon, 12 Jan 2026 15:51:03 +0100
To: fsverity@lists.linux.dev, linux-xfs@vger.kernel.org, 
	ebiggers@kernel.org, linux-fsdevel@vger.kernel.org, aalbersh@kernel.org, 
	aalbersh@redhat.com, djwong@kernel.org
Cc: djwong@kernel.org, david@fromorbit.com, hch@lst.de
Subject: [PATCH v2 10/22] xfs: disable direct read path for fs-verity files
Message-ID: <6rsqoybslyv6cguyk4usq5k2noetozrj3k67ygv5ko5fc57lvn@zv67vcnds7ts>
References: <cover.1768229271.patch-series@thinky>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <cover.1768229271.patch-series@thinky>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: PbuZ4B8u2kkqbdjxloBeH0iAibbFQTuTRsRY-MkUrwM_1768229465
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The direct path is not supported on verity files. Attempts to use direct
I/O path on such files should fall back to buffered I/O path.

Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org>
Reviewed-by: Darrick J. Wong <djwong@kernel.org>
[djwong: fix braces]
Signed-off-by: Darrick J. Wong <djwong@kernel.org>
---
 fs/xfs/xfs_file.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/fs/xfs/xfs_file.c b/fs/xfs/xfs_file.c
index 0c234ab449..87a96b81f0 100644
--- a/fs/xfs/xfs_file.c
+++ b/fs/xfs/xfs_file.c
@@ -254,7 +254,8 @@
 	struct kiocb		*iocb,
 	struct iov_iter		*to)
 {
-	struct xfs_inode	*ip = XFS_I(iocb->ki_filp->f_mapping->host);
+	struct inode		*inode = iocb->ki_filp->f_mapping->host;
+	struct xfs_inode	*ip = XFS_I(inode);
 	ssize_t			ret = 0;
 
 	trace_xfs_file_dax_read(iocb, to);
@@ -307,10 +308,18 @@
 
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
- Andrey

