Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC18AC8D1
	for <fsverity@lists.linux.dev>; Sat, 10 Jun 2023 15:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686409367;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iQ1tKe6xor/WE4oQ659wefhGp8d7f4VFJ0vODZMWN3w=;
	b=YCActHMs13LMN41k8G4t5qAjPXXa7YRora0dIZaVuBfHiNgi9enc6ooM2FFDVS9UFHXuoG
	f4FxkNazADiZx896yTTXp5X73cqZlErYX6C9oOv1HMtMqM0xuTURRHl+Wp9TxtRB4fICmQ
	/TpGbd3yIvwbALoqRILyNyzZP2rE9jE=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-517-f08x2UCHNfClgj1ML00Nmw-1; Sat, 10 Jun 2023 11:02:46 -0400
X-MC-Unique: f08x2UCHNfClgj1ML00Nmw-1
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-33b7c0bfa55so27962245ab.2
        for <fsverity@lists.linux.dev>; Sat, 10 Jun 2023 08:02:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686409365; x=1689001365;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iQ1tKe6xor/WE4oQ659wefhGp8d7f4VFJ0vODZMWN3w=;
        b=LB40aSnuNoPQvd7G1uqwHhk9H5G9aSQ7G2Lw/7eOJhcUUEkDbGaVzn39f2DLc/2kws
         42ENItLCM7AQqZTflEgw59O1gMuIeC2TYRNNexGVjwbugo2UfCV91bnNg5Y/8/M5s+Sm
         UKxf/8aUkZu0hWJJkQqSNww60lswGvbgA77qcaDRC+vyDgrhRi7NLMljdUMhpqCKD37D
         wz12q1Zs+gonlUT3jQcyyBnwu6hVweyAXLd4s7J7GiBIQql94Yy//OtZ+PbcIUEfqN1n
         YVjxOQOHRoTW6JEYNDqJgc4bf3K2L2jFIrxa49FZQP8eH79LazNtgqvmBGY1ojDfS4Y5
         uq+w==
X-Gm-Message-State: AC+VfDybrijWrOttoazfz3Bo4+daW7Ya69Dmu67hQdYIBoaaKgPSUJsJ
	CHKxxMrR/O/9ug5ilhyc1+3dG0JNJBEluFIFViA5Fqi4VrPxs8a3GUPwW/CUhdckuVLVLOYsBg4
	UpEfa20jW9fecYxc9hkUycDyaHHfzodK/mqI=
X-Received: by 2002:a92:cd07:0:b0:33b:6f65:2dd0 with SMTP id z7-20020a92cd07000000b0033b6f652dd0mr3822154iln.29.1686409365619;
        Sat, 10 Jun 2023 08:02:45 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5vyKyPaT5mEEM3ONVAHbJbi+CkCb0codUV093zAYjLykDMTLim7jSew/LSq5k0qy6nBNTtF8ENki0TgmBIsww=
X-Received: by 2002:a92:cd07:0:b0:33b:6f65:2dd0 with SMTP id
 z7-20020a92cd07000000b0033b6f652dd0mr3822134iln.29.1686409365359; Sat, 10 Jun
 2023 08:02:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1683102959.git.alexl@redhat.com> <b58e57955e122b5d6c4e087cf2dd6ed664152c7b.1683102959.git.alexl@redhat.com>
 <20230514191647.GD9528@sol.localdomain> <CAOQ4uxhEq8u37YNnqQmLbybJy1Kkg3Qk0TVtRZQP-yHt8CMmWA@mail.gmail.com>
 <CAL7ro1Hqc29w-FuRuoEfcsxiXTnqqwHP73nwvmZRuKVRsz4D9w@mail.gmail.com> <CAOQ4uxh_y+YO3q7dB=ALCriq31RhapOHGt+jcXTQbOC7iVqYTw@mail.gmail.com>
In-Reply-To: <CAOQ4uxh_y+YO3q7dB=ALCriq31RhapOHGt+jcXTQbOC7iVqYTw@mail.gmail.com>
From: Alexander Larsson <alexl@redhat.com>
Date: Sat, 10 Jun 2023 17:02:34 +0200
Message-ID: <CAL7ro1GTzJy5Nv1vH0buVEXUnUk7cXBhSJB2ap8Jt_hutk7nYw@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] ovl: Validate verity xattr when resolving lowerdata
To: Amir Goldstein <amir73il@gmail.com>
Cc: Eric Biggers <ebiggers@kernel.org>, miklos@szeredi.hu, linux-unionfs@vger.kernel.org, 
	tytso@mit.edu, fsverity@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 9, 2023 at 3:03=E2=80=AFPM Amir Goldstein <amir73il@gmail.com> =
wrote:
>
> On Mon, May 15, 2023 at 9:15=E2=80=AFAM Alexander Larsson <alexl@redhat.c=
om> wrote:
> >
> > On Sun, May 14, 2023 at 11:00=E2=80=AFPM Amir Goldstein <amir73il@gmail=
.com> wrote:
> > >
> > > On Sun, May 14, 2023 at 10:16=E2=80=AFPM Eric Biggers <ebiggers@kerne=
l.org> wrote:
> > > >
> > > > On Wed, May 03, 2023 at 10:51:38AM +0200, Alexander Larsson wrote:
> > > > > When resolving lowerdata (lazily or non-lazily) we check the
> > > > > overlay.verity xattr on the metadata inode, and if set verify tha=
t the
> > > > > source lowerdata inode matches it (according to the verity option=
s
> > > > > enabled).
> > > >
> > > > Keep in mind that the lifetime of an inode's fsverity digest is fro=
m when it is
> > > > first opened to when the inode is evicted from the inode cache.
> > > >
> > > > If the inode gets evicted from cache and re-instantiated, it could =
have been
> > > > arbitrarily changed.
> > > >
> > > > Given that, does this verification happen in the right place?  I wo=
uld have
> > > > expected it to happen whenever the file is opened, but it seems you=
 do it when
> > > > the dentry is looked up instead.  Maybe that works too, but I'd app=
reciate an
> > > > explanation.
> > >
> > > Hmm. I do not think it is wrong because the overlay file cannot be op=
ened before
> > > the inode overlay is looked up and fsverity is verified on lookup.
> > > In theory, overlay inode with lower could have been instantiated by d=
ecode_fh(),
> > > but verity=3Don and nfs_export=3Don are conflicting options.
> > >
> > > However, I agree that doing verify check on lookup is a bit too early=
, as
> > > ls -lR will incur the overhead of verifying all file's data even
> > > though their data
> > > is not accessed in a non-lazy-lower-data scenario.
> > >
> > > The intuition of doing verity check before file is opened (or copied =
up)
> > > when there is a realfile open is not wrong, it would have gotten rid =
of the
> > > dodgy ovl_ensure_verity_loaded(), but I think that will be a bit hard=
er to
> > > implement (not sure).
> > >
> > > My suggestion for Alexander:
> > > - Use ovl_set/test_flag(OVL_VERIFIED, inode) for lazy verify
> > > - Implement ovl_maybe_validate_verity() similar to
> > >   ovl_maybe_lookup_lowerdata()
> > > - Implement a helper ovl_verify_lowerdata()
> > >   that calls them both
> > > - Replace the ovl_maybe_lookup_lowerdata() calls with
> > >   ovl_verify_lowerdata() calls
> > >
> > > Then before opening (or copy up) a file, it could have either
> > > lazy lower data lookup or lazy lower data validate or both (or none).
> > >
> > > This will not avoid ovl_ensure_verity_loaded(), but it will load fsve=
rity
> > > just before it is needed and it is a bit easier to take ovl_inode_loc=
k
> > > unconditionally, in those call sites then deeper within copy_up, wher=
e
> > > ovl_inode_lock is already taken.
> > >
> > > I *think* this is a good idea, but we won't know until you try it,
> > > so please take my suggestion with a grain of salt.
> >
> > I'll have a look at it in a bit. It would make performance of
> > verity=3Don in the non-lazy-lookup case better.
> >
>
> Hi Alex,
>
> Now that lazy lookup is queued for next, I wanted to ask about the
> status of your patches.
>
> Is the issue above the only thing you still need to look at?
> No rush on my end, just wanted to be in sync.

I spent some time on friday doing the initial work on this rework. In
case you want to look at it  I just pushed it to:

https://github.com/alexlarsson/linux/tree/overlay-verity

The first 3 commits are the same as before, and the last one is the
new approach. It's turned out pretty nice, simplifying things
considerable. But I really haven't had time to do a full re-review and
test of it, so please don't merge it yet. I'll spend Monday ensuring
it is in a good state for upstream.

Also, for the people following at home, ostree master has now landed
initial work for using composefs images for the root filesystem. The
initial work with minimal changes to ostree, but long term we are also
considering a complete rework of ostree based 100% on composefs.
Interested parties can follow this here:

 https://github.com/ostreedev/ostree/issues/2867

--=20
=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D
 Alexander Larsson                                Red Hat, Inc
       alexl@redhat.com         alexander.larsson@gmail.com

