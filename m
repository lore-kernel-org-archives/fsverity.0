Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE063CB2F8
	for <fsverity@lists.linux.dev>; Wed, 22 Apr 2026 09:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776851959; cv=none; b=YywC2FhTb9OOTqPz+TQ5F4xnjNkVXDapvl7HzH3Vn3nCEA4eoVta09yI8EXoFd+3yqAoImHNQ3yvtGgaXjTVIY3oJqrkyF+/D8pBj+sUN5mbimqSred+nPP1r09pMwwe9u0w1ga/bHBS5IdMq/s2tc7r06gcQ247nTboIr/NLUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776851959; c=relaxed/simple;
	bh=qdTdoKTlhVu86bDuyPkOaG5VtZiyVVLX9VSgFPv2CkI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=LG/1VDmKPxFK7axzLGgdWwKTx9gV02nhQ4Ezq2xgAol3R5WohmUYnT9hNMnOjGBIwGiFHk0M/m+0VftjSm0Koukn9UAmgJsjks/7X/yV/V6FBxJy8YEG14UiR3OY5tWaNko0nICV65/shfTGykp0AEuiGQ3NIo4yWJS8/SaGA9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ODIg87AN; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ODIg87AN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776851957;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QVpt6cL/XFUpoSbUgEFsp9E/b8gj4ghVTxVOycpPEPQ=;
	b=ODIg87ANs76RlosAfe/FylwGT6IgdXDn7hvrmy9H25rpAqjDYJl1Ov1CE8CIBMyxe5QbFy
	uob+J+fG2rx/n7m8WAaB1M/C7nWOFCQ1+cVTqAMCWhActy0mD0q9eza+NvWgix2KEvt3GP
	lnYFVEMXQp7S562+aVcz43+njtNoSFo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-237-2gWb0lMSNoyUtN_gBSB5MA-1; Wed, 22 Apr 2026 05:59:14 -0400
X-MC-Unique: 2gWb0lMSNoyUtN_gBSB5MA-1
X-Mimecast-MFC-AGG-ID: 2gWb0lMSNoyUtN_gBSB5MA_1776851954
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4891f97aef0so15875245e9.2
        for <fsverity@lists.linux.dev>; Wed, 22 Apr 2026 02:59:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776851954; x=1777456754;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QVpt6cL/XFUpoSbUgEFsp9E/b8gj4ghVTxVOycpPEPQ=;
        b=T/bpuWICrM7zrrAZhe3xWOlR0kRBfquBaoaZMDy427cI/W7O3m2GLUUXCN5KLhaYVg
         iKH8TMh1PPoy+yzwOPT1TYCOOL1LK2/Dam8XYjYJubdiucFZlODF6fa1a5JsqnUAyJ8g
         wcIAC/IN6wtjnwdNNoL3FOVNPY5O7wPA1wWJ/C6UrKtag/SBs12sKtbx5PTo9mI+iBxG
         vQme+OdZNsXqZxH1qKgioQL0O0PruxCYzqErRqrD+hGvv21n6zguawCXJK9ddv8TTHeo
         bG0t5/yKzH2VtB6h8eKVIgDhOlCEYLf3xAEyHPtRWl4BUI9ew7NM4DxOWsK71f3QqXuc
         /EMQ==
X-Forwarded-Encrypted: i=1; AFNElJ+8XgG/W3Ecm71SqWTSdAwsRCGfuq2USLAcTxQOAWPhiIuRbvxTxu3qEFUpM2NEL+0dy9gjxPLlFg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzdnPjSUaRQbnG8fxdoJSNcX9w6HlQqyC2XTqW5cTuDGWd6PNM2
	hZppE79QT3de3wWxSVAhHUUTBg+pqHbYCAP8JboO8dr2SP7bY4KrQtJs+tWOPhSXF0YDpIuMpPl
	OZBg9hNFn6lIzM3zs6/PW5xmYUAIyePfzjIJ/TxKVDIn3+FkgKSX71rXOfiI=
X-Gm-Gg: AeBDievPeU4op7l/EkSnoz77glaRqWbTec43SA8niYhvYjVTOcSNhRnP2sPoJsMeQMu
	H+N/3BMTivOl3IxQMy8fNuioNKe2lFZlKLoAHcY7kRavqJ99q7V4s+4Vte0Oypi/PMzqKMSyP0S
	toMq0GWRIY8iYDWTyFYmEaHtJWAGTdmyYHLVBFwmV8UXmchoOsT5CtKyGNKFLtFc3t4oPK8Mgwu
	zTjh6tRkC9Kq82y6HvHymaXlpiOQUe/rTcU8k8g0OXvxSqSeDUpAoEFGKscj9tjMnNhQPzR3qez
	/8eBySVyyJcA+xB+BKlM2ahoQrhSG7uFDaK6zCfd22zoq+ta4i6JWeYZ9hijNTkh9uZzPtpD04M
	S5SXa98V9g8BISQy/A8Caiw==
X-Received: by 2002:a05:600c:8b8a:b0:489:149a:f9e7 with SMTP id 5b1f17b1804b1-489149afa2bmr214250915e9.27.1776851953566;
        Wed, 22 Apr 2026 02:59:13 -0700 (PDT)
X-Received: by 2002:a05:600c:8b8a:b0:489:149a:f9e7 with SMTP id 5b1f17b1804b1-489149afa2bmr214250425e9.27.1776851953134;
        Wed, 22 Apr 2026 02:59:13 -0700 (PDT)
Received: from thinky ([217.30.74.39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488ffc5e3f4sm222129625e9.2.2026.04.22.02.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 02:59:12 -0700 (PDT)
Date: Wed, 22 Apr 2026 11:59:11 +0200
From: Andrey Albershteyn <aalbersh@redhat.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Andrey Albershteyn <aalbersh@kernel.org>, linux-xfs@vger.kernel.org, 
	fsverity@lists.linux.dev, linux-fsdevel@vger.kernel.org, hch@lst.de, 
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
	linux-btrfs@vger.kernel.org, linux-unionfs@vger.kernel.org, djwong@kernel.org, 
	Amir Goldstein <amir73il@gmail.com>
Subject: Re: [PATCH v8 03/22] ovl: use core fsverity ensure info interface
Message-ID: <gpmgtg2wkoo4vozzaaouhdp2df6zlifwi6gy4jvq7xc22zo7om@t3f2bl374nlr>
References: <20260420114714.1621982-1-aalbersh@kernel.org>
 <20260420114714.1621982-4-aalbersh@kernel.org>
 <20260421214457.GC37143@quark>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260421214457.GC37143@quark>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: nx1Ww-cjMtV7ME73b5MpkX8bsB7eIBtqN4s1fqtwzSQ_1776851954
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2026-04-21 14:44:57, Eric Biggers wrote:
> On Mon, Apr 20, 2026 at 01:46:50PM +0200, Andrey Albershteyn wrote:
> >  int ovl_ensure_verity_loaded(const struct path *datapath)
> >  {
> >  	struct inode *inode = d_inode(datapath->dentry);
> > -	struct file *filp;
> >  
> > -	if (!fsverity_active(inode) && IS_VERITY(inode)) {
> > -		/*
> > -		 * If this inode was not yet opened, the verity info hasn't been
> > -		 * loaded yet, so we need to do that here to force it into memory.
> > -		 */
> > -		filp = kernel_file_open(datapath, O_RDONLY, current_cred());
> > -		if (IS_ERR(filp))
> > -			return PTR_ERR(filp);
> > -		fput(filp);
> > -	}
> > +	if (fsverity_active(inode))
> > +		return fsverity_ensure_verity_info(inode);
> 
> Not sure whether I should review this version or the version in git, but
> both seem wrong.  

Sorry, I forgot to push, this one is the latest, the one on git is
v7. I will push v8 now.

> The 'if (!fsverity_active(inode) && IS_VERITY(inode)) {' condition
> should stay

Why? With recent changes, the fsverity_active() now checks for
IS_VERITY() instead of verity_descriptor.

> , but fsverity_ensure_verity_info() will need to
> gain a !CONFIG_FS_VERITY stub to fix the build error.

With "if (fsverity_active(inode))" I think this is not necessary as
this fsverity_active() will be always false, and this if-case is
optimized.

-- 
- Andrey

