Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF4A7E
	for <fsverity@lists.linux.dev>; Tue, 24 Oct 2023 00:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b+uPzt21"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4083f61312eso31717845e9.3
        for <fsverity@lists.linux.dev>; Mon, 23 Oct 2023 17:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698108562; x=1698713362; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x0ulcN82yK0xuUyD6lO765S1jHXQgEqCU5qPrV7DjcA=;
        b=b+uPzt21v2Qgyz7OkZot9PHHDYOo3SDFMghfNkUEtNXJWGxeHx5rbPObl5x4Sd6iLQ
         A6YRTumYICcJtmM5DnZnbZOs8WMICBrUsDqOsRBKEWZhkjg4S7X4kQxR5JQew3GlslmF
         jd1ZNaffKyKtkZYjo5wYDcBfxIW2pVT7V8SH/2wjsi5CwHIpQ++ZsZ9QO6+GsuRQvzCs
         d328v0kElhvVCVyWxu3BUjfoLgjGWd3DVuyxJwHHC7CXboghhtQdgcpIitkZ+RPpQvU4
         xLRiAjN6yshXZEyrFAhSZru28Dyffiz/F0FVdJLtCUkLxPuSymy8HZcopkohR6q8MCX5
         DJtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698108562; x=1698713362;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x0ulcN82yK0xuUyD6lO765S1jHXQgEqCU5qPrV7DjcA=;
        b=WKAgXLXIQtfMYyDfRTCfrBCzB2InMh9WoM5wTpMo6Lxf0s7EK0b9/SStTDj5qx+N03
         UlElTJUUhio7bHSfeF89yfY8chvGwDwoQ+FMCFO2Ba/xW5EGntiZJO5cG6UYTZ3GMvE4
         98uLh6BwF8mZhoVt+eg3dDDRP0LrJbP+mdGr6axkcsrFQpoiPN6viUwra3Jg+PMklQ7B
         SUl33wtheRtBuom7+BcrEgfxmeassjIJjqZnZwZF4CbCOPu44Nq2dqD4q+D3mmxVLv4H
         Gp2/IOdCFEfITDpRO0dAnIaMdhP0a3Y7qA/wTTm/4APDkx2SAF0JNNRO898LbVDrp4p7
         iz+g==
X-Gm-Message-State: AOJu0YyLQyLyID/H9Hr4QsRs/wIw9G7rTKvsVKtoVqtSBM66jYaZf0QC
	9phEJ/mCm8klVltWBwQdEmFOaheijjCGPywMqtM=
X-Google-Smtp-Source: AGHT+IHalY8DpmhBkWTwFrbSLAnT2Y3uDHACwjVWv7OVsMZ4JkCE/5HfSxeT+0LBwHHuWPzkacC+KfRLUnhdeajgj6c=
X-Received: by 2002:a05:600c:474b:b0:3fb:feb0:6f40 with SMTP id
 w11-20020a05600c474b00b003fbfeb06f40mr8295710wmo.11.1698108562138; Mon, 23
 Oct 2023 17:49:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231023224100.2573116-1-song@kernel.org> <20231023224100.2573116-4-song@kernel.org>
In-Reply-To: <20231023224100.2573116-4-song@kernel.org>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Mon, 23 Oct 2023 17:49:11 -0700
Message-ID: <CAADnVQJ-u_j8p7FMOpDHsUKjTa0E9sjA0G=zG8V484kuatNDvw@mail.gmail.com>
Subject: Re: [PATCH v4 bpf-next 3/9] bpf: Introduce KF_ARG_PTR_TO_CONST_STR
To: Song Liu <song@kernel.org>
Cc: bpf <bpf@vger.kernel.org>, fsverity@lists.linux.dev, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@kernel.org>, 
	Kernel Team <kernel-team@meta.com>, Eric Biggers <ebiggers@kernel.org>, 
	"Theodore Ts'o" <tytso@mit.edu>, Roberto Sassu <roberto.sassu@huaweicloud.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 23, 2023 at 3:41=E2=80=AFPM Song Liu <song@kernel.org> wrote:
> +
> +        __bpf_kfunc bpf_get_file_xattr(..., const char *name__const_str,
...
> +               case KF_ARG_PTR_TO_CONST_STR:

CONST_STR was ok here, but as __const_str suffix is a bit too verbose.
How about just __str ? I don't think we'll have non-const strings in
the near future.
