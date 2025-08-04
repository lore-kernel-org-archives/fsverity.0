Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A576820F067
	for <fsverity@lists.linux.dev>; Mon,  4 Aug 2025 11:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754307289; cv=none; b=WOR4DDp+I3PxZh9o40B21lsgTsA2OzETvsFfxheucak21Bofy2xoFHl19CCZqYGVfQU0PIZ/ulisahZmNXXygxWC6n2J3EvYh2EsbhK7yGHHXn71vxLNlP1LuuAXy7IjT1SF8JFbPJtIS4CdT6RIleKlBLlhbXi+0Y57V0fHV94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754307289; c=relaxed/simple;
	bh=ulhD4ZkuDAK3k2qDQl0X7/UyqpKU+NyG3I0TjP00sss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=IObvYS7JsFD7jJ5nxrEnbEZu5w9JJ0Hx1SJYTfLHy8mwHiJozZdcaNnVKAiV1DTZZjdYLObQK5sbeRJzo0HA0hHCVhkNrcTbj1twYqWn9GLt9xoJhoq7EOe66XRIE4jcXy/lILvdoAOr0hyFwM67mCgIfBbHSmbEIiLFDlPDe64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WJsKnsNU; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WJsKnsNU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754307286;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3V1T20G7TfHh7dK0HImr9yuZ74iE23wyw4ljPa6v4iQ=;
	b=WJsKnsNUcPz6UO4TkAB21UigK36qjuEAwtEXhEJxgQxrvIvqXvlnUPp0KyLZj2uKlMTtOu
	4Dj4Jg5GbE106gQTgNa88ZfaE0pMXnMPdOlSWipAJSktT4CZHhlSiujqHoTEMlKkYjHLhA
	kMqy4Lg7dPEj7SeQBfR5yFn7Do+tXfI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-569-qVF6SOV0ODmkOmDN89BFCw-1; Mon, 04 Aug 2025 07:34:45 -0400
X-MC-Unique: qVF6SOV0ODmkOmDN89BFCw-1
X-Mimecast-MFC-AGG-ID: qVF6SOV0ODmkOmDN89BFCw_1754307284
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3b7851a096fso2232512f8f.1
        for <fsverity@lists.linux.dev>; Mon, 04 Aug 2025 04:34:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754307284; x=1754912084;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3V1T20G7TfHh7dK0HImr9yuZ74iE23wyw4ljPa6v4iQ=;
        b=Jh4hBEVuobu08Mu0f+Vc5Jfs38nDu/x0KH01iy8D25xJ5nJTz4joKaey3i846+57Xo
         zShz+bx9AGTnM+8qClX6vFO1Wlw34k/i7H2BLjNsh63aSbl2zvzaIfzBDqt1+6ngIcIj
         OBLXDkqvMh+1JrwTaPijhOx3pt6NoTLZiYyPc3zsUSzI+yBPGj/BPn8i+gJxn93WKaSL
         H9fWrcmKgEYQjRXRpjt02EKLCBiQiPudDMTFIxp4kCgC1F7FtyqgC5YaFjPXL8ZgEVr7
         lU3ZbhkLQe1swAUD2Xf6ik6vKzBfKAIOxOUsuwR/KSXSp4wpbMsibAnek24PWSL0R/wS
         szSg==
X-Gm-Message-State: AOJu0Yx7hFLYNP2w34cgVu+LMMWgTPv0rFd/d/IZZ/eVL8vnGipVEuvm
	hf5ELiMxWU43+UjBSjWPhquUggPJrPafu/oxkZJy9GOX55KeRpX/bkwEbemFYmz3m0JnH15VAQd
	cTXFZ+BkObRTv3qorxD2XZLDUywXKT1QSPiUl7/oIutMy9ce+Rrgxs74GC7o=
X-Gm-Gg: ASbGnct7GbTKcAx4TjFY9r7GgYfk8CrcL6MO32k9MgMJTjQz6N9GU18jCRVFKfgOCVP
	DuiQbzfCPvfCZrAi5kQYZhzZTbZE4PsoUKWDlSqxNRQCCjSyotZXNMSrksbAh1Vf5UwsjgrLNx8
	5Cmw8yMz/ODLHuvDbmCAh1oUsGMVP9mDr+Zw8UnGKdUAW7W3N34bc7K4PHBwzQgFaTtdk4EI1D3
	hg+fVFa89aDD+hG/WXRMCqcAT9t/WSnquxFZvUvdqRTR3DS8FV7OZk/CNS5fEeFYhcfwNCXCqpx
	Pih37nAlX4GOC0Yb/eOk28k04v4mpLYecKSuPFP5r92VUQcEW5xeyV/SiOw=
X-Received: by 2002:a05:6000:4308:b0:3b7:9af4:9c75 with SMTP id ffacd0b85a97d-3b8d94b5f5cmr5721835f8f.30.1754307283915;
        Mon, 04 Aug 2025 04:34:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IECSNlAqX2SbDaV4025aA/QtAgxGcECmwvMzo9vl9cLxYwe+gfIm+JQX3+RGKTbSCjXQi1ysQ==
X-Received: by 2002:a05:6000:4308:b0:3b7:9af4:9c75 with SMTP id ffacd0b85a97d-3b8d94b5f5cmr5721809f8f.30.1754307283439;
        Mon, 04 Aug 2025 04:34:43 -0700 (PDT)
Received: from thinky (ip-217-030-074-039.aim-net.cz. [217.30.74.39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c3ad803sm15173444f8f.6.2025.08.04.04.34.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 04:34:43 -0700 (PDT)
Date: Mon, 4 Aug 2025 13:34:41 +0200
From: Andrey Albershteyn <aalbersh@redhat.com>
To: Joanne Koong <joannelkoong@gmail.com>
Cc: fsverity@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
	linux-xfs@vger.kernel.org, david@fromorbit.com, djwong@kernel.org, ebiggers@kernel.org, 
	hch@lst.de, Andrey Albershteyn <aalbersh@kernel.org>
Subject: Re: [PATCH RFC 01/29] iomap: add iomap_writepages_unbound() to write
 beyond EOF
Message-ID: <nusz22lytklhy2qlc6ihpp3onpwckbvpo5lohmcsfyjbgnprqm@mi6u5fleplah>
References: <20250728-fsverity-v1-0-9e5443af0e34@kernel.org>
 <20250728-fsverity-v1-1-9e5443af0e34@kernel.org>
 <CAJnrk1ambrfq-bMdTSgj=pPrGW6GA1Jgwjvx8=sy8SVR67=bJA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAJnrk1ambrfq-bMdTSgj=pPrGW6GA1Jgwjvx8=sy8SVR67=bJA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: PIjMvAKajx65kSJhE5Ts3kp3YK9ZoUAxsJIRukklRtI_1754307284
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On 2025-07-31 11:43:52, Joanne Koong wrote:
> On Mon, Jul 28, 2025 at 1:31 PM Andrey Albershteyn <aalbersh@redhat.com> wrote:
> >
> > From: Andrey Albershteyn <aalbersh@redhat.com>
> >
> > Add iomap_writepages_unbound() without limit in form of EOF. XFS
> > will use this to write metadata (fs-verity Merkle tree) in range far
> > beyond EOF.
> >
> > Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org>
> > ---
> >  fs/iomap/buffered-io.c | 51 +++++++++++++++++++++++++++++++++++++++-----------
> >  include/linux/iomap.h  |  3 +++
> >  2 files changed, 43 insertions(+), 11 deletions(-)
> >
> > diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
> > index 3729391a18f3..7bef232254a3 100644
> > --- a/fs/iomap/buffered-io.c
> > +++ b/fs/iomap/buffered-io.c
> > @@ -1881,18 +1881,10 @@ static int iomap_writepage_map(struct iomap_writepage_ctx *wpc,
> >         int error = 0;
> >         u32 rlen;
> >
> > -       WARN_ON_ONCE(!folio_test_locked(folio));
> > -       WARN_ON_ONCE(folio_test_dirty(folio));
> > -       WARN_ON_ONCE(folio_test_writeback(folio));
> > -
> > -       trace_iomap_writepage(inode, pos, folio_size(folio));
> > -
> > -       if (!iomap_writepage_handle_eof(folio, inode, &end_pos)) {
> > -               folio_unlock(folio);
> > -               return 0;
> > -       }
> >         WARN_ON_ONCE(end_pos <= pos);
> >
> > +       trace_iomap_writepage(inode, pos, folio_size(folio));
> > +
> >         if (i_blocks_per_folio(inode, folio) > 1) {
> >                 if (!ifs) {
> >                         ifs = ifs_alloc(inode, folio, 0);
> > @@ -1956,6 +1948,23 @@ static int iomap_writepage_map(struct iomap_writepage_ctx *wpc,
> >         return error;
> >  }
> >
> > +/* Map pages bound by EOF */
> > +static int iomap_writepage_map_eof(struct iomap_writepage_ctx *wpc,
> > +               struct writeback_control *wbc, struct folio *folio)
> > +{
> > +       int error;
> > +       struct inode *inode = folio->mapping->host;
> > +       u64 end_pos = folio_pos(folio) + folio_size(folio);
> > +
> > +       if (!iomap_writepage_handle_eof(folio, inode, &end_pos)) {
> > +               folio_unlock(folio);
> > +               return 0;
> > +       }
> > +
> > +       error = iomap_writepage_map(wpc, wbc, folio);
> > +       return error;
> > +}
> > +
> >  int
> >  iomap_writepages(struct address_space *mapping, struct writeback_control *wbc,
> >                 struct iomap_writepage_ctx *wpc,
> > @@ -1972,9 +1981,29 @@ iomap_writepages(struct address_space *mapping, struct writeback_control *wbc,
> >                         PF_MEMALLOC))
> >                 return -EIO;
> >
> > +       wpc->ops = ops;
> > +       while ((folio = writeback_iter(mapping, wbc, folio, &error))) {
> > +               WARN_ON_ONCE(!folio_test_locked(folio));
> > +               WARN_ON_ONCE(folio_test_dirty(folio));
> > +               WARN_ON_ONCE(folio_test_writeback(folio));
> > +
> > +               error = iomap_writepage_map_eof(wpc, wbc, folio);
> > +       }
> > +       return iomap_submit_ioend(wpc, error);
> > +}
> > +EXPORT_SYMBOL_GPL(iomap_writepages);
> > +
> > +int
> > +iomap_writepages_unbound(struct address_space *mapping, struct writeback_control *wbc,
> > +               struct iomap_writepage_ctx *wpc,
> > +               const struct iomap_writeback_ops *ops)
> > +{
> > +       struct folio *folio = NULL;
> > +       int error;
> > +
> >         wpc->ops = ops;
> >         while ((folio = writeback_iter(mapping, wbc, folio, &error)))
> >                 error = iomap_writepage_map(wpc, wbc, folio);
> >         return iomap_submit_ioend(wpc, error);
> >  }
> > -EXPORT_SYMBOL_GPL(iomap_writepages);
> > +EXPORT_SYMBOL_GPL(iomap_writepages_unbound);
> > diff --git a/include/linux/iomap.h b/include/linux/iomap.h
> > index 522644d62f30..4a0b5ebb79e9 100644
> > --- a/include/linux/iomap.h
> > +++ b/include/linux/iomap.h
> > @@ -464,6 +464,9 @@ void iomap_sort_ioends(struct list_head *ioend_list);
> >  int iomap_writepages(struct address_space *mapping,
> >                 struct writeback_control *wbc, struct iomap_writepage_ctx *wpc,
> >                 const struct iomap_writeback_ops *ops);
> > +int iomap_writepages_unbound(struct address_space *mapping,
> > +               struct writeback_control *wbc, struct iomap_writepage_ctx *wpc,
> > +               const struct iomap_writeback_ops *ops);
> >
> 
> Just curious, instead of having a new api for
> iomap_writepages_unbound, does adding a bitfield for unbound to the
> iomap_writepage_ctx struct suffice? afaict, the logic between the two
> paths is identical except for the iomap_writepage_handle_eof() call
> and some WARN_ONs - if that gets gated behind the bitfield check, then
> it seems like it does the same thing logically but imo is more
> straightforward to follow the code flow of. But maybe I"m missing some
> reason why this wouldn't work?

Yeah, that's another option. If others also prefer flag then I can
change it.

-- 
- Andrey

