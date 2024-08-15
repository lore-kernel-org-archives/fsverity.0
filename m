Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C496978C73
	for <fsverity@lists.linux.dev>; Thu, 15 Aug 2024 19:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723749099; cv=none; b=nlCyWEvuzpGtBJyMfmGj6Dx5pV9ocrEuN6MDgTkgPqfqwAlPsLHzbKR+n4QH9cfyZ/LmU7MfLpDfxQAVvMvd4TsPIGV6He4THEw9exDLMadretWxcZB1EUECK92NGld4VeRAHhFQxN5e6HkYpQ8hIQNj61KxRikzzJpWDsNL85M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723749099; c=relaxed/simple;
	bh=iT8KcNkm5Vc4rWXXWzYad5f95oy1oD7zS37mBnhk8qY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HfEwdGKhUOI8Ovo9rEpDUyU5hKqi63IGdy2Nkep77rA1FfjDP+NjI3oIB21Ydwz2B0gtPv8c0r0u8BzXdGtPTgpQwi2BXZhRwMSC7JIW+/MiLy4Tp8dUkRMOP9CV+cPwnAWU/qGBuVG8HlBMqPFv2ujPrPok0sll72d0JLoHung=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=RlqiAFIi; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="RlqiAFIi"
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e1171e57a0dso708194276.0
        for <fsverity@lists.linux.dev>; Thu, 15 Aug 2024 12:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1723749097; x=1724353897; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FG2S68ohhhN7mqN86rt7i0TQ0nSZljd6+7LgE4Sf4cU=;
        b=RlqiAFIiJkpjskaOPVnx2QzHeEp9/IHsjaZTc9Ma4OKDs0XoHI+Xtg1l7CI+duPd9c
         icxpmdVfe1LaQQyq+YvFeMLN5Kut/OswPLcJY48z24bsF5RFosaQBiMPeD13g9lDZenf
         QFJWrph9OJSRlVHvLAPwJ7Da4jkfe+h9y9xE8V0nOpBjGORzrEIUHKxsFhQSbesSgY1K
         pMXJYEnc6kSKIebzYdDTOBGG4vNcHDx+crl5IxCDBDDA/TIWAt4uBihAo+7o17synSN/
         N4FwM3T8J3XfPpSvwkudifHVUQi+Hm3/8jbe/oV8dAcxS5xtPr5ML/SjzwH6Z5Oj02Dl
         RXPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723749097; x=1724353897;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FG2S68ohhhN7mqN86rt7i0TQ0nSZljd6+7LgE4Sf4cU=;
        b=Fe1yPAID8eIb+1i4Dm0LatxOLcc80euf8h5ees2pkrWYd4rcbA0yvQ28EYNblfbXM2
         ClVmM5Leg1ADbgf5g1jPUKtm2elrPP9bKkw+X0p/BnJlD1xKdN36WLowlHLW95kJe87+
         XOu9bVGxQHb/5IeTyOmV0fM3oe3h27yJy0ee3QUYTyP9EBZRoREGA5qxLnx3tcOyVA+G
         GUZcAk7lRBVI7Wn1Rw9XtwDXuU8oBZt/8VO4SsMcKkg4r2Ot3yzWkpwusZtwJXCYBEX9
         16aZ7oMQSdqtA6z7KGxE96l22t8JQgzfF+iNfKEz+gFn4Ntn9KuawgHPI9openksWeBa
         Kp0Q==
X-Forwarded-Encrypted: i=1; AJvYcCW11gjLnoE0A+CLdMnGW2Mmeun+HjynHct4o30xeqlW1GMq2yuJm2Lg7QGWD3+QqrT6WjAsYp7C9gusRLZJIQ8/rCvP+gpRPlw=
X-Gm-Message-State: AOJu0YwfLkQdJ7oa4k5r6SugYhKOr0s3FWFL+CEp5gb4SgO+Dpwmp9us
	Wku+98WQeVoWorECLLmG3Lq5jDf0uvWcOwyTMP3qk6THQSZl38Ij/cL5oSX/WZBUmGIe1BWqv9k
	69lVHoV4mIB3tV+xl6bSnABYHEV/B6EacmYTk
X-Google-Smtp-Source: AGHT+IHDMOF+V1detUBYqlec+/ieaF+20T3NZqgS/3i5J9m5G5afNPzd29f7rdg4GSJXu5gGfjj7nsQ0DdDhqrEmFZo=
X-Received: by 2002:a05:690c:3342:b0:651:4b29:403c with SMTP id
 00721157ae682-6af1b83243amr43005767b3.2.1723749095960; Thu, 15 Aug 2024
 12:11:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1722665314-21156-1-git-send-email-wufan@linux.microsoft.com>
 <1722665314-21156-3-git-send-email-wufan@linux.microsoft.com>
 <20240810155000.GA35219@mail.hallyn.com> <e1dd4dcf-8e2e-4e7b-9d40-533efd123103@linux.microsoft.com>
 <CAHC9VhTYT3RTG1FbnZQ2F68a16gU9_QJ-=LSGbroP-40tpRTiw@mail.gmail.com> <cbf1caa0-835b-4d1d-aed5-9741eb10cf8b@linux.microsoft.com>
In-Reply-To: <cbf1caa0-835b-4d1d-aed5-9741eb10cf8b@linux.microsoft.com>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 15 Aug 2024 15:11:24 -0400
Message-ID: <CAHC9VhQ6ndv4wU4CBBhABHuriPDg=CmBi+_TbjCg+DNsCRuRSA@mail.gmail.com>
Subject: Re: [PATCH v20 02/20] ipe: add policy parser
To: Fan Wu <wufan@linux.microsoft.com>, "Serge E. Hallyn" <serge@hallyn.com>
Cc: corbet@lwn.net, zohar@linux.ibm.com, jmorris@namei.org, tytso@mit.edu, 
	ebiggers@kernel.org, axboe@kernel.dk, agk@redhat.com, snitzer@kernel.org, 
	mpatocka@redhat.com, eparis@redhat.com, linux-doc@vger.kernel.org, 
	linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org, 
	fsverity@lists.linux.dev, linux-block@vger.kernel.org, 
	dm-devel@lists.linux.dev, audit@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Deven Bowers <deven.desai@linux.microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 14, 2024 at 2:23=E2=80=AFPM Fan Wu <wufan@linux.microsoft.com> =
wrote:
> On 8/13/2024 6:53 PM, Paul Moore wrote:
> > On Tue, Aug 13, 2024 at 1:54=E2=80=AFPM Fan Wu <wufan@linux.microsoft.c=
om> wrote:
> >> On 8/10/2024 8:50 AM, Serge E. Hallyn wrote:
> >>> On Fri, Aug 02, 2024 at 11:08:16PM -0700, Fan Wu wrote:
> >>>> From: Deven Bowers <deven.desai@linux.microsoft.com>
> >>>>
> >>>> IPE's interpretation of the what the user trusts is accomplished thr=
ough
> >>>
> >>> nit: "of what the user trusts" (drop the extra 'the')
> >>>
> >>>> its policy. IPE's design is to not provide support for a single trus=
t
> >>>> provider, but to support multiple providers to enable the end-user t=
o
> >>>> choose the best one to seek their needs.
> >>>>
> >>>> This requires the policy to be rather flexible and modular so that
> >>>> integrity providers, like fs-verity, dm-verity, or some other system=
,
> >>>> can plug into the policy with minimal code changes.
> >>>>
> >>>> Signed-off-by: Deven Bowers <deven.desai@linux.microsoft.com>
> >>>> Signed-off-by: Fan Wu <wufan@linux.microsoft.com>
> >>>
> >>> This all looks fine.  Just one comment below.
> >>>
> >> Thank you for reviewing this!
> >>
> >>>
> >>>> +/**
> >>>> + * parse_rule() - parse a policy rule line.
> >>>> + * @line: Supplies rule line to be parsed.
> >>>> + * @p: Supplies the partial parsed policy.
> >>>> + *
> >>>> + * Return:
> >>>> + * * 0              - Success
> >>>> + * * %-ENOMEM       - Out of memory (OOM)
> >>>> + * * %-EBADMSG      - Policy syntax error
> >>>> + */
> >>>> +static int parse_rule(char *line, struct ipe_parsed_policy *p)
> >>>> +{
> >>>> +    enum ipe_action_type action =3D IPE_ACTION_INVALID;
> >>>> +    enum ipe_op_type op =3D IPE_OP_INVALID;
> >>>> +    bool is_default_rule =3D false;
> >>>> +    struct ipe_rule *r =3D NULL;
> >>>> +    bool first_token =3D true;
> >>>> +    bool op_parsed =3D false;
> >>>> +    int rc =3D 0;
> >>>> +    char *t;
> >>>> +
> >>>> +    r =3D kzalloc(sizeof(*r), GFP_KERNEL);
> >>>> +    if (!r)
> >>>> +            return -ENOMEM;
> >>>> +
> >>>> +    INIT_LIST_HEAD(&r->next);
> >>>> +    INIT_LIST_HEAD(&r->props);
> >>>> +
> >>>> +    while (t =3D strsep(&line, IPE_POLICY_DELIM), line) {
> >>>
> >>> If line is passed in as NULL, t will be NULL on the first test.  Then
> >>> you'll break out and call parse_action(NULL), which calls
> >>> match_token(NULL, ...), which I do not think is safe.
> >>>
> >>> I realize the current caller won't pass in NULL, but it seems worth
> >>> checking for here in case some future caller is added by someone
> >>> who's unaware.
> >>>
> >>> Or, maybe add 'line must not be null' to the function description.
> >>
> >> Yes, I agree that adding a NULL check would be better. I will include =
it
> >> in the next version.
> >
> > We're still waiting to hear back from the device-mapper devs, but if
> > this is the only change required to the patchset I can add a NULL
> > check when I merge the patchset as it seems silly to resend the entire
> > patchset for this.  Fan, do you want to share the code snippet with
> > the NULL check so Serge can take a look?
>
> Sure, here is the diff.
>
> diff --git a/security/ipe/policy_parser.c b/security/ipe/policy_parser.c
> index 32064262348a..0926b442e32a 100644
> --- a/security/ipe/policy_parser.c
> +++ b/security/ipe/policy_parser.c
> @@ -309,6 +309,9 @@ static int parse_rule(char *line, struct
> ipe_parsed_policy *p)
>          int rc =3D 0;
>          char *t;
>
> +       if (IS_ERR_OR_NULL(line))
> +               return -EBADMSG;
> +
>          r =3D kzalloc(sizeof(*r), GFP_KERNEL);
>          if (!r)
>                  return -ENOMEM;
>

Thanks.

Serge, it looks like this should resolve your concern?

--=20
paul-moore.com
