Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B0CC2701CB
	for <fsverity@lists.linux.dev>; Mon, 12 Jan 2026 14:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768229527; cv=none; b=phrnFDyn1Z0XdFfd3PnDQAD/Je+9dyDoOyHOZQuVj2lKgS00F3rdVs8f9OhHtnTeO6bF+ASPYlZueAg38IAqOlp8ihGMxsvLwrzWIG0BDFCj7raouGvB1aZ2DldG8t/1xaj98DJo9eWZs5Oqkk8C8DL/8xJ8YcbYrZ8JKzmDF74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768229527; c=relaxed/simple;
	bh=w1I6PwvwzLsgyGpHJFKwtxkJvjQ0CES+ZFjhSTB9vDs=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=kkceGevVPOLhcflp9SpRV8evFCEf+zv9wx8eVShLpn9nxQn+yQvU5dYMJg9muC7yYUkUqIxDuiPSrg8rgplB8prks0pFPXbODJv4fJI5LwZI/BL6oFpYbGFtoLau2pNOSby0CjR4tKBgFhlwK32Ku05m/I6I08mD0nYQy12n1Uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=A6p6p6Ik; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="A6p6p6Ik"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768229525;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rxT4TpIEnXfcR0i9Em+M35vPC8aSThrR47NkUhIyHDQ=;
	b=A6p6p6Ik4CxdcAwxpV1hVH0Hza/7+UQK8XRYDTIOsnclIu/iElUJUzfx3iAEnFllcLv+oS
	O9LMwmwdqa0PwGrnk/KAtTOjJTbXwOujzNMNjgG/F2OUuwOCbFkrXsEKy0PWJljj4H55Tw
	yIGz6Hnn3vA3bLn54XakZ93jjOZzJwQ=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-248-0sJ-wqncPDGMI3_wgqDLGg-1; Mon, 12 Jan 2026 09:52:03 -0500
X-MC-Unique: 0sJ-wqncPDGMI3_wgqDLGg-1
X-Mimecast-MFC-AGG-ID: 0sJ-wqncPDGMI3_wgqDLGg_1768229523
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-64d589a5799so10477401a12.1
        for <fsverity@lists.linux.dev>; Mon, 12 Jan 2026 06:52:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768229522; x=1768834322;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rxT4TpIEnXfcR0i9Em+M35vPC8aSThrR47NkUhIyHDQ=;
        b=Hhq6TiXgO8Ni8IAqAzdTCpQRfKbkbpABcPPlD43PJeiZVUyC3qe7yTP7pSr6qRKRTr
         664oGQXlaE7DJlcdU7B7GXQ4MgcCgCNtRiOedPXooDWWRzXqnfUqL5WqpXpwFYEy8Yrp
         mslcc0PazGGMyEHmB+FDAy82MFCQ4p2NiLXrSiSX6wwiuI93aC1pELWIznb7gXL3C/+v
         l7DII/rN3Bzruk2l/unYf1mPqPg+w0NNkmZkTegKyrB1VVkPVBSt738dtEcL5ICEEBGs
         HGseyiUcHJnJCKC+BtccirApMIG30c0xHC7UBhpFVgS4d3bHMuJygcNhbsRdaT/B8923
         dVuA==
X-Gm-Message-State: AOJu0Ywc5Opk7fcEfx/K3TeLTUry6rrAV7NkgSAHHwAludhl2RpqmxhB
	oCqyHYcsXujduiIwqi/0aoCmya+pOUDQmUJd9hH1RLcuKA4OEzK5mBfdYto3E3OvejmyB3ihtus
	/1zmusTfux0TF06GVAMbU4bDf5yqOfS+lPpZKZn07h9pR0Zbyxd53rjFIT5WWBZkQO25iPTPfgm
	i056HppvHY/i7EeUEoJwCrcNEl5veWPbGJ6b/4tMrk95U=
X-Gm-Gg: AY/fxX7+dUvvuAeySf3BY+nLqyoFTGkpHK8//u+3p2egEV/vbSjKAlHi/JU5JdbqJVv
	KLq8xXxSIKBKR6tkD2un9w8XwCUvrAp6ZqfMKWOg0neU/V2ZZbP+FPa1m76IjQnJAtR8p0Q6kAt
	F+XN3gNk483JhlzJbUU/eXnbXlqDe9aZM9XvFOCikW40bUfSh9vj5Q04hlAc/ZLBHuK2bdD6qqv
	cgVN5H1F8MZaDubudWT+jXm/4Sek/D0A0359SPKbr8im6bPrExgKz7gXxiBt2Et0R9GDe3vxEqg
	S90pO+Kotb+BzyP11bN1zIWr7y1OhS9k+dLUhmPcOKQrICT4VsNJyMT/RwgN43n8XNScJenJ
X-Received: by 2002:a05:6402:4309:b0:64d:65d:2315 with SMTP id 4fb4d7f45d1cf-65097e8e3b3mr17114488a12.30.1768229522171;
        Mon, 12 Jan 2026 06:52:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF5HedpXYEVDgdb3na03m1dE9g5d9SGRCXlO36Bm8gCzP1H5KKM5v9HNGEWEFxIDCR45EpR/w==
X-Received: by 2002:a05:6402:4309:b0:64d:65d:2315 with SMTP id 4fb4d7f45d1cf-65097e8e3b3mr17114452a12.30.1768229521690;
        Mon, 12 Jan 2026 06:52:01 -0800 (PST)
Received: from thinky ([217.30.74.39])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507b8c4048sm18254819a12.2.2026.01.12.06.52.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 06:52:01 -0800 (PST)
From: "Darrick J. Wong" <aalbersh@redhat.com>
X-Google-Original-From: "Darrick J. Wong" <djwong@kernel.org>
Date: Mon, 12 Jan 2026 15:52:00 +0100
To: fsverity@lists.linux.dev, linux-xfs@vger.kernel.org, 
	ebiggers@kernel.org, linux-fsdevel@vger.kernel.org, aalbersh@kernel.org, 
	aalbersh@redhat.com, djwong@kernel.org
Cc: djwong@kernel.org, david@fromorbit.com, hch@lst.de
Subject: [PATCH v2 18/22] xfs: advertise fs-verity being available on
 filesystem
Message-ID: <n54xljh4z2vdvxsifux2hue2hnjixlw6jtq3azudreah3lt4de@en2vz44o4vz7>
References: <cover.1768229271.patch-series@thinky>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <cover.1768229271.patch-series@thinky>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: oWe5-Irls-V1RdnyR1nr9H6iV0ELQPhg8-424wcFlXU_1768229523
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Advertise that this filesystem supports fsverity.

Signed-off-by: Darrick J. Wong <djwong@kernel.org>
Reviewed-by: Andrey Albershteyn <aalbersh@redhat.com>
Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org>
---
 fs/xfs/libxfs/xfs_fs.h | 1 +
 fs/xfs/libxfs/xfs_sb.c | 2 ++
 2 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/fs/xfs/libxfs/xfs_fs.h b/fs/xfs/libxfs/xfs_fs.h
index b73458a7c2..3db9beb579 100644
--- a/fs/xfs/libxfs/xfs_fs.h
+++ b/fs/xfs/libxfs/xfs_fs.h
@@ -250,6 +250,7 @@
 #define XFS_FSOP_GEOM_FLAGS_PARENT	(1 << 25) /* linux parent pointers */
 #define XFS_FSOP_GEOM_FLAGS_METADIR	(1 << 26) /* metadata directories */
 #define XFS_FSOP_GEOM_FLAGS_ZONED	(1 << 27) /* zoned rt device */
+#define XFS_FSOP_GEOM_FLAGS_VERITY	(1 << 28) /* fs-verity */
 
 /*
  * Minimum and maximum sizes need for growth checks.
diff --git a/fs/xfs/libxfs/xfs_sb.c b/fs/xfs/libxfs/xfs_sb.c
index 744bd8480b..fe400bffa5 100644
--- a/fs/xfs/libxfs/xfs_sb.c
+++ b/fs/xfs/libxfs/xfs_sb.c
@@ -1587,6 +1587,8 @@
 		geo->flags |= XFS_FSOP_GEOM_FLAGS_METADIR;
 	if (xfs_has_zoned(mp))
 		geo->flags |= XFS_FSOP_GEOM_FLAGS_ZONED;
+	if (xfs_has_verity(mp))
+		geo->flags |= XFS_FSOP_GEOM_FLAGS_VERITY;
 	geo->rtsectsize = sbp->sb_blocksize;
 	geo->dirblocksize = xfs_dir2_dirblock_bytes(sbp);
 

-- 
- Andrey

