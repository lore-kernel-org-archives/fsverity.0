Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 142AB4D7D46
	for <fsverity@lists.linux.dev>; Tue, 22 Sep 2026 09:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790068444; cv=none; b=uqEE+OWDxCLlbiog8tXvRQLnv6A3J7onA0rzxgydMV4NdFhVJrh7sR3PLoqC6g2F9ebj9qvcdpI2uYyUlKszqZW2X1hYNWViGKDtUTfWvO31ERRbVjelN+D9I9Z/Bt7ZTcXnePVRZqBjkKk+ANv0L/OaU6bWsMN4IGcLmo/nzps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790068444; c=relaxed/simple;
	bh=x6HQo2Ql98Umszl1bLbKyaBGyakHflH2Y/8sgqKcP6M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=T92gdoAMnFngORFee28xdldiDqnzZjb1Es/ZlbezmjWcYatpq4RFp1C41i3JirsSab4g8UROSprVWGKp9h2KGstu+VrhI+J4c8jagvpEJFqXfCb+p19dNqVkN3VBIAcrhSVld4/Op3f7zKe1p3OqlbQBrvPiZxvrIvaI1gs43qE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Co2ZpJic; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Co2ZpJic"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790068441;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=o4baz/6RzxjMCiX3WhcQq7uKFgXpKloXgi45FkMIoFs=;
	b=Co2ZpJicJ4F5BcyG2VOFJZWYlyFq4OBhpJAHkxr+IDKBA3OF0gEWb4y04jYxuJheE9qo9e
	xn/wCu4j5eSIVn0v5cQTqUD3EKbQLDFcVmRenbDpM9APoseYHTbL8axr52LumsbBhp9Y6X
	xsvvDNYqW7RGjnlfFjLYazRdiPaasr8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-633-P3b_KksIN7aP7wT_uuzq0g-1; Tue, 22 Sep 2026 05:14:00 -0400
X-MC-Unique: P3b_KksIN7aP7wT_uuzq0g-1
X-Mimecast-MFC-AGG-ID: P3b_KksIN7aP7wT_uuzq0g_1790068439
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-490a767b782so30873855e9.2
        for <fsverity@lists.linux.dev>; Tue, 22 Sep 2026 02:13:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790068439; x=1790673239;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o4baz/6RzxjMCiX3WhcQq7uKFgXpKloXgi45FkMIoFs=;
        b=JSmmCaAuqoiInDH/+lPkZEktdZOt+BlmWJ50oKYXcVnxq1lAdx6VsZs86tf9IFTHTI
         0o1nM4qWAsmeos+X81kaK1zzUxVDxh89FrYXs/W1p7K9axLdTOsX4wiF88aI2mvtk6aA
         OJdb5oI31kiQqnU3yYz2mPbrQ2eUnp+w/F5FtzHNwKyfNJrxKWGPtE+NPJY2/UsjV2k3
         G7I6MCU8gvRBAZMlfpLZJnGmfUMB9VlFaf1GykspC/FeZsnltliWrQhx03kfJVy/rr4p
         uxPlU/mq/2XZiKHztc1of0KHaHjKcPCYAeN2T2Y8S1e7lw1U7uxtNDF2sL1gQk5EN3/L
         s4Qg==
X-Forwarded-Encrypted: i=1; AKwUvByXVuSheaGuJK2/Fq5CBdJst405N5KVLbALp0gwgI324Bm3Qr5e+R9EgqIMBSg3TDg7TN//V7IaiA==@lists.linux.dev
X-Gm-Message-State: AFuF++kD0n0T/+ag6wyvKia2BgrSO9OXeXYyvcb47O9qLGEw4XqSOId+
	ZvqTqGNZVrwryBJ1h6pBdfLRQ4zEsgXQiQdGkH8p2VDNJYyIdqh0VzIAiMmxKmTX74qIzz7RC/C
	il16A9iBAz32VowwmB8jcnsO1JTz0HUN0BCnhV5oTvaZv+/lWNxFT39gyIVU=
X-Gm-Gg: AYBFou2dophCCvTww1QQb4ZZp9C/UtKjIjypcuk1Tx7QwmIr3ktEvaf0YnqyOJfPQYM
	0ICicDDXEZFA9p/YILDmYEXOWlSLwB3BPUKc3qK6D2oVrFSybJgHg4Zmf8cB/EbxYxItPeTMhqC
	0ceK3MDBERcf0Bne5FW5GlXgz+Z5eiNi5W2hFlzqgda8Dmkdt8zGNf3Mo1d3yr6mRzvVtKVj9Nl
	PY46qUQeZaIhnpR7dRFj/vxaG6SVMGuI7+Ejgu/bUEhgN6dgO8khJreKhe/YcecVD4lRMLd9eZ+
	2VmP4WUEYSS1KuHQNQXGmj9w0/LfNVsg3kZHlUdVGxN58GQrhbgqCDiDaANaWBI/z3In+CMO1vv
	LevJHGyNlqhc5yd9+ZLszVFWFPsft2MjMaw==
X-Received: by 2002:a05:600c:46c7:b0:49e:7a00:b9a5 with SMTP id 5b1f17b1804b1-49fc56dbb20mr184454735e9.4.1790068438843;
        Tue, 22 Sep 2026 02:13:58 -0700 (PDT)
X-Received: by 2002:a05:600c:46c7:b0:49e:7a00:b9a5 with SMTP id 5b1f17b1804b1-49fc56dbb20mr184454405e9.4.1790068438389;
        Tue, 22 Sep 2026 02:13:58 -0700 (PDT)
Received: from aalbersh-thinkpadx1carbongen13.rmtcz.csb ([217.30.74.39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fdaa4e47csm74372105e9.1.2026.09.22.02.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 02:13:58 -0700 (PDT)
Date: Tue, 22 Sep 2026 11:13:57 +0200
From: Andrey Albershteyn <aalbersh@redhat.com>
To: Christoph Hellwig <hch@infradead.org>
Cc: Andrey Albershteyn <aalbersh@kernel.org>, djwong@kernel.org, 
	ebiggers@kernel.org, Carlos Maiolino <cem@kernel.org>, fsverity@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, linux-xfs@vger.kernel.org, linux-unionfs@vger.kernel.org, 
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
	linux-btrfs@vger.kernel.org, david@fromorbit.com
Subject: Re: [PATCH v16 12/21] xfs: use read ioend for fsverity data
 verification
Message-ID: <arJFUV3WDkY6zmfD@aalbersh-thinkpadx1carbongen13.rmtcz.csb>
References: <20260918111539.1003439-1-aalbersh@kernel.org>
 <20260918111539.1003439-13-aalbersh@kernel.org>
 <arIrtgZ3-9zNuru_@infradead.org>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <arIrtgZ3-9zNuru_@infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7F1Eo0rhNvkaCexu1jFq9bJejRks3Uo-6Ifsu0SUYr4_1790068439
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2026-09-22 00:18:14, Christoph Hellwig wrote:
> On Fri, Sep 18, 2026 at 01:15:24PM +0200, Andrey Albershteyn wrote:
> > +	if (IS_ENABLED(CONFIG_FS_VERITY) && !error && ioend->io_vi &&
> > +			xfs_fsverity_is_file_data(ip, ioend->io_offset)) {
> > +		if (ioend->io_flags & IOMAP_IOEND_INTEGRITY) {
> > +			fsv_ioend = kmem_cache_zalloc(xfs_fsverity_ioend_cache,
> > +					GFP_KERNEL);
> > +			if (!fsv_ioend) {
> 
> This needs a mempool to be deadlock safe.
> 
> > +				iomap_finish_ioends(ioend, -ENOMEM);
> > +				return;
> > +			}
> > +			fsv_ioend->ioend = ioend;
> > +			INIT_WORK(&fsv_ioend->work, xfs_end_fsverity_io_read);
> > +
> > +			fsverity_enqueue_verify_work(&fsv_ioend->work);
> > +			return;
> > +		}
> > +
> > +		fsverity_verify_bio(ioend->io_vi, &ioend->io_bio);
> > +		error = blk_status_to_errno(ioend->io_bio.bi_status);
> 
> And I think you always need to do the offload because fsverity can
> synchronously read metadata.
> 

hmmm not sure what case you see here.

Without integrity:
For data reads we get here. Here, while verifing data page, fsverity
requests reads of merkle tree pages which WILL NOT go through this
path as no read completion is done for them.

With integrity:
For data reads we get here. Here, while verifing data page, fsverity
requests reads of merkle tree pages which WILL go through this
path as they need integrity verification on the read completion.
Therefore, to use this workqueue for merkle tree pages integrity
verification we offload data block verification to fsverity
workqueue.

-- 
- Andrey

