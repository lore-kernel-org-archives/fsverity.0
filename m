Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7654F33B95B
	for <fsverity@lists.linux.dev>; Mon, 23 Feb 2026 18:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771870340; cv=none; b=Z1aXQLpZAw0qOONor1RV5Uuivibs/CG9nbuDW+U2s0laXpjH4dSq57Zo7wyBXl5Wguk4xWQ0KLjYNU8cZu6gEgcY2iXPtRyLDuSShiefOgQMdKkRuysbsl6BPshzXgbBnUQqK3Yg5MyZ6qYIv55R8NoHPhi1c78GHVFRhUA371A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771870340; c=relaxed/simple;
	bh=GpcFfjFqktZkq1PJJFTb0XK2gYmrC40W4g+B7g8ZrDc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=RcSEEAwm+pcdsNJBb1Bp7/VEluX89mX/zw4+AT/L/PpbJiVF04NyY74dQh4/OsS8UpDnpNEWWburfU1hyt0+gcjHrs8AAxxpPxjeQ1UTn1bYzxRdlRc+w4BLSTh0/1RECzQIxTPe97Xdq0HgNKCDFarPUCtifcVIc6Jk9KEg8rA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hpB64fm/; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hpB64fm/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771870338;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=67lPNWHfQZaorsIQ9wDyrI/yXPhj5APVQRxZORYETQg=;
	b=hpB64fm/IxbFzLXipXj+MM680eTYUmmxTha8/A2XcDSP+6RAwsW9NbZOjHQlLraHZvcG9o
	zDIr9NCs5j8wVtqeNqZr9HCT5pZWvlv8aUV8W1eozs/gLthSlsphOqzagM9IbLO96oCV8V
	maPxy2awq/cJboLvHdRUlT5aKSR11wE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-658-31ZHCdmfOLSfzRni_QXY-A-1; Mon, 23 Feb 2026 13:12:17 -0500
X-MC-Unique: 31ZHCdmfOLSfzRni_QXY-A-1
X-Mimecast-MFC-AGG-ID: 31ZHCdmfOLSfzRni_QXY-A_1771870336
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4837f288194so39242745e9.2
        for <fsverity@lists.linux.dev>; Mon, 23 Feb 2026 10:12:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771870336; x=1772475136;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=67lPNWHfQZaorsIQ9wDyrI/yXPhj5APVQRxZORYETQg=;
        b=iVA2De8ccBpmae9E8qSC77IAbQXSVwZj1+LeDEQZEHrG6vIsCid99unq9XwR+q8woT
         4jpMDi/zyJmkuCMB5uR/0nrBAEP6Zx+dzAboaXV/stfSTFhU/3uPkN+4sFrrcuzKF9Xq
         6MNWgHoXjEVeyJBtL+osgVi2cOV/wZWKXlRgSU2EPzAXotd0GZuxeskaauCIj/hnlOyf
         OmD9auUc8veRjIStVQ3OxyvyLCF4iDDToNl5B/E+h3sHGu5F2AO4DHvROHUv5N2/sVc/
         DvaRkhogkEktrlYX54wMDzPsYAFSxipuczCn4xaNWl/PdFqa6iSQ2VuFL3bTmJs6pjm9
         4FRw==
X-Forwarded-Encrypted: i=1; AJvYcCUuyfWJXbf9S+OaBBYX+Wmjk29KbtWvo2kchkXoWSttZhCImNTOG/ixpq/3YyrsyoP7pPWgl1wGSA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzjOgtGt1/VOsP0p2VgWq0C5+dHgMntltXZo2xRZdAhJ09zYLRS
	zZZqrRmNhZ5O5FDk7Fap3MsGepGxVh6KIw9h356g9vj98VEvgiCtrxn7Y2DGNCh1yM/O/ERrIqG
	hcx0n26mLA7DMbzwcvGMniq/7rM7f7ZP3P/igEANOqgSEe5Jw3v5wFdKDKYM=
X-Gm-Gg: AZuq6aKiCQIBcXwLH1Oh9koEkmEQ4TZTVONTOF86My7Jt0XnVIIHDgYel8yq+fnH/p2
	4VexMiI3gA05FkjZeYYhiFNZng1ufrlwdMvw9q/E17cIKlLfG1y/2ESBQNli9xYygQ1Fh5NS9R6
	25t4nOSvhUmCp0Fdspm0KNFeubdVNZVcbjPP/UH4VPu39I6ed2Pq02pTgyXLozmJQAb5KuwOQ/J
	PB661rqCOKzCdBPcwZpxtGMTEPl/rhqf65oOwybBCQ69kccuVtRslspC/6Bp0t9EegZT7xpSg1Y
	pUJO2yBo9Iu+3FyTt3Tudq7aXEKxqfC9D3CbBgzoGH4aDPP3WYr/wXty94+as9zKVbYB2bLtaha
	vj2wCHWlZnrE=
X-Received: by 2002:a05:600d:6445:20b0:483:abeb:7a5c with SMTP id 5b1f17b1804b1-483abeb7b61mr97766935e9.12.1771870335616;
        Mon, 23 Feb 2026 10:12:15 -0800 (PST)
X-Received: by 2002:a05:600d:6445:20b0:483:abeb:7a5c with SMTP id 5b1f17b1804b1-483abeb7b61mr97766435e9.12.1771870335063;
        Mon, 23 Feb 2026 10:12:15 -0800 (PST)
Received: from thinky ([217.30.74.39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a430a33esm113087605e9.32.2026.02.23.10.12.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 10:12:14 -0800 (PST)
Date: Mon, 23 Feb 2026 19:12:13 +0100
From: Andrey Albershteyn <aalbersh@redhat.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: Andrey Albershteyn <aalbersh@kernel.org>, linux-xfs@vger.kernel.org, 
	fsverity@lists.linux.dev, linux-fsdevel@vger.kernel.org, ebiggers@kernel.org, hch@lst.de
Subject: Re: [PATCH v3 34/35] xfs: add fsverity traces
Message-ID: <ttfypsjh7cjab5o6wjvfjd4oj36wruigwqdttt35kdvnfptmex@2owry54j747a>
References: <20260217231937.1183679-1-aalbersh@kernel.org>
 <20260217231937.1183679-35-aalbersh@kernel.org>
 <20260219173610.GM6490@frogsfrogsfrogs>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260219173610.GM6490@frogsfrogsfrogs>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: grT7vPCFhs-wpu5xY8fIfUL3Y9qD6SdbHe08i6DAYn0_1771870336
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2026-02-19 09:36:10, Darrick J. Wong wrote:
> > +TRACE_EVENT(xfs_fsverity_get_descriptor,
> > +	TP_PROTO(struct xfs_inode *ip),
> > +	TP_ARGS(ip),
> > +	TP_STRUCT__entry(
> > +		__field(dev_t, dev)
> > +		__field(xfs_ino_t, ino)
> > +	),
> > +	TP_fast_assign(
> > +		__entry->dev = VFS_I(ip)->i_sb->s_dev;
> > +		__entry->ino = ip->i_ino;
> > +	),
> > +	TP_printk("dev %d:%d ino 0x%llx",
> > +		  MAJOR(__entry->dev), MINOR(__entry->dev),
> > +		  __entry->ino)
> > +);
> > +
> > +DECLARE_EVENT_CLASS(xfs_fsverity_class,
> > +	TP_PROTO(struct xfs_inode *ip, u64 pos, unsigned int length),
> 
> I wonder if @length ought to be size_t instead of unsigned int?
> Probably doesn't matter at this point, fsverity isn't going to send huge
> multigigabyte IOs.

I will update it

> Reviewed-by: "Darrick J. Wong" <djwong@kernel.org>

Thanks!

-- 
- Andrey

