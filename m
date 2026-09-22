Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F8E429CEC
	for <fsverity@lists.linux.dev>; Tue, 22 Sep 2026 09:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790067633; cv=none; b=JJTXiZJNRfmXkWXSprbb4PuipIcH0jhHNDSJzePbnwS21yRkmhBOpziZsCcj5aaxGHSRTxl19fPqqoFJ13KvGhHYLAqF6OHi4bbvGqRJL6SUrNp/5lP5itzYWc/zox5KJ1N+cjNHiMt7qWs5HSy8O2I3ysf4z8dCb2E03FOOEnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790067633; c=relaxed/simple;
	bh=HmmHSOBi6Fqj+ayaB0kp+lUWkEfnbaCEl7Q3FaEXEB8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=jEmo5i37T8izpysyPWI+csOKYpUTttnW/JWEjfk+FyLRy45o09BTN4o1ct2sX7JtPiFbNQ7nQ898hS1xMU0K6oRmh6bLrg12zE5/EJu0FrbBL+xuvkc9ybGaenF5UJvrUO8yosXlxXirgpPiWLUwt1XxuP31kjbiLl0ll8x1Thw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Mt2dS8xR; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Mt2dS8xR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790067631;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8YJMnxCx7h1aVciSzhmVbEN46xY6rfHQRJ4daqV9A0s=;
	b=Mt2dS8xRYTr9oIgvGetgqP7OKLcDuHWX2FRcg0QBT6GZu5CnrbQJ1yj0DCjN9ttHTNgjx7
	1jJQ+2Km0m8igKMqg1zfI8iydd3K/f8wWyS0QZUJ6obfPvMGxBfjQS7ax4oW9eI+PqDkmb
	DFRoJRnzvNrbqhnW5kXJp2aQt+fy7Bw=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-591-o3BWWrIeORi1yAl29R3sPQ-1; Tue, 22 Sep 2026 05:00:29 -0400
X-MC-Unique: o3BWWrIeORi1yAl29R3sPQ-1
X-Mimecast-MFC-AGG-ID: o3BWWrIeORi1yAl29R3sPQ_1790067628
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-c210c66672eso487570666b.2
        for <fsverity@lists.linux.dev>; Tue, 22 Sep 2026 02:00:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790067628; x=1790672428;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8YJMnxCx7h1aVciSzhmVbEN46xY6rfHQRJ4daqV9A0s=;
        b=W8QaLph9xybCF7kK3xgaAvOFuacumaQX4KSM179B5hHajUxZ6SAdIPdX9Hu4hviJI6
         JtyWSs7K20o8+2G5ywkGKQLcvyldKT8Dl66QVtnZSwya59flMEJBTojgVFdgfrsFeswl
         Qd2L8CH477QFb93edKlK+E5QAjLKRqxvgo7Md1AkE3SAeLyD5irQlsStJzhLHJCRW6zN
         krZ1Ff10OLEM2FV5RDRyoXyLD2P2b7rjU+geQ+B42O4f0KswKOhaPsd+DJfovfvS0eIN
         PmXndQ8HXen94eG4jxxmTiSV0NFP3Ndeaxbk0bhluT0CLQN4fPB4dL8C1O1YoHY5xx4j
         aqUw==
X-Forwarded-Encrypted: i=1; AKwUvByCc0mgVUA2oejmDa6qOMpCgWM8Z5hMZc9Gx2jm3yoXXAtBUy5aZg/jH7H/fC/r0TSSIKs9m9nOlA==@lists.linux.dev
X-Gm-Message-State: AFuF++lZHtWoLQp1PLWUHFHEel12jBXCOuCHaWAEG8JnaRqLRe1UzfHx
	YvAI+dZibRrOKCbwrE+V38NESwRLPdLFgEuUq4UKW/AA40kwHptSXb9IoyooSXuQ6rw3ux1P3gs
	DmF8mxnixDCvDgDp5GCE0VSUk2YQa0VY7ZgzZlfc27R6NZni6fXzttE6jiYLFomWLmQQ=
X-Gm-Gg: AYBFou3GJQm+KpYR07xBjOWhRY3K7NHox0aFdUaN/vTP2IqEF68IB0Tn7NItLKsbBca
	vA69UCPIec89MeF6vnkSoNdoQIn+pok/t0Yf3VFKw6FOXaHMOHgD+2/0kY8S7w826zR9oeA1ru8
	ttjD3w7krkM6Pyz4Qkf0+4NDoRya/6D8yn7V5xYKnmsuILDm40wN0cMhsHmwCMtGENu0Op3rmn9
	PEzBjWn5jpA7344FuVELH1s2Pw/j1S+TN/9oaHZYXzqx9exsNnLYsxCYPpDt8RPnZCDYrBAqaLG
	27VBYdEhUYizuKezy/abqm9AEJIwVotUxrxLnisjD8pW3XsUpcoFtDEZvAeSju+/vtL7ZSpPRRI
	T+rkkB65lxVhDrESSULPrGlDNNAgIbOfNdg==
X-Received: by 2002:a17:906:9fc1:b0:c29:4a1f:76be with SMTP id a640c23a62f3a-c2a15703413mr1217330766b.20.1790067627822;
        Tue, 22 Sep 2026 02:00:27 -0700 (PDT)
X-Received: by 2002:a17:906:9fc1:b0:c29:4a1f:76be with SMTP id a640c23a62f3a-c2a15703413mr1217326266b.20.1790067627294;
        Tue, 22 Sep 2026 02:00:27 -0700 (PDT)
Received: from aalbersh-thinkpadx1carbongen13.rmtcz.csb ([217.30.74.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a9c4309c7sm51460566b.6.2026.09.22.02.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 02:00:26 -0700 (PDT)
Date: Tue, 22 Sep 2026 11:00:26 +0200
From: Andrey Albershteyn <aalbersh@redhat.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: Andrey Albershteyn <aalbersh@kernel.org>, ebiggers@kernel.org, 
	hch@lst.de, Carlos Maiolino <cem@kernel.org>, fsverity@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, linux-xfs@vger.kernel.org, linux-unionfs@vger.kernel.org, 
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
	linux-btrfs@vger.kernel.org, david@fromorbit.com
Subject: Re: [PATCH v16 00/21] fs-verity support for XFS with post EOF merkle
 tree
Message-ID: <arJC542mXklAeswE@aalbersh-thinkpadx1carbongen13.rmtcz.csb>
References: <20260918111539.1003439-1-aalbersh@kernel.org>
 <20260922045144.GP2705364@frogsfrogsfrogs>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260922045144.GP2705364@frogsfrogsfrogs>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: iLtnXEPCAiyf_q-yo3oVX7m0uMDY9HTCYbeLgsDlr3c_1790067628
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2026-09-21 21:51:44, Darrick J. Wong wrote:
> On Fri, Sep 18, 2026 at 01:15:12PM +0200, Andrey Albershteyn wrote:
> > Hi all,
> > 
> > This is next revision of fsverity for XFS.
> > 
> > The main change from v15 is addion of kmem cache
> > xfs_fsverity_ioend_cache instead of adding work_struct to iomap's ioend
> > struct.
> 
> FWIW, Sashiko found at least one or two bugs, but the reports only got
> echoed to the ext4 list.  Perhaps it's time to discuss allowing it to
> email linux-xfs for bugs that it claims to have found in xfs code?

I'm checking its report for fsverity series, but for other patches
not that often. So, maybe it would be useful for "critical" and
"high" priority issues (not sure if it's possible to configure it
that way).

*this time sashiko sent me a bunch of "no regression found" emails
which I think are not necessary

-- 
- Andrey

