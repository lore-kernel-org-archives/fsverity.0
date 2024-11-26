Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04D4C28FF
	for <fsverity@lists.linux.dev>; Tue, 26 Nov 2024 09:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732611823; cv=none; b=fuLrNWMvIZMabn5vJUQhC6LoIcxgxYM1qzDEwlfsqxfoj0xLuFrhrBBShQY+kNkqIim42f1PcB0j4MRqGtS4YZmOMIvzy8rViTeqMQjAi403WEqaZ8hOk8Sny5xnKZUFJ/s+J3E0OUcw+35q3YPfMuXhJIwSDtckuA+BoQStwfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732611823; c=relaxed/simple;
	bh=0nft9+2InSXfMNHbACxebYYRMVsPma/YV3+FO83lLFI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=sAMMq/80iE3jswqMrrOBDoS0HiQQCGQ6QKfryjPTpgeiptm6HpM1e1dp4zA5qPioGmLFHfCeZf4cpZRbs6gGE9exYaUVlqboEDbKlm2pWD2UMWktYGdjSCdYPhO372B7XaliI0w/8DL4xYCKvwxSjfUCAzzb2je6go2w8P9X+qU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=U5VJe+fg; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="U5VJe+fg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732611820;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BjDx8OlXD2/WfS8jDjPYSgHlVJb6xQJh3y8DAKeGSnE=;
	b=U5VJe+fgS1XYaNj7dsi6lHBGCfzU1Fmyc8OBFvfCE8OCsUtRjtX9YG1QTguWd4yDcGgTiI
	vUZTqIs3IvZ/ZqG6iccPX8kCedz7WieRpzJtP/y0vKtDBoRWYm98WjqH1tP4qvkf/Z82Tq
	LcNLnbuwF2yBriR5NnAA0t8MO1v1Axg=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-515-REQ3UTN2Mh6Q0Q9uJ5ShuQ-1; Tue,
 26 Nov 2024 04:03:35 -0500
X-MC-Unique: REQ3UTN2Mh6Q0Q9uJ5ShuQ-1
X-Mimecast-MFC-AGG-ID: REQ3UTN2Mh6Q0Q9uJ5ShuQ
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 72BCD19560A3;
	Tue, 26 Nov 2024 09:03:34 +0000 (UTC)
Received: from toolbx.redhat.com (unknown [10.39.193.207])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 155411956086;
	Tue, 26 Nov 2024 09:03:30 +0000 (UTC)
From: Allison Karlitskaya <allison.karlitskaya@redhat.com>
To: Eric Biggers <ebiggers@kernel.org>,
	"Theodore Y . Ts'o" <tytso@mit.edu>
Cc: fsverity@lists.linux.dev,
	Allison Karlitskaya <allison.karlitskaya@redhat.com>
Subject: [PATCH] btrfs: add FS_IOC_READ_VERITY_METADATA ioctl
Date: Tue, 26 Nov 2024 10:01:26 +0100
Message-ID: <20241126090126.74769-1-allison.karlitskaya@redhat.com>
In-Reply-To: <20241126023313.GA3095319@google.com>
References: <20241126023313.GA3095319@google.com>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -4vzMjPqDbHhRhbEgL5Z9-0ucobGeLo0Zlc_5jAe9f4_1732611814
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

146054090b085 introduced fs-verity support for btrfs, but didn't add
support for FS_IOC_READ_VERITY_METADATA to directly query the Merkle
tree, descriptor and signature blocks for fs-verity enabled files.

Add the (trival) implementation: we just need to wire it through to the
fs-verity code, the same way as is done in the other two filesystems
which support this ioctl (ext4, f2fs). The fs-verity code already has
access to the required data.

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

