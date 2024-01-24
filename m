Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 127A8135403
	for <fsverity@lists.linux.dev>; Wed, 24 Jan 2024 23:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706137336; cv=none; b=T0ZfvYUY9x/H7l7j0Quq0rN89nskpzXJBsnMIEh4JoVMA9oBP3lDjvMzWSYhL8SQugnNtH76Bs7LdmE8aM+/Y5gqKcqRhxLj+HhuJCRdPuL7bQIIk8hN4KMoWqGcFkbI5wgdl3WjitfDbUMG54qyOrUffvSkslKrE+hQPtDWV5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706137336; c=relaxed/simple;
	bh=WvD7e0ey6HmK3gMv+emqLRWleqhbr1GXBa+zIBnYWL8=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e6z0aWUwSSd3KxA43tcHglrRFxlFj5Jf3L0yEyZWrbxmca4FLeLYfQkivWgqYnV7sb/ZRctHgjzpGP8Zdv5hJNAWI4BVku3eAyj9aQjgTQKQbW6msg+BKGyL10flT0CN6y89hEHai+uZL9SAsoAkPT/4OPYuz3ZVM+24u/CQtSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=O3Ppw5JM; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="O3Ppw5JM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706137333;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=0rKPE/eCaHAoWTpX9KKeWOJqFB7BrZqi03vC9EX4pj0=;
	b=O3Ppw5JM8eO7B4jvaAlKROSrNzCgewdWKO4FSoRY2IbE+NtJkvGATrtx6FIxTg8Ps0QEtj
	9jeqofacIzRA+eZQKdGGwnfkX8RGHl4xkO9AzxmqNsSx+SHbyAjn3MyTadQDoAfGitw+Vg
	MVMWjW3CxaD4cXNGdktzIohPhZsjQ3U=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-101-8uqyHbx-OqWrCt8X9eZDag-1; Wed, 24 Jan 2024 18:02:11 -0500
X-MC-Unique: 8uqyHbx-OqWrCt8X9eZDag-1
Received: by mail-lj1-f199.google.com with SMTP id 38308e7fff4ca-2cf0e3ea6b4so24227671fa.2
        for <fsverity@lists.linux.dev>; Wed, 24 Jan 2024 15:02:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706137329; x=1706742129;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0rKPE/eCaHAoWTpX9KKeWOJqFB7BrZqi03vC9EX4pj0=;
        b=Y+tQ3CMLSz3guHsLo/14rsFRYPo2a9XO47yKYOTfa391QcprWb45eH72G8qkjfpbfg
         Vv17dwKvrjfNEvNQf8PCkclrjSaQmFIIt2N+aGe+z7Jy/4E26sDrrXES0OGlp+MhTJKU
         7eBToqROwFuny16YiOvxYrVvenEBGPh1g+IDR6RYfYpdTB5qJ1kI352JrOOXxt7BJo9r
         uZ5Jh92H2PYF/PaH/w3B/aRZ3gh/bqysx6aAdhy4iGZohigTGMt48KTtW3hZvN7NWfAt
         LzSi/pToodjdUDOs9onr8hQpaJWnm9qK3SasLy4wfC9x00uwCR2xo+Wc3FmUBdNUIU9U
         HF5w==
X-Gm-Message-State: AOJu0YwphRxpPeMqAEiY4I2rKQM2KsirzWg1RmkCHYWLDczdRIotN7P1
	gXp24MSRxR6UI9FW3PdlVCc7hbiHzOtYr2a1PlX/YTrpMACmMYBP1u+60KR3SErgNwX66QLfwzC
	moWoqnZNko3lVBUf7OTGqq8IeAompx6+9Ob80CXGHz/WivkKgnUp1jO097EcM3AU7TXsetSu+7K
	/dKyJhiKJJ/NW1rNPk8aRIG3tEW+prVgTkrrStZ00=
X-Received: by 2002:a2e:9e02:0:b0:2cc:1d8b:5466 with SMTP id e2-20020a2e9e02000000b002cc1d8b5466mr45673ljk.10.1706137329413;
        Wed, 24 Jan 2024 15:02:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGm3fCvJdzhEUfOaMNaCq7J4CrmB5a38zqVlJUKJewdjUcEC5+fPDPPp39Xz8wlEJKpzIJAHQ==
X-Received: by 2002:a2e:9e02:0:b0:2cc:1d8b:5466 with SMTP id e2-20020a2e9e02000000b002cc1d8b5466mr45667ljk.10.1706137328887;
        Wed, 24 Jan 2024 15:02:08 -0800 (PST)
Received: from thinky ([109.183.6.197])
        by smtp.gmail.com with ESMTPSA id v6-20020aa7d646000000b0055c85e6d75dsm2107993edr.87.2024.01.24.15.02.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 15:02:08 -0800 (PST)
Date: Thu, 25 Jan 2024 00:02:07 +0100
From: Andrey Albershteyn <aalbersh@redhat.com>
To: fsverity@lists.linux.dev, ebiggers@kernel.org
Subject: fs-verity spinlock in is_hash_block_verified()
Message-ID: <vry5tz5aaqaewaaei4e6yux7knb27zf4sm774hqqyisgfj6go7@7x2htyodqfjc>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Eric,

I'm continuing my attempts in adding fs-verity support into XFS :)
And I have a question

I'm trying to not break stuff for ext4 and keep all the
optimizations in place but I got a little bit confused about the
spinlock in is_hash_block_verified().

If we drop opportunistic lockless read for simplicity [1], we get
something like this:

static bool is_hash_block_verified(struct fsverity_info *vi, struct page *hpage,
				   unsigned long hblock_idx)
{
	bool verified;
	unsigned int blocks_per_page;
	unsigned int i;

	if (!vi->hash_block_verified)
		return PageChecked(hpage);

	spin_lock(&vi->hash_page_init_lock);
	if (PageChecked(hpage)) {
		verified = test_bit(hblock_idx, vi->hash_block_verified);
	} else {
		blocks_per_page = vi->tree_params.blocks_per_page;
		hblock_idx = round_down(hblock_idx, blocks_per_page);
		for (i = 0; i < blocks_per_page; i++)
			clear_bit(hblock_idx + i, vi->hash_block_verified);
		SetPageChecked(hpage);
		verified = false;
	}
	spin_unlock(&vi->hash_page_init_lock);
	return verified;
}

As you wrote in the comment [2] the spinlock is needed to set bitmap
and PG_checked together. But why do we need spinlock? Isn't memory
barrier between 'for loop' and SetPageChecked() enough?

		...
		for (i = 0; i < blocks_per_page; i++)
			clear_bit(hblock_idx + i, vi->hash_block_verified);
		smp_wmb();
		SetPageChecked(hpage);
		...

Even if two threads get into PG_checked == 0 case they will clear
bits and set page flag. The only requirement, I can see, is order
that page flag is set after bitmap bits, so, no other threads will
skip blocks which were evicted from memory but still have bit set to
1. As we clear bits we won't get false positive for not verified
block.

Other threads, which already passed verification and want to set bit
to 1 won't be affected by any of this; as they do verification they
have a reference to page, therefore, PG_checked was already set for
them.

Maybe I'm missing a case where things can go bad? Can you describe
in more details why you used spinklock here?

Thanks,
Andrey

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git/tree/fs/verity/verify.c#n19
[2]: https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git/tree/fs/verity/verify.c#n39

