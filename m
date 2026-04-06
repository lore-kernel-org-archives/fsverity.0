Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA9EF221FB1
	for <fsverity@lists.linux.dev>; Mon,  6 Apr 2026 06:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775456400; cv=none; b=QfNu14WFQKJR+heLEcTP7dfsjVkQEeD/JmDAYnfAyMgbRkv0ntJE1CtMag9AHeX6XmP7j1W4strO7BJd8b4AMEjdNeG0dAMqwtyO5Ia5OOQRon10rqiJKJXDuWALZ+5cOFkWW3sXSy+FCVOWc4TM5AJGuX2f74rT6I/nHtVjoQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775456400; c=relaxed/simple;
	bh=2+trm8Zl+dWtk8aL48cu6TiHlddR4E78eoE+JrXMaDE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GbQE4Af5LnwUaBffxLTSwJ+x434SVj0ivEKerprhH9j85wEzC+udfhxTABo0XjJgApJeds10mjU9wBzpeP/VCSbApeRZuMvx6ARWtoFFbljey8tVAoRVrnQKsPnv92kC04PY7MzYXTEet1HFfJf0L/r2cs+Je+vcpqmI5Q2zvl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id CF06A68BFE; Mon,  6 Apr 2026 08:19:55 +0200 (CEST)
Date: Mon, 6 Apr 2026 08:19:55 +0200
From: Christoph Hellwig <hch@lst.de>
To: Matthew Wilcox <willy@infradead.org>
Cc: fsverity@lists.linux.dev, Eric Biggers <ebiggers@kernel.org>,
	"Theodore Y. Ts'o" <tytso@mit.edu>, aalbersh@kernel.org
Subject: Re: fsverity and large folios
Message-ID: <20260406061955.GH16443@lst.de>
References: <adM9g5jgxzG_NvgI@casper.infradead.org>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <adM9g5jgxzG_NvgI@casper.infradead.org>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Mon, Apr 06, 2026 at 05:58:43AM +0100, Matthew Wilcox wrote:
> I suspect that fsverity simply doesn't support large folios today.

I tried that with btrfs, which (before the xfs patchset currently
pending), and it does indeed seem to lead to a quick assert hitting
when running the verity group in xfstests.  So we should prevent this
from mounting before it gets fixed one way or another:


generic/572        [   88.967330] run fstests generic/572 at 2026-04-06 06:16:47

[snip]

[   90.355104] page: refcount:1 mapcount:0 mapping:0000000000000000 index:0x7fe9a1264 pfn:0x113f65
[   90.355697] memcg:ffff88810081bc80
[   90.355921] flags: 0x4000000000000001(locked|zone=2)
[   90.356537] raw: 4000000000000001 0000000000000000 dead000000000122 0000000000000000
[   90.357061] raw: 00000007fe9a1264 0000000000000000 00000001ffffffff ffff88810081bc80
[   90.357547] page dumped because: VM_BUG_ON_FOLIO(folio_order(folio) < mapping_min_folio_order(mapping))
[   90.358132] ------------[ cut here ]------------
[   90.358417] kernel BUG at mm/filemap.c:858!
[   90.358734] Oops: invalid opcode: 0000 [#1] SMP NOPTI
[   90.359046] CPU: 1 UID: 0 PID: 436 Comm: kworker/u8:4 Not tainted 7.0.0-rc5+ #4020 PREEMPT(full) 
[   90.359583] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[   90.360165] Workqueue: btrfs-endio simple_end_io_work
[   90.360499] RIP: 0010:__filemap_add_folio+0x4e2/0x560
[   90.360832] Code: 4c 89 ff e8 90 63 04 00 0f 0b 48 c7 c6 88 6f f5 82 4c 89 ff e8 7f 63 04 00 0f 0b 48 c7 c6 b8 6f f5 82 4c 89 ff e8 6e 63 04 00 <0f> 0b 48 c7 c6 78 dd f3 82 4c 89 ff e8 5d 63 04 00 0f 0b 48 c7 c6
[   90.361981] RSP: 0018:ffffc90001303828 EFLAGS: 00010246
[   90.362358] RAX: 000000000000005b RBX: 0000000000000c40 RCX: 0000000000000000
[   90.362861] RDX: 0000000000000000 RSI: 0000000000000001 RDI: 00000000ffffffff
[   90.363313] RBP: 0000000000000000 R08: 00000000fffeffff R09: ffffffff837fa9e8
[   90.363768] R10: ffffffff8327aa40 R11: 6d75642065676170 R12: 0000000000000000
[   90.364233] R13: 0000000000000c40 R14: 0000000000000020 R15: ffffea00044fd940
[   90.364711] FS:  0000000000000000(0000) GS:ffff8885a7678000(0000) knlGS:0000000000000000
[   90.365234] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   90.365608] CR2: 00007fac03af5030 CR3: 0000000103f54004 CR4: 0000000000770ef0
[   90.366059] PKRU: 55555554
[   90.366232] Call Trace:
[   90.366390]  <TASK>
[   90.366528]  ? ret_from_fork+0x19e/0x240
[   90.366801]  ? unwind_get_return_address+0x1e/0x40
[   90.367098]  filemap_add_folio+0xe7/0x270
[   90.367348]  btrfs_read_merkle_tree_page+0x1a1/0x3d0
[   90.367653]  verify_data_block+0xf2/0x700
[   90.367903]  ? ret_from_fork_asm+0x1a/0x30
[   90.368162]  ? stack_depot_save_flags+0x29/0x850
[   90.368464]  ? set_track_prepare+0x45/0x70
[   90.368731]  ? kmem_cache_alloc_noprof+0x2fd/0x370
[   90.369036]  ? alloc_pid+0xc1/0x490
[   90.369242]  ? copy_process+0x116f/0x1af0
[   90.369500]  ? kernel_clone+0x93/0x3f0
[   90.369737]  ? read_extent_buffer+0xde/0x150
[   90.370000]  ? check_root_key+0x39/0xd0
[   90.370240]  ? read_extent_buffer+0xde/0x150
[   90.370612]  ? kernel_fpu_begin_mask+0x89/0x140
[   90.370930]  fsverity_verify_pending_blocks+0x68/0xf0
[   90.371276]  fsverity_add_data_blocks+0xd1/0xf0
[   90.371577]  fsverity_verify_blocks+0x4b/0xb0
[   90.371870]  ? check_inode_key+0x39/0xd0
[   90.372126]  ? read_extent_buffer+0xde/0x150
[   90.372419]  end_folio_read+0x148/0x1b0
[   90.372675]  end_bbio_data_read+0xfb/0x4c0
[   90.372946]  ? update_irq_load_avg+0x42/0x4e0
[   90.373210]  btrfs_check_read_bio+0x3f4/0x440
[   90.373475]  ? _raw_spin_unlock+0x13/0x30
[   90.373720]  ? finish_task_switch.isra.0+0x8b/0x240
[   90.374016]  ? __schedule+0x493/0xef0
[   90.374242]  process_one_work+0x177/0x390
[   90.374479]  worker_thread+0x1bc/0x330
[   90.374717]  ? __pfx_worker_thread+0x10/0x10
[   90.374976]  kthread+0xfe/0x140
[   90.375164]  ? __pfx_kthread+0x10/0x10
[   90.375384]  ret_from_fork+0x19e/0x240
[   90.375604]  ? __pfx_kthread+0x10/0x10
[   90.375823]  ret_from_fork_asm+0x1a/0x30
[   90.376053]  </TASK>
[   90.376194] Modules linked in:
[   90.376402] ---[ end trace 0000000000000000 ]---
