Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A7B179F5
	for <fsverity@lists.linux.dev>; Sat,  4 Nov 2023 09:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wm+F/473"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2c5b7764016so38040211fa.1
        for <fsverity@lists.linux.dev>; Sat, 04 Nov 2023 02:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699089101; x=1699693901; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KH+rQxDmlxFhF26gknrez8QMhw5R6eXMcq3o8Qd5SfA=;
        b=Wm+F/473WwpbxADflh/Kf95J8ijSFD4h4WRxlvshu7D1myaIslbt7wOCc8XbXG8PTc
         uwVZ/quUmyuNqqbaTaLtZXZ62Fi6MYqDCpRUITYl+dlSmd9x+hOrP66Y/NmoSJN4hA12
         LuX8gKGaw4iyacPxS6N1v29k7FwmSXT0Ve12s1W+WkmQ7fJj66+pYcXaBrcOgGIpDiD2
         MTslNy0XQnJs0/CHDDUYLWwWtN5kekl6cFdfGxotdbpMBWOeV/eSmsgmIXK9twWZQkIE
         LzCoTblDn/0zBmlGdT8dxxPzcabAe0TkUBFoaCrBZ5S8Ipx5bvnFAulALR2xYUEFQSau
         iwlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699089101; x=1699693901;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KH+rQxDmlxFhF26gknrez8QMhw5R6eXMcq3o8Qd5SfA=;
        b=IjNNgfjiB+bMED1gOD6V4P2Xc/e7lLU7F/GqonxIQK8IqpsIrRUaxCKqZhyYW1KjNn
         JDbpU1bb5N+ZAQ0WyR+1y/erHQfaP5sINw0CE0LMBi0zb3we/geOMxSX+jav7QnMthlp
         zfQR/r2gJyRk1DmzNe/e+EPf0LWIUV2cCmyB0qxzGvcGl+3m5do7K3elS421MQcWNiap
         F3EdqQISEdkQ5TeWqO8P1eh6FcEOvUo4S+3LYoJy5IzNgxY4LWZXLrDG9fRMyKoQ0L4E
         HWjrTaNoq4FXXu9Y6Wcx4nBtCysmASA2NR0t/ysRy9HkaFwWfBiXKPSSo4hUtYOd4zZQ
         8tfA==
X-Gm-Message-State: AOJu0YyeAJXjfAQft2hxw4tDfkjp/wRQvcP50dLeObpJKfLNYsIOXrdV
	QTXALD/QFLkgqGRs+zQ/72oVo2TpWjYBJbE3opE=
X-Google-Smtp-Source: AGHT+IEipBRBhLM4Hj7N9FEbVXFdTzNKQtnn9sYQBVTJRCCPFLEv8Y1xEb0R6NbEXjUKf/bASDAHLHiHzzyVQUm7llU=
X-Received: by 2002:a19:915b:0:b0:505:8075:7c10 with SMTP id
 y27-20020a19915b000000b0050580757c10mr16879170lfj.25.1699089100630; Sat, 04
 Nov 2023 02:11:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231104001313.3538201-1-song@kernel.org> <20231104001313.3538201-5-song@kernel.org>
In-Reply-To: <20231104001313.3538201-5-song@kernel.org>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Sat, 4 Nov 2023 02:11:28 -0700
Message-ID: <CAADnVQJX8E_2vdacqrwgQ9+Hj0ogQJN80UGvOtjxNTQBpZ+eHA@mail.gmail.com>
Subject: Re: [PATCH v12 bpf-next 4/9] bpf: Add kfunc bpf_get_file_xattr
To: Song Liu <song@kernel.org>
Cc: bpf <bpf@vger.kernel.org>, fsverity@lists.linux.dev, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@kernel.org>, 
	Kernel Team <kernel-team@meta.com>, Eric Biggers <ebiggers@kernel.org>, 
	"Theodore Ts'o" <tytso@mit.edu>, Roberto Sassu <roberto.sassu@huaweicloud.com>, 
	KP Singh <kpsingh@kernel.org>, Vadim Fedorenko <vadfed@meta.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 3, 2023 at 5:13=E2=80=AFPM Song Liu <song@kernel.org> wrote:
>
> It is common practice for security solutions to store tags/labels in
> xattrs. To implement similar functionalities in BPF LSM, add new kfunc
> bpf_get_file_xattr().
>
> The first use case of bpf_get_file_xattr() is to implement file
> verifications with asymmetric keys. Specificially, security applications
> could use fsverity for file hashes and use xattr to store file signatures=
.
> (kfunc for fsverity hash will be added in a separate commit.)
>
> Currently, only xattrs with "user." prefix can be read with kfunc
> bpf_get_file_xattr(). As use cases evolve, we may add a dedicated prefix
> for bpf_get_file_xattr().
>
> To avoid recursion, bpf_get_file_xattr can be only called from LSM hooks.

Song,

have you studied the prior attempt to add this kfunc?
https://lore.kernel.org/bpf/20220628161948.475097-1-kpsingh@kernel.org/

file instead of (dentry,inode) pair makes sense,
and restricting to "user." prefix makes sense to me as well,
but you need to cc vfs experts in the future.

> + * For security reasons, only *name__str* with prefix "user." is allowed=
.
> + *
> + * Return: 0 on success, a negative value on error.
> + */
> +__bpf_kfunc int bpf_get_file_xattr(struct file *file, const char *name__=
str,
> +                                  struct bpf_dynptr_kern *value_ptr)
> +{
> +       struct dentry *dentry;
> +       u32 value_len;
> +       void *value;
> +
> +       if (strncmp(name__str, XATTR_USER_PREFIX, XATTR_USER_PREFIX_LEN))
> +               return -EPERM;
> +
> +       value_len =3D __bpf_dynptr_size(value_ptr);
> +       value =3D __bpf_dynptr_data_rw(value_ptr, value_len);
> +       if (!value)
> +               return -EINVAL;
> +
> +       dentry =3D file_dentry(file);
> +       return __vfs_getxattr(dentry, dentry->d_inode, name__str, value, =
value_len);
> +}
> +
> +__diag_pop();
> +
> +BTF_SET8_START(fs_kfunc_set_ids)
> +BTF_ID_FLAGS(func, bpf_get_file_xattr, KF_SLEEPABLE | KF_TRUSTED_ARGS)

See earlier Al's point. Just sleepable is not enough.
