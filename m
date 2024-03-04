Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 983F27A728
	for <fsverity@lists.linux.dev>; Mon,  4 Mar 2024 19:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709579547; cv=none; b=KH/Rg9UBWIZ/rewWMdQbOzKtFmAOrVF1iUj1gRDERn9M9gKjeoveCLVFGvB1JStjHwSFcDDq8WNKlJZGOIn4UA7XIUwwUuteH4U6U+3BAlUBYIXulvI2sbfSAJIsfC1PY9e1gOeCLSkrkVCWTZxFsRgbS2kzJXISeNqy/RfMdYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709579547; c=relaxed/simple;
	bh=HHQ81S2hPxColFzvYzIn9dIw5ty7YjE1Xuf7rj1qYOo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r8nxnro5J8KKmo2yVH7RrL0luGCaUstrunmAsxAR3ymvMyxLY4FGMP2rDesUHoIVcV130HKZpbO5JugoVs72QxecGQp0HEMJXxlGKyZer1HHwB6WWwsLTDm0l35y7F10IlIa1Ja+yLkAcfb4InFULCepdzaiSHAM1l8bpZB9QpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VxUqRy26; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VxUqRy26"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709579543;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=far6zlrIyHC61tMfvysiCXbI0A2uQYiTQAm6dVAsqUo=;
	b=VxUqRy26z3dz0p3jAV09+7bOhaRx7n8weCw3KZvNf+cswbIT1p0Y+R7nOK3CcEY4JF6XIb
	ABIlbmBzEDD3TLpSrgJ3cKqQ9Ma7fgFpr6D88zAfZ2s+0kD5f13YjVdbIjeZ+GtyOnM2fL
	3IUmAmEpk2Yzs+F6fARBSo48e9ePxlA=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-471-DkZzLfzmOieql3A4buGudQ-1; Mon, 04 Mar 2024 14:12:22 -0500
X-MC-Unique: DkZzLfzmOieql3A4buGudQ-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a444b9dd222so301740266b.1
        for <fsverity@lists.linux.dev>; Mon, 04 Mar 2024 11:12:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709579541; x=1710184341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=far6zlrIyHC61tMfvysiCXbI0A2uQYiTQAm6dVAsqUo=;
        b=vh1XkPx1l37gbaSqYgeOqFP6qLyRS+OFfKwYBLmh3XPrPAQi2kgVGZFxYgEqalQhNb
         4oLpTaHU6CnS2Cu0EnkIQcZC2nDx+QAQqA3OdlrbAaDcmpyb6CSuSzPEId6dyb46A7Ca
         jE+kTKoTfky3hcXfFYusJh3lvKY60Y56yLJAIG/v3q4GSBz/KmpKRirDpG2+ZLe+J95Q
         XiRkVAr6U3d13yYDa22mWamvkd44XbavOkcmBT9jDbkZu1GFHRTutbpFMdgjrLtwYqsS
         aO02vxksPLBpAneqvkqeHcIWIP3ml1JemXJe7msWz4vWg4GO9xp0J7EbuvcT+91XtY93
         MnsA==
X-Gm-Message-State: AOJu0YwqNk10KrhfP//RHUQF0m+TLPlR6xoNDR5hk6TU5GXQ3ZyhJSwH
	Y0owCbbokKd+VKBowxpt+6nftumJgfRemXdhmfTC5XzvzMz6UfYMvhFb1yY8AoU0ARNFciUB09r
	mob18R9OlfxByBx8M1VE+jgH4alMnEZcKUovLs4rjG8ZHUmynsCmVDurdOKwKe0hlDFuuUFUbr+
	EHfB7GnD9PWRhdEHoOgYCkX6ZiiBQjGKT2nvdJfeI=
X-Received: by 2002:a17:906:3508:b0:a44:d042:887b with SMTP id r8-20020a170906350800b00a44d042887bmr4066265eja.8.1709579541086;
        Mon, 04 Mar 2024 11:12:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEk7B3tup0Er2HlIPaQGDDhxylodjsavVO98JJAa6+X9m5TWmampICNTZgEFh4QY5BNyEOlZw==
X-Received: by 2002:a17:906:3508:b0:a44:d042:887b with SMTP id r8-20020a170906350800b00a44d042887bmr4066253eja.8.1709579540844;
        Mon, 04 Mar 2024 11:12:20 -0800 (PST)
Received: from thinky.redhat.com ([109.183.6.197])
        by smtp.gmail.com with ESMTPSA id a11-20020a1709064a4b00b00a44a04aa3cfsm3783319ejv.225.2024.03.04.11.12.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 11:12:20 -0800 (PST)
From: Andrey Albershteyn <aalbersh@redhat.com>
To: fsverity@lists.linux.dev,
	linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	chandan.babu@oracle.com,
	djwong@kernel.org,
	ebiggers@kernel.org
Cc: Andrey Albershteyn <aalbersh@redhat.com>
Subject: [PATCH v5 11/24] xfs: add XBF_VERITY_SEEN xfs_buf flag
Date: Mon,  4 Mar 2024 20:10:34 +0100
Message-ID: <20240304191046.157464-13-aalbersh@redhat.com>
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

One of essential ideas of fs-verity is that pages which are already
verified won't need to be re-verified if they still in page cache.

XFS will store Merkle tree blocks in extended file attributes. When
read extended attribute data is put into xfs_buf.

fs-verity uses PG_checked flag to track status of the blocks in the
page. This flag can has two meanings - page was re-instantiated and
the only block in the page is verified.

However, in XFS, the data in the buffer is not aligned with xfs_buf
pages and we don't have a reference to these pages. Moreover, these
pages are released when value is copied out in xfs_attr code. In
other words, we can not directly mark underlying xfs_buf's pages as
verified as it's done by fs-verity for other filesystems.

One way to track that these pages were processed by fs-verity is to
mark buffer as verified instead. If buffer is evicted the incore
XBF_VERITY_SEEN flag is lost. When the xattr is read again
xfs_attr_get() returns new buffer without the flag. The xfs_buf's
flag is then used to tell fs-verity this buffer was cached or not.

The second state indicated by PG_checked is if the only block in the
PAGE is verified. This is not the case for XFS as there could be
multiple blocks in single buffer (page size 64k block size 4k). This
is handled by fs-verity bitmap. fs-verity is always uses bitmap for
XFS despite of Merkle tree block size.

The meaning of the flag is that value of the extended attribute in
the buffer is processed by fs-verity.

Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
---
 fs/xfs/xfs_buf.h | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/fs/xfs/xfs_buf.h b/fs/xfs/xfs_buf.h
index 73249abca968..2a73918193ba 100644
--- a/fs/xfs/xfs_buf.h
+++ b/fs/xfs/xfs_buf.h
@@ -24,14 +24,15 @@ struct xfs_buf;
 
 #define XFS_BUF_DADDR_NULL	((xfs_daddr_t) (-1LL))
 
-#define XBF_READ	 (1u << 0) /* buffer intended for reading from device */
-#define XBF_WRITE	 (1u << 1) /* buffer intended for writing to device */
-#define XBF_READ_AHEAD	 (1u << 2) /* asynchronous read-ahead */
-#define XBF_NO_IOACCT	 (1u << 3) /* bypass I/O accounting (non-LRU bufs) */
-#define XBF_ASYNC	 (1u << 4) /* initiator will not wait for completion */
-#define XBF_DONE	 (1u << 5) /* all pages in the buffer uptodate */
-#define XBF_STALE	 (1u << 6) /* buffer has been staled, do not find it */
-#define XBF_WRITE_FAIL	 (1u << 7) /* async writes have failed on this buffer */
+#define XBF_READ		(1u << 0) /* buffer intended for reading from device */
+#define XBF_WRITE		(1u << 1) /* buffer intended for writing to device */
+#define XBF_READ_AHEAD		(1u << 2) /* asynchronous read-ahead */
+#define XBF_NO_IOACCT		(1u << 3) /* bypass I/O accounting (non-LRU bufs) */
+#define XBF_ASYNC		(1u << 4) /* initiator will not wait for completion */
+#define XBF_DONE		(1u << 5) /* all pages in the buffer uptodate */
+#define XBF_STALE		(1u << 6) /* buffer has been staled, do not find it */
+#define XBF_WRITE_FAIL		(1u << 7) /* async writes have failed on this buffer */
+#define XBF_VERITY_SEEN		(1u << 8) /* buffer was processed by fs-verity */
 
 /* buffer type flags for write callbacks */
 #define _XBF_INODES	 (1u << 16)/* inode buffer */
@@ -65,6 +66,7 @@ typedef unsigned int xfs_buf_flags_t;
 	{ XBF_DONE,		"DONE" }, \
 	{ XBF_STALE,		"STALE" }, \
 	{ XBF_WRITE_FAIL,	"WRITE_FAIL" }, \
+	{ XBF_VERITY_SEEN,	"VERITY_SEEN" }, \
 	{ _XBF_INODES,		"INODES" }, \
 	{ _XBF_DQUOTS,		"DQUOTS" }, \
 	{ _XBF_LOGRECOVERY,	"LOG_RECOVERY" }, \
-- 
2.42.0

