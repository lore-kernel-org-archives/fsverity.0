Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1B169943
	for <fsverity@lists.linux.dev>; Wed, 31 Jan 2024 09:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706694472; cv=none; b=h4Xyf3fq/0ZiID9FNy4CBue6dMTipzpN7UYrDLkGVtBSX8Vgxsuu66gOT4MteXDTP5/dk+n1jI5CYhO9rMoZsH4eOdHz/UmLM5+Do9gSlPboY6fEJ0nRN+Ac+J1oGpz4MT20MUBenyKgLkr54U5RY3uUMbBM29YDVxmTyX/TDRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706694472; c=relaxed/simple;
	bh=DyoRHksM8/+nEGDrgKtCPGHGEP6No6QiqsUcI6hix1g=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c/2nSce6uYr9vIuEinSZnQyKc6uXn4TONfk5AALr3EWwX6ecYSH7ZHlhes2dp5EIST1/+iqz0LwvadvTpEXrNNlIVXu6Kf82xsagB6KhpejAZeAkj3e3JGNcfNuiQH2bkiXfWuiaq3UNqn733Cn8WL2so26hItoGnp9thmWxWtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WxzpjTFr; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WxzpjTFr"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-55f2b0c5ae9so2873187a12.2
        for <fsverity@lists.linux.dev>; Wed, 31 Jan 2024 01:47:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706694469; x=1707299269; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/O9XgRbkcBJVk7UwNZF0sbS5DqjZwvxc08GdgHW/6js=;
        b=WxzpjTFrXvDS8Qt8XC86LvTkLTmNGNC3XaDX82vBv7WHKicZYjvqzjrUSHgQ9DJz1I
         /IRosTBq9kIz5+hv7sLc29lAtoul9m5JN0tdW+IjwpiVspnCRDJxUP0xhY7+dXcGfbmD
         qrhf14cbs0/FUOsCdAcA7N/1K33T26cWCVT7v8QPoeKgsQ7v84H67WkcUMcSG67NlAwQ
         Kq9oAxUDf/QENlE2TXsw6J89brBqSOzXBFnlkC4LIyHTf7ZvNEGacnIWiBosOagYzHmu
         2G/3JzZLnSCHA3sOjAHYjNFg1AstmRSbfeB0QPnv/tK0s2F4M6HJqWgeDPPb8iAy8vCl
         HBuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706694469; x=1707299269;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/O9XgRbkcBJVk7UwNZF0sbS5DqjZwvxc08GdgHW/6js=;
        b=TH7Zo/vCZIWEfarKDsAin9glAZy44XaZhGmz2L1vEwVIrjB6rkGsoHWFFybaRPmJPC
         S3quXeEM3/rMtVCzAI3GUbC5r9KBHWyokERMSkIB4GfnXVtK6nj5pLUtPZ8suxqBj4pa
         QKVFWxTe/ss191KQqD4Y/IhHTnlfWUvBaL5QwFDlKIWoNC2iN8AHluO+rkh4zQz5hEuV
         fEX64qBDfWzeuZhX0A48iefHOpZHRXWHXJGSBUsLEBZWx3HYNh8U1PzYmq6yg+D9XAox
         Vbkpxxp5MalJLePy7iaxNFKQGtI3D79LfyTzUTENNLPGLoAZDRDy7qAG88E3vPaVtt3h
         IeCg==
X-Gm-Message-State: AOJu0YwZyNlOyFNeN5COcTkx/5mxS9d06KI2QsRi0wvnDzUeAGSetmVC
	s7RH9l11o6Hcv+DbNBeADMc2FK+ZGatiwtrqS5beJ0+mGbCeXlOu
X-Google-Smtp-Source: AGHT+IG7soa47inYZ5qRD0y2IAxLTuYubf/We9SppnGjsvKB6J8PYmZ+J/JIhIYIFJ4eW+ahV6p0bw==
X-Received: by 2002:aa7:d3da:0:b0:55f:4d7e:e4e9 with SMTP id o26-20020aa7d3da000000b0055f4d7ee4e9mr677420edr.21.1706694468728;
        Wed, 31 Jan 2024 01:47:48 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWiQ74i0rflV78kHDD47By+VknL25M/waMOcUseNfD20dtrpXOOs6Ao+gTVaS8DbJxsRAeqz0D74nt/JzPKas4fElzSMHU34w5JZzRUGMeCAfihCbaCTiQtK30VNQHIpMClOh/RhgzoLzRD/c1G/GVg0n2Xq1yaP8QSGbquEojq3tT0Ngp9tgp1T6NjSPqpuhw4DhU9xq79sMBc5xVg7kfNgh4MfGP1W3tMOXWVvEe5W0CC5fKzqDdHHTTGS1QOI9O9mpkOaAG0lC3hMGyOu6hJjVOqkDF2AtMfPuS4xMj7fCJjzvqm+cUx7U68p5sHDS08r2ExD56T3alGKXX+JFF294bvkxPJwLkg3PUtv/w5GuijywP9P340TIWpJOibm28GzcD4n7N3R2cWhzhCC1ZRuTsBrBzZlEdQDW2w0kXXeNOVnMvePqRJBle9+Wy7OIKJquy1qbLmRF4/H25zBeTsCAH4Wy9nyUOXN8pxxvIVX7wTkzS+UhPMdncPI31/9xJnRQ52G7Mwr6HgtzhnzFvpG8wDV4yMM1b/N6zfStQBk29H6BbZcak5QEGndd41sRMDxxRDBmN3rlsn5DHQVqMqSulzElZgC/jBr455JmuklDm8/pD/zLy/KjDHB+xhJTLEPbpfOgfZCZyVWspgqXl5Dx0u3G27UtAUjenX6FjpCzau
Received: from krava (2001-1ae9-1c2-4c00-726e-c10f-8833-ff22.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:726e:c10f:8833:ff22])
        by smtp.gmail.com with ESMTPSA id h11-20020aa7c94b000000b00558a3268bbcsm5651569edt.53.2024.01.31.01.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jan 2024 01:47:48 -0800 (PST)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Wed, 31 Jan 2024 10:47:46 +0100
To: Daniel Xu <dxu@dxuuu.xyz>
Cc: linux-trace-kernel@vger.kernel.org, coreteam@netfilter.org,
	bpf@vger.kernel.org, linux-input@vger.kernel.org,
	cgroups@vger.kernel.org, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
	fsverity@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	netfilter-devel@vger.kernel.org, alexei.starovoitov@gmail.com,
	olsajiri@gmail.com, quentin@isovalent.com, alan.maguire@oracle.com,
	memxor@gmail.com
Subject: Re: [PATCH bpf-next v4 0/3] Annotate kfuncs in .BTF_ids section
Message-ID: <ZboXQmsg6fO-qaNu@krava>
References: <cover.1706491398.git.dxu@dxuuu.xyz>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1706491398.git.dxu@dxuuu.xyz>

On Sun, Jan 28, 2024 at 06:24:05PM -0700, Daniel Xu wrote:
> === Description ===
> 
> This is a bpf-treewide change that annotates all kfuncs as such inside
> .BTF_ids. This annotation eventually allows us to automatically generate
> kfunc prototypes from bpftool.
> 
> We store this metadata inside a yet-unused flags field inside struct
> btf_id_set8 (thanks Kumar!). pahole will be taught where to look.
> 
> More details about the full chain of events are available in commit 3's
> description.
> 
> The accompanying pahole and bpftool changes can be viewed
> here on these "frozen" branches [0][1].
> 
> [0]: https://github.com/danobi/pahole/tree/kfunc_btf-v3-mailed
> [1]: https://github.com/danobi/linux/tree/kfunc_bpftool-mailed
> 
> === Changelog ===
> 
> Changes from v3:
> * Rebase to bpf-next and add missing annotation on new kfunc

Acked-by: Jiri Olsa <jolsa@kernel.org>

jirka

> 
> Changes from v2:
> * Only WARN() for vmlinux kfuncs
> 
> Changes from v1:
> * Move WARN_ON() up a call level
> * Also return error when kfunc set is not properly tagged
> * Use BTF_KFUNCS_START/END instead of flags
> * Rename BTF_SET8_KFUNC to BTF_SET8_KFUNCS
> 
> Daniel Xu (3):
>   bpf: btf: Support flags for BTF_SET8 sets
>   bpf: btf: Add BTF_KFUNCS_START/END macro pair
>   bpf: treewide: Annotate BPF kfuncs in BTF
> 
>  Documentation/bpf/kfuncs.rst                  |  8 +++----
>  drivers/hid/bpf/hid_bpf_dispatch.c            |  8 +++----
>  fs/verity/measure.c                           |  4 ++--
>  include/linux/btf_ids.h                       | 21 +++++++++++++++----
>  kernel/bpf/btf.c                              |  8 +++++++
>  kernel/bpf/cpumask.c                          |  4 ++--
>  kernel/bpf/helpers.c                          |  8 +++----
>  kernel/bpf/map_iter.c                         |  4 ++--
>  kernel/cgroup/rstat.c                         |  4 ++--
>  kernel/trace/bpf_trace.c                      |  8 +++----
>  net/bpf/test_run.c                            |  8 +++----
>  net/core/filter.c                             | 20 +++++++++---------
>  net/core/xdp.c                                |  4 ++--
>  net/ipv4/bpf_tcp_ca.c                         |  4 ++--
>  net/ipv4/fou_bpf.c                            |  4 ++--
>  net/ipv4/tcp_bbr.c                            |  4 ++--
>  net/ipv4/tcp_cubic.c                          |  4 ++--
>  net/ipv4/tcp_dctcp.c                          |  4 ++--
>  net/netfilter/nf_conntrack_bpf.c              |  4 ++--
>  net/netfilter/nf_nat_bpf.c                    |  4 ++--
>  net/xfrm/xfrm_interface_bpf.c                 |  4 ++--
>  net/xfrm/xfrm_state_bpf.c                     |  4 ++--
>  .../selftests/bpf/bpf_testmod/bpf_testmod.c   |  8 +++----
>  23 files changed, 87 insertions(+), 66 deletions(-)
> 
> -- 
> 2.42.1
> 
