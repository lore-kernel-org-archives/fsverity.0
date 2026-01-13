Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2772338E11D
	for <fsverity@lists.linux.dev>; Tue, 13 Jan 2026 11:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768303463; cv=none; b=Nkx/TvbU00Vc5fWhv+ee6jcvZxGNxI7Ky43wvVWSn5Gz7pTbp7ivg0GFdaJtRV40SAxzWOmr41HxaWTQAeVxRXwlsCMYs75zuK+w0pSskwqTWyQwcCfqt2pZaPi+4coF4yRZ9+oxby8WeATBB1PYirClQHNla8eLH6W4jdzFlk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768303463; c=relaxed/simple;
	bh=XgIYMzGgW0gHescGH608mwN1JydkPpadmv8jvJ6FIdg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=cYQaREAtgzT9SIwV0Bot6Q69pBATvkYIjoKdlfYLrxUoLMxYOnfQ+bs7981MNqLD+bBtfa7qmmkS9GmUtbhsVpTnYqT6rOYKKHF6rJefVe6q2Z6poMzMAAGdsMm6sgBqIH98SZWyafW+VwtI05M1/RRG5nCR7kf2PgLxJe2fviI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RCYTA6HG; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RCYTA6HG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768303461;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nRMkXI0DMI5p2B4y5x0zNltsIxM3cjoIg//7deRWL0Q=;
	b=RCYTA6HGIT+HolBnHwC9xDvFloF6Ga06tSPA+A75a12doitASZBP08liZP2sedS/49b7T4
	hs/HnpHwdQFqZBgR3YmE91YdLUcW6Khj6CvHiKOdCyIJ6haMIzI4mHh8ypzMj8TfME/JJf
	FCguJmBa0SYtyjzpRBGrxtBvSpQ+6b4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-47-af2sX3kNNFu8zoLZlUNQQA-1; Tue, 13 Jan 2026 06:24:20 -0500
X-MC-Unique: af2sX3kNNFu8zoLZlUNQQA-1
X-Mimecast-MFC-AGG-ID: af2sX3kNNFu8zoLZlUNQQA_1768303459
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-430fcf10280so5597712f8f.0
        for <fsverity@lists.linux.dev>; Tue, 13 Jan 2026 03:24:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768303459; x=1768908259;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nRMkXI0DMI5p2B4y5x0zNltsIxM3cjoIg//7deRWL0Q=;
        b=KESPUqncJNlY9B7ramCxJtgYmiasii/w5P0Ds5fDtmqC8Tdf/VjkBA3zMufX3RNPas
         EiBJ5izTw+XwU8MyrEJPep7obYcuvlPDQxnnaVc2Fc8fnqr6Q4h0Dz2rXwxBpFuYV2kK
         sK4mXFnPkrWVmGm/sUfcv+et4E/AGdbGjPeIlbgjjHICoyLshgUdrggMrmNqq9WHxflO
         xaSgJFAKLvqjK7/YaDBi9lGjg1cSpL13HhbkEHNpXgVjjvcRqEH02HrYzmVkjK+ArSNV
         mPlpd6TB2IkJx3Co36iBPqjBGHQ+124/J87Q+vSEkVCDNjjRh/J7GxZXW3YCYtwOnTA2
         z3xw==
X-Gm-Message-State: AOJu0YzX6uM5xf5JjVhfvZquUzPo20v2OXFMiwC79J30hXZ5RLavcCxy
	SmlkNGHkpp+EIONEgJ10WdQRMEsiEyVQvKTVYtBt9z6+a1XD+0C/vkIhXQ6aDFU6M+eZCexhjsK
	iTkBTzwEyzySbMt3/BiMaawUwvSpBxmn7P1822zo8YF2tNLySGkEfdI8qEAQ=
X-Gm-Gg: AY/fxX7HV0XRmMFMHt8xjI+dTvusMN0Kg6Qc52BJWiFRL704HWD1Q3fULVcpPdilYjs
	34x5qJw3IXCV5JqxuQ874pqki3cbeQWgkIw6eZ/JEuwisYfzh6leyRXmFv5/tk/idNkuVyZa03R
	W/praytA4D1eZVgOy2Ln4TS2tB0ZgJQUIXCzzkPt68rcMA17O5SMoG5T8jVqxsuLNeNq44Sv+LD
	ZzmdbSxaCXggjWW5qzofTcYpccWhLIY5Zt+pFNTXhlqQJ3H7z3JES0ADL6O4ATxOMSCB+oAoSsf
	WbSTiI5RqqkNJVp88+2HDnJk9Uk9DDQgG4whU1EsmXxOdZST/CXCpPOdmQBgsuEHfN18v2+EalQ
	=
X-Received: by 2002:a05:6000:3106:b0:432:c0b8:ee58 with SMTP id ffacd0b85a97d-432c3617c2cmr21757754f8f.0.1768303458660;
        Tue, 13 Jan 2026 03:24:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGrM747jJuZXqfgIkrgmr5TDL+50UKoPdv4m4RQQMEuwrd6aGEzUqe3Sgbk9CxIB87OJxTBug==
X-Received: by 2002:a05:6000:3106:b0:432:c0b8:ee58 with SMTP id ffacd0b85a97d-432c3617c2cmr21757724f8f.0.1768303458178;
        Tue, 13 Jan 2026 03:24:18 -0800 (PST)
Received: from thinky ([217.30.74.39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0e199bsm43351636f8f.16.2026.01.13.03.24.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 03:24:17 -0800 (PST)
Date: Tue, 13 Jan 2026 12:24:17 +0100
From: Andrey Albershteyn <aalbersh@redhat.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: fsverity@lists.linux.dev, linux-xfs@vger.kernel.org, 
	ebiggers@kernel.org, linux-fsdevel@vger.kernel.org, aalbersh@kernel.org, 
	david@fromorbit.com, hch@lst.de
Subject: Re: [PATCH v2 12/22] xfs: introduce XFS_FSVERITY_CONSTRUCTION inode
 flag
Message-ID: <64sjr2cxebvpupkhqi7hjcu4uy5xv6x5xxucrskh4dn4b5g2jk@kryfgma557js>
References: <cover.1768229271.patch-series@thinky>
 <bfcg5hug75qtvc2psw5yymfoudnz2uda3gg5dfzgnze46hwt6n@u67n3rdzzuo4>
 <20260112224213.GN15551@frogsfrogsfrogs>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260112224213.GN15551@frogsfrogsfrogs>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: q76Q2bVDr_Dp_n8tXEJJUEtaDOcsykUyLQp8RZYJBSk_1768303459
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2026-01-12 14:42:13, Darrick J. Wong wrote:
> On Mon, Jan 12, 2026 at 03:51:16PM +0100, Andrey Albershteyn wrote:
> > Add new flag meaning that merkle tree is being build on the inode.
> > 
> > Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org>
> 
> Seems fine to me, with one nit below
> Reviewed-by: "Darrick J. Wong" <djwong@kernel.org>

Thanks!

> 
> --D
> 
> > ---
> >  fs/xfs/xfs_inode.h | 6 ++++++
> >  1 file changed, 6 insertions(+), 0 deletions(-)
> > 
> > diff --git a/fs/xfs/xfs_inode.h b/fs/xfs/xfs_inode.h
> > index f149cb1eb5..9373bf146a 100644
> > --- a/fs/xfs/xfs_inode.h
> > +++ b/fs/xfs/xfs_inode.h
> > @@ -420,6 +420,12 @@
> >   */
> >  #define XFS_IREMAPPING		(1U << 15)
> >  
> > +/*
> > + * fs-verity's Merkle tree is under construction. The file is read-only, the
> > + * only writes happening is the ones with Merkle tree blocks.
> 
> "..the only writes happening are for the fsverity metadata."
> 
> since fsverity could in theory someday write more than just a merkle
> tree and a descriptor.

changed

-- 
- Andrey

