Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A5F38FA1
	for <fsverity@lists.linux.dev>; Fri,  6 Oct 2023 18:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KNAvR1AB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1696618366;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h+hERDddpeeIHe4DM9B5TqIjpvoGQYj+Dd7I5rMKZNk=;
	b=KNAvR1ABKujgntzNxOEVp2opAqPRxh7I9qcwHQCjoUd10+vb+4+NH7JOUJYBhZus3whE2M
	K9ZPvZsTYcDprcLw+fiRh7x62HB0uKRRiz5Cxq94sPOKowGn90ByAwRWfR3uxa2SUqRUe3
	+UjU78ZoqJSaAe3/gvRHI0fxeofKCpU=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-588-BR-PwS3PPHu2h-SMMpkKOw-1; Fri, 06 Oct 2023 14:52:44 -0400
X-MC-Unique: BR-PwS3PPHu2h-SMMpkKOw-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-99bca0b9234so206619466b.2
        for <fsverity@lists.linux.dev>; Fri, 06 Oct 2023 11:52:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696618363; x=1697223163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h+hERDddpeeIHe4DM9B5TqIjpvoGQYj+Dd7I5rMKZNk=;
        b=kHS+Tm7PsNE1MgSColmqC+o7pwUB4SnKx7fEQKAtHuTq9KRBATEk92MxbrrtgaCpk3
         bR3M3EF1ttJAZEBVhLCRb1XudnKwj1qK6KOJwWP+y0djqZF5EMjIZ1zzEzAGt8a4HpGH
         rdcZTWYoQj66j2vLRyDEloqhYdGUAs1RWV4ir6w0g0QCCha/RSCc3M65E1W4wuK7SrDW
         krZh8nJTEKn3k21NNW7XSljF8qRRT+moel6BnoJKBlk4hzHt74ajVsW7uSbFzDn5c0M3
         udSVPjy2UC/O6E+oSJnaOgMSf9pJvRrFsFs1wPzQJuYPyaN2oPBkueK26e+QxU2gsUU7
         X9pg==
X-Gm-Message-State: AOJu0YyhtIULM7KZ4bpjktJG4s5LSGXWnFuSy5PLO8+VpxpOpw71iKcu
	DghbzSCF/hb2jsnbJDqEuGXPrTFO6bIHmx07iN35mKKLe8oJs57Q4bdcVXsQv+RbiUs0uARM1kr
	ebTee3fKr/khtFcwxeA==
X-Received: by 2002:a17:906:31c7:b0:9ae:673a:88c8 with SMTP id f7-20020a17090631c700b009ae673a88c8mr8463907ejf.21.1696618363789;
        Fri, 06 Oct 2023 11:52:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGj4mxEdfFg60CQgUH6Kl9WUvjEgQ0RS1ocFOzUW2NWuCD/0V4jWL98MJ2Rk4lHCKYOiP5xjQ==
X-Received: by 2002:a17:906:31c7:b0:9ae:673a:88c8 with SMTP id f7-20020a17090631c700b009ae673a88c8mr8463904ejf.21.1696618363632;
        Fri, 06 Oct 2023 11:52:43 -0700 (PDT)
Received: from localhost.localdomain ([109.183.6.197])
        by smtp.gmail.com with ESMTPSA id os5-20020a170906af6500b009b947f81c4asm3304741ejb.155.2023.10.06.11.52.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 11:52:43 -0700 (PDT)
From: Andrey Albershteyn <aalbersh@redhat.com>
To: linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	fsverity@lists.linux.dev
Cc: djwong@kernel.org,
	ebiggers@kernel.org,
	david@fromorbit.com,
	dchinner@redhat.com,
	Andrey Albershteyn <aalbersh@redhat.com>
Subject: [PATCH v3 27/28] xfs: add fs-verity ioctls
Date: Fri,  6 Oct 2023 20:49:21 +0200
Message-Id: <20231006184922.252188-28-aalbersh@redhat.com>
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
2.40.1

