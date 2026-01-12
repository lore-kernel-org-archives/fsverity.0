Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C7C52BE057
	for <fsverity@lists.linux.dev>; Mon, 12 Jan 2026 14:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768229516; cv=none; b=CsMyEq0tfN7WbHV/FblPN9MIKTeLxQ/jRlJgLu8tn2pjL+rkjwT/GMuRPf0TyKekuhqd6/eCPOp5HOFWnf2bv8zPclAkAjZgM6xd2rdXombpB2P6+5somhEFy1XcsvAlQZRWcumKMRiyyKaKALaERK4k3QRrMCIADjGW4ZP3u7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768229516; c=relaxed/simple;
	bh=IdS1PwWWIbUYnlpXP3SRI6nzxO4Ju/UrhGGqho3KZ74=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=WI9PeYGnO4pV17l9fIg4VMlAk3rH10IBBM84iNz4QvN9GHZ28bf0PBPLQU8iVlX+jdiM7KxEhvlnCXXALDUGfQN7y3qZrn6yT6l42Ppyfw+3YIZO2+P+ORJW6SrJntN/C9qCZDi3lS5TsFV+nkXRVH2UXTO+RqDS95bt4Q8ju5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RwsjGxwh; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RwsjGxwh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768229514;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2hRRWYJKC2OgUTczWLcM4Cu6uVK2A3Bp7WXnQxkC11Q=;
	b=RwsjGxwhCyT44gIdzrBO4LiX/dwreTCGs8p9XiDuO8MnuWWV1ovYVV+0g0pKVzhMx8H7fd
	MZtnAPzrYQbTxzXhEswKLlvA2pOx65lUH9YMwP5Vk6nnpy8lGE1iy6+nZjH6EUU4nOCcmU
	42+aMo1dqsSev671ecs7FdyYoJOKrvU=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-125-Si5c-cy6OUWFuuZjrtMt_Q-1; Mon, 12 Jan 2026 09:51:53 -0500
X-MC-Unique: Si5c-cy6OUWFuuZjrtMt_Q-1
X-Mimecast-MFC-AGG-ID: Si5c-cy6OUWFuuZjrtMt_Q_1768229512
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-b870870f1aeso123664666b.0
        for <fsverity@lists.linux.dev>; Mon, 12 Jan 2026 06:51:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768229511; x=1768834311;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2hRRWYJKC2OgUTczWLcM4Cu6uVK2A3Bp7WXnQxkC11Q=;
        b=jf9G3/BTJHgHm2kRoqnaW2IGzc8NoQnG7MNUTqeOwBwSoytv2xmY5AWnHyci6//mhH
         IbhrjgWgJaIeMuVF91H7v/QYQH7cdx/x8NrTp5cjpkN5938BECx8Ai0cBDwyv+R4qLan
         hD/Xsv5fpeMmYfSejuU4Ak0MAk28Ey5HqQ1pBZbhah563v6YGY4fL0hbvXCtHu9X9d2X
         kby2HKJn2uPClZ6g+IuOgv9dQ+R3ubcPuPcEgUp/avnqLg2bc6Yz38+Uox94gKlNQ4BP
         jma3VdwCtfigSQH7olFzZPrr6MqwfWMC6mriD4kWP5FJdddDZKATVkCMa7nL1jJwjiA/
         bMDg==
X-Gm-Message-State: AOJu0YwTqSCwStpkLIxLROZ5ffGaI22OQuEeFbtNOfA9Z+xbXvN+y2lQ
	DEkFXz8P64nQZnsrTX0anoesvkbE/TmW6rXUEDh4NWAX8aQnyF81L+OUvo/z2lm8jLQkfaYv6S6
	JPnGwWKAs8kJFH23BUtH5vQocKbJKWiH00Wvuwfqe8cr+CutaTokDWun13aePejFol7jnknmdCK
	3qVJqUW9NSmuogfrdzfwf6fhSZs4NlW3IcN3qhjc1Ji8I=
X-Gm-Gg: AY/fxX5xg2lqZl+jxL6+96ye7DnBb67pLyFrLlIBGDPThdWz4C6yqGtQSGVkkW0mi0U
	jDvpyG/Nt8KEx41Vj4SkLA/suxws1B6qJvNglOAgER4yuUjvHv9oyN/bR0VHvk32ZMblyA69mh1
	gao+I9T/gL9tLGSYZAi/jMUCmUMjJ0lwowUL2sQQgYiB0Ol/V2j2eror9ntH5fr+rjV7/oqBuuS
	umRGQ200Y2u6KIQ+rcg9OHYZ000kWa9m7nato4wFa0yfzkh+hcWjLGQ5KLpecZURiR85gwi/1P4
	lfcq3haREbZ6UTlExjN2jPyi7EcowVMUD5o1KheXvm0D9KWDw8flTSMkqF4LsffoIhAgShI9EeE
	=
X-Received: by 2002:a17:907:c04:b0:b87:191f:4fab with SMTP id a640c23a62f3a-b87191f52a1mr368290366b.26.1768229511451;
        Mon, 12 Jan 2026 06:51:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGBJU3+0OUhT73HxEYbdA8zvcwaYMtAwM44w7eMExzMrFyUpX/1W3ti3CNeNrDDtWZWpx+S8g==
X-Received: by 2002:a17:907:c04:b0:b87:191f:4fab with SMTP id a640c23a62f3a-b87191f52a1mr368286366b.26.1768229510855;
        Mon, 12 Jan 2026 06:51:50 -0800 (PST)
Received: from thinky ([217.30.74.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b870813a9efsm505866766b.38.2026.01.12.06.51.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 06:51:50 -0800 (PST)
From: Andrey Albershteyn <aalbersh@redhat.com>
X-Google-Original-From: Andrey Albershteyn <aalbersh@kernel.org>
Date: Mon, 12 Jan 2026 15:51:49 +0100
To: fsverity@lists.linux.dev, linux-xfs@vger.kernel.org, 
	ebiggers@kernel.org, linux-fsdevel@vger.kernel.org, aalbersh@kernel.org, 
	aalbersh@redhat.com, djwong@kernel.org
Cc: djwong@kernel.org, david@fromorbit.com, hch@lst.de
Subject: [PATCH v2 17/22] xfs: add fs-verity ioctls
Message-ID: <j2sexom3szsvxqwtlzhk7hywzjp3sd3du4sycr6aglv73otodn@ydtl3rqh62xi>
References: <cover.1768229271.patch-series@thinky>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <cover.1768229271.patch-series@thinky>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7D9l7h-ZLYHWl1IAnt7YGGtV8gPs4_XSs-gtQUjr99A_1768229512
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Add fs-verity ioctls to enable, dump metadata (descriptor and Merkle
tree pages) and obtain file's digest.

[djwong: remove unnecessary casting]
Signed-off-by: Darrick J. Wong <djwong@kernel.org>
Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org>
---
 fs/xfs/xfs_ioctl.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+), 0 deletions(-)

diff --git a/fs/xfs/xfs_ioctl.c b/fs/xfs/xfs_ioctl.c
index 59eaad7743..d343af6aa0 100644
--- a/fs/xfs/xfs_ioctl.c
+++ b/fs/xfs/xfs_ioctl.c
@@ -44,6 +44,7 @@
 
 #include <linux/mount.h>
 #include <linux/fileattr.h>
+#include <linux/fsverity.h>
 
 /* Return 0 on success or positive error */
 int
@@ -1419,6 +1420,21 @@
 	case XFS_IOC_COMMIT_RANGE:
 		return xfs_ioc_commit_range(filp, arg);
 
+	case FS_IOC_ENABLE_VERITY:
+		if (!xfs_has_verity(mp))
+			return -EOPNOTSUPP;
+		return fsverity_ioctl_enable(filp, arg);
+
+	case FS_IOC_MEASURE_VERITY:
+		if (!xfs_has_verity(mp))
+			return -EOPNOTSUPP;
+		return fsverity_ioctl_measure(filp, arg);
+
+	case FS_IOC_READ_VERITY_METADATA:
+		if (!xfs_has_verity(mp))
+			return -EOPNOTSUPP;
+		return fsverity_ioctl_read_metadata(filp, arg);
+
 	default:
 		return -ENOTTY;
 	}

-- 
- Andrey

