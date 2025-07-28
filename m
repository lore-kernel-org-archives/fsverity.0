Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 977161C8631
	for <fsverity@lists.linux.dev>; Mon, 28 Jul 2025 20:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753734688; cv=none; b=QMYyhhVO6VCytPQuS0Z8/NU/AJYdoH5X2reENaskrxH/LJg8E/X/PY3Oz8QksBmlwAX33orgHIUX8BlcQpNAByHLE7Oz+Nk5veSChqLxQ9wNyi7UaULZc+8bCi4o18MV8Ictx47nOvaatEBVDPZR2FMK61hHCdnWH7COIIVHyis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753734688; c=relaxed/simple;
	bh=VtYwCsYFXmwKFqSisiEpZ1WiddXgYvi2ZL1c1U3QwOs=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=R5laBXleqYaqoajChIMhTW8wCeaeU7NPx/CRAhox2RQMwC2Zk841j/xtkseF/FqCd9v6GTlMhRcNCu4tpxxk14/80iTg/CXB4xIz8e+We5fgqIbrbCYw+FNzmQiuyb3KAv3bH8M0ovAslS9LACSFcbjbL5Td1C4Sl1PuzWbTrC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=d/Y5wtUq; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="d/Y5wtUq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753734685;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nrPk2sjX8mGGWKQ8DNv1YTNF7pzc9fqd1IKi+H9eIyc=;
	b=d/Y5wtUqZDjOUKlxrulTo6HdyAWSLhXUTnWumzqg/nOgnHIWpYsnSdv2PG8r7zWX0CTaMa
	3Vpamo1WpEy+Mbi32t/pGnGZaG6r+glc0H3/XcyHn4fOKdGfTmur5nveEJWxPrWhELAPAB
	PHoT5JUHDsOekiHI0bwx1G51cq2LIxY=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-219-32Zzv5TDOgasC-yRa-wxyg-1; Mon, 28 Jul 2025 16:31:24 -0400
X-MC-Unique: 32Zzv5TDOgasC-yRa-wxyg-1
X-Mimecast-MFC-AGG-ID: 32Zzv5TDOgasC-yRa-wxyg_1753734683
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-ae6d4c5f798so378908466b.0
        for <fsverity@lists.linux.dev>; Mon, 28 Jul 2025 13:31:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753734683; x=1754339483;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nrPk2sjX8mGGWKQ8DNv1YTNF7pzc9fqd1IKi+H9eIyc=;
        b=hRLf0u9pCYfkRtY+Ak3xDdshNhiuJ6pmuJSpRmt5UMjOIJVfiJ71JLFPU/QxxD7kyn
         n3y4FHiZgH5w02go431gWZr0/NivyIVZvv8UdP8c2iudA9ernEg8aDgz6rfo+Prg/Oao
         NhujfspRo+3/VLaCzZhtuOH6JzWEAI5D+6p8BSXC0JCjJnWeVZbuEv92KaxQYrrbq3h1
         1ylJ9YRso5KkeQZTJnVcHYbAIDn/AXp4gL+ua4nR7KceyW7QRLwYQ00AHO49aPAcTsfP
         EsZ3zp+5wYMLMQbiDbp9C/CnAcAJ9NiHmHVL0RAMrCHozM+BUiKuC3KP5IkkDfoz3o75
         fe3w==
X-Gm-Message-State: AOJu0YzYa1ANd+xAu7gbNRFHA26yqISbpNp8CCFF+R/skpdU2qPhNxut
	cJF5CWLmDNeZf+nMjXKMHP7rz7d9zRmYxPF9RXEc7yYJ+pJNYOJzjS4JPvp2on1KDqlwPRthJW2
	Dtk4xH6GIBedEDaPf3dFYgRETO9gfhR6Q3kTlaNPy5jBBARypixKSUUe1PMQ=
X-Gm-Gg: ASbGncucEvw4ZVShvH8yXGTbTNLq38A+m1RP02FPAA0a7hd4XYtmZ94uUumppQ0wWGO
	P+wFyXLVSaTqf4xWsU4GiFqyX4RTDXiz0fH1n/Hwxp6AIV8zOWrrxi4eQf1qgK4MfdGVVHVMx6G
	qDbcA/Z1NMJYi09iFadqNEfOipxzqh1PTi28cgTJ8ePrvklmO/GPkA91IjYG7OkuzjFsrGDtXzF
	SfDYv7cgL829CehNgj0V9pc3CrP6DhxPdBU8zrXP/fAMjddIRryoHslx+KMP9SGzFz1pv8STG9A
	348Qsys/sVk9ywmbDINe9tXUmdtvtCTwucgH7yXPNhavOg==
X-Received: by 2002:a17:907:3f16:b0:ae6:abe9:8cbc with SMTP id a640c23a62f3a-af61c4b1b33mr1529808866b.12.1753734682802;
        Mon, 28 Jul 2025 13:31:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGjzaXG6dlANtTMHpawQqb/YKviL4IINJii4EK7mPdu5nM4elwa0LnJxEQkmRLmU8yvj62GcA==
X-Received: by 2002:a17:907:3f16:b0:ae6:abe9:8cbc with SMTP id a640c23a62f3a-af61c4b1b33mr1529805366b.12.1753734682423;
        Mon, 28 Jul 2025 13:31:22 -0700 (PDT)
Received: from [127.0.0.2] (ip-217-030-074-039.aim-net.cz. [217.30.74.39])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615226558d3sm2730656a12.45.2025.07.28.13.31.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 13:31:22 -0700 (PDT)
From: Andrey Albershteyn <aalbersh@redhat.com>
X-Google-Original-From: Andrey Albershteyn <aalbersh@kernel.org>
Date: Mon, 28 Jul 2025 22:30:05 +0200
Subject: [PATCH RFC 01/29] iomap: add iomap_writepages_unbound() to write
 beyond EOF
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <20250728-fsverity-v1-1-9e5443af0e34@kernel.org>
References: <20250728-fsverity-v1-0-9e5443af0e34@kernel.org>
In-Reply-To: <20250728-fsverity-v1-0-9e5443af0e34@kernel.org>
To: fsverity@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
 linux-xfs@vger.kernel.org, david@fromorbit.com, djwong@kernel.org, 
 ebiggers@kernel.org, hch@lst.de
Cc: Andrey Albershteyn <aalbersh@redhat.com>, 
 Andrey Albershteyn <aalbersh@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3505; i=aalbersh@kernel.org;
 h=from:subject:message-id; bh=hg7XZ6Ib6H6dW2N76cefwEA06f5dZUZhN/YvcDCBY0o=;
 b=owJ4nJvAy8zAJea2/JXEGuOHHIyn1ZIYMtrviV+c1KSVO9mzRHj25Kw+k7benQaH5V+/lg7PF
 k1SK9Z8m9lRysIgxsUgK6bIsk5aa2pSkVT+EYMaeZg5rEwgQxi4OAVgIp22jAzbDx87GJ0qzs6V
 OqWaUyvz3PSwb/8fnL9y+4hyecyfI4bLGf6X5//aqdlXOO/n7TB3rxKzqRq5R0sOxT7h4Pzz/8/
 eCX78ANZBSW0=
X-Developer-Key: i=aalbersh@kernel.org; a=openpgp;
 fpr=AE1B2A9562721A6FC4307C1F46A7EA18AC33E108
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 1zzOMBrsh1Fjaf-T8VvasTdFBDo5O24ypphWbI34ZZ8_1753734683
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

From: Andrey Albershteyn <aalbersh@redhat.com>

Add iomap_writepages_unbound() without limit in form of EOF. XFS
will use this to write metadata (fs-verity Merkle tree) in range far
beyond EOF.

Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org>
---
 fs/iomap/buffered-io.c | 51 +++++++++++++++++++++++++++++++++++++++-----------
 include/linux/iomap.h  |  3 +++
 2 files changed, 43 insertions(+), 11 deletions(-)

diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
index 3729391a18f3..7bef232254a3 100644
--- a/fs/iomap/buffered-io.c
+++ b/fs/iomap/buffered-io.c
@@ -1881,18 +1881,10 @@ static int iomap_writepage_map(struct iomap_writepage_ctx *wpc,
 	int error = 0;
 	u32 rlen;
 
-	WARN_ON_ONCE(!folio_test_locked(folio));
-	WARN_ON_ONCE(folio_test_dirty(folio));
-	WARN_ON_ONCE(folio_test_writeback(folio));
-
-	trace_iomap_writepage(inode, pos, folio_size(folio));
-
-	if (!iomap_writepage_handle_eof(folio, inode, &end_pos)) {
-		folio_unlock(folio);
-		return 0;
-	}
 	WARN_ON_ONCE(end_pos <= pos);
 
+	trace_iomap_writepage(inode, pos, folio_size(folio));
+
 	if (i_blocks_per_folio(inode, folio) > 1) {
 		if (!ifs) {
 			ifs = ifs_alloc(inode, folio, 0);
@@ -1956,6 +1948,23 @@ static int iomap_writepage_map(struct iomap_writepage_ctx *wpc,
 	return error;
 }
 
+/* Map pages bound by EOF */
+static int iomap_writepage_map_eof(struct iomap_writepage_ctx *wpc,
+		struct writeback_control *wbc, struct folio *folio)
+{
+	int error;
+	struct inode *inode = folio->mapping->host;
+	u64 end_pos = folio_pos(folio) + folio_size(folio);
+
+	if (!iomap_writepage_handle_eof(folio, inode, &end_pos)) {
+		folio_unlock(folio);
+		return 0;
+	}
+
+	error = iomap_writepage_map(wpc, wbc, folio);
+	return error;
+}
+
 int
 iomap_writepages(struct address_space *mapping, struct writeback_control *wbc,
 		struct iomap_writepage_ctx *wpc,
@@ -1972,9 +1981,29 @@ iomap_writepages(struct address_space *mapping, struct writeback_control *wbc,
 			PF_MEMALLOC))
 		return -EIO;
 
+	wpc->ops = ops;
+	while ((folio = writeback_iter(mapping, wbc, folio, &error))) {
+		WARN_ON_ONCE(!folio_test_locked(folio));
+		WARN_ON_ONCE(folio_test_dirty(folio));
+		WARN_ON_ONCE(folio_test_writeback(folio));
+
+		error = iomap_writepage_map_eof(wpc, wbc, folio);
+	}
+	return iomap_submit_ioend(wpc, error);
+}
+EXPORT_SYMBOL_GPL(iomap_writepages);
+
+int
+iomap_writepages_unbound(struct address_space *mapping, struct writeback_control *wbc,
+		struct iomap_writepage_ctx *wpc,
+		const struct iomap_writeback_ops *ops)
+{
+	struct folio *folio = NULL;
+	int error;
+
 	wpc->ops = ops;
 	while ((folio = writeback_iter(mapping, wbc, folio, &error)))
 		error = iomap_writepage_map(wpc, wbc, folio);
 	return iomap_submit_ioend(wpc, error);
 }
-EXPORT_SYMBOL_GPL(iomap_writepages);
+EXPORT_SYMBOL_GPL(iomap_writepages_unbound);
diff --git a/include/linux/iomap.h b/include/linux/iomap.h
index 522644d62f30..4a0b5ebb79e9 100644
--- a/include/linux/iomap.h
+++ b/include/linux/iomap.h
@@ -464,6 +464,9 @@ void iomap_sort_ioends(struct list_head *ioend_list);
 int iomap_writepages(struct address_space *mapping,
 		struct writeback_control *wbc, struct iomap_writepage_ctx *wpc,
 		const struct iomap_writeback_ops *ops);
+int iomap_writepages_unbound(struct address_space *mapping,
+		struct writeback_control *wbc, struct iomap_writepage_ctx *wpc,
+		const struct iomap_writeback_ops *ops);
 
 /*
  * Flags for direct I/O ->end_io:

-- 
2.50.0

