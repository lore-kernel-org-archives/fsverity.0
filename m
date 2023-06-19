Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2DE114283
	for <fsverity@lists.linux.dev>; Mon, 19 Jun 2023 19:39:21 +0000 (UTC)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-570284c7e61so44731847b3.1
        for <fsverity@lists.linux.dev>; Mon, 19 Jun 2023 12:39:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687203560; x=1689795560;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PDcAVVMQ9o19+8vUm6LaUCIb17qoj1O3PntNqFtggj8=;
        b=BeL5uvRggTOrpyH6FbBLN7ig+PiBG2YK9sIYnQhlGUPCW1n1H+is7GNRro90SEylLB
         765u2cN77EdiKN6FSI5EvXGTkb4kbq4hbwtFsZfABHAhhSd/z5O33sDDNjy5FjVAs4uj
         GEDZz60OWLiQn53U2A/le0eCexsEnYAjdYN4w9WibXsKWmjQMtlhMrRuTTo/pryWW2cP
         bbSZKyUiyDmOBLNhfWWTOlyikIzH7/Ms2YnXaBQrxZFR/qmu9B4PieniijT25S98QPmr
         IJkUzMFTdkHcyhTn1VphJi2hdMWr5fhZwnKwnaEzo0pIpUH0/MprJ366MmNR+Xq8jyYb
         dLVQ==
X-Gm-Message-State: AC+VfDwOAtMWok+qtBPyp3DJYFgEYHpXpR5ZT8317rmEI7LszbVCqJFj
	bV9+OIIP8fejsw9m5JV9KwXfA02LQN1oFA==
X-Google-Smtp-Source: ACHHUZ5W+rb7RNZmYslrJoU0HJZkDKNsf0rxPuUjA8PqG8LOX8UFDSmxfj/UfL52Mduz1dnQqr7JCA==
X-Received: by 2002:a81:a115:0:b0:570:6654:68c8 with SMTP id y21-20020a81a115000000b00570665468c8mr9504978ywg.1.1687203560479;
        Mon, 19 Jun 2023 12:39:20 -0700 (PDT)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id m9-20020a0dca09000000b00570589c5aedsm128138ywd.7.2023.06.19.12.39.20
        for <fsverity@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jun 2023 12:39:20 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-5701e8f2b79so44789547b3.0
        for <fsverity@lists.linux.dev>; Mon, 19 Jun 2023 12:39:20 -0700 (PDT)
X-Received: by 2002:a81:4984:0:b0:570:6a11:9795 with SMTP id
 w126-20020a814984000000b005706a119795mr11174985ywa.40.1687203559860; Mon, 19
 Jun 2023 12:39:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230615230537.30429-1-ebiggers@kernel.org> <CAMw=ZnR69AhMMQUOwKv9RtP85JzxQhMGO3yzyeEagWxaGiPAZg@mail.gmail.com>
 <20230616021707.GA87129@sol.localdomain> <CAMw=ZnTEV=GuEE=wB0Z4E1x_uH5zzjyQkB1ycrYnWB2GCMaRTA@mail.gmail.com>
 <20230617045103.GA1090@sol.localdomain>
In-Reply-To: <20230617045103.GA1090@sol.localdomain>
From: Luca Boccassi <bluca@debian.org>
Date: Mon, 19 Jun 2023 20:39:08 +0100
X-Gmail-Original-Message-ID: <CAMw=ZnQitwaR+oCKzxPxAZ1Ehs-86bfHbo0uPTeKe5a+5geV6A@mail.gmail.com>
Message-ID: <CAMw=ZnQitwaR+oCKzxPxAZ1Ehs-86bfHbo0uPTeKe5a+5geV6A@mail.gmail.com>
Subject: Re: [PATCH] fsverity: improve documentation for builtin signature support
To: Eric Biggers <ebiggers@kernel.org>
Cc: fsverity@lists.linux.dev, linux-integrity@vger.kernel.org, 
	linux-doc@vger.kernel.org, Colin Walters <walters@verbum.org>, 
	Alexander Larsson <alexl@redhat.com>, Victor Hsieh <victorhsieh@google.com>
Content-Type: text/plain; charset="UTF-8"

On Sat, 17 Jun 2023 at 05:51, Eric Biggers <ebiggers@kernel.org> wrote:
>
> On Fri, Jun 16, 2023 at 02:27:28PM +0100, Luca Boccassi wrote:
> > > Unfortunately just because PKCS#7, X.509, and ASN.1 is being used does not mean
> > > it is a good idea.  Have you read the kernel code that implements these formats?
> > > A few years ago I went through some of it.  Here are some of the bugs I fixed:
> > >
> > >     2eb9eabf1e86 ("KEYS: fix out-of-bounds read during ASN.1 parsing")
> > >     624f5ab8720b ("KEYS: fix NULL pointer dereference during ASN.1 parsing [ver #2]")
> > >     e0058f3a874e ("ASN.1: fix out-of-bounds read when parsing indefinite length item")
> > >     81a7be2cd69b ("ASN.1: check for error from ASN1_OP_END__ACT actions")
> > >     0f30cbea005b ("X.509: reject invalid BIT STRING for subjectPublicKey")
> > >     54c1fb39fe04 ("X.509: fix comparisons of ->pkey_algo")
> > >     971b42c038dc ("PKCS#7: fix certificate chain verification")
> > >     29f4a67c17e1 ("PKCS#7: fix certificate blacklisting")
> > >     437499eea429 ("X.509: fix BUG_ON() when hash algorithm is unsupported")
> > >     4b34968e77ad ("X.509: fix NULL dereference when restricting key with unsupported_sig")
> >
> > I have no doubt that there are bugs, as I have no doubts that there
> > are bugs in every other subsystem, including fsverity, once you start
> > looking hard enough.
>
> My point was not that there are bugs, but rather that there are *unnecessary*
> bugs (many with possible security impact) that are directly caused by the
> complexities of these formats versus the alternatives.
>
> > That's not the point. The point is that having
> > the documentation of one kernel subsystem disparaging the mechanisms
> > that are central to other kernel subsystems' functionality is weird
> > and out of place. Something like that is fine to post on social media
> > or a blog post or so. A user jumping from one page of kernel doc
> > saying, paraphrasing heavily for the sake of argument, "use pkcs7 to
> > ensure the security of your system via secure boot, measured boot and
> > signed kernel modules" and another saying "pkcs7 is bad and broken,
> > stay away from it" is just strange, confusing and incoherent from the
> > point of view of a reader.
>
> I'll add a note that PKCS#7 and X.509 should still be used in situations where
> they are the only option.  I think that would handle your main concern here,
> which is that people might misunderstand the paragraph as recommending using no
> signatures, instead of signatures using a PKCS#7 and X.509 based system.
>
> I don't think it would be appropriate to remove the paragraph entirely.  It
> provides useful information that helps users decide what type of signatures to
> use.  I understand that people who are invested greatly into PKCS#7 and X.509
> based systems might be resistant to learning about the problems with these
> formats, but that is to be expected.

Given this is a kernel doc (as opposed to, say, fsverity-utils's
readme), my concern is with having confusing and contradicting
documentation. If you reword it to make it specific to fsverity or so,
it would probably be fine.

Kind regards,
Luca Boccassi
