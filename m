Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61199110A
	for <fsverity@lists.linux.dev>; Thu,  2 Nov 2023 01:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dq3t6X3V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E81CCC433C9
	for <fsverity@lists.linux.dev>; Thu,  2 Nov 2023 01:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698887985;
	bh=L/oIBZWNwYWfO9paAjPVkqSlKsZsAbx1VcI8buvd3Mg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=dq3t6X3VtYVBiMxbzKe9okGWfrQnPh017oHW3numUXW46HpRtOEFf1zM9srNWS10s
	 HGJzd/oxgVWI4m0JhsbKzrfKVjUotc4WwBZAHML5CacKqf+22Jsj72Z61csALDiqFg
	 LdNj889eXyzoEJOJCP0M8JIXy1EGOqUbKSVYCVrS1+3/ztxO4wohv+WE9bXfC3DIHy
	 hi2C8uJ9JRY9nzrrAHLQqpV6Wpm1QaDvNft46k6GvimjDM4GAVqAmtS2cOYY2BnW4/
	 uB0Vn8EDtO+GqfNvnql+ur2Htf2B/vpZhhY5fXV6vKq3FIr7q7ehEekjKWmErAel8K
	 xxSBfsaDB3sZA==
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-540c54944c4so815592a12.1
        for <fsverity@lists.linux.dev>; Wed, 01 Nov 2023 18:19:45 -0700 (PDT)
X-Gm-Message-State: AOJu0Yz+xuR/QZzyiBWTbgCJ61vobFAuOjMIF9pXp09IjXGuDq6rLnAb
	5stQzk28cDJPZX6F8KryBCGjnHLpW/jVb2+ZqCIExw==
X-Google-Smtp-Source: AGHT+IHRwnrYCM8u0Xkx7s8wzLF8rI7K+5LthsF0HLjZNf92tBCMzXU35cQWCtPEHuewuI5pK9cewkWwT6jVtb0Hhe8=
X-Received: by 2002:a05:6402:3482:b0:52b:db44:79e3 with SMTP id
 v2-20020a056402348200b0052bdb4479e3mr4224453edc.4.1698887984323; Wed, 01 Nov
 2023 18:19:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231013182644.2346458-1-song@kernel.org> <20231013182644.2346458-2-song@kernel.org>
 <CAADnVQLcrxLatupH=i2Q-K8KRF72PqB8wayC=UEKvuMMn3ie7A@mail.gmail.com>
In-Reply-To: <CAADnVQLcrxLatupH=i2Q-K8KRF72PqB8wayC=UEKvuMMn3ie7A@mail.gmail.com>
From: KP Singh <kpsingh@kernel.org>
Date: Thu, 2 Nov 2023 02:19:33 +0100
X-Gmail-Original-Message-ID: <CACYkzJ4=8TwRS4xGm3G81LtkYLWtwZY0G2OvK25TTrF5Fyppwg@mail.gmail.com>
Message-ID: <CACYkzJ4=8TwRS4xGm3G81LtkYLWtwZY0G2OvK25TTrF5Fyppwg@mail.gmail.com>
Subject: Re: [PATCH bpf-next 1/5] bpf: Add kfunc bpf_get_file_xattr
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Song Liu <song@kernel.org>, bpf <bpf@vger.kernel.org>, fsverity@lists.linux.dev, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@kernel.org>, 
	Kernel Team <kernel-team@meta.com>, Eric Biggers <ebiggers@kernel.org>, 
	"Theodore Ts'o" <tytso@mit.edu>, Roberto Sassu <roberto.sassu@huaweicloud.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 17, 2023 at 9:11=E2=80=AFPM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> On Fri, Oct 13, 2023 at 11:30=E2=80=AFAM Song Liu <song@kernel.org> wrote=
:
> > +__bpf_kfunc int bpf_get_file_xattr(struct file *file, struct bpf_dynpt=
r_kern *name_ptr,
> > +                                  struct bpf_dynptr_kern *value_ptr)
> > +{
> > +       if (!bpf_dynptr_is_string(name_ptr))
> > +               return -EINVAL;
> > +
> > +       return vfs_getxattr(mnt_idmap(file->f_path.mnt), file_dentry(fi=
le), name_ptr->data,
> > +                           value_ptr->data, __bpf_dynptr_size(value_pt=
r));
> > +}
> > +
> > +__diag_pop();
> > +
> > +BTF_SET8_START(fs_kfunc_set)
> > +BTF_ID_FLAGS(func, bpf_get_file_xattr, KF_SLEEPABLE)
>
> I suspect it needs to be allowlisted too.
> Sleepable might not be enough.
>
> KP proposed such kfunc in the past and there were recursion issues.
>
> KP,
> do you remember the details?

yeah, have a look at Al's reply:

https://lore.kernel.org/bpf/Yrs4+ThR4ACb5eD%2F@ZenIV/

it can create deadlocks and potentially UAFs (similar to the situation
Jann mentioned). This will need to be allowlisted.
