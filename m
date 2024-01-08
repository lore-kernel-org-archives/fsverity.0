Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD34312B93
	for <fsverity@lists.linux.dev>; Mon,  8 Jan 2024 09:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=isovalent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=isovalent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isovalent.com header.i=@isovalent.com header.b="ZdCInJN9"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a28bf46ea11so276298766b.1
        for <fsverity@lists.linux.dev>; Mon, 08 Jan 2024 01:15:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isovalent.com; s=google; t=1704705356; x=1705310156; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TQw0PBv7H3F9npAXhHpc/yO+0aZTdw3iW7XYRioBY9M=;
        b=ZdCInJN9buEG4kh0nWeBIyMFeOZqAkibDS1i2WcZTTdcZD/Su5ntn3H6Pk12XjKZex
         moMzQRCx3oaKxwH027rFgdaYjeUYs+iZkpf5wN3VEkFZnJY3+Nf5ZLk1t/4A+3wzHu14
         HFziwA4tXeGZjkAZTqwLW/DVA6wnGu80XDZA3DfZd12bSZoz1ecEKC9gmu2C9sCs/NZC
         IK0XrYJ0ckAHzFqXPXuD3DlpgaImYJy62QGkWwaytuQXSCzOLAsqL2o+ru5qvXI8AUDn
         YslMQM7RcnBGflJ7aD9kHL6LVP7qcsscGPEPgtaKx4LUxV+aY9kGvDVcoLOeb2UZVSM2
         N+pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704705356; x=1705310156;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TQw0PBv7H3F9npAXhHpc/yO+0aZTdw3iW7XYRioBY9M=;
        b=asrqQWOYpCcBtDsoGrIIQ0OL6UoI6j/wMD1losYpbQvRC1kG+x0lB2kgbFoNzXJQmo
         Mdp+sBNC4nmpS5QK8Qki4Dj3N6O25dS0VLzfo4Ekrs7ruZZ9QPEJpXyLOwJZJNMCy587
         q93/hYfQ08sM0QUZ9A/O+dpfhO/jc/50uxtBNwtZ8n5jiBGvI5DHeAAlH8f2J8ZubG0k
         9FEj79+OJoU3HC83qPElUYhC9U23qqjr0VB487TkVTcQP/D7b8lJO/6jqasw93zYfmHM
         M5nGkhFXAbysZ4h7XlGJyF+bwNiVGi3+oifmNAaBor9NzViiEN49IsIttKjCbwrw3Av1
         4H2w==
X-Gm-Message-State: AOJu0YzAkxgzAy2X8kWCOOrszvHVZliEmydZBxzEN69Q47Z8odNWMmbH
	jgAbPFQCIvAetuiS0oWME24fgLxjRE0XJbe2wWbFtvPQHq/ouA==
X-Google-Smtp-Source: AGHT+IF5FdPBR02bei/X14Ub000OcoVXRo17m86hQ2MPBeQuC7hWG3H6v1jptH9g+ATyuoxWlGDUexOGIPMl6jmv1Ns=
X-Received: by 2002:a17:906:1797:b0:a28:bd9c:8363 with SMTP id
 t23-20020a170906179700b00a28bd9c8363mr3034170eje.57.1704705356043; Mon, 08
 Jan 2024 01:15:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1704565248.git.dxu@dxuuu.xyz>
In-Reply-To: <cover.1704565248.git.dxu@dxuuu.xyz>
From: Lorenz Bauer <lorenz.bauer@isovalent.com>
Date: Mon, 8 Jan 2024 10:15:45 +0100
Message-ID: <CAN+4W8gPeQ2OjoYLKXsNPyhSVTB+vcSaS3Xzw=-M9Rf5MXfKPg@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 0/3] Annotate kfuncs in .BTF_ids section
To: Daniel Xu <dxu@dxuuu.xyz>
Cc: linux-input@vger.kernel.org, coreteam@netfilter.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	netfilter-devel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, fsverity@lists.linux.dev, 
	bpf@vger.kernel.org, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, cgroups@vger.kernel.org, 
	alexei.starovoitov@gmail.com, olsajiri@gmail.com, quentin@isovalent.com, 
	alan.maguire@oracle.com, memxor@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 6, 2024 at 7:25=E2=80=AFPM Daniel Xu <dxu@dxuuu.xyz> wrote:
>
> =3D=3D=3D Description =3D=3D=3D
>
> This is a bpf-treewide change that annotates all kfuncs as such inside
> .BTF_ids. This annotation eventually allows us to automatically generate
> kfunc prototypes from bpftool.
>
> We store this metadata inside a yet-unused flags field inside struct
> btf_id_set8 (thanks Kumar!). pahole will be taught where to look.

This is great, thanks for tackling this. With yout patches we can
figure out the full set of kfuncs. Is there a way to extend it so that
we can tell which program context a kfunc can be called from?
