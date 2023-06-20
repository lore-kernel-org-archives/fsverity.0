Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E962AB55
	for <fsverity@lists.linux.dev>; Tue, 20 Jun 2023 19:35:11 +0000 (UTC)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-5700401acbeso55410037b3.0
        for <fsverity@lists.linux.dev>; Tue, 20 Jun 2023 12:35:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687289710; x=1689881710;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Igs5MaDb++fkS356JMQlbeWGJAbuiJzA5fQAggLQCbs=;
        b=YxtG32Y9inzfeSTeEcDRqpHJMj3e25RNXLYWV8dQibiYFpzKqQ2+u00DRY3ICAyAiN
         hxS75KZbNI6PhN6fb3HjyWdKDYT1iKkX1oV+5Fltb1FOkwcKZZzJIuoJTFww5EDJl6IJ
         7MB86fnZom6VtSO0U7nfWfvgYY+Kc5iWfTrueSdrtM6rrI5MoB0jBJUuYGj25bYQ05aS
         jhAADIstnKakGNm/VvR6h398x5DH7Ez0wtCazT8fiQEdlxoRqGF6wRecH8t0TDiQdNIf
         kac3BXr9A4B+f7V1/BEO9qlDR0mt4WFIAiOkv8OCBJz8vQ00Ri6gj2JfKVANX/8kToRI
         sEUA==
X-Gm-Message-State: AC+VfDxYSBLJcbGsdtpr5nR92RUbv/864JrHSljIwjJ3ZD74EYLMAkWO
	HtopFi1QhOuvNI1OM06QffQSrjwMlMTDfw==
X-Google-Smtp-Source: ACHHUZ594SvOyqehpmoO8Uf+mz4W5E92KZ7bF8SuLPOd0nRxSw09u5+RYk5UVrIIQbF6MTExdP836w==
X-Received: by 2002:a81:84c4:0:b0:56f:ecc4:7dbe with SMTP id u187-20020a8184c4000000b0056fecc47dbemr14380275ywf.34.1687289710184;
        Tue, 20 Jun 2023 12:35:10 -0700 (PDT)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id l64-20020a0dc943000000b0055a7c2375dfsm635675ywd.101.2023.06.20.12.35.09
        for <fsverity@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jun 2023 12:35:09 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-5700401acbeso55409867b3.0
        for <fsverity@lists.linux.dev>; Tue, 20 Jun 2023 12:35:09 -0700 (PDT)
X-Received: by 2002:a25:ae20:0:b0:bc4:515e:cb0f with SMTP id
 a32-20020a25ae20000000b00bc4515ecb0fmr10813293ybj.1.1687289709261; Tue, 20
 Jun 2023 12:35:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230619221048.10335-1-ebiggers@kernel.org> <CAMw=ZnQCBJM71wi-yO99yi+KTy=WtR2+jJxU2snvWgJTzTeeFw@mail.gmail.com>
 <20230619234939.GA2320@sol.localdomain> <CAMw=ZnRVKQz9tY=DH9eoAMeEd07tdXMENW0Lhbx2tApH==5D_Q@mail.gmail.com>
 <b2ee0120b5f3caec6ddd617c1594cc05d66a6687.camel@HansenPartnership.com>
In-Reply-To: <b2ee0120b5f3caec6ddd617c1594cc05d66a6687.camel@HansenPartnership.com>
From: Luca Boccassi <bluca@debian.org>
Date: Tue, 20 Jun 2023 20:34:58 +0100
X-Gmail-Original-Message-ID: <CAMw=ZnQiu09jBsdbxxzyE3j98GqnmxxML+dwOQQs9kct1KZhWA@mail.gmail.com>
Message-ID: <CAMw=ZnQiu09jBsdbxxzyE3j98GqnmxxML+dwOQQs9kct1KZhWA@mail.gmail.com>
Subject: Re: [PATCH v2] fsverity: improve documentation for builtin signature support
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Eric Biggers <ebiggers@kernel.org>, fsverity@lists.linux.dev, 
	linux-integrity@vger.kernel.org, linux-doc@vger.kernel.org, 
	Colin Walters <walters@verbum.org>, Alexander Larsson <alexl@redhat.com>, 
	Victor Hsieh <victorhsieh@google.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 20 Jun 2023 at 13:59, James Bottomley
<James.Bottomley@hansenpartnership.com> wrote:
>
> On Tue, 2023-06-20 at 01:42 +0100, Luca Boccassi wrote:
> > On Tue, 20 Jun 2023 at 00:49, Eric Biggers <ebiggers@kernel.org>
> > wrote:
> > > On Tue, Jun 20, 2023 at 12:04:39AM +0100, Luca Boccassi wrote:
> [...]
> > > > > +- fs-verity builtin signatures are in PKCS#7 format, and the
> > > > > public
> > > > > +  keys are in X.509 format.  These data formats are
> > > > > unnecessarily
> > > > > +  complex and prone to vulnerabilities.  (fs-verity builtin
> > > > > signatures
> > > > > +  were made to use these formats because other kernel
> > > > > subsystems, such
> > > > > +  as the module loader, unfortunately used these formats
> > > > > already.
> > > > > +  Note, these formats should still be used when they are the
> > > > > only
> > > > > +  option to have signatures at all.)  Userspace signature
> > > > > verification
> > > > > +  avoids having to enable CONFIG_FS_VERITY_BUILTIN_SIGNATURES
> > > > > and the
> > > > > +  associated kernel attack surface.  Userspace also has the
> > > > > +  flexibility to choose simpler formats.  For example,
> > > > > consider using
> > > > > +  straightforward Ed25519 keys and signatures with `libsodium
> > > > > +
> > > > > <https://libsodium.gitbook.io/doc/public-key_cryptography/publi
> > > > > c-key_signatures>`_.
> > > > > +
> > > > > +  IMA appraisal, which supports fs-verity, does not use
> > > > > PKCS#7, so it
> > > > > +  partially avoids this issue as well (though it does use
> > > > > X.509).
> > > > > +
> > > > > +  If you are considering making use of "advanced" features of
> > > > > X.509
> > > > > +  and/or PKCS#7, please also keep in mind that these
> > > > > "advanced"
> > > > > +  features do not always work as intended with the kernel.
> > > > > For
> > > > > +  example, the kernel does not check X.509 certificate
> > > > > validity times.
> > > >
> > > > Sorry but this still reads as way too opinionated and generic,
> > > > rather than being fsverity-specific.
> > > >
> > > > Please simplify to convey the same
> > > > message in more concise way, perhaps something along these lines:
> > > >
> > > > - fs-verity builtin signatures are in PKCS#7 format, and the
> > > > public keys are in X.509 format. IMA appraisal, which supports
> > > > fs-verity, uses a custom signature format rather than PKCS#7 and
> > > > X.509 for public keys. Alternative formats for signatures and
> > > > public keys are not supported for builtin signatures or IMA
> > > > appraisal. For fully flexible and customized signature and public
> > > > keys formats, while also avoiding to expose the kernel to
> > > > untrusted input, signature verification can be implemented by a
> > > > trusted userspace component as described at <pointer to
> > > > appropriate section>
> > >
> > > That is not the same message at all, as it omits the mention of the
> > > disadvantages of PKCS#7 and X.509 compared to raw signatures, which
> > > was the main point.  So no, I don't think your version would be
> > > better.
> >
> > The 'disadvantages' are your personal opinions. It's fine to have
> > opinions, it's less fine to present them as if they were industry
> > consensus in public project-wide documentation.
> >
> > > It seems that what is going on here is that you are invested
> > > heavily into existing X.509 and PKCS#7 based systems, and as a
> > > result you do not want the problems with these formats to be
> > > described anywhere in the kernel documentation.  That is
> > > understandable, but that is a special interest that should not be
> > > catered to here.  This documentation is trying to help users make
> > > a decision of what type of signature to use in new systems.  And
> > > yes, it is fsverity specific documentation, but there is no way for
> > > it to make the needed point without dicussing the underlying data
> > > formats.
> >
> > Industry standards are by very definition the opposite of 'special
> > interests'. Look, I tried my best to provide constructive and
> > actionable feedback in previous replies, but given you seem only
> > interested in casting aspersions and hijacking kernel documentation
> > to promote the latest proprietary google-toy-of-the-month:
>
> OK, could I try to share the perspective of of someone who's worked in
> security with users for a long time. I get that every security expert
> thinks standard key formats are insecure, usually for two reasons
>
>    1. In security simpler is better
>    2. They can always come up with a simple, totally secure, key
>       representation
>
> The problem with the above is that it means every tool invented by a
> different security expert has a different key format and we don't have
> any interoperability between them. This is great from a security point
> of view but terrible for usability: users want both interoperability
> and pluggability (particularly the ability to use tokens or other
> security devices in place of keys). Our security systems are not coded
> for absolute security (otherwise they would be completely balkanized);
> they're a tradeoff between usability and security. There's actually
> even a security reason for this: a security tool no-one can use isn't
> contributing to the security of the ecosystem, however internally
> secure and up to date the tool is. It's not just Google who has a habit
> of special coding security systems to work on Android (with Titan-M), I
> can't use wireguard on Linux because I long ago mandated that critical
> things like VPN keys should be in secure keystores and I use the TPM on
> Linux for openvpn. Wireguard, because it has a simple and secure key
> format, won't plug into the kernel TPM system without a whole load of
> speciallised glue, so I'm stuck with openvpn.
>
> The debate you two are having now is about the most important thing we
> can ever decide: where to draw the line between usability and security.
> If you conduct it in a more constructive manner and try to see each
> other's point of view (Eric: how would I use a TPM with fsverity on
> Linux? and Luca: how much interoperability does fsverity really need
> for debian?) because usability without security is as equally useless
> as security without usability.

You make very good points, it's always about finding compromises. For
my use case, interoperability is fundamental: if I needed to have a
completely different infrastructure, signing, tooling and maintenance
strategy for dm-verity, fs-verity, kernel modules, livepatching, UEFI,
TPM signed policies and who knows what else, I'd lose my mind. But I
am happy to compromise and ack the latest revision, and I've already
done so.

Kind regards,
Luca Boccassi
