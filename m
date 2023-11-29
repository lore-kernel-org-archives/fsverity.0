Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73DFD186A
	for <fsverity@lists.linux.dev>; Wed, 29 Nov 2023 06:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U8i9LmDh"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-332ed02ccd9so3130753f8f.0
        for <fsverity@lists.linux.dev>; Tue, 28 Nov 2023 22:47:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701240462; x=1701845262; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uoQz0W1zrsabXG6C9p+w20DAO2gb0rfGAOA6XEqMdok=;
        b=U8i9LmDhcbbXrwgONzQ1Vn/QVJ+TKoh06DNwtPyiN695kw6pOItxGwiIBVigDbMnTl
         jvQDPZwMGQ9bktrFYpF5kWAkNWcxSSPzz+FXo7LkrchsBRA4nViTCth3HNMGpUeICcBb
         JNyz7JRU9CgJCK6nsr6KXrEhQgI7Su7EPrDQluBmydNxiq1oLgNPI2sVZVsTAdGzAdDT
         GR75rNga+flo6tOGEII1z8Wttflfv4Gc2/v/9G+ipEsgDjrP0lW//94v7lpMaNQrkTR6
         Z3VKCzrcIKp3By90Rh/FHRldBRh5+S11qnSP38LpDqXBBA8FFIbiEvK4bTAXmjk1aVFY
         DpnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701240462; x=1701845262;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uoQz0W1zrsabXG6C9p+w20DAO2gb0rfGAOA6XEqMdok=;
        b=ONivP5ECwW94vmJ/qqe/2c/MXPC5qLwUEd/77muqtZt4isJI3ND1ramOmBrDrH9zTE
         d8Fajg93scrwfS8IX4cuaBwlnXMV1uK85Zkaea53RiX/6riof4v6jWUgNDX1Hhh7YU4W
         415fuvFA2viINHNXgiIcZZL8QNwYILuC0I1ShSIlHpZHC6g4TwJOvBgdyd8eUm1YViub
         siLYlSQTZNhPQO0kHsv7cEmrXJ7b8/5lBXDUNvfif5gPDUFJU4z9cfIMnQwoCtFhMvjy
         TypStVh/xdCopGdmx49wquzAbB3P8IKlrSmzu8y0bipkgoyyaabHUNfiX+uNa2ivGPOc
         i1FA==
X-Gm-Message-State: AOJu0YyTxwPQtomVMMzEHo01WRvM3aJ/q2c6Jm0qLWBADo0/dpmynQ9m
	LEzlauGQuYgq5SO04cRVUb9EfQmuAIz6esr3edw=
X-Google-Smtp-Source: AGHT+IFN+lb5qvDxfIaWhrx1aSH/XLg8D+DoimtQZ2lwqG3I1fCwH1BzVpWtfsFQfVvr8RIBHZUK6gYVD0WhHS8je20=
X-Received: by 2002:a05:6000:225:b0:332:ce72:d589 with SMTP id
 l5-20020a056000022500b00332ce72d589mr11654697wrz.3.1701240462397; Tue, 28 Nov
 2023 22:47:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231129003656.1165061-1-song@kernel.org> <20231129003656.1165061-7-song@kernel.org>
In-Reply-To: <20231129003656.1165061-7-song@kernel.org>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Tue, 28 Nov 2023 22:47:31 -0800
Message-ID: <CAADnVQJb3Ur--A8jaiVqpea1kFXMCd46uP+X4ydcOVG3a5Ve3Q@mail.gmail.com>
Subject: Re: [PATCH v14 bpf-next 6/6] selftests/bpf: Add test that uses
 fsverity and xattr to sign a file
To: Song Liu <song@kernel.org>
Cc: bpf <bpf@vger.kernel.org>, LSM List <linux-security-module@vger.kernel.org>, 
	Linux-Fsdevel <linux-fsdevel@vger.kernel.org>, fsverity@lists.linux.dev, 
	Eric Biggers <ebiggers@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Christian Brauner <brauner@kernel.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Casey Schaufler <casey@schaufler-ca.com>, 
	Amir Goldstein <amir73il@gmail.com>, KP Singh <kpsingh@kernel.org>, 
	Roberto Sassu <roberto.sassu@huawei.com>, Kernel Team <kernel-team@meta.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 28, 2023 at 4:37=E2=80=AFPM Song Liu <song@kernel.org> wrote:
> +char digest[MAGIC_SIZE + sizeof(struct fsverity_digest) + SHA256_DIGEST_=
SIZE];

when vmlinux is built without CONFIG_FS_VERITY the above fails
in a weird way:
  CLNG-BPF [test_maps] test_sig_in_xattr.bpf.o
progs/test_sig_in_xattr.c:36:26: error: invalid application of
'sizeof' to an incomplete type 'struct fsverity_digest'
   36 | char digest[MAGIC_SIZE + sizeof(struct fsverity_digest) +
SHA256_DIGEST_SIZE];
      |                          ^     ~~~~~~~~~~~~~~~~~~~~~~~~

Is there a way to somehow print a hint during the build what
configs users need to enable to pass the build ?
