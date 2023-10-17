Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC19EBE
	for <fsverity@lists.linux.dev>; Tue, 17 Oct 2023 19:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dPwuXcwJ"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-32d9b507b00so4009031f8f.1
        for <fsverity@lists.linux.dev>; Tue, 17 Oct 2023 12:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697569711; x=1698174511; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZUrM/usGu4HOCVcsQ2mLRiy1RX8lnnPjKL1N16nu/qY=;
        b=dPwuXcwJKbQdTzKpKvhMYN9x9bCilyYM8JeCDdpBKiJYB042LJ9jpmSf1POMS7EPvu
         VKsxKX8zipdS29kfdm9MrsvKjS4tahzeRs7FNA8OZVgcYAmsvao2HzScsluT12b+HKHM
         DjUx49tA6cCytzndNQrdlwdGV2ex71barD/4uB839MBm2LnU5RIKGtcACtFwX6KYxFjn
         wWcqveAeU2Iolk6OV2I16ACOGe4z9gl33FYva4LQx05D9E5BaeZcIIKyK80GvJ9OAIWT
         hAyoRjWbqhW2PwJrfZwu+lmzwfkBHlGWSeHu5JtdjRlVtW+SqcBBLUCYgs0DFSGmqJZv
         X6XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697569711; x=1698174511;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZUrM/usGu4HOCVcsQ2mLRiy1RX8lnnPjKL1N16nu/qY=;
        b=DGiF2ujSYBUb4SDEkUHpG/pUqfg31AiNXPKF7ILzHiX3f+G15M3o3zvKLaUnfytzZ7
         B2vIdAftRZVfE2j2XeJQaxQeD8UaXy7/fw/Ws2EtXIfC4dj3LWabivroM7E5H1v+TMK6
         kgRlv31/QuVwRyV6FqQVnLsKp+dpHEODqbho1Br5WWLL/TBuE/hOc3YOOuxwuVxBE2Ei
         45N5V6i7V/1Dtp34gGwtP3jFgJkI3u9Hlsu8o//Wi0zNJ1E14OUJLH8+z72A7ok3aaQf
         Yfk2tnWvylwKNubkz684kvpKL3dvsHYpyHzuUVRb1Jpoysk2DBM9eRBEsSQDD7tliGvx
         6h5A==
X-Gm-Message-State: AOJu0YyNxFP8h1OM7nA7B50JAXR+qVSWdqRMXDY09XA/iQRLWHBLeE6t
	/so7WQkbs4e38MTNSagUKQ9lH4sTTT5sUjJnU9M=
X-Google-Smtp-Source: AGHT+IE9M3SEfRDyt0OfJhXlaNkLhtVKKI7gDp+yX9RGs1+JLKM9bAnGrCz/BwjW53iKyDGA6hHLqa3+uMhmIciVs6g=
X-Received: by 2002:a5d:6ad0:0:b0:32d:b9c5:82fc with SMTP id
 u16-20020a5d6ad0000000b0032db9c582fcmr2800191wrw.36.1697569710521; Tue, 17
 Oct 2023 12:08:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231013182644.2346458-1-song@kernel.org> <20231013182644.2346458-6-song@kernel.org>
In-Reply-To: <20231013182644.2346458-6-song@kernel.org>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Tue, 17 Oct 2023 12:08:19 -0700
Message-ID: <CAADnVQK6_RNn3Bt=BKLecNrwS4pi2JOMq-h9O5qnE6EJhpitXw@mail.gmail.com>
Subject: Re: [PATCH bpf-next 5/5] selftests/bpf: Add test that use fsverity
 and xattr to sign a file
To: Song Liu <song@kernel.org>
Cc: bpf <bpf@vger.kernel.org>, fsverity@lists.linux.dev, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@kernel.org>, 
	Kernel Team <kernel-team@meta.com>, Eric Biggers <ebiggers@kernel.org>, 
	"Theodore Ts'o" <tytso@mit.edu>, Roberto Sassu <roberto.sassu@huaweicloud.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 13, 2023 at 11:29=E2=80=AFAM Song Liu <song@kernel.org> wrote:
>
> +#define MAGIC_SIZE 8
> +char digest[MAGIC_SIZE + sizeof(struct fsverity_digest) + SHA256_DIGEST_=
SIZE];
> +
> +__u32 monitored_pid;
> +char xattr_name[] =3D "user.sig";
> +char sig[MAX_SIG_SIZE];
> +__u32 sig_size;
> +__u32 user_keyring_serial;
> +
> +SEC("lsm.s/file_open")
> +int BPF_PROG(test_file_open, struct file *f)
> +{
> +       struct bpf_dynptr digest_ptr, sig_ptr, name_ptr;
> +       struct bpf_key *trusted_keyring;
> +       __u32 pid;
> +       int ret;
> +
> +       pid =3D bpf_get_current_pid_tgid() >> 32;
> +       if (pid !=3D monitored_pid)
> +               return 0;
> +
> +       /* digest_ptr points to fsverity_digest */
> +       bpf_dynptr_from_mem(digest + MAGIC_SIZE, sizeof(digest) - MAGIC_S=
IZE, 0, &digest_ptr);
> +
> +       ret =3D bpf_get_fsverity_digest(f, &digest_ptr);
> +       /* No verity, allow access */
> +       if (ret < 0)
> +               return 0;
> +
> +       /* Move digest_ptr to fsverity_formatted_digest */
> +       bpf_dynptr_from_mem(digest, sizeof(digest), 0, &digest_ptr);
> +
> +       /* Read signature from xattr */
> +       bpf_dynptr_from_mem(sig, sizeof(sig), 0, &sig_ptr);
> +       bpf_dynptr_from_mem(xattr_name, sizeof(xattr_name), 0, &name_ptr)=
;
> +       ret =3D bpf_get_file_xattr(f, &name_ptr, &sig_ptr);
> +       /* No signature, reject access */
> +       if (ret < 0)
> +               return -EPERM;
> +
> +       trusted_keyring =3D bpf_lookup_user_key(user_keyring_serial, 0);
> +       if (!trusted_keyring)
> +               return -ENOENT;
> +
> +       /* Verify signature */
> +       ret =3D bpf_verify_pkcs7_signature(&digest_ptr, &sig_ptr, trusted=
_keyring);
> +
> +       bpf_key_put(trusted_keyring);
> +       return ret;
> +}

I think the UX is cumbersome.
Putting a NULL terminated string into dynptr not only a source
code ugliness, but it adds run-time overhead too.
We better add proper C style string support in the verifier,
so that bpf_get_file_xattr() can look like normal C.
