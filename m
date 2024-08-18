Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4EA0146000
	for <fsverity@lists.linux.dev>; Sun, 18 Aug 2024 17:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724001782; cv=none; b=pqu4rDnvd6GqADGWGBY+qcriHkfWjjy4KECbXzLsb/o+i4MPGKMy3WOqfwnmHqjcXvqs5od0iQLhRCQ9o5VoJAgTRbjtp38RfjvioU3m8jrWK+5PNXJJLUpj7vzoBSq3QxzYJN3VwQFMdrqujwMcCavXxWmyborKbATwMkyCso0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724001782; c=relaxed/simple;
	bh=PRdiw6GJWM/P370VLjhMZ0dhU6tZKbF78aSZqYEGp5g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Yuu49qrD4Zp07BYyPcy4O/royO6vRiRcNJaseZp9iYSLXOW74eUR0W3Po4L3Xp8nM2jvpLnSF6Nz89KNoi+bk+mhtdaOG7LuOofAi7cL65cfpen6OlkF6Dcx9DnohEwBB8Qu/0SB1r8mSPlNvTfrMdYx/rrVq+wFitnfxslF59U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=UXKj/1LR; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="UXKj/1LR"
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e162df8bab4so254721276.0
        for <fsverity@lists.linux.dev>; Sun, 18 Aug 2024 10:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1724001779; x=1724606579; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rea1kNp4EkbAOzAU8f/a10Vwm+fxF1V1CIr9tWa1sDQ=;
        b=UXKj/1LRgAjk7uI6sdRAqLcdoaeQAcE/MOSEkNR1diBhoId1oJHH+ylXFrOC778Ln+
         CUoB7MGoV7Td8Poz2Xqsz95o0auAbTumdfTa2EIlqHYcBZLjSE4afSs1XWzTXwXVKOx6
         0RNJqKBhyxXS1Qz38szlNwO10ZeLuCmawzZvkE1sMcKuCEnlmD8GrOhk3r7rjeYbb1Pe
         6wdU1WkHu0kBzWGZDzT6grS0f8T2Nh4ACZUgLpAKC5M6TF93GwOGANiswhrd1N8RZ3kL
         uSv8jO/zd4RyqoEemUXARHC16WM8884uuzZMi3VTnjh8hJTVg1m5WaBtP2oDU/tqpgF8
         IH5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724001779; x=1724606579;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rea1kNp4EkbAOzAU8f/a10Vwm+fxF1V1CIr9tWa1sDQ=;
        b=DrNRrqmyJPKRnj6W+W2s30kWeWoB4b7m0EzbYQlTlSvshucJfcUDcA/PICX0Pb/ps1
         7JC6uRGk0aiK3wd5RtdKGWzK/Bd7xdzTL7ADlT1niG9Hzwn1NM1Vx+l0N55EZyEvhe+r
         79GkM1z/rn5YCf2P+6oFdnvF5gJPQLoFlpuH34GqK3dJB5yHavEnYKYktOKNdtEfwntm
         F6LgQFwE7cmmLOdt95Jph3/q2PKeLDP6rGaW+ZD6BQnOto2RBNQZ43cR57DbOtcgrfVz
         9c4ymi0nIPT3+nB87H2tK8PGmSFGjZox3cXSFuf0AYHez0gp247yXD4oDCQr3jiFLPbO
         WSZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPpd930Rro/bmLFlrel+0zgsupNAHXns6uG6OSu/3RSzXjf0EWkGzG/OSSqzs8EB9+p8Z6h11lUvoGGiBhtgr3/jLULqGlg9k=
X-Gm-Message-State: AOJu0YzQBYF9DrddW4sozHQtBnk6lKxyvPyr6h5sog1mT45uVC/uPDzf
	o3w+zQJIwhVe0Ykb35uSuo0wMLxH4xn0wys89TuHUgyDQTp7uet/p9rltMEtdUsC6DnAeUrutHA
	HqzPpR3Lr/ItoykRKtkfyqpzhjNI3387nuwVl
X-Google-Smtp-Source: AGHT+IFjiqllbtZbfh6H7hOfR01xf4G8PNDyn1RyHhO2ITzkhGOqhIPLS7VFIHAGqVDoJDMdk8WysOY4o+NEDwrxuHA=
X-Received: by 2002:a05:690c:ec5:b0:64b:7500:2e9 with SMTP id
 00721157ae682-6b1b759714bmr105555907b3.9.1724001779618; Sun, 18 Aug 2024
 10:22:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1722665314-21156-1-git-send-email-wufan@linux.microsoft.com>
 <1722665314-21156-13-git-send-email-wufan@linux.microsoft.com>
 <9dc30ca6-486c-4fa9-910d-ed1dc6da0e95@linux.microsoft.com>
 <CAHC9VhQrnu8Sj=XnDvg=wGTBxacvMSW6OJyG3-tpwrsbGat6vA@mail.gmail.com>
 <88695db-efc0-6cc6-13ee-fd7c2abe61c@redhat.com> <ac6e33b8-ec1f-494a-874f-9a16d3316fce@linux.microsoft.com>
In-Reply-To: <ac6e33b8-ec1f-494a-874f-9a16d3316fce@linux.microsoft.com>
From: Paul Moore <paul@paul-moore.com>
Date: Sun, 18 Aug 2024 13:22:48 -0400
Message-ID: <CAHC9VhSe0HkzX0gy5Oo+549wG9xqfeHmsveJqdR_xRcYtim+sA@mail.gmail.com>
Subject: Re: [PATCH v20 12/20] dm verity: expose root hash digest and
 signature data to LSMs
To: Fan Wu <wufan@linux.microsoft.com>
Cc: Mikulas Patocka <mpatocka@redhat.com>, Mike Snitzer <snitzer@kernel.org>, 
	Alasdair Kergon <agk@redhat.com>, linux-doc@vger.kernel.org, linux-integrity@vger.kernel.org, 
	linux-security-module@vger.kernel.org, fsverity@lists.linux.dev, 
	linux-block@vger.kernel.org, dm-devel@lists.linux.dev, audit@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 16, 2024 at 3:11=E2=80=AFPM Fan Wu <wufan@linux.microsoft.com> =
wrote:
> On 8/16/2024 6:35 AM, Mikulas Patocka wrote:

...

> >>>>
> >>>> +#ifdef CONFIG_SECURITY
> >>>> +     u8 *root_digest_sig;    /* signature of the root digest */
> >>>> +#endif /* CONFIG_SECURITY */
> >>>>        unsigned int salt_size;
> >>>>        sector_t data_start;    /* data offset in 512-byte sectors */
> >>>>        sector_t hash_start;    /* hash start in blocks */
> >>>> @@ -58,6 +61,9 @@ struct dm_verity {
> >>>>        bool hash_failed:1;     /* set if hash of any block failed */
> >>>>        bool use_bh_wq:1;       /* try to verify in BH wq before norm=
al work-queue */
> >>>>        unsigned int digest_size;       /* digest size for the curren=
t hash algorithm */
> >>>> +#ifdef CONFIG_SECURITY
> >>>> +     unsigned int sig_size;  /* root digest signature size */
> >>>> +#endif /* CONFIG_SECURITY */
> >>>>        unsigned int hash_reqsize; /* the size of temporary space for=
 crypto */
> >>>>        enum verity_mode mode;  /* mode for handling verification err=
ors */
> >>>>        unsigned int corrupted_errs;/* Number of errors for corrupted=
 blocks */
> >
> > Just nit-picking: I would move "unsigned int sig_size" up, after "u8
> > *root_digest_sig" entry.
> >
> > Mikulas
>
> Sure, I can make these two fields together.

Fan, do you want me to move the @sig_size field when merging or are
you planning to submit another revision?  I'm happy to do it during
the merge, but I don't want to bother if you are going to post another
patchset.

--=20
paul-moore.com
