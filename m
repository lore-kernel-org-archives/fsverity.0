Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B9F21110
	for <fsverity@lists.linux.dev>; Sat, 13 Jan 2024 13:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gtAt3k+u"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a277339dcf4so817153766b.2
        for <fsverity@lists.linux.dev>; Sat, 13 Jan 2024 05:57:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705154263; x=1705759063; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PGE1HEJ5ixxTvOXVNxbbYY7sOdvQr1NpAqO6gUYLh08=;
        b=gtAt3k+uGp9WEMb0qt7honO6w5kCw2vYsyvFI4S3IKKARclzj8ZgIXuwB5nYzXU0aF
         NMqgFF2bj5v2QXm0Rh/4ko1le8Up1B6D++4w/3dWX6wjfvzGh2vze1VKZf0wdTf7Jtv7
         KCSx9tPA1VGiKWpZQkB3cvVWUWE+Ik74b9pJBzk25NcDMIZ2dnc92OexFOYXx7+4FGtO
         R/rXoH9T2dKbie7tNFFn2hyTMonKu72E23uF93Au82WtvUjcKrj80DjC5bjFN8wjVozC
         kiulbfhZ00d8qnd57GOiKM6Uq36R7ZJ1LcMgPGOvxl2gwDKLb1J2x8/F+839C2FPJCfR
         5WbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705154263; x=1705759063;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PGE1HEJ5ixxTvOXVNxbbYY7sOdvQr1NpAqO6gUYLh08=;
        b=SRj/hIJWqKWdLhI3JpeZ1JGAyCZ01XjFPwrLaDfzReoKy9rk14PzZ2IdNAO5ayOUBJ
         hpk3RydVMI1/udT2l8Vu22F4Ga0wWcD2qF0KcSCUieXDd/tXZpFHyl1P3Jxw2rToaWg3
         rcXo4uSMVlP9uqkKurQ+H8FsI1OVxgk+h9+DMp08POxEYP15crPg6ki7JozR8L0IMvEk
         qrA8zeAfoGfS7u09KjvMyFHEQVDEQv7Udreoz74kjs2No/jaBBIXSu9KznSXT+CtZtTq
         1QQ0OeN4cwIDzkWdrV/ocwGEGcPhlDLuSOLh7iuOfHcIBjJSoYYygwi6eGuqJwGwEGkZ
         K1hA==
X-Gm-Message-State: AOJu0YzVhD7nmkEvby3ufYYsxqzaQ+9Dkb1JRORZ4NWw/QGfHaeh1gnd
	Ca+oGzBrEKO5AJlFkpxZk8Y=
X-Google-Smtp-Source: AGHT+IFMOIYDYiCqRWjRhgVi6B2d5peHDNTF2jXuwvHB8FKts87L7ld0sC7DRk8qiddMgjxRgmPzDw==
X-Received: by 2002:a17:906:15c3:b0:a2b:1a80:7b72 with SMTP id l3-20020a17090615c300b00a2b1a807b72mr1514786ejd.30.1705154262796;
        Sat, 13 Jan 2024 05:57:42 -0800 (PST)
Received: from krava (ip-94-113-247-30.net.vodafone.cz. [94.113.247.30])
        by smtp.gmail.com with ESMTPSA id b4-20020a170906150400b00a2a37f63216sm2950887ejd.171.2024.01.13.05.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jan 2024 05:57:42 -0800 (PST)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Sat, 13 Jan 2024 14:57:40 +0100
To: Daniel Xu <dxu@dxuuu.xyz>
Cc: Jiri Olsa <olsajiri@gmail.com>, linux-input@vger.kernel.org,
	coreteam@netfilter.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, netfilter-devel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	fsverity@lists.linux.dev, bpf@vger.kernel.org,
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	cgroups@vger.kernel.org, alexei.starovoitov@gmail.com,
	quentin@isovalent.com, alan.maguire@oracle.com, memxor@gmail.com
Subject: Re: [PATCH bpf-next v3 0/3] Annotate kfuncs in .BTF_ids section
Message-ID: <ZaKW1AghwUnVz_c4@krava>
References: <cover.1704565248.git.dxu@dxuuu.xyz>
 <ZaFm13GyXUukcnkm@krava>
 <2dhmwvfnnqnlrui2qcr5fob54gdsuse5caievct42trvvia6qe@p24nymz3uttv>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2dhmwvfnnqnlrui2qcr5fob54gdsuse5caievct42trvvia6qe@p24nymz3uttv>

On Fri, Jan 12, 2024 at 01:03:59PM -0700, Daniel Xu wrote:
> On Fri, Jan 12, 2024 at 05:20:39PM +0100, Jiri Olsa wrote:
> > On Sat, Jan 06, 2024 at 11:24:07AM -0700, Daniel Xu wrote:
> > > === Description ===
> > > 
> > > This is a bpf-treewide change that annotates all kfuncs as such inside
> > > .BTF_ids. This annotation eventually allows us to automatically generate
> > > kfunc prototypes from bpftool.
> > > 
> > > We store this metadata inside a yet-unused flags field inside struct
> > > btf_id_set8 (thanks Kumar!). pahole will be taught where to look.
> > > 
> > > More details about the full chain of events are available in commit 3's
> > > description.
> > > 
> > > The accompanying pahole changes (still needs some cleanup) can be viewed
> > > here on this "frozen" branch [0].
> > 
> > so the plan is to have bpftool support to generate header file
> > with detected kfuncs?
> 
> Yep, that's the major use case. But I see other use cases as well like

ok, any chance you could already include it in the patchset?
would be a great way to test this.. maybe we could change
selftests to use that

thanks,
jirka


> precision probing of kfuncs. Rather than guess and check which progs can
> load (in the event of backwards incompatible kfunc changes), programs
> can look at kfunc type signature thru BTF.
