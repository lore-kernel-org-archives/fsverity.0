Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F4B633EB19
	for <fsverity@lists.linux.dev>; Mon, 23 Feb 2026 18:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771871111; cv=none; b=k46l3/ebUFXu00aLwy+n9BqKNOHGYW2Y4hrA8ss7IWrhvNwUlzAw2uEbedy5dju8bpYo5mMgh8CD0ZbDpc8mgtg/mS/FIFkYHTx50srhFQLnVRk5oGJaoMsdGIpIY75dlI8N4QSd4kQamReI7BpeXDEqa6m8jmRaECw2I62ihn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771871111; c=relaxed/simple;
	bh=/EWm0pKBviMXdkqzEFKnhQPgOVbIqiISyVyohCEv9cA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=P++AhoMtTFbUQ1bYNGjgWvuqM4z7h6bp/5NyWzEWZR2dMKwmhBycyv4++4geyc/M3vk7jbqGt32udtSEstwCDaVdtf0gdWkYjfEEIFVt0XS0+5dIVTwO8O5nE+cHg3bAHXWqCoaZS70zSUo05C1bUEdAyswvLvkSL6DLVSAIvHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=N0XGnMsK; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="N0XGnMsK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771871109;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cXT5f9mZlEhUbznTe2SCQroAE1pOqmhBrzIVjFLcgGY=;
	b=N0XGnMsKjdABkuQZsp9KE9mDSm7YhBM+WXJFR6i3Gr5qxe6MNLW7Hka3AsjhmgPHRrsmqU
	YtEbfA1Sudu8c4BJOeZ+MM1NVD2puYVL7hmOmb0OKeAlH4SWP2W4Mxc8k1R393ynHl8JO6
	CKD58BBZhEZqWQwPZWN7QKlCAvCCbls=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-453-GJEEi0hCPxuyW0aljBy1pg-1; Mon, 23 Feb 2026 13:25:08 -0500
X-MC-Unique: GJEEi0hCPxuyW0aljBy1pg-1
X-Mimecast-MFC-AGG-ID: GJEEi0hCPxuyW0aljBy1pg_1771871107
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4830e7c6131so44088045e9.2
        for <fsverity@lists.linux.dev>; Mon, 23 Feb 2026 10:25:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771871107; x=1772475907;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cXT5f9mZlEhUbznTe2SCQroAE1pOqmhBrzIVjFLcgGY=;
        b=YlviqwyqV9RBy9gxr67TSpFp2KJerL0TkKHAh2omCocXwxHgPdWyVwH7Ty+nwaMd2z
         2IRp2IgiEUHiiLGvm75WUOj2k/mDv2Bg+LOfJGcDYoPsXGqjQFsyQDqMJEwi5eWYcCdL
         Deu01J0Tps9OplVbDMPHBueDKObWlWj+J58DJGW1A/GhHl5IY7PpaZ1kmowXdLgZFl82
         uFdSwB62Hg9xqXXg/GdnxktaOH/BSLq5PKcynCeTmDO9zElfM52mLsbLTgRR2x3A3l44
         kEJ583J/uw3ebDkUeZYTznB7SSHakl+nLCRVCQm3Gq0rZsmlCBq0vw2DABKYrAoH6oxz
         ABYA==
X-Forwarded-Encrypted: i=1; AJvYcCUqJZ4LO+yV8Pkle970g1uShsUac9CPCXeBqnxXcDS+rdRz2tw2W/DPB9vE1fdpSMBaaEjr7ND93w==@lists.linux.dev
X-Gm-Message-State: AOJu0YzCVvjWGFURUr67fo7Is9IiIEfndE0KzMHW1NBp4i/c8KWSOn3q
	oxTRkLUhdcoZjoIogydQziVv5An/CKJgTfQb8PeXgwRps+Y/npxXKeoon4W9iKFmd3624SR9AOt
	ggU9WUq6Xz27sSc7s2767Xbs6xWo/ShbaK2rXoRd+1Zy2+iMknuYM3hflLrkVidGL9Qo=
X-Gm-Gg: AZuq6aL+1iM6ZPM9aBH28JZSZO0JCp5DdOZCb5qk/yTPLXZkDI2+8e47f6C1b42chei
	+liQ22/PwFcLL5WND7j8/XawXn61qRDoClRpHmGogLgEZnLzV980nb8jUWvwAK4YqtJ7kMjyIWQ
	oGslZbNVHFpytFTm7QI+s3nL/vrUT2tI/ZjsmEO0FwvKZ+vrfJAoLDEC6D5pyLXYLkyu/VTWLHV
	XEvezweLGj2z4Rol+e10TfZuz+eovEKaVoRMWZS+Uhyddblnux418ZGswRjwjjpqPzOEBFABbYp
	7AlQknB84axIGBz2/VnQqv1livJHJtL73ZFl4sTzSM89Z4krv7Yc8ODqxJSevdEMb8wcKfbWLbQ
	obmE8QaVXUIs=
X-Received: by 2002:a05:600d:8446:20b0:480:1b65:b744 with SMTP id 5b1f17b1804b1-483a963785fmr110956795e9.28.1771871106723;
        Mon, 23 Feb 2026 10:25:06 -0800 (PST)
X-Received: by 2002:a05:600d:8446:20b0:480:1b65:b744 with SMTP id 5b1f17b1804b1-483a963785fmr110956415e9.28.1771871106204;
        Mon, 23 Feb 2026 10:25:06 -0800 (PST)
Received: from thinky ([217.30.74.39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a9cbfc96sm192309275e9.15.2026.02.23.10.25.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 10:25:05 -0800 (PST)
Date: Mon, 23 Feb 2026 19:25:05 +0100
From: Andrey Albershteyn <aalbersh@redhat.com>
To: Zorro Lang <zlang@redhat.com>
Cc: Andrey Albershteyn <aalbersh@kernel.org>, fstests@vger.kernel.org, 
	fsverity@lists.linux.dev, ebiggers@kernel.org
Subject: Re: [PATCH] generi/579: handle quoted cmp output
Message-ID: <yoly62o7qoacichhdhjjym6mkanzr4fumhf74azbtffnc4sm6c@bkcye3xmyt5m>
References: <20260219152524.1770469-1-aalbersh@kernel.org>
 <20260220170417.sbykhwr53sah2s7g@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260220170417.sbykhwr53sah2s7g@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Nj_QY83Leol5IjgSeKrrVk4yunE161nz1dNb8puWpws_1771871107
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2026-02-21 01:04:17, Zorro Lang wrote:
> On Thu, Feb 19, 2026 at 04:25:22PM +0100, Andrey Albershteyn wrote:
> > diffutils updated cmp with more consistent quoting in commit:
> > 
> > 	69ae797392bd cmp,diff,diff3,sdiff: quote more consistently
> 
> Sigh... changing the default output of core commands again.
> 
> > 
> > This causes generic/579 to fail from time to time due to grep not
> > catching these errors. Remove quote to work with new and old version of
> > cmp.
> > 
> > Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org>
> > ---
> >  tests/generic/579 | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/tests/generic/579 b/tests/generic/579
> > index d5fab4892e9a..19ffd4954db2 100755
> > --- a/tests/generic/579
> > +++ b/tests/generic/579
> > @@ -71,6 +71,7 @@ for ((proc = 0; proc < nproc_reader; proc++)); do
> >  			# match, regardless of whether verity has been enabled
> >  			# or not yet (or is currently being enabled).
> >  			cmp $orig_file $fsv_file |& _filter_scratch | \
> > +				sed "s/'//g" | \
> 
> Thanks for finding this bug. So the output of cmp isn't consistent between the
> old and new versions, which is going to break later cases (base on cmp) on old
> or new diffutils version. We usually handle this by wrapping it in a _cmp function
> to keep the behavior consistent, refer to how we handled common/attr:_getfattr().
> 
> If no more review points, I can merge this patch to fix this issue at first.
> 
> Reviewed-by: Zorro Lang <zlang@redhat.com>
Thanks!
 
> I'm not sure if we need further updates on diff command, we can revisit this
> if any bugs are reported.

I was running -g auto and -g quick with new diffutils, haven't seen
any other failures.

-- 
- Andrey

