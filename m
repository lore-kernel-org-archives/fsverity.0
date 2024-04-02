Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57BC32B9D8
	for <fsverity@lists.linux.dev>; Tue,  2 Apr 2024 16:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712074595; cv=none; b=OXJDy7cd3TD6vhbJX0KaNtUHdEOtlw3p3yKakRejS4HELz/z7/v07YF+W2l0cXY0WtK0Ivd+5I7uv2ao629BVclWZvlw+utsWDFcAbtyhEzUaTcjM08TJr6VZVbdBy4WyVJnsZXgCNsqi4YKP/MWmgRjjhnflM9YI5SYP5sCIws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712074595; c=relaxed/simple;
	bh=OxlWVdxTEdD893sBNtktZlp9W+CSobIQEK3xYRBJ0BU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=T4ypHbenzsGibUrFrYgZ/Im0qX3W6+Hv40woJZduMQcBR+akzZSL4BhLGZ7ghMeBPGroBM4vhG0IZY1e/Pah1ocBJhP+6YXYQibGWIBcD6UhfbUi9ZEakwvCLeDhyTTOB5yy0fMrTNBiWl7adzPtM+kSlLNLIiIvX9FjsXplLmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dGAA4XJy; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dGAA4XJy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712074593;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=poSTIC0rG2YkQpDe1N+vUApeRhMh2mNxpVONRYNd57c=;
	b=dGAA4XJy57mmpWU8/mDkaIMTWws9Szb2loSrnB1f/CounrxWCJyxqldUsAYrNkidvn/Hzj
	TGvM0dZlh5gm7vPEOV8OHSHiBD/cJbJxF6mZFUxRwio2oKC0++3W+Duyfib7cR4PbcvTXZ
	fEPwJDJHRaCHxt7dpM1hxubu8gMTGuQ=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-681-EoMXqHH_Njqa0XKKmUWeHA-1; Tue, 02 Apr 2024 12:16:30 -0400
X-MC-Unique: EoMXqHH_Njqa0XKKmUWeHA-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a4921e09cebso216160966b.2
        for <fsverity@lists.linux.dev>; Tue, 02 Apr 2024 09:16:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712074589; x=1712679389;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=poSTIC0rG2YkQpDe1N+vUApeRhMh2mNxpVONRYNd57c=;
        b=td8X1yZRciWLivvxcLWrCw90RGLYSXcEspMqyOjsEHAzGhgYndXuw60Vue8mvW+q38
         eqh1JUye3JuiYpQk1zUuWQc9u4NsyM6P1KIoINn1M7M6B+3X59dfGFDShzqej1JmtVwC
         zA/L0QkMsU8LsDM1bmXHPm8rEj+1n4lO6p+AzYMfGPYF7wzsxwjukZnSWchggZq4+237
         TnsoorE8hjVU9ffYoQW/Odt3fw7orbEQ+kR7K0hXh6Ce+OBwYIZ/mfzobp+e4sEISpNm
         XJ7YcHaRd/ua/VODnlFBCiuvAowp2ri/BiCEnGC1pXOXK1C4TYCirNEQ/yfzgzAb9hHL
         V1kQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhRCziQ4cb7SgEcV6NaxfOX7Qu5SgtUDIjkng10wtQorbDiopmqGh2VhTv7Rlgt7nZEx5tJU1mrAzN77ESWJz1zbPLg9TfUEQ=
X-Gm-Message-State: AOJu0YzNJPRUhUg7I/jX0YgThvff5UbNtCJqtxO+xJIIuDt9nQq6I46u
	e+t5PS4OD/NwV2iIHx28L0B0W19puNrvEGZ4+j+LBrAeVDHMtuDjbrO9663FyIhNdjWOgWspRII
	eqMLdZsXUIuT6driV70L/bRZu83DfzFXEhSoC4C595XOijGz9Xudx6t5CI351tzU=
X-Received: by 2002:a17:906:2b5b:b0:a4e:60c0:6a98 with SMTP id b27-20020a1709062b5b00b00a4e60c06a98mr156978ejg.55.1712074589254;
        Tue, 02 Apr 2024 09:16:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF05AJXgDG172NMmyUH7ahWdx/rKSi/SG4rJfk01sHORjq/CrxsWQtDEe/ffiuLuuhSZJWGTw==
X-Received: by 2002:a17:906:2b5b:b0:a4e:60c0:6a98 with SMTP id b27-20020a1709062b5b00b00a4e60c06a98mr156961ejg.55.1712074588781;
        Tue, 02 Apr 2024 09:16:28 -0700 (PDT)
Received: from thinky ([109.183.6.197])
        by smtp.gmail.com with ESMTPSA id la1-20020a170907780100b00a4e8e080869sm774247ejc.176.2024.04.02.09.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 09:16:28 -0700 (PDT)
Date: Tue, 2 Apr 2024 18:16:27 +0200
From: Andrey Albershteyn <aalbersh@redhat.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: ebiggers@kernel.org, linux-xfs@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, fsverity@lists.linux.dev
Subject: Re: [PATCH 25/29] xfs: report verity failures through the health
 system
Message-ID: <ruqr5tdxmmnwdb2kd6t4jsxzdtrurwiyovoguv4nf5suxfpx5s@ypic544cgqt7>
References: <171175868489.1988170.9803938936906955260.stgit@frogsfrogsfrogs>
 <171175868973.1988170.8154641065699724886.stgit@frogsfrogsfrogs>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <171175868973.1988170.8154641065699724886.stgit@frogsfrogsfrogs>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2024-03-29 17:42:35, Darrick J. Wong wrote:
> From: Darrick J. Wong <djwong@kernel.org>
> 
> Record verity failures and report them through the health system.
> 
> Signed-off-by: Darrick J. Wong <djwong@kernel.org>
> ---
>  fs/xfs/libxfs/xfs_fs.h     |    1 +
>  fs/xfs/libxfs/xfs_health.h |    4 +++-
>  fs/xfs/xfs_fsverity.c      |   11 +++++++++++
>  fs/xfs/xfs_health.c        |    1 +
>  4 files changed, 16 insertions(+), 1 deletion(-)
> 
> 

Looks good to me:
Reviewed-by: Andrey Albershteyn <aalbersh@redhat.com>

-- 
- Andrey

