Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DE2A3EDACB
	for <fsverity@lists.linux.dev>; Thu,  2 Apr 2026 14:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775141263; cv=none; b=PfasT/ntlPv1E16PDq4oSwyhk3xdgS4nd8uSdiXqG+ZOP9mTl1/+2kTzdTbpxEoUtr8hS5uFEWt/U7jrGXuLc3uZ4YM/YYPYfsbvQm3Ib5PfOjg8CrdWOWI8m2eJ/twq43fVpxaPVxvkONvuuL5amcq+kY/18iBzDk98f4MCaCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775141263; c=relaxed/simple;
	bh=2WZAl71Kpx10jrC0rD91KnwDq7ibd6Y9Z5cgd6zClas=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=bHlGYby21+EWaBhDJRdsRbC/AOvijq6LZNHdb256I9hv98IWSHyQpAG6o2v5Tx32wnTbWvcurpu3+iXnxdeKd0oa5GsRlh5s7sJhwuVd33p4qKK7+HODGV8efh1y/zJd2fSTifp2GyGWpZXXBHiU4ZYx2sGhFxmfO9gnIpzrnOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dYo54LlP; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dYo54LlP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775141260;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1BejI4IFPYpJVG1OzBmEzwBIMK85H2fS4YLiIwk6ibs=;
	b=dYo54LlPDnZwBDZoNt+tUHoDoaJztI6Ob12fwxTxvPHV3b7DHlCJSFvukjB0kRS90Bp0MD
	fRZitLg+Old3yOF3zXUnHTMzt44E8z+P6lV7gnC0JNz4pU3Sg8QCknzfdY0dq5EtfCYyai
	Czo78/kP17gX3aMr1Kf7kxrL3N/hRk4=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-452-b_K5u2H8NYKcPR7irBJWoA-1; Thu, 02 Apr 2026 10:47:37 -0400
X-MC-Unique: b_K5u2H8NYKcPR7irBJWoA-1
X-Mimecast-MFC-AGG-ID: b_K5u2H8NYKcPR7irBJWoA_1775141256
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-66aab34ff9cso1206084a12.0
        for <fsverity@lists.linux.dev>; Thu, 02 Apr 2026 07:47:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775141256; x=1775746056;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1BejI4IFPYpJVG1OzBmEzwBIMK85H2fS4YLiIwk6ibs=;
        b=O9xGYZVmmti7UXl8z3yNUa/zhcswszs7/TnZSVLc1pHYKk5fj14pW9Jl3mRUhAQ+7O
         b+W17P37YxnTsitbTGE3D9092dqyhEhDTi3e7TwvAuJPgkw235KBtBAgjGCpvHw0aE6I
         b4mfvTeaHgz8i2mLzyT8pE6Wm27uTdlibRCKyb2qUkHEXRLU1gc4BuHh1ae0WiP3B5x+
         Tmq7GCK93WS6SbGOoajMDsWew9KtCYP5+o84Kmn4nPQ/HnLkxyfxSTF+2Z5M0HVkhgQa
         nez866tzjrcvlZqlsiBwhKKakWfXzdVdTxFpmIxmLm/OgTsvyvnJRqKpEgRrQGiQeCMx
         lLDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfucT5E9/RQrEuecwWcEG7i/PAjhJBtfG8iJB4gNQOk8uP28zOZ7tTA3zZc21LukNwH26RZbSMaw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxFou+5eMKkxFqpsLczeOdN2Gq/KSuMj3C6hQrhgJuEgYcXqANf
	0sD/Z2PvHETL6IISCezM5nbDgNLWak6P/3mcn4XvYgvMcNbAlcq5K6zbA9Sd87a2MBJ99wMKbJl
	+kVZoWYU4B7E2PwbT8zFCcQvWF8ZSAhnfvOEbmdcQ03mz9T/+vDBRTleDmGw=
X-Gm-Gg: AeBDietxk3X0n1lS+agn4pSrMNhlapAjS8Q5mqHoka0wJCahHlGS/WIL2PzDJhcFSGG
	TpkSlb+G/7bI9se+SGQt8cnnLpxeyKCgm+v/ibcmYbxv3ftB4iQuicpZ9AM1fMvzcrXRY7AkBqv
	inzfIztxzoAJIju3F9IUBm07pMTRRWqIeByPcgx4tY7XTIGSf2AdUMjmkI/jqcz+PKH6ygNnOiI
	nZmXQND9EVOBDKdlvo768szoXKc8zg1nPtDHA+HxxZ5zCoUvwIKAckU/HnM+LfgccR6OTaK7siG
	ILrGDPatzkOIIBKqCd/jMndIUti3kikJWdkWlxxquoQ9WwJDEultJcJhvqvtHomtaB9Go07foXg
	rWUGHfkQASrRx3w==
X-Received: by 2002:a05:6402:4349:b0:66e:3754:618a with SMTP id 4fb4d7f45d1cf-66e3754684dmr8250a12.22.1775141255751;
        Thu, 02 Apr 2026 07:47:35 -0700 (PDT)
X-Received: by 2002:a05:6402:4349:b0:66e:3754:618a with SMTP id 4fb4d7f45d1cf-66e3754684dmr8227a12.22.1775141255235;
        Thu, 02 Apr 2026 07:47:35 -0700 (PDT)
Received: from thinky ([91.245.205.131])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66e033b9df1sm812760a12.21.2026.04.02.07.47.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 07:47:34 -0700 (PDT)
Date: Thu, 2 Apr 2026 16:47:33 +0200
From: Andrey Albershteyn <aalbersh@redhat.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Andrey Albershteyn <aalbersh@kernel.org>, linux-xfs@vger.kernel.org, 
	fsverity@lists.linux.dev, linux-fsdevel@vger.kernel.org, hch@lst.de, 
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
	linux-btrfs@vger.kernel.org, djwong@kernel.org
Subject: Re: [PATCH v6 03/22] fsverity: generate and store zero-block hash
Message-ID: <cw2kmcrrd6a3rsk37jnchxxom565nzn64f6u7h56dozqa42z6e@zrxdtpdg25ie>
References: <20260331212827.2631020-1-aalbersh@kernel.org>
 <20260331212827.2631020-4-aalbersh@kernel.org>
 <20260401222717.GH2466@quark>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260401222717.GH2466@quark>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: kkGT2AgwYSvBQtnM14J69AkNUHUMjgvXG60M5NqbOkA_1775141256
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2026-04-01 15:27:17, Eric Biggers wrote:
> On Tue, Mar 31, 2026 at 11:28:04PM +0200, Andrey Albershteyn wrote:
> > Compute the hash of one filesystem block's worth of zeros. A filesystem
> > implementation can decide to elide merkle tree blocks containing only
> > this hash and synthesize the contents at read time.
> > 
> > Let's pretend that there's a file containing six data blocks and whose
> > merkle tree looks roughly like this:
> > 
> > root
> >  +--leaf0
> >  |   +--data0
> >  |   +--data1
> >  |   `--data2
> >  `--leaf1
> >      +--data3
> >      +--data4
> >      `--data5
> > 
> > If data[0-2] are sparse holes, then leaf0 will contain a repeating
> > sequence of @zero_digest.  Therefore, leaf0 need not be written to disk
> > because its contents can be synthesized.
> > 
> > A subsequent xfs patch will use this to reduce the size of the merkle
> > tree when dealing with sparse gold master disk images and the like.
> > 
> > Add a helper to pre-fill folio with hashes of empty blocks. This will be
> > used by iomap to synthesize blocks full of zero hashes on the fly.
> > 
> > Signed-off-by: Darrick J. Wong <djwong@kernel.org>
> > Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org>
> > ---
> >  fs/verity/fsverity_private.h |  3 +++
> >  fs/verity/open.c             |  3 +++
> >  fs/verity/pagecache.c        | 22 ++++++++++++++++++++++
> >  include/linux/fsverity.h     |  8 ++++++++
> >  4 files changed, 36 insertions(+)
> 
> Acked-by: Eric Biggers <ebiggers@kernel.org>
> 
> The example given in the commit message is a bit misleading, though.
> Usually there are actually 128 hashes per block, and a block of hashes
> covers 512 KiB.  So this optimization applies only where there is a hole
> in the file's data of size (at least) 512 KiB, aligned to the same
> amount.
> 
> It's also worth noting that this optimization is being done only for the
> first level.  The levels above that are still being stored.  So, this
> doesn't really enable e.g. exabyte sized sparse regions, as a block will
> still be stored for each 64 MiB (instead of every 512 KiB).
> 
> I'm okay with this if you want to do this, but I just want to make sure
> its limitations are well-understood.

Sure, I will fix the example and add a note that this is only for
data level. 

I think for higher levels it could be later added transparently.
Old tree blocks will be read by iomap if exist, and for new format
block will be generated.

-- 
- Andrey

> 
> > +	/* the hash of a merkle block-sized buffer of zeroes */
> > +	u8 zero_digest[FS_VERITY_MAX_DIGEST_SIZE];
> 
> "the hash of an all-zeroes block" would be clearer.  This is the hash
> from fsverity_hash_block() which includes the optional salt, not the
> hash from fsverity_hash_buffer() which does not include the salt.
> 
> > +/**
> > + * fsverity_fill_zerohash() - fill folio with hashes of zero data block
> > + * @folio:	folio to fill
> > + * @poff:	offset in the folio to start
> > + * @plen:	length of the range to fill with hashes
> 
> Maybe go with (len, offset) for consistency with
> fsverity_verify_blocks().  (I assume the "p" prefix stands for "page",
> which is misleading since this works with a folio.)
> 
> > +void fsverity_fill_zerohash(struct folio *folio, size_t poff, size_t plen,
> > +			      struct fsverity_info *vi)
> > +{
> > +	size_t offset = poff;
> > +
> > +	WARN_ON_ONCE(!IS_ALIGNED(poff, vi->tree_params.digest_size));
> > +	WARN_ON_ONCE(!IS_ALIGNED(plen, vi->tree_params.digest_size));
> > +
> > +	for (; offset < (poff + plen); offset += vi->tree_params.digest_size)
> > +		memcpy_to_folio(folio, offset, vi->tree_params.zero_digest,
> > +				vi->tree_params.digest_size);
> 
> This could be done more efficiently, especially on HIGHMEM.  Probably
> fine for now though, especially since the intersection of anyone wanting
> XFS && fsverity && HIGHMEM is likely to be extremely small.
> 
> - Eric
> 

