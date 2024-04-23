Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC9B58AA3
	for <fsverity@lists.linux.dev>; Tue, 23 Apr 2024 09:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713864726; cv=none; b=SY3v2KTrqSQY7t5d4js61OxUOYXU9oVQ+1CcgzVHSvgftEtEnNhJPu1udbgHWnsz5tmyHTn5BBUQ1iT/rJODb4mvcTjIm1UYEGoOFD8OYpMDf6xWQb1efx7McYvSRpvljn7ew3RdabPfvAa7oqkzSEptVilzfCCyqTsnGXQ4iqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713864726; c=relaxed/simple;
	bh=aWGB3swA+Jg3uLhcV6Osy7Xudy4Uf5japuCRCXXNvJc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o535aa5GsNKVmCzQNWXi33/zTsSHOce70I2IZHGMr7TPSzOVHdi8xvcH5GGp0ZfwTeOYx08hffC5RbiBGUYHR96jeDAWXfRx4Gp1awZsDLrOQlQgDYIws2Kcdjnxdqwicv43ZkG5IMfDoFIGrbBHcbUi2B9OfDqo2ctLBe9HD/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=YbnTSbf3; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="YbnTSbf3"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-56c5d05128dso4925337a12.0
        for <fsverity@lists.linux.dev>; Tue, 23 Apr 2024 02:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1713864722; x=1714469522; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=45lBnYkiVFlhp4xqLP07lTCWuATovrc0olIkkBfyt9I=;
        b=YbnTSbf3eGcAVPGnuc1/Xl7PtapUy1xTLCVC7Qr7G9m+5Frg28IeVH8M0piJ95OL6p
         NeR6vJp+UjxSUb89r0mtcrgI438qsaEYMmtUE4PvNCm6adIZqs9XW2E7PemXsBwtWCRC
         Y+gkOmGUZpYxsHdQ2mFW2IVRC1kyPn+O/n5Y4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713864722; x=1714469522;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=45lBnYkiVFlhp4xqLP07lTCWuATovrc0olIkkBfyt9I=;
        b=OJ+kQSCCUAg/zgA1PvMoymAS/n/CcIBsPKVKQ8FwjvYLoQb6scerriIUT0XS/K79Oo
         AlnTFdwCP8/wtarQP2oxZLzb4za8m3QBeD8EBfOwAfy3VLj041YXDVQstzCafZjxmKS7
         jui55DDNZ1GW/9rHKIxbDzb+GXozSZr1+YrATSn7UyATy2eJxbpjrDL0lz/Xm/Cjl8yD
         c2v2xvw2zP724r5hlESH9N58368XxogXA0OlIG/ZF3Xt/FGUr1/L6NVwQljhu8ah6dI0
         5VSMldtvKfEzV99BkrhJibfJJo2LvfF6+Nwj1ZtbrcGbz3rRE9PRggrgfDSPTeK/Jeis
         WZQg==
X-Forwarded-Encrypted: i=1; AJvYcCWGIAVTDDqxWFezk2po/fK051Tkvw/ViNPjXVPgfgw9nAPWsJRktEg2mtHOGd9YQHduXryHB6wNVNQjDkaT2ZFsZJda6cyC3N8=
X-Gm-Message-State: AOJu0YyqlcHe0TxBV6px4NBtriaaWaTXusHJNBC1PaKjp0Xn63EYqjF+
	jvceuSv7voK0KhrC1ltkTY9cFYG1uWECsvEw0D2O6p3PLSVLgGuhh0ltdkfBpFfodijLAM1Tp11
	GtTC0lVxcPOadWL8UXZl40BimWAsttsrEy05dSA==
X-Google-Smtp-Source: AGHT+IFPPPbj6Qq5tYBTh7saCUA+yKXKCPNUl2woFYzNbUaAx5TT96V3GVhi3xN1cJu6INSeLRog0Vj3jc2KEP5oJgc=
X-Received: by 2002:a17:906:dac9:b0:a55:be99:60d5 with SMTP id
 xi9-20020a170906dac900b00a55be9960d5mr3559679ejb.23.1713864722153; Tue, 23
 Apr 2024 02:32:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240328205822.1007338-1-richardfung@google.com>
 <20240416001639.359059-1-richardfung@google.com> <20240419170511.GB1131@sol.localdomain>
 <CAGndiTNW=AAy8p6520Q2dDoGJbstN5LAvvbO9ELHHtqGbQZAzQ@mail.gmail.com>
In-Reply-To: <CAGndiTNW=AAy8p6520Q2dDoGJbstN5LAvvbO9ELHHtqGbQZAzQ@mail.gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Tue, 23 Apr 2024 11:31:50 +0200
Message-ID: <CAJfpegs=J5x_0DfiiXcEtsRxkoVq+ZGv_FhxFo9Vk8B++e_P3A@mail.gmail.com>
Subject: Re: [PATCH v2] fuse: Add initial support for fs-verity
To: Richard Fung <richardfung@google.com>
Cc: Eric Biggers <ebiggers@kernel.org>, linux-fsdevel@vger.kernel.org, 
	fsverity@lists.linux.dev, ynaffit@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 22 Apr 2024 at 18:31, Richard Fung <richardfung@google.com> wrote:
>
> On Fri, Apr 19, 2024 at 10:05=E2=80=AFAM Eric Biggers <ebiggers@kernel.or=
g> wrote:
> > It's a bit awkward that the ioctl number is checked twice, though.  May=
be rename
> > the new function to fuse_setup_special_ioctl() and call it unconditiona=
lly?
> >
> > - Eric
>
> I'm happy to change it but the benefit of the current iteration is
> that it's much more obvious to someone unfamiliar with the code that
> code path is only used for fs-verity. Admittedly, I may be
> overindexing on the importance of that as someone who's trying to
> learn the codebase myself.
>
> Let me know if you still prefer I change it

Or move the switch out to the caller and split
fuse_setup_verity_ioctl() into two separate functions, since there's
no commonality between them (except that both are verity related).

I did that transformation and pushed it to

  git://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse.git#for-next

Please verify that I didn't mess anything up.

Thanks,
Miklos
