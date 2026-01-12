Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D325D215055
	for <fsverity@lists.linux.dev>; Mon, 12 Jan 2026 14:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768229404; cv=none; b=dZ/aaKJrXRSj5jrW0b/ERFNbRSWhx0ngDY5jnrdNpuleo400jk73B+m2sEnNpqEyByB1CLbyDzsAlhBrWuUDG/ZyO2H7m0nz850Dk4ZcV3K45ej9tVSFkEzASoUZM2sfJ26VhzZ4+YpuXPvbWXuVo9H1I85Lxft1pk0q66y6F5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768229404; c=relaxed/simple;
	bh=QDfZ8MkROd0wJjK7M+RYgL9KXYxxKT+CJ2sFh4GPSIA=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=XCaw3d7WG1bOaGu1H1Y1U7rFVmrDVrMYOP+sVmzsVHKp43Mr/EDt9F2/qy521B+nxEzogHWDA1N5LCu85nxuRp0Xp3irTVwd+cNQ4TCnWWpImY+Kh9c+GUarli6gO42LNyNjJNtguqCQtEvRBBeYh4NELyNAvDIZ4+tvGhbBuZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KoUdArQM; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KoUdArQM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768229402;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4hgQSkKK+wNsFGyx/8yulCRj19FYSipD3tFWb0OgBMQ=;
	b=KoUdArQMWpdQl86fKgGAZFaHR6YHy4z1uXXlT9YQU4FJihw98PpR1MHr6r97R8+vrQRjAG
	reAzIopG9+oIr6TTkFmQXKlNt8FF21BCBrbgALpQVkzsDKet8lbHbuVHoOXSQ0z162Wgwo
	EngdZVNLwyM7kTuZSTn/n+Oea+8B8og=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-592-k5c0sBg-OomQrVOPNdfzcA-1; Mon, 12 Jan 2026 09:50:01 -0500
X-MC-Unique: k5c0sBg-OomQrVOPNdfzcA-1
X-Mimecast-MFC-AGG-ID: k5c0sBg-OomQrVOPNdfzcA_1768229400
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-b8718916c9aso155025366b.0
        for <fsverity@lists.linux.dev>; Mon, 12 Jan 2026 06:50:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768229399; x=1768834199;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4hgQSkKK+wNsFGyx/8yulCRj19FYSipD3tFWb0OgBMQ=;
        b=g3XqC346CV/YdKcOKmhc3CttyJaI7MPssgPcryc1C9rUq8mavuFY0netugXy+Pf4on
         0+7lf3a1Yl33U0wkPGrD9Lj0JXSBcebPd8l2PSAwtcd91bjLRVJWKGK/WZ7NGd1kfqaH
         J7CqQdx8f3uK1HNIiZBTwbKphGKr4UdCH6yMbIns/MUDBd0AKLcGAZuDvs3rxhaPrbGZ
         0Ca5BR7E22XYBrVTFOHF8Iq5A1ba2DmZrlWVxG2L4qVeQFK56KNtivc4/toZMJeR73O5
         OFGoN2Ulaee5yLhMtD2Jcw4ZeOai8BwEMH/NqJDna366KSjjXvaryU8S1HanqXS/g+6i
         AeUw==
X-Gm-Message-State: AOJu0YyiwLNyeg3JYZN8DfPvRUqqZKnNTw271xNKSZxA8DF/H7DUszS2
	1dg6myuG1g6bbF22c4SNMdzWZ0ySos9q0puUfyipzIA2+WCJxczP2VKBYIf/0q4PUg/0UVX2JvF
	9Qnd1trqeYpntBdniRWAau9UuqWfnWARps8c5k6cSUnuy1bEUg64gQyj65q17fBzdUyWL3Nw1Fq
	7DIC7ItB1I1tCkUrM4x0BxMfCgqYa99STraM1igIMXpm0=
X-Gm-Gg: AY/fxX4DeGkh79IIcL1S5QHLTycY356FJ/i074+W9fjHSbyoya7D/0qIx3mp63sZRcN
	tgBevjkzLkDCUQapjUdrNtOi1gbJJYNecEIRGwf2BpTep9l+35geSJ2yy8Q/iFH2HDYdHMzgJp5
	OQPNpyf/qfbWgsET/q8JASAlZQ7uFcS5QQ9hg6snRiH5mMdgNKfKklXiMO8ksrghlvtKKnGnBXQ
	yxNZr8IAeT5CdEJ6eyMLCdC3GYXT+TlBXNcwy15xNziWC4pklOsGnybmtG4R7XAKppcEPOLL2qT
	H498FDfMZnVi0KnXFO7jZts/888wxr8v3/lD1gWrJpP1aDxMfvMLWGpTqBL+bloaHxSq9iWYRGA
	=
X-Received: by 2002:a17:906:ef0c:b0:b73:8b79:a31a with SMTP id a640c23a62f3a-b8444c6c0bdmr1718265566b.16.1768229399277;
        Mon, 12 Jan 2026 06:49:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGKY6lRBB+8CcKc1C5F87kN75SYxXHWrYKMTeyuCLT+7rcJtaMRuQ85TjaYABVcbwCN2IaTLw==
X-Received: by 2002:a17:906:ef0c:b0:b73:8b79:a31a with SMTP id a640c23a62f3a-b8444c6c0bdmr1718262466b.16.1768229398665;
        Mon, 12 Jan 2026 06:49:58 -0800 (PST)
Received: from thinky ([217.30.74.39])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507b8c3f89sm17933541a12.5.2026.01.12.06.49.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 06:49:58 -0800 (PST)
From: Andrey Albershteyn <aalbersh@redhat.com>
X-Google-Original-From: Andrey Albershteyn <aalbersh@kernel.org>
Date: Mon, 12 Jan 2026 15:49:57 +0100
To: fsverity@lists.linux.dev, linux-xfs@vger.kernel.org, 
	ebiggers@kernel.org, linux-fsdevel@vger.kernel.org, aalbersh@kernel.org, 
	aalbersh@redhat.com, djwong@kernel.org
Cc: djwong@kernel.org, david@fromorbit.com, hch@lst.de
Subject: [PATCH v2 2/22] fsverity: expose ensure_fsverity_info()
Message-ID: <unedx6vzej4wyd2ieani54tvvubox2epnl4eghv4caykbzinef@g72j7l2hcufp>
References: <cover.1768229271.patch-series@thinky>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <cover.1768229271.patch-series@thinky>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: locbhganWC-5s_tXyGjPLsgliO_EBnJKlYap14_J6ms_1768229400
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This function will be used by XFS's scrub to force fsverity activation,
therefore, to read fsverity context.

Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org>
---
 fs/verity/open.c         | 4 ++--
 include/linux/fsverity.h | 2 ++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/fs/verity/open.c b/fs/verity/open.c
index 77b1c977af..956ddaffbf 100644
--- a/fs/verity/open.c
+++ b/fs/verity/open.c
@@ -350,7 +350,7 @@
 	return 0;
 }
 
-static int ensure_verity_info(struct inode *inode)
+int fsverity_ensure_verity_info(struct inode *inode)
 {
 	struct fsverity_info *vi = fsverity_get_info(inode);
 	struct fsverity_descriptor *desc;
@@ -380,7 +380,7 @@
 {
 	if (filp->f_mode & FMODE_WRITE)
 		return -EPERM;
-	return ensure_verity_info(inode);
+	return fsverity_ensure_verity_info(inode);
 }
 EXPORT_SYMBOL_GPL(__fsverity_file_open);
 
diff --git a/include/linux/fsverity.h b/include/linux/fsverity.h
index b75e232890..16a6e51705 100644
--- a/include/linux/fsverity.h
+++ b/include/linux/fsverity.h
@@ -196,6 +196,8 @@
 int __fsverity_prepare_setattr(struct dentry *dentry, struct iattr *attr);
 void __fsverity_cleanup_inode(struct inode *inode);
 
+int fsverity_ensure_verity_info(struct inode *inode);
+
 /**
  * fsverity_cleanup_inode() - free the inode's verity info, if present
  * @inode: an inode being evicted

-- 
- Andrey

