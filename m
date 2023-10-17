Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81E62EBE
	for <fsverity@lists.linux.dev>; Tue, 17 Oct 2023 19:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mV2+fNSx"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-317c3ac7339so5305045f8f.0
        for <fsverity@lists.linux.dev>; Tue, 17 Oct 2023 12:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697569867; x=1698174667; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sDvAFyKusjYaaaVBW3+d3CTDtEmXV52SJOeZ4ehAiVY=;
        b=mV2+fNSxVYdeSECcLOp667DlMItITrLAWG9+Bkp6ptNHH07xyTkseBOYQFqULdWQTW
         XgaCddkygaagaF1enIGY2ooSXUdEQKA6tLhJKtn3pGcj0UVOx/Y1vSBCyL6QMmHleiJL
         CVYzkFNnss58wB5fEM2I7nmRX0PLS5RB3L3Ps//5zBFmrCWlu+4R6SIVz1Dpi5UMfgww
         FKU+Y7J37dqYTBZP7LBnPK7vhatnMXOj7FZLU5ATyZktXRBFWU7MeV9EkI/7BfWLepL2
         xdGbbeUUAw2OFLzMprxPYhM4p3EPknd2o8Wd5RHiBPg1oMS93r0+/t5ECAKccgvcnr2g
         6aMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697569867; x=1698174667;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sDvAFyKusjYaaaVBW3+d3CTDtEmXV52SJOeZ4ehAiVY=;
        b=F3xtmyW72HSBDz3ffd9MsFgEdZIcm7SRR3jNijcg3VOuwgefj6vTtjM/eKHK2IpN4s
         h75frchqTtxCVw/d4k6CWZdcLpomo8II1H2GbXwTfmaNnZKgKEOfb1EH1WrSxIRgojig
         Ti1IjzuB1AVP4ojjs9sUa+fMAew9d0Nba3p7uqHAAxD/hetugwZZyACVcAXzJOioNZMV
         pw9ioAAU7eI8iDCzHnWGlsMyT/vjHkdcwb2ZItHon2Se6XWtewcdEw4IurEeDpf2H7GB
         FveQznbzkXYJ8vw1+s5pXcGRPaVgBJkJWtZN3BCuukDJl7cqeMkJscmR6zVCpcD/THl4
         j3gw==
X-Gm-Message-State: AOJu0YzcfH4xES4KEEl1SRCcKAd3SGIoRsZLN7rjtXrGy6pYMFLrZVCG
	Xp6POXl2rMyZeBd4A6hW6+T3d/T5W6PTy3oNWew=
X-Google-Smtp-Source: AGHT+IFTswGL7KEaRVV6S0ufVLT5CxSMmXDZSBKHyFjVMcpvS3n2YhqOrw7MJABLIZBfGAvxtVrpvmFPYoM6Q/a4ryY=
X-Received: by 2002:a5d:4e0c:0:b0:32d:9a1b:5d80 with SMTP id
 p12-20020a5d4e0c000000b0032d9a1b5d80mr2503784wrt.35.1697569867506; Tue, 17
 Oct 2023 12:11:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231013182644.2346458-1-song@kernel.org> <20231013182644.2346458-2-song@kernel.org>
In-Reply-To: <20231013182644.2346458-2-song@kernel.org>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Tue, 17 Oct 2023 12:10:56 -0700
Message-ID: <CAADnVQLcrxLatupH=i2Q-K8KRF72PqB8wayC=UEKvuMMn3ie7A@mail.gmail.com>
Subject: Re: [PATCH bpf-next 1/5] bpf: Add kfunc bpf_get_file_xattr
To: Song Liu <song@kernel.org>, KP Singh <kpsingh@kernel.org>
Cc: bpf <bpf@vger.kernel.org>, fsverity@lists.linux.dev, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@kernel.org>, 
	Kernel Team <kernel-team@meta.com>, Eric Biggers <ebiggers@kernel.org>, 
	"Theodore Ts'o" <tytso@mit.edu>, Roberto Sassu <roberto.sassu@huaweicloud.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 13, 2023 at 11:30=E2=80=AFAM Song Liu <song@kernel.org> wrote:
> +__bpf_kfunc int bpf_get_file_xattr(struct file *file, struct bpf_dynptr_=
kern *name_ptr,
> +                                  struct bpf_dynptr_kern *value_ptr)
> +{
> +       if (!bpf_dynptr_is_string(name_ptr))
> +               return -EINVAL;
> +
> +       return vfs_getxattr(mnt_idmap(file->f_path.mnt), file_dentry(file=
), name_ptr->data,
> +                           value_ptr->data, __bpf_dynptr_size(value_ptr)=
);
> +}
> +
> +__diag_pop();
> +
> +BTF_SET8_START(fs_kfunc_set)
> +BTF_ID_FLAGS(func, bpf_get_file_xattr, KF_SLEEPABLE)

I suspect it needs to be allowlisted too.
Sleepable might not be enough.

KP proposed such kfunc in the past and there were recursion issues.

KP,
do you remember the details?
