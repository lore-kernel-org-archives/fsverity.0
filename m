Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 040F13E498
	for <fsverity@lists.linux.dev>; Mon, 12 Feb 2024 17:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707757230; cv=none; b=ZctG0Nx6UoSG0b25g0kh9uoUlYq4U4PfxEIMIwa8xP3Q3A4eUJ7aPKASd7k1x3+x7bzgjU/7LYHZ2Z1ae87hku13t5BfWcXvv39w6zeNeGkZeBPvcNhP12fl3VwwSKMuQx81qgNq8QEueHb1AtOFtvg6fbEAjzYxG6w/mD/quwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707757230; c=relaxed/simple;
	bh=3huMSuptuBha2CwG1y0/SfdkyV9jIivWktDsQLKbc70=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TFne0q/x7nY7T2jwuEdQ9BFiStzxDRXFS/MGYAwb9/b/eoy0nNL6ecnoXMbVR6xs0Oh1l7GhvtZW4rFKy6sc+6YMCdvZYgkJvcSgJ8s8Lk1L8O7D3gGfy1U/DPhS7c6a2xY9r6R3+//qIMBGOIRs49zIpEMQ0Aw/WUtAJy6wlRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UKI/ZdQm; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UKI/ZdQm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707757227;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O/7GvRpwmqndoF+ccNvwmWywMN3/sSl/624LXUp5jis=;
	b=UKI/ZdQmDpqBfHoLx3kEan5RjR1cmftdk25hFTKub/EOF1/gzvH/CP9EQhk/raFpqTFBhB
	nfZ/jk/gRqImpjDAxc8XjDLQczuBsvT+h2aXoWQQP90dTptDvdxifdjpw3XE72w1IuXRYU
	z4XSoPHWQNbk+glEQjQZZ012nWoaMEQ=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-582-fFXsVtOAPjay9O7vuh1j3g-1; Mon, 12 Feb 2024 12:00:25 -0500
X-MC-Unique: fFXsVtOAPjay9O7vuh1j3g-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-55ffcfed2ffso4899624a12.0
        for <fsverity@lists.linux.dev>; Mon, 12 Feb 2024 09:00:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707757224; x=1708362024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O/7GvRpwmqndoF+ccNvwmWywMN3/sSl/624LXUp5jis=;
        b=R+Ilv7hOhXYkjRjyLOoLOI46+uwdelT6iCDlGaGENeefzVKHUfphmpVYE7aGtw3rRR
         C6vYbqLbu9s6kocbtATyJF6c805DrUZEW+Sp5bZ6mfBuribvol3Dpj/Rxn2x8n1m3qAT
         FQbjppkW7kH4A0sNLxA/68JLhGWgidfNHnn6zvYPCZshkpbYtOCLTSyzMCm2Ri8T5iCu
         72twDCQaQxGREpoJ+akNn6HVcdMrPJOV197gvffJFxMyQQnCKGZro+EwTS4HfFDBS0qY
         VMSUeo3g/CYqaq2QmOmlusViAWIB/kkCPXn1T7UsjgZzDzWq1e5TxlHnaOr4IpkGkImG
         8vhw==
X-Gm-Message-State: AOJu0YyJBLsoxm57UDtxOm5l4XJU55gZzpGbkZWg9PJ9kt2UV8HkZ0ID
	6Lac1dHCBSgC0Vo3ItZBXz/X1qPFXiCWbqDO01tCMS06BUgEvNjntn5B5OED/tB+YhfvPKzyONw
	HA2csOLiAkOhiC8vzoARNHKWYEI9x9yxcNxGAPxibViTuq+KvqWsrQJO0ZbZZtVLbM9/1yXEFyQ
	PJDq+igFUm9p/oemRf8IgAQdtlVQfzGnHL0DL22s4=
X-Received: by 2002:a05:6402:2405:b0:55f:cc6d:29b5 with SMTP id t5-20020a056402240500b0055fcc6d29b5mr52474eda.21.1707757224368;
        Mon, 12 Feb 2024 09:00:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH42HIFL/dxKgR7EyOrBhc7xXCpi26qG+Fua//JDh3CFnZGhulP1ThwFDEDHGR3MncapDV1sg==
X-Received: by 2002:a05:6402:2405:b0:55f:cc6d:29b5 with SMTP id t5-20020a056402240500b0055fcc6d29b5mr52460eda.21.1707757224085;
        Mon, 12 Feb 2024 09:00:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUY6g9lFbfToZ6KmsvUog3OF70TqTeRgGoC22qmpr2jCPKLvbuFVjIq05EHMUe49MvRMFzVuy29Mh6GJIT6KrIM8cjQ7qF2q5tZa1yNTy1oj9j/AInK7bE+csVY6aVl+btLiGQ+1+sPxkGqT/bsGmYuD94elGcJQZvp0Mbu/COh91A4Guz98UtLS/1F6UUbm+YLFurg6FjBkxzzLYFk5j8Y18gMWHLOeKMK
Received: from thinky.redhat.com ([109.183.6.197])
        by smtp.gmail.com with ESMTPSA id 14-20020a0564021f4e00b0056176e95a88sm2620261edz.32.2024.02.12.09.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 09:00:23 -0800 (PST)
From: Andrey Albershteyn <aalbersh@redhat.com>
To: fsverity@lists.linux.dev,
	linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	chandan.babu@oracle.com,
	djwong@kernel.org,
	ebiggers@kernel.org
Cc: Andrey Albershteyn <aalbersh@redhat.com>
Subject: [PATCH v4 24/25] xfs: add fs-verity ioctls
Date: Mon, 12 Feb 2024 17:58:21 +0100
Message-Id: <20240212165821.1901300-25-aalbersh@redhat.com>
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

Add fs-verity ioctls to enable, dump metadata (descriptor and Merkle
tree pages) and obtain file's digest.

Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
---
 fs/xfs/xfs_ioctl.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/fs/xfs/xfs_ioctl.c b/fs/xfs/xfs_ioctl.c
index 048d83acda0a..5d64e11bf056 100644
--- a/fs/xfs/xfs_ioctl.c
+++ b/fs/xfs/xfs_ioctl.c
@@ -43,6 +43,7 @@
 #include <linux/mount.h>
 #include <linux/namei.h>
 #include <linux/fileattr.h>
+#include <linux/fsverity.h>
 
 /*
  * xfs_find_handle maps from userspace xfs_fsop_handlereq structure to
@@ -2174,6 +2175,22 @@ xfs_file_ioctl(
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
2.42.0

