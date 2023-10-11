Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FE841DDC1
	for <fsverity@lists.linux.dev>; Wed, 11 Oct 2023 11:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aN/dGeyJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697022787;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QCk7wawpxWR/0pRF2lN6xcLeaTX+QEqqMdqYqyMN2VM=;
	b=aN/dGeyJN9syJGWENat2GFTQ7YX3OA+IbvunM9j582KfNJFHzg4q02kCKAetJ5P50mkfag
	eEYHir6ycJZabBNvCElc9LFNbBs7vK7pI6p3iESitk973/jh/dLlQ0IMIqoQO3T0s1n3qd
	0+uCKSUX5gxlYh1//KwCPCRwuSOgrEs=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-255-OIhmFuYRP2OmNAyxnKOHBw-1; Wed, 11 Oct 2023 07:13:05 -0400
X-MC-Unique: OIhmFuYRP2OmNAyxnKOHBw-1
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-5387edc4020so5470630a12.1
        for <fsverity@lists.linux.dev>; Wed, 11 Oct 2023 04:13:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697022785; x=1697627585;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QCk7wawpxWR/0pRF2lN6xcLeaTX+QEqqMdqYqyMN2VM=;
        b=kB588zo/LzUTiHeI0fGM7N9Ms3CbeFfUdvVG6Aos4xxgFwAwMuHTxOjBQlGWdvRtOO
         HgvS8snA6MevrS2X4WhLiWiqic7pOF0BZCLxGXiClfX9BknCVOd2lC+khJ5XCC3vf33i
         BGsNZQPJUZ8q2e1ENxb9iRX1qtm13eDGgzNsUFxhsY1+/HYkSCOiOjxVgd5rTa4eqV+5
         m+sqSGqlf+qSN0ExBmoYW9smCG9WoMZFdt/6m+oQ45SxXZzcqkLzUrfwSqXO+strV8jH
         4V9BR5/qAzGPZfc2H4oW/72InASaWGTCXh9LSOp7E+ZKxgP2OUgXOsBLgIjRiWfKAWso
         bnVg==
X-Gm-Message-State: AOJu0YyhSFceKf0nOIG394EAf0PI86CFuZS1SvKQDcMXcN5P2dubBwnr
	ISXQ2GDYH9eRdJekDK1+3ni/lIEnT3prEQfT5E5b3nWIRoqigkh7D9f9rzGlTGmQtr98h9KlmfP
	0AXcM0eECE280f9lfSg==
X-Received: by 2002:a05:6402:3458:b0:527:fa8d:d3ff with SMTP id l24-20020a056402345800b00527fa8dd3ffmr16817587edc.6.1697022784809;
        Wed, 11 Oct 2023 04:13:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFM6DlOkWJnlkS9DXFMOt8lJBctYfYXrLJfXwevIGXqlKhPGtt1iOqZUje5Umfc+WHxwjEQkA==
X-Received: by 2002:a05:6402:3458:b0:527:fa8d:d3ff with SMTP id l24-20020a056402345800b00527fa8dd3ffmr16817572edc.6.1697022784532;
        Wed, 11 Oct 2023 04:13:04 -0700 (PDT)
Received: from thinky ([109.183.6.197])
        by smtp.gmail.com with ESMTPSA id s14-20020a056402014e00b005309eb7544fsm8696880edu.45.2023.10.11.04.13.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 04:13:04 -0700 (PDT)
Date: Wed, 11 Oct 2023 13:13:03 +0200
From: Andrey Albershteyn <aalbersh@redhat.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	fsverity@lists.linux.dev, djwong@kernel.org, david@fromorbit.com, dchinner@redhat.com
Subject: Re: [PATCH v3 08/28] fsverity: pass Merkle tree block size to
 ->read_merkle_tree_page()
Message-ID: <y3cj7zsuhdybwk4f6sfxlx52srhtwgetu4updcxe7fqex7w7sr@6qyxm5blq3qs>
References: <20231006184922.252188-1-aalbersh@redhat.com>
 <20231006184922.252188-9-aalbersh@redhat.com>
 <20231011031712.GC1185@sol.localdomain>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20231011031712.GC1185@sol.localdomain>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2023-10-10 20:17:12, Eric Biggers wrote:
> XFS doesn't actually use this, though.  In patch 10 you add
> read_merkle_tree_block, and that is used instead.
> 
> So this patch seems unnecessary.

True, will drop this one.

-- 
- Andrey

