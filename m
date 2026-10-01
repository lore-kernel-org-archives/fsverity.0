Received: from mail-ej2-f31.google.com (mail-ej2-f31.google.com [74.125.228.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB50F3E6DDA
	for <fsverity@lists.linux.dev>; Thu,  1 Oct 2026 21:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.159
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790889795; cv=pass; b=VXeT1WgrY0N8R1zaGusxSYnE8g/RJNA6/PewuCRs2aL+eY2kq+4LHNQS9Ex1j9zcKZxGU6gFySBBM2RipAUmK9HYVfWwF1xaXOvL9KKxzmthJWR81e2/SsVCS6h7FZeImzCn/Yw+Acq5xQXAFxkkCHSoe+Jt4HVBRP0mXAA4lEE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790889795; c=relaxed/simple;
	bh=DLs/KIZ5/ycwSa0SN3niPNJWgFMiQFCmcvqsb0nclfY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J+VvyJy7Y7z2GMdDI0uiJRHtvZbqP6u+dTrguIzn3A87ytIrKosceDi6h+COrzEZw9LuJjw/0rSt/fFfKxXoW/4sthGgiY3r0E6XctCDNCmKj8xqoDSlyiye9ROAy32mRW2vmD7b3Sbr+hfCSydTf3vH4EfR0Cq60Nc9COZvR+0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ckqvo2qS; arc=pass smtp.client-ip=74.125.228.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ckqvo2qS"
Received: by mail-ej2-f31.google.com with SMTP id a640c23a62f3a-c29703cb796so999378566b.2
        for <fsverity@lists.linux.dev>; Thu, 01 Oct 2026 14:23:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790889792; cv=none;
        d=google.com; s=arc-20260327;
        b=L2IsOlDTZOhIC5Kqb1aNVy1zk6oLhS61AFV1yCxrYjV67GxT7McHqkv3qNx9XJIQ6p
         kpeluF4Yr7eDC+BnezFKp6Ic7lhBW/RxmuIzN/9tZDYAAtYffLIx8PFBUqGqoXDkilvN
         EFRyfIV9IBwMAR0FuhK/qsZy9rhN7xej9rajo+YvMY42JNT5xn7wh9A/ZwZ603Jeum+r
         pH6aIRSO6zNXiPDkBD4KYejmgp3Lcfex/6fgH3t0GxNCBroWWl3P/+nugFz6sWKVbfK9
         AChDOr7b7Mf4ubEnYdfdOzPrPNaBhLDqE2coM/HzX1bC611INAxRRUiGfWvYsbx0QnzU
         5JKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bGDIIilh263XLFQkrjj0HvyT95v71lu9sg14IVq4dQQ=;
        fh=aBXQhxyy823vZfWcNir6UflvrLNf9X7LzYx+wpAE+aA=;
        b=aW80N1zFP+30jAcLSyPkUCEgccAU23pn++b+dRtC0+SIFsC86u0DwQvgEyQJN1+exR
         dtcjlE9eYWs41I9GwHYKYIm6vVwaCE7782WdivnrsqV6AxrgImzP0VlBirbz08/c8rZl
         R1CuR5u71mNlWWShSbJi80hdwq17KueHutCFQmOxTimrorB+BVHb3zUwthBLZxgx4xo1
         WhzWZAENWfhqcfDn9c0ugjW5DYGjwmBmQFlENP3KxN9UXLpi1YD0AbgANRjJIlNcjusL
         Tm5kbSvo1ggjzBfMEIrhMRp0MA3rylc1aSR6STNN+nGiTz216prGRvLQQ59/EAbSw+VW
         /HkQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790889792; x=1791494592; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bGDIIilh263XLFQkrjj0HvyT95v71lu9sg14IVq4dQQ=;
        b=Ckqvo2qSi7QjTfqM0FwtGIrOD9jR+CKFZq9YftJvVQkyrdlfPYFnJqlsVkmWSgC1Yt
         29253HeIfMWnOmfQb8yMNSaYuETwSYHaH1gtpKa7joyatwKU/2ehSDX6ahyC0ilQZqxH
         NuxnXTECV8Us93Dr9AHiwx0S8DHo/rZBLMjXD8MnyNXaYwVly3bRN7aIq/4lxbBNCraW
         Y8VwVZUw+ldKDXyxDu/4WsD6UgndfQpqnqXFHoYdQUOWhAK/0T3JgX7B8bnVa0j0rkl9
         T6mt59ljN45D8owdmssVpvlcxvxf+c+CPVnVEsBTNOJcgfVChTF6hwUbWX1raEy+7eqL
         TwjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790889792; x=1791494592;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bGDIIilh263XLFQkrjj0HvyT95v71lu9sg14IVq4dQQ=;
        b=Gv3VW4Sj3Qg0TzpKwOLEJo0CRnblKBYj8wCU6EZS0mNwJAa040xc/C3h0aYN+NVnun
         zgujplyS44Xo8LVvx8Vbtuoj8qaUksdxZOxbz1OrPYksh8f29zdWK3I3oCH5oebCJUt0
         7baSQ22Wwv9nulD2qxky3DGh7cEh+QmxIu7tOmIgLwAt4SUecuxg/+TcHqOsnxGogLEn
         VzRyOMMhXe6hG/9UoGQN5S+n08hm0w/ixLHlqSpyHImc27b97vKVtJVTmaDtKljGu907
         GTYTC0XayJeDyRTWRHipP/+8Xfl3ygDQC9cZMwF+JP4jByX67/b/peXMhEPl1IDfbvfy
         Op7g==
X-Gm-Message-State: AFq9FYJQEBbo38ZAnpKJFfhvLK0ov9MfSUhMbHVfU8q4oZOMhRjuWEIa
	voU0JEcFmS0DP9AaB86FEyIKB7RXG33Pbq+1joeW1xn7Ubd8YRyDAozdwa8sHhdX2oGOwyENpas
	1296U5WGPUKWnN987Yc9afxaIvDNS+S2NNGjxLUdevoMq23INSDnbKZwq
X-Gm-Gg: AYBFou1djXeAI7WAFwOVwDyQV3+pYGVnt7DTqHRzcNrcXPpMtfBXvGEoMkQ3fsCaGXl
	7cL0JQ+xarBhxrPXX59gEvuPMu2MfivFy6ibKUk086tksPqOK7lDycmdKcOmDOol9DfjB84zYQx
	yo6Cbi896Tr0srEFYS8fR1DaiNNsqK0HOuQNO3AWeoQIDvjVf9eYOP8xAx1Hkv+x1JZ3XHMLmaP
	bIoIvgLN7+XNsENGEjisWJbPQ/iXpOycFUdkZ1NUKmwAGcXRXZk+TvzeCowQSFL9RyXDk6iBB7m
	dczyLVLP+RETLy2rVhkI3LmyuXtP8kLQQBn4jlPqsaeow+/cSE29cs7YApR5k/jcDd8G/Z53Lv2
	EiTdXpMGgIJN81o3kmvo0
X-Received: by 2002:a17:907:7282:b0:c25:977e:5377 with SMTP id
 a640c23a62f3a-c2e4ad7cbf6mr69097466b.10.1790889791661; Thu, 01 Oct 2026
 14:23:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261001171349.81454-1-ebiggers@kernel.org>
In-Reply-To: <20261001171349.81454-1-ebiggers@kernel.org>
From: Sandeep Dhavale <dhavale@google.com>
Date: Thu, 1 Oct 2026 14:23:00 -0700
X-Gm-Features: AclHuK8XgZOhRUaL3sAt7Iljpz3t_TC6CLjoxsnzy8OUuuVA4aEvXm2un4VWkDk
Message-ID: <CAB=BE-TsYHMdwKbVPmEQZXENL1gVcwUa7Sde=e1wgGuVLKWnEA@mail.gmail.com>
Subject: Re: [PATCH] fsverity: RCU-delay the freeing of struct fsverity_info
To: Eric Biggers <ebiggers@kernel.org>
Cc: fsverity@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 1, 2026 at 10:13=E2=80=AFAM Eric Biggers <ebiggers@kernel.org> =
wrote:
>
> __fsverity_get_info() calls rhashtable_lookup_fast(), which just uses
> rcu_read_lock() and doesn't directly synchronize with
> fsverity_remove_info().
>
> For the same inode this isn't a problem: its fsverity_info is removed
> only at inode eviction time or upon failure to enable verity, when the
> inode no longer needs its fsverity_info and it will no longer be
> accessed via that inode.
>
> However, this is broken and can cause a use-after-free for concurrent
> __fsverity_get_info() for *different* inodes.  Those rely on following
> fsverity_info::rhash_head in the rhashtable under rcu_read_lock() only.
> They also use fsverity_info::inode to do the key comparison.
>
> Fix this by RCU-delaying the freeing of 'struct fsverity_info' after
> it's been removed from the rhashtable.
>
> Fixes: f77f281b6118 ("fsverity: use a hashtable to find the fsverity_info=
")
> Cc: stable@vger.kernel.org
> Signed-off-by: Eric Biggers <ebiggers@kernel.org>
> ---
>  fs/verity/fsverity_private.h | 15 ++++++++++++++-
>  fs/verity/open.c             | 13 ++++++++++++-
>  2 files changed, 26 insertions(+), 2 deletions(-)

Reviewed-by: Sandeep Dhavale <dhavale@google.com>

Thanks,
Sandeep.
