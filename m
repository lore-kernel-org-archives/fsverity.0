Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692F8131737
	for <fsverity@lists.linux.dev>; Wed, 31 Jan 2024 18:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706725461; cv=none; b=CcCBwJyYlqeFcwVkboKI0ncKr/EM2FCcxAF6XAN1SqXWuS6IxdX8wByCb2BcUPlmvH7nO7Ysa9x8f1IA2sZtu/aPsi+JesYEI9L3NONpjLT4mY1udGzCMvbRIDtZp/WYqVHQ1hCHO4lVKB1B9DXukz7/IHsftWtoHTJnEdjShMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706725461; c=relaxed/simple;
	bh=ndEV35Q54pR6jf8ZqAqu7XQ5xwquKv7PpaUe2WK31PE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=pYA8cCuXQtT2fOgphgEj0mePuvHstN7dyAUuHJfHcpsmNE6z4cQxyFcKIQ7npm4aXqZ1F8Vah/N3xnlhV9bo55XjJSfN+xq5DKkKPIq9AfPFv70r/p3TiKPM/jQ6qVDeq0YftOgf4uHRRfhITX5pKwAHZmik83+S68gII8eJnRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=THIhS2Wg; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="THIhS2Wg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706725458;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=AePPsGAx+F6c9uGci8kxm8ApdAlm+h9oEblO/OPvODM=;
	b=THIhS2WgxW3q2Ds0c1GnOwPlSn53iccsAuM/rLrij0fzaAvDg6dNY2AV00KhUXxdZ2p+ax
	X/ceHNLd2spzi7VH3enrWWXoRaOIC3hZmD3ijyqayJQ23G4Mu4rne41z4hMKxy8EZDwm3b
	A2m3BTHzt4wY7bZMQqxUUxo1eAeP0qw=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-86-J9DcaP9sOX2AlPxT8NWihA-1; Wed, 31 Jan 2024 13:24:10 -0500
X-MC-Unique: J9DcaP9sOX2AlPxT8NWihA-1
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-5102ed61056so16505e87.1
        for <fsverity@lists.linux.dev>; Wed, 31 Jan 2024 10:24:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706725441; x=1707330241;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AePPsGAx+F6c9uGci8kxm8ApdAlm+h9oEblO/OPvODM=;
        b=KKFvPuQw7U9nCfwHirqiGHWXNJFE9JFRuMQbwF1Z5O6Emtl6/81VZUS5d2b66RJ+fa
         fJBLtWigFoRT1S6CfnfrYC0jYsvQhqf0WFys/4/RpubBojA9ArQohrqGFBMsezFAgKB2
         fgfoZEiQXQ9ywVAA4geJ0OBhwSUbWVznNAVvJjsAfVaj994xwQsijXWRbrx4afREwcSP
         QjEB5jG3KCvMNgWOl9F+zR+tHYi1l8rBtWxYJAao1SKR+3lR7K5FAnbvZKiv6TWt1wEa
         +nqGiLw06SfGxagLWuxhCvLwRTDFg2ukL26GLG90YPc6V9FhIXub92EiQI2kDvYS2143
         1T5g==
X-Gm-Message-State: AOJu0Yw5zTitgSSkMAiyeGmsuJSaEjMs38OhpPpU00uC4XuQ7Q2ZaINg
	XP336ah/Q8Leoina7+dllUuVLqiisDCrKr6Q0Kj9yKtVdL2gKDhFLtZivp25YpdGc0Zqvop78GF
	ZHQZ/KqeFeAK+BEGKvYmiMLTG9cp8WJbDOD+8F+EoVD6lIfjUBzp6MAgeY6zwPVvzDAsxWYnQIe
	bHMOd6tVxOS1uzAPIwktHWdD9JcWNmgNh4z45wk5U=
X-Received: by 2002:ac2:5f69:0:b0:511:e76:6f1f with SMTP id c9-20020ac25f69000000b005110e766f1fmr129836lfc.43.1706725441298;
        Wed, 31 Jan 2024 10:24:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHyEXm76flJChG1rAsynBUjN/O40oYa/9zgVav8bYzQMPu3ygwlCS0tTnTca828nawN9rNvsQ==
X-Received: by 2002:ac2:5f69:0:b0:511:e76:6f1f with SMTP id c9-20020ac25f69000000b005110e766f1fmr129822lfc.43.1706725440826;
        Wed, 31 Jan 2024 10:24:00 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVbmitnAvcGCI33RheBRQ+P52jHBUC4VG40pYj5s4r/IcSb1wJTdCMOIihoya9qE7ziy1lGBvjgaMWf+3AmCOVyqJa3
Received: from thinky.redhat.com ([109.183.6.197])
        by smtp.gmail.com with ESMTPSA id s6-20020a1709060c0600b00a2a37f63216sm6481507ejf.171.2024.01.31.10.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jan 2024 10:24:00 -0800 (PST)
From: Andrey Albershteyn <aalbersh@redhat.com>
To: fsverity@lists.linux.dev,
	ebiggers@kernel.org
Cc: Andrey Albershteyn <aalbersh@redhat.com>
Subject: [PATCH] fsverity: remove hash page spin lock
Date: Wed, 31 Jan 2024 19:20:23 +0100
Message-Id: <20240131182021.2730678-1-aalbersh@redhat.com>
X-Mailer: git-send-email 2.40.1
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

The spin lock is not necessary here as it can be replaced with
memory barrier which should be better performance-wise.

When Merkle tree block size differs from page size, in
is_hash_block_verified() two things are modified during check - a
bitmap and PG_checked flag of the page.

Each bit in the bitmap represent verification status of the Merkle
tree blocks. PG_checked flag tells if page was just re-instantiated
or was in pagecache. Both of this states are shared between
verification threads. Page which was re-instantiated can not have
already verified blocks (bit set in bitmap).

The spin lock was used to allow only one thread to modify both of
these states and keep order of operations. The only requirement here
is that PG_Checked is set strictly after bitmap is updated.
This way other threads which see that PG_Checked=1 (page cached)
knows that bitmap is up-to-date. Otherwise, if PG_Checked is set
before bitmap is cleared, other threads can see bit=1 and therefore
will not perform verification of that Merkle tree block.

However, there's still the case when one thread is setting a bit in
verify_data_block() and other thread is clearing it in
is_hash_block_verified(). This can happen if two threads get to
!PageChecked branch and one of the threads is rescheduled before
resetting the bitmap. This is fine as at worst blocks are
re-verified in each thread.

Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
---

Notes:
    I've tried removing the spinlock/barrier and triggering the case
    when thread get rescheduled, so verification is missed. But without
    success. The test was trimmed generic/574 reading file with single
    corrupted block and single Merkle tree block; with stress-ng
    allocating a lot of memory.
    
    The '-s ext4_4k -s ext4_1k -g verity' passed without problems. generic/579
    seems to perform the same.

 fs/verity/fsverity_private.h |  1 -
 fs/verity/open.c             |  1 -
 fs/verity/verify.c           | 21 +++++++++++++--------
 3 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/fs/verity/fsverity_private.h b/fs/verity/fsverity_private.h
index d071a6e32581..9611eeae3527 100644
--- a/fs/verity/fsverity_private.h
+++ b/fs/verity/fsverity_private.h
@@ -69,7 +69,6 @@ struct fsverity_info {
 	u8 file_digest[FS_VERITY_MAX_DIGEST_SIZE];
 	const struct inode *inode;
 	unsigned long *hash_block_verified;
-	spinlock_t hash_page_init_lock;
 };
 
 #define FS_VERITY_MAX_SIGNATURE_SIZE	(FS_VERITY_MAX_DESCRIPTOR_SIZE - \
diff --git a/fs/verity/open.c b/fs/verity/open.c
index 6c31a871b84b..fdeb95eca3af 100644
--- a/fs/verity/open.c
+++ b/fs/verity/open.c
@@ -239,7 +239,6 @@ struct fsverity_info *fsverity_create_info(const struct inode *inode,
 			err = -ENOMEM;
 			goto fail;
 		}
-		spin_lock_init(&vi->hash_page_init_lock);
 	}
 
 	return vi;
diff --git a/fs/verity/verify.c b/fs/verity/verify.c
index 904ccd7e8e16..7759f6dbd16f 100644
--- a/fs/verity/verify.c
+++ b/fs/verity/verify.c
@@ -46,20 +46,25 @@ static bool is_hash_block_verified(struct fsverity_info *vi, struct page *hpage,
 	 * the hash page is newly instantiated or not.
 	 *
 	 * The first thread that sees PG_checked=0 must clear the corresponding
-	 * bitmap bits, then set PG_checked=1.  This requires a spinlock.  To
-	 * avoid having to take this spinlock in the common case of
-	 * PG_checked=1, we start with an opportunistic lockless read.
+	 * bitmap bits, then set PG_checked=1. The requirement is that
+	 * PG_checked=1 is set after bits are cleared. Other threads could see
+	 * the case of bit set to 1 and PG_checked=1 (block is verified and
+	 * wasn't evicted from memory). This will lead to one of the thread
+	 * skipping verification of a block. To restrict order of operations
+	 * memory barrier is used.
+	 *
+	 * However, it can happen that two threads get into PG_checked=0
+	 * section. This is fine as both of them will reset bits to 0 and do
+	 * same verification job. This is not expected to happen often.
 	 */
 	if (PageChecked(hpage)) {
 		/*
 		 * A read memory barrier is needed here to give ACQUIRE
 		 * semantics to the above PageChecked() test.
+		 *
+		 * Matching to the smp_wmb() in PG_checked=0
 		 */
 		smp_rmb();
-		return test_bit(hblock_idx, vi->hash_block_verified);
-	}
-	spin_lock(&vi->hash_page_init_lock);
-	if (PageChecked(hpage)) {
 		verified = test_bit(hblock_idx, vi->hash_block_verified);
 	} else {
 		blocks_per_page = vi->tree_params.blocks_per_page;
@@ -74,7 +79,7 @@ static bool is_hash_block_verified(struct fsverity_info *vi, struct page *hpage,
 		SetPageChecked(hpage);
 		verified = false;
 	}
-	spin_unlock(&vi->hash_page_init_lock);
+
 	return verified;
 }
 
-- 
2.40.1

