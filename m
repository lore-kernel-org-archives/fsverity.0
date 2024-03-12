Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F78579DC5
	for <fsverity@lists.linux.dev>; Tue, 12 Mar 2024 12:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710245416; cv=none; b=CtGLDmir8pE0BNI/O3BU4R2/CCpFIWLMt9PGdfSTSMaYXBy8G2/fQTibt10Wfz3usjvblvnJrJZAmdaZE9y0Dx/JwtkxyAY+73f/vOMnapaz4ztnclpvvBLaUiPdgpmoKQXI5up2NM9Mjq2G2fq/HZbD3B4rf5PhCZ8gkLf9+8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710245416; c=relaxed/simple;
	bh=QmejXV0WNaqWu+GRV+FolZ1Mzxp6Le/AUayQOP+glBk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=uVjmj/cAKZ+dGuh0x/5FsPpXdJxw85MH2DW2pfWbrJAYDpLLe0EXZWUGsZRY584YK00fLrF9vWK1uK2PNrNdxXbyA8iW+2okYYCknReGa/p8S5u40/wD13CkDGnqNOUEyTvJudbPjMErCdF2WbsJL0sCSlUWjKBZYuVGB+L3mwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TVFKUuf7; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TVFKUuf7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710245414;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=31/cMpUBlNq1dVo/GBGgzVo8ufDRVUmygq7sRPjG1Qc=;
	b=TVFKUuf7SLsEcKVQ1bCtN8JwwhR6k89B0vi5/fpFg2JWVH3CCUT+zsBPKLUjZ238fPwgFb
	WWaR8oVidFRDKtugdzhTDMiI180QIG7UXm8mZIBTgUzV1e4OAETdjb36LPJtZAg3rLWghu
	enGOm2xZ/08LN30KcXyeV8podTKJ7rs=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-635-Ll2z9f3uMwCPVbozwdqR_g-1; Tue, 12 Mar 2024 08:10:10 -0400
X-MC-Unique: Ll2z9f3uMwCPVbozwdqR_g-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a4488afb812so297457066b.3
        for <fsverity@lists.linux.dev>; Tue, 12 Mar 2024 05:10:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710245409; x=1710850209;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=31/cMpUBlNq1dVo/GBGgzVo8ufDRVUmygq7sRPjG1Qc=;
        b=IbwcaThZ7O8FGx7mKcVsJChVbm7erCgnUsYqs2PgDHSPt1zhL1Pul+Lcz9jnxXlSSX
         eOjJ6vRehvt1pVGbR0CZpQDuMKANj876nGzOvwa1hE1qAvYYAqbPDjIMFdEj4BgSEG3Q
         LAKfdeSMGaV9RaIbCICpeW/o6jzGJBNa95VPRIJCQ54pyJ+ZCnENWtxx4rxvn4ZhVRLC
         H7UTVP4Wl37l5ieOdPKhn9WztDI0+DRxTyhxRfHHV83yfr/x7Fqe82mJBb95oPld1gh+
         vqkBHAVYNOHp1Luxm11Mc73kWmto7trzwuopAfD42bciF6r+DDyPOL+CP/2uk6owSHFr
         T31w==
X-Gm-Message-State: AOJu0YwCShQvCMja6MwEGqxuJKzrYFOy1Et+0I6orSOB1cXqduthbBOL
	Q/SbjPwmX1pBbFY3no7zjUD/LkgIOFXpvW1D1ffqMS7WHkx934APNKeOG44bXGZCjiKfDNd1KSD
	SkBt/fl1POz0x/J6FFH1x8r4w9LuqDjWW2vu+BO7CVqEn0CO3EOA8P2E=
X-Received: by 2002:a17:906:f854:b0:a45:ab61:7a47 with SMTP id ks20-20020a170906f85400b00a45ab617a47mr110676ejb.16.1710245409326;
        Tue, 12 Mar 2024 05:10:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEcFKEllu/5Cbuy41Q4z4pVzuQCoPfYq9eSirKoM2GYu6wrbDVHhEhhps6AcIx6mCLMUFmsaA==
X-Received: by 2002:a17:906:f854:b0:a45:ab61:7a47 with SMTP id ks20-20020a170906f85400b00a45ab617a47mr110620ejb.16.1710245407792;
        Tue, 12 Mar 2024 05:10:07 -0700 (PDT)
Received: from thinky ([109.183.6.197])
        by smtp.gmail.com with ESMTPSA id t13-20020a170906a10d00b00a4605a343ffsm3384399ejy.21.2024.03.12.05.10.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 05:10:07 -0700 (PDT)
Date: Tue, 12 Mar 2024 13:10:06 +0100
From: Andrey Albershteyn <aalbersh@redhat.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: fsverity@lists.linux.dev, linux-xfs@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, chandan.babu@oracle.com, ebiggers@kernel.org
Subject: Re: [PATCH v5 22/24] xfs: make scrub aware of verity dinode flag
Message-ID: <iag66iabauxkow5z2cn275gjtbaycumf3u6lsyljzuascylbto@d23xbll7dx6n>
References: <20240304191046.157464-2-aalbersh@redhat.com>
 <20240304191046.157464-24-aalbersh@redhat.com>
 <20240307221809.GA1927156@frogsfrogsfrogs>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20240307221809.GA1927156@frogsfrogsfrogs>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2024-03-07 14:18:09, Darrick J. Wong wrote:
> On Mon, Mar 04, 2024 at 08:10:45PM +0100, Andrey Albershteyn wrote:
> > fs-verity adds new inode flag which causes scrub to fail as it is
> > not yet known.
> > 
> > Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
> > Reviewed-by: Darrick J. Wong <djwong@kernel.org>
> > ---
> >  fs/xfs/scrub/attr.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/fs/xfs/scrub/attr.c b/fs/xfs/scrub/attr.c
> > index 9a1f59f7b5a4..ae4227cb55ec 100644
> > --- a/fs/xfs/scrub/attr.c
> > +++ b/fs/xfs/scrub/attr.c
> > @@ -494,7 +494,7 @@ xchk_xattr_rec(
> >  	/* Retrieve the entry and check it. */
> >  	hash = be32_to_cpu(ent->hashval);
> >  	badflags = ~(XFS_ATTR_LOCAL | XFS_ATTR_ROOT | XFS_ATTR_SECURE |
> > -			XFS_ATTR_INCOMPLETE | XFS_ATTR_PARENT);
> > +			XFS_ATTR_INCOMPLETE | XFS_ATTR_PARENT | XFS_ATTR_VERITY);
> 
> Now that online repair can modify/discard/salvage broken xattr trees and
> is pretty close to merging, how can I make it invalidate all the incore
> merkle tree data after a repair?
> 
> --D
> 

I suppose dropping all the xattr XFS_ATTR_VERITY buffers associated
with an inode should do the job.

-- 
- Andrey

