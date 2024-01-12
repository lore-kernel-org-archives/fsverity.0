Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A2CB745C9
	for <fsverity@lists.linux.dev>; Fri, 12 Jan 2024 16:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MsdtK8ju"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-50e72e3d435so6510605e87.2
        for <fsverity@lists.linux.dev>; Fri, 12 Jan 2024 08:20:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705076443; x=1705681243; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AXoDO1itquPIC9RJIHRuZv9xrGW2cJyAPsZoJpPFw+4=;
        b=MsdtK8junoUeN/dvZqaIdvRy0rXULnu/p1L/oVvHph3CnhuGsGFyw16Zj/ik1fe2fl
         WQEl9VBinJFm8KzZyiPXva+A4wJS9SlV60QjfITqrinLD0cL5SAMhmj3AHi7e3EuhZOR
         SWTuzuZyGEuSlAba1p0q7LfdAVmQihC0QvYC5U2OguMsZXnFhSA1DJFVEHQaMDw+ZstO
         S3fM+5trMSJLJcvDXMX+g+g7wkfnVJ+8Rf2NxlT8tiY9RO6X4Z3ji++8j1y+A69mc4Qn
         M+iVaQQEvq2ny7qyGMIqFzArktvDAP/m1lVT/TAPot8ijXcKFYgzFqCURLR3UXjmDQej
         /22A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705076443; x=1705681243;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AXoDO1itquPIC9RJIHRuZv9xrGW2cJyAPsZoJpPFw+4=;
        b=QlrNvUjDKueZaWWLqyPbC//fgwlzejpA+7P/2ewxEmA2ziX0A85aygKQJ88yE+TJ3F
         5+nqDqmtVLG6ZzD3GS48VkJz7pNRRa+ZYgyJq6AUKqmvW/Xf6kV8NBXAVMXJeIaiAQ2n
         YwrV8ypSWdgfyWLq67EzmzTJ1lsTrdMSjgwGu8xsvnFKTofD5j4qPOFRLPYjUQbe9fl4
         J/TfE0u7TSMqWYL11TGeljWfitd3Ywv4hr0a7hMWvDxw5mimYlQnEsY2hZ9Pbn5dq9Rb
         5+OWWK5v12dLHxj+qtavPv53ZnoU4tt7xlEBS2Rm6pY9GyglQQ0tkso//kko8yZVoXNk
         U1Ag==
X-Gm-Message-State: AOJu0YypVd7Q8z2Ld2lRCyntIPDh+GyyfDwAdhlZFt1ixPB2OgvDzIzE
	/IqzbK20F/SG5PnSbBxEA20=
X-Google-Smtp-Source: AGHT+IE54+pPKK6YhmHg0iM9e5UupkHUdB/tKeoGr8eQ2XZMM3dBdNGnw8BrNqPksBRiLQFF6ydb5Q==
X-Received: by 2002:a05:6512:128d:b0:50e:7b9c:8b1a with SMTP id u13-20020a056512128d00b0050e7b9c8b1amr697559lfs.95.1705076443029;
        Fri, 12 Jan 2024 08:20:43 -0800 (PST)
Received: from krava (ip-94-113-247-30.net.vodafone.cz. [94.113.247.30])
        by smtp.gmail.com with ESMTPSA id w26-20020a17090652da00b00a1c7b20e9e6sm1931682ejn.32.2024.01.12.08.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jan 2024 08:20:42 -0800 (PST)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Fri, 12 Jan 2024 17:20:39 +0100
To: Daniel Xu <dxu@dxuuu.xyz>
Cc: linux-input@vger.kernel.org, coreteam@netfilter.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	netfilter-devel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, fsverity@lists.linux.dev,
	bpf@vger.kernel.org, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com, cgroups@vger.kernel.org,
	alexei.starovoitov@gmail.com, olsajiri@gmail.com,
	quentin@isovalent.com, alan.maguire@oracle.com, memxor@gmail.com
Subject: Re: [PATCH bpf-next v3 0/3] Annotate kfuncs in .BTF_ids section
Message-ID: <ZaFm13GyXUukcnkm@krava>
References: <cover.1704565248.git.dxu@dxuuu.xyz>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1704565248.git.dxu@dxuuu.xyz>

On Sat, Jan 06, 2024 at 11:24:07AM -0700, Daniel Xu wrote:
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
> The accompanying pahole changes (still needs some cleanup) can be viewed
> here on this "frozen" branch [0].

so the plan is to have bpftool support to generate header file
with detected kfuncs?

jirka

> 
> [0]: https://github.com/danobi/pahole/tree/kfunc_btf-mailed
> 
> === Changelog ===
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
>  net/core/filter.c                             | 16 +++++++-------
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
>  22 files changed, 81 insertions(+), 60 deletions(-)
> 
> -- 
> 2.42.1
> 
