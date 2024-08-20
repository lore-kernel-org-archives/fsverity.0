Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A5F381A4
	for <fsverity@lists.linux.dev>; Tue, 20 Aug 2024 02:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724122330; cv=none; b=kLUNol9bGT2SIBmEwJmp5fPjHtYY53BmLV5Z29nK2waS1ZH3nXu9+1bOgGRn0htYV0Xc8F2vCLB5hzQ1cA7DQDN1O6DfJWKadbYhaB1Oe6fQ9fEjkiWt/by71+Cfbt76ibhRlEJZ/kCv3j7Q5SOSOy6uNefvb4HGAGggCwJWb70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724122330; c=relaxed/simple;
	bh=ZDr5ZbxqvFQWLLGyxixOKscT+4fsLzUr364GEc8bx4k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vFcS0gjlFZfPtUBS0E23+I7Co+3Bn/StPpDay35L/bUVYXqfcfrjhIKgUFfqQhYuf+rnYoYDTNuG0KuxlZU9qeS/iXR+8wqWiq38Jxc+3x9kBm8jleXTI9OkPi2QJYnjfl/Y8vjMn6rqeEpORyku+AbVTZhdSg4PZNEo8iCPL5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=c3JxdOjc; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="c3JxdOjc"
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e1654a42cb8so184361276.1
        for <fsverity@lists.linux.dev>; Mon, 19 Aug 2024 19:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1724122327; x=1724727127; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dMMqIhR8mNN7qbNLvHC3cSRq9saBfgJ6P2Pudx1fscs=;
        b=c3JxdOjctdUq0VFWEd1HVu35bhGlvnLt8lGsMjbHr8aml9bui6rFgp/atBc5jY7J8O
         J8Pts9AqOokh6TUrImva43b/aMyVZFP+qrnMvLiqwCA2WcL7e79keEAJKu2l1lRVgjPy
         f5LVwSNRqOlJkYCF0kqsAm91ukeKFxayvCRQa6mVDGcukk5p4hwjD0JyZ4q+dDDtqZGW
         mrQsouhU329H6kjP5j247xWrh6O/Kd1dtX1nO72PBwUS5zCCtYhlWoVDEjOMcI4MKyZt
         NNP7MpTKmVYMqq8ecy4AKllXe8tuHdbcuFbLM6wf1ikfSGeu2lRTN+unk4SMGIG5ht2E
         r8ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724122327; x=1724727127;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dMMqIhR8mNN7qbNLvHC3cSRq9saBfgJ6P2Pudx1fscs=;
        b=r/pZ1DGsHlw8LXfST1//avSl0vGJL2qlhdzbHGhAj1hXTSXFcSi7szADvMHEdbAk9+
         CAW3RMh1x7aEYjIcQEHpI3pZTy2VGCHv2g8cpsStZZRYy/JEI4HgaabxoG3YWxCF9F/U
         LGpCuVOgLKm2dUyYMtH/44qcw5HbPzE4BpKGqMLKz3yiuMUfOvgbsua5Iac6pqeRAqoY
         nIUQVta7fktqxIKEvnaewmyXW4+HTr4fOymWqOjz8iJZ+EFqT1E8xSRK9ecQEAruio2W
         q49tgCCqLAzJEBVysD2La2cVK7v11J1TxyQhN4/beEHEUAVJd+OqJ/RO+PPpBYKnAT+R
         euQw==
X-Forwarded-Encrypted: i=1; AJvYcCXOm9TsoMMTZsOwZB90/ZAznX1bBOcubWP+NIaS4JZtI1sqPpCxs0yGEiU5Q5GFJQl01Jxr6AW5AQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyfqpMZVv3OCl8TJzFrrV3Dc7RlbYYpMD7KuD/Q+0Lx1gQbWGRE
	PDjtNT/VJMK+1DqLzTMG6JK3TZMRctzh/1mDiZel409JRGO4Y2xXlGNBKeYivuf0oO0zBaVQLmN
	CFhOWfWB955dnK5WLpr5qTpNuRo4n22CYbWtA
X-Google-Smtp-Source: AGHT+IGx4BZUDH+LCtHEYeY3Jj6i77Krk/e4mCpEtrxZEdqLSGFNLBDOXv3VOnuXbn9YLa/m+2U6fa38CFBTVrK6h9g=
X-Received: by 2002:a25:d8ce:0:b0:e11:83ac:a024 with SMTP id
 3f1490d57ef6-e1183acaecemr11644146276.39.1724122327544; Mon, 19 Aug 2024
 19:52:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1722665314-21156-1-git-send-email-wufan@linux.microsoft.com> <CAHC9VhQ3LobZks+JtcmOxiDH1_kbjXq3ao8th4V_VXO8VAh6YA@mail.gmail.com>
In-Reply-To: <CAHC9VhQ3LobZks+JtcmOxiDH1_kbjXq3ao8th4V_VXO8VAh6YA@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 19 Aug 2024 22:51:56 -0400
Message-ID: <CAHC9VhR7CEBmzjnruFaHHpepYWSRu0bvPUxYk_jz7oXRS5yJUw@mail.gmail.com>
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

On Tue, Aug 6, 2024 at 4:59=E2=80=AFPM Paul Moore <paul@paul-moore.com> wro=
te:
> On Sat, Aug 3, 2024 at 2:08=E2=80=AFAM Fan Wu <wufan@linux.microsoft.com>=
 wrote:
> >
> > IPE is a Linux Security Module that takes a complementary approach to
> > access control. Unlike traditional access control mechanisms that rely =
on
> > labels and paths for decision-making, IPE focuses on the immutable secu=
rity
> > properties inherent to system components. These properties are fundamen=
tal
> > attributes or features of a system component that cannot be altered,
> > ensuring a consistent and reliable basis for security decisions.
> >
> > ...
>
> There was some minor merge fuzz, a handful of overly long lines in the
> comments, and some subject lines that needed some minor tweaking but
> overall I think this looks good.  I only see one thing holding me back
> from merging this into the LSM tree: an updated ACK from the
> device-mapper folks; if we can get that within the next week or two
> that would be great.

I've just merged IPE into the lsm/dev branch, it should go up to Linus
during the next merge window.  Thanks everyone!

--=20
paul-moore.com
