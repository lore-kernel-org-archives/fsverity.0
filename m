Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BFCB79E5
	for <fsverity@lists.linux.dev>; Fri,  9 Jun 2023 13:03:35 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-75d4dd6f012so163088385a.2
        for <fsverity@lists.linux.dev>; Fri, 09 Jun 2023 06:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686315815; x=1688907815;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KBDLWvq0MgCGtsbUr2B8HXbN/FfWXPMMyak6sDoif+0=;
        b=nFYfXco1h3VeLqHfuNjrJkPu+ofTyTXkQhjhQ9fEVWiKrSreSMqp4+ojBRH/uXH/YB
         tkLCUDHNMKuY6Zlzv+HENyggTi+3ggesmKdkGIcaJFYf+1R4fhjx/PMiOVtoJK+S+Nyv
         Ruy3rgZuSdTbqAVW9Tu71D99bmZfCtoCoxlJ6oZcjI219rpX6ccWrHAD73xP7s5upGLc
         yrprB47L1L9IB/fvFHlVMVK/pAeUi+aol13DP7le8ndcoqYs7ljP/DHego69vJgoBjKB
         KtBI+mn4hkGx8s9Vuxjjyvs6TjvYAzlZ3ljmwXASOcEuf9FoNve/KMb9tV6e4nujuLtb
         vRbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686315815; x=1688907815;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KBDLWvq0MgCGtsbUr2B8HXbN/FfWXPMMyak6sDoif+0=;
        b=CkYYW9H6lQiMZIJY9o9twnGE7cnf2RAAtUfyICLTlisAGcKphrm6975LZPS7anSSSQ
         RP+jRblrteWw6jEZ3cUfvghrvEuhd5rKqOuja6mC5POfwXcU3iLs3/cw77eGfzdOiAJZ
         55WDvi2Cfo+o73R/U3sLCJk7NvQxwtPr/njQQxoAjdmD0gpKZasnA+d/1PxjO/BlAVSd
         CzqmnMUR/EcURiCQW2rK1fCXtLJBmK5dcGbLCM1cAOPUcRe4UnYgDLDRlxcnDDfOsIvu
         zEPMBbYUQKJzJRCnHd4m7/N18319aQrpD5q4nCnx/157Wt01GASqPHWe0arIJGhyzOWO
         pIPQ==
X-Gm-Message-State: AC+VfDxLQYfzB4ke/xlCRxubuTVMnodrTlJh6yjvUhvOGuLXrkOzl97/
	h/dlqFEGL4rD/I2LitScByfNjfXwJ7jOeqpHJp0=
X-Google-Smtp-Source: ACHHUZ7G7K7MUGbhrIudWxuyT/XIhK+UPCqqZ1fMOz7zudU5Vz3oiRq8/UCfdNdO43PpcNSDgRXlKVgv5PDyVFBnskk=
X-Received: by 2002:a05:620a:8793:b0:75b:23a0:deab with SMTP id
 py19-20020a05620a879300b0075b23a0deabmr1004085qkn.41.1686315814458; Fri, 09
 Jun 2023 06:03:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1683102959.git.alexl@redhat.com> <b58e57955e122b5d6c4e087cf2dd6ed664152c7b.1683102959.git.alexl@redhat.com>
 <20230514191647.GD9528@sol.localdomain> <CAOQ4uxhEq8u37YNnqQmLbybJy1Kkg3Qk0TVtRZQP-yHt8CMmWA@mail.gmail.com>
 <CAL7ro1Hqc29w-FuRuoEfcsxiXTnqqwHP73nwvmZRuKVRsz4D9w@mail.gmail.com>
In-Reply-To: <CAL7ro1Hqc29w-FuRuoEfcsxiXTnqqwHP73nwvmZRuKVRsz4D9w@mail.gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 9 Jun 2023 16:03:23 +0300
Message-ID: <CAOQ4uxh_y+YO3q7dB=ALCriq31RhapOHGt+jcXTQbOC7iVqYTw@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] ovl: Validate verity xattr when resolving lowerdata
To: Alexander Larsson <alexl@redhat.com>
Cc: Eric Biggers <ebiggers@kernel.org>, miklos@szeredi.hu, linux-unionfs@vger.kernel.org, 
	tytso@mit.edu, fsverity@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 15, 2023 at 9:15=E2=80=AFAM Alexander Larsson <alexl@redhat.com=
> wrote:
>
> On Sun, May 14, 2023 at 11:00=E2=80=AFPM Amir Goldstein <amir73il@gmail.c=
om> wrote:
> >
> > On Sun, May 14, 2023 at 10:16=E2=80=AFPM Eric Biggers <ebiggers@kernel.=
org> wrote:
> > >
> > > On Wed, May 03, 2023 at 10:51:38AM +0200, Alexander Larsson wrote:
> > > > When resolving lowerdata (lazily or non-lazily) we check the
> > > > overlay.verity xattr on the metadata inode, and if set verify that =
the
> > > > source lowerdata inode matches it (according to the verity options
> > > > enabled).
> > >
> > > Keep in mind that the lifetime of an inode's fsverity digest is from =
when it is
> > > first opened to when the inode is evicted from the inode cache.
> > >
> > > If the inode gets evicted from cache and re-instantiated, it could ha=
ve been
> > > arbitrarily changed.
> > >
> > > Given that, does this verification happen in the right place?  I woul=
d have
> > > expected it to happen whenever the file is opened, but it seems you d=
o it when
> > > the dentry is looked up instead.  Maybe that works too, but I'd appre=
ciate an
> > > explanation.
> >
> > Hmm. I do not think it is wrong because the overlay file cannot be open=
ed before
> > the inode overlay is looked up and fsverity is verified on lookup.
> > In theory, overlay inode with lower could have been instantiated by dec=
ode_fh(),
> > but verity=3Don and nfs_export=3Don are conflicting options.
> >
> > However, I agree that doing verify check on lookup is a bit too early, =
as
> > ls -lR will incur the overhead of verifying all file's data even
> > though their data
> > is not accessed in a non-lazy-lower-data scenario.
> >
> > The intuition of doing verity check before file is opened (or copied up=
)
> > when there is a realfile open is not wrong, it would have gotten rid of=
 the
> > dodgy ovl_ensure_verity_loaded(), but I think that will be a bit harder=
 to
> > implement (not sure).
> >
> > My suggestion for Alexander:
> > - Use ovl_set/test_flag(OVL_VERIFIED, inode) for lazy verify
> > - Implement ovl_maybe_validate_verity() similar to
> >   ovl_maybe_lookup_lowerdata()
> > - Implement a helper ovl_verify_lowerdata()
> >   that calls them both
> > - Replace the ovl_maybe_lookup_lowerdata() calls with
> >   ovl_verify_lowerdata() calls
> >
> > Then before opening (or copy up) a file, it could have either
> > lazy lower data lookup or lazy lower data validate or both (or none).
> >
> > This will not avoid ovl_ensure_verity_loaded(), but it will load fsveri=
ty
> > just before it is needed and it is a bit easier to take ovl_inode_lock
> > unconditionally, in those call sites then deeper within copy_up, where
> > ovl_inode_lock is already taken.
> >
> > I *think* this is a good idea, but we won't know until you try it,
> > so please take my suggestion with a grain of salt.
>
> I'll have a look at it in a bit. It would make performance of
> verity=3Don in the non-lazy-lookup case better.
>

Hi Alex,

Now that lazy lookup is queued for next, I wanted to ask about the
status of your patches.

Is the issue above the only thing you still need to look at?
No rush on my end, just wanted to be in sync.

Thanks,
Amir.
