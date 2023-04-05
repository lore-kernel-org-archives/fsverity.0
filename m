Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D1666ABC
	for <fsverity@lists.linux.dev>; Wed,  5 Apr 2023 16:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680710668;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ezrY1MpbuGn54W85nscQkQabj0tChDh4QyAKrhiN160=;
	b=CQ9a8EBhDjlM2FJTGsAe/NiHS+eDFCqAx0UaqA25YhvySfueHnp4qF1cO2LYHLUvhVymwA
	8jmqlgDEfnRCwxZ8LzUULGpw6A5ufngZmaPAK64QYVTuK3nvt1H/mZwYC9NT1xrplNpHOi
	yZD3jnHMsZe2lC1UMNAqo+L+NhKs4/0=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-146-aWFIixJbOIuXHCul6VdMWg-1; Wed, 05 Apr 2023 12:04:22 -0400
X-MC-Unique: aWFIixJbOIuXHCul6VdMWg-1
Received: by mail-qv1-f71.google.com with SMTP id g6-20020ad45426000000b005a33510e95aso16499261qvt.16
        for <fsverity@lists.linux.dev>; Wed, 05 Apr 2023 09:04:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680710659;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ezrY1MpbuGn54W85nscQkQabj0tChDh4QyAKrhiN160=;
        b=m3CSciHrQx8BFlPRLLawv+ydjxT45q2xO+0R49Ob4SkyX5QxZL4cnRakS702xarm1E
         /w3G5RZ3pBfQqCyhwptdffsyFWc1sIQvFPJSUC3REQixfJQ0rBHvts8/0OGK6RA1+lTe
         ymzV6fwAYZA+4EW3121/4M0bNfEeCLiP2JVIJkgNUplZVVs8rZm2Sv7gGyN8QuEsYbTu
         Xja26jNxhMf0cx7UAn3ubHCK4KWq/hNgQpDIXalgZ9sRHgq3k9geyAiqOb80OJ0HQukR
         G3tR8kF3fAEu/x+CKN4hyF2tz4sGFShzgl/N1WxUo/MnuouhueKVawI3LUal8iOUY70E
         JWXA==
X-Gm-Message-State: AAQBX9dGNFNTsIPA868zm8jcNSOLVfPTYfOEx4Zbch7+4DoCYOtmv1JT
	5yQ3I1Nag/4e9D4sOHvqYH+5yUKZK+azHkmr827d62+71C2+x9dp9kcoIJUrGj8Mp8C/lKxNXUF
	dVl1zUAONEVhYWgJGmg==
X-Received: by 2002:a05:622a:4b:b0:3d8:8d4b:c7cc with SMTP id y11-20020a05622a004b00b003d88d4bc7ccmr7038039qtw.46.1680710659550;
        Wed, 05 Apr 2023 09:04:19 -0700 (PDT)
X-Google-Smtp-Source: AKy350a5lKksulKGDz1s6x8IlpR6R6JUlCw8aCDbcTRwKrjAxeI/G0vqKKfr43MPgy1YnBz9zPAfFA==
X-Received: by 2002:a05:622a:4b:b0:3d8:8d4b:c7cc with SMTP id y11-20020a05622a004b00b003d88d4bc7ccmr7037982qtw.46.1680710659193;
        Wed, 05 Apr 2023 09:04:19 -0700 (PDT)
Received: from aalbersh.remote.csb ([109.183.6.197])
        by smtp.gmail.com with ESMTPSA id b9-20020ac84f09000000b003e398d00fabsm4083588qte.85.2023.04.05.09.04.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 09:04:18 -0700 (PDT)
Date: Wed, 5 Apr 2023 18:04:13 +0200
From: Andrey Albershteyn <aalbersh@redhat.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: djwong@kernel.org, dchinner@redhat.com, hch@infradead.org,
	linux-xfs@vger.kernel.org, fsverity@lists.linux.dev,
	rpeterso@redhat.com, agruenba@redhat.com, xiang@kernel.org,
	chao@kernel.org, damien.lemoal@opensource.wdc.com, jth@kernel.org,
	linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org,
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	cluster-devel@redhat.com
Subject: Re: [PATCH v2 00/23] fs-verity support for XFS
Message-ID: <20230405160413.7o7tljszm56e73a6@aalbersh.remote.csb>
References: <20230404145319.2057051-1-aalbersh@redhat.com>
 <20230404233713.GF1893@sol.localdomain>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20230404233713.GF1893@sol.localdomain>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 04, 2023 at 04:37:13PM -0700, Eric Biggers wrote:
> On Tue, Apr 04, 2023 at 04:52:56PM +0200, Andrey Albershteyn wrote:
> > The patchset is tested with xfstests -g auto on xfs_1k, xfs_4k,
> > xfs_1k_quota, and xfs_4k_quota. Haven't found any major failures.
> 
> Just to double check, did you verify that the tests in the "verity" group are
> running, and were not skipped?

Yes, the linked xfstests in cover-letter has patch enabling xfs
(xfsprogs also needed).
> 
> - Eric
> 

-- 
- Andrey

