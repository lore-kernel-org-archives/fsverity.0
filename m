Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5898A5C
	for <fsverity@lists.linux.dev>; Wed, 14 Jun 2023 05:24:38 +0000 (UTC)
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-46e8e9ded51so45726e0c.2
        for <fsverity@lists.linux.dev>; Tue, 13 Jun 2023 22:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686720277; x=1689312277;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uedl8aOmiD9AKNJjAanB/6NKPkD3ghHapo7xFGnVcI4=;
        b=GxQ6/f1I6tO+C7Ch3n+s1ebyI29IljGly8i/0kN0b42auuXxG+TAp/8tVSN9d7vV9P
         ftnITETth9re8KF0uIq3/dPf0xIGjTgRzHcT6+4qb6duXXYSkVGljmAv2KpJlrTZb661
         4wcSytUg0e6Se2YotMK0gTGRV5vHTSYio3Ny3R6FpIpRWDPW0GKESY0EVyR+hPidNH+Y
         ASgpwlSoPO+PBrBdMhtDsA3yOt8XguHcxF+/Dj+e3hPYUSJZHBORXJru5A2wzMKq0Wt/
         khOquhLQ8TSrptK9XnmVSgE/MAp3LacdH0yAOIXT43++xQeg69F/ZTckcXO+QoJaT8BT
         8rng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686720277; x=1689312277;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uedl8aOmiD9AKNJjAanB/6NKPkD3ghHapo7xFGnVcI4=;
        b=j4p2WrRBRE6UzG9w1lbLJohEvYi0eLJripu09nwlJ8INe0qENa/teRk5ynMZr5xHcQ
         De66e/DsNe8VI9n2YQoOHm7VIkjxAM2VrNfBjJpDGvI+Gzxnrk+teGA17Gmdc3FzQhk9
         k+NhXalCONBU8LULGjyMkRDBYWgNmUg0UBXK/mhAkFzEadTCdYg/H+pJr2ofmsvUJR8v
         7VOGG+VNb9T+k6GhYZXXadjiF9HCbqHRM5Pq7iywdeGxkYM5ZCCHeNw7Ic8Z+OynR6uJ
         YJ2NxlyldN8m3kVSuQgdLvhyQWFDgwPX9dDyjN3xp/L3cC2ZhToNzAWgF1yQLptFbCSM
         p9Mw==
X-Gm-Message-State: AC+VfDwEvW6v0Rqw01CDmfqPv6rYUCNK1adW1oD7yxOjThrWhZxbc890
	y9EdTGPUqyoG4NhY2Vl0ttyrCdYsDcDXQwvnOyk=
X-Google-Smtp-Source: ACHHUZ6+2LyGJoGaXWvdQsThKMeLm5gzNhPgYGganjlJ60TM5GqBo1VW3u1Bk1cmN4NyEeFmE47T4PiIGAKjPZjn+WM=
X-Received: by 2002:a05:6102:141:b0:439:3c9f:d040 with SMTP id
 a1-20020a056102014100b004393c9fd040mr8085392vsr.34.1686720277396; Tue, 13 Jun
 2023 22:24:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1686565330.git.alexl@redhat.com> <03ac0ffd82bc1edc3a9baa68d1125f5e8cad93fd.1686565330.git.alexl@redhat.com>
 <20230612163216.GA847@sol.localdomain> <CAOQ4uxjS5-7_PaoxM41YaXW+KxwLK_K8AyJMaoi1m-3P-vZ9Kw@mail.gmail.com>
 <20230613063704.GA879@sol.localdomain> <CAOQ4uxg6BD_RDtWob5q2eX6uQ5hcWrK7wEDcBhFVrGM3vsn=NA@mail.gmail.com>
 <20230613182233.GC1139@sol.localdomain>
In-Reply-To: <20230613182233.GC1139@sol.localdomain>
From: Amir Goldstein <amir73il@gmail.com>
Date: Wed, 14 Jun 2023 08:24:25 +0300
Message-ID: <CAOQ4uxhzJFpfuFLxK2s0JqS5qGQDGfndFPY7n2NDmZso4cG4Rg@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] ovl: Add framework for verity support
To: Eric Biggers <ebiggers@kernel.org>
Cc: Alexander Larsson <alexl@redhat.com>, miklos@szeredi.hu, linux-unionfs@vger.kernel.org, 
	tytso@mit.edu, fsverity@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 13, 2023 at 9:22=E2=80=AFPM Eric Biggers <ebiggers@kernel.org> =
wrote:
>
> On Tue, Jun 13, 2023 at 12:34:10PM +0300, Amir Goldstein wrote:
> > >
> > > In general the proposed documentation reads like the audience is over=
layfs
> > > developers.
> >
> > I never considered that overlayfs.rst is for an audience other than
> > overlayfs developers or people that want to become overlayfs
> > developers. It is not a user guide. If it were, it would have been a
> > very bad one.
> >
> > > It doesn't describe the motivation for the feature or how to use it
> > > in each of the two use cases.  Maybe that is intended, but it's not w=
hat I had
> > > expected to see.
> > >
> >
> > Yeh, that's a valid point.
> > That is what I wanted to know - what exactly is missing.
> > I guess this is the documented motivation:
>
> Sure, but even if the document is just for kernel developers, it should s=
till
> describe motivation and use cases, as those are important for userstandin=
g.
>
> > "This may then be used to verify the content of the source file at the =
time
> > the file is opened"
> >
> > but it does not tell a complete chain of trust story.
> >
> > How about something along the lines of:
> >
> > "In the case that the upper layer can be trusted not to be tampered
> > with while overlayfs is offline
>
> So *online* tampering of the upper layer is fine?

No, for the sake of this section, it would be easier to say
that upper is completely trusted and completely under our
control and that the feature only hardens overlayfs when
lower is not under our full control.

In the case of composefs it's actually two lower layers, one trusted
and one not trusted (and an optional trusted upper), but it does not
matter IMO for the sake of explaining the basic feature.

>
> > and some of the lower layers cannot
> > be trusted not to be tampered with, the "verity" feature can protect
> > against offline modification to lower files
>
> Data of lower files, not simply "lower files", right?

Right.

>
> Are *online* modifications to lower files indeed not in scope?

They are. doc should not mention online.

>
> If the feature "can protect", then under what circumstances does it prote=
ct, and
> under what circumstances what does it not protect?
>
> It would also be helpful to explain what specifically is meant by "protec=
t".
> Does it mean that overlayfs prevents modifications to lower file data, or=
 does
> it mean that overlayfs detects modifications to lower file data after the=
y
> happen?  If the latter, what happens when overlayfs detects a modificatio=
n?
> What do userspace programs experience?
>
> > , whose metadata has been
> > copied up to the upper layer (a.k.a "metacopy" files) ...."
> >
> > It's generic language that what the patches do, regardless of the
> > trust model of composefs and how it composes an overlayfs layers.
>
> It's better, but it could use some more detail.  See my comments above.
>

Fair enough.

Alex,

Please incorporate Eric's feedback above to come up with a more
detailed description than:

+This can be useful as a way to validate that a lower directory matches
+the correct upper when it is re-mounted later. In case you can
+guarantee that a overlayfs directory with verity xattrs is not
+tampered with (for example using dm-verity or fs-verity) this can even
+be used to guarantee the validity of an untrusted lower directory.
+

On the specific points that Eric mentioned.

Thanks,
Amir.
