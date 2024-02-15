Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 292B513AA32
	for <fsverity@lists.linux.dev>; Thu, 15 Feb 2024 21:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708033554; cv=none; b=gUJg6+pxojjIIomD+5XVYf4fONCXDfRMur5Hjh4EAlfC7alNVpwR9bol9wSNT11ZU7r7zrGk7ZZLe7bTtrGHNmv3/qe5bGqhjq7cxLcG81WZI5BnKhD3aLSarG6qRneItIO8nHUrpDlxSLkGwAmyFsUh/KDcDnWx3SCRvFZqx4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708033554; c=relaxed/simple;
	bh=8FhN1piRO+qNGVcAfy/8iLtBYzR2KChU3hXAO1Rh2qc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cu+M93Txv+Yx9E+4/pHaCJVO7xWzYN4Bndto7iIegP8tEIBPnfsbG3ocAjOURneHDIXYsuuFuURaaYmWIxODLUghcj/T5JMly5m9r05uxNxfziehRzsb5v+O845OrOiqsigcfSiOKHuZn3XvD8jlRub9EU/dgiZRFFMw4mOrOdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fromorbit.com; spf=pass smtp.mailfrom=fromorbit.com; dkim=pass (2048-bit key) header.d=fromorbit-com.20230601.gappssmtp.com header.i=@fromorbit-com.20230601.gappssmtp.com header.b=WV1MNwY/; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fromorbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fromorbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fromorbit-com.20230601.gappssmtp.com header.i=@fromorbit-com.20230601.gappssmtp.com header.b="WV1MNwY/"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1db640fc901so12769575ad.0
        for <fsverity@lists.linux.dev>; Thu, 15 Feb 2024 13:45:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fromorbit-com.20230601.gappssmtp.com; s=20230601; t=1708033552; x=1708638352; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nxJxihJMTy/upJu6YimBZRR9IzVm6H0zipBB9BI3WRE=;
        b=WV1MNwY/wq2Bb4ffE3FbmiocdiGybA6LG6+ZLPw8eJDSyZO/aBf1fdqiHDcIc1CzUB
         1rmqxMciy+ZtbkHMgVJPau6FkDzIW47Px6thj5W3uOwHt5N1u5IOLiPaTw6nTCgYWmIP
         YEkf2og8c1DiDEnkPZBWzYLXr2YGjbv+q4IeuQsK0TSxQj2zpR51CUXnktR1KAEa1wVy
         oDvl6HNqrMfTC7yLYwbk3Y5rlDUS81dv6kON78hYrmVNVz+xNje+Z2Nx89B3nlLcegOn
         nLjB2bsj1rXgWzZH5hxa/BYl0e7m5HCECpiMtVhabz/KA2E5lmTY0sX1AgNYWJ6/EEUd
         ijVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708033552; x=1708638352;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nxJxihJMTy/upJu6YimBZRR9IzVm6H0zipBB9BI3WRE=;
        b=Mi6pxl7lszS5ljehNvA6N5zpj10v1CGykZe5glndhGEe3zt+mG2djnA1aLMWc9rgM1
         kiXSgZItZutXFVvOQxTgyPFFSBpltZzm64fgGjAqMMb/eI8rqgttNNT/pHKYAOgLcke7
         D/JlBpkZLfMkT199LWqIB8XTAsOVHWWiRs581S0iMAvIXCDsTSOS6kJKZQzUNoYsbdiu
         bRHHx1KoUGLanK2byCRW+kQNuxlbFvfP9O6bTlkUwYTeJgrZf+FcI5Jd9n7yp7Y1t1sb
         kcjGR7DWxLPaUHMQsSXfAAddet6kwdUbYEbF7yltZQNtvbCae1bOvgl7ii1Hl3DrwNY6
         vKaQ==
X-Gm-Message-State: AOJu0Yy9CMHIxw5oytA1pSXK2YMU0Ht20wjNenTurgHAbZAZ5hcNRRln
	IKpTGPsJ+Ap6Q7mi0z0mgc5s2flS5prmnmI3dxlTqj3zf8sQiZEuQBYveyTAlWc=
X-Google-Smtp-Source: AGHT+IGQyuztc0zvzAlIu/JDwRarnXYZyEyvkM2nAedgYMUvv4G9gL0zNUUWeBt1b239+idkRJTB3w==
X-Received: by 2002:a17:902:d487:b0:1d9:9774:7e8a with SMTP id c7-20020a170902d48700b001d997747e8amr3703431plg.24.1708033552380;
        Thu, 15 Feb 2024 13:45:52 -0800 (PST)
Received: from dread.disaster.area (pa49-195-8-86.pa.nsw.optusnet.com.au. [49.195.8.86])
        by smtp.gmail.com with ESMTPSA id r10-20020a170902c60a00b001db817b956bsm1712355plr.259.2024.02.15.13.45.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 13:45:52 -0800 (PST)
Received: from dave by dread.disaster.area with local (Exim 4.96)
	(envelope-from <david@fromorbit.com>)
	id 1rajYC-0070eA-2m;
	Fri, 16 Feb 2024 08:45:48 +1100
Date: Fri, 16 Feb 2024 08:45:48 +1100
From: Dave Chinner <david@fromorbit.com>
To: Andrey Albershteyn <aalbersh@redhat.com>
Cc: fsverity@lists.linux.dev, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, chandan.babu@oracle.com,
	djwong@kernel.org, ebiggers@kernel.org
Subject: Re: [PATCH v4 06/25] fsverity: pass log_blocksize to
 end_enable_verity()
Message-ID: <Zc6GDNMj3gAk20nc@dread.disaster.area>
References: <20240212165821.1901300-1-aalbersh@redhat.com>
 <20240212165821.1901300-7-aalbersh@redhat.com>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240212165821.1901300-7-aalbersh@redhat.com>

On Mon, Feb 12, 2024 at 05:58:03PM +0100, Andrey Albershteyn wrote:
> XFS will need to know log_blocksize to remove the tree in case of an
                        ^^^^^^^^^^^^^
tree blocksize?

-Dave.
-- 
Dave Chinner
david@fromorbit.com
