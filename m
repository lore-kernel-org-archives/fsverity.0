Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF487C0BF
	for <fsverity@lists.linux.dev>; Mon,  4 Mar 2024 19:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709579558; cv=none; b=CBBZ2UdqxoykA+r9qEpRinYV3WedfR3KA4O9zn7T0ontd90z4ORYTc68kVZNCsHPyAXnIUEzRGc1fYLXU6t3uTnW1p3HjAVYfIcek+ksgqAvH/0zk1JASs8WOWf/3xxBHFZk9ITNafD+H/6xeAEVVmHF59eBaM7PWUPYq9NYa8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709579558; c=relaxed/simple;
	bh=INc7MitHePby7vAUkDxfEehRxdrWRG6wEUUVyYbtgRI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oPNozslxAqTokyro+GCmwhssC2rTbUf1R1KTI69A6y6HHHTimX+ZU0wKtp0Jd/JzjxZbS1bjwtpssCjFiNTmLZpeArR+Kq0N8w3UfPhCMVT2l17g9c1HMQHMtVQ0rnes7D43+7BbNDVLGPu6dTpvu6BeOP5U6rU3ffnCK15EJzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=B0DYJvwq; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="B0DYJvwq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709579556;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cdXZxugOLeL3RCRxiry5bYRXbpoWIDFypQghiFAJrD4=;
	b=B0DYJvwqbP/DO5bvD3z03JAIIU+NzRjV43A5Vt1Vn/XZPC4u6WjQHBCsiMfXBCADloHpP5
	G9NEf6OxkBzcFWIVuXBjbaDsT8m4EbFIYOK+u1hlWibIwjdDIYvZ6dO/270aBBF+hNbgJR
	4T7GYoTi2lTuVhz3/3nwlw5s1Z3MoOo=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-218-a1dqBee8P-SftE5WsWNQbQ-1; Mon, 04 Mar 2024 14:12:34 -0500
X-MC-Unique: a1dqBee8P-SftE5WsWNQbQ-1
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-51329001fe6so3510074e87.1
        for <fsverity@lists.linux.dev>; Mon, 04 Mar 2024 11:12:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709579553; x=1710184353;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cdXZxugOLeL3RCRxiry5bYRXbpoWIDFypQghiFAJrD4=;
        b=GOzqIgFVsy+sWicWLO48VVvqhSdfXz+9N2cnhy7d4vmya7RZ3sl87Zw2hZOZIpO4fn
         xyObzL61VcM3PyevPL/ukLyF+Fb8iZ8iu0op8C7e2t9Ls5Z1McHAMqwq3hSZM9qTrmNb
         cz1s+mea35gMv+4s0Sy/zVDu44WqcvukTAmaKEtbpZO+2POoravQzSEaDcPL65GwWcnD
         0MS5JfDbQXlpVa+zxZvif2+X+WU/KpL8uIkkM5vjtmRRmwWrUtFP2WfzditEQI0Rk++1
         7W9jByXNRaL/D7xUuH1JAOYIuyDnVU5osYQaY7CTyVk0Rzb5zCaL7oGVC5XmdlHjRnjx
         imkw==
X-Gm-Message-State: AOJu0Ywq82A2AUOOo8STRGsKSQ+UvsCdK4qYzzfjTTX23xLSAw4aggtm
	i7eCWMmSf3HRkJ0ZcJMzjuzxjHA/Y5kcN14EYvNGCWi+bwBbFSGRkFGAiWhsjxTfsvQBx9qCOnU
	Gfh5QMGE8UsTTasOGaBRCeWFSQ4Vzx1Q/wrgslG4fekFCFh2+0OvSZlCqHL8WJAN7VIkv8+eepA
	zquAeWNBxYul0Afi3htBaSr+mDGHNzo3fYDjM28jk=
X-Received: by 2002:ac2:42d7:0:b0:513:49fd:c63a with SMTP id n23-20020ac242d7000000b0051349fdc63amr1699741lfl.56.1709579552904;
        Mon, 04 Mar 2024 11:12:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IETsl9dsoS2dwS0BLYcGhPQprHJfq00rS2fw55aSA7GEdV3c2F87uy+0BYF6vYReQxkQ1fYiA==
X-Received: by 2002:ac2:42d7:0:b0:513:49fd:c63a with SMTP id n23-20020ac242d7000000b0051349fdc63amr1699729lfl.56.1709579552630;
        Mon, 04 Mar 2024 11:12:32 -0800 (PST)
Received: from thinky.redhat.com ([109.183.6.197])
        by smtp.gmail.com with ESMTPSA id a11-20020a1709064a4b00b00a44a04aa3cfsm3783319ejv.225.2024.03.04.11.12.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 11:12:31 -0800 (PST)
From: Andrey Albershteyn <aalbersh@redhat.com>
To: fsverity@lists.linux.dev,
	linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	chandan.babu@oracle.com,
	djwong@kernel.org,
	ebiggers@kernel.org
Cc: Andrey Albershteyn <aalbersh@redhat.com>
Subject: [PATCH v5 23/24] xfs: add fs-verity ioctls
Date: Mon,  4 Mar 2024 20:10:46 +0100
Message-ID: <20240304191046.157464-25-aalbersh@redhat.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240304191046.157464-2-aalbersh@redhat.com>
References: <20240304191046.157464-2-aalbersh@redhat.com>
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

Add fs-verity ioctls to enable, dump metadata (descriptor and Merkle
tree pages) and obtain file's digest.

Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
---
 fs/xfs/xfs_ioctl.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/fs/xfs/xfs_ioctl.c b/fs/xfs/xfs_ioctl.c
index ab61d7d552fb..4763d20c05ff 100644
--- a/fs/xfs/xfs_ioctl.c
+++ b/fs/xfs/xfs_ioctl.c
@@ -43,6 +43,7 @@
 #include <linux/mount.h>
 #include <linux/namei.h>
 #include <linux/fileattr.h>
+#include <linux/fsverity.h>
 
 /*
  * xfs_find_handle maps from userspace xfs_fsop_handlereq structure to
@@ -2174,6 +2175,22 @@ xfs_file_ioctl(
 		return error;
 	}
 
+	case FS_IOC_ENABLE_VERITY:
+		if (!xfs_has_verity(mp))
+			return -EOPNOTSUPP;
+		return fsverity_ioctl_enable(filp, (const void __user *)arg);
+
+	case FS_IOC_MEASURE_VERITY:
+		if (!xfs_has_verity(mp))
+			return -EOPNOTSUPP;
+		return fsverity_ioctl_measure(filp, (void __user *)arg);
+
+	case FS_IOC_READ_VERITY_METADATA:
+		if (!xfs_has_verity(mp))
+			return -EOPNOTSUPP;
+		return fsverity_ioctl_read_metadata(filp,
+						    (const void __user *)arg);
+
 	default:
 		return -ENOTTY;
 	}
-- 
2.42.0

