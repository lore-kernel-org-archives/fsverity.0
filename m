Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 829A113AFE
	for <fsverity@lists.linux.dev>; Mon, 12 Jun 2023 10:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686565991;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5rnUtUvAxrIG0+x6pEPBqjxD12uNXgsMQSi7V6WAdB8=;
	b=fsrLFBEy5Ddmkgg4MQo772ml5xlR6+Kjuo40/3WYCLScOrGaobuoOLrLgzKXjThpm6sbCF
	Ll1l2hZnum5j8dToaUH7GizwKsMiWllJpNgbDyj/Oh2OFG3Jo77Cy0VzshB5skr31JLgnm
	/oPtV6wHO9vB2CivlO9Zu3Hl5bxRaTI=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-640-OKIgbgyLNNevr_Wlk_sjxA-1; Mon, 12 Jun 2023 06:33:10 -0400
X-MC-Unique: OKIgbgyLNNevr_Wlk_sjxA-1
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-33fddc27743so21235635ab.3
        for <fsverity@lists.linux.dev>; Mon, 12 Jun 2023 03:33:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686565989; x=1689157989;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5rnUtUvAxrIG0+x6pEPBqjxD12uNXgsMQSi7V6WAdB8=;
        b=g0XaRBCrIlMOwAn+RhQhmqBRrjfSYIRliiOcZfreNHck73XiRXy1/1hDKjQ2N3oBSE
         hkfKahZnjuBnz/rE86P8X2JhvOtJJUngJSskP5WxZHCR1qJll3vkNFYTrYPgMpOnw+ll
         FNnN406ZbLhxp+IKre3RHGySyHXOgm3pyZX+xczgeOG9uLjH7cuvRwR55tJlG0Mdi/Qv
         /ZZtVgS+Zu0ZBDEa+qN2QzZoswHthWPwoxeaeIna0Dn2qGUamcqPPo3LyfAfrpCTZroe
         ix0V5mMSH1sYlA4Aq9FI+9k7UJ4eHN3wdYSFYeTJnXQoh1e6gxWf27g8pQl2jyD3tPey
         MnWw==
X-Gm-Message-State: AC+VfDxtSQ4t6t1kCZ1ynOuOs63mhVDJQQgJl+DftAwAUPCa4CZBbVxV
	/UCBP0VU9L/ARzXnNo9WWEHT1Dyo0o3MY11TjuoZBBwA2ZW9A91S8QNQRZMBVLOLmWvBMyFW8cI
	0JhwtsMAInYH1Yn5yAf7q0S3fz8Q60fKbTZQ=
X-Received: by 2002:a92:db47:0:b0:33d:504a:3058 with SMTP id w7-20020a92db47000000b0033d504a3058mr8174667ilq.18.1686565989282;
        Mon, 12 Jun 2023 03:33:09 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6Cy8qW4EorV7FH58amcDmbatyuFgE+ZtI9OEeETArSzbhdSMlrkQTo90WqwIM5lW3psrgi3bjLBddnASBCh6Q=
X-Received: by 2002:a92:db47:0:b0:33d:504a:3058 with SMTP id
 w7-20020a92db47000000b0033d504a3058mr8174654ilq.18.1686565988983; Mon, 12 Jun
 2023 03:33:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1683102959.git.alexl@redhat.com> <b58e57955e122b5d6c4e087cf2dd6ed664152c7b.1683102959.git.alexl@redhat.com>
 <20230514191647.GD9528@sol.localdomain> <CAOQ4uxhEq8u37YNnqQmLbybJy1Kkg3Qk0TVtRZQP-yHt8CMmWA@mail.gmail.com>
 <CAL7ro1Hqc29w-FuRuoEfcsxiXTnqqwHP73nwvmZRuKVRsz4D9w@mail.gmail.com>
 <CAOQ4uxh_y+YO3q7dB=ALCriq31RhapOHGt+jcXTQbOC7iVqYTw@mail.gmail.com>
 <CAL7ro1GTzJy5Nv1vH0buVEXUnUk7cXBhSJB2ap8Jt_hutk7nYw@mail.gmail.com> <CAOQ4uxgbMD2RdEqta7a2t3uVceLuZDxOWA9SBNDAgZSdO_532Q@mail.gmail.com>
In-Reply-To: <CAOQ4uxgbMD2RdEqta7a2t3uVceLuZDxOWA9SBNDAgZSdO_532Q@mail.gmail.com>
From: Alexander Larsson <alexl@redhat.com>
Date: Mon, 12 Jun 2023 12:32:58 +0200
Message-ID: <CAL7ro1FF_q7FEJdevWrqvugkJ9S8bU5MxcoHHrLC3D834u4+zQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] ovl: Validate verity xattr when resolving lowerdata
To: Amir Goldstein <amir73il@gmail.com>
Cc: Eric Biggers <ebiggers@kernel.org>, miklos@szeredi.hu, linux-unionfs@vger.kernel.org, 
	tytso@mit.edu, fsverity@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 11, 2023 at 1:20=E2=80=AFPM Amir Goldstein <amir73il@gmail.com>=
 wrote:
>
> On Sat, Jun 10, 2023 at 6:02=E2=80=AFPM Alexander Larsson <alexl@redhat.c=
om> wrote:
> >
> > On Fri, Jun 9, 2023 at 3:03=E2=80=AFPM Amir Goldstein <amir73il@gmail.c=
om> wrote:
> > >
> > > On Mon, May 15, 2023 at 9:15=E2=80=AFAM Alexander Larsson <alexl@redh=
at.com> wrote:
> > > >
> > > > On Sun, May 14, 2023 at 11:00=E2=80=AFPM Amir Goldstein <amir73il@g=
mail.com> wrote:
> > > > >
> > > > > On Sun, May 14, 2023 at 10:16=E2=80=AFPM Eric Biggers <ebiggers@k=
ernel.org> wrote:
> > > > > >
> > > > > > On Wed, May 03, 2023 at 10:51:38AM +0200, Alexander Larsson wro=
te:
> > > > > > > When resolving lowerdata (lazily or non-lazily) we check the
> > > > > > > overlay.verity xattr on the metadata inode, and if set verify=
 that the
> > > > > > > source lowerdata inode matches it (according to the verity op=
tions
> > > > > > > enabled).
> > > > > >
> > > > > > Keep in mind that the lifetime of an inode's fsverity digest is=
 from when it is
> > > > > > first opened to when the inode is evicted from the inode cache.
> > > > > >
> > > > > > If the inode gets evicted from cache and re-instantiated, it co=
uld have been
> > > > > > arbitrarily changed.
> > > > > >
> > > > > > Given that, does this verification happen in the right place?  =
I would have
> > > > > > expected it to happen whenever the file is opened, but it seems=
 you do it when
> > > > > > the dentry is looked up instead.  Maybe that works too, but I'd=
 appreciate an
> > > > > > explanation.
> > > > >
> > > > > Hmm. I do not think it is wrong because the overlay file cannot b=
e opened before
> > > > > the inode overlay is looked up and fsverity is verified on lookup=
.
> > > > > In theory, overlay inode with lower could have been instantiated =
by decode_fh(),
> > > > > but verity=3Don and nfs_export=3Don are conflicting options.
> > > > >
> > > > > However, I agree that doing verify check on lookup is a bit too e=
arly, as
> > > > > ls -lR will incur the overhead of verifying all file's data even
> > > > > though their data
> > > > > is not accessed in a non-lazy-lower-data scenario.
> > > > >
> > > > > The intuition of doing verity check before file is opened (or cop=
ied up)
> > > > > when there is a realfile open is not wrong, it would have gotten =
rid of the
> > > > > dodgy ovl_ensure_verity_loaded(), but I think that will be a bit =
harder to
> > > > > implement (not sure).
> > > > >
> > > > > My suggestion for Alexander:
> > > > > - Use ovl_set/test_flag(OVL_VERIFIED, inode) for lazy verify
> > > > > - Implement ovl_maybe_validate_verity() similar to
> > > > >   ovl_maybe_lookup_lowerdata()
> > > > > - Implement a helper ovl_verify_lowerdata()
> > > > >   that calls them both
> > > > > - Replace the ovl_maybe_lookup_lowerdata() calls with
> > > > >   ovl_verify_lowerdata() calls
> > > > >
> > > > > Then before opening (or copy up) a file, it could have either
> > > > > lazy lower data lookup or lazy lower data validate or both (or no=
ne).
> > > > >
> > > > > This will not avoid ovl_ensure_verity_loaded(), but it will load =
fsverity
> > > > > just before it is needed and it is a bit easier to take ovl_inode=
_lock
> > > > > unconditionally, in those call sites then deeper within copy_up, =
where
> > > > > ovl_inode_lock is already taken.
> > > > >
> > > > > I *think* this is a good idea, but we won't know until you try it=
,
> > > > > so please take my suggestion with a grain of salt.
> > > >
> > > > I'll have a look at it in a bit. It would make performance of
> > > > verity=3Don in the non-lazy-lookup case better.
> > > >
> > >
> > > Hi Alex,
> > >
> > > Now that lazy lookup is queued for next, I wanted to ask about the
> > > status of your patches.
> > >
> > > Is the issue above the only thing you still need to look at?
> > > No rush on my end, just wanted to be in sync.
> >
> > I spent some time on friday doing the initial work on this rework. In
> > case you want to look at it  I just pushed it to:
> >
> > https://github.com/alexlarsson/linux/tree/overlay-verity
> >
> > The first 3 commits are the same as before, and the last one is the
> > new approach. It's turned out pretty nice, simplifying things
> > considerable.
>
> It does look nicer :)
> I gave you a small review comment on github, but overall looks good.
>
> > But I really haven't had time to do a full re-review and
> > test of it, so please don't merge it yet. I'll spend Monday ensuring
> > it is in a good state for upstream.
> >
>
> When you are done testing, please post v3 patches.
>
> Note that I pushed a new version of ovl-lazy-lowerdata branch to
> fstests, with the minor :: syntax change.

I posted the patches, and I also had to make some small changes to the
xfstest commit:

https://github.com/alexlarsson/xfstests/commits/verity-tests

> Not sure if Miklos will have time to review them this cycle or wait
> for the next one.
>
> There are also the mount api changes from Christian that conflict
> with the new verify option.
>
> If we want to have all of these changes for this cycle, some collaboratio=
n
> will be required.

I would really like to get the overlay.verity xattr support in
upstream pretty soon, because without it I can't release a stable
version of the composefs userspace code. I don't want to release
something that is using an xattr format that is not guaranteed to be
stable.

--=20
=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D
 Alexander Larsson                                Red Hat, Inc
       alexl@redhat.com         alexander.larsson@gmail.com

