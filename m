Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 860962BE62B
	for <fsverity@lists.linux.dev>; Mon, 12 Jan 2026 14:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768229425; cv=none; b=mlXRmulHlLuwaGn9T9F//ssSfhD/ZLvXUGkzW5BOOOgGzOv7HJRbF6FnKWqpaRRYgpjRZZRUI7xBYjxK0G5Io/IQln+F8Gvhz5XrX3L2ZNxEOBFzsW6QHP0EB58lWX5/P6fFOzcOi3YLJR1uXXmyuiBEt+UXpVuhKvz0s5cLhn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768229425; c=relaxed/simple;
	bh=srquItat3iIisx24yelRLxoGuZRV8LO1BEtV0r7CHkc=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=rV4Q3OCWX0EeYKK4p7i3RfJOYWPtdPlb4ZqDNEBbN44jbpEeStfDBMIsdejLizthLcvzKMYX51/wN2GpmEfFNf65aJ0g6yZJ6KYJvi1beftDiMqQUEiSIo7rXrEtCEMUG+c3qelyczWIfd+PyeXE+PiPy1o4taGuUcgkAwEYhVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QnhDwJdq; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QnhDwJdq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768229423;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7m5yP4ArOwgDB+QQS/sWnqQ++oA8WiS4/X74cxkt+wA=;
	b=QnhDwJdqiCVLWHmsI1ETzZKIc6Hgx9fKs9F78mKob92pz+cikgiK53mgFn+dC2W7DYmZ5p
	KnSoGKbobXJVFeQ+MlBY1wEYuPOEd0VmFePTpHh/hA01loaAW533C9PFVmOJ5axtkQGl02
	cCCX8NwlEisOT2x3+z85YN3C8heu0nA=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-378-XhrEpoliPHKDAXwNmz25Mg-1; Mon, 12 Jan 2026 09:50:22 -0500
X-MC-Unique: XhrEpoliPHKDAXwNmz25Mg-1
X-Mimecast-MFC-AGG-ID: XhrEpoliPHKDAXwNmz25Mg_1768229420
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-b800ee1a176so1130200166b.1
        for <fsverity@lists.linux.dev>; Mon, 12 Jan 2026 06:50:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768229420; x=1768834220;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7m5yP4ArOwgDB+QQS/sWnqQ++oA8WiS4/X74cxkt+wA=;
        b=DLxiXgRiZE2nj2VbukwbOEuaWrF+nuG3ZOW1mj2IH997nolOt0qjYM/EE9PV3h4oBz
         D1r0HTOcIAC0XwCFuiY62fqB6TRMX69qna1+LtM6OFlRqGSZzQx+XnvQqwBYQFmERnNh
         4ZM9SP65gnHnFyY9TM0n72QyN7qbx6biLG2xGyPR4mM51eKEapbGB2zB4Dx6WE5cOImT
         g3zRWpq4C6zoVld76+TLPCQqUw5tEbR/CMbYR+2oOLLCss6OYa/QVZOa8uJCZcViQ/pz
         GEtXm0kYE0ilInJPE9ed9BP7rYuHcNpqjj9djg7iPGv9+fh+jgP2WlFoxVbhHpwSDLd4
         BMtA==
X-Gm-Message-State: AOJu0Yxe33GGydKKEyLSCGUPrbVxFiXGH2HlWb9cjA8wtBXAFPFpAJ8C
	xjhwkNzdH4JLzpH4lA565mLCXBnOa45s4Or9c04usfFor5Za3wtmRKkxTsPwW9nYDSru27ifYXZ
	pSEGbZqRPsYI0exu730RoNqxkKzaWBUgjJSzyDvpX4accJTgJZhsRxIub2IvZLydvt1tJT1cXNv
	gKXZ5J/GRnixPyRm5vtCR4txFepd6LTpEhlLsTnjqA1pU=
X-Gm-Gg: AY/fxX5Xb4Xp3cK/dNLtFMev9Te6c0hxjv1QPY2yUr9+Dn9BWob5fAcqSjc7iAuwB6o
	9AoV6CUdBPFjJamZXWr9ISdswkUFySNymeBjLtjQh/xkzcGYV0imJnuJ2osHmbbW+EDUexYc64q
	eXfyAXgKiFrZcoH5MPVLdnv/RXRzGLi56LZ5fA5XmTw9ImGQ1W9Y4spAnGLzEcqRDkYs9KiuM9e
	Q1QzRLW7uF3Iy4lwCtZN2fKsxQ56XkWMgKrdohL92haglC4u6pVsD815Ebec1NQ7DauUDykK0z1
	IqpLoOLnnpMO8fdB2wOla6fsCU7I/XLBWUE6TxLmKqEnVO9LYjyAoPLNWE9GHKfvm+EUOzLD9A8
	=
X-Received: by 2002:a17:907:8693:b0:b80:40cd:ea6c with SMTP id a640c23a62f3a-b844540fafbmr1740779866b.61.1768229419991;
        Mon, 12 Jan 2026 06:50:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFrXKO0CxWBOf2w/I7WXqz590chwScxO7BnYwI6Yf1sI5Y18FioHghi8Y+cIJhX4GNkkBv03A==
X-Received: by 2002:a17:907:8693:b0:b80:40cd:ea6c with SMTP id a640c23a62f3a-b844540fafbmr1740777166b.61.1768229419488;
        Mon, 12 Jan 2026 06:50:19 -0800 (PST)
Received: from thinky ([217.30.74.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b87207e08a7sm232426666b.55.2026.01.12.06.50.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 06:50:19 -0800 (PST)
From: Andrey Albershteyn <aalbersh@redhat.com>
X-Google-Original-From: Andrey Albershteyn <aalbersh@kernel.org>
Date: Mon, 12 Jan 2026 15:50:18 +0100
To: fsverity@lists.linux.dev, linux-xfs@vger.kernel.org, 
	ebiggers@kernel.org, linux-fsdevel@vger.kernel.org, aalbersh@kernel.org, 
	aalbersh@redhat.com, djwong@kernel.org
Cc: djwong@kernel.org, david@fromorbit.com, hch@lst.de
Subject: [PATCH v2 4/22] iomap: allow iomap_file_buffered_write() take iocb
 without file
Message-ID: <kibhid6bipmrndfn774tlbm6wcitya5qydhjws3n6tnjvbd4a3@bui63p535b3q>
References: <cover.1768229271.patch-series@thinky>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <cover.1768229271.patch-series@thinky>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: H8lwMuKxJf6vkXPtMHBeMXV1UwKCj20wK0QfEV77LGk_1768229420
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This will be necessary for XFS to use iomap_file_buffered_write() in
context without file pointer.

As the only user of this is XFS fsverity let's set necessary
IOMAP_F_BEYOND_EOF flag if no file provided instead of adding new flags
to iocb->ki_flags.

Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org>
---
 fs/iomap/buffered-io.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
index cc1cbf2a4c..79d1c97f02 100644
--- a/fs/iomap/buffered-io.c
+++ b/fs/iomap/buffered-io.c
@@ -1173,7 +1173,6 @@
 		const struct iomap_write_ops *write_ops, void *private)
 {
 	struct iomap_iter iter = {
-		.inode		= iocb->ki_filp->f_mapping->host,
 		.pos		= iocb->ki_pos,
 		.len		= iov_iter_count(i),
 		.flags		= IOMAP_WRITE,
@@ -1181,6 +1180,13 @@
 	};
 	ssize_t ret;
 
+	if (iocb->ki_filp) {
+		iter.inode = iocb->ki_filp->f_mapping->host;
+	} else {
+		iter.inode = (struct inode *)private;
+		iter.flags |= IOMAP_F_BEYOND_EOF;
+	}
+
 	if (iocb->ki_flags & IOCB_NOWAIT)
 		iter.flags |= IOMAP_NOWAIT;
 	if (iocb->ki_flags & IOCB_DONTCACHE)

-- 
- Andrey

