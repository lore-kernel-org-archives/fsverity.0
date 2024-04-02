Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C19058AD7
	for <fsverity@lists.linux.dev>; Tue,  2 Apr 2024 10:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712052604; cv=none; b=t3c9Gtw+tb+dSsZ5o0qOp7Q/RyryBjloi9I6i+niLk7p9VP957OOprAruBaixI7yMX4UzFy0cxu28qhN9S/8RVPvklvcBH8HqoiBa9BOY7VpOkECmnEW/dCMkpB0INxmKg+ZoOsWKXPBKonN575qBwM8ZgMbZPSMLhnMXRwDIwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712052604; c=relaxed/simple;
	bh=/JGXRN8dEC7eeRXxGa+oKn7ljW+2uWu90I5ZH1yx0qA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=MNuXJDMgN/pK9LT6pghZrD5T9fIqrEYeagGIWt2JVOEmu6/7JDks5DbntS+/zuMRRld6O4Wp54hEs9Fnsrk4WA/yAWsp4KfIGgmQ7ZcQUQayk6UcJh3RVcEtJYhapUif9Y2b+ltpDVg5f70cJvEfsuj+Mbn3G+Y+J6aFvl4IkIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QsBsCrx0; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QsBsCrx0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712052602;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=v9XlJw1dV2M7uYBf21EnZFlthleFX+QwDn8eShFVjlA=;
	b=QsBsCrx01nJGGzmctI/5mh1ovuv0aipcXaE2CJDmPwgkC7Av53Te+fGvt1wFjbMAa1DtXl
	BEgxl8n/VvaoHsFPt8DCs/gkGo5qqQ/3zg11xgi4JrsMYgT6DyeGuLmP7OHZcIn+wAmKy4
	pFU/IXob3lWIr8kPLEpVamGAo7Aig6s=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-630-mOpWc_ZgM0GtwOelmUF-Sg-1; Tue, 02 Apr 2024 06:10:00 -0400
X-MC-Unique: mOpWc_ZgM0GtwOelmUF-Sg-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a4e03687359so236991366b.3
        for <fsverity@lists.linux.dev>; Tue, 02 Apr 2024 03:10:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712052599; x=1712657399;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v9XlJw1dV2M7uYBf21EnZFlthleFX+QwDn8eShFVjlA=;
        b=DjcdwgVeXKgAtfi5xNqOj7wU2Cb3MpAXomAPWd/VqNVWyujbLgQHoxn2+KKVk20ijG
         OXwbNeeS6TpDY12TK9dwdqgUaY/WBCyp7/34NDMuDknAj7i7KwpyTcX1ZitmV/9sB4cY
         +HcGGFBsvDe5/77HMU2swGUYyGhCyAVwy1dvlh7GmQdszK5laKvKZfoip4rH96S15+n3
         /L824hsQ5KuRwMs4N+LLOlwEZpXsPvpLQPF/fT09kJZzSYJF1/srmxhDPX84z0sMklP/
         mJ2CQwhb6uWYtHEXQ9WYdKd9DvTvashyhySueJxISRsi2QnOvclAKzzDYA08Sl1yxmYl
         7T5g==
X-Forwarded-Encrypted: i=1; AJvYcCUkF1lSJMHrFkF+uoptPVbAaZBymfQscrbX3xKi4q0MG8mI+b1TIwHAwjEzbHLZC19sBTm7VMq9DLZyDoe+jnaZPAA8ZaOjDoM=
X-Gm-Message-State: AOJu0YwQ+LxhBWNgco4Zg0l3NlK60MFaUJmxAqqAshkOW9UtixCfvGvO
	1Mcd723VkTD093M0EHRvtQfiFZGLa7yiXMIDeHY5ugb+ZOA6EW6FKJySDXOF6XoxZw5auKNC/65
	qJW92TUTswkNqZOoZlDBbRelnZz32ePJjwVunQqKJ+IjjrtA4UohkXsY=
X-Received: by 2002:a17:906:db04:b0:a4e:2b9e:5b73 with SMTP id xj4-20020a170906db0400b00a4e2b9e5b73mr9263819ejb.49.1712052599652;
        Tue, 02 Apr 2024 03:09:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFPmM5eoOjJMkZksPERAor7w6Un4kTdCaPd2xs3JL0jSqmFfArdXtjO3HZoKySsiA/UzXarTQ==
X-Received: by 2002:a17:906:db04:b0:a4e:2b9e:5b73 with SMTP id xj4-20020a170906db0400b00a4e2b9e5b73mr9263784ejb.49.1712052598992;
        Tue, 02 Apr 2024 03:09:58 -0700 (PDT)
Received: from thinky ([109.183.6.197])
        by smtp.gmail.com with ESMTPSA id pw14-20020a17090720ae00b00a4e35cc42c7sm5177827ejb.170.2024.04.02.03.09.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 03:09:58 -0700 (PDT)
Date: Tue, 2 Apr 2024 12:09:57 +0200
From: Andrey Albershteyn <aalbersh@redhat.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: ebiggers@kernel.org, linux-xfs@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, fsverity@lists.linux.dev
Subject: Re: [PATCH 03/29] xfs: create a helper to compute the blockcount of
 a max sized remote value
Message-ID: <evbfen2l6tkue4flt74faxzwhwn5rm3iemnzuxeyvy6rfeh444@uqffnmrogel7>
References: <171175868489.1988170.9803938936906955260.stgit@frogsfrogsfrogs>
 <171175868610.1988170.11402681235329108487.stgit@frogsfrogsfrogs>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <171175868610.1988170.11402681235329108487.stgit@frogsfrogsfrogs>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2024-03-29 17:36:50, Darrick J. Wong wrote:
> From: Darrick J. Wong <djwong@kernel.org>
> 
> Create a helper function to compute the number of fsblocks needed to
> store a maximally-sized extended attribute value.
> 
> Signed-off-by: Darrick J. Wong <djwong@kernel.org>
> ---
>  fs/xfs/libxfs/xfs_attr.c        |    4 ++--
>  fs/xfs/libxfs/xfs_attr_remote.h |    6 ++++++
>  fs/xfs/scrub/reap.c             |    4 ++--
>  3 files changed, 10 insertions(+), 4 deletions(-)
> 
> 

Looks good to me:
Reviewed-by: Andrey Albershteyn <aalbersh@redhat.com>

-- 
- Andrey

