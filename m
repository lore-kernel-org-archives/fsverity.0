Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888661DC465
	for <fsverity@lists.linux.dev>; Mon, 19 Aug 2024 19:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724096472; cv=none; b=B0tspIcIB0TbNZ3ddf8YgAN9GXUh681vm9JHMhIZ9dxynNI02Abeuzz2PWl/xJVq5vJHvN4cOZVpuuPSAnRP0Z9vm7VXi+9BVQB+uRHaBsvKKTA6nc4CBtrW30rRVF6deFQEKv9rJCENigkS2UnQNfB5o2ILHhyoiIKM4RkxYak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724096472; c=relaxed/simple;
	bh=hcSbya+lQiysjoDdhMa2fNXAwE9cTf3HMVXCOHk8tdw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UzPuP3YqdScBbTbGitwafOg8k7VkLy4GldMxeeAII+deD5lNQ8Fb6t1vjUMVx/fkQjuQo7FmghFligdXybQRh++C/L4N7b2/EvAR3WyKZEVliYIA4tLXyQ7acpVKuqYY+J29l1DjL0AMwLZq9jtWy6zZsvJr02FEmtMgEDEx7wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=MiVeYUmu; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="MiVeYUmu"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-68d30057ae9so43532667b3.1
        for <fsverity@lists.linux.dev>; Mon, 19 Aug 2024 12:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1724096469; x=1724701269; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gkyhANmIfoPUx8Ztj0L2oahwdkEC/9ySCXObPcfO7yE=;
        b=MiVeYUmu2Cr0RubfEEjN7Y92kcsVWq4JxbJzd/Jjuf3pk1EsLpvTneik1X3ACv7mOL
         Fa6dKV19phfb0Y0cK876gh320T15VkZWt0xtyjOZnl6PeEMb2Vw9IcUpiEuZw+9PWl3J
         6UYtTy739Vhq4LWUfPlM8l1JM4x8HgMK3JwNOjYG++hUerCFi5J/EIYmyaZuXjyaQw3M
         sa7iAHTeEKcnezlWs/iixRpEWmZNZgJNnmkdQ3fDTdWuBBQr2fbAU8o206U/I+bpOFQZ
         D3dFtdhFz8h3E54/ZtVZxJSqmRAqzqOpz87j9uV7Pmg64gbOKECBC/VkXDt8IsX2EqNs
         oB/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724096469; x=1724701269;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gkyhANmIfoPUx8Ztj0L2oahwdkEC/9ySCXObPcfO7yE=;
        b=jtd55TfRjd927vZmsOE4FuV4eLY02+zrLpSNkbf70lOjbVp9gRSvcPPR6rvh9brEOQ
         YPuaa2Etf9T2ET/kHpPDzFZx0AWtAe80ko3OkwYeTFXHKlkrMmFLGLyASknf4LuAD95z
         nh/rLimrXYvrxSAZMgQKvCKZkac8S2lEDKVvfpwngd3MkxpNFm+UH8hX4BZbqgGlmqGj
         BUBy09D8okKdrlZql+fFr3OAAeWmMVUKWFgdNTKG15ZcKFM25SdYrOnsXC3VLOiYfr2p
         Lr4ZK+dsDgGNO96tediulydp340qXGFBsbEEhmedJkoNszb3rvkT7AgKLB7UWETOup1C
         ZvCw==
X-Forwarded-Encrypted: i=1; AJvYcCWcIWeAlHkD0jgDVqWbMruX+tL6gzInYmJDZupN5ulYqieylH6sn924jjxyawy3mw4LCLqDtPfLzw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzj5n/5mnfCAYrVWKh/l8UwHJ/Thr1F2jJhe66O0pyNDYMQt2al
	V+y5YntP6SuTXBcmhT8NZUffIKKyb1iKdosAAmBE+JkyWWy/fWQuQ4J7ALWbF7oqkl9XmpsQ7KF
	+2dWAH0s6LNNsUFtYNIXgd2tj1w7QwWCAGzKb
X-Google-Smtp-Source: AGHT+IGNxAzznyZ+b7siXNq+DgYF6mU9BKHCBgzIgMxr5gD2jPGN9khm6ib1o830lq2PyGnu1xXnHmPm9H/tqvZOtYQ=
X-Received: by 2002:a05:690c:f8a:b0:64b:69f0:f8f2 with SMTP id
 00721157ae682-6b1b9b5ad78mr147420827b3.3.1724096469531; Mon, 19 Aug 2024
 12:41:09 -0700 (PDT)
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
 <CAHC9VhSe0HkzX0gy5Oo+549wG9xqfeHmsveJqdR_xRcYtim+sA@mail.gmail.com> <8421b247-41d2-4bf5-ba80-f356a2b696fd@linux.microsoft.com>
In-Reply-To: <8421b247-41d2-4bf5-ba80-f356a2b696fd@linux.microsoft.com>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 19 Aug 2024 15:40:58 -0400
Message-ID: <CAHC9VhR1gkiB=etUwgqnkZuBiSy1VD4ZgyUeTWvLQTowgQchFg@mail.gmail.com>
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

On Mon, Aug 19, 2024 at 1:47=E2=80=AFPM Fan Wu <wufan@linux.microsoft.com> =
wrote:
> On 8/18/2024 10:22 AM, Paul Moore wrote:
> > On Fri, Aug 16, 2024 at 3:11=E2=80=AFPM Fan Wu <wufan@linux.microsoft.c=
om> wrote:
> >> On 8/16/2024 6:35 AM, Mikulas Patocka wrote:
> >
> > ...
> >
> >>>>>>
> >>>>>> +#ifdef CONFIG_SECURITY
> >>>>>> +     u8 *root_digest_sig;    /* signature of the root digest */
> >>>>>> +#endif /* CONFIG_SECURITY */
> >>>>>>         unsigned int salt_size;
> >>>>>>         sector_t data_start;    /* data offset in 512-byte sectors=
 */
> >>>>>>         sector_t hash_start;    /* hash start in blocks */
> >>>>>> @@ -58,6 +61,9 @@ struct dm_verity {
> >>>>>>         bool hash_failed:1;     /* set if hash of any block failed=
 */
> >>>>>>         bool use_bh_wq:1;       /* try to verify in BH wq before n=
ormal work-queue */
> >>>>>>         unsigned int digest_size;       /* digest size for the cur=
rent hash algorithm */
> >>>>>> +#ifdef CONFIG_SECURITY
> >>>>>> +     unsigned int sig_size;  /* root digest signature size */
> >>>>>> +#endif /* CONFIG_SECURITY */
> >>>>>>         unsigned int hash_reqsize; /* the size of temporary space =
for crypto */
> >>>>>>         enum verity_mode mode;  /* mode for handling verification =
errors */
> >>>>>>         unsigned int corrupted_errs;/* Number of errors for corrup=
ted blocks */
> >>>
> >>> Just nit-picking: I would move "unsigned int sig_size" up, after "u8
> >>> *root_digest_sig" entry.
> >>>
> >>> Mikulas
> >>
> >> Sure, I can make these two fields together.
> >
> > Fan, do you want me to move the @sig_size field when merging or are
> > you planning to submit another revision?  I'm happy to do it during
> > the merge, but I don't want to bother if you are going to post another
> > patchset.
>
> Thanks, Paul. It seems moving the field during the merge can expedite
> the process. Please go ahead with that. I appreciate your help with this!

No problem.  I'm going to merge these this afternoon, I'll send
another note when they are in the repo.

--=20
paul-moore.com
