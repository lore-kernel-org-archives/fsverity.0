Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06FBC145333
	for <fsverity@lists.linux.dev>; Wed,  7 Aug 2024 19:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723059779; cv=none; b=tdEp4jHmuSqiw4QB066MAGh7x5pQYzpwU5oxCZiJgEAS2H5c7HUA5tmFhGzbaYWlnIKuHKQxm1AqoE0oElaDd5W5w9kSrXuc7ysgCDZsvSNFlzTLRkEr3d/uDrX0q0LOQ2OnMEnTfoS4BuOtNz4d68/wbVa+G6yTTilUhRH9q1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723059779; c=relaxed/simple;
	bh=4vWmcMOGkkyE6SpKOg+lxuJbBZmqhBwk93+K8cVoiVk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PHMxsAjMeXagY8nZK+xPoya7DaYM+aWrk8U4yqTXtI/5ufmyrA/cBzPR/WkhlkcicTwdesmKUL0TF/rwxsEfMbiFFEqNt1n6aNjqt5V729SK9rVsLWqVeUYmOz1imlupcbaRgx7WrKbIJi9sHJ8CsflgMB4/YcDVszyQphfSA0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=ZWGLl+ZK; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="ZWGLl+ZK"
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e0bf9b821e8so152430276.3
        for <fsverity@lists.linux.dev>; Wed, 07 Aug 2024 12:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1723059776; x=1723664576; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ti+dWnafsTGNMHs+vxXfaBVPCpOMl1fNQUR/dBh5t54=;
        b=ZWGLl+ZKZOR3DNZEDgsVkUPY0p5KmYqu+GoSjC+ENdYOhcGDOJJdTRxRfpgBT0Z0oI
         nhUiskUFt4Tqrx05i9X1S0AjmB+AGqkbUWu9uRuUI+xPjBrnber+n7MTKQtfR7UqxklL
         7GucywtkfYApNNmwxELOOweSXnR0VK9M5mcjffkgrt+aKuVFRGB+liD2S3C0w/v5kta+
         Fcays3B5IdCAcFRzcsn8cMP7qJo1nM0vjDmmc9BNuZDki5tYf97HEnSg0cqsZEdYvSxZ
         RSg02/3RB9yufdal9t+NzG3PO34RZ+ZprD1p+5nKVgU+oTJc+w0+HM39EwC9PfTR6wGR
         /6+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723059776; x=1723664576;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ti+dWnafsTGNMHs+vxXfaBVPCpOMl1fNQUR/dBh5t54=;
        b=sfbyXjJsCD/T9lGXak505fiurPcF4z+YAZzHlnsx7sBDRGQR1rhaX2yYrX6pXbZByn
         +7FJEka8IYjXRvUakib6qrq8hugJDiz+wAJMnlFVTpPQlfrtwcoiAm2SJw774c70Hs4v
         uAbN/lL7eGJtF576R09t6bsM43DP/vjjO2nx/HxTzOlpt8+kcjPt55PVsjCv+4Ipnxv5
         MQPBmK/OmedEKcS3OMWrY4o5Yj2Wgts7TqKyMSv7bMhaXbUg4wKWaW5mikVx5gK/O0e7
         FdVmQMHtV7VL0I6KrI1UUySijqm7YoqjLDCMbZtUvwPcjlumhOU01SUzeYtUn0yCthM+
         Biwg==
X-Forwarded-Encrypted: i=1; AJvYcCUVbf6tdYkKmvC9w5UY6bXmsoKGO3gAROdmlWzleNVOlLTTi0Uud4WXG2T2foH/zT6agHW1og/CHZWIViOwpa02SyzVS0Rh1ko=
X-Gm-Message-State: AOJu0Yy9R2LpKvF61WbCMhejMxtzh/BJJBiRIkIAKUXaTCcJI9dSac6g
	orZWRFIBCOZTklpBxByBuimMLk47v+4wXhI5Sdz6Sk3tXSeMEXe/WofzHEUQXBMP8q3hZICcB3L
	SW0zw3X4B/zxEfXs9OqyPaVY9y1+7Thgd1GyV
X-Google-Smtp-Source: AGHT+IH0uDMTEvlhrjytzwDCCXqiKRWy1dc9NB4WG2rHn2putvbgMZXGt7BbJfYOpwZgKPiHTdtB1n+xOLBh+e8QgUw=
X-Received: by 2002:a05:6902:2b8e:b0:e0b:6039:dea with SMTP id
 3f1490d57ef6-e0bde4ad354mr27003143276.40.1723059775981; Wed, 07 Aug 2024
 12:42:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1722665314-21156-1-git-send-email-wufan@linux.microsoft.com>
 <1722665314-21156-21-git-send-email-wufan@linux.microsoft.com>
 <de7857fb-63d9-42fc-af1e-12ffcdfcdda8@molgen.mpg.de> <CAHC9VhRmcReVM_Le5bYor2deotnSe4OT08UYhL6xhiKCu0+3kA@mail.gmail.com>
 <5880e801-e896-4bf0-9a69-2cf5acb51ec3@molgen.mpg.de> <080c93d1-9c02-478f-a0be-f4bd3869c1fd@linux.microsoft.com>
In-Reply-To: <080c93d1-9c02-478f-a0be-f4bd3869c1fd@linux.microsoft.com>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 7 Aug 2024 15:42:45 -0400
Message-ID: <CAHC9VhTNTqK5Q446nQHcbxnV6cakAg0NEnvkvs4Tai+4UXOuAw@mail.gmail.com>
Subject: Re: [PATCH v20 20/20] MAINTAINERS: ipe: add ipe maintainer information
To: Fan Wu <wufan@linux.microsoft.com>
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, corbet@lwn.net, zohar@linux.ibm.com, 
	jmorris@namei.org, serge@hallyn.com, tytso@mit.edu, ebiggers@kernel.org, 
	axboe@kernel.dk, agk@redhat.com, snitzer@kernel.org, mpatocka@redhat.com, 
	eparis@redhat.com, linux-doc@vger.kernel.org, linux-integrity@vger.kernel.org, 
	linux-security-module@vger.kernel.org, fsverity@lists.linux.dev, 
	linux-block@vger.kernel.org, dm-devel@lists.linux.dev, audit@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 7, 2024 at 2:01=E2=80=AFPM Fan Wu <wufan@linux.microsoft.com> w=
rote:
> On 8/6/2024 9:48 PM, Paul Menzel wrote:
> > Dear Paul,
> >
> > Am 06.08.24 um 22:54 schrieb Paul Moore:
> >> On Sat, Aug 3, 2024 at 4:15=E2=80=AFAM Paul Menzel wrote:
> >
> >>> Thank you very much for your patch. Two nits, should you sent another
> >>> interation: A more specific summary would avoid people having to look=
 at
> >>> the message body or diff, and `git log --oneline` would be enough.
> >>>
> >>> MAINTAINERS: Add IPE entry with M: Fan Wu
> >>>
> >>> MAINTAINERS: Add IPE entry with Fan Wu as maintainer
> >>>
> >>> Am 03.08.24 um 08:08 schrieb Fan Wu:
> >>>> Update MAINTAINERS to include ipe maintainer information.
> >>>
> >>> I=E2=80=99d at least mention Integrity Policy Enforcement. As you not=
 only
> >>> include the maintainer information but add a new entry, I=E2=80=99d l=
eave the
> >>> body out, or mention that a new entry is added.
> >>>
> >>>> Signed-off-by: Fan Wu <wufan@linux.microsoft.com>
> >>
> >> Working under the current assumption that a new revision is not
> >> needed, I can fix this up during the merge.  Fan, other-Paul, are you
> >> both okay with the following:
> >>
> >>    "MAINTAINERS: add IPE entry with Fan Wu as maintainer
> >>
> >>     Add a MAINTAINERS entry for the Integrity Policy Enforcement (IPE)
> >> LSM."
> >
> > Thank you. That is fine by me.
> >
> > Kind regards,
> > Paul
>
> Hi Paul and Paul,
>
> Thank you both for your feedback and coordination on this. I'm good with
> the proposed changes and appreciate your efforts.

Updated as shown above, thanks all.

--=20
paul-moore.com
