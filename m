Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED7A12E40B
	for <fsverity@lists.linux.dev>; Fri,  5 Jan 2024 15:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GqDC0TBn"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2cce6c719caso19696601fa.2
        for <fsverity@lists.linux.dev>; Fri, 05 Jan 2024 07:11:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704467498; x=1705072298; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0jvwWQN/4UcpzgDB9Dn1kP+j0A1/ex5/bFC8KQNDn3Y=;
        b=GqDC0TBndC1nzU6FLrXrUBZ4WPwYLIA8n1rVzUjcSB2FnCaRuoRIVBHXgzkpAQrfPQ
         Vf3XUDIzIxSS9pZNYAy5v/bXeO20EUYLMIDtq1EykA2dDXBPJ5LwNWo9sM/Z+4bS7DwN
         oUCe+i7+SaMnQE8ppZ6P1WBbJjgHna3UXOJEgnTnyq9DkikeAO6StN1Ht+sDesTAEH4Q
         mBX9m27Kpznn1AaxHyUlVS2k9drj6yPj6StERS86jNAZ7pyFd/WP+/6t0FT2Z4zoGVKf
         vqda1zUlBwnUY0upmTdRJ45QU901f5otJcT+QSR9ndXsZLFt7pnZgP8tLvfqQ1NnpSC7
         yqMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704467498; x=1705072298;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0jvwWQN/4UcpzgDB9Dn1kP+j0A1/ex5/bFC8KQNDn3Y=;
        b=sWHLXZ110wQ3dtiFJrBaR0QqATk+oJ6pbnA80W8DxBKNZ9g7sdj7oLCSgNi9Tl0BbF
         VuA03a4kWGkznk7MNEcMyn8DAKRKiIbeXdL2R/3PHmnXlLG+NCey3rNpdMKOS+6gxzEI
         N6NddjOSDzAdCVHqwLecORj2Pr4vvRQ9su/B2b2GWp0lf5+6hmWa0Rvd2tE2viFVrZyQ
         JjtAqrzrjYJL/uger6uGuFhBU5aI1b7GcytiZdqyzJt7f6pNW0yWo92OrLSAGcoDc8Rt
         9NS+GxfT7ptV8efyUL1dBX/NPTD7keQAm6UsqLDttHXCfY4U93qKrq+q3Mn9BaIKmvM3
         Kp6w==
X-Gm-Message-State: AOJu0Yyt0UsLHGrjLGslgsiXh+ZX7kjq6sKmV1aJzbqxfk4wv5q6nX2u
	wT5+jizRcD+9YV8FAHrHdP8=
X-Google-Smtp-Source: AGHT+IFfGsd7OhjOyharZSVfOb2cwd7D3hSDlT4qWYQ2gJAsNlPcjNmo0EWFSODi+SQP2gAcMZ+9jA==
X-Received: by 2002:ac2:58e3:0:b0:50e:3714:b420 with SMTP id v3-20020ac258e3000000b0050e3714b420mr959191lfo.9.1704467497642;
        Fri, 05 Jan 2024 07:11:37 -0800 (PST)
Received: from krava (2001-1ae9-1c2-4c00-726e-c10f-8833-ff22.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:726e:c10f:8833:ff22])
        by smtp.gmail.com with ESMTPSA id b1-20020a170906490100b00a26b36311ecsm986048ejq.146.2024.01.05.07.11.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jan 2024 07:11:36 -0800 (PST)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Fri, 5 Jan 2024 16:11:33 +0100
To: Daniel Xu <dxu@dxuuu.xyz>
Cc: alexandre.torgue@foss.st.com, benjamin.tissoires@redhat.com,
	lizefan.x@bytedance.com, Herbert Xu <herbert@gondor.apana.org.au>,
	dsahern@kernel.org, hannes@cmpxchg.org, rostedt@goodmis.org,
	mcoquelin.stm32@gmail.com, pablo@netfilter.org,
	martin.lau@linux.dev, edumazet@google.com, daniel@iogearbox.net,
	ebiggers@kernel.org, yonghong.song@linux.dev,
	john.fastabend@gmail.com, hawk@kernel.org,
	steffen.klassert@secunet.com, jikos@kernel.org, kuba@kernel.org,
	fw@strlen.de, ast@kernel.org, song@kernel.org, pabeni@redhat.com,
	shuah@kernel.org, tytso@mit.edu, tj@kernel.org,
	kadlec@netfilter.org, davem@davemloft.net, mhiramat@kernel.org,
	andrii@kernel.org, alexei.starovoitov@gmail.com, olsajiri@gmail.com,
	quentin@isovalent.com, alan.maguire@oracle.com, memxor@gmail.com,
	kpsingh@kernel.org, sdf@google.com, haoluo@google.com,
	mathieu.desnoyers@efficios.com, mykolal@fb.com,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	fsverity@lists.linux.dev, bpf@vger.kernel.org,
	cgroups@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	netdev@vger.kernel.org, netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org, linux-kselftest@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH bpf-next v2 3/3] bpf: treewide: Annotate BPF kfuncs in BTF
Message-ID: <ZZgcJTdwMZHglPtr@krava>
References: <cover.1704422454.git.dxu@dxuuu.xyz>
 <a923e3809955bdfd2bc8d6a103c20e01f1636dbc.1704422454.git.dxu@dxuuu.xyz>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a923e3809955bdfd2bc8d6a103c20e01f1636dbc.1704422454.git.dxu@dxuuu.xyz>

On Thu, Jan 04, 2024 at 07:45:49PM -0700, Daniel Xu wrote:

SNIP

> diff --git a/fs/verity/measure.c b/fs/verity/measure.c
> index bf7a5f4cccaf..3969d54158d1 100644
> --- a/fs/verity/measure.c
> +++ b/fs/verity/measure.c
> @@ -159,9 +159,9 @@ __bpf_kfunc int bpf_get_fsverity_digest(struct file *file, struct bpf_dynptr_ker
>  
>  __bpf_kfunc_end_defs();
>  
> -BTF_SET8_START(fsverity_set_ids)
> +BTF_KFUNCS_START(fsverity_set_ids)
>  BTF_ID_FLAGS(func, bpf_get_fsverity_digest, KF_TRUSTED_ARGS)
> -BTF_SET8_END(fsverity_set_ids)
> +BTF_KFUNCS_END(fsverity_set_ids)
>  
>  static int bpf_get_fsverity_digest_filter(const struct bpf_prog *prog, u32 kfunc_id)
>  {
> diff --git a/kernel/bpf/btf.c b/kernel/bpf/btf.c
> index 51e8b4bee0c8..8cc718f37a9d 100644
> --- a/kernel/bpf/btf.c
> +++ b/kernel/bpf/btf.c
> @@ -7802,6 +7802,10 @@ int register_btf_kfunc_id_set(enum bpf_prog_type prog_type,
>  {
>  	enum btf_kfunc_hook hook;
>  
> +	/* All kfuncs need to be tagged as such in BTF */
> +	if (WARN_ON(!(kset->set->flags & BTF_SET8_KFUNCS)))
> +		return -EINVAL;

having the warning for module with wrong set8 flags seems wrong to me,
I think we should trigger the warn only for kernel calls.. by adding
kset->owner check in the condition above

jirka

> +
>  	hook = bpf_prog_type_to_kfunc_hook(prog_type);
>  	return __register_btf_kfunc_id_set(hook, kset);
>  }

SNIP
