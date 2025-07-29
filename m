Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E7819E971
	for <fsverity@lists.linux.dev>; Tue, 29 Jul 2025 10:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753785361; cv=none; b=uiv7jJLzk4R6UZ9GWInEqEhv4xfuy8UmTBK9vl8wwchJ2oUklHRN4ww52OGPXkBcNgakO4EcxBvqSKi4qsHB5G+5fcTPExjPHlUDvK3A9SJ/W1K24zhIhLOR8OMJFwZX8eVy9vxBL0xRCe4jP6AAyqi77zmwGDMMsFe2sHMOAEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753785361; c=relaxed/simple;
	bh=HO5d2wAJgWq6Tl4cr7avtyFxxM9YP0MhCx3yLUH1H/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=FuMQZgQw5EcNkgkpuSik7O6CDh9IsbFSw+2OlUxW+VcXJFhp5NC9P4fMvaiB442KWUZM4d090b15feCOnv6c/yYN6+WBD0YNBejeRH3hgoYeOr51/ZHruLRMQb7xiU7P+FU/VCVx86NYcsddsTchCz0rdoTzIvLQy5BCtB9f754=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gHbvAT1f; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gHbvAT1f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753785356;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nTPMGB6z2nyOCHdJ7CbXMpiw/sTsf8ojO933mhQUepA=;
	b=gHbvAT1fLIXC712nz6WiznW9684rnuMlwh9rvWGhHseU0dIij926lFBvydBcdLl+kSJuDn
	ufopNWeW+82p1QcpwCX6hTyqZCt7yQgMNFZuz0nInlGO7gv4jPBWp0inoYMfVKaW1G3q6N
	FcmPaCVh6u8rCTVLdxQzX263gsvIy6E=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-622-kfFzYiHKNU6YzEi6hVBrJw-1; Tue, 29 Jul 2025 06:35:55 -0400
X-MC-Unique: kfFzYiHKNU6YzEi6hVBrJw-1
X-Mimecast-MFC-AGG-ID: kfFzYiHKNU6YzEi6hVBrJw_1753785354
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-aef68ca533aso503094766b.2
        for <fsverity@lists.linux.dev>; Tue, 29 Jul 2025 03:35:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753785354; x=1754390154;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nTPMGB6z2nyOCHdJ7CbXMpiw/sTsf8ojO933mhQUepA=;
        b=j9n05LVcBbnPYJtlEotfUGP7IQYmtlAK2P/HqngU9uh5kpTGx5xHw2oDE2WAGMCRLA
         Qq881pY8zIwhk79mQtzkSo8tCJazob/4PiCTgMrFMkwnwCCq28gbc6FvwmFoF/h80R3X
         OjJggcHEAEfBUCqenJ/730U7rmo3ew1P4xzi9qHP2wXFvoq0XXyW8udOa1AiZU2i4IOt
         4mc/zqqjWcUrsqjcA+b3vIc4FWABGK4/eQQ7pu58XSAZNv8Ij2zNhoFwwdkygi0ANQFl
         U4oP6wZVfoBxRhHXhKjB/p3zrh86KTXzBf5/PNyouYH6xUru/kdOl9tYFFB0t+AXQOe9
         0vaw==
X-Forwarded-Encrypted: i=1; AJvYcCXjkn0wLL7dvNMbDBVXGdGD3P5152n/2a/t8l7NqaixVwRW811L/KEjQ+Zr+tRovfwRcoavizWRnA==@lists.linux.dev
X-Gm-Message-State: AOJu0YygSdiOYVpCictP6ch40Y1171s7gVsN3uWdboeH7iww0akCgQCf
	Sj0rFgBd08IPMbHj3+U41PNFvdxtAhZK0U1iC0LPyJ8xXP4DBqYPQVPUkdLY9xw5OZdeQcF4MoV
	RXg1MWN0kTlmZs2vU9WC3oVaNSaZONOy4NanvjgRPW9QcMiOuFhWIhrtAmLY=
X-Gm-Gg: ASbGncsG9SdvYB3tMQnX/8qoB38cIxff5e0llNNFDMDlHQJfBGDA1+PzL38efYVBLL6
	BbgSuxxD4DOL1q8L8bOKytCBxN/3I519246iRu1E0RhJF/6OAlkwtAainCmW+iB0orUsoUiL+UZ
	rS0quuM6GhqxKoADZRhOIolRHDGjPNTwXSMSfsHQPbKTpjS95OCe5YrBjnYe9IN0qJ3ffsOAciW
	mA0JcF5ulwAm1Rm6VAEFcRKg065xn8qGIpJD2AVppydzpYUX2OrvH7i4Rc6tQae8oHq5kRASgmg
	ILLbm4TO7CysW/2VDZjip7F32Sq4ZdiRzDwtogZFp4rW4HvKFtisCB813Uw=
X-Received: by 2002:a17:907:7f0b:b0:ae0:a483:39bc with SMTP id a640c23a62f3a-af61960265emr1623452666b.46.1753785353616;
        Tue, 29 Jul 2025 03:35:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFrTT+nSEpY2hTKBRWCIHp8//T157MzOq0SO4kMFDOhKTEbq9mH172vvX2jSKOC7gjPBDNa1Q==
X-Received: by 2002:a17:907:7f0b:b0:ae0:a483:39bc with SMTP id a640c23a62f3a-af61960265emr1623449166b.46.1753785353121;
        Tue, 29 Jul 2025 03:35:53 -0700 (PDT)
Received: from thinky (ip-217-030-074-039.aim-net.cz. [217.30.74.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af635860003sm571051066b.10.2025.07.29.03.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jul 2025 03:35:52 -0700 (PDT)
Date: Tue, 29 Jul 2025 12:35:51 +0200
From: Andrey Albershteyn <aalbersh@redhat.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: Christian Brauner <brauner@kernel.org>, fsverity@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, linux-xfs@vger.kernel.org, david@fromorbit.com, 
	djwong@kernel.org, ebiggers@kernel.org, hch@lst.de, 
	Andrey Albershteyn <aalbersh@kernel.org>
Subject: Re: [PATCH RFC 03/29] fs: add FS_XFLAG_VERITY for verity files
Message-ID: <ppcw73dlw4qdumbmel4spy2uvlaocnqfowquiop4mhauw3xxc4@kjad3vbucx7v>
References: <20250728-fsverity-v1-0-9e5443af0e34@kernel.org>
 <20250728-fsverity-v1-3-9e5443af0e34@kernel.org>
 <CAOQ4uxjXucbQderHmkd7Dw9---U4hA7PjdgA7M7r5BZ+kXbKiQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAOQ4uxjXucbQderHmkd7Dw9---U4hA7PjdgA7M7r5BZ+kXbKiQ@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: VOjAM_MLm2jNpZKqVmxRNhhLlVhzrcEg7yGtChcoO7E_1753785354
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On 2025-07-29 11:53:09, Amir Goldstein wrote:
> On Mon, Jul 28, 2025 at 10:31 PM Andrey Albershteyn <aalbersh@redhat.com> wrote:
> >
> > From: Andrey Albershteyn <aalbersh@redhat.com>
> >
> > Add extended attribute FS_XFLAG_VERITY for inodes with fs-verity
> > enabled.
> 
> Oh man! Please don't refer to this as an "extended attribute".
> 
> I was quite surprised to see actually how many times the term
> "extended attribute" was used in commit messages in your series
> that Linus just merged including 4 such references in the Kernel-doc
> comments of security_inode_file_[sg]etattr(). :-/

You can comment on this, I'm fine with fixing these, I definitely
don't have all the context to know the best suitable terms.

> 
> The terminology used in Documentation/filesystem/vfs.rst and fileattr.h
> are some permutations of "miscellaneous file flags and attributes".
> Not perfect, but less confusing than "extended attributes", which are
> famously known as something else.

Yeah sorry, it's very difficult to find out what is named how and
what is outdated.

I will update commit messages to "file flags".

> 
> >
> > Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
> > [djwong: fix broken verity flag checks]
> > Reviewed-by: Darrick J. Wong <djwong@kernel.org>
> > Signed-off-by: Darrick J. Wong <djwong@kernel.org>
> > Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org>
> > ---
> >  Documentation/filesystems/fsverity.rst |  8 ++++++++
> >  fs/ioctl.c                             | 11 +++++++++++
> >  include/uapi/linux/fs.h                |  1 +
> >  3 files changed, 20 insertions(+)
> >
> > diff --git a/Documentation/filesystems/fsverity.rst b/Documentation/filesystems/fsverity.rst
> > index dacdbc1149e6..33b588c32ed1 100644
> > --- a/Documentation/filesystems/fsverity.rst
> > +++ b/Documentation/filesystems/fsverity.rst
> > @@ -342,6 +342,14 @@ the file has fs-verity enabled.  This can perform better than
> >  FS_IOC_GETFLAGS and FS_IOC_MEASURE_VERITY because it doesn't require
> >  opening the file, and opening verity files can be expensive.
> >
> > +FS_IOC_FSGETXATTR
> > +-----------------
> > +
> > +Since Linux v6.17, the FS_IOC_FSGETXATTR ioctl sets FS_XFLAG_VERITY (0x00020000)
> > +in the returned flags when the file has verity enabled. Note that this attribute
> > +cannot be set with FS_IOC_FSSETXATTR as enabling verity requires input
> > +parameters. See FS_IOC_ENABLE_VERITY.
> > +
> >  .. _accessing_verity_files:
> >
> >  Accessing verity files
> > diff --git a/fs/ioctl.c b/fs/ioctl.c
> > index 69107a245b4c..6b94da2b93f5 100644
> > --- a/fs/ioctl.c
> > +++ b/fs/ioctl.c
> > @@ -480,6 +480,8 @@ void fileattr_fill_xflags(struct fileattr *fa, u32 xflags)
> >                 fa->flags |= FS_DAX_FL;
> >         if (fa->fsx_xflags & FS_XFLAG_PROJINHERIT)
> >                 fa->flags |= FS_PROJINHERIT_FL;
> > +       if (fa->fsx_xflags & FS_XFLAG_VERITY)
> > +               fa->flags |= FS_VERITY_FL;
> >  }
> >  EXPORT_SYMBOL(fileattr_fill_xflags);
> >
> > @@ -510,6 +512,8 @@ void fileattr_fill_flags(struct fileattr *fa, u32 flags)
> >                 fa->fsx_xflags |= FS_XFLAG_DAX;
> >         if (fa->flags & FS_PROJINHERIT_FL)
> >                 fa->fsx_xflags |= FS_XFLAG_PROJINHERIT;
> > +       if (fa->flags & FS_VERITY_FL)
> > +               fa->fsx_xflags |= FS_XFLAG_VERITY;
> >  }
> >  EXPORT_SYMBOL(fileattr_fill_flags);
> >
> 
> I think you should add it to FS_COMMON_FL/FS_XFLAG_COMMON?
> 
> And I guess also to FS_XFLAGS_MASK/FS_XFLAG_RDONLY_MASK
> after rebasing to master.
> 
> > @@ -640,6 +644,13 @@ static int fileattr_set_prepare(struct inode *inode,
> >             !(S_ISREG(inode->i_mode) || S_ISDIR(inode->i_mode)))
> >                 return -EINVAL;
> >
> > +       /*
> > +        * Verity cannot be changed through FS_IOC_FSSETXATTR/FS_IOC_SETFLAGS.
> > +        * See FS_IOC_ENABLE_VERITY.
> > +        */
> > +       if ((fa->fsx_xflags ^ old_ma->fsx_xflags) & FS_XFLAG_VERITY)
> > +               return -EINVAL;
> > +
> 
> I think that after rebase, if you add the flag to FS_XFLAG_RDONLY_MASK
> This check will fail, so can either remove this check and ignore user trying to
> set FS_XFLAG_VERITY, same as if user was trying to set FS_XFLAG_HASATTR.
> or, as I think Darrick may have suggested during review, we remove the masking
> of FS_XFLAG_RDONLY_MASK in the fill helpers and we make this check more
> generic here:
> 
> +       if ((fa->fsx_xflags ^ old_ma->fsx_xflags) & FS_XFLAG_RDONLY_MASK)
> +               return -EINVAL;

Sure, will look into that in the next revision, I haven't used the
latest master, so this wasn't updated

> 
> Thanks,
> Amir.
> 

-- 
- Andrey

