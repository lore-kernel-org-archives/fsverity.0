Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0D6338B7AF
	for <fsverity@lists.linux.dev>; Tue, 13 Jan 2026 10:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768300077; cv=none; b=kF/jiqMm/zx3P52yDZk/ELoSOdc+SsTH69S1g77DNA1FGIpQ5dNT5nyQaY7ImeX0BEjRq5okZKbI+xibK3mpYltf+0D81mx/XQLNuJxnjc0TF3BwzPBJy8X+pQkexioXxBt6+2+vXE1FAtkiOF1HGlrVXe0iFWWw7lrDbMF8tzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768300077; c=relaxed/simple;
	bh=Y1EG2gg9trMLtTzJzcQqnxtPYB99MBscnRy8ZXGd7Zs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=A18PvPLlbwZawFiXj1Qj98d0ZqJkVJAMOE1vzMAbFteVzeBRSszU7d+FBGQm8z5mByfjDdHZzxodHMuazfPvYGxcYgxkjJ5VtydmlnMJa0f/Y516QDsaF4W3jcgcgkZKhFfwTs/BMFLIHbr4xo9YoBxx64G7a1AHVQQMzqnr2eQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=g7rq/4in; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="g7rq/4in"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768300074;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=E0z1MicA7DsF+xKcCgaImlqMyjxE6Xv47VRmj/QLAAM=;
	b=g7rq/4ingq3eh4j4OAbXughDq9MYyoWl8cnHnfc6fuSbU8XL0lB3tXFZnjoXI5/ujhuBmg
	OJDT3Jsc7/u9NFB6Nho010Wjp29z4J7wsadgxwWVXaxE+wCWlDLztFoH4qRUE6q/VJC+tj
	oC7GELMHiOhonDHPFbv1t5pEGEzLr9k=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-434-_pDH_lyfPjK1GHXM3vlqKg-1; Tue, 13 Jan 2026 05:27:53 -0500
X-MC-Unique: _pDH_lyfPjK1GHXM3vlqKg-1
X-Mimecast-MFC-AGG-ID: _pDH_lyfPjK1GHXM3vlqKg_1768300072
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-477cf25ceccso64088075e9.0
        for <fsverity@lists.linux.dev>; Tue, 13 Jan 2026 02:27:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768300072; x=1768904872;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E0z1MicA7DsF+xKcCgaImlqMyjxE6Xv47VRmj/QLAAM=;
        b=mHbhGtB5rMmOodoR/EQVlDLjhmYZZp3/fxfLD6aWMLcOdneONsq/nidljyEUJgWAuL
         q3TGtvq37m3z4Gi3EVjHYqJmWHl+pDe3WiRLQWtDv+6pAKp04XIZp4mTGDUfpBtDGNvY
         oSP91A8pnQAgkBq8ZezYjqr0cx9ppwAcS7DiNp/C4ltK++QGDz1x56S3QNTYEcEUTAl7
         NvY1ZZtTA+y0wu2Ob+CTeGTfMoOc/VrMXi6fkrHZqBtB0SxA8XqUP4+0+5nh2Ddrf7wX
         HoJ78DoAQU1fWt1IBMw6U3TSA/kDnKxQzTr7W5hO+1Qe5yjVKYZSGQBuyiAi1V1/tP6J
         0eUQ==
X-Gm-Message-State: AOJu0YzNm9GIbX4vnBe//F3e0PUmhqomyFslCDBq5FPsKPQol26efSLa
	5VtVaczaCarhMl752ceQt3h3FLMXkhaH3XTtwKWKqK2+bhI9NbRggP8NqL+XTLbx8kh60u3OHaX
	Qax9F7+/lK5ySuKy+O1rH7IY8l7NLkqSRJ+piptPBM6XyBDeOuv+8/gLl3VA=
X-Gm-Gg: AY/fxX7pzarTEbIJwVpT8V9xImcFGT0BTIKyOvyKSKjWvXcrliT9iL9fBaJImmqd9hn
	jAVXOVWghJBjkiP263bTdnO/RMe+Nce9SqdvfYoor2UWDg2COFYffsLsupm7E8y8HB8KzqivZP7
	odTiL2uTBMgf4+M96l8eg6mWN6mdP1gPO2Di89cjn2qGAaZjEidfmDgpIgwhqu73ffurFR6v33m
	BK0YI5UgumRVxwbO6AcJQjMihEtj0isW2iAI22UDtFwuJdD26PU9hzHOUN7UkPZg6Cter6ePAUS
	vhYx72mV+nIYaJ4OV9c5myvgwi2du4ai8pVNkpfUFqrHwJqO23ux2+4V0+POxWgJgUurIqiFxsY
	=
X-Received: by 2002:a05:600c:4685:b0:477:7975:30ea with SMTP id 5b1f17b1804b1-47d84b41bcbmr245060435e9.29.1768300071687;
        Tue, 13 Jan 2026 02:27:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFR2ffY/nFR+GP3KY/RVv+hIA96YMk+myFc+0psgr29NAZFkwA7UJxzHTC3X0Uic0XrdUJ4pw==
X-Received: by 2002:a05:600c:4685:b0:477:7975:30ea with SMTP id 5b1f17b1804b1-47d84b41bcbmr245060245e9.29.1768300071196;
        Tue, 13 Jan 2026 02:27:51 -0800 (PST)
Received: from thinky ([217.30.74.39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f620ac8sm389705405e9.0.2026.01.13.02.27.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 02:27:50 -0800 (PST)
Date: Tue, 13 Jan 2026 11:27:49 +0100
From: Andrey Albershteyn <aalbersh@redhat.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: fsverity@lists.linux.dev, linux-xfs@vger.kernel.org, 
	ebiggers@kernel.org, linux-fsdevel@vger.kernel.org, aalbersh@kernel.org, 
	david@fromorbit.com, hch@lst.de
Subject: Re: [PATCH v2 1/22] fsverity: report validation errors back to the
 filesystem
Message-ID: <7nix5lf63rm6hrkpr3y37culoiiz53rerj5lcur5bez6gbstc7@xgu6qwkx4qa6>
References: <cover.1768229271.patch-series@thinky>
 <dx6z2f5lrnevosqoqr4a2aa5bmxldmishn6ln22hvdkuxxmjqa@rddd4kri6bce>
 <20260113012911.GU15551@frogsfrogsfrogs>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260113012911.GU15551@frogsfrogsfrogs>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NL14ev3-v-OWDS7awWBPFxlo-ho9CBYw-cB0N-7lZg8_1768300072
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2026-01-12 17:29:11, Darrick J. Wong wrote:
> > To: "Darrick J. Wong" <aalbersh@redhat.com>
> 
> Say    ^^^^^^^ what?

oh damn, sorry, that's my broken script

> 
> On Mon, Jan 12, 2026 at 03:49:50PM +0100, Darrick J. Wong wrote:
> > Provide a new function call so that validation errors can be reported
> > back to the filesystem.
> > 
> > Signed-off-by: Darrick J. Wong <djwong@kernel.org>
> > Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org>
> > ---
> >  fs/verity/verify.c              |  4 ++++
> >  include/linux/fsverity.h        | 14 ++++++++++++++
> >  include/trace/events/fsverity.h | 19 +++++++++++++++++++
> >  3 files changed, 37 insertions(+), 0 deletions(-)
> > 
> > diff --git a/fs/verity/verify.c b/fs/verity/verify.c
> > index 47a66f088f..ef411cf5d8 100644
> > --- a/fs/verity/verify.c
> > +++ b/fs/verity/verify.c
> > @@ -271,6 +271,10 @@
> >  		data_pos, level - 1, params->hash_alg->name, hsize, want_hash,
> >  		params->hash_alg->name, hsize,
> >  		level == 0 ? dblock->real_hash : real_hash);
> > +	trace_fsverity_file_corrupt(inode, data_pos, params->block_size);
> > +	if (inode->i_sb->s_vop->file_corrupt)
> > +		inode->i_sb->s_vop->file_corrupt(inode, data_pos,
> > +						 params->block_size);
> 
> If fserror_report[1] gets merged before this series, I think we should
> add a new FSERR_ type and call fserror_report instead.
> 
> https://lore.kernel.org/linux-fsdevel/176826402610.3490369.4378391061533403171.stgit@frogsfrogsfrogs/T/#u

I see, will health monitoring also use these events? I mean if XFS's
fsverity need to report corrupting error then

-- 
- Andrey

