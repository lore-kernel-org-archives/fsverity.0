Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFCDFE57A
	for <fsverity@lists.linux.dev>; Sat,  6 Jan 2024 19:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ICVb/+5r"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-40d4a7f0c4dso7384245e9.1
        for <fsverity@lists.linux.dev>; Sat, 06 Jan 2024 11:10:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704568226; x=1705173026; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XN11DcyrjCYH4UjdpvhQMOODqptexpORHaHrc+DxqLo=;
        b=ICVb/+5r7z53sAscEw1gz4TIea+K18jBaN3beiBGPalF6yPMv4tr5b9gEPnCCVavdG
         cqEeDfOKAdWJswdzrPK4rSUQILLoONz/Il0GKjOY7UEZxZBlX4fusvIlJ/wY3Dxq1jGC
         97eJlDIKOW1yv6abQnpA3EFWsTf60hPqzM6RiP3/kgpVocwukgt0nMhwjyM7VZR7QN2N
         Aoxr/QFgoeN/T1LS8U5F6mx/EohfDhl/PEsFXZFJIZ6EvArCYnib9k0qkfhpt9HwBnEY
         EsAbck7Ev1wUM/se69/ZTi3Y6xvbTkYD5rJJ+YFdEc6s0MDqgxaL79m4EdIu/V94cvCK
         +Ftg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704568226; x=1705173026;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XN11DcyrjCYH4UjdpvhQMOODqptexpORHaHrc+DxqLo=;
        b=N4ThWDhL95NAgDvJgf1MWQJoNta0PCt3ipHzaw1RtX64QUb2S0GvD0wFxlx9mh64am
         2kdbt/rC98oOjEAJb3PuSGmIe8TT5Wot8bL3tVEMEZ8nsqaqcKOQdOhXfguXHLQOQlPW
         4Jnk3Bq4SsvJI0kGQ2GgnAbalDVFuWIJcEYFCrragUEl83rh/gzGStwuJmmC9XxPMXxZ
         vtN766V06FgBZwL1JtN+Z/fR9If0UHNHeckxlrtrcM35jIz/Wm/sLRRTH8uMKzUdpHrx
         wJbEGU1zEXjfUz0Ex90kQfqx772MeBk6cH3ar7YU/IBrSe6cQ5g4pPSH6HGNZpYCzvi8
         qJ+w==
X-Gm-Message-State: AOJu0YzIJuSfvmKkVTTKjK3fUZ2Rgq+P/ElABMCbC7yAG9ZId7KEcic+
	dj1L3+/qiNuyRJBOurHNigk=
X-Google-Smtp-Source: AGHT+IESwPxvVB/8ipXpccypJwcC+FaZlc0B4G0s35S17F9bfUk+r34RM+hEvGsKxoK3mBTpdLR0ZQ==
X-Received: by 2002:a05:600c:1e01:b0:40d:871c:558d with SMTP id ay1-20020a05600c1e0100b0040d871c558dmr730414wmb.32.1704568225771;
        Sat, 06 Jan 2024 11:10:25 -0800 (PST)
Received: from krava ([83.240.62.111])
        by smtp.gmail.com with ESMTPSA id h17-20020a05600c351100b0040d5f466deesm5459251wmq.38.2024.01.06.11.10.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jan 2024 11:10:25 -0800 (PST)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Sat, 6 Jan 2024 20:10:23 +0100
To: Daniel Xu <dxu@dxuuu.xyz>
Cc: Jiri Olsa <olsajiri@gmail.com>, alexandre.torgue@foss.st.com,
	benjamin.tissoires@redhat.com, lizefan.x@bytedance.com,
	Herbert Xu <herbert@gondor.apana.org.au>, dsahern@kernel.org,
	hannes@cmpxchg.org, rostedt@goodmis.org, mcoquelin.stm32@gmail.com,
	pablo@netfilter.org, martin.lau@linux.dev, edumazet@google.com,
	daniel@iogearbox.net, ebiggers@kernel.org, yonghong.song@linux.dev,
	john.fastabend@gmail.com, hawk@kernel.org,
	steffen.klassert@secunet.com, jikos@kernel.org, kuba@kernel.org,
	fw@strlen.de, ast@kernel.org, song@kernel.org, pabeni@redhat.com,
	shuah@kernel.org, tytso@mit.edu, tj@kernel.org,
	kadlec@netfilter.org, davem@davemloft.net, mhiramat@kernel.org,
	andrii@kernel.org, alexei.starovoitov@gmail.com,
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
Message-ID: <ZZmln7mwvLRjqqRo@krava>
References: <cover.1704422454.git.dxu@dxuuu.xyz>
 <a923e3809955bdfd2bc8d6a103c20e01f1636dbc.1704422454.git.dxu@dxuuu.xyz>
 <ZZgcJTdwMZHglPtr@krava>
 <4tsn6x45gh3vgdst3ozzmxori5gzylvpx6btxue6sbsmx7siok@6wajzdgwxfpa>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4tsn6x45gh3vgdst3ozzmxori5gzylvpx6btxue6sbsmx7siok@6wajzdgwxfpa>

On Fri, Jan 05, 2024 at 09:55:43AM -0700, Daniel Xu wrote:
> On Fri, Jan 05, 2024 at 04:11:33PM +0100, Jiri Olsa wrote:
> > On Thu, Jan 04, 2024 at 07:45:49PM -0700, Daniel Xu wrote:
> > 
> > SNIP
> > 
> > > diff --git a/fs/verity/measure.c b/fs/verity/measure.c
> > > index bf7a5f4cccaf..3969d54158d1 100644
> > > --- a/fs/verity/measure.c
> > > +++ b/fs/verity/measure.c
> > > @@ -159,9 +159,9 @@ __bpf_kfunc int bpf_get_fsverity_digest(struct file *file, struct bpf_dynptr_ker
> > >  
> > >  __bpf_kfunc_end_defs();
> > >  
> > > -BTF_SET8_START(fsverity_set_ids)
> > > +BTF_KFUNCS_START(fsverity_set_ids)
> > >  BTF_ID_FLAGS(func, bpf_get_fsverity_digest, KF_TRUSTED_ARGS)
> > > -BTF_SET8_END(fsverity_set_ids)
> > > +BTF_KFUNCS_END(fsverity_set_ids)
> > >  
> > >  static int bpf_get_fsverity_digest_filter(const struct bpf_prog *prog, u32 kfunc_id)
> > >  {
> > > diff --git a/kernel/bpf/btf.c b/kernel/bpf/btf.c
> > > index 51e8b4bee0c8..8cc718f37a9d 100644
> > > --- a/kernel/bpf/btf.c
> > > +++ b/kernel/bpf/btf.c
> > > @@ -7802,6 +7802,10 @@ int register_btf_kfunc_id_set(enum bpf_prog_type prog_type,
> > >  {
> > >  	enum btf_kfunc_hook hook;
> > >  
> > > +	/* All kfuncs need to be tagged as such in BTF */
> > > +	if (WARN_ON(!(kset->set->flags & BTF_SET8_KFUNCS)))
> > > +		return -EINVAL;
> > 
> > having the warning for module with wrong set8 flags seems wrong to me,
> > I think we should trigger the warn only for kernel calls.. by adding
> > kset->owner check in the condition above
> 
> Just checking:
> 
> The reasoning is that =m and out-of-tree modules can and should check
> return code, right?
> 
> And =y modules or vmlinux-based registrations do not check return code,
> so WARN() is necessary?
> 
> If so, I'd agree.

right, I was also concerned we could flood console with loading module
that just uses wrong set8.. perhaps we could just use WARN_ON_ONCE with
no additional checks

jirka
