Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6946E210E3
	for <fsverity@lists.linux.dev>; Thu,  4 Jan 2024 11:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vsbc3OeA"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5563944b3dfso505183a12.3
        for <fsverity@lists.linux.dev>; Thu, 04 Jan 2024 03:41:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704368514; x=1704973314; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=li47kl6w5F7Kdkk2+B7xCgguinxHCXOI6fH+waqV0VM=;
        b=Vsbc3OeAgwLNvJGSHVfWUeqrh+FXWKcldYbgJ7SgdTvlip2F+yJJyy6RdG4Ylg8TsV
         qMWtutBMwANGDX2uayp6XRyxMEHjBC+Rui55rZEZqUZA1UigMV3Vip5NNfnhI+NS8Mmh
         5vhmk0Knd6wL11osKKxyFktpe1QB7CmfHCeoIQPAySojcf5NZqKEu+1aUDmmAfBS2xtg
         1fhD4bWsS7bpnSTlGCnAsY0i1FXoC0sGj+MFyNWWYUv/z3dx7C5IvEGdbUCIcGOjwHOj
         hjtZEpucBT0YyMJmHahAVdDmOg/zRtrzlcFJ48iWSeYuVtwzn6ygFaFXVGhiXeZzPnCz
         1l+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704368514; x=1704973314;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=li47kl6w5F7Kdkk2+B7xCgguinxHCXOI6fH+waqV0VM=;
        b=m6KD1aCQL52Fc21ErEd6nGyWW7+cISzaFzeulcb2dY011JjwzhCPcBS/HbGfJy0l/z
         MzodXGjG3+OtDz4cRdKqdDg1tM9baMJL5jzXoSUc5nbl04QmnvEGcXXBbHhsUmPd2lru
         rLSPpwjZTtcuus3lzmGDTEH1EaKM8g+CnW3EtUSy/HFLF85gW25F6PoB8LjeqTw5Jp1P
         ZzHEeRhekCr0VLrfM2Xv+/fosuf4NAUwqEr87nSJ8UOtRNwOprsaHUcwEzWN7aAeQK90
         dn9nRVPtOJUXGyHtDlYkXTZrSB9YAntVcwBJ6jCCuK9zyyHsYVc3HoeMsFpKShFUfn/a
         a5Jw==
X-Gm-Message-State: AOJu0YxZsPvA2hHdX/qEaaH64j1UgwDukkfeTYcSSqV5z8Q4WpCwbJTG
	FamwMC4MbfX3aUO0w+YKCi4=
X-Google-Smtp-Source: AGHT+IFrFEjJWJoSGpDPpDjTuLdY+CFN4tGrhsg3QTmtjCcI4AMtsTnvEFP18v2XfpFjbFbUiq++MA==
X-Received: by 2002:a17:906:231a:b0:a28:b774:62d9 with SMTP id l26-20020a170906231a00b00a28b77462d9mr261239eja.62.1704368514369;
        Thu, 04 Jan 2024 03:41:54 -0800 (PST)
Received: from krava (2001-1ae9-1c2-4c00-726e-c10f-8833-ff22.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:726e:c10f:8833:ff22])
        by smtp.gmail.com with ESMTPSA id o16-20020a170906601000b00a26dc8ec78dsm10999304ejj.147.2024.01.04.03.41.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jan 2024 03:41:54 -0800 (PST)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Thu, 4 Jan 2024 12:41:51 +0100
To: Daniel Xu <dxu@dxuuu.xyz>
Cc: benjamin.tissoires@redhat.com, hawk@kernel.org, edumazet@google.com,
	alexandre.torgue@foss.st.com, ebiggers@kernel.org, tj@kernel.org,
	rostedt@goodmis.org, shuah@kernel.org, martin.lau@linux.dev,
	ast@kernel.org, fw@strlen.de, kuba@kernel.org, pablo@netfilter.org,
	jikos@kernel.org, john.fastabend@gmail.com,
	mcoquelin.stm32@gmail.com, mhiramat@kernel.org,
	yonghong.song@linux.dev, Herbert Xu <herbert@gondor.apana.org.au>,
	dsahern@kernel.org, hannes@cmpxchg.org, lizefan.x@bytedance.com,
	pabeni@redhat.com, steffen.klassert@secunet.com,
	daniel@iogearbox.net, tytso@mit.edu, andrii@kernel.org,
	davem@davemloft.net, kadlec@netfilter.org, song@kernel.org,
	alexei.starovoitov@gmail.com, olsajiri@gmail.com,
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
Subject: Re: [PATCH bpf-next 2/2] bpf: treewide: Annotate BPF kfuncs in BTF
Message-ID: <ZZaZf_8RuX2xqZGf@krava>
References: <cover.1704324602.git.dxu@dxuuu.xyz>
 <68d5598e5708dfe3370406cd5c946565ca4b50f1.1704324602.git.dxu@dxuuu.xyz>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <68d5598e5708dfe3370406cd5c946565ca4b50f1.1704324602.git.dxu@dxuuu.xyz>

On Wed, Jan 03, 2024 at 04:31:56PM -0700, Daniel Xu wrote:

SNIP

> diff --git a/include/linux/btf_ids.h b/include/linux/btf_ids.h
> index 88f914579fa1..771e29762a2d 100644
> --- a/include/linux/btf_ids.h
> +++ b/include/linux/btf_ids.h
> @@ -8,6 +8,9 @@ struct btf_id_set {
>  	u32 ids[];
>  };
>  
> +/* This flag implies BTF_SET8 holds kfunc(s) */
> +#define BTF_SET8_KFUNC		(1 << 0)
> +
>  struct btf_id_set8 {
>  	u32 cnt;
>  	u32 flags;
> diff --git a/kernel/bpf/btf.c b/kernel/bpf/btf.c
> index 51e8b4bee0c8..b8ba00a4179f 100644
> --- a/kernel/bpf/btf.c
> +++ b/kernel/bpf/btf.c
> @@ -7769,6 +7769,9 @@ static int __register_btf_kfunc_id_set(enum btf_kfunc_hook hook,
>  	struct btf *btf;
>  	int ret, i;
>  
> +	/* All kfuncs need to be tagged as such in BTF */
> +	WARN_ON(!(kset->set->flags & BTF_SET8_KFUNC));

__register_btf_kfunc_id_set gets called also from the 'hooks' path:

  bpf_mptcp_kfunc_init
    register_btf_fmodret_id_set
      __register_btf_kfunc_id_set

so it will hit the warn.. it should be probably in the register_btf_kfunc_id_set ?

also given that we can have modules calling register_btf_kfunc_id_set,
should we just return error instead of the warn?

SNIP

> diff --git a/tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c b/tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c
> index 91907b321f91..32972334cd50 100644
> --- a/tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c
> +++ b/tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c
> @@ -341,7 +341,7 @@ static struct bin_attribute bin_attr_bpf_testmod_file __ro_after_init = {
>  	.write = bpf_testmod_test_write,
>  };
>  
> -BTF_SET8_START(bpf_testmod_common_kfunc_ids)
> +BTF_SET8_START(bpf_testmod_common_kfunc_ids, BTF_SET8_KFUNC)
>  BTF_ID_FLAGS(func, bpf_iter_testmod_seq_new, KF_ITER_NEW)
>  BTF_ID_FLAGS(func, bpf_iter_testmod_seq_next, KF_ITER_NEXT | KF_RET_NULL)
>  BTF_ID_FLAGS(func, bpf_iter_testmod_seq_destroy, KF_ITER_DESTROY)

we need to change also bpf_testmod_check_kfunc_ids set

jirka

> -- 
> 2.42.1
> 
