Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795430380;
	b=as2v1hXm9kE69DygdyiBky0M786iFyPNGD9nnKu1EqHaq+Q5v7VIFjiEpipIZQgoKEQB
	 QjwNXnXOvuNfmfRiJ7WyOGMK8cl2tJRRTwr1SJAHMVt9w8O6W9eF2XIq6xvUrC5oWHgEK
	 ZYeg046EF/aLIjISj6gWfQzCUDPLzmVyLd40DZR4Ml8TAc1IzIVLNRxIQ8IHPEnMreeHa
	 S2wuP9yyt3QaV8+5kyXN00q/ddLOePtFYpi40+JLFhEFiCoVkXWqbL1n2K2T6ja2TDMW+
	 ID/bPi+eRP9y1Z/cLKOexo1ujeWEyYOBSR63dXsBZVDsNMvn97T5cZ+MBDcC4g96+HQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795430380;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=h0FT6Es5mMyx4wcsrCmmhvyIBUQTRqsrEos9y0zThvg=;
	b=bXBZizy0vdZaatWgF9M4mjTqh1/rywtVQqWd68T7BiV8/xTTgorrF35tTc323S4uWMQu
	 NJEuQJ5ekHYj46/9bJvoEIjLDjHHQz5pFh2HtqOUpP1UrI+jjy6J2y5MFqykwI9CRWOuv
	 SFuBoaQ6W2s220mM5IQaRodQ+eHJiZJWqm2PKsGzgn7UJDn/KQKYRP8XO4Q50U5VQ+UIi
	 PLKxllA0G/y0HiYsyD+W1CsmnwuuiG0DTj5UDS0JYdxvMBdoA2b2NKoVHuN/5zF91ItZ8
	 yiOlQhK3kQrHcyxMsU9OvIygaUpyatWkPxREHaN9d19yldcTT4gGHLLHhRVwy+zFNJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LEKlVDRl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A94A9606A31A;
	Mon, 23 Nov 2026 10:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LEKlVDRl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DC061F000C0;
	Mon, 23 Nov 2026 10:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795430379;
	bh=h0FT6Es5mMyx4wcsrCmmhvyIBUQTRqsrEos9y0zThvg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LEKlVDRlK2BMSpzXbUaY62tUGPxT0Ic/kuRuKXoJZ91XX0K0rtsCVPzad9ADEJt3K
	 AdxseXgsLAnOzsZOm1Yhuz1IxAxEsxIidLat70FW1WA+oKp60Amu/YM8lVf8ja8L2N
	 lz51BiYufjASk3Ynp+onW/8XfgEssbayZaGJvw+L+5EbroV1gP4x+EcaWEcceD6eYb
	 0UVi3PXtmboDcdUQC1YtO0kSkEhlSM2TcyKVAgq+Cybxwx5rgRi3fBLpXp2FdNdnFj
	 6gp9qZTbcVeM/qr43WBGjiXUr22ayMZvZjwJjm5H70tZImgwFhFgHXzghJ3gqHpaAM
	 d1laqlx8eNGTg==
Date: Mon, 23 Nov 2026 11:39:35 +0100
From: Andrey Albershteyn <aalbersh@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: sashiko-reviews@lists.linux.dev, Eric Biggers <ebiggers@kernel.org>, 
	Carlos Maiolino <cem@kernel.org>, fsverity <fsverity@lists.linux.dev>, david@fromorbit.com
Subject: Re: [PATCH v19 05/15] xfs: handle fsverity I/O in write/read path
Message-ID: <awQVBBV4en5undcp@aalbersh-thinkpadx1carbongen13.rmtcz.csb>
References: <20261120155752.192025-1-aalbersh@kernel.org>
 <20261120155752.192025-6-aalbersh@kernel.org>
 <sashiko-outbox-225565@kernel.org>
 <20261121002602.GB13395@lst.de>
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Post: <mailto:fsverity@lists.linux.dev>
List-Help: <mailto:fsverity+help@lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fsverity+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261121002602.GB13395@lst.de>

On 2026-11-21 01:26:02, Christoph Hellwig wrote:
> On Fri, Nov 20, 2026 at 04:27:02PM +0000, sashiko-bot@kernel.org wrote:
> > [Severity: High]
> > Will iomap_writeback_folio() skip dirty fs-verity metadata folios before
> > xfs_map_blocks() can set IOMAP_F_FSVERITY?
> > 
> > xfs_vm_writepages() zero-initializes wpc.ctx.iomap.flags (and
> > xc.ctx.iomap.flags on zoned filesystems), and iomap_writeback_folio()
> > calls iomap_writeback_handle_eof() before ->writeback_range() invokes
> > xfs_map_blocks().  When a dirty fs-verity folio past i_size is reached,
> > wpc->iomap.flags still lacks IOMAP_F_FSVERITY, so
> > iomap_writeback_handle_eof() returns false and the folio is skipped with
> > its dirty bit cleared and its delalloc extent unconverted.
> > 
> > Also, in xfs_zoned_map_blocks(), the non-hole path calls
> > xfs_iomap_set_anon_write(), which overwrites wpc->iomap.flags with
> > IOMAP_F_ANON_WRITE | IOMAP_F_DIRTY and drops IOMAP_F_FSVERITY.
> 
> Yeah.  This was kinda why I wondered if an inode flag would do
> better for this.

Note, I added a guard against using fs-verity on zoned in v19 for now.

Previously, I thought that zoned allocation happens in iomap_begin()
but it's obviously not, sashiko pointed out that I don't allocate
any space.

I have a patch with added branches in write path with zone
allocations (see below) but I decided to leave it out for follow-up
patchset; for this patchset to get in some mergable state. And zoned
setup probably need more testing, I just did -g verity on -r zoned.

> 
> > > +xfs_iomap_is_fsverity_metadata(
> > > +	struct xfs_inode	*ip,
> > > +	loff_t			offset)
> > > +{
> > > +	return offset >= xfs_fsverity_metadata_offset(ip) &&
> > > +	       (fsverity_is_building(VFS_I(ip)) || fsverity_active(VFS_I(ip)));
> > > +}
> > 
> > [Severity: High]
> > Does calling fsverity_is_building() here break the build?  Neither
> > linux/fsverity.h nor xfs_verity.h declares or defines
> > fsverity_is_building(), so compiling fs/xfs/xfs_iomap.c fails with an
> > implicit function declaration error.
> 
> It might make sense to include the core fs/fsverity patches in the series
> so that human and less humane reviewers have the full context.
> 

sure, will do

-- 
- Andrey

---

From 67f2300133416bda2ecfa28ab3ec01ae6e67ed5b Mon Sep 17 00:00:00 2001
From: Andrey Albershteyn <aalbersh@kernel.org>
Date: Thu, 12 Nov 2026 17:59:42 +0100
Subject: [PATCH] xfs: add zoned support to fsverity

Zoned filesystem requires special space allocation handling before
calling into iomap, which will write to page cache. Branch out for zoned
inode while writing merkle tree blocks and fsverity descriptor.

The descriptor goes the xfs_vn_setattr_size() case - allocating from the
reservation pool. This is because fsverity holds iolock while ending
enable.

Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org>
---
 fs/xfs/xfs_fsverity.c | 87 ++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 78 insertions(+), 9 deletions(-)

diff --git a/fs/xfs/xfs_fsverity.c b/fs/xfs/xfs_fsverity.c
index 36520a187a2c..cd62b5687329 100644
--- a/fs/xfs/xfs_fsverity.c
+++ b/fs/xfs/xfs_fsverity.c
@@ -19,6 +19,7 @@
 #include "xfs_health.h"
 #include "xfs_bmap_util.h"
 #include "xfs_icache.h"
+#include "xfs_zone_alloc.h"
 #include <linux/fsverity.h>
 #include <linux/iomap.h>
 #include <linux/pagemap.h>
@@ -155,6 +156,49 @@ xfs_fsverity_get_descriptor(
 	return desc_size;
 }
 
+static int
+xfs_fsverity_write_descriptor_zoned(
+	struct file			*file,
+	const void			*desc,
+	u32				desc_size,
+	u64				desc_pos,
+	u64				desc_size_pos,
+	__be32				desc_size_disk)
+{
+	struct xfs_mount		*mp = XFS_I(file_inode(file))->i_mount;
+	struct xfs_zone_alloc_ctx	ac = { };
+	int				error;
+
+	/*
+	 * TODO: this reservation runs under the IOLOCK, so it must not block on
+	 * GC (which takes the IOLOCK itself).  Use the reserved pool without
+	 * waiting, at the cost of a possible spurious -ENOSPC
+	 */
+	error = xfs_zoned_space_reserve(mp, XFS_B_TO_FSB(mp, desc_size) + 4,
+			XFS_ZR_NOWAIT | XFS_ZR_RESERVED, &ac);
+	if (error) {
+		if (error == -EAGAIN)
+			return -ENOSPC;
+		return error;
+	}
+
+	error = iomap_fsverity_write(file, desc_size_pos,
+			sizeof(desc_size_disk),
+			(const void *)&desc_size_disk,
+			&xfs_buffered_write_iomap_ops,
+			&xfs_iomap_write_ops, &ac);
+	if (error)
+		goto out;
+
+	error = iomap_fsverity_write(file, desc_pos, desc_size, desc,
+			&xfs_buffered_write_iomap_ops,
+			&xfs_iomap_write_ops, &ac);
+
+out:
+	xfs_zoned_space_unreserve(mp, &ac);
+	return error;
+}
+
 static int
 xfs_fsverity_write_descriptor(
 	struct file		*file,
@@ -179,16 +223,21 @@ xfs_fsverity_write_descriptor(
 	if (desc_size_pos + sizeof(desc_size_disk) > inode->i_sb->s_maxbytes)
 		return -EFBIG;
 
+	if (xfs_is_zoned_inode(ip))
+		return xfs_fsverity_write_descriptor_zoned(file, desc,
+				desc_size, desc_pos, desc_size_pos,
+				desc_size_disk);
+
 	error = iomap_fsverity_write(file, desc_size_pos, sizeof(__be32),
 			(const void *)&desc_size_disk,
 			xfs_buffered_write_iomap_next,
-			&xfs_iomap_write_ops);
+			&xfs_iomap_write_ops, NULL);
 	if (error)
 		return error;
 
 	return iomap_fsverity_write(file, desc_pos, desc_size, desc,
 			xfs_buffered_write_iomap_next,
-			&xfs_iomap_write_ops);
+			&xfs_iomap_write_ops, NULL);
 }
 
 /*
@@ -293,12 +342,6 @@ xfs_fsverity_begin_enable(
 	if (ip->i_mount->m_sb.sb_blocksize > PAGE_SIZE)
 		return -EOPNOTSUPP;
 
-	/*
-	 * fs-verity doesn't work on zoned
-	 */
-	if (xfs_is_zoned_inode(ip))
-		return -EOPNOTSUPP;
-
 	/*
 	 * fs-verity stores the Merkle tree past EOF in units of the filesystem
 	 * block size, so it cannot support realtime files whose allocation unit
@@ -470,6 +513,28 @@ xfs_fsverity_is_hashes_of_zeroed_blocks(
 	return memcmp(buf + digest_size, buf, size - digest_size) == 0;
 }
 
+static int
+xfs_fsverity_write_merkle_zoned(
+	struct file			*file,
+	loff_t				pos,
+	unsigned int			size,
+	const void			*buf)
+{
+	struct xfs_mount		*mp = XFS_I(file_inode(file))->i_mount;
+	struct xfs_zone_alloc_ctx	ac = { };
+	int				error;
+
+	error = xfs_zoned_space_reserve(mp, XFS_B_TO_FSB(mp, size) + 2, 0, &ac);
+	if (error)
+		return error;
+
+	error = iomap_fsverity_write(file, pos, size, buf,
+			&xfs_buffered_write_iomap_ops, &xfs_iomap_write_ops,
+			&ac);
+	xfs_zoned_space_unreserve(mp, &ac);
+	return error;
+}
+
 /*
  * Write a merkle tree block.
  */
@@ -494,9 +559,13 @@ xfs_fsverity_write_merkle(
 						    digest_size))
 		return 0;
 
+	if (xfs_is_zoned_inode(ip))
+		return xfs_fsverity_write_merkle_zoned(file, position, size,
+				buf);
+
 	return iomap_fsverity_write(file, position, size, buf,
 			xfs_buffered_write_iomap_next,
-			&xfs_iomap_write_ops);
+			&xfs_iomap_write_ops, NULL);
 }
 
 const struct fsverity_operations xfs_fsverity_ops = {
-- 
2.54.0

