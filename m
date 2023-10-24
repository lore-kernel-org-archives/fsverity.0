Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B891FA5
	for <fsverity@lists.linux.dev>; Tue, 24 Oct 2023 05:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A8Jh1iCQ"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-40850b244beso31815565e9.2
        for <fsverity@lists.linux.dev>; Mon, 23 Oct 2023 22:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698123690; x=1698728490; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CEWHVBSJljVv3NcchzJwkvXeBjvw/X4JgbzHYj40s58=;
        b=A8Jh1iCQZujOBkNybVuIbcSkCohyt3C2+8iS9G0bPq2DC4FHJh+1jdT2onpPFVjwsr
         XViOZl6v0/DnZPW7fdS8s0k/SrroCC1NhQ+aUlkBO8eRcZYhfVf//5krYljqL8kSsx3s
         fqFjvwexYQLRg1CHDxZA1s6giD5+0XkSNkw64uU17FLCc6E5Vf4zhTLQdP/KE16GtdXS
         fnW057q25yMr5b08yqz6+zMcI9LgDHtHLfv2bXlmsLMZMrHGbz0Y0qzQt4l7bLAwERYj
         Xn6Tsax24zyhUPbsugi7WQMNbwwB5HeAoWYIrEVVXVuD3RoxfdLthvyD+/mUW3MYU+zj
         Vr4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698123690; x=1698728490;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CEWHVBSJljVv3NcchzJwkvXeBjvw/X4JgbzHYj40s58=;
        b=RXn2lCrCjuU2vvItWGGRPo53XXw+gci6d3mw3nDSl/3YXG1E9a29q63qwr36YbOSm0
         7HxBOkJCDBw8btQlPDLEpeeU+ugi7qeDzX7iB5v/r5dS3h16nTmgTkBVeahqYioNnBnC
         E9YSCRSVOuaA0cVS9EXWlm4pJ4carUUf9SAUfnwJ7svZ32F0BGOVEPgWEqsOL0IvPXDB
         4qRPRRPWNHG9HGr+Ib8do9mbyMIdmMpJjDp6TqrgM1PjELWWkuSh+hpDmEz+t+Bi16z2
         8NWh97uy7uDF1n093gGDhORjsVXxMqhD5mfrzT5MIB39gWJOX1C/gQFSLZFHX5AL19Vg
         2D6Q==
X-Gm-Message-State: AOJu0Yw1yGZAf8GVqr90m/d/rut1iFhYqTcaO1z0zlk4uRLvcQxzMAgk
	woQftmq8OGhrmWr+uXA1AokIw7svEaS7Mc9n9gI=
X-Google-Smtp-Source: AGHT+IHJ8NVG3SkzwjL8pMpvngsRPAghXbClEphUnlMSYKPg/zkDTp3e0uxz1aSbvGLuVxWJLQIkOau9WOgwG0hbyXk=
X-Received: by 2002:adf:ec50:0:b0:32d:cd57:1a58 with SMTP id
 w16-20020adfec50000000b0032dcd571a58mr8050644wrn.54.1698123689421; Mon, 23
 Oct 2023 22:01:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231023224100.2573116-1-song@kernel.org> <20231023224100.2573116-4-song@kernel.org>
 <CAADnVQJ-u_j8p7FMOpDHsUKjTa0E9sjA0G=zG8V484kuatNDvw@mail.gmail.com> <90721298-D511-4C37-B8BC-947215BFA59E@fb.com>
In-Reply-To: <90721298-D511-4C37-B8BC-947215BFA59E@fb.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Mon, 23 Oct 2023 22:01:18 -0700
Message-ID: <CAADnVQLC9T05WRgFebSEjMVomYJPvGmX9r2KEMqC11GdbRg9pA@mail.gmail.com>
Subject: Re: [PATCH v4 bpf-next 3/9] bpf: Introduce KF_ARG_PTR_TO_CONST_STR
To: Song Liu <songliubraving@meta.com>
Cc: Song Liu <song@kernel.org>, bpf <bpf@vger.kernel.org>, 
	"fsverity@lists.linux.dev" <fsverity@lists.linux.dev>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@kernel.org>, Kernel Team <kernel-team@meta.com>, 
	Eric Biggers <ebiggers@kernel.org>, "Theodore Ts'o" <tytso@mit.edu>, 
	Roberto Sassu <roberto.sassu@huaweicloud.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 23, 2023 at 8:25=E2=80=AFPM Song Liu <songliubraving@meta.com> =
wrote:
>
>
>
> > On Oct 23, 2023, at 5:49=E2=80=AFPM, Alexei Starovoitov <alexei.starovo=
itov@gmail.com> wrote:
> >
> > On Mon, Oct 23, 2023 at 3:41=E2=80=AFPM Song Liu <song@kernel.org> wrot=
e:
> >> +
> >> +        __bpf_kfunc bpf_get_file_xattr(..., const char *name__const_s=
tr,
> > ...
> >> +               case KF_ARG_PTR_TO_CONST_STR:
> >
> > CONST_STR was ok here, but as __const_str suffix is a bit too verbose.
> > How about just __str ? I don't think we'll have non-const strings in
> > the near future.
>
> I thought about this. While we don't foresee non-const strings in the
> near future, I think __const_str is acceptable. These annotations are
> part of the core APIs of kfuncs. As we enabled other subsystems to add
> kfuncs without touching BPF core, it makes sense to keep the annoations
> as stable as possible. Making __const_str a little shorter doesn't seem
> to justify the risk of changing it in the future.
>
> Also, we already have longer annotations like __refcounted_kptr. So I
> personally prefer to keep the annotation as __const_str.

Ok. That's fair. Didn't realize that such a long suffix is already in use.
