Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81ED42D8763
	for <fsverity@lists.linux.dev>; Mon, 11 Aug 2025 19:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754939171; cv=none; b=UB+LC93noWZdViTSQvr5rQm7W3pFS6Pr3dLBqcbgL29sVUXM6/UdAPJ3P1VwJuWlnRyBGJ8QuMfK5eeXFYd4/Np1Kbg/78M8gtSTR+YgAoaknWdhbaIpRbHTPMTE3equ6E4lXD8kDgdV4O3VIncUkqzDKes7T0qS0NwhJyWsDKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754939171; c=relaxed/simple;
	bh=1Eh6AfaqADOLJGJXwjA9U3lQXOkdRiv6lgOQOZnuybo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=UiKcyGmoiA+ZYV2KYzIHftCuXuunYRkitV9dYuhII7EZLXMynxwax7bnQt7YR1VYIYtipagunuMVzxyMZiu+XSlfLRm9l1BxDjnyxTUeVpEwQxteIb2b8BI6By4A9dSuMU2RkL+kcRW9Gwt6P8Y3Lb1N/q6eIWiHinx0PNptzJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cIKgFAP0; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cIKgFAP0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754939168;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=j0jNbqiZoXF2tqZs49Auc8aumYER/PfldpxEEm7lIrE=;
	b=cIKgFAP0fTYuI56HzM+GNKCgToQTk3/tgwHhn6A3K03Bly34dtxoSgSBl58xTmmNWdbWGd
	JdNo9O0bu9Nkq0QzqY9SYbbHyrXjcn+iCo5ryh6MDwI3ycBJEKHQRATXh/W228EyjclRZm
	Bb6IImLmTGq17htkY9rQ3DXI/gxQf9o=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-137-n0V-ca7FM9Gqa5SP2XeVsg-1; Mon, 11 Aug 2025 15:06:05 -0400
X-MC-Unique: n0V-ca7FM9Gqa5SP2XeVsg-1
X-Mimecast-MFC-AGG-ID: n0V-ca7FM9Gqa5SP2XeVsg_1754939164
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3b7807a33faso2116988f8f.2
        for <fsverity@lists.linux.dev>; Mon, 11 Aug 2025 12:06:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754939164; x=1755543964;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j0jNbqiZoXF2tqZs49Auc8aumYER/PfldpxEEm7lIrE=;
        b=SO6IZEIJgrlwuK6b739LB+ezF+HO0EbwuJ7+SpEBWMUkgij2G2mwi40wN81di4Hms9
         Sn1O4eAC+1qqJSyTUNMWOoRn36BqQ7ORD2xx5Uucwdu7lWcOHZpgCN9MPe07Aqpu8QF0
         fQb9P8+I6wV8aEvTf7VOn4Qyb632wF8ldC0+rRSKkfeuGK8TF1vBOQcwnOuAOGqAlVWE
         T4m8KjyrHnGA7ijqY8DPnD1FYEd39TJrGSVvXmyrQQGX4JqvNiQaRrBOJimL0eIgoPX1
         LvSoOHXDNuBTMS6Pfija/V8bYx7s9hZYnadLY5AdGplc/HQKLCzfSb1eceBdywi/x5ZJ
         k/OA==
X-Forwarded-Encrypted: i=1; AJvYcCUsRTafsRNyoJthyKCd3Gdfz7kjwqUBc8UbLFiJh9OLTUhLmKInoTIBpC1BOPVeOWwVBu0U41cfhw==@lists.linux.dev
X-Gm-Message-State: AOJu0YywukuWw/0eaMhNq03mvgN72u0yOTwNDc9Ech7cPnkIUdYv84x7
	SxlBnO/LlPLLghRaiD47h9TOCZrMc9ZuCPtU5ywM5zXLLqVofDNXrorzdvgYa2j3WnAcEenCmIg
	9nvgKRdaF0DLRi1BmJaIKsZ6kqKQKTzDwU+wBPc6+DwAUOBFTg2GHGodOEz0=
X-Gm-Gg: ASbGnct4P5lITaeg9JSO0y6fPq/XLDBKUxNEg4PMB1OqRUe6GtMuocqDJA0tCVERw6t
	ykIs3vY4ZvUtNy+5mYqug1O/XEb4RETSEcki4q4o3ba/h9XnrpHalIodqjnOuRUJ48DB0yyFGEH
	XO+7oJ4uH3FNrvZjwFLRGwaChvEBrzgiL0eCapdDv4TIL5J7cZPu6OK2njIWfyU9MAhIrkuMKc4
	D0fBF9wjAnewQd7ybWp8wM2AJuJWYwzk6vm0LcR3vy1dluojCPHyzUk+GiRXK6wZIf0G2q8ZcXZ
	6ezxWdXguTUYr+WYjHEQQRcAinQ0eX4lWxJSHjzVTvbmyo8+uhxDwwKTbQY=
X-Received: by 2002:a05:6000:26cd:b0:3b7:6d94:a032 with SMTP id ffacd0b85a97d-3b910fdb7b4mr751818f8f.3.1754939163940;
        Mon, 11 Aug 2025 12:06:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHvt+eTJyu4t855O5qiCAOPraEsgDNT9X12Nh+utFT63/nKwS5zbJvlreALiUXMuzbjfYxWJA==
X-Received: by 2002:a05:6000:26cd:b0:3b7:6d94:a032 with SMTP id ffacd0b85a97d-3b910fdb7b4mr751800f8f.3.1754939163533;
        Mon, 11 Aug 2025 12:06:03 -0700 (PDT)
Received: from thinky (ip-217-030-074-039.aim-net.cz. [217.30.74.39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c3c51e2sm40405921f8f.32.2025.08.11.12.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 12:06:03 -0700 (PDT)
Date: Mon, 11 Aug 2025 21:06:02 +0200
From: Andrey Albershteyn <aalbersh@redhat.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, fsverity@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, linux-xfs@vger.kernel.org, david@fromorbit.com, 
	ebiggers@kernel.org
Subject: Re: [PATCH RFC 12/29] fsverity: expose merkle tree geometry to
 callers
Message-ID: <smswj23kbrrku7q4spkqyfudzynbyh6cgi5ro5vrmo2hin7q22@5ege2lpzd2wh>
References: <20250728-fsverity-v1-0-9e5443af0e34@kernel.org>
 <20250728-fsverity-v1-12-9e5443af0e34@kernel.org>
 <20250811114813.GC8969@lst.de>
 <20250811153822.GK7965@frogsfrogsfrogs>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20250811153822.GK7965@frogsfrogsfrogs>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: EMfB4db-d1GMiCvoSG5DPX32a1ngQivuZ34Ucau-rwg_1754939164
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2025-08-11 08:38:22, Darrick J. Wong wrote:
> On Mon, Aug 11, 2025 at 01:48:13PM +0200, Christoph Hellwig wrote:
> > On Mon, Jul 28, 2025 at 10:30:16PM +0200, Andrey Albershteyn wrote:
> > > From: "Darrick J. Wong" <djwong@kernel.org>
> > > 
> > > Create a function that will return selected information about the
> > > geometry of the merkle tree.  Online fsck for XFS will need this piece
> > > to perform basic checks of the merkle tree.
> > 
> > Just curious, why does xfs need this, but the existing file systems
> > don't?  That would be some good background information for the commit
> > message.
> 
> Hrmmm... the last time I sent this RFC, online fsck used it to check the
> validity of the merkle tree xattrs.
> 
> I think you could also use it to locate the merkle tree at the highest
> possible offset in the data fork, though IIRC Andrey decided to pin it
> at 1<<53.

I also use it in a few places to get tree_size which used to adjust
the read size (xfs_fsverity_adjust_read and
iomap_fsverity_tree_end_align).

> 
> (I think ext4 just opencodes the logic everywhere...)
> 
> > > +	if (!IS_VERITY(inode))
> > > +		return -ENODATA;
> > > +
> > > +	error = ensure_verity_info(inode);
> > > +	if (error)
> > > +		return error;
> > > +
> > > +	vi = inode->i_verity_info;
> > 
> > Wouldn't it be a better interface to return the verity_ino from
> > ensure_verity_info (NULL for !IS_VERITY, ERR_PTR for real error)
> > and then just look at the fields directly?
> 
> They're private to fsverity_private.h.
> 
> --D
> 

-- 
- Andrey

