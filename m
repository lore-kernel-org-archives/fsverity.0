Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C0E612F589
	for <fsverity@lists.linux.dev>; Fri, 16 Feb 2024 16:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708100329; cv=none; b=soek4GP2YgQODlfaUflqyNrE/XCiKeeKtZEVCr//rUCjpi99aisyAQxCcL3UFBbuUVpCs0XI4Q36QuiJXjeTLZbiayo2aS6w3CntbP5mxwI9NZT9Eyt2lrhOHC6D0YJ7J0r6bWQT2cNUqM//b4KUbOg72Sx0hBOqT094UijaV/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708100329; c=relaxed/simple;
	bh=oAIAF9jWPO0acrS2NbTV0zUQvpgImhp11qMZffcY4E0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=fLhfDkSW6voae2gceRO5/hbt6M85M0AHZpygotqLsoT8JLwS51ZsWaADtAG6L+C1bK/C0CMFDsLMWwEOzHK9t68V1FpN9T9NEL2IDPz4+22Kjcx9Lz7CCfz20VQfh68Oqxt6HgmwkSBys8veykZFJUhwyCBG8op634yTCPgkRTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GvrH7GrH; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GvrH7GrH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708100326;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=A2YIpXUrLBVFDjCdRtbxFdnmZBsfcrvCwPfrXnzyGhY=;
	b=GvrH7GrHimgsGw1gdGTgOsy57/zrh+bDrUBkohCQT4s+26P6b+3XXidvKRTMndfuh9pKBi
	qSE0TcOL6A9Mx5/2fXFU6EqDcGmZroe2yUBNzPF15DCG60Wn9VXx53gd/zgTH/u6p2CB+q
	TmNq0AQO95LJSLmvD+x+Izt7NDqbJd4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-170-LwRTJIW7OMKWF2gEjhgiiw-1; Fri, 16 Feb 2024 11:18:45 -0500
X-MC-Unique: LwRTJIW7OMKWF2gEjhgiiw-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-33b1fc6c9b8so304233f8f.3
        for <fsverity@lists.linux.dev>; Fri, 16 Feb 2024 08:18:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708100323; x=1708705123;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A2YIpXUrLBVFDjCdRtbxFdnmZBsfcrvCwPfrXnzyGhY=;
        b=J5g/i5yxLUnxRQZNyWjhQZlXFWg4hSat7LEJoxe3li5rpnFcG5q/aqe7ZtKV/ptq5b
         XKiOLeXs3HvuS6jZmyojfQZ4vfYuBj+cNwcWEWjLyY7vNdJ6dXw3Wlx40E04b9LNHCFZ
         jU8QXoiuz53oly+3qydIDqfxO3MPBaMjP0spAodDF4yvTLUXT1U/qfm960pCzMpjwSsB
         UzImOtsbWetvWwMyoQ9EFA33xE/4IWQKMe8RJd/ISxh48aIJnSMWYbya/UtwOp1ykh37
         pWGa0O+8G1Yb4tL4kNZRCPz5waGpHNhWIoQn4q5Luip2DhrKt0fAQkkcjfB9ByM+RsRJ
         3JVg==
X-Gm-Message-State: AOJu0YwH8Dsl9DqSgwewxqTuik3FlJAzY4NzyDu1k7ja4XqKaIHP4mVY
	NbYRkHQrRN4fawrxzXJEYegZnrI7+In4XHE7rRTrorMoCfzMq6mBp7gAiW4tsxDDhgeAuHljE0R
	6Y7eIFddwOo1ZANcJn1h1ZbP+cqBpb07dqfW2Y0nLgoyBXGrOuoolYKo=
X-Received: by 2002:a5d:598e:0:b0:33d:f35:d2b0 with SMTP id n14-20020a5d598e000000b0033d0f35d2b0mr4485888wri.60.1708100323281;
        Fri, 16 Feb 2024 08:18:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG24xD/qEQngS320sUxhv3KFD9tZJkUH2ncwvgXi9rTVBThj3r4tNaTBSA4BLAcsH8YxzEfbg==
X-Received: by 2002:a5d:598e:0:b0:33d:f35:d2b0 with SMTP id n14-20020a5d598e000000b0033d0f35d2b0mr4485868wri.60.1708100322935;
        Fri, 16 Feb 2024 08:18:42 -0800 (PST)
Received: from thinky ([109.183.6.197])
        by smtp.gmail.com with ESMTPSA id bs28-20020a056000071c00b0033d247309a9sm1079418wrb.12.2024.02.16.08.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 08:18:42 -0800 (PST)
Date: Fri, 16 Feb 2024 17:18:41 +0100
From: Andrey Albershteyn <aalbersh@redhat.com>
To: Dave Chinner <david@fromorbit.com>
Cc: fsverity@lists.linux.dev, linux-xfs@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, chandan.babu@oracle.com, djwong@kernel.org, ebiggers@kernel.org
Subject: Re: [PATCH v4 06/25] fsverity: pass log_blocksize to
 end_enable_verity()
Message-ID: <sh4gfd5ajjuryg2yqu6u6mpqlpuyjsas2axvzs3xli5gc6xb5f@b5r7urrxxn7b>
References: <20240212165821.1901300-1-aalbersh@redhat.com>
 <20240212165821.1901300-7-aalbersh@redhat.com>
 <Zc6GDNMj3gAk20nc@dread.disaster.area>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <Zc6GDNMj3gAk20nc@dread.disaster.area>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2024-02-16 08:45:48, Dave Chinner wrote:
> On Mon, Feb 12, 2024 at 05:58:03PM +0100, Andrey Albershteyn wrote:
> > XFS will need to know log_blocksize to remove the tree in case of an
>                         ^^^^^^^^^^^^^
> tree blocksize?

Thanks, yes tree

-- 
- Andrey

