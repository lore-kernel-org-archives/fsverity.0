Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51DBA1FC8
	for <fsverity@lists.linux.dev>; Mon, 15 May 2023 06:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684131312;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IrydVMF432xLQ5z//yarPaLUFV+WCQb/KK9Ty+7VJHU=;
	b=LkKFdAfYx/ndAC7sJZYe4/GPo3IEw+Gwaw5bV1ZpxfNQVZHIXaRioRgZ+JEmpU7VDhgCj1
	jojdmtiBFBzeOdVCMcnDgz4FxBR4dCfm1OOr/875Gpj4RpogQS+cO/nXJCNvQx5CJ8hsEF
	3W6inswP+22SzdbmlMxoZ6g/OsFXDUs=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-596-ISKskqBTN0SQ6uH-OJn3IA-1; Mon, 15 May 2023 02:15:10 -0400
X-MC-Unique: ISKskqBTN0SQ6uH-OJn3IA-1
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-76fe42b7f7dso159900039f.0
        for <fsverity@lists.linux.dev>; Sun, 14 May 2023 23:15:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684131310; x=1686723310;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IrydVMF432xLQ5z//yarPaLUFV+WCQb/KK9Ty+7VJHU=;
        b=YHuukxKI/UrLRy+iVhl+XFnI8DePg76nycumoYxFcgPbaOTcNK+wH6CrtdqFKBNv4G
         hL9QqvLXCMRmy9AP8TXZ4aG+Q076JRuAEi4bo8vyNUTUD6CzrhYpisqbA7NCErw9iw5O
         KljUJtLPmeZkgf6WPmZ/lZM2TUVt1RKV5RFfzRR1MBiOYT0YxHeTIyrxFQGSaEwK/Mvx
         ppx2sXVYFCYGI/PY/KZBajT+SyVMdhaKZFImg6iRs0eLkgzJR+uSLBEZ5SrrrJAAGoIv
         PQUDtHI5HOVdC81L0/fQ8ibeNjdiqA8+i0AYjky19dfxs/dy7inlOUPiGsuhsJ/cgUjN
         yVqg==
X-Gm-Message-State: AC+VfDy6/Xx9q2qkJSTE310LOXESyOPkCdV6xETD/zB/kAT25vPRaO5a
	4CBjhEhyd8RTQKpU0HHtuJMi4KKWf1sJ3u/QAz8+nAqMogmsL8XfSeXZdUFhJHLR0g4eQ0PYRC4
	47aacY90skto4+6YZTUy+vZyq9/Bbwz5n0Az8mz1ODg8=
X-Received: by 2002:a92:dcc7:0:b0:325:eb13:1045 with SMTP id b7-20020a92dcc7000000b00325eb131045mr26522039ilr.2.1684131310108;
        Sun, 14 May 2023 23:15:10 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5bKLDDpSZDs7RFRlkTwbiDae1sl0GjNzBfGePZZHEzAXWikqfdZLHy5ZFJtGhcidHgYM+l0aa28k4m2ymI01I=
X-Received: by 2002:a92:dcc7:0:b0:325:eb13:1045 with SMTP id
 b7-20020a92dcc7000000b00325eb131045mr26522029ilr.2.1684131309927; Sun, 14 May
 2023 23:15:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1683102959.git.alexl@redhat.com> <b58e57955e122b5d6c4e087cf2dd6ed664152c7b.1683102959.git.alexl@redhat.com>
 <20230514191647.GD9528@sol.localdomain> <CAOQ4uxhEq8u37YNnqQmLbybJy1Kkg3Qk0TVtRZQP-yHt8CMmWA@mail.gmail.com>
In-Reply-To: <CAOQ4uxhEq8u37YNnqQmLbybJy1Kkg3Qk0TVtRZQP-yHt8CMmWA@mail.gmail.com>
From: Alexander Larsson <alexl@redhat.com>
Date: Mon, 15 May 2023 08:14:59 +0200
Message-ID: <CAL7ro1Hqc29w-FuRuoEfcsxiXTnqqwHP73nwvmZRuKVRsz4D9w@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] ovl: Validate verity xattr when resolving lowerdata
To: Amir Goldstein <amir73il@gmail.com>
Cc: Eric Biggers <ebiggers@kernel.org>, miklos@szeredi.hu, linux-unionfs@vger.kernel.org, 
	tytso@mit.edu, fsverity@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 14, 2023 at 11:00=E2=80=AFPM Amir Goldstein <amir73il@gmail.com=
> wrote:
>
> On Sun, May 14, 2023 at 10:16=E2=80=AFPM Eric Biggers <ebiggers@kernel.or=
g> wrote:
> >
> > On Wed, May 03, 2023 at 10:51:38AM +0200, Alexander Larsson wrote:
> > > When resolving lowerdata (lazily or non-lazily) we check the
> > > overlay.verity xattr on the metadata inode, and if set verify that th=
e
> > > source lowerdata inode matches it (according to the verity options
> > > enabled).
> >
> > Keep in mind that the lifetime of an inode's fsverity digest is from wh=
en it is
> > first opened to when the inode is evicted from the inode cache.
> >
> > If the inode gets evicted from cache and re-instantiated, it could have=
 been
> > arbitrarily changed.
> >
> > Given that, does this verification happen in the right place?  I would =
have
> > expected it to happen whenever the file is opened, but it seems you do =
it when
> > the dentry is looked up instead.  Maybe that works too, but I'd appreci=
ate an
> > explanation.
>
> Hmm. I do not think it is wrong because the overlay file cannot be opened=
 before
> the inode overlay is looked up and fsverity is verified on lookup.
> In theory, overlay inode with lower could have been instantiated by decod=
e_fh(),
> but verity=3Don and nfs_export=3Don are conflicting options.
>
> However, I agree that doing verify check on lookup is a bit too early, as
> ls -lR will incur the overhead of verifying all file's data even
> though their data
> is not accessed in a non-lazy-lower-data scenario.
>
> The intuition of doing verity check before file is opened (or copied up)
> when there is a realfile open is not wrong, it would have gotten rid of t=
he
> dodgy ovl_ensure_verity_loaded(), but I think that will be a bit harder t=
o
> implement (not sure).
>
> My suggestion for Alexander:
> - Use ovl_set/test_flag(OVL_VERIFIED, inode) for lazy verify
> - Implement ovl_maybe_validate_verity() similar to
>   ovl_maybe_lookup_lowerdata()
> - Implement a helper ovl_verify_lowerdata()
>   that calls them both
> - Replace the ovl_maybe_lookup_lowerdata() calls with
>   ovl_verify_lowerdata() calls
>
> Then before opening (or copy up) a file, it could have either
> lazy lower data lookup or lazy lower data validate or both (or none).
>
> This will not avoid ovl_ensure_verity_loaded(), but it will load fsverity
> just before it is needed and it is a bit easier to take ovl_inode_lock
> unconditionally, in those call sites then deeper within copy_up, where
> ovl_inode_lock is already taken.
>
> I *think* this is a good idea, but we won't know until you try it,
> so please take my suggestion with a grain of salt.

I'll have a look at it in a bit. It would make performance of
verity=3Don in the non-lazy-lookup case better.

--=20
=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D
 Alexander Larsson                                Red Hat, Inc
       alexl@redhat.com         alexander.larsson@gmail.com

