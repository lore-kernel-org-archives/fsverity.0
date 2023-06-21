Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D63E2C147
	for <fsverity@lists.linux.dev>; Wed, 21 Jun 2023 11:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687346838;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xc1C5dGE3E84jHIb6pWdRSRyKplzGTrNuAMSPXu3ZBM=;
	b=YD036z1EE14kEpDm1gQXJqcbTTchbURZJ0bVki/Fs/esCCSzFIJOOIhqhCD2KrcIGulwKY
	B5QP4YaVu6t6VCMeNwaTOuUuV2tt5Xk2nPKY7mSfB7seBO1jUEN6hfL/0iGUO0YldRnoug
	by75CJ9heE18U4vAnHlViW06iQjGfpQ=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-451-q8t4bC95NAGW4Re5cex9kw-1; Wed, 21 Jun 2023 07:27:17 -0400
X-MC-Unique: q8t4bC95NAGW4Re5cex9kw-1
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3426ee45975so26731745ab.0
        for <fsverity@lists.linux.dev>; Wed, 21 Jun 2023 04:27:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687346836; x=1689938836;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xc1C5dGE3E84jHIb6pWdRSRyKplzGTrNuAMSPXu3ZBM=;
        b=HzQJXl/gK7qcpXnXIEuaDOkaSVloS1a39qLsuIiYiG/OLWhKkAjpWEEttDFaWpIuCt
         NjSmq/Dv3yISupcCOqp4WTXMmjf7xDIB5//wqjmMadYJo4Q28bRYjGE1ygzei5sGaky4
         kfgNxqNOZxnoigf6E6Czi+zEVn9tLJMc0NRPVRzgBTdTkvjAJf59++RFHGUV83MSBiX/
         8VJxlHjt7K9IwFHcQlpj5+quLKMspm9tDSD+sfiL6UCu+yghRD+CLhMojvaglKPH1dIV
         DfFmeo+bejUT8TNk6ROpyAY2PBCoO+n1QI3a8iCbGB24mAdICscjNhMbhfY06P1pLEdL
         HWmg==
X-Gm-Message-State: AC+VfDxdzKdaDeq+rL9Pliw433I0BinEGmvuJLBP7FtP7dQRX233oXKb
	WKUMjS8T8xk6gfvMEfh5dcI8+nB3sB4y7ssoeRiSnrgWa7pwyMkUAIYIRza6CFiUR2wDM3j0vTZ
	vkjFQhlQU5GHGCJeCQ6cucLqrIcj7BDr1OJA=
X-Received: by 2002:a92:c943:0:b0:33f:bb6b:ed37 with SMTP id i3-20020a92c943000000b0033fbb6bed37mr5664442ilq.24.1687346836346;
        Wed, 21 Jun 2023 04:27:16 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6olE2HOhfBMxA6lDGHpd0vaEklGhfzomfGEsb3oTgsFsUJQBqcO4MUPw1RU/gUkd6HN15C8LmGbrLr0g6uGTk=
X-Received: by 2002:a92:c943:0:b0:33f:bb6b:ed37 with SMTP id
 i3-20020a92c943000000b0033fbb6bed37mr5664433ilq.24.1687346836131; Wed, 21 Jun
 2023 04:27:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1687255035.git.alexl@redhat.com> <20230620161507.GA864@sol.localdomain>
In-Reply-To: <20230620161507.GA864@sol.localdomain>
From: Alexander Larsson <alexl@redhat.com>
Date: Wed, 21 Jun 2023 11:27:05 +0000
Message-ID: <CAL7ro1GEObg78=LE2h7H2x0TnsuqGTmt2xvuT3grROWNPzr46w@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] ovl: Add support for fs-verity checking of lowerdata
To: Eric Biggers <ebiggers@kernel.org>
Cc: miklos@szeredi.hu, linux-unionfs@vger.kernel.org, amir73il@gmail.com, 
	tytso@mit.edu, fsverity@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 20, 2023 at 6:15=E2=80=AFPM Eric Biggers <ebiggers@kernel.org> =
wrote:
>
> On Tue, Jun 20, 2023 at 12:15:15PM +0200, Alexander Larsson wrote:
> > This series depends on the commit
> >   fsverity: rework fsverity_get_digest() again
> > Which is in the "for-next" branch of
> >   https://git.kernel.org/pub/scm/fs/fsverity/linux.git/
> >
> > This series, plus the above commit are also in git here:
> >   https://github.com/alexlarsson/linux/tree/overlay-verity
> >
> > I would love to see this go into 6.5. So Eric, could you maybe Ack the
> > implementation patches separately from the documentation patches? Then
> > maybe we can get this in early, and I promise to try to get the
> > documentation up to standard during the 6.5 cycle as needed.
>
> I think it's gotten too late for 6.5.  If there is no 6.4-rc8, then the 6=
.5
> merge window will open just 5 days from now.  This series has recently go=
ne
> through some significant changes, including in the version just sent out =
today
> which I haven't had a chance to review yet.
>
> Please don't try to rush things in when they involve UAPI and on-disk for=
mat
> changes, which will have to be supported forever.  We need to take the ti=
me to
> get them right.
>
> I also see that the overlayfs tree is already very busy in 6.5, with the =
support
> for data-only lower layers, lazy lookup of lowerdata, and the new mount A=
PI.
>
> I think 6.6 would be a more realistic target.  That would give time to wr=
ite
> proper documentation as well, which is super important.  (Very often whil=
e
> writing documentation, I realize that I should do something differently i=
n the
> code.  Please don't think of documentation as something can be done "late=
r".)

If 6.6 is what ends up happening I'm not gonna protest, it's not a
huge issue for me, only mildly inconvenient. But, for now I'll at
least keep targeting 6.5, and then we will have to see how it works
out wrt reviews and what Miklos decides.

I pushed out a v5 series today too, because the v4 series conflicted
with some other changes in vfs.all that are staged for 6.5. v5 is also
a bit simplified based on Amirs feedback, has some documentation
updates and is refactored into more commits for easier review.

--=20
=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D
 Alexander Larsson                                Red Hat, Inc
       alexl@redhat.com         alexander.larsson@gmail.com

