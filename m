Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BA9D3E464
	for <fsverity@lists.linux.dev>; Mon, 12 Feb 2024 17:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707757222; cv=none; b=qZqlMePcZJQORyQ24+bTYnjWrvWiNWfl5Np/5zqG4xOCMPJy+08YON0hUWHCSNIkbA/YWfR7OCxe9vYC4NKehQSCmOpY5w1Q4j3tll4Q0rCsmbqmotAGqk+OWMMefX5wdyZOP1rIiRhJ/pXInKGQ+g3AYbFA7AGk7b8RKIvfaz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707757222; c=relaxed/simple;
	bh=uRpqcFHztW6mv8ys9x1B06hDBwaQZHF8LlWlh4KeXNk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=saRuZUXGHKsCcukDySpb5ZEgAsMC0H4Pr6tRtt1itn8TJNILCe/pjfxGMcG5hEqxZZ9p8a/O9P45qWQycYV48g1zBcQ/Tcs3yacnA9pnNWxCssqkzP+mHeUizgaMhV5W9CsHLwCpvJdLf6EvXop35Jd4p+0CzoE4Q9B/Tfo8y+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OPbr9eVJ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OPbr9eVJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707757220;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K4IPa0qcdOfoZGhIk7o1SuO7zkizJ6265PJwpzaMwSg=;
	b=OPbr9eVJIRCra1k6wEgVqjv831ZNQddpSPxnvRZ4u6rScJOqi1skcXgncn7XjazXMjiQL4
	0c7UNB1pIMD2GS1OdXK/waSFOa1Dw4/xssQThVBtTLkTfpCPPvMQU/S5uJlgooU5+1IO7Z
	NQZX6o5CYHuYB/MsF5EV43Xd+94Jsok=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-3-7Hm1OvLwOw-p_gPTvJbsuA-1; Mon, 12 Feb 2024 12:00:18 -0500
X-MC-Unique: 7Hm1OvLwOw-p_gPTvJbsuA-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-5597da35ebbso2421005a12.2
        for <fsverity@lists.linux.dev>; Mon, 12 Feb 2024 09:00:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707757217; x=1708362017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K4IPa0qcdOfoZGhIk7o1SuO7zkizJ6265PJwpzaMwSg=;
        b=e4IpA7PFBpXLEC1AckVtV7mBLbb3q4gHifXdzWEGSBYs1owUxrHM+Gs9BrMR6z9FFZ
         ErD6obOLi/eRqAgJn0bbsuzen7Dg36FVFQ1W2+P84RyhKX0J49x6s6NkJDNX8ZGMydKi
         4soAsh+Yv7qz/LCgZQeAQ9kMvKhQt+62lOLuQ+rcqOLokp2X9525fJL6SmBUv2bx665O
         INKBsoZV6aswf1EwgCUcBzKzU4JAQ+BQeyQ1KQmZLwJiZKililZeFcvS5dmll1r21tYV
         oyYYn7Zi5IaNVBURAZLnWjfykk9X6GhVf2SyN5RpktMI/AUAz9ynw0UoSa3l+18QAP9x
         QziA==
X-Gm-Message-State: AOJu0YzwLlNUrfE//3IGyMyOqxJt8ExK96E0puO2WFSu9tJo23SAGZ6w
	cY1qnuKiekXSt3EtraySE08TMSanLI7miEIRUtgOdrW7VIkwm6dnZBzmtJ0TuUNgJKLGHOLznuS
	dqSwP0s+uZeW5WK2jG2Xx3tlGPmUuGIxyyxzC4FijcXvlxx200HC4BZhXvKGwCHP3rismiloCzr
	muD4DT7hPdmAHv9UMyT2AurfZ+yvGfsiecKqSDGJw=
X-Received: by 2002:aa7:c38d:0:b0:561:dd88:cffc with SMTP id k13-20020aa7c38d000000b00561dd88cffcmr465754edq.28.1707757217499;
        Mon, 12 Feb 2024 09:00:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHksA5ai7JOoS0uklOVKI1iGk/wOmBYywj8HWtXzARiX88G09MpjFmNbBH4phxpiPQJH/VdNw==
X-Received: by 2002:aa7:c38d:0:b0:561:dd88:cffc with SMTP id k13-20020aa7c38d000000b00561dd88cffcmr465738edq.28.1707757217252;
        Mon, 12 Feb 2024 09:00:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXR1m0bOpBoqPXPgXXYaM9xtNMBrhn4WE1Pg/SJk4bnMQdTF9h8ffsK3KWu15iaJi6Z23nltfiz5dIXnKMptfo4UjJ0x/eI7CWd4H2jF97ZLwCYDKHPNU2p2YlMAanXkf+nNaNF0xypLv5AaDh61uecKausA88SdVC6PnzrvLFKxQbUkiSyZ3hdYGSeHT4kr6p3yDrqqsiA5JLSxLyJaGGrWGufxilwbyNg
Received: from thinky.redhat.com ([109.183.6.197])
        by smtp.gmail.com with ESMTPSA id 14-20020a0564021f4e00b0056176e95a88sm2620261edz.32.2024.02.12.09.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 09:00:16 -0800 (PST)
From: Andrey Albershteyn <aalbersh@redhat.com>
To: fsverity@lists.linux.dev,
	linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	chandan.babu@oracle.com,
	djwong@kernel.org,
	ebiggers@kernel.org
Cc: Andrey Albershteyn <aalbersh@redhat.com>
Subject: [PATCH v4 19/25] xfs: initialize fs-verity on file open and cleanup on inode destruction
Date: Mon, 12 Feb 2024 17:58:16 +0100
Message-Id: <20240212165821.1901300-20-aalbersh@redhat.com>
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

fs-verity will read and attach metadata (not the tree itself) from
a disk for those inodes which already have fs-verity enabled.

Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
---
 fs/xfs/xfs_file.c  | 8 ++++++++
 fs/xfs/xfs_super.c | 2 ++
 2 files changed, 10 insertions(+)

diff --git a/fs/xfs/xfs_file.c b/fs/xfs/xfs_file.c
index e33e5e13b95f..ed36cd088926 100644
--- a/fs/xfs/xfs_file.c
+++ b/fs/xfs/xfs_file.c
@@ -31,6 +31,7 @@
 #include <linux/mman.h>
 #include <linux/fadvise.h>
 #include <linux/mount.h>
+#include <linux/fsverity.h>
 
 static const struct vm_operations_struct xfs_file_vm_ops;
 
@@ -1228,10 +1229,17 @@ xfs_file_open(
 	struct inode	*inode,
 	struct file	*file)
 {
+	int		error = 0;
+
 	if (xfs_is_shutdown(XFS_M(inode->i_sb)))
 		return -EIO;
 	file->f_mode |= FMODE_NOWAIT | FMODE_BUF_RASYNC | FMODE_BUF_WASYNC |
 			FMODE_DIO_PARALLEL_WRITE | FMODE_CAN_ODIRECT;
+
+	error = fsverity_file_open(inode, file);
+	if (error)
+		return error;
+
 	return generic_file_open(inode, file);
 }
 
diff --git a/fs/xfs/xfs_super.c b/fs/xfs/xfs_super.c
index b2b6c1f24c42..4737101edab9 100644
--- a/fs/xfs/xfs_super.c
+++ b/fs/xfs/xfs_super.c
@@ -48,6 +48,7 @@
 #include <linux/magic.h>
 #include <linux/fs_context.h>
 #include <linux/fs_parser.h>
+#include <linux/fsverity.h>
 
 static const struct super_operations xfs_super_operations;
 
@@ -672,6 +673,7 @@ xfs_fs_destroy_inode(
 	ASSERT(!rwsem_is_locked(&inode->i_rwsem));
 	XFS_STATS_INC(ip->i_mount, vn_rele);
 	XFS_STATS_INC(ip->i_mount, vn_remove);
+	fsverity_cleanup_inode(inode);
 	xfs_inode_mark_reclaimable(ip);
 }
 
-- 
2.42.0

