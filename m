Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C5C93D986
	for <fsverity@lists.linux.dev>; Mon, 12 Feb 2024 17:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707757204; cv=none; b=d6fCnAoLuVrLzOBY1E9jxGO4UZTP6i/mQWdoIUaXAA4fp+h80HBFgzOEPHd0zBbPppn6UQ9vvlBPankNR2GUpTVsDasn6L1x/RiTR3WvA439X1P8bGVwf37MdaoagKz2AandQtgaWu4YLK3M0NEI4srq6pWoR2cR5j2i2yB9twQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707757204; c=relaxed/simple;
	bh=Q08TchXbWoihQ6fCDPoRO1eBKpAe+M20FpfPKv5WSZw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C6cWQxR0GZjhomZTE2XM+Y9+v4e3QfI9bWVtR84s5HV8dQ8jRl3CjDtueJpaavbeA0zncgGGZOdPoZ6KMGz9u8cKcfejqVuSBiXPVmww7OfaNpI5iVFqwwEZicrwPR7on8vfanClztxSUO0AZmDuXD6gOKKbSBoevN6O8yQgKa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZZpusOWd; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZZpusOWd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707757201;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=crv7tlQVsJYaSE0CXLWFrc5tM7MlAUbMwi6wgSZcz7Q=;
	b=ZZpusOWdRAC1Vgfr5NfY1+iTAKb79EQJekBX51QCQHtOhswaq/knkQGSH9aJrKk7spI93k
	9auSVH+mIzjyKFgb0WVTOH8fP+SlsmAXP9Cp846UcrSv0UOlas0MBSYJJ6n/qMncGi2EFV
	1rKJKf8bgREzCm3Cbau+6DZD8ocqJSw=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-325-VCwUCDvyMSuw-3MH2X75ww-1; Mon, 12 Feb 2024 12:00:00 -0500
X-MC-Unique: VCwUCDvyMSuw-3MH2X75ww-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-561bc69fbe5so578285a12.2
        for <fsverity@lists.linux.dev>; Mon, 12 Feb 2024 09:00:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707757198; x=1708361998;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=crv7tlQVsJYaSE0CXLWFrc5tM7MlAUbMwi6wgSZcz7Q=;
        b=m3UKGfG1S3fXp7EqOw0BSoFqW7hSV7tf7ptJveXRLeX4ny/ug5o214xh/UZ0nsrRBn
         z19zf+9Dh0zQ3nbmtaQKSZu8yTjOclXF9+29jcTNiMnYQaT5rIEwMt8vmQgteJuolGco
         VsM3EytnK39FhMNnTHqsGO+4d/zi/Hxa3hxcAUVQeXmvX0huUVL4A6UQXJPsCUhiKtbh
         3g+adCf2QvbT/lxAPAUBWyX6ctw6bVxA7usCA353tyyBrtX+JbLYgM32XcfY/yVt+x/L
         TuSGYlGXg2hfjGDh2WvNtywPQ145zTr0pHqbDDKNLWIh4KtdiJ9w11KBjevuvLL6wwDO
         +inA==
X-Gm-Message-State: AOJu0Yyb0QaKuu7kOd/4jnKqcyQTNwDrfNrGUvamhoeWV9Hkjr1ebsL3
	63ejGQ1Ve6OBUIHUchnD+JREK8tmqG0zaFoXt6zl+NPZcJFFvhnMk9332G/ued86H93rgZLqanZ
	lVUzqddFSbDREd2C9o+EG61EOKHmRaeWoo6EvFQZJc+St58r1EXYx3YS0QU2he7r3G5Zw+KQ7vR
	z+NmU5faFhSHpmAAsa9ycp9OzjC9dqvU0wP01EeYk=
X-Received: by 2002:a05:6402:345c:b0:561:aa6:3976 with SMTP id l28-20020a056402345c00b005610aa63976mr5516179edc.9.1707757198699;
        Mon, 12 Feb 2024 08:59:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEyUpx63MaPiRn9G9d80PqG5/lPqN+lnyfZ044mU8iFlZoxsi4myrnOKyNNVRWSMfwjy5f9cA==
X-Received: by 2002:a05:6402:345c:b0:561:aa6:3976 with SMTP id l28-20020a056402345c00b005610aa63976mr5516157edc.9.1707757198461;
        Mon, 12 Feb 2024 08:59:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUJHgORsjctOZtKHJJrXjpPkQj9xVQ8t62rizLdYxISuAgVKlsiORGXpyr2a1TZXip5eAkHUIKj1oM2JN9IrK2xES+fAztqn0P/sPcQrR0M1WfMRpPj9bwmv/MIMT/uG6Tq9KyekX5qr4Ds94g0nAWedC9yEessfRRcD8GkC+SHy/9h9nHaXhV8+3j5YtHPsK1BalYd8M6F2khs6Jl6gIUr2Uhk7sSYQVCX
Received: from thinky.redhat.com ([109.183.6.197])
        by smtp.gmail.com with ESMTPSA id 14-20020a0564021f4e00b0056176e95a88sm2620261edz.32.2024.02.12.08.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 08:59:58 -0800 (PST)
From: Andrey Albershteyn <aalbersh@redhat.com>
To: fsverity@lists.linux.dev,
	linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	chandan.babu@oracle.com,
	djwong@kernel.org,
	ebiggers@kernel.org
Cc: Andrey Albershteyn <aalbersh@redhat.com>
Subject: [PATCH v4 08/25] fsverity: calculate readahead in bytes instead of pages
Date: Mon, 12 Feb 2024 17:58:05 +0100
Message-Id: <20240212165821.1901300-9-aalbersh@redhat.com>
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

Replace readahead unit from pages to bytes as fs-verity is now
mainly works with blocks instead of pages.

Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
---
 fs/verity/fsverity_private.h |  4 ++--
 fs/verity/verify.c           | 41 +++++++++++++++++++-----------------
 include/linux/fsverity.h     |  6 +++---
 3 files changed, 27 insertions(+), 24 deletions(-)

diff --git a/fs/verity/fsverity_private.h b/fs/verity/fsverity_private.h
index 72ac1cdd9e63..2bf1f94d437c 100644
--- a/fs/verity/fsverity_private.h
+++ b/fs/verity/fsverity_private.h
@@ -170,7 +170,7 @@ void fsverity_drop_block(struct inode *inode,
  * @inode: inode in use for verification or metadata reading
  * @pos: byte offset of the block within the Merkle tree
  * @block: block to read
- * @num_ra_pages: number of pages to readahead, may be ignored
+ * @ra_bytes: number of bytes to readahead, may be ignored
  *
  * Depending on fs implementation use read_merkle_tree_block() or
  * read_merkle_tree_page() to read blocks.
@@ -179,6 +179,6 @@ int fsverity_read_merkle_tree_block(struct inode *inode,
 				    u64 pos,
 				    struct fsverity_blockbuf *block,
 				    unsigned int log_blocksize,
-				    unsigned long num_ra_pages);
+				    u64 ra_bytes);
 
 #endif /* _FSVERITY_PRIVATE_H */
diff --git a/fs/verity/verify.c b/fs/verity/verify.c
index 414ec3321fe6..6f4ff420c075 100644
--- a/fs/verity/verify.c
+++ b/fs/verity/verify.c
@@ -39,13 +39,12 @@ static bool is_hash_block_verified(struct fsverity_info *vi,
  */
 static bool
 verify_data_block(struct inode *inode, struct fsverity_info *vi,
-		  const void *data, u64 data_pos, unsigned long max_ra_pages)
+		  const void *data, u64 data_pos, u64 max_ra_bytes)
 {
 	const struct merkle_tree_params *params = &vi->tree_params;
 	const unsigned int hsize = params->digest_size;
 	int level;
 	int err;
-	int num_ra_pages;
 	u8 _want_hash[FS_VERITY_MAX_DIGEST_SIZE];
 	const u8 *want_hash;
 	u8 real_hash[FS_VERITY_MAX_DIGEST_SIZE];
@@ -92,9 +91,11 @@ verify_data_block(struct inode *inode, struct fsverity_info *vi,
 	for (level = 0; level < params->num_levels; level++) {
 		unsigned long next_hidx;
 		unsigned long hblock_idx;
-		pgoff_t hpage_idx;
 		unsigned int hoffset;
 		struct fsverity_blockbuf *block = &hblocks[level].block;
+		u64 block_offset;
+		u64 ra_bytes = 0;
+		u64 tree_size;
 
 		/*
 		 * The index of the block in the current level; also the index
@@ -105,18 +106,20 @@ verify_data_block(struct inode *inode, struct fsverity_info *vi,
 		/* Index of the hash block in the tree overall */
 		hblock_idx = params->level_start[level] + next_hidx;
 
-		/* Index of the hash page in the tree overall */
-		hpage_idx = hblock_idx >> params->log_blocks_per_page;
+		/* Offset of the Merkle tree block into the tree */
+		block_offset = hblock_idx << params->log_blocksize;
 
 		/* Byte offset of the hash within the block */
 		hoffset = (hidx << params->log_digestsize) &
 			  (params->block_size - 1);
 
-		num_ra_pages = level == 0 ?
-			min(max_ra_pages, params->tree_pages - hpage_idx) : 0;
+		if (level == 0) {
+			tree_size = params->tree_pages << PAGE_SHIFT;
+			ra_bytes = min(max_ra_bytes, (tree_size - block_offset));
+		}
 		err = fsverity_read_merkle_tree_block(
-			inode, hblock_idx << params->log_blocksize, block,
-			params->log_blocksize, num_ra_pages);
+			inode, block_offset, block,
+			params->log_blocksize, ra_bytes);
 		if (err) {
 			fsverity_err(inode,
 				     "Error %d reading Merkle tree block %lu",
@@ -182,7 +185,7 @@ verify_data_block(struct inode *inode, struct fsverity_info *vi,
 
 static bool
 verify_data_blocks(struct folio *data_folio, size_t len, size_t offset,
-		   unsigned long max_ra_pages)
+		   u64 max_ra_bytes)
 {
 	struct inode *inode = data_folio->mapping->host;
 	struct fsverity_info *vi = inode->i_verity_info;
@@ -200,7 +203,7 @@ verify_data_blocks(struct folio *data_folio, size_t len, size_t offset,
 
 		data = kmap_local_folio(data_folio, offset);
 		valid = verify_data_block(inode, vi, data, pos + offset,
-					  max_ra_pages);
+					  max_ra_bytes);
 		kunmap_local(data);
 		if (!valid)
 			return false;
@@ -246,24 +249,24 @@ EXPORT_SYMBOL_GPL(fsverity_verify_blocks);
 void fsverity_verify_bio(struct bio *bio)
 {
 	struct folio_iter fi;
-	unsigned long max_ra_pages = 0;
+	u64 max_ra_bytes = 0;
 
 	if (bio->bi_opf & REQ_RAHEAD) {
 		/*
 		 * If this bio is for data readahead, then we also do readahead
 		 * of the first (largest) level of the Merkle tree.  Namely,
-		 * when a Merkle tree page is read, we also try to piggy-back on
-		 * some additional pages -- up to 1/4 the number of data pages.
+		 * when a Merkle tree is read, we also try to piggy-back on
+		 * some additional bytes -- up to 1/4 of data.
 		 *
 		 * This improves sequential read performance, as it greatly
 		 * reduces the number of I/O requests made to the Merkle tree.
 		 */
-		max_ra_pages = bio->bi_iter.bi_size >> (PAGE_SHIFT + 2);
+		max_ra_bytes = bio->bi_iter.bi_size >> 2;
 	}
 
 	bio_for_each_folio_all(fi, bio) {
 		if (!verify_data_blocks(fi.folio, fi.length, fi.offset,
-					max_ra_pages)) {
+					max_ra_bytes)) {
 			bio->bi_status = BLK_STS_IOERR;
 			break;
 		}
@@ -431,7 +434,7 @@ int fsverity_read_merkle_tree_block(struct inode *inode,
 					u64 pos,
 					struct fsverity_blockbuf *block,
 					unsigned int log_blocksize,
-					unsigned long num_ra_pages)
+					u64 ra_bytes)
 {
 	struct page *page;
 	int err = 0;
@@ -439,10 +442,10 @@ int fsverity_read_merkle_tree_block(struct inode *inode,
 
 	if (inode->i_sb->s_vop->read_merkle_tree_block)
 		return inode->i_sb->s_vop->read_merkle_tree_block(
-			inode, pos, block, log_blocksize, num_ra_pages);
+			inode, pos, block, log_blocksize, ra_bytes);
 
 	page = inode->i_sb->s_vop->read_merkle_tree_page(
-			inode, index, num_ra_pages);
+			inode, index, (ra_bytes >> PAGE_SHIFT));
 	if (IS_ERR(page)) {
 		err = PTR_ERR(page);
 		fsverity_err(inode,
diff --git a/include/linux/fsverity.h b/include/linux/fsverity.h
index fb2d4fccec0c..7bb0e044c44e 100644
--- a/include/linux/fsverity.h
+++ b/include/linux/fsverity.h
@@ -143,8 +143,8 @@ struct fsverity_operations {
 	 * @pos: byte offset of the block within the Merkle tree
 	 * @block: block buffer for filesystem to point it to the block
 	 * @log_blocksize: size of the expected block
-	 * @num_ra_pages: The number of pages with blocks that should be
-	 *		  prefetched starting at @index if the page at @index
+	 * @ra_bytes: The number of bytes that should be
+	 *		  prefetched starting at @pos if the data at @pos
 	 *		  isn't already cached.  Implementations may ignore this
 	 *		  argument; it's only a performance optimization.
 	 *
@@ -161,7 +161,7 @@ struct fsverity_operations {
 				      u64 pos,
 				      struct fsverity_blockbuf *block,
 				      unsigned int log_blocksize,
-				      unsigned long num_ra_pages);
+				      u64 ra_bytes);
 
 	/**
 	 * Write a Merkle tree block to the given inode.
-- 
2.42.0

