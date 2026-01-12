Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 631602C0F84
	for <fsverity@lists.linux.dev>; Mon, 12 Jan 2026 14:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768229533; cv=none; b=fcMULZzpLcAmRqJCTgBHhKZz6ayQl8j2oBeC4IPvcVMJPOikTpGGhil1BAVAc9n3YhC0k1P6RZCF/5c29jygyqrBmcKXvcpbZfIT6iursU1rMEYjseu3VNQk4agDeurdgSeFKXJhY1Ur1r0xjyXWZeYQK62UUee7K6Ky1Y5sI5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768229533; c=relaxed/simple;
	bh=C/MDGxOkNIvgHTaqTYSxlFYphLb/jo2tJvmNmF9aQAw=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=cFS1gAga7LmsbvxlQ3SjT4iYSyIDq9FkKUW0ZeYli0M5VpP2hP4NJvznjn8PZfZmcNr87niL8xr92jZLd0hh/pJdi1idbV8MJeITnhEAc/oae4PQXvxgI+WuiAiTITevt13jNAuzXNwr34HhZ0qwJC4jvqh/fC+0DQJvEJymXEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KziAPDa2; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KziAPDa2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768229531;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=i3zHW5WG2189QuRGw972bnhsFeepbkuRDbwilr8y5Bg=;
	b=KziAPDa2PjCNYLEuGk7l2CogtjjSSprcpwmtgduK3HPTXtT6t10byLrZxfy6sXe/AjvxWE
	G+MQGybParG6jb4X7fCSRsAhrI7aL93u86wDVyQAy2cpqdJGb+V2NePFD8Gfhiv5nSTKk4
	iB6zGtUWEFntcvcT+1ze+FdcxCPCPSs=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-262-pgDFCJ9yN--Bq9elU03nSA-1; Mon, 12 Jan 2026 09:52:09 -0500
X-MC-Unique: pgDFCJ9yN--Bq9elU03nSA-1
X-Mimecast-MFC-AGG-ID: pgDFCJ9yN--Bq9elU03nSA_1768229528
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-b871d7ad66cso128065066b.1
        for <fsverity@lists.linux.dev>; Mon, 12 Jan 2026 06:52:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768229528; x=1768834328;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i3zHW5WG2189QuRGw972bnhsFeepbkuRDbwilr8y5Bg=;
        b=ggGFw7yqfS7/4xM9bWVEocWmutahmqP73+T7K9mfZd7ru5is543YR/uQxtjwjeCw9/
         wFYOHCN3+d73rXkKLqgUz7mflxITDWLJyOdfyxMn31YZWma9s87DT97nhkJgntpU5xCj
         qB7CkUFkzXFr7CLD3Sr5Ov/TvJInpmDvBpGqpAC7cm6ci2wJhWHN6G0s2p5CfNVQSP9H
         9MNl6glPN6wzdQ24JBgssFuRi1y+A8vUER9V+OVwZ40jEQg+VF2+KI1yvwRc/tt5Q+Vr
         sfulRSI7084nq4z3tdEtiidmDRGnVPJaf8P8+6msLeUQuyWKwiNyfvvk+9645HxGIzaG
         HPMQ==
X-Gm-Message-State: AOJu0YwL1cjrHWtQuK63FV+r44PPJ2kLmDO7TfJgNCAaaLi38CNQ6w1d
	YtAI4Z9LDC9OomqzqfIeFiJALr1tb0y5dvABzWrr3nNIVaQyVFSWWOo6JasDEcjRy0MTMrfC7gO
	Muq47YWAtv5UmhinMzA+bIrBfQotG/b7lGVfDyjukoZYUAHuCFlkteQUmXiI0xzUjIzIQdl3B77
	+Wkt/tSHx3fPi1m8c+qcHEUSmb7letZQYARZNOEbsGqqA=
X-Gm-Gg: AY/fxX7MI5xRD/HoffwvYx7S6mCE16vK7fljm7T7lWzqQxU/ov3N7cPcwGZF5iq2KL0
	XuJC1RPWSlCJ3y68qMgMO16FFRdNid0v7+r6ZwQegs2N3ZggEiPLgeV+QQqPUM9E8gT8PA1SVRt
	2ePR8UBwqA3Yeu/BnjnUmOwWfhIjeH8W6uZS9krWikScN00/2OoZfeHcdJ5/IPTuMibla1LphA8
	M7OE1miRrPFpy912/uaMlBjUg57Moo2vTew5CYKIqskzbI8hW6F7IL01tLHk4C9eJer7CLtsh2d
	JAgrckCMDYcfzjzUOA/LBZ1ZZyKgkGRovuddJAqx/jphNb+0geit7WTyGkaBeCVnmyzqHZGn
X-Received: by 2002:a17:907:c03:b0:b87:2f29:2054 with SMTP id a640c23a62f3a-b872f29385amr133946566b.8.1768229527814;
        Mon, 12 Jan 2026 06:52:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGB1AHBE/+Mhlwy/JWYn8W4wq+O4YUYCcO2vyBAd8+kNj160C4mXDrZOC7LbzVnSCFekrxpzA==
X-Received: by 2002:a17:907:c03:b0:b87:2f29:2054 with SMTP id a640c23a62f3a-b872f29385amr133942266b.8.1768229527346;
        Mon, 12 Jan 2026 06:52:07 -0800 (PST)
Received: from thinky ([217.30.74.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b86f88f90a4sm670365066b.37.2026.01.12.06.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 06:52:06 -0800 (PST)
From: "Darrick J. Wong" <aalbersh@redhat.com>
X-Google-Original-From: "Darrick J. Wong" <djwong@kernel.org>
Date: Mon, 12 Jan 2026 15:52:06 +0100
To: fsverity@lists.linux.dev, linux-xfs@vger.kernel.org, 
	ebiggers@kernel.org, linux-fsdevel@vger.kernel.org, aalbersh@kernel.org, 
	aalbersh@redhat.com, djwong@kernel.org
Cc: djwong@kernel.org, david@fromorbit.com, hch@lst.de
Subject: [PATCH v2 19/22] xfs: check and repair the verity inode flag state
Message-ID: <wtj4hy43eq3dzl4txfnt5ury5eygcaocafmp632jpvmytrk7sn@xcumewz64tkd>
References: <cover.1768229271.patch-series@thinky>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <cover.1768229271.patch-series@thinky>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: WlvdAe7PnHkN7zSILPSpw8RFhQaRfQjemnY222rhShI_1768229528
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

If an inode has the incore verity iflag set, make sure that we can
actually activate fsverity on that inode.  If activation fails due to
a fsverity metadata validation error, clear the flag.  The usage model
for fsverity requires that any program that cares about verity state is
required to call statx/getflags to check that the flag is set after
opening the file, so clearing the flag will not compromise that model.

Signed-off-by: Darrick J. Wong <djwong@kernel.org>
Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org>
---
 fs/xfs/scrub/attr.c         |  7 ++++++
 fs/xfs/scrub/common.c       | 53 +++++++++++++++++++++++++++++++++++++++++++++++
 fs/xfs/scrub/common.h       |  2 +
 fs/xfs/scrub/inode.c        |  7 ++++++
 fs/xfs/scrub/inode_repair.c | 36 +++++++++++++++++++++++++++++++
 5 files changed, 105 insertions(+), 0 deletions(-)

diff --git a/fs/xfs/scrub/attr.c b/fs/xfs/scrub/attr.c
index 708334f9b2..b1448832ae 100644
--- a/fs/xfs/scrub/attr.c
+++ b/fs/xfs/scrub/attr.c
@@ -646,6 +646,13 @@
 	if (!xfs_inode_hasattr(sc->ip))
 		return -ENOENT;
 
+	/*
+	 * If this is a verity file that won't activate, we cannot check the
+	 * merkle tree geometry.
+	 */
+	if (xchk_inode_verity_broken(sc->ip))
+		xchk_set_incomplete(sc);
+
 	/* Allocate memory for xattr checking. */
 	error = xchk_setup_xattr_buf(sc, 0);
 	if (error == -ENOMEM)
diff --git a/fs/xfs/scrub/common.c b/fs/xfs/scrub/common.c
index 7bfa37c994..41bbf4648f 100644
--- a/fs/xfs/scrub/common.c
+++ b/fs/xfs/scrub/common.c
@@ -45,6 +45,8 @@
 #include "scrub/health.h"
 #include "scrub/tempfile.h"
 
+#include <linux/fsverity.h>
+
 /* Common code for the metadata scrubbers. */
 
 /*
@@ -1736,3 +1738,54 @@
 	return xfs_bmap_count_blocks(sc->tp, sc->ip, whichfork, nextents,
 			count);
 }
+
+/*
+ * If this inode has S_VERITY set on it, read the verity info. If the reading
+ * fails with anything other than ENOMEM, the file is corrupt, which we can
+ * detect later with fsverity_active.
+ *
+ * Callers must hold the IOLOCK and must not hold the ILOCK of sc->ip because
+ * activation reads inode data.
+ */
+int
+xchk_inode_setup_verity(
+	struct xfs_scrub	*sc)
+{
+	int			error;
+
+	if (!IS_VERITY(VFS_I(sc->ip)))
+		return 0;
+
+	error = fsverity_ensure_verity_info(VFS_I(sc->ip));
+	switch (error) {
+	case 0:
+		/* fsverity is active */
+		break;
+	case -ENODATA:
+	case -EMSGSIZE:
+	case -EINVAL:
+	case -EFSCORRUPTED:
+	case -EFBIG:
+		/*
+		 * The nonzero errno codes above are the error codes that can
+		 * be returned from fsverity on metadata validation errors.
+		 */
+		return 0;
+	default:
+		/* runtime errors */
+		return error;
+	}
+
+	return 0;
+}
+
+/*
+ * Is this a verity file that failed to activate?  Callers must have tried to
+ * activate fsverity via xchk_inode_setup_verity.
+ */
+bool
+xchk_inode_verity_broken(
+	struct xfs_inode	*ip)
+{
+	return IS_VERITY(VFS_I(ip)) && !fsverity_active(VFS_I(ip));
+}
diff --git a/fs/xfs/scrub/common.h b/fs/xfs/scrub/common.h
index ddbc065c79..36d6a33337 100644
--- a/fs/xfs/scrub/common.h
+++ b/fs/xfs/scrub/common.h
@@ -289,6 +289,8 @@
 		bool *inuse);
 int xchk_inode_count_blocks(struct xfs_scrub *sc, int whichfork,
 		xfs_extnum_t *nextents, xfs_filblks_t *count);
+int xchk_inode_setup_verity(struct xfs_scrub *sc);
+bool xchk_inode_verity_broken(struct xfs_inode *ip);
 
 bool xchk_inode_is_dirtree_root(const struct xfs_inode *ip);
 bool xchk_inode_is_sb_rooted(const struct xfs_inode *ip);
diff --git a/fs/xfs/scrub/inode.c b/fs/xfs/scrub/inode.c
index bb3f475b63..1e7cfef00a 100644
--- a/fs/xfs/scrub/inode.c
+++ b/fs/xfs/scrub/inode.c
@@ -36,6 +36,10 @@
 
 	xchk_ilock(sc, XFS_IOLOCK_EXCL);
 
+	error = xchk_inode_setup_verity(sc);
+	if (error)
+		return error;
+
 	error = xchk_trans_alloc(sc, 0);
 	if (error)
 		return error;
@@ -833,6 +837,9 @@
 	if (S_ISREG(VFS_I(sc->ip)->i_mode))
 		xchk_inode_check_reflink_iflag(sc, sc->ip->i_ino);
 
+	if (xchk_inode_verity_broken(sc->ip))
+		xchk_ino_set_corrupt(sc, sc->sm->sm_ino);
+
 	xchk_inode_check_unlinked(sc);
 
 	xchk_inode_xref(sc, sc->ip->i_ino, &di);
diff --git a/fs/xfs/scrub/inode_repair.c b/fs/xfs/scrub/inode_repair.c
index 4f7040c9dd..846a47286e 100644
--- a/fs/xfs/scrub/inode_repair.c
+++ b/fs/xfs/scrub/inode_repair.c
@@ -573,6 +573,8 @@
 		dip->di_nrext64_pad = 0;
 	else if (dip->di_version >= 3)
 		dip->di_v3_pad = 0;
+	if (!xfs_has_verity(mp) || !S_ISREG(mode))
+		flags2 &= ~XFS_DIFLAG2_VERITY;
 
 	if (flags2 & XFS_DIFLAG2_METADATA) {
 		xfs_failaddr_t	fa;
@@ -1613,6 +1615,10 @@
 	if (iget_error)
 		return iget_error;
 
+	error = xchk_inode_setup_verity(sc);
+	if (error)
+		return error;
+
 	error = xchk_trans_alloc(sc, 0);
 	if (error)
 		return error;
@@ -2032,6 +2038,27 @@
 	return 0;
 }
 
+/*
+ * If this file is a fsverity file, xchk_prepare_iscrub or xrep_dinode_core
+ * should have activated it.  If it's still not active, then there's something
+ * wrong with the verity descriptor and we should turn it off.
+ */
+STATIC int
+xrep_inode_verity(
+	struct xfs_scrub	*sc)
+{
+	struct inode		*inode = VFS_I(sc->ip);
+
+	if (xchk_inode_verity_broken(sc->ip)) {
+		sc->ip->i_diflags2 &= ~XFS_DIFLAG2_VERITY;
+		inode->i_flags &= ~S_VERITY;
+
+		xfs_trans_log_inode(sc->tp, sc->ip, XFS_ILOG_CORE);
+	}
+
+	return 0;
+}
+
 /* Repair an inode's fields. */
 int
 xrep_inode(
@@ -2081,6 +2108,15 @@
 			return error;
 	}
 
+	/*
+	 * Disable fsverity if it cannot be activated.  Activation failure
+	 * prohibits the file from being opened, so there cannot be another
+	 * program with an open fd to what it thinks is a verity file.
+	 */
+	error = xrep_inode_verity(sc);
+	if (error)
+		return error;
+
 	/* Reconnect incore unlinked list */
 	error = xrep_inode_unlinked(sc);
 	if (error)

-- 
- Andrey

