Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B13D92561AA
	for <fsverity@lists.linux.dev>; Mon, 12 Jan 2026 14:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768229478; cv=none; b=vBe3SDvG7cqNBbzlhiGwOXU9BFiwiQoA+rc9V5d7cu6O9d6CyoBf7IOr49ynZg8h8DPebAlani8B+kK8yvlAfaV1YHV4BwiOkNVBuRTup6Mr0KPmmil4RUUOEXFQYzlSRrDwYXkbSiWqUaK3cYqmnVmZo+nKAb8NVtlG2I7IYWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768229478; c=relaxed/simple;
	bh=Ui6S9HS3D72Dvt607rkAeRvO/cjZeK06ykAfQjo8x1Q=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=CFjvGOP9q6/T/Tj0n47BTkqtoGwUihu7WI+r2kLTc0g7ZjWdAbao1ciqfLox1VitxA2gyEHbxQRgL56YV6z1ka0uYXLU+uekvssBQt+bSqEk2aS6jUC/K7otiCQs1eYzdksbFCdlzKi0ZCg8ClLbRdDwAt3mgeLFY/Q0hrVgMpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VO+K1/RO; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VO+K1/RO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768229475;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GkYVW08k0HM8Mu7wCr7O7tI/HJOedcd0CF4Vxrv4g90=;
	b=VO+K1/ROl+MWUQWiNn/g/uL6NvYeCFxyL5hAHCBF+sjllVoOewv4JjqQnz6GKcojUjrUHx
	hzsoY8Sk4lh9lJV8vI7weC/va8mCIUIxxJWzz12GIJJWwFtDD4L5JYq4Ifm8mzkZPDV696
	uaqGDmnf+y/JfcBmS7x9WHSi9TZtGXw=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-66-tbw5X4rvO0iGXKHxz_29PA-1; Mon, 12 Jan 2026 09:51:14 -0500
X-MC-Unique: tbw5X4rvO0iGXKHxz_29PA-1
X-Mimecast-MFC-AGG-ID: tbw5X4rvO0iGXKHxz_29PA_1768229473
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-b8395cae8c8so660846366b.3
        for <fsverity@lists.linux.dev>; Mon, 12 Jan 2026 06:51:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768229472; x=1768834272;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GkYVW08k0HM8Mu7wCr7O7tI/HJOedcd0CF4Vxrv4g90=;
        b=E8oqxVlzj5HDZAtNknded6lOes4NhOEcpvJvcjIExx66lUGFRWWBMHaQflnViqNfiM
         NqA9L4JiTIOz6lqxcDNPPjdx/ysbYVUW8YVcRLaox0c7A0ofB2wLcyVBpKFGKuNo4OOY
         BRXt++aObZPeOpcEdvwo40/tIdH09G2fvZJOagGe6R6GgMOoR9QFYv7JfqI/Nkbpi7Lp
         w+gIJsOoJNVexCBnrxUIQN822EP0mzVPccET9ZHMdhH6B3KVMLT4nWWlFsgpAJCGkG1f
         p49hxFcfa4WS5fWMM0kVPFYn1XVLw5YOEbHgXAWcXdahk8hhzDXkEjCyHC6hTSy6/mNs
         ajvA==
X-Gm-Message-State: AOJu0Yy8OmbHXlbO0V5xUrVpUwd1ciRvfOUYFR8DZWMCEW76wd8xD6Pt
	Xg0Xdd2CoahPMzgNMGLQu8PHf2EoCVsZIvnbXpTmkBBlLh5EjvFOm6Afi7m7VxYWuyKEXPp/6am
	rmBGS7Q8SUauzp+BWFXI7uWD9AYB/ev/rXjOZlhr95z/Yv1AkcdOwFpCvsK0Gt5ndDMSeok8Ngy
	OlGUV8YTvF7hWYMKddmS8Wyp4c2O551+ar6OQp9jSjkJY=
X-Gm-Gg: AY/fxX4/unr521KTVOaOIYtEZnXt7Zq27/TcPXqSX58mOuOqftYXVOZe5pe3lenpkLo
	fpypJpmEOt915BD5SnQvtEH72DnFbkToC3YxSLGhgYina4gScxdxtV+4Wga0wSXWp9mjfsJGe0N
	CubA7rp8etal3HNEbN85O7f9rCavB8H4fkpHt4ATvS+q98HPKUPL3qhH0XgGG/05Qk/q7rx8E/I
	ruUBAwJ/GzRBunmyAhGh2gDrUsEIk7huOgJJBO8wXKf9Ke5t4zEK6L9KEygGeNjhWw8je+p29n9
	/eqt3bvdU2dP4JvVNas3IdEhJy0smNji1ry+eI621qOddMOXnSmZy8tiqE6WNrn+aWXXSD+pRq8
	=
X-Received: by 2002:a17:907:3c86:b0:b7c:fe7c:e383 with SMTP id a640c23a62f3a-b8444f2399cmr1908211766b.22.1768229472452;
        Mon, 12 Jan 2026 06:51:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFQ1ZUBBBfOOPZZu6PAvc2nvhedv6mbNuX/r+QasAtk1f3qnZVL9hQtJxfwvPp4FpofexbIuw==
X-Received: by 2002:a17:907:3c86:b0:b7c:fe7c:e383 with SMTP id a640c23a62f3a-b8444f2399cmr1908208166b.22.1768229471737;
        Mon, 12 Jan 2026 06:51:11 -0800 (PST)
Received: from thinky ([217.30.74.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a4d1c61sm1897676066b.35.2026.01.12.06.51.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 06:51:11 -0800 (PST)
From: Andrey Albershteyn <aalbersh@redhat.com>
X-Google-Original-From: Andrey Albershteyn <aalbersh@kernel.org>
Date: Mon, 12 Jan 2026 15:51:10 +0100
To: fsverity@lists.linux.dev, linux-xfs@vger.kernel.org, 
	ebiggers@kernel.org, linux-fsdevel@vger.kernel.org, aalbersh@kernel.org, 
	aalbersh@redhat.com, djwong@kernel.org
Cc: djwong@kernel.org, david@fromorbit.com, hch@lst.de
Subject: [PATCH v2 11/22] xfs: add verity info pointer to xfs inode
Message-ID: <7s5yzeey3dmnqwz4wkdjp4dwz2bi33c75aiqjjglfdpeh6o656@i32x5x3xfilp>
References: <cover.1768229271.patch-series@thinky>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <cover.1768229271.patch-series@thinky>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: chS9-UdiIJpoZ6qzXLFiWYt9ZgfBUMP8oJ560jRtjsw_1768229473
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Add the fsverity_info pointer into the filesystem-specific part of the
inode by adding the field xfs_inode->i_verity_info and configuring
fsverity_operations::inode_info_offs accordingly.

Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org>
---
 fs/xfs/xfs_icache.c | 3 +++
 fs/xfs/xfs_inode.h  | 5 +++++
 2 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/fs/xfs/xfs_icache.c b/fs/xfs/xfs_icache.c
index 23a920437f..872785c68a 100644
--- a/fs/xfs/xfs_icache.c
+++ b/fs/xfs/xfs_icache.c
@@ -130,6 +130,9 @@
 	spin_lock_init(&ip->i_ioend_lock);
 	ip->i_next_unlinked = NULLAGINO;
 	ip->i_prev_unlinked = 0;
+#ifdef CONFIG_FS_VERITY
+	ip->i_verity_info = NULL;
+#endif
 
 	return ip;
 }
diff --git a/fs/xfs/xfs_inode.h b/fs/xfs/xfs_inode.h
index bd6d335571..f149cb1eb5 100644
--- a/fs/xfs/xfs_inode.h
+++ b/fs/xfs/xfs_inode.h
@@ -9,6 +9,7 @@
 #include "xfs_inode_buf.h"
 #include "xfs_inode_fork.h"
 #include "xfs_inode_util.h"
+#include <linux/fsverity.h>
 
 /*
  * Kernel only inode definitions
@@ -99,6 +100,10 @@
 	spinlock_t		i_ioend_lock;
 	struct work_struct	i_ioend_work;
 	struct list_head	i_ioend_list;
+
+#ifdef CONFIG_FS_VERITY
+	struct fsverity_info *i_verity_info;
+#endif
 } xfs_inode_t;
 
 static inline bool xfs_inode_on_unlinked_list(const struct xfs_inode *ip)

-- 
- Andrey

