Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D49FD1DDE9
	for <fsverity@lists.linux.dev>; Mon, 22 Apr 2024 16:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713803518; cv=none; b=u2wqsxD+2lg69Udmu0w2KXYGtaqCUqHY7bWw4Lv6pa/bB4ylH28//eEsHGFuLuhw14Xxlf7gqYNhFx/77skYev3SLEAQNEFfQW5g1/hQ6mEP8NZamtYYmEMLUE28uNdLeBuXqDZA5Wk+YMiyE/xbvkdyLx/wS8nufXlp3fcLBA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713803518; c=relaxed/simple;
	bh=+TaqdCEjgZxSTyKsejhTTHIW8R6Lq3G+0wjBonZ0Klg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B8kid4E8XjpwaNhrwTPm0YI2HgWsOcHBNXAmShp/t50tJ7GZRdsfmA/cqFhP1xbpm/3UrHC4FjvwTiaO6EeWr7n5DxiVVMDUOhxNlydkGBA3nHPWq3bonrF3JLuvuXhMwfp9Ut+gMFT5KEDRW5D8HmV6RrWhdU8EQLanOxhDvyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zKK+Ap0N; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zKK+Ap0N"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6a07eefdd66so7265776d6.2
        for <fsverity@lists.linux.dev>; Mon, 22 Apr 2024 09:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713803516; x=1714408316; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FpNxvF9YaOAaBGXSdu/sPdghPX7QEhR2xbCvRx+SLLQ=;
        b=zKK+Ap0Nw5W7+KQFZgfMZtGNW5e+SbJiePQylBoXhszqNACJdNovowJGtSgtcC9tAt
         KHcdtuiyfD1kE0lZE+u5nTQgJQlbLXutFy6w4FYdJBVEK5ci6hyQxntqdAxasobjxA4r
         4yBbYYuZL32C/7HwMSw53COox7xCzosipOcH64H008KQsvRV3Vny1JlB9Aiml4HQYeNj
         MM1HK2ODMpTAtxFifR8ZWr1vXkxYQCZatZ9Da6e8esDonfY9hvo+0e9ewK01YiZ2uvVH
         +vy174w7qdQYceCvZNx5aveR3d2qgonhAitBCkSoJ9KVN5/AmU5W2gGxvmCf6myQ/Jba
         VNRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713803516; x=1714408316;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FpNxvF9YaOAaBGXSdu/sPdghPX7QEhR2xbCvRx+SLLQ=;
        b=mcTcq8ce35gsjbXjEg9pw+OmrIAu+E/zT+nenVEWRkvIHCQsP+aDmphlBd5eP/loFy
         OAQLGXw4j1k8xS4O/PXm6dhStBLk4ObxuoKiRiCAZPzrxKakWMLcjMVTMCeyMA3BldZI
         2IOrS2q0TifOLhu9nh9I+HWu5rEmgzI7vQGJw8OTRxKN+ODlCx+mroOXXKlzRe2hvrf/
         T79YpiFUVW/46ia1PdBamWJlzKdxWTIgRAxy1tAFVCG/L67Cfy86iQY6hP+8MO4zJkUe
         lWKuudqsDZqC3SJ9qa0lYPgjQjzoDzmk3HyFTd5hnCdQiRPINzPqeCBQSVB0sqhCcj4A
         AY8Q==
X-Forwarded-Encrypted: i=1; AJvYcCW5qs+SET3uHlJJVb9dzSbPip73t4DPZdSh8/9djdc6A2yrXWRfDyjdB0q0dAgPlGU0QjgxnJas9e/DDOtYQtmoQPFR0cipWXQ=
X-Gm-Message-State: AOJu0YxSzCdnTxF2m2e101Cxd3/960RcnT5YhNQGqsE1bRsRwNXljDP9
	cbrLjw8EBbUtnBakvqGVUaVUItkSxCzVarIo9Qc8jm3H3LPVduVTjMDVQYjcLP4CwVBkt9PYEzD
	vi8kc14USgF4GC/iDJ3JDNdH8aE8FagJ3/K/e
X-Google-Smtp-Source: AGHT+IFnJOkEklXHQvKFZWs/xYZscnLoS3JOz6nX6Or789idWhJIUZ/20YX+D4TEwqAJMsA6gMAQ27Ha+D/wSSVvbYg=
X-Received: by 2002:ad4:5a4e:0:b0:69b:3a49:106f with SMTP id
 ej14-20020ad45a4e000000b0069b3a49106fmr9367033qvb.15.1713803515798; Mon, 22
 Apr 2024 09:31:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240328205822.1007338-1-richardfung@google.com>
 <20240416001639.359059-1-richardfung@google.com> <20240419170511.GB1131@sol.localdomain>
In-Reply-To: <20240419170511.GB1131@sol.localdomain>
From: Richard Fung <richardfung@google.com>
Date: Mon, 22 Apr 2024 09:31:17 -0700
Message-ID: <CAGndiTNW=AAy8p6520Q2dDoGJbstN5LAvvbO9ELHHtqGbQZAzQ@mail.gmail.com>
Subject: Re: [PATCH v2] fuse: Add initial support for fs-verity
To: Eric Biggers <ebiggers@kernel.org>
Cc: Miklos Szeredi <miklos@szeredi.hu>, linux-fsdevel@vger.kernel.org, 
	fsverity@lists.linux.dev, ynaffit@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 19, 2024 at 10:05=E2=80=AFAM Eric Biggers <ebiggers@kernel.org>=
 wrote:
> It's a bit awkward that the ioctl number is checked twice, though.  Maybe=
 rename
> the new function to fuse_setup_special_ioctl() and call it unconditionall=
y?
>
> - Eric

I'm happy to change it but the benefit of the current iteration is
that it's much more obvious to someone unfamiliar with the code that
code path is only used for fs-verity. Admittedly, I may be
overindexing on the importance of that as someone who's trying to
learn the codebase myself.

Let me know if you still prefer I change it
