Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D922B2D9EF4
	for <fsverity@lists.linux.dev>; Mon, 12 Jan 2026 14:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768229547; cv=none; b=l2YagKuANp17r2/JndpHjpjjAkhBrkPFWcL8ilWIPTm6G6juo9dSeTn6n/n/AHppAEM3t/XHvdgynR/HCIR5WNMwBlNBdgO3PZ0k3sb+W4HlkVZFDGxpzT3L19xuiw5fUTW3C4Opf3dfQKtpQdCfS/6aBBsV8Aywx7EtPN9JLNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768229547; c=relaxed/simple;
	bh=KR0cTxHaJS3TcZGRenZGtFBXNangwhA2X4UcgUh+yz4=;
	h=From:Date:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lLjfT/eLQiJJKiVJlUZJ3YV4RB0qA0x0mXaMCIi96BjoFbypGavtEzYEmLzp4bF+RT4ZOZj6BEcRZHMfERKLoWzjMbJPG+KVkQzanLC+c2IUephtk15udApth384q8199Rl2eZDXJlUbWbSJ6m2doCESoeQbLeqrmzCxTRouE9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GdyoPcuM; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GdyoPcuM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768229544;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=JtQ4ZpPQA3h2q2Fz6cxHWY8WGs2l4npsNwLGIggSgs8=;
	b=GdyoPcuM1P1ui1cuiahWtM5XnJtNuKwmtDSqQtQYVlzh0q0+BYd1QaYNfeMq/VthAP4+lC
	xNlOmRzpnD9k2omsbx6uXeBd4fI/MFyhGivnwTOr34IAuplNK0dQWS0nd0tkETIyihcOhb
	ipkzkSVR9F/X76tmesC+iWTEXZKCftU=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-323-UajxzJj-O5itwHW9-7_kGg-1; Mon, 12 Jan 2026 09:49:48 -0500
X-MC-Unique: UajxzJj-O5itwHW9-7_kGg-1
X-Mimecast-MFC-AGG-ID: UajxzJj-O5itwHW9-7_kGg_1768229387
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-b8720608e53so106954466b.1
        for <fsverity@lists.linux.dev>; Mon, 12 Jan 2026 06:49:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768229386; x=1768834186;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JtQ4ZpPQA3h2q2Fz6cxHWY8WGs2l4npsNwLGIggSgs8=;
        b=Yvu5yzun+P/VdTfzGA08c4jGJBNG5+Ojhyzq+fb5e2Dc7w/uM/3FpKGfOmZx3onHqr
         zMZ2+scunVNhgrnKSCRIWE7TAmljeoQWlIhbir2YmDC/2jbgu9/xhsuc4tqtYclJOBBm
         C4GDX8Jc3wbVtUR38CjDzONGLthpTOydBaFp2wFgCNtFn0YBfsc4auZb16koDwU2LDat
         GIVhL3D/hHCFiDdKMQMeHEhq7a+E33t4z3pXdFcYNFqVmd55Jczl0ZciE8ElSIQT8NXw
         bPCU5TBKpTmyMo6logjmSUbVAaaoTTjiNKg63UXNRvVxE/HaFvTjLRxr+9nULido9oFE
         ZnMA==
X-Gm-Message-State: AOJu0YwjeeV+jue8piQteljEgBwzzlq/mlzMWWiSOsg8pzuqxVQUjtVB
	z2CPvozNgUyceAAdvyfxQLmskowdyYSpTaJlVmuHZBzpmiPje3EMQabtNQzXV0EU9hnPNaPXtQj
	5AGHSIjEOcd+3E8gZK/gZzvLYYqnOZTPUeL1OxOKd/3SV/FPbrHbytgvn7G5mxhBUYEAhZciPu1
	ZtFUU/raYmIXOXmp9RRvJx1xMNFX/BTqtwrpfGUcRUlD4=
X-Gm-Gg: AY/fxX4IHI5gHGkNLNhEpnRbmLbZYF60Rs7MBBm/r53Sfk8QMXMs5UgJxyN4aLZWHkN
	B30/FJ6ZHyVQ4IHWKgiPwYiyhu5UaXibtbBCs2dayy1mV3Qm2bwtCLxGDH1OmpG/NPnMjlOsIy3
	T1Xta52WjJfLTLUGe7dak3Wuw3a1Ro0/jtvVv3Mes2LXftaWqsj4uVe6wOLKsjMr+uLv1Auc0ao
	0zjpkwLA2990lWary9Zi8CvMM8U1aYa4M0iBc981YZPRzYy7MuwRdrxSGIOQpjOYVtlJb/7zXA5
	jQ56RCS9Ba4HlzpRtDoHmBvew6JzfWs853VOlIkTAJVGeTDPmYkB0YwgFVr4VlfwkYBwAVh4g1c
	=
X-Received: by 2002:a17:906:fe4c:b0:b73:826a:9102 with SMTP id a640c23a62f3a-b8444fd0a3dmr1812183066b.49.1768229386395;
        Mon, 12 Jan 2026 06:49:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGEJfpQO2bUi21cHmaMt6C52aF3UlwMys3fAQFJkDRHMGLFiJve64PAQ/gKcqGFmeCzVUIjhw==
X-Received: by 2002:a17:906:fe4c:b0:b73:826a:9102 with SMTP id a640c23a62f3a-b8444fd0a3dmr1812179366b.49.1768229385851;
        Mon, 12 Jan 2026 06:49:45 -0800 (PST)
Received: from thinky ([217.30.74.39])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507b8c4484sm18054453a12.7.2026.01.12.06.49.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 06:49:45 -0800 (PST)
From: Andrey Albershteyn <aalbersh@redhat.com>
X-Google-Original-From: Andrey Albershteyn <aalbersh@kernel.org>
Date: Mon, 12 Jan 2026 15:49:44 +0100
To: fsverity@lists.linux.dev, linux-xfs@vger.kernel.org, 
	ebiggers@kernel.org, linux-fsdevel@vger.kernel.org, aalbersh@kernel.org, 
	aalbersh@redhat.com, djwong@kernel.org
Cc: djwong@kernel.org, david@fromorbit.com, hch@lst.de
Subject: [PATCH v2 0/23] fs-verity support for XFS with post EOF merkle tree
Message-ID: <cover.1768229271.patch-series@thinky>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: WK6hyYKkeF6936rV7DsS-D8SIByZ1tB-dwEmN_DgIz4_1768229387
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

This patch series adds fs-verity support for XFS. This version stores
merkle tree beyond end of the file, the same way as ext4 does it. The
verity descriptor is stored at the tail of the merkle tree.

The patchset starts with a few fs-verity preparation patches. Then, a few
patches to allow iomap to work in post EOF region. The XFS fs-verity
implementation follows.

Preallocations. The preallocations are disabled for fs-verity files. If
inode is fs-verity one the allocation size is set to zero. This is fine
as the only writing happening is merkle tree data and descriptor. It
would be nice to allocate tree size on first write, this could be
improved in the future.

The tree is read by iomap into page cache at offset 1 << 53. This is far
enough to handle any supported file size.

Testing. The -g verity is passing for 1k, 8k and 4k with/without quota,
the tests include different merkle tree block size.

Feedback is welcomed :)

xfsprogs:
https://github.com/alberand/xfsprogs/tree/b4/fsverity

xfstests:
https://github.com/alberand/xfstests/tree/b4/fsverity

Cc: fsverity@lists.linux.dev
Cc: linux-fsdevel@vger.kernel.org
Cc: linux-xfs@vger.kernel.org

Cc: david@fromorbit.com
Cc: djwong@kernel.org
Cc: ebiggers@kernel.org
Cc: hch@lst.de


Andrey Albershteyn <aalbersh@kernel.org>:
  fsverity: expose ensure_fsverity_info()
  iomap: introduce IOMAP_F_BEYOND_EOF
  iomap: allow iomap_file_buffered_write() take iocb without file
  iomap: integrate fs-verity verification into iomap's read path
  xfs: add fs-verity ro-compat flag
  xfs: add inode on-disk VERITY flag
  xfs: initialize fs-verity on file open and cleanup on inode destruction
  xfs: don't allow to enable DAX on fs-verity sealed inode
  xfs: disable direct read path for fs-verity files
  xfs: add verity info pointer to xfs inode
  xfs: introduce XFS_FSVERITY_CONSTRUCTION inode flag
  xfs: introduce XFS_FSVERITY_REGION_START constant
  xfs: disable preallocations for fsverity Merkle tree writes
  xfs: add writeback and iomap reading of Merkle tree pages
  xfs: add fs-verity support
  xfs: add fs-verity ioctls
  xfs: add fsverity traces
  xfs: enable ro-compat fs-verity flag
Darrick J. Wong <djwong@kernel.org>:
  fsverity: report validation errors back to the filesystem
  xfs: advertise fs-verity being available on filesystem
  xfs: check and repair the verity inode flag state
  xfs: report verity failures through the health system

Diffstat:
  fs/iomap/bio.c                  |  66 +++++++++++++++++++++++++---
  fs/iomap/buffered-io.c          |  31 ++++++++++---
  fs/iomap/ioend.c                |  41 ++++++++++++++++-
  fs/iomap/trace.h                |   3 +-
  fs/verity/open.c                |   4 +-
  fs/verity/verify.c              |   4 +
  fs/xfs/Makefile                 |   1 +
  fs/xfs/libxfs/xfs_format.h      |  13 +++--
  fs/xfs/libxfs/xfs_fs.h          |  24 ++++++++++
  fs/xfs/libxfs/xfs_health.h      |   4 +-
  fs/xfs/libxfs/xfs_inode_buf.c   |   8 +++
  fs/xfs/libxfs/xfs_inode_util.c  |   2 +
  fs/xfs/libxfs/xfs_sb.c          |   4 +
  fs/xfs/scrub/attr.c             |   7 +++
  fs/xfs/scrub/common.c           |  53 +++++++++++++++++++++++
  fs/xfs/scrub/common.h           |   2 +
  fs/xfs/scrub/inode.c            |   7 +++
  fs/xfs/scrub/inode_repair.c     |  36 +++++++++++++++
  fs/xfs/xfs_aops.c               |  20 +++++++-
  fs/xfs/xfs_bmap_util.c          |   7 +++
  fs/xfs/xfs_file.c               |  23 ++++++++--
  fs/xfs/xfs_fsverity.c           | 395 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  fs/xfs/xfs_fsverity.h           |  12 +++++
  fs/xfs/xfs_health.c             |   1 +
  fs/xfs/xfs_icache.c             |   3 +
  fs/xfs/xfs_inode.h              |  11 ++++
  fs/xfs/xfs_ioctl.c              |  16 +++++++
  fs/xfs/xfs_iomap.c              |  28 ++++++++++--
  fs/xfs/xfs_iops.c               |   4 +
  fs/xfs/xfs_message.c            |   4 +
  fs/xfs/xfs_message.h            |   1 +
  fs/xfs/xfs_mount.h              |   2 +
  fs/xfs/xfs_super.c              |  16 +++++++
  fs/xfs/xfs_trace.h              |  46 ++++++++++++++++++++
  include/linux/fsverity.h        |  16 +++++++
  include/linux/iomap.h           |  16 +++++++
  include/trace/events/fsverity.h |  19 ++++++++
  37 files changed, 924 insertions(+), 26 deletions(-)

-- 
- Andrey

