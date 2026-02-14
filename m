Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 762DC311956
	for <fsverity@lists.linux.dev>; Sat, 14 Feb 2026 22:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771107665; cv=none; b=mXG+gHgCSxlp5tqfML1Z6Jsl3WHtiaYaFgw46nuzBvExRb+mjqKUxqco1rsNK0HaHzYyC65Ofq/i8xCq+RwmNVmtEzbHEd6nhf52RgNE0oL7sfVZoAoJ02Pv1wOTY4FqZMtVbd/O/a00Akuf6T3g6ceH/vC1cm+55ytrNEAW8Bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771107665; c=relaxed/simple;
	bh=//zRrWhjq2Bwrga6F6V/tszomUIh5gEKf8efc4PgfJw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gHjWD2HVuIvqEUiILw1iCs6K0sWvCrtCkvXX2h1S93m9ervHAB5FRuAewI8CREFmnzW2yd/rVBV//mw9eKPh0yL7fKF+V06dEbqDuKCFed5RFMm2nMwpB3YEUnkWXlR7s7zg5EPXBGcYzYM0CzXmg5xkpSPzzg0E6/57K8D/DrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=YBXjQ97i; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="YBXjQ97i"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-65a26c220b6so2822397a12.0
        for <fsverity@lists.linux.dev>; Sat, 14 Feb 2026 14:21:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1771107662; x=1771712462; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JWQi7XRtc1k2Wo3ssUlb/bYjje86J5o7oD3gW7VZANc=;
        b=YBXjQ97i+GwGDZljIHAwU6j3k2vKT6+63WW2jx9SGIguCdTFElCna5nP6REUP5j1HF
         fT7EB1aCv0LaWy+D7NWkgIi9B3xLSjn/pMosk+qjiAfF5aeJRONsQt+IaVao+uBvUXx+
         Vjl/N1xk7DnBrySwB4R1jtGZnPN9B+jEQdKMQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771107662; x=1771712462;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JWQi7XRtc1k2Wo3ssUlb/bYjje86J5o7oD3gW7VZANc=;
        b=UvsZ9iw3Z6ZXuWnc7LXNSDQzeuVx9mdBF/Ekcr5eyPhp0aPXYQAPZY5itmOa3IgqRa
         fErndWGbKOrSQmWHlkrzGO0JEO6qNy8i4S0wIuydmt1CzffudvSrJmKoaJlKEAU9MfqH
         5ocCcVSkMrZnC8DMca46ySJTDXRd3NVh5O0LuDaD/MJC9zQex+rr6Q6if+ZXbzkELVaJ
         IBs6MM5vFORruLs/VCyGgAm7xFzJfw0uRoMhUKwlDZdx9fjWrpx+NfE3kenMpTtE3j4Y
         JpqJ/MmCinUV8d94njEGV8TqesJx54SMxp0z6rAVkLzBdH6nF2I5Z85jT+d/37llR2ua
         Ovag==
X-Gm-Message-State: AOJu0YyI7ydDXgRjSOJ0Ov4Lu3Tn+Tz2JkdUKGpqbB6PhkAACnl6G+Rs
	Vyqy5yyqJLGqtuGI/oZhyXBT2NKW+2Sk9GZu5Jh1Tv6kJ8gRo5IJUdT2ecgRxy+NYLqRHlL9G6J
	AgHQJIkw=
X-Gm-Gg: AZuq6aK5P20XHgTnxyYjxc5kvv0umJUbpdfQe/gqzmaawx5beJQe6v1jsiH7EqLwYa/
	x5IG/TF340jRbROZ2pyimkjDEW3vLx8LIUEa0K/X6RDzK96Fe+7iXDWXoxSKGTLqCI42LfaJrbx
	bvs5O8I5xPMVauel44sZVnuFJhAKfPOGg5URSFYXruA9z3m9mQ1ur7vHwE/P3Jg5bZtEg8LFfy3
	lzzCh5kyAn4jNmRPqUTJH26Q2R3uxd3WUUjtZ9PKP3PLfTS6p7G9Fd63J3+WlQrcsKkTFBQpbLH
	BOILxs6i4jUF+H9vLCyiwXqY7K8NSlAMhNblh3sfAqCPfN4oHHnYQvGIW/5wgdSQzEZ8pupxnAv
	lGimZ6g7DLyYUMizRwODO8dil9t+JApG/cfwaRadZr5gvbq1AYEaxxAzkT9/0gLhwAOKZfR/ErR
	eYPBPBQ+iAfzAoI+Usst2KQnpNjjTNt9Met1geridxfxRFwgbQ/udZsz6Q+mhjl8V6Q1juXkHC
X-Received: by 2002:a17:907:8693:b0:b8f:a724:8710 with SMTP id a640c23a62f3a-b8fb4501342mr362236366b.50.1771107661713;
        Sat, 14 Feb 2026 14:21:01 -0800 (PST)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com. [209.85.218.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc7627fa7sm106928366b.38.2026.02.14.14.21.01
        for <fsverity@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Feb 2026 14:21:01 -0800 (PST)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b883c8dfb00so369474466b.1
        for <fsverity@lists.linux.dev>; Sat, 14 Feb 2026 14:21:01 -0800 (PST)
X-Received: by 2002:a17:906:f593:b0:b88:68b6:e578 with SMTP id
 a640c23a62f3a-b8fb4214745mr337427966b.25.1771107661112; Sat, 14 Feb 2026
 14:21:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260214211830.15437-1-ebiggers@kernel.org> <20260214211830.15437-2-ebiggers@kernel.org>
 <20260214215008.GA15997@quark>
In-Reply-To: <20260214215008.GA15997@quark>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 14 Feb 2026 14:20:45 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgFNdEJXtoJzkektG3=Tqmk=vNp-J2nWnFicxnHNG2Ndg@mail.gmail.com>
X-Gm-Features: AaiRm528B7N9YxtufVXSjYAah-YQlAO1sSDZ7nzbSQ5JrbU2aWa4vm7YMBox5W0
Message-ID: <CAHk-=wgFNdEJXtoJzkektG3=Tqmk=vNp-J2nWnFicxnHNG2Ndg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] f2fs: use fsverity_verify_blocks() instead of fsverity_verify_page()
To: Eric Biggers <ebiggers@kernel.org>
Cc: fsverity@lists.linux.dev, linux-f2fs-devel@lists.sourceforge.net, 
	linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>, 
	Chao Yu <chao@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, 14 Feb 2026 at 13:50, Eric Biggers <ebiggers@kernel.org> wrote:
>
> Let me know if you'd prefer that we verified the whole folio here
> instead.

This looks good to me.

And hopefully some day that "rpages" becomes "rfolio" (and this can
all go away and it becomes fsverity_verify_folio() and simpler).

It does look like the "cluster size" thing could maybe be made to
simply be the size of one folio for those things, and then being a
single folio of size "PAGE_SIZE << i_log_cluster_size" might simplify
other code too.

Then instead of walking multiple pages, you'd always have exactly one
folio (just different sizes depending on cluster size).

But that's just from a very quick look, and I might mis-understand the
code I saw...

                      Linus
