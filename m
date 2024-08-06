Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65815170A1C
	for <fsverity@lists.linux.dev>; Tue,  6 Aug 2024 20:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722977974; cv=none; b=tDQcPCoOYoGLORq4GcN0a1aXQG0LVCx7lBn7JiVNTlkOk1AwiMeUgoyQIOnM00EW9btmZX5UrAM3Mqp/CqQOu5prIOC3y2ALPSIlYZ5w3x/izGTRrTPHyKT2KbbQFXcAB+maSYdrZ8bZl4I19KdQTf718NGMK8VLDNMjxwd42jI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722977974; c=relaxed/simple;
	bh=qyUz9Qqv5k5SudOvCxQPX4RBki5RQXyIqfhgrvWKdyk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pjSUaT/CRBqs1986reTQIKiJs7ukoVRmnNAvCl6skQ3PLNFllXX+lj+thvHjYzTUuOgTqK7s1+u9/uJvKPefdUdRGCL89uK2dp2wpr8aD/ljpttaQ8Vk4Gctuu6D/AyGNOWLV/fPPNql61U71yEXGc/v9xFzKKsvzosl3lGozJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=Bzs+lHYo; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="Bzs+lHYo"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-690af536546so11818477b3.3
        for <fsverity@lists.linux.dev>; Tue, 06 Aug 2024 13:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1722977971; x=1723582771; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hqRA/CX/CVDKRMnMKUkE7btXGpws1I/eaVA/YpB62Hc=;
        b=Bzs+lHYoSpPH1AGzW3XS+axg8K+gj11RQITRDPJbE4KqQszGOLwGJOmdSaWZs9GF1z
         TchDMi9M3w761mMcUOTNjzir5jDFZxmC/t8mWPrMbW/aK38vxxPjbzR4+fzyCCFbyDf3
         rXSAjPYNxG9JrNqxtFZqYR9ECZDtrkO4XE3xpgyYs8lsHtoXKDAuGlVSx3bsJmkd3iK/
         g1liiTsXfS2gZJ9jUmmdOhZoshK8fbzwlWkOOT6+0iu0uJFwDgD4ZImmLZ7k4FZTICtG
         kIJ2R8WL9bLIoKLAqQwkmKOzv3Y1qlvq9mtsRdre8FCklJJEpBx810tUcqZaPy/3KxxH
         lbQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722977971; x=1723582771;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hqRA/CX/CVDKRMnMKUkE7btXGpws1I/eaVA/YpB62Hc=;
        b=v8eUijBcZDJ8FQK39jB9rNmxBrZ8/b6de630RA8/IQWQ8MZj4HgZSej4TAaYf7xUZQ
         3dnJHrsP30kLgC+64FUoc35o3v5ZqSfe/Qq+mDF6T5Lr9IQ4/SvLIjd0u6DFKJTSD+PV
         UY1OC87umm3Shs3wPohjeJUve6DgD/UHjimEHINCXXV6RpBPqUvyNF1bsgRp2MFB88JJ
         0iIMLhTN/XzFHfW5b8z5vJdY+VJMTLlAqe67byAkBYJMwkBAfEX11C3BSz2+it3PXNoe
         62fNGUPNXnmJZkeTS9AQhjbD4QI7l2OI/W91g+j2JFwjymCBOPsX+WolTzWwRazM6db/
         VvBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWaoyMrDHN8dOhVOwhLIoiEeI89jRSpRW+JIwXudysYWRawo8CbWL8I6F+7r75++mqG4NQfD+z/JWuJDo+1O9hHTW7/mjA/wNI=
X-Gm-Message-State: AOJu0Yx86CtQTKZXp8hZRiMwSq+kOm5QvcJJr6OFYFZy+D5jEaVsFZFP
	RicQ0k1Kkq0SMCuY83CCAmWMQP8yTaz7DLgYllkfOSusx10uWJaEEhMkhvUsusbLKdXz7ySN5Ne
	FUJ1N8a/XD/aPi6N+yjckLlFjAVaArqAVOlLN
X-Google-Smtp-Source: AGHT+IG+g9ZPIj3c+gMV8h9nbV6S0gFWlT866BH5MDCEFMia55H31Vc+W1m/exuwqdaE7fTnf6/iUgbwZyFG5W1FJkM=
X-Received: by 2002:a05:6902:15c5:b0:e0b:e2ed:b6c9 with SMTP id
 3f1490d57ef6-e0be2edba28mr17255194276.9.1722977971481; Tue, 06 Aug 2024
 13:59:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1722665314-21156-1-git-send-email-wufan@linux.microsoft.com>
In-Reply-To: <1722665314-21156-1-git-send-email-wufan@linux.microsoft.com>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 6 Aug 2024 16:59:20 -0400
Message-ID: <CAHC9VhQ3LobZks+JtcmOxiDH1_kbjXq3ao8th4V_VXO8VAh6YA@mail.gmail.com>
Subject: Re: [PATCH v20 00/20] Integrity Policy Enforcement LSM (IPE)
To: Fan Wu <wufan@linux.microsoft.com>
Cc: corbet@lwn.net, zohar@linux.ibm.com, jmorris@namei.org, serge@hallyn.com, 
	tytso@mit.edu, ebiggers@kernel.org, axboe@kernel.dk, agk@redhat.com, 
	snitzer@kernel.org, mpatocka@redhat.com, eparis@redhat.com, 
	linux-doc@vger.kernel.org, linux-integrity@vger.kernel.org, 
	linux-security-module@vger.kernel.org, fsverity@lists.linux.dev, 
	linux-block@vger.kernel.org, dm-devel@lists.linux.dev, audit@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 3, 2024 at 2:08=E2=80=AFAM Fan Wu <wufan@linux.microsoft.com> w=
rote:
>
> IPE is a Linux Security Module that takes a complementary approach to
> access control. Unlike traditional access control mechanisms that rely on
> labels and paths for decision-making, IPE focuses on the immutable securi=
ty
> properties inherent to system components. These properties are fundamenta=
l
> attributes or features of a system component that cannot be altered,
> ensuring a consistent and reliable basis for security decisions.
>
> ...

There was some minor merge fuzz, a handful of overly long lines in the
comments, and some subject lines that needed some minor tweaking but
overall I think this looks good.  I only see one thing holding me back
from merging this into the LSM tree: an updated ACK from the
device-mapper folks; if we can get that within the next week or two
that would be great.

--=20
paul-moore.com
