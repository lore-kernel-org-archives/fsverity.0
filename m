Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA71D47D45D
	for <fsverity@lists.linux.dev>; Thu,  8 Oct 2026 21:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791496649; cv=none; b=TH0s3Ysq2mriS9hoop8jWEmzX9hP5si7jGrk0z8DJb0ScmWMShFUuJHgxXwgZaAg3DZOIJ7/F9F3IvomVR8eCJHWfUvrL5mSdFitg76B3Luby1IoKNLrIE97KHSptilTKh6aPKZpE7Kh+c+g+l0MbBVa6JUkze0h85FT7jcqwrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791496649; c=relaxed/simple;
	bh=TinDgVFxFR2tgZfjdVwALy4/9vsweDfT6mfWVmqTMUo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J/LSWKqo3LRM4k8ZfVXyV3/EPAge5sI6E5wH784BQ7/97bx6ATkKcndRa+OHrd9HHGdKDL0OHTCuEj33UZC3wCWe+gp+4KH+QaEsd6kR7PpyP509/N4wI5+eyoyYIh/Q+0hwPoBqnS2yoH3E3cBG/qjU1B4Vmj1Sn407iC85Vro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com; spf=pass smtp.mailfrom=amutable.com; dkim=pass (2048-bit key) header.d=amutable-com.20251104.gappssmtp.com header.i=@amutable-com.20251104.gappssmtp.com header.b=wRzYlkXX; arc=none smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20251104.gappssmtp.com header.i=@amutable-com.20251104.gappssmtp.com header.b="wRzYlkXX"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-675676afc3cso4101134d50.3
        for <fsverity@lists.linux.dev>; Thu, 08 Oct 2026 14:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20251104.gappssmtp.com; s=20251104; t=1791496646; x=1792101446; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Fco4QMlc4mAm6FzCcL+SMMWE++sU0VPdNedp39umucs=;
        b=wRzYlkXXZGoLdIyObFMgJQGhjgu0G7J5ZOus4wY9RU3ysB1T0UobuK17n/XAaa/QzH
         ZrnDJv6vkHE1PognLXj/mYy1qkZtVnjghcgtgohrKCqyaVrQDo7QZdUjqRkZggj+gI5r
         LevLxUhlMa1DAOJDrVpLgYRSRwRSrnYU3eiyoRoJPx5d66M9H6ZLcc5pfXYG9C/uvA4C
         VZl7h2J8Ajyzvy2LQYeyibF15yaPnWYwPcnCzYLH7T4iTIGYSV5DH/wsWDcSSXOyc+K1
         teKq56u3FHiyiXL4Cl+XdGtVOTAssIawPLZxlNsGoDaukZXiW1ZYzxbW9/H4YXEsRDoQ
         jWdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791496646; x=1792101446;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fco4QMlc4mAm6FzCcL+SMMWE++sU0VPdNedp39umucs=;
        b=KHLEMqMQQWxY14tFOB1kDUBW/oApDbbsCwP46x5bvtRBNt+jMJ7YNGmwa9SyI+V4Qi
         C98tZSceFC5Wi8pGiY+UBPoLn8MSYsdzyxtkdJ5ENP5KzFi2oNlTYXa9RN5CMDQ4Aycy
         sr16LHgYyX8JS2tGwsJl8lr5A090wp823EpWwK5a9buBT0hUQhpqMsje+daRt58ilXKh
         uO/RthQxvYUKEVQaDtk+QfGWhgZ+oelKk5mjFfg7spFc9BkivrK8wnNLDWLpOK9OEiRN
         SiQpJaTGH4nTd5DNmxGNAROq47lQ3oScPyPkZem8poejmAvFerhjgtvEMC3N8TldD/Jk
         wIKg==
X-Forwarded-Encrypted: i=1; AKwUvBwEjTADi8mPTofLE7+Rih8jaE5Is5CIDiDNpX9Qxcv7qTl+tW7HiBdJMwMmSR9AUsaYyZy5q67dcg==@lists.linux.dev
X-Gm-Message-State: AFq9FYLN2/yvJ+XriDcCuYU6CEUls+EMHpopfsTnu7PgpYl231WB+jEY
	FHB+9+EAasJZHYxJkrQyZl/QU++grS56K+TV5feXa72YgEsZHDhMzyT4V3JejQyoVJ43
X-Gm-Gg: AYBFou2tzknW8ymuuLen6QPFXV1bNICHIWx8jin8OKVvGABIGlh+55wkiUEsDiSFwMJ
	NCE0EgalZWqqXOBmoULnp6saa6GwYlw0weaPjCLwiNb2R1qyfbAKlPTu8jfOjIjZmBayDcTFIL0
	goakddptsuejgy12VwXmYCCe0CoBI5xo+XXYdy+1OrynelayOid5tihTI+3y1z0cyLZWOT4ZIC/
	g0IbnCc91imYYxYcH4ezbxv+UvprQHaui2pCeVhrwQSO75T1K4QitB8f+jghRWE3Ow7iYu8xF9W
	eQrAySQx+fcuBYPpmg+nu0yGsch9MXmhBWs1yfzlK6NAPezlZAgI1x63BvlMIxSPk+WENQA6709
	hU4Ni0J6fJFf7LIQwV+LemprnlWPJPnlnGPrtZx6LfgL78zUXjbo5mBW/s0MBcUJkIOpTRfEwfq
	V61mSEMZ6rsoEO/iSMXzz1/Yjb3SY3XK/xCl339mbLhrAMt6EdMlgCSlty48Y4i7TQvJJD2gOPn
	K92cCVvf8UcNvGaZ95di9lIEyM/Rc6OIMPMDcJ59zcrFWDH6cbSzQ==
X-Received: by 2002:a05:690e:4881:10b0:677:ed83:7ef2 with SMTP id 956f58d0204a3-679362620bemr51250d50.72.1791496645626;
        Thu, 08 Oct 2026 14:57:25 -0700 (PDT)
Received: from toolbx (104-53-165-62.lightspeed.stlsmo.sbcglobal.net. [104.53.165.62])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-679356ef60fsm121969d50.21.2026.10.08.14.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 14:57:25 -0700 (PDT)
Date: Thu, 8 Oct 2026 16:57:22 -0500
From: Andrew Halaney <andrew@amutable.com>
To: bot+bpf-ci@kernel.org
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, 
	agk@redhat.com, snitzer@kernel.org, mpatocka@redhat.com, bmarzins@redhat.com, 
	dhowells@redhat.com, jarkko@kernel.org, paul@paul-moore.com, jmorris@namei.org, 
	serge@hallyn.com, ebiggers@kernel.org, tytso@mit.edu, corbet@lwn.net, 
	skhan@linuxfoundation.org, rdunlap@infradead.org, dm-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org, keyrings@vger.kernel.org, linux-security-module@vger.kernel.org, 
	bpf@vger.kernel.org, fsverity@lists.linux.dev, linux-doc@vger.kernel.org, 
	brauner@kernel.org, martin.lau@kernel.org, eddyz87@gmail.com, 
	yonghong.song@linux.dev, mason@kernel.org, ihor.solodrai@linux.dev
Subject: Re: [PATCH bpf-next v2 1/3] keys: add KEY_SPEC_DM_VERITY_KEYRING
Message-ID: <asgQxTE-6YtEgvYZ@toolbx>
References: <20261008-ajhalaney-dmverity-key-identifier-v2-1-008456d189cb@amutable.com>
 <910460850fd4163dadb804fbdf6c17f6a9dfec060f4d865a17df87336ea3e165@mail.kernel.org>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <910460850fd4163dadb804fbdf6c17f6a9dfec060f4d865a17df87336ea3e165@mail.kernel.org>

On Thu, Oct 08, 2026 at 09:44:46PM +0000, bot+bpf-ci@kernel.org wrote:
> > keys: add KEY_SPEC_DM_VERITY_KEYRING
> 
> TL;DR: Design/uapi question: was David Howells' v1 suggestion (reserved
> negative key ID block, common register functions) intentionally dropped? The
> new uapi value -10 should be settled before release.
> 
> > diff --git a/include/uapi/linux/keyctl.h b/include/uapi/linux/keyctl.h
> > --- a/include/uapi/linux/keyctl.h
> > +++ b/include/uapi/linux/keyctl.h
> > @@ -25,6 +25,7 @@
> >  #define KEY_SPEC_REQKEY_AUTH_KEY	-7	/* - key ID for assumed request_key auth key */
> >  #define KEY_SPEC_REQUESTOR_KEYRING	-8	/* - key ID for request_key() dest keyring */
> >  #define KEY_SPEC_BPF_KEYRING		-9	/* - key ID for the BPF-specific keyring */
> > +#define KEY_SPEC_DM_VERITY_KEYRING	-10	/* - key ID for the .dm-verity keyring */
> 
> On v1, David Howells wrote:
> 
>   I have no particular objection to setting aside a block of negative key
>   IDs for special keyrings that need to be accessed a lot - though I would
>   make common reg/unreg functions that take the ID to be registered and,
>   say, set the block at -257..-512.  Moving the BFP keyring to -257 and
>   DM to -258.
> 
>   (<715249.1789718726@warthog.procyon.org.uk>)
> 
> The question of whether this was being asked for v2 was raised in reply, but
> there was no answer, and this version still continues the one-off -9/-10
> sequence with a dm-verity specific key_register_dm_verity_keyring() and
> dm_verity_keyring_lock.
> 
> Was the suggestion to use a reserved ID block with common register and
> unregister functions intentionally dropped, or should it still be addressed?
> 
> Since KEY_SPEC_DM_VERITY_KEYRING is a UAPI value, would it be possible to
> settle this before the -10 value is released?
> 

With the BPF keyring ID already being merged here in bpf-next, plus
Jarkko's feedback/RB, I continued following the current pattern instead of
walking back the BPF keyring ID, and dealing with the
builtin/module/rodata differences I alluded to that would make that
approach a little more annoying (at least with how I thought it thru).

> 
> ---
> AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
> See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md
> 
> CI run summary: https://github.com/kernel-patches/bpf/actions/runs/37844805282

