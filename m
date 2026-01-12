Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD4F8883F
	for <fsverity@lists.linux.dev>; Mon, 12 Jan 2026 14:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768229553; cv=none; b=UdgjCa01cbGA+CKX1P9HtsOsmOQGWNgTrvGxcpPE1k6KySyrG/xQ1137VH2B1hXVxGmfc0qk65mXcXU8JkQJTMkRuxZ4E4O9CZ7yBNZCA5PkwtdVGFEq6PhEGMGuh0LMcnYg1cu3Taxhy2kdQZGktHMWMCU15l0xvUNa7e4GlD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768229553; c=relaxed/simple;
	bh=4oN3KsYgjU1gziBXcCV2JxaplDe0MjbcejD0zRksvRk=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=Ra3PD9ro0YHgi+lw37V8keCoAkHig9A35NbyfvqsPHbX0f1k+dfMOPc4V1V1g3dy0MWEecTkcjHAoT2mDdXFHVmkbSE0OJ88PcO2FFF+yincgv7xTB3POaikgr1FQPzzSpDi5A8OBNL6gDJxP+ccvRACA4YMy4E66HFF24DfS8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=M1wQsDpe; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="M1wQsDpe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768229550;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=27c0RwsiUqQbIRsQgbUzvN/pOWTjcdmLaKAYvxOvoHg=;
	b=M1wQsDpecC5+87Crkmj+M+vS8z6H+QPszXKr0/74Gp4IExtWbSfPCIHtcFGEvWWYlUntmV
	h7mAPR1tQGDn93JfrtmGqbKa53mJNJFEU8s9gXpMsBneB4N0FUyEj7rus7Nr2U72g27YhG
	xn9tTLOIuLeJ3EjfhWcXLr5rZ2CNChw=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-624-tNiYtgevN02D7GsUIbMl7w-1; Mon, 12 Jan 2026 09:52:30 -0500
X-MC-Unique: tNiYtgevN02D7GsUIbMl7w-1
X-Mimecast-MFC-AGG-ID: tNiYtgevN02D7GsUIbMl7w_1768229549
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-64d589a5799so10478014a12.1
        for <fsverity@lists.linux.dev>; Mon, 12 Jan 2026 06:52:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768229548; x=1768834348;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=27c0RwsiUqQbIRsQgbUzvN/pOWTjcdmLaKAYvxOvoHg=;
        b=xVaAm3OoDnC35sloVX37vTTQy6g3dM6nDUetXQsjoLE2dNzoG8eqZL/0Zsx9eCDxWE
         SKBMFnnaIMLSdio3C/2aLuKydQxYCEgRLnK1WF0IzMQWTb8pzFUtZog/Ofwrvk8rVx4T
         x4I/AuEN8nJsh2ZXN7s1vmY4BFpEn9tE/ghIV5cY81HteOLviJy0uaNYImXWQwxS6JQi
         PS0Stb7S5xazZi4Pml+UiuKnoAGJAT7vOz0oos4CCEZ2NBGTIaFlXCAgB3hHCUhVH7cq
         UeM/KijzAmIck7ihf8q5gKPTQHEg7ILgahDQPk8vTjQMb4OBljDwOvnFmJTT5bTqNTM8
         bGSA==
X-Gm-Message-State: AOJu0YwhGYrmpKRbtjjI5oP5ReG3dbL6nDIlIVP1NWGFU0J4Lreie7su
	TDUrG9FzcgWpzxzznnGXwBON5mO0HopLTShKBegdq+epQZI2ZJMBewLavgk7fLMFq3CsAX+Ndwn
	h9Zn/NJ8SXyVVmHL2kYk13E9zY2vfyXIxhNOL6MlPPbK8Z8wC+91lnoU9MKFHGS20SV1xbvAsnJ
	kYEUOxvIzEyUZVMe7BEaV5l1Elv8DjdR3N0zv8nFJKXf4=
X-Gm-Gg: AY/fxX7iADbzqqLYuz+/rFtBLSdMYtNbwR14F4gsInmDya8eW1mAypxC+++fo16PCxH
	LBe0hMa5iFbEb27Iw7bt/nltsihVJNwDNtg8zpKgo9D0nXuq0ESxWqtQUbqxow4OGQCSvtAU8Of
	5DTIA0GNLzDQgU3nnyhOfbDL+/5OR99NiFikWOp1A083+17Gn4gBhpqtQK/isW2imbzGEDWIPi8
	3lAV4CIBw4hS7QGyuNIp+LK3SLOFOTGyjoW1DeOPLySMXxKlfAx/oA74ceUyKkB1tlXOYWeUU2u
	os0uX1s2S5TY8mqQGInu1zL1GIS1PBRxQTObDluUOxcWRHxRwSUjX90rsBiDRGiw4Iyoz+usuW0
	=
X-Received: by 2002:a17:906:ef0d:b0:b76:7f64:77a5 with SMTP id a640c23a62f3a-b8444f21c49mr1822211966b.20.1768229548403;
        Mon, 12 Jan 2026 06:52:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHdX+T72PLi+rN64BMH3u11dTZ5cmvdk1ssM9FQvlRjQjwZTrPkhU4nI7/e1E+OEM+96ED/HA==
X-Received: by 2002:a17:906:ef0d:b0:b76:7f64:77a5 with SMTP id a640c23a62f3a-b8444f21c49mr1822207566b.20.1768229547833;
        Mon, 12 Jan 2026 06:52:27 -0800 (PST)
Received: from thinky ([217.30.74.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b870bcd342bsm475411366b.56.2026.01.12.06.52.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 06:52:27 -0800 (PST)
From: Andrey Albershteyn <aalbersh@redhat.com>
X-Google-Original-From: Andrey Albershteyn <aalbersh@kernel.org>
Date: Mon, 12 Jan 2026 15:52:26 +0100
To: fsverity@lists.linux.dev, linux-xfs@vger.kernel.org, 
	ebiggers@kernel.org, linux-fsdevel@vger.kernel.org, aalbersh@kernel.org, 
	aalbersh@redhat.com, djwong@kernel.org
Cc: djwong@kernel.org, david@fromorbit.com, hch@lst.de
Subject: [PATCH v2 22/22] xfs: enable ro-compat fs-verity flag
Message-ID: <t2mwgqd6j3lknok5yexswvdba6nbji24efthhcqhvtqirzeahf@wdlnxaoaupam>
References: <cover.1768229271.patch-series@thinky>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <cover.1768229271.patch-series@thinky>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 53taKlGORMkQ8VExwa3StmG83qu6CHQJ5RucRvWk46A_1768229549
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Finalize fs-verity integration in XFS by making kernel fs-verity
aware with ro-compat flag.

Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org>
Reviewed-by: Darrick J. Wong <djwong@kernel.org>
[djwong: add spaces]
Signed-off-by: Darrick J. Wong <djwong@kernel.org>
---
 fs/xfs/libxfs/xfs_format.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/fs/xfs/libxfs/xfs_format.h b/fs/xfs/libxfs/xfs_format.h
index d67b404964..f5e43909f0 100644
--- a/fs/xfs/libxfs/xfs_format.h
+++ b/fs/xfs/libxfs/xfs_format.h
@@ -378,8 +378,9 @@
 #define XFS_SB_FEAT_RO_COMPAT_ALL \
 		(XFS_SB_FEAT_RO_COMPAT_FINOBT | \
 		 XFS_SB_FEAT_RO_COMPAT_RMAPBT | \
-		 XFS_SB_FEAT_RO_COMPAT_REFLINK| \
-		 XFS_SB_FEAT_RO_COMPAT_INOBTCNT)
+		 XFS_SB_FEAT_RO_COMPAT_REFLINK | \
+		 XFS_SB_FEAT_RO_COMPAT_INOBTCNT | \
+		 XFS_SB_FEAT_RO_COMPAT_VERITY)
 #define XFS_SB_FEAT_RO_COMPAT_UNKNOWN	~XFS_SB_FEAT_RO_COMPAT_ALL
 static inline bool
 xfs_sb_has_ro_compat_feature(

-- 
- Andrey

