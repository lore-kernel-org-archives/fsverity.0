Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB5E615AE6
	for <fsverity@lists.linux.dev>; Mon, 11 Sep 2023 20:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694462805;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=68rrNCxWRK2VmJRI4wA2otsKeJcntoz7oSW2095jKCk=;
	b=YClJVd0/XOpkKEI7Tj6yB8YP38NkL7ME/L+k9HPu0MK1+389sbukXNhA5jV543r/Ge6o9f
	+i9AB+GXftDScrdRF96jTeOV8HsyuK6j29mQmcSg85W9SP132FtzjTLiOfEHrEbmUE1PCZ
	Qfyg9ylxhL/byqXqBA96/oW0g0IEja4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-634-ZXYkmI3xPlWd4WY1BZLGpA-1; Mon, 11 Sep 2023 16:06:44 -0400
X-MC-Unique: ZXYkmI3xPlWd4WY1BZLGpA-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-31f9186eb8dso1420998f8f.1
        for <fsverity@lists.linux.dev>; Mon, 11 Sep 2023 13:06:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694462803; x=1695067603;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=68rrNCxWRK2VmJRI4wA2otsKeJcntoz7oSW2095jKCk=;
        b=UhGnKx3Nc0kXnrGH19th3ITER7mJ1M/cEhnLsHtBYcAG482fbLsT0RnrO5r8VHF9X6
         4PZRsAChLFqhi+W8sdzlpq3jqJRha25tZ+bQ/34BeMwN/UotBFg8WJ6o00zZoaFrWS2a
         X5ay3SpXy2A6i7r1PgSkcybvWa6rU+d31WIhzRMeYS9TZVyWA3Nq0fNVN17JQVp5jeW0
         gnSQoxYl6u8BsCoMZPLsoHF3ASFAHtA+AH4i06iatjic28++dRm9bFgI/AKg3xQmzJcd
         tFXEVVi+3YGRK3PUsbQYl1rL2YEnNZBgaCIeafOZMObMNPrymuOpuy2Lu08O2zrb9kj9
         0JZg==
X-Gm-Message-State: AOJu0YwrEPenNAIR2cXmfKO8VCLTOJ0RiUcYtQzUnTcSpd2niLlOlN/X
	ycKM0qN/16u8Rj9dg2E+eh2ko8K++7BKZ95Y9XjgKD1B5vLpDxLwt2PCW3U5hgZJQCRKaZlHe1f
	uVbsrcj+yyHj/PXytYA==
X-Received: by 2002:a5d:610d:0:b0:31d:ce83:8a34 with SMTP id v13-20020a5d610d000000b0031dce838a34mr9181156wrt.39.1694462803237;
        Mon, 11 Sep 2023 13:06:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFcHWLNpdI4Riw+2UXE5aSNzL0YtOftIJjZgN+9dxn/hTs0HzlABjPKIq6cHU4MmvegMUNohA==
X-Received: by 2002:a5d:610d:0:b0:31d:ce83:8a34 with SMTP id v13-20020a5d610d000000b0031dce838a34mr9181143wrt.39.1694462802889;
        Mon, 11 Sep 2023 13:06:42 -0700 (PDT)
Received: from thinky.redhat.com ([109.183.6.197])
        by smtp.gmail.com with ESMTPSA id a3-20020adfeec3000000b003196e992567sm10915023wrp.115.2023.09.11.13.06.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 13:06:42 -0700 (PDT)
From: Andrey Albershteyn <aalbersh@redhat.com>
To: fstests@vger.kernel.org,
	fsverity@lists.linux.dev
Cc: Andrey Albershteyn <aalbersh@redhat.com>
Subject: [PATCH] common/rc: make _get_max_file_size find file size on mount point
Date: Mon, 11 Sep 2023 22:06:17 +0200
Message-Id: <20230911200617.777985-1-aalbersh@redhat.com>
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

Currently, _get_max_file_size finds max file size on $TEST_DIR.
The tests/generic/692 uses this function to detect file size and
then tries to create a file on $SCRATCH_MNT.

This works fine when test and scratch filesystems have the same
block size. However, it will fail if they differ, for example, TEST
is 4k and SCRATCH is 1k (file will be too big).

Found this by running generic/692 on ext4 with -b 1024.

Make _get_max_file_size accept mount point on which to detect max
file size.

Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
---
 common/rc         | 8 +++++++-
 tests/generic/299 | 2 +-
 tests/generic/485 | 2 +-
 tests/generic/692 | 2 +-
 4 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/common/rc b/common/rc
index 68d2ad04..d17ec73a 100644
--- a/common/rc
+++ b/common/rc
@@ -4809,7 +4809,13 @@ _require_scratch_feature()
 # be UINT32_MAX * block_size, but other filesystems may allow up to LLONG_MAX.
 _get_max_file_size()
 {
-	local testfile=$TEST_DIR/maxfilesize.$seq
+	if [ -z $1 ] || [ ! -d $1 ]; then
+		echo "Missing mount point argument for _get_max_file_size"
+		exit 1
+	fi
+
+	local mnt=$1
+	local testfile=$mnt/maxfilesize.$seq
 	local l=0
 	local r=9223372036854775807 # LLONG_MAX
 
diff --git a/tests/generic/299 b/tests/generic/299
index d8ecff53..0cd12202 100755
--- a/tests/generic/299
+++ b/tests/generic/299
@@ -30,7 +30,7 @@ NUM_JOBS=$((4*LOAD_FACTOR))
 BLK_DEV_SIZE=`blockdev --getsz $SCRATCH_DEV`
 FILE_SIZE=$((BLK_DEV_SIZE * 512))
 
-max_file_size=$(_get_max_file_size)
+max_file_size=$(_get_max_file_size $TEST_DIR)
 if [ $max_file_size -lt $FILE_SIZE ]; then
 	FILE_SIZE=$max_file_size
 fi
diff --git a/tests/generic/485 b/tests/generic/485
index 3f7749ff..8bab450b 100755
--- a/tests/generic/485
+++ b/tests/generic/485
@@ -30,7 +30,7 @@ _require_xfs_io_command "finsert"
 _require_xfs_io_command "truncate"
 
 block_size=$(_get_file_block_size $TEST_DIR)
-max_file_size=$(_get_max_file_size)
+max_file_size=$(_get_max_file_size $TEST_DIR)
 max_blocks=$((max_file_size / block_size))
 testfile=$TEST_DIR/testfile.$seq
 
diff --git a/tests/generic/692 b/tests/generic/692
index 95f6ec04..3fb8ac01 100755
--- a/tests/generic/692
+++ b/tests/generic/692
@@ -40,7 +40,7 @@ _scratch_mount
 
 fsv_file=$SCRATCH_MNT/file.fsv
 
-max_sz=$(_get_max_file_size)
+max_sz=$(_get_max_file_size $SCRATCH_MNT)
 _fsv_scratch_begin_subtest "way too big: fail on first merkle block"
 truncate -s $max_sz $fsv_file
 _fsv_enable $fsv_file |& _filter_scratch
-- 
2.40.1

