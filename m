Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E4B27CB0A
	for <fsverity@lists.linux.dev>; Mon, 28 Jul 2025 20:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753734696; cv=none; b=LYs2RoKVYHq9sbR50FvUJgo9d6ZC3pu06W4tD4DJxiOaHpQeffcRmoS+X08giQtQ1vIH4dhkAk86rdqaDe/BzqLrFluLIsB4MnrGycsccQlgX7rbsnyysujo1iCwzhDuBPejx/WT7IcRmuTZ3G31BLEgRCH1GLvmM3Yfrf6z3AA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753734696; c=relaxed/simple;
	bh=V8qNbzjsE4JBu1MhTEPPGAHCYOvhHUKvJ9SI0FfHYX0=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Content-Type; b=BDQ4lOPCozfkL3GWeHDnRsOd+lG6uProKT/1f09mWVWEwXJPGgp8TkJc524IICFDswizqp/jbnN90BhDUPuxLnJBCNxf4TrjZnXclcwFvgofIPOAHHuyfPfX7XpGxOH5KfJLDJbzcHTJnwEqo7gF1XTEn3LOBuhsnWLQfoFSorY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dZ6yFRcv; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dZ6yFRcv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753734693;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zPq7ioMuDIU1givclwrLOed+wUzgBQHM4Krd29hrZGg=;
	b=dZ6yFRcvIo/hzmgHj6zHwRoabKg3UK15OA/7BP22RBGjU8dH/ZH5xyp5hGJWNsMRXsWAlz
	Vm3397f7VfEvAH/e6t3dLauGKBOrr6NurOqDG44XLjB1aOEKOPDTD+1GER5XCJGJetStT7
	TWtVCLKrZ93pRNvfOWlGdiQbPbBpq/s=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-633-6n-ZcuS8NJiJ8YyYZIRkLA-1; Mon, 28 Jul 2025 16:31:32 -0400
X-MC-Unique: 6n-ZcuS8NJiJ8YyYZIRkLA-1
X-Mimecast-MFC-AGG-ID: 6n-ZcuS8NJiJ8YyYZIRkLA_1753734691
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-612be84c047so5107778a12.2
        for <fsverity@lists.linux.dev>; Mon, 28 Jul 2025 13:31:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753734691; x=1754339491;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zPq7ioMuDIU1givclwrLOed+wUzgBQHM4Krd29hrZGg=;
        b=gh9dBSrWpowb4JT+/VdtBP3S/RnQTNbXsH+pBfxUBXonGTS+loGGrdEJH+vnHBs/9g
         VDVFS1Fy8t+gHudMgynyEXhx4Xu0qceCbenEeWqCveRGxFZcmhJuT0HlfBoBm/xX9qah
         l0hM4q9qmIIaN/V1PF+1eFjwICswCPoR9uyDM97G1Rg2z0fuXtxSQkdDqjYKo5gG3Og+
         r2lrIYJYrm2MWamdIoG0dONApzISWGJvrFtBm3TX6dnRLnrz1NAs5NQ8RbwbQaaJKQuN
         QciAvHq7X1lVEYlzE7SmEDCPUPGiHc8qbHqlQtutcsE3mllPvWhG3sh7NEQBb3hqsPRV
         BUjA==
X-Gm-Message-State: AOJu0YzIIRr7aQr/38xJGr2z3oJMNAx/7CNZfEcmK90dZtEHOZ5fPgyH
	g72OjGj9JgAGvxc0qvqQGOIXbJVJNFmVLbeKN3ZtdaZM6nfv7opvcAhgX/4/Tba4e150u4WQEvT
	TeCGkIPvnwEt/p7okPN9HEt+ZhOBUUeHmnYXwslh84rAuQX12eLscnHtroM4=
X-Gm-Gg: ASbGncuY2OYbxh5Xn5uL1E72E/3fSOaHI0K0gMNpRW8RFPelj3s8sS0XVbeJkcWR+Ws
	FqZo4K8K74gaqfnL4HAA8i5u8YiPeIPgatT6EQvfKYiBMPRUGNY7hB7/qFoFrOHctHFRxDnOsc0
	qVX9b+LshuuMwSHkU2BRxqFliKsodn3BgdwWqf1ZtNBI/zVCebZvDx1JfghdfO1yz5z/k/Sh5qF
	gXQdz4YB/EyTecTUt5Ty3E1XV2fvYI40K+M6PgpKouFb1aqxJjrgPlkbulGG7iL6EstMkgzsZmB
	LPS7efMtmc4qqj87CZa4jQyd5OrbTuLMwsjOx4DirR2Ejg==
X-Received: by 2002:a05:6402:2807:b0:60e:23d:43b1 with SMTP id 4fb4d7f45d1cf-614f1df695bmr12503523a12.16.1753734691234;
        Mon, 28 Jul 2025 13:31:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEJO8IlWhrpYESDaiCimQKB8ZcKiDQlQp927UKgU705UcobB9htySU5iKjsIwV3f3uW8HK5fQ==
X-Received: by 2002:a05:6402:2807:b0:60e:23d:43b1 with SMTP id 4fb4d7f45d1cf-614f1df695bmr12503495a12.16.1753734690764;
        Mon, 28 Jul 2025 13:31:30 -0700 (PDT)
Received: from [127.0.0.2] (ip-217-030-074-039.aim-net.cz. [217.30.74.39])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615226558d3sm2730656a12.45.2025.07.28.13.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 13:31:30 -0700 (PDT)
From: Andrey Albershteyn <aalbersh@redhat.com>
X-Google-Original-From: Andrey Albershteyn <aalbersh@kernel.org>
Date: Mon, 28 Jul 2025 22:30:14 +0200
Subject: [PATCH RFC 10/29] btrfs: use a per-superblock fsverity workqueue
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <20250728-fsverity-v1-10-9e5443af0e34@kernel.org>
References: <20250728-fsverity-v1-0-9e5443af0e34@kernel.org>
In-Reply-To: <20250728-fsverity-v1-0-9e5443af0e34@kernel.org>
To: fsverity@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
 linux-xfs@vger.kernel.org, david@fromorbit.com, djwong@kernel.org, 
 ebiggers@kernel.org, hch@lst.de
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1310; i=aalbersh@kernel.org;
 h=from:subject:message-id; bh=kuOn1nMdlYjue/gx8Se2FoLjVY/GfmNvzXVoSFxJQLY=;
 b=owJ4nJvAy8zAJea2/JXEGuOHHIyn1ZIYMtrviQdOW/4+UExSWf7seuPldh/jPvRu3Mjtucsj6
 39LeJhNYn5HKQuDGBeDrJgiyzppralJRVL5Rwxq5GHmsDKBDGHg4hSAibw6yfBPKy6t/d68ZbPT
 JxV8DZ5d7r6gb7Z+Us6O/f0W04RtCi67MjL07RM9G7V6tuLfTUuTPn9OjZ+/7kvtz7wM7cArTX0
 zDI6zAwBm2EpH
X-Developer-Key: i=aalbersh@kernel.org; a=openpgp;
 fpr=AE1B2A9562721A6FC4307C1F46A7EA18AC33E108
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5Qp1Y4Wl7Y29YXZgGk-DwPptm07pkEcUWiS74ZHFLjs_1753734691
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

From: "Darrick J. Wong" <djwong@kernel.org>

Switch btrfs to use a per-sb fsverity workqueue instead of a systemwide
workqueue.

Signed-off-by: Darrick J. Wong <djwong@kernel.org>
---
 fs/btrfs/super.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/fs/btrfs/super.c b/fs/btrfs/super.c
index a0c65adce1ab..cf82c260da9c 100644
--- a/fs/btrfs/super.c
+++ b/fs/btrfs/super.c
@@ -28,6 +28,7 @@
 #include <linux/btrfs.h>
 #include <linux/security.h>
 #include <linux/fs_parser.h>
+#include <linux/fsverity.h>
 #include "messages.h"
 #include "delayed-inode.h"
 #include "ctree.h"
@@ -954,6 +955,19 @@ static int btrfs_fill_super(struct super_block *sb,
 	sb->s_export_op = &btrfs_export_ops;
 #ifdef CONFIG_FS_VERITY
 	sb->s_vop = &btrfs_verityops;
+	/*
+	 * Use a high-priority workqueue to prioritize verification work, which
+	 * blocks reads from completing, over regular application tasks.
+	 *
+	 * For performance reasons, don't use an unbound workqueue.  Using an
+	 * unbound workqueue for crypto operations causes excessive scheduler
+	 * latency on ARM64.
+	 */
+	err = fsverity_init_wq(sb, WQ_HIGHPRI, num_online_cpus());
+	if (err) {
+		btrfs_err(fs_info, "fsverity_init_wq failed");
+		return err;
+	}
 #endif
 	sb->s_xattr = btrfs_xattr_handlers;
 	sb->s_time_gran = 1;

-- 
2.50.0

