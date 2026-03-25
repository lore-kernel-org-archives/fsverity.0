Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4D7B3CFF42
	for <fsverity@lists.linux.dev>; Wed, 25 Mar 2026 12:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774440229; cv=none; b=q41UOBngf5UEaaNNRe3H1inDunntrHulFWE02gmAm//5KZkpk+56ku6y5ncswtPg3XSIFB65Ucp8ADxKwzPtBwC5DF5IRBSb5QO8VQbFBcuihRQhFMTGEWivDjHjbF26hb7H/0DOQgfN+u6FeaYMvqTg0Na1A9QKmYWw04zNiNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774440229; c=relaxed/simple;
	bh=Es77No52KNJFPGo5T/ww8er3pjI2J58fF+DFC1d5WKg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=KLZebsupJ509+GkXYvJjR4QSTR1HKbyMwI+e7ddy9Af5i1niKrofFU01ZLDComdDyIMtpy9xd9/RYxo+sRxKpU5974IkBhmDK0UdIx47DD6k+Nd3c2/bByH0KkaigyTOagVXj9R8rQbPzalM1HljuPKUPbeNIfBhyRCNa3Lmlx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=icsZpUJg; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="icsZpUJg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774440227;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hHtDuEkZI5nETEV2K61pi5NwMLau14IczzFE7YDeBkk=;
	b=icsZpUJgksX5aS21xOoEsrXLJPEQ0IWt3+qFA33JkWHh3XSvL3vtrMGW/8Be3vMFl5m7Lq
	Pa37XKpl8XMnNpOld39exKbAeI/2uQV4OO3YREMx4eTA2Jo0Elp7xRH9hpDBcxGugV8hed
	q8sObHA0rBH20Hjam6wOZoiNcRfjJrs=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-240-A-GGRg-lOGOpZ4arEFKnQw-1; Wed, 25 Mar 2026 08:03:45 -0400
X-MC-Unique: A-GGRg-lOGOpZ4arEFKnQw-1
X-Mimecast-MFC-AGG-ID: A-GGRg-lOGOpZ4arEFKnQw_1774440224
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-b9800aa2787so223206666b.1
        for <fsverity@lists.linux.dev>; Wed, 25 Mar 2026 05:03:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774440224; x=1775045024;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hHtDuEkZI5nETEV2K61pi5NwMLau14IczzFE7YDeBkk=;
        b=d7D7rSEfG83HrqL8R3x063hkNU99eUma1kPLas8KewAJYbyHs19eMkNl7ln+08rz0o
         JZUsg+Ej6pP/QE/jLXfKeC+4URrxVIvtmDhE5cVl6JHG5Qs17HHB2+xsJbAbIp1M6KGW
         rA402UFT6gvYPo0nOVzHzmUEj4wJWn40doC53lZnJdrRuujujlu2ZWkw/RXaUbG0Mv3j
         O5uNDTxYHzFL/Stjk00sXHFkJo/bGWqqTyyEzz3+fXTmeAae7M+5jPP/ZNqDB0rR0Sp+
         Ha3EddPjZ1GC8YT/UCoX5oZL7wfUt8UIXfuo2WkVBbbj0tgzXyzkjkmJNBGd94usz+H/
         KR7g==
X-Forwarded-Encrypted: i=1; AJvYcCUelCH6U67DDbThM670jGDl9MugeVevoz1rR6WLnrivzIwiMUw1Nn07khZrnhKIs37P7c7H0Pk56g==@lists.linux.dev
X-Gm-Message-State: AOJu0YwlpfkQ2kNHqQEvR03E9gqj2QsaKIpeskxBFdrbV65O4U3wzaVJ
	021OmFfhbDV6e2e0ncKME1oKJ1RAdnE31EKJ4ZBScL9mx0sLUnveqIv2cgrp4pX5fZM8Z+3Lx1i
	P9Y7WG2EXxLemYhev3cpxBV/HxyToqUVPLLzOHm3Fa41zjnq1O+LoZgQoldk=
X-Gm-Gg: ATEYQzxNYm0KjcrirEhMFYBs02PCdEbKi5EcO+PRyM0ZeZodTGwauzwDOzjmZpJCfVH
	0YIzKn8I4DdPe6xDQoWlHahnX1IGwKxv3PV7ZHqpKxAgTNkgPwozi27KcfYp7Fsd0FLwdwQZmfj
	Ea81el4jBFA6dszXmy+L+wlpt4vCSTmPxPDcsrbBNjDHOterU6Zo+l1UbD05xeK9vRbM1XE7CbB
	R5EYbi3Q4rlkotBRkCMi1YTeBWodvH0RmpvrGrfsGfyF+wdTG53SnlAebxFV0npXtsoqFTCAL6L
	jsy73ErG+L1KCJEfMZ0VW1PLiDm1oqvE898oAIqkX6E+TtZxfydXV+XMUpiaxnfjZ+mkcfW2WDe
	tUewVxA1m+vp+hQ==
X-Received: by 2002:a17:907:3ea5:b0:b96:ff4f:11ea with SMTP id a640c23a62f3a-b9a542834b3mr225195866b.41.1774440224220;
        Wed, 25 Mar 2026 05:03:44 -0700 (PDT)
X-Received: by 2002:a17:907:3ea5:b0:b96:ff4f:11ea with SMTP id a640c23a62f3a-b9a542834b3mr225190866b.41.1774440223277;
        Wed, 25 Mar 2026 05:03:43 -0700 (PDT)
Received: from thinky ([91.245.205.131])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b983365a159sm760453666b.44.2026.03.25.05.03.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 05:03:42 -0700 (PDT)
Date: Wed, 25 Mar 2026 13:03:40 +0100
From: Andrey Albershteyn <aalbersh@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Cc: Andrey Albershteyn <aalbersh@kernel.org>, linux-xfs@vger.kernel.org, 
	fsverity@lists.linux.dev, linux-fsdevel@vger.kernel.org, ebiggers@kernel.org, 
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
	linux-btrfs@vger.kernel.org, djwong@kernel.org
Subject: Re: [PATCH v5 03/25] fsverity: generate and store zero-block hash
Message-ID: <vatqzcvepp7z6iotzayuyh7fajwdqs76pn4o3sdn3f5thiwsjc@dt46ylrbjnkp>
References: <20260319170231.1455553-1-aalbersh@kernel.org>
 <20260319170231.1455553-4-aalbersh@kernel.org>
 <20260325075700.GC952@lst.de>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260325075700.GC952@lst.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: wkPfUioLQKwunDuAeYY8yadLTML-Xh6q0uPv9EEJ9eA_1774440224
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2026-03-25 08:57:00, Christoph Hellwig wrote:
> Shouldn't we still try to get this out of the fsverity_info first?

I don't really understand why, this hash depends on salt (inode
specific) and merkle tree block size (also inode specific).

-- 
- Andrey

