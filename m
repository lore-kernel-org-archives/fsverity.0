Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBDFB7B
	for <fsverity@lists.linux.dev>; Mon, 20 Mar 2023 22:31:32 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id x3so52735821edb.10
        for <fsverity@lists.linux.dev>; Mon, 20 Mar 2023 15:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1679351491;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OAGlFJqYmzMpi4y5YSD63yoKu9/i/gsYoJLo98dDpYM=;
        b=H5TVtg/3LzAcq64snwXsy7VefCIII3gMvSBifldyIZdNKh2asrD7t6Nt4Qh9RAAIN4
         sM3WpgH6gUTn/4BK2w/IufDFw9EME4pIEE0VcJfLYvAv0MlBXAZzb0TB3MF9MQeTjmY0
         nRlFGAjPfsE0h0PANnuVAn9iu+9cVAhzryiuU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679351491;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OAGlFJqYmzMpi4y5YSD63yoKu9/i/gsYoJLo98dDpYM=;
        b=gvpnc9HsRqZqbqOrTb3PAcFRNd5nCvZFQvc5XaKDEr0X1pRf1eC+i1WOyT1eYqcDBe
         WJPdmodmVd6EiRCc0MgQHOeQ/WzkTs4PjicDvoNkSfGkit5FhfF69RXDzmbei5d6XBS3
         fhHHlJ7nlCATRhSweV0WWiXWpZHUvwAUfWuvnUJGUWaLc0+fm/WUAbKnRJEwDLKq/l9D
         cFx2rcxLZHFnMIAv7rGEACPkFCCHmonGRBbApfJmPKDEFTX7GqYMoCU2rgZqfifCGS6M
         hR4gfhwWrsA1Wy+s5LrZv8MdioYHvsWhP2T2YeKCS+Iiexf1gv7zcsgaSABN76FBiP3Y
         g7TA==
X-Gm-Message-State: AO0yUKWiB/Xm522MJKDv9IF5YWs3ypocb3FGcGLImFikeG4Vh50qLx+u
	TjPlhW5oRrEzkHxJkvvEaIw/UaazM+9j2/B7QhKlaJ8I
X-Google-Smtp-Source: AK7set+EEEQ5BbaUMz5I53WpgSW1d0m8m1DzdE0S/IlzU140nEuqbqEWBLmkndyR8D9yTdSscduuuA==
X-Received: by 2002:a17:907:d410:b0:930:af80:5b9b with SMTP id vi16-20020a170907d41000b00930af805b9bmr930640ejc.1.1679351490729;
        Mon, 20 Mar 2023 15:31:30 -0700 (PDT)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com. [209.85.208.53])
        by smtp.gmail.com with ESMTPSA id x16-20020a170906b09000b00938041aef83sm816844ejy.169.2023.03.20.15.31.30
        for <fsverity@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Mar 2023 15:31:30 -0700 (PDT)
Received: by mail-ed1-f53.google.com with SMTP id ek18so52813207edb.6
        for <fsverity@lists.linux.dev>; Mon, 20 Mar 2023 15:31:30 -0700 (PDT)
X-Received: by 2002:a17:906:34cd:b0:8e5:411d:4d09 with SMTP id
 h13-20020a17090634cd00b008e5411d4d09mr293646ejb.15.1679351489808; Mon, 20 Mar
 2023 15:31:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230320210724.GB1434@sol.localdomain>
In-Reply-To: <20230320210724.GB1434@sol.localdomain>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 20 Mar 2023 15:31:13 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgE9kORADrDJ4nEsHHLirqPCZ1tGaEPAZejHdZ03qCOGg@mail.gmail.com>
Message-ID: <CAHk-=wgE9kORADrDJ4nEsHHLirqPCZ1tGaEPAZejHdZ03qCOGg@mail.gmail.com>
Subject: Re: [GIT PULL] fsverity fixes for v6.3-rc4
To: Eric Biggers <ebiggers@kernel.org>, Tejun Heo <tj@kernel.org>
Cc: fsverity@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, "Theodore Ts'o" <tytso@mit.edu>, 
	Nathan Huckleberry <nhuck@google.com>, Victor Hsieh <victorhsieh@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 20, 2023 at 2:07=E2=80=AFPM Eric Biggers <ebiggers@kernel.org> =
wrote:
>
> Nathan Huckleberry (1):
>       fsverity: Remove WQ_UNBOUND from fsverity read workqueue

There's a *lot* of other WQ_UNBOUND users. If it performs that badly,
maybe there is something wrong with the workqueue code.

Should people be warned to not use WQ_UNBOUND - or is there something
very special about fsverity?

Added Tejun to the cc. With one of the main documented reasons for
WQ_UNBOUND being performance (both implicit "try to start execution of
work items as soon as possible") and explicit ("CPU intensive
workloads which can be better managed by the system scheduler"), maybe
it's time to reconsider?

WQ_UNBOUND adds a fair amount of complexity and special cases to the
workqueues, and this is now the second "let's remove it because it's
hurting things in a big way".

              Linus
