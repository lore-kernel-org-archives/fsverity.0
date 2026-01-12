Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D282D94A1
	for <fsverity@lists.linux.dev>; Mon, 12 Jan 2026 14:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768229494; cv=none; b=XXRoPjM8L+51I2y4yPizdRRsMIa2zFA037Yye6X6bJe0t7Bi3jkdUu8sgR0EpHsDNGLsD/CNwQCKjE039MS4aorbCSK6IIDJhsc6PRuh6WiH1ek3Asfc16NgfnUqRwqjqll4R//cB8sbnvvOzsiRvM2vhoipL1I/gmgZiWpGSuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768229494; c=relaxed/simple;
	bh=G0tanH7Ti+k9Untiwo28pq9nTnDMDuydjlfNBKCMaYI=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=LF4NtTyzZwOJYVN03oN8CY5biWbwgAr3Hlybp3rWXKSW3+Q4WzR3f67QP/Wz9RyExAa2bIgzo9QAVtr/m1pV9pOmRC95zcOQ7ucuR8hQrqv7V0Kdd/14+ACi8oEktzRrYIRPwEJ+WyuBaim8rf3975e6n+05k6KKuV08/greDTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=e51eYJTu; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="e51eYJTu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768229491;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dq6aVc2SBP1ULPYVZkGBkgSZtTVfOp/X5bD2Y/FWtBU=;
	b=e51eYJTuXtHt1txtlcM8bqCF1G33sIbjI70ZkhefjpIoe6xKJTrkZpmZ1Rjc82UJhnFD2o
	QaRDU6bXcoYKaZEfziNiwXicje0+YQrY12OYD2gSoDzTyMWjOzyg4ps2cqznVt5QiBRxAp
	27w6CAQ+Xjd537mBYnTy3O9WPIrzgA8=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-410-dSUUBOUrPNmchMFD0JUPJQ-1; Mon, 12 Jan 2026 09:51:28 -0500
X-MC-Unique: dSUUBOUrPNmchMFD0JUPJQ-1
X-Mimecast-MFC-AGG-ID: dSUUBOUrPNmchMFD0JUPJQ_1768229488
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-64b8a632dc7so8657832a12.3
        for <fsverity@lists.linux.dev>; Mon, 12 Jan 2026 06:51:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768229487; x=1768834287;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dq6aVc2SBP1ULPYVZkGBkgSZtTVfOp/X5bD2Y/FWtBU=;
        b=GwQSAdAKIcqox6vK/EY+Qpu6oZ3d/AzixYEWmXBn3YeK5YoLhgwHLTN9IiVFIoFWSL
         3yG8Uemn9c/fIAooK2tuBAxQMXC2HTd2PTwOSurSp0qKSugJ6qVS3v4eCiKcz24tcLym
         HZNwuZr08N4lsjaM9NoX2TU/AwCEL90KmVMCwBkFIwulzuArzQlq5PIPcx+BQfvysMJi
         Oir+La9G7BfVBA1eRCItTYxap11izfouEwuW11NVdJ64Iz+Y3Z0efZ8p6cEhhOX1KIoo
         HJXUJSD+gs9O9TJgvYsfn8TULn/68xNvt60WMlto8GZmtxKuY4eet/0L7v3HvyT/xpk+
         Lp3g==
X-Gm-Message-State: AOJu0Yy8XVCjuixw/sMP+rDg8xY2UXnAVxQzvLfaSUcuvRTQ8efq/ACH
	QKc+JDjqluVf5NfUxC2xLC5Z3Ti932ba1m+e8nJHpo6QNnNJ58o6B0Nw283bv1z5pTNrVDyh1Z4
	WVbnlWDpV1RS6bVVfQoCplpxQdT6y2rPGUCX9CcAOg2D7unJ9cCS6vt+4CNFTB9xqD3jn0KtkBz
	JwuyS9A+edDnPM+m3cAAW7FABccoKqgncxUOrwEcMkldM=
X-Gm-Gg: AY/fxX6UjsPq+vJTULMMwWyKaDNSENeYrpPZ9D8BaovIk4NzzKriXyECKBmmhmFRgqJ
	VpXRVtY1h4NhrHTjtb7WmR1ePYiOX3gittdlbi6tzddEKRipL9Md4NvNDQZaupEPVkdfiWCPVpe
	cdEPtUlVu42vQlrxHdSmDiy7cMUBpdq2agaqKIEjKZqx7WPm7qNq0nC8K/SidRSJFVOMWkJrsqH
	y3bhk5ZLqQtEdrDaIrezGn7ZNE9p/EBzMJY405Fdmr6eSF/OPVh7WCsXgY84WRdIn6iL0ZmFK/p
	n255FfURR0yAFc0NQBd+NuZ+c9fKmkLWjdmDDBYeAnfqQamEPQRKKwOA9n7moZDVcXimmGvELzE
	=
X-Received: by 2002:a05:6402:358f:b0:651:1107:d3cb with SMTP id 4fb4d7f45d1cf-6511107d7acmr3282600a12.24.1768229487281;
        Mon, 12 Jan 2026 06:51:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHfxvOxfxzdEBvJzPLysHOh9QzRSHooaY9jamBd0ngvYg8b3UMPNPIM3r/hBbc0eI3X4Vj7fQ==
X-Received: by 2002:a05:6402:358f:b0:651:1107:d3cb with SMTP id 4fb4d7f45d1cf-6511107d7acmr3282573a12.24.1768229486750;
        Mon, 12 Jan 2026 06:51:26 -0800 (PST)
Received: from thinky ([217.30.74.39])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507b9d4c0asm17933810a12.9.2026.01.12.06.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 06:51:26 -0800 (PST)
From: Andrey Albershteyn <aalbersh@redhat.com>
X-Google-Original-From: Andrey Albershteyn <aalbersh@kernel.org>
Date: Mon, 12 Jan 2026 15:51:25 +0100
To: fsverity@lists.linux.dev, linux-xfs@vger.kernel.org, 
	ebiggers@kernel.org, linux-fsdevel@vger.kernel.org, aalbersh@kernel.org, 
	aalbersh@redhat.com, djwong@kernel.org
Cc: djwong@kernel.org, david@fromorbit.com, hch@lst.de
Subject: [PATCH v2 13/22] xfs: introduce XFS_FSVERITY_REGION_START constant
Message-ID: <qwtd222f5dtszwvacl5ywnommg2xftdtunco2eq4sni4pyyps7@ritrh57jm2eg>
References: <cover.1768229271.patch-series@thinky>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <cover.1768229271.patch-series@thinky>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: vItpwegh54jrNhouHXyOcbaSkp127FrX3PRbKcRE7Yg_1768229488
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

This constant defines location of fsverity metadata in page cache of
an inode.

Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org>
---
 fs/xfs/libxfs/xfs_fs.h | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+), 0 deletions(-)

diff --git a/fs/xfs/libxfs/xfs_fs.h b/fs/xfs/libxfs/xfs_fs.h
index 12463ba766..b73458a7c2 100644
--- a/fs/xfs/libxfs/xfs_fs.h
+++ b/fs/xfs/libxfs/xfs_fs.h
@@ -1106,4 +1106,26 @@
 #define BBTOB(bbs)	((bbs) << BBSHIFT)
 #endif
 
+/* Merkle tree location in page cache. We take memory region from the inode's
+ * address space for Merkle tree.
+ *
+ * At maximum of 8 levels with 128 hashes per block (32 bytes SHA-256) maximum
+ * tree size is ((128^8 − 1)/(128 − 1)) = 567*10^12 blocks. This should fit in 53
+ * bits address space.
+ *
+ * At this Merkle tree size we can cover 295EB large file. This is much larger
+ * than the currently supported file size.
+ *
+ * For sha512 the largest file we can cover ends at 1 << 50 offset, this is also
+ * good.
+ *
+ * The metadata is stored on disk as follows:
+ *
+ *	[merkle tree...][descriptor.............desc_size]
+ *	^ (1 << 53)     ^ (block border)                 ^ (end of the block)
+ *	                ^--------------------------------^
+ *	                Can be FS_VERITY_MAX_DESCRIPTOR_SIZE
+ */
+#define XFS_FSVERITY_REGION_START (1ULL << 53)
+
 #endif	/* __XFS_FS_H__ */

-- 
- Andrey

