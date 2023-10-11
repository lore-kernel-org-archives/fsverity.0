Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE4211DDE6
	for <fsverity@lists.linux.dev>; Wed, 11 Oct 2023 11:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SDbBvnEQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697023062;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Zlo0/ziFMNgNYF1FEOPe0SVTb/Xnel6cZPY+1Ns248c=;
	b=SDbBvnEQ+OEOYDT5TIa5aCl2byPFkJMXwvAMcLovgdPwvlejUMHBF2AvdBA7agpQMPnziv
	d7PlsO3loNdEm8LiKs4fp0NbzJD/sHGT+pl+jD2x2oO47BpxbgFX6LrSgYE+VT7YBHWGEo
	B71LvrO6VCYkqsem1XoIzdHPcEdIH58=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-634-JrxMdmDHN6mHQmUQOIvKaQ-1; Wed, 11 Oct 2023 07:17:39 -0400
X-MC-Unique: JrxMdmDHN6mHQmUQOIvKaQ-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-537ec211f15so5404649a12.1
        for <fsverity@lists.linux.dev>; Wed, 11 Oct 2023 04:17:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697023058; x=1697627858;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zlo0/ziFMNgNYF1FEOPe0SVTb/Xnel6cZPY+1Ns248c=;
        b=ouv0golBY3+A5v2udABedreBiDND6TC8vEynd/JNvIpu2GiCrx8G4GBszwrjj48knX
         DXfZYxbAOKXJ8x92u9QODOddOxS2pUmy4qSsXflP9iSxD9lfiIw+xJquKPV3uPbWlXmv
         xOcOT4crd3Si6OA6ZihrjltdfFoeQL6A2J7b46FVP5gLFMzZ9wSjMTiQX0dNQMDweOLW
         mWBmltkMNSaQHwqrSjCr4Nd2oaycwZc9WP8hiCCC2R6PrNYd83zndVxXNtOeJ+JAfduf
         0dXIZc5hqWQVi4aAhoiUgD/yrF09bDOv4NOuu1YBP0TCnoo/X9qiyAr9NlOLTDabUIIE
         9B4g==
X-Gm-Message-State: AOJu0Yx+vz0YJ6uP5jU4nFnM42FEOvSIX5I1A7OuH3kYYv4BUeCpKHB+
	Nws9vvX65FbB1bUroj29G2X0QLU0Uge2bDrrFdIaVQQY7T6QmPOLVbNd3jvOzMf7U1pWIjB2PY2
	ITwtTKnWsGQfdEBzFwQ==
X-Received: by 2002:aa7:c549:0:b0:531:1241:3e98 with SMTP id s9-20020aa7c549000000b0053112413e98mr18033181edr.9.1697023057998;
        Wed, 11 Oct 2023 04:17:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHZZ+YnNUe9yjYU4VsUgPkzYbFo3mygztYN0VRUFnAXJzd2X2vpYfGz2QCoVKm8w94kwwpTtA==
X-Received: by 2002:aa7:c549:0:b0:531:1241:3e98 with SMTP id s9-20020aa7c549000000b0053112413e98mr18033170edr.9.1697023057687;
        Wed, 11 Oct 2023 04:17:37 -0700 (PDT)
Received: from thinky ([109.183.6.197])
        by smtp.gmail.com with ESMTPSA id cy7-20020a0564021c8700b0053de19620b9sm462255edb.2.2023.10.11.04.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 04:17:37 -0700 (PDT)
Date: Wed, 11 Oct 2023 13:17:36 +0200
From: Andrey Albershteyn <aalbersh@redhat.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	fsverity@lists.linux.dev, djwong@kernel.org, david@fromorbit.com, dchinner@redhat.com
Subject: Re: [PATCH v3 09/28] fsverity: pass log_blocksize to
 end_enable_verity()
Message-ID: <bwwev42i7ahrbdl4kvl7sc27zwrg7btmwf2j5h2grxp25mxxpl@4loq5hqs43gv>
References: <20231006184922.252188-1-aalbersh@redhat.com>
 <20231006184922.252188-10-aalbersh@redhat.com>
 <20231011031906.GD1185@sol.localdomain>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20231011031906.GD1185@sol.localdomain>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2023-10-10 20:19:06, Eric Biggers wrote:
> On Fri, Oct 06, 2023 at 08:49:03PM +0200, Andrey Albershteyn wrote:
> > diff --git a/include/linux/fsverity.h b/include/linux/fsverity.h
> > index 252b2668894c..cac012d4c86a 100644
> > --- a/include/linux/fsverity.h
> > +++ b/include/linux/fsverity.h
> > @@ -51,6 +51,7 @@ struct fsverity_operations {
> >  	 * @desc: the verity descriptor to write, or NULL on failure
> >  	 * @desc_size: size of verity descriptor, or 0 on failure
> >  	 * @merkle_tree_size: total bytes the Merkle tree took up
> > +	 * @log_blocksize: log size of the Merkle tree block
> >  	 *
> >  	 * If desc == NULL, then enabling verity failed and the filesystem only
> >  	 * must do any necessary cleanups.  Else, it must also store the given
> > @@ -65,7 +66,8 @@ struct fsverity_operations {
> >  	 * Return: 0 on success, -errno on failure
> >  	 */
> >  	int (*end_enable_verity)(struct file *filp, const void *desc,
> > -				 size_t desc_size, u64 merkle_tree_size);
> > +				 size_t desc_size, u64 merkle_tree_size,
> > +				 u8 log_blocksize);
> 
> Maybe just pass the block_size itself instead of log2(block_size)?

XFS will still do `index << log2(block_size)` to get block's offset.
So, not sure if there's any difference.

-- 
- Andrey

