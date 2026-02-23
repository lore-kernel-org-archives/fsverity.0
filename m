Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E0A2EB0F
	for <fsverity@lists.linux.dev>; Mon, 23 Feb 2026 13:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771853067; cv=none; b=sif5AaNOS9sj3I7DbqtRJEuqKHRKygCNFMJk/JFwCyCIFouQKPUI5dKz4qD3PA7ZXhdpY/f2mUoZuJn2NUHSLuj8eRkK0NZhlZDjw2pvKbUbo/iD9yRhf/VQ1PUKSYnGgBJ7v6c9CbueYTfx8l7pOecIXVhrLZYzx8hxizqjj5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771853067; c=relaxed/simple;
	bh=poGA6bo1jLXsV/w23+mdRU7Cm6PVshK+XcjhPgUMDlM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=S9FcGZUZb/jUxSSlGxa2RKzfE4OB9EwSsRfWweY6mO0rRtaBYDfUddEcjWWZ9lyIZgCNWJNr2WAsZcvHw6mgV+dXT68V73RIOIWu2aumq1X7lefaAr/3KKFg0ef0gMl6/zbGoG72uJjx7sTnN6WCxmqxKh0Nor/bo1fjrvg9QUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fKhxjY68; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fKhxjY68"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771853065;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ksBMn2vFs5bfQS6gxZSFoOu9S+2Bm4FmVN3N5GLrC7g=;
	b=fKhxjY68o5vEz0x9vVoXuHvjrrL6OU9jNXF7EnLdwV3+M/4mKuw1yheLV+YilMWq/YillJ
	/X7UWtPMfx2YLpqEW2+pgBzfgFn2pWok0LtnT9F0l179SI6AmQeG1NsK1Lillzr3tTfuQG
	ZLPHp6hD5r8h+C/rHMj0GigUXFXXIIU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-567-G2sneoi1NKy9BWIEnbQcqw-1; Mon, 23 Feb 2026 08:24:24 -0500
X-MC-Unique: G2sneoi1NKy9BWIEnbQcqw-1
X-Mimecast-MFC-AGG-ID: G2sneoi1NKy9BWIEnbQcqw_1771853063
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4836bf1a920so45857385e9.3
        for <fsverity@lists.linux.dev>; Mon, 23 Feb 2026 05:24:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771853063; x=1772457863;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ksBMn2vFs5bfQS6gxZSFoOu9S+2Bm4FmVN3N5GLrC7g=;
        b=qARjVdxrs70M8kY26jIyPGm4hYfd9cdaNlnWUmACfWlR9nue9w2f96EYAoUZSrPltl
         4WZEvjyD/BeNqi9Uy5o0Lj36eurbTEgRGvuNV3ZMl/Pohdyo/3wZLj9/HxCwTNaKF1O8
         2J29qcWRPbAqz+eUbYfXQwnv7zafSgPBtXaHxAAy2fq7g+i8XjmmnCE0iqbo591KQMjI
         WyzI8ztU3TvDo2exMjpIoqMUESSYuRTTBzsXavs+2mg9Ga4seB7dKGNo9sIc4ffgXsRa
         U04+pHsbTkzGw/CR9mfET3Hc47fHruErII2Qx9bEoHrMA0BBN8SPt8vUC7hkwyJYHv9W
         JRNA==
X-Forwarded-Encrypted: i=1; AJvYcCV0Av4/ZxR/I0TMFMYTl0/85ugIm5+Zz9sDHq6SnkOC2J/HW70yooqCfWPBu7O9JqQgqIVHC52W8g==@lists.linux.dev
X-Gm-Message-State: AOJu0YzND3O7dbQp+/6mE0ZM1qRajJZGEMaWZ8knQSkHm9rQk67AUSC3
	FoFNm4PI6JPnq6LbolnLUFDmzYjHxGBYpe3JSv+TGdAoB8WSELZwJTjf1xVHYWmqiU8H5Cz3Tnb
	AQUFRVIij7FQRlldWjwolLHxKeSg5bw0mkA3xqUMm3coBnkZdZI0mWnAk+w4=
X-Gm-Gg: AZuq6aIv5p7ZQSUqnWMxTyq2KjtCqGcJXRYem6Yi61HdXYI7yFBK0//nsblC9j3+QDh
	d9jotidApla9iwOkHvniTjsS96qWh5wD4rqFPO8rZ1yhNEiE8Yt7LGPBk4TM9Xh1w5IgDYypbHK
	8O2h51wJsj/6EiFSuYv3v3AETLrWzXRBTNxqkO9zi0Cn3c1xWUgqkufS4ciYelOgwUp/7eHA1o+
	aYL2RbBq1nX0+2P46wk4uCSP1waD747TbutYyr5rBSczCddoqn4IERmXt6E9sFAKxm8NjOxP9u/
	nmk59dYnR90g/PT4RZ9aigcpgfKO4Iwmz7Gua24u5gZaVyNdK02dwNRzS2w3utVaobfrl9UrQMr
	kB6P5V08AisM=
X-Received: by 2002:a05:600c:1f8f:b0:480:4a4f:c363 with SMTP id 5b1f17b1804b1-483a95fb25dmr151444925e9.9.1771853062833;
        Mon, 23 Feb 2026 05:24:22 -0800 (PST)
X-Received: by 2002:a05:600c:1f8f:b0:480:4a4f:c363 with SMTP id 5b1f17b1804b1-483a95fb25dmr151444465e9.9.1771853062370;
        Mon, 23 Feb 2026 05:24:22 -0800 (PST)
Received: from thinky ([217.30.74.39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a42cd49fsm122198985e9.5.2026.02.23.05.24.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 05:24:21 -0800 (PST)
Date: Mon, 23 Feb 2026 14:23:51 +0100
From: Andrey Albershteyn <aalbersh@redhat.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, 
	Andrey Albershteyn <aalbersh@kernel.org>, linux-xfs@vger.kernel.org, fsverity@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, djwong@kernel.org
Subject: Re: [PATCH v3 06/35] fsverity: pass digest size and hash of the
 empty block to ->write
Message-ID: <gjehtg6itdgjysiksqmccrelsqev7so7366zmfer62tgse7u6d@2kucmtmrfq2t>
References: <20260217231937.1183679-1-aalbersh@kernel.org>
 <20260217231937.1183679-7-aalbersh@kernel.org>
 <20260218061834.GB8416@lst.de>
 <wl5dkpyqtmbdyc7w7v4kqiydpuemaccmivi37ebbzohn4bvcwo@iny5xh3qaqsq>
 <20260219055857.GA3739@lst.de>
 <20260219063059.GA13306@sol>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260219063059.GA13306@sol>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: WhPHpdQmiS960RC4yPq10UyjIqlp1fjfVDJz7u-KSdA_1771853063
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2026-02-18 22:30:59, Eric Biggers wrote:
> The hash could be stored in that same allocation for salted files, or as
> a fixed value in struct fsverity_hash_alg for unsalted files.  Then at
> least unsalted files wouldn't use any additional memory per-file.
> 
> - Eric

Hmm, but fsverity_hash_alg is global const, and anyway we will
always have merkle_tree_params::hash_alg::zero_digest as fixed space
for salted/unsalted.

-- 
- Andrey

