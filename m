Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3685C3C1D52
	for <fsverity@lists.linux.dev>; Sat, 10 Oct 2026 08:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791621517; cv=none; b=TdIdqnR0eEptJ2x2Dw+08MOTdXxWrzIZyshK8jcwiBymbFNEvYyG+/8md2IVv1ngZhUvxTwZoLmWkkGmN73rfTHNfxGagG2ZkikK+j6FQQI7+EzEO20hQ9YUfQ3GxUnt6NusQd1Ogkt90kwSDiE3CRAJgdZ67sgCi1UUXIGJ41c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791621517; c=relaxed/simple;
	bh=9xpNnQqLXytp8X44PR1h7MI2cuBxO7fOJMEPyGlkPkw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=IEXMcxPikm0De/4py3DRWNYY/NfdwXL3PQbY8xM6Fw96PJ25uigOuu25a+rujorzRkLiQO4Me3F+6Tx+jjRQDdQDdq5x1eNFDlgw1qIY+M+AflyyPs20RqDJEEvnsa4zB3oQc8nKflGWP8w34ubWrK9vivrwGpRdfiLMTofXras=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XtFd7pHN; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XtFd7pHN"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a022fee0caso614885e9.1
        for <fsverity@lists.linux.dev>; Sat, 10 Oct 2026 01:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791621510; x=1792226310; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0Rob4i7+V27nvvWkDOfWCSkRqomqDqBc4VZBhr7ZnSA=;
        b=XtFd7pHNv6CKBJe6nc5dsfJLMMwIRX0Xz0ECfaHCE8HT0o/UQhNokEKKXZ7Euqs8Cb
         QO8TG8jeJO9LTbx/P1uevbqFpp8YAOtnZ52aSob2vBJAVTwQt5KxB3vJUvZwo2FfSzy/
         Y9ll4Zb8pArfDURZWwpm64lTMDHN2CPsIpXsQ4PG4TyD6tAoI/jtVBgiHWg3ecX/foOA
         3252rSkH4VBdT36iUClVECkSHhWe5RzF8/X9qSrOa2IdYVB4NgNiWYWIekh2SbtV2mBO
         Leu8v0BBXSPd0yr8dZ4XFLXrlS0RaD4pBQcma/f/Fj6nIgtWt4zvlI5d+MkplprvXaxq
         2HTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791621510; x=1792226310;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0Rob4i7+V27nvvWkDOfWCSkRqomqDqBc4VZBhr7ZnSA=;
        b=Nnnnoy6M3Kgjtl9m1RmVSOcKGZjn2FanIW/lcy2UpVLv2pZJgaydLQc7Abl46jgIIO
         0w/2KWaNqtjeBA7nlZ/DHA4H5M81tOXqEGK+4rkO/Ut2glfROzXqWzlFOyMPx94pBmxn
         5akDT9x7+Ctkw4OJUCaxAU7aZTF9U5ZU7qXZIn9CbJuhtNKJEdIT+VA3k5EGIVhX1czN
         Z13E5iXKt6tN+xRqfxsJ07GErN2R1UUfig+2rEL1sSIycx4ETrNYd4pS0BiVR1hH0ubc
         C+06SYSE+2lDo4yoCQPksXrNyPgIiIerydFC4W9k26+uTccWxWwl4KtNQmNUYKHBQfP8
         fuKg==
X-Gm-Message-State: AFq9FYJNJ/24CUbjWIfMtV5r3VWQ2x2q4OQOmVH31LkW8gPWqW4vYmnC
	/07EyFYII9L2nRf6OL/ZRfh5o6fkMe6SkWKxmrZOn6plpPL4C3J0tLiW
X-Gm-Gg: AYBFou2DZVO6K67IIOwSbljxJ8ctWjYUKZbhwuT3ruAvhEWm2hnNpt7/roLQB0Y4A8a
	Oyx7s6RvA9NefC6vHgTJKxuDklSWl/ZOeX3ATxLXozjKrmVxm54kFEqemAcOcIeuzIenGsQVSdc
	y9stNtPP0mmlvz0MU3brRR2giRqfmBcpMdOmOQ8gYkB5ZvgZXsFIMsIlLhMCeEPWfHEJ0ofJE5M
	QvyOC6Ni+aiy3whdrXLI6rIfO7Ilg7+1hypqQ6fZhgnB20kXXYvYMtduBk2FZJO8Baqwgpjr1fN
	4i22jjMKGu3678Cx02SIYDbmMqKnRI5IfcZyFF8iBIlytJy7crHUSUMO4OI9G7k2MPKhYzE0VHn
	+ZIQK11giyRalK6vr1Zij7WSoW0xyd15I+2YlRzbYXSwtvUUsWT9PwDYB81T3i04ibPZNdij4tf
	nlnQUiJzcztgF4rlqNopGttohl3BPK/dFX3Cuz3XmOAzF257/Xa443p+IO4E9RGAivtJ60eJ8D2
	jj3tFCYz3i3fSa7GAZ2duYXctUD6Iy1HLX234nHZXavUCxLY3Up8KSpHEgfuDrZHy0=
X-Received: by 2002:a05:600c:8a09:20b0:4a1:9687:bbd4 with SMTP id 5b1f17b1804b1-4a19687bdcamr7741535e9.31.1791621510074;
        Sat, 10 Oct 2026 01:38:30 -0700 (PDT)
Received: from localhost.localdomain ([2001:8a0:dd02:d000:8107:32ab:9faa:8dd7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf35930sm113847525e9.13.2026.10.10.01.38.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 01:38:29 -0700 (PDT)
From: Tito Duarte <duartito@gmail.com>
To: linux-btrfs@vger.kernel.org
Cc: fsverity@lists.linux.dev
Subject: btrfs: spurious fs-verity "FILE CORRUPTED" with large data folios (v7.2+)
Date: Sat, 10 Oct 2026 09:38:27 +0100
Message-Id: <20261010083827.27604-1-duartito@gmail.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

Since v7.2, reading fs-verity files on btrfs intermittently logs fs-verity
verification failures although the data is intact:

  fs-verity (loop0p2, inode 2980): FILE CORRUPTED! pos=1355776, level=-1,
    want_hash=sha512:8c662f97..., real_hash=sha512:2d23913d3759ef01...

The read is retried and userspace gets correct data, btrfs logs no csum
error, and a file without fs-verity on the same filesystem always reads
back correctly. Both SHA-256 and SHA-512 files are affected.

Cause
-----

end_folio_read() -> btrfs_verify_folio() calls fsverity_verify_folio(),
which verifies the whole folio; start/len are only used for the
uptodate check (fs/btrfs/extent_io.c in v7.2, unchanged in master as of
2026-10-07). With large data folios, a folio can span two extents and is
then filled by two bios. When the first bio completes, the whole folio is
hashed, including blocks the second bio has not read yet.

Large data folios came with cc38d178ff33 (v6.17-rc1, behind
CONFIG_BTRFS_EXPERIMENTAL) and became the default with 9bce95edb1b4
("btrfs: move large data folios out of experimental features", v7.2).
Neither commit is wrong in itself; they expose the whole-folio verification.
In v6.12 a data folio is one page, so whole-folio and per-block
verification are the same thing.

Evidence
--------

1. Natural occurrence, arm64 VM (Apple Virtualization, virtio-blk,
   4K pages), reproducer below, 30 mount/read cycles each:

     6.12.111 (Debian trixie)                     0 reports
     7.2.6    (Debian trixie-backports)          10
     7.2.8    (Debian testing)                   10, twice
     7.3-rc3  (Ubuntu mainline build)            10, twice
     7.2.8    (Debian) + the change below         0, three runs (90 cycles)

   On this machine real_hash was always the hash of a 4 KiB zero block
   and the failing block was always the first block of an extent (10 of
   10 checked). That fits the first bio completing first: the first
   unread block is then the start of the next extent in the folio.

2. Forced reordering, x86_64 QEMU/TCG: delaying every second read bio of
   a verity inode by 20 ms, 10 cycles each:

     9bce95edb1b4^                                  0 reports
     9bce95edb1b4                                 100
     cc38d178ff33^  (BTRFS_EXPERIMENTAL=y)          0
     cc38d178ff33   (BTRFS_EXPERIMENTAL=y)         91
     v7.2                                          99
     v7.2 + the change below                        0

   In all failures (160 logged) the folio had blocks that were not
   uptodate yet, and the failing block lay inside the folio but outside
   the range whose bio had just completed. Here real_hash was not the
   zero-block hash: the unread blocks held stale page contents.

3. Distribution kernel: openSUSE Tumbleweed kernel-default 7.2.8-1.1,
   unmodified, with dm-delay reordering reads: 13 and 12 reports in 10
   cycles. Without the delay x86_64 hits it rarely here (0 to 1 in 120
   cycles under TCG), which I attribute to TCG's timing, not to the
   architecture.

No checksum mismatches and no btrfs errors in any run.

Suggested change
----------------

Verify only the range whose read completed. Each completion then hashes
its own blocks, independent of completion order, and the folio stays
locked and not uptodate until the last range is done.

diff --git a/fs/btrfs/extent_io.c b/fs/btrfs/extent_io.c
index f032f08..6b6cf0e 100644
--- a/fs/btrfs/extent_io.c
+++ b/fs/btrfs/extent_io.c
@@ -482,7 +482,13 @@ static bool btrfs_verify_folio(struct fsverity_info *vi, struct folio *folio,
 
 	if (!vi || btrfs_folio_test_uptodate(fs_info, folio, start, len))
 		return true;
-	return fsverity_verify_folio(vi, folio);
+	/*
+	 * Only verify the range whose read just completed.  With large folios
+	 * the other blocks of the folio may belong to a different extent and
+	 * bio that has not completed yet, so verifying the whole folio here
+	 * would hash blocks that have not been read.
+	 */
+	return fsverity_verify_blocks(vi, folio, len, offset_in_folio(folio, start));
 }
 
 static void end_folio_read(struct fsverity_info *vi, struct folio *folio,

Not covered by my testing:
- Subpage: fsverity_verify_blocks() needs offset and length aligned to
  the Merkle tree block size. With a Merkle block larger than the sector
  size (e.g. 64K pages, 4K sectors, 64K Merkle blocks) a single-sector
  range is not aligned; that case would need verification deferred until
  the whole Merkle block is read.
- Compressed extents and holes (same end_folio_read() path, untested).

If the approach is right I can send it as a proper patch with a Fixes:
tag, or leave it to whoever prefers to handle the subpage case.

Reproducer (root, scratch machine; needs btrfs-progs, fsverity-utils)
---------------------------------------------------------------------

-----8<-----
#!/bin/bash
set -euo pipefail
CYCLES=${1:-30}
T=$(mktemp -d /var/tmp/btrfs-verity-repro.XXXX)
cleanup() { umount "$T/mnt" 2>/dev/null || true; rm -rf "$T"; }
trap cleanup EXIT
mkdir "$T/mnt"; truncate -s 2G "$T/img"; mkfs.btrfs -q "$T/img"; mount -o loop "$T/img" "$T/mnt"
head -c 40M /dev/urandom > "$T/src"
off=0; i=0
while [ $off -lt 10240 ]; do
  n=$(( 97 + (i * 137) % 331 ))          # 97..427 blocks: extent starts not folio-aligned
  for f in a b c; do
    dd if="$T/src" of="$T/mnt/$f" bs=4096 skip=$off seek=$off count=$n conv=notrunc status=none
    sync
  done
  off=$((off + n)); i=$((i + 1))
done
fsverity enable "$T/mnt/a" --hash-alg=sha512
fsverity enable "$T/mnt/b" --hash-alg=sha256   # c stays without fs-verity
sync
want=$(sha256sum < "$T/src" | cut -d' ' -f1)
reports=0; mismatches=0
for c in $(seq 1 "$CYCLES"); do
  umount "$T/mnt"; mount -o loop,ro "$T/img" "$T/mnt"
  dmesg -C; echo 3 > /proc/sys/vm/drop_caches
  for f in a b c; do
    [ "$(sha256sum < "$T/mnt/$f" | cut -d' ' -f1)" = "$want" ] || mismatches=$((mismatches + 1))
  done
  reports=$((reports + $(dmesg | grep -c 'FILE CORRUPTED' || true)))
done
echo "$(uname -r): $CYCLES cycles: $reports fs-verity reports, $mismatches checksum mismatches"
-----8<-----

Disclosure: I used an AI coding assistant (Claude) for parts of the
analysis, the test harness and this write-up. The numbers above are from
real runs on my machines; logs are available on request.

Thanks,
Tito Duarte
