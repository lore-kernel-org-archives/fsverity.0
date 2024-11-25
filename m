Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10BEE18B47C
	for <fsverity@lists.linux.dev>; Mon, 25 Nov 2024 08:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732524169; cv=none; b=QHGK0Qafyko1B+Tlz+bh8IZLpnHVKr4A51O/EGt9s61evuzuW3uItp1Xd9W2SICTRm9nAm7zq9PAUFCHxnkVF7JBeI67ST60GApk9CU/qrqb0eTIXnVckQ3CsTlXyPQE1C1pn8hRNF37JUv7gciCGHJwnm0KEaGzc7FQapM8+aA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732524169; c=relaxed/simple;
	bh=e5Cjyx5A0Necq0mJdOMMbroPaULHvnBhTFMzPX11pBo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AA1N+hrNnVqfh7InVAtNcbGwoF1y1rQ3w3UX9pS64w8w3gzDTikrHpFXgNLYHF0H8+YEHogsDLShGgWdFQuDdZ4Hxw4uxdeFZYvt2bm1/lai5uxVdKVga2OLWnIFNCPJtA8ayzx8avQ2pOWeLHOxb9hLdNhuQcxFZhdgee8jY2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=InMTAUxR; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="InMTAUxR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732524167;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=VfdCAaP3/vRfI2OC8oL1fh5qtOJvB6UMqMWhM374ZCY=;
	b=InMTAUxR45qhxlvIHo8pYACOFug65tXCx791tEB8Rbj2/5BScvMKhqP7UHO79q8G/AID6I
	kgtktK1nmo510K93jU5HNKz5HLhsayEfHntej3w6z3ZRzBXI1z1pb35NvAfm6Kzyvz5LES
	8hswbBSUBSclU9ZRtH9YgM7aXeQ8vIQ=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-593-NYl4axT0PHWbViomINw-2w-1; Mon,
 25 Nov 2024 03:42:43 -0500
X-MC-Unique: NYl4axT0PHWbViomINw-2w-1
X-Mimecast-MFC-AGG-ID: NYl4axT0PHWbViomINw-2w
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id F288619560AD;
	Mon, 25 Nov 2024 08:42:41 +0000 (UTC)
Received: from toolbx.fritz.box (unknown [10.39.194.41])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E837330000DF;
	Mon, 25 Nov 2024 08:42:39 +0000 (UTC)
From: Allison Karlitskaya <allison.karlitskaya@redhat.com>
To: Eric Biggers <ebiggers@kernel.org>,
	"Theodore Y . Ts'o" <tytso@mit.edu>
Cc: linux-btrfs@vger.kernel.org,
	fsverity@lists.linux.dev,
	Allison Karlitskaya <allison.karlitskaya@redhat.com>
Subject: [PATCH] btrfs: add FS_IOC_READ_VERITY_METADATA ioctl
Date: Mon, 25 Nov 2024 09:41:11 +0100
Message-ID: <20241125084111.141386-1-allison.karlitskaya@redhat.com>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

e17fe6579de0 introduced FS_IOC_READ_VERITY_METADATA to directly query
the Merkle tree, descriptor and signature blocks for fs-verity enabled
files.  It also added the ioctl implementation to ext4 and f2fs, but
seems to have forgotten about btrfs.

Add the (trival) implementation for btrfs: we just need to wire it
through to the fs-verity code, the same way as was done for the other
two filesystems.  The fs-verity code already has access to the required
data.

FS_IOC_READ_VERITY_METADATA remains unimplemented for FUSE, but
implementing it there would be more involved.

Signed-off-by: Allison Karlitskaya <allison.karlitskaya@redhat.com>
---
 fs/btrfs/ioctl.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/btrfs/ioctl.c b/fs/btrfs/ioctl.c
index c9302d193187..392322a70ce8 100644
--- a/fs/btrfs/ioctl.c
+++ b/fs/btrfs/ioctl.c
@@ -5290,6 +5290,8 @@ long btrfs_ioctl(struct file *file, unsigned int
 		return fsverity_ioctl_enable(file, (const void __user *)argp);
 	case FS_IOC_MEASURE_VERITY:
 		return fsverity_ioctl_measure(file, argp);
+	case FS_IOC_READ_VERITY_METADATA:
+		return fsverity_ioctl_read_metadata(file, argp);
 	case BTRFS_IOC_ENCODED_READ:
 		return btrfs_ioctl_encoded_read(file, argp, false);
 	case BTRFS_IOC_ENCODED_WRITE:
-- 
2.47.0

