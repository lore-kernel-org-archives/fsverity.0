Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C301D285CA2
	for <fsverity@lists.linux.dev>; Wed, 11 Mar 2026 11:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773229672; cv=none; b=ToaZ79aR6tAhVYmYludJEtaYzD5AnibG4B/JqjLMf5d8w6DEepHuHL8Hwrs5urErncmqL12DP6Hsawk6y7xfBZhA+eSa+kkt32afYc3jJJMjD9UzInI61tZ2Sc4aObiB5gyeZT0SUqEPeWG0MH4VGOCs1AEIop+aNPsaM44sE7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773229672; c=relaxed/simple;
	bh=Hot8zhdh4os52H/bQtBLbPFsGFzTkd5c7ypRjZf9624=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=tklJu3JV0J9TSWq0xKwBP4PbvoKNB4GNWRnAs22PwzWJqD7r0z66e6Ft0NX21M5fW7vBJCLt7sMJwDK4aZMuOe0RxvKCojYwZXDXURyqEFPI0Lw7X7w2STn5z1nOCGBCOVkx1dxFoQAr5tGFUh8uD5ak4NFj8XWJafwZumQ1r3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bpDtRo8R; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bpDtRo8R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773229669;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=asRPjwI5YmOjCP6UVRlsstGP3cgkUliMF2dXi85Qbqg=;
	b=bpDtRo8RGzTpUVtHbeV1Dfx0edUf99zv/AurKK0p6Dim+ZIAMOCXO7FMDOlawS4Rb8c/WA
	kDxSil3Q8EuN3ShfFOJ7Fgm/6/dGhp4m6qbLKVuxnItza5G0IH65V+pKHgmfh4icuuFJ0x
	ZNn6YPCSolzS/a0CWqsPLlfvyWO+pHk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-414-fnOFpd0MNDq3ZtBGsvsDVw-1; Wed, 11 Mar 2026 07:47:48 -0400
X-MC-Unique: fnOFpd0MNDq3ZtBGsvsDVw-1
X-Mimecast-MFC-AGG-ID: fnOFpd0MNDq3ZtBGsvsDVw_1773229667
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4853ac455b2so29591605e9.1
        for <fsverity@lists.linux.dev>; Wed, 11 Mar 2026 04:47:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773229667; x=1773834467;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=asRPjwI5YmOjCP6UVRlsstGP3cgkUliMF2dXi85Qbqg=;
        b=ng7He0KwdqanIKkbPAMukvXDiyBklmODk6KSI0nB3GUER0xFwjGTNeF83v7V6Ry9n/
         PmGPc8OSlhkGVyCNDxbCe9sn/psWIh2ZausTUy7XLsYqp1etZbukquywmSeJAygSAzQx
         kI0ymDmjm2OFmX/VVb/mJ3+i8ytC+epSRY9S/9S2lHCDlTGtcojtXMcuUX8MrVHeUehf
         RvROI6mTHoYpZz7n0K2TzKj81Ku3Fq6S9BmJY7/CdJfvSbuXFkv53NaVmUVYUyZTFkvT
         gBNyjJ4pQ5vtRRddLImfH/PatRAWRRdWrKnqBNJ3EJ0nMmlNAAcvNkrUiQ+0unYg5JEl
         4ofQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEP2DQMiYutuYRAdoqYcIytvpHkdYDl8OEk5wqyZBVdIJCg6hL5AfDXgUg4eYoq6x9mkysxxkVWQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxzJOZywh7Zdl8uti8U/cX6EskNqd11tnuj2Eft4NCmd0owwRb2
	Vs5CTc5GG66a0BLvPUaqn0hnYvIlr46fSnEUK2yteX3UeHfnUQtpb4OMKB7yWTHfwrDGo6vH9T4
	/c2zeMu8051JdwmNCCs0hP9VpYYXCZB/5WKGit6csCUrWMEP43I6Veat5S9I=
X-Gm-Gg: ATEYQzzccNXs6JfPX1syhw6m7F7TMyGVA+m4wzI4DcQg7zvBFfreshJKormnCUsvleQ
	t9sHfrlc100iTge7hNLUuZwcahKvhKx7GTDf6l+m1W4/fazxJXGfxQ00Lc0rlw5b5ooHUK8TgSB
	Uw95STNe4vGkXGuoSn4wlW5sUv/4c2RMZIUy3qaM0rdcBjyHXTnEeOi06Ow77aPoZNyGORp4GmK
	JjK1yEEMta0ZIm4Pl1CyIgVU0lPnYfGoogxyORhd0mfisBTzN2kPQt1N+5z8VOpjthIX1Q0Lfpi
	76lSB9IJJukngzTWiUXzUg8KD8Ssx80U+rnFYPSzXFKSo2eWXLElxdvOo2G02lWy4Yw1xP5duHm
	UN24QjMC+zZw=
X-Received: by 2002:a05:600c:6818:b0:485:3ca4:4eee with SMTP id 5b1f17b1804b1-4854b144e6dmr35215695e9.34.1773229667270;
        Wed, 11 Mar 2026 04:47:47 -0700 (PDT)
X-Received: by 2002:a05:600c:6818:b0:485:3ca4:4eee with SMTP id 5b1f17b1804b1-4854b144e6dmr35215345e9.34.1773229666807;
        Wed, 11 Mar 2026 04:47:46 -0700 (PDT)
Received: from thinky ([217.30.74.39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854ad5ee37sm37540885e9.2.2026.03.11.04.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 04:47:46 -0700 (PDT)
Date: Wed, 11 Mar 2026 12:47:45 +0100
From: Andrey Albershteyn <aalbersh@redhat.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: Andrey Albershteyn <aalbersh@kernel.org>, linux-xfs@vger.kernel.org, 
	fsverity@lists.linux.dev, linux-fsdevel@vger.kernel.org, ebiggers@kernel.org, hch@lst.de, 
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
	linux-btrfs@vger.kernel.org
Subject: Re: [PATCH v4 01/25] fsverity: report validation errors through
 fserror to fsnotify
Message-ID: <jezqpw7mjdren3gzvmkxv7dzviisf7mx2n6dwtq3iwgypghvne@z76sdkkk2x7n>
References: <20260309192355.176980-1-aalbersh@kernel.org>
 <20260309192355.176980-2-aalbersh@kernel.org>
 <20260310004627.GV6033@frogsfrogsfrogs>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260310004627.GV6033@frogsfrogsfrogs>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: w_6LUPTHYh6hamj_2vehdSwJLADa_Wm96ROgPioGK2Y_1773229667
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2026-03-09 17:46:27, Darrick J. Wong wrote:
> On Mon, Mar 09, 2026 at 08:23:16PM +0100, Andrey Albershteyn wrote:
> > Reported verification errors to fsnotify through recently added fserror
> > interface.
> > 
> > Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org>
> > ---
> >  fs/verity/verify.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/fs/verity/verify.c b/fs/verity/verify.c
> > index 4004a1d42875..99276053d3bb 100644
> > --- a/fs/verity/verify.c
> > +++ b/fs/verity/verify.c
> > @@ -9,6 +9,7 @@
> >  
> >  #include <linux/bio.h>
> >  #include <linux/export.h>
> > +#include <linux/fserror.h>
> >  
> >  #define FS_VERITY_MAX_PENDING_BLOCKS 2
> >  
> > @@ -312,6 +313,7 @@ static bool verify_data_block(struct fsverity_info *vi,
> >  		data_pos, level - 1, params->hash_alg->name, hsize, want_hash,
> >  		params->hash_alg->name, hsize,
> >  		level == 0 ? dblock->real_hash : real_hash);
> > +	fserror_report_data_lost(inode, data_pos, params->block_size, GFP_NOFS);
> 
> Don't we also need to cover the "if (unlikely(data_pos >= inode->i_size))"
> around line 199 in verify_data_block?

make sense, will add it there too

-- 
- Andrey

