Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE32A2FAE
	for <fsverity@lists.linux.dev>; Tue,  4 Apr 2023 14:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680620159;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2wyXRFn15U7YuTtccu17S72kQxdrsvbnQJV5citpTBw=;
	b=LqcX52HFaZRxQJsyR+B4A1DfqUbQj1Fl1lBEWLQBAKyQwMddPKTuRVwjMbqGJsR8LD/QMc
	FRG3KS9ZB+MKZBJlYMW+5lEQ9dMUMMYs66QEYbzePngTYh2LSdMPSVZux151yc7S/klqSc
	8Ot0jeRGf7wYpZxXBmWjwUlZ30r0Jik=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-528-PjN_QswOMRigugOXjZb3VQ-1; Tue, 04 Apr 2023 10:55:57 -0400
X-MC-Unique: PjN_QswOMRigugOXjZb3VQ-1
Received: by mail-qk1-f200.google.com with SMTP id 195-20020a3705cc000000b00746a3ab9426so14797055qkf.20
        for <fsverity@lists.linux.dev>; Tue, 04 Apr 2023 07:55:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680620156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2wyXRFn15U7YuTtccu17S72kQxdrsvbnQJV5citpTBw=;
        b=oXHIWHM/cC8dZziDYuvHXPK1KtAFPVCkOSaKMRd2W6H35PYmXOYIXP8aMGv1tGIrUk
         Bg+GqIe64MTfR/azki/upr4rLbeDA5fFEjhIDGW6gH/9ntBK4c98pTbM5ziQrd6eCd2h
         rt7Wz4t/4YO/Hv/RrNFH3sUz3bQ2i4onU3FRRo8zcB+akIbSyUoPYxI6vpr33nexR3yO
         UGWnIroZigxfwjglMOJc7A3OiQ1BHiFaFYKws356D+2CkF91OUbaX0Mk/InNwys6GAZq
         2GCdpWnYT5rTv2P1dbRmIc3pOeYMnDpa2lV3dOOjpJH8MiY109kZGYb30NhcdGt/zCZF
         dymw==
X-Gm-Message-State: AAQBX9fKP7ZiqxWKNWvFQbAFtwJLaCeBMHVMVBMdcT+Nd15QWJER2FIY
	z740tSUpXX7V9mwXKpI/jqE0Oev48r+x8sQbxwVD2cojbAyW7PrZiGLohuTkRTGDqRMLZjXRboG
	RrjSI46hhDbpuk2DNlw==
X-Received: by 2002:a05:6214:202b:b0:57e:67c2:b9cd with SMTP id 11-20020a056214202b00b0057e67c2b9cdmr4447866qvf.27.1680620156124;
        Tue, 04 Apr 2023 07:55:56 -0700 (PDT)
X-Google-Smtp-Source: AKy350bJb0tNOFsr5rCdSnciXn4UvwnouNwwbFSTjZxZAVItCMscXXWD/V0CsYzmlqPKXH2vmnAZgg==
X-Received: by 2002:a05:6214:202b:b0:57e:67c2:b9cd with SMTP id 11-20020a056214202b00b0057e67c2b9cdmr4447836qvf.27.1680620155884;
        Tue, 04 Apr 2023 07:55:55 -0700 (PDT)
Received: from aalbersh.remote.csb ([109.183.6.197])
        by smtp.gmail.com with ESMTPSA id j4-20020ac86644000000b003e6387431dcsm3296539qtp.7.2023.04.04.07.55.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 07:55:55 -0700 (PDT)
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
Subject: [PATCH v2 22/23] xfs: add fs-verity ioctls
Date: Tue,  4 Apr 2023 16:53:18 +0200
Message-Id: <20230404145319.2057051-23-aalbersh@redhat.com>
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

Add fs-verity ioctls to enable, dump metadata (descriptor and Merkle
tree pages) and obtain file's digest.

Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
---
 fs/xfs/xfs_ioctl.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/fs/xfs/xfs_ioctl.c b/fs/xfs/xfs_ioctl.c
index 3d6d680b6cf3..ffa04f0aed4a 100644
--- a/fs/xfs/xfs_ioctl.c
+++ b/fs/xfs/xfs_ioctl.c
@@ -42,6 +42,7 @@
 #include <linux/mount.h>
 #include <linux/namei.h>
 #include <linux/fileattr.h>
+#include <linux/fsverity.h>
 
 /*
  * xfs_find_handle maps from userspace xfs_fsop_handlereq structure to
@@ -2154,6 +2155,22 @@ xfs_file_ioctl(
 		return error;
 	}
 
+	case FS_IOC_ENABLE_VERITY:
+		if (!xfs_has_verity(mp))
+			return -EOPNOTSUPP;
+		return fsverity_ioctl_enable(filp, (const void __user *)arg);
+
+	case FS_IOC_MEASURE_VERITY:
+		if (!xfs_has_verity(mp))
+			return -EOPNOTSUPP;
+		return fsverity_ioctl_measure(filp, (void __user *)arg);
+
+	case FS_IOC_READ_VERITY_METADATA:
+		if (!xfs_has_verity(mp))
+			return -EOPNOTSUPP;
+		return fsverity_ioctl_read_metadata(filp,
+						    (const void __user *)arg);
+
 	default:
 		return -ENOTTY;
 	}
-- 
2.38.4

