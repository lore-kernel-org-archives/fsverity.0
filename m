Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F637E
	for <fsverity@lists.linux.dev>; Tue, 24 Oct 2023 00:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bc/yrinG"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4083f613272so33420405e9.1
        for <fsverity@lists.linux.dev>; Mon, 23 Oct 2023 17:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698108439; x=1698713239; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1dcV+wl6BjoBEo6mtf3TaFoELi8dPYQ9jujca3nZVGk=;
        b=Bc/yrinGm0HNO8nry87t/HrCMvjm5BkoPLAvY3s4f6f5DBXr5DgfPR0jBnm1yyEEyf
         7poEW7msFJW0KJ/0CKjgpPmsmRB54MNaW/S0xqSpO6uZL5VfhJcQkcJAgy+KZhPldVQ7
         rCbaSAUWUSkbmXceGkQwKqltg7Z3G9imG+4E2FNggENeLlm1xDN9J7Ru4GQV+3FkKmp/
         jcyWkEUy6WAev9bC3rdXiRkiRdnmptCNA3jUmZC+zdtlxLuoOyN8I6WBALURK8d+R09W
         ytiOl9CHzmV7dQC0lhp7Sz+ySka5OB0ljttP254t0AfgxeTCi/MszAyZM0uBV/AzvDrq
         QCWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698108439; x=1698713239;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1dcV+wl6BjoBEo6mtf3TaFoELi8dPYQ9jujca3nZVGk=;
        b=jVz48GFMb8U/bjbr9YdpCceGUM9PyCE8msjKbNG47RJDfyVquwRWBUak0uhQmKWQHS
         oJ/+zNf1cGdbkrdotOLTLq0zGVyClySBSUo5SI0eN37ULemkQ1IxwQ73YRzSpp6M5z+S
         5ykam6jQrN9pXU+P5CjYKJwW/+E34fxxlPEyrhteM89drJAeDKqEIF/iTSRFUwVQcCJ6
         lL2MjJ22lueMo2Y8UcV8ap+JdMrsdD+nQkTO9PubtuCpSbvAT8jfVqfafuo3uCpvPCz8
         nIUeR3eyceLOX3FRIC1pG3bwRYlWF4MtpQqcxyO6CisKgz4+C7A8ElEiyfxlK1Fs8tYU
         AW/A==
X-Gm-Message-State: AOJu0YxeBTK0wuWXjZAnWQgLdSWWZVvwvT236IgvgtvfJcI84L1VDqP9
	TY+qx7dp/a4jnyBGbjDXs/L6kerB8QO6d1WIzGk=
X-Google-Smtp-Source: AGHT+IFTp5Mg79CdO61f0WwT4g5nX+6hm6ENK8nNucBy+rXEIbiBj/sXTWMobfZjLJi3HuVXtBJ8Wji2yx+aA1QLkgo=
X-Received: by 2002:a05:6000:1109:b0:32d:a41b:bd47 with SMTP id
 z9-20020a056000110900b0032da41bbd47mr7338476wrw.59.1698108439071; Mon, 23 Oct
 2023 17:47:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231023224100.2573116-1-song@kernel.org> <20231023224100.2573116-3-song@kernel.org>
In-Reply-To: <20231023224100.2573116-3-song@kernel.org>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Mon, 23 Oct 2023 17:47:07 -0700
Message-ID: <CAADnVQKcOvJ5rZRQuCn15mmVp0LLuNnQ=3kHGAEnZ7nVhJ=Ffg@mail.gmail.com>
Subject: Re: [PATCH v4 bpf-next 2/9] bpf: Factor out helper check_reg_const_str()
To: Song Liu <song@kernel.org>
Cc: bpf <bpf@vger.kernel.org>, fsverity@lists.linux.dev, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@kernel.org>, 
	Kernel Team <kernel-team@meta.com>, Eric Biggers <ebiggers@kernel.org>, 
	"Theodore Ts'o" <tytso@mit.edu>, Roberto Sassu <roberto.sassu@huaweicloud.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 23, 2023 at 3:41=E2=80=AFPM Song Liu <song@kernel.org> wrote:
>
> This helper will be used to check whether a kfunc arg points to const
> string. Add a type check (PTR_TO_MAP_VALUE) in case the helper is
> misused in the future.

The commit log is cryptic.
Without reading the patch first it makes little sense.
Most reviewers read the commit log first and then proceed to look at the co=
de.
Please reword all commit logs in this set.
'This helper' should probably be 'The check_reg_const_str() helper'.
The log should also say that the checking logic is refactored out of
the existing code and addition of PTR_TO_MAP_VALUE check is the only differ=
ence.
