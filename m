Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A202BE7DB
	for <fsverity@lists.linux.dev>; Mon, 12 Jan 2026 14:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768229498; cv=none; b=huQxf17cRpBB0PD4PRRwwkufYU9xRFqyM+HUu3QXxhPSStyl7xtsUZ+tpFvwbTdJyI/x1dJ84CSg6VMA54IyQ+Q/doWCvRB7utMLNNbuM2BjsfyyvotMsYKjj/1Q6dh+Ci4BQH58ov7cjd7cozp+mr4UiVY68l16y7SJXHclATs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768229498; c=relaxed/simple;
	bh=JPjcCt7QWTf38nAptPhawsXuiMG7Azz0b4ENiSKcovw=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=e143Y7+ienQFK3b0NUtOmdqQKyHuDI3u8QbC8LjBR3QEWduQKckSm8VKoNlcb4Z3qZLPMwuDxGAfJbAnBCH6f3YCetHJ9X0QMiu/1ZeqUDpfulsujAdT2HKy3hn3icYSfp5D3Aw+lkTzescZxxpOAZ0wuWFM0v+AdquiDZtm+lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ez/mkTvR; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ez/mkTvR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768229495;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MQFyKAmxkxq8BXZgaDmWovpGdqDXxz9LIVm+AcEZ+2Q=;
	b=ez/mkTvR11qr9RMN7hh6gmj/MmEwhEgZDo81zR9/Fy/OyxDFMCtZw62dqvRvVj3HaXQMiv
	bFXqMK0FwzNpO5dluLDx8L5trFcrFFYOKYpC8wwjaZNqHCQgy5IvMA/zdt1C3IJQAJ4Y71
	2d1aRMAXJb3JH/coWS+0jyeXyaZ65Ww=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-88-zM8xK4DeNHqI7dTggheo-A-1; Mon, 12 Jan 2026 09:51:34 -0500
X-MC-Unique: zM8xK4DeNHqI7dTggheo-A-1
X-Mimecast-MFC-AGG-ID: zM8xK4DeNHqI7dTggheo-A_1768229493
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-b871d7ad66cso127994166b.1
        for <fsverity@lists.linux.dev>; Mon, 12 Jan 2026 06:51:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768229493; x=1768834293;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MQFyKAmxkxq8BXZgaDmWovpGdqDXxz9LIVm+AcEZ+2Q=;
        b=UEpmixkN/5WiHqYbuQWO73hQJbVWBGq80eBUMq6qjKaD9jC/YVNbZyx425qsNsnl/0
         gSdOEe3fKuIAc+dT4ONw7Snh4aTe2QlKtbKxWbM/is4biLJblh1+aWGKSjJw8DoEQaFL
         QPUN1NbaMhtL0tHnjrgQP/5K+eBDaR2fCMsZpVYs6UkiBxTQHH4gy4XjGylKZd+w7MmV
         XQFlJLYNpgZkhrx9KW4Yxr4NBSpFP1WGsIjSu6njHB4cJxV/g00+3VF4ftUoR8FIitqW
         pK7ATLYW5C9/SkhKhFUw7TiFS9NcCfT63aFzKE1IRZvd4IR2m2/BSoxwx0Xeh1hfaJg4
         feCA==
X-Gm-Message-State: AOJu0Yw3+BZ5H3WsyYB4tokV2hSSx6zzgZJ4/yiDBmxDQMxzrNDA2H0I
	f6xmhfHFXy+sF3vIHCP8elk5YNrmsQ1lkec/MEKcriyBTbigM8qhUSaiH9vKnEnrMMXTsZh0Dyq
	rZBZR/bfDPf3RLQ/6fzfXWLzopmbHtfTmIzpx/w6pGfe0yz0rwVMZKl7snDhkZA7nfOKjGFzowb
	eLNnvaIJKW4CbkrsYjgRyn+IW6YdwvtQQWFcSHsik8rcQ=
X-Gm-Gg: AY/fxX7VhCGeKLRpifzTghhYHKkGt5FnAxytAkgm5otrqopCIpu6Eb4HG/NaEjUdT08
	4krEe+imKJx1BHoBs3FjL/n8JknnjFFoYe3I7vWzO12J1aY+pMGueP6ROjLr5nkCk1VlJtM99Tn
	tb73kmq5H9m/5PgFb7oNu7c69HCb5dGWif/q05f5O5MDsc5QzfDXKkfuvzKkRxHDJh5cPStW6mO
	z+0wTQ0QVADeH4mVcr3TWohY7rj+LbwbRQvYkXFvTLP5mVhVejJfa+wT8rAOGsmYS7Y8yfeRtv5
	piNqZaj8q1wHQV2oDjdrGQ7GDcJ4nGIiX7ipIvl1s8MxcdqQ5dUln8z4UbtkRRuq2AD4aVr1khM
	=
X-Received: by 2002:a17:906:8a65:b0:b87:8c1:1ea5 with SMTP id a640c23a62f3a-b8708c120femr408105966b.5.1768229492563;
        Mon, 12 Jan 2026 06:51:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFT+lJr2mupsGTVPSmnIPthPNsIkn3bEkceKZ9KStsHmzA6ycghaOXhi8PQ2VxPhst05XGo9w==
X-Received: by 2002:a17:906:8a65:b0:b87:8c1:1ea5 with SMTP id a640c23a62f3a-b8708c120femr408102466b.5.1768229491989;
        Mon, 12 Jan 2026 06:51:31 -0800 (PST)
Received: from thinky ([217.30.74.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b871b5e610csm306104766b.65.2026.01.12.06.51.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 06:51:31 -0800 (PST)
From: Andrey Albershteyn <aalbersh@redhat.com>
X-Google-Original-From: Andrey Albershteyn <aalbersh@kernel.org>
Date: Mon, 12 Jan 2026 15:51:30 +0100
To: fsverity@lists.linux.dev, linux-xfs@vger.kernel.org, 
	ebiggers@kernel.org, linux-fsdevel@vger.kernel.org, aalbersh@kernel.org, 
	aalbersh@redhat.com, djwong@kernel.org
Cc: djwong@kernel.org, david@fromorbit.com, hch@lst.de
Subject: [PATCH v2 14/22] xfs: disable preallocations for fsverity Merkle
 tree writes
Message-ID: <h5rtbef7rnkc7kooimncgxjefge7bybzujkxy3yrwbfkaiqiya@4n64b7spvy46>
References: <cover.1768229271.patch-series@thinky>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <cover.1768229271.patch-series@thinky>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ysLVYUVjZcnR1A_rP8uxglB7MQZ34QPEoelCbWGLq4c_1768229493
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

While writing Merkle tree, file is read-only and there's no further
writes except Merkle tree building. The file is truncated beforehand to
remove any preallocated extents.

The Merkle tree is the only data XFS will write. As we don't want XFS to
truncate file after we done writing, let's also skip truncation on
fsverity files. Therefore, we also need to disable preallocations while
writing merkle tree as we don't want any unused extents past the tree.

Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org>
---
 fs/xfs/xfs_iomap.c | 28 +++++++++++++++++++++++++---
 1 file changed, 25 insertions(+), 3 deletions(-)

diff --git a/fs/xfs/xfs_iomap.c b/fs/xfs/xfs_iomap.c
index 04f39ea158..61aab5617f 100644
--- a/fs/xfs/xfs_iomap.c
+++ b/fs/xfs/xfs_iomap.c
@@ -1938,7 +1938,9 @@
 		 * Determine the initial size of the preallocation.
 		 * We clean up any extra preallocation when the file is closed.
 		 */
-		if (xfs_has_allocsize(mp))
+		if (xfs_iflags_test(ip, XFS_VERITY_CONSTRUCTION))
+			prealloc_blocks = 0;
+		else if (xfs_has_allocsize(mp))
 			prealloc_blocks = mp->m_allocsize_blocks;
 		else if (allocfork == XFS_DATA_FORK)
 			prealloc_blocks = xfs_iomap_prealloc_size(ip, allocfork,
@@ -2065,6 +2067,13 @@
 	if (flags & IOMAP_FAULT)
 		return 0;
 
+	/*
+	 * While writing Merkle tree to disk we would not have any other
+	 * delayed allocations
+	 */
+	if (xfs_iflags_test(XFS_I(inode), XFS_VERITY_CONSTRUCTION))
+		return 0;
+
 	/* Nothing to do if we've written the entire delalloc extent */
 	start_byte = iomap_last_written_block(inode, offset, written);
 	end_byte = round_up(offset + length, i_blocksize(inode));
@@ -2109,6 +2118,7 @@
 	bool			shared = false;
 	unsigned int		lockmode = XFS_ILOCK_SHARED;
 	u64			seq;
+	int			iomap_flags;
 
 	ASSERT(!(flags & (IOMAP_WRITE | IOMAP_ZERO)));
 
@@ -2128,8 +2138,20 @@
 	if (error)
 		return error;
 	trace_xfs_iomap_found(ip, offset, length, XFS_DATA_FORK, &imap);
-	return xfs_bmbt_to_iomap(ip, iomap, &imap, flags,
-				 shared ? IOMAP_F_SHARED : 0, seq);
+	iomap_flags = shared ? IOMAP_F_SHARED : 0;
+
+	/*
+	 * We can not use fsverity_active() here. fsverity_active() checks for
+	 * verity info attached to inode. This info is based on data from a
+	 * verity descriptor. But to read verity descriptor we need to go
+	 * through read iomap path (this function). So, when descriptor is read
+	 * we will not set IOMAP_F_BEYOND_EOF and descriptor page will be empty
+	 * (post EOF hole).
+	 */
+	if ((offset >= XFS_FSVERITY_REGION_START) && IS_VERITY(inode))
+		iomap_flags |= IOMAP_F_BEYOND_EOF;
+
+	return xfs_bmbt_to_iomap(ip, iomap, &imap, flags, iomap_flags, seq);
 }
 
 const struct iomap_ops xfs_read_iomap_ops = {

-- 
- Andrey

