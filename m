Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49289318B99
	for <fsverity@lists.linux.dev>; Wed, 18 Feb 2026 09:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771407969; cv=none; b=TiD/qWUnzRn8q1Nb9i1tmIDxt22QsR6oi75PCHCPGlVKSAGZZHhpt2Uc0BEwI/XmMqidgzrELckxClauJCnQPsidIyMiMw3+GcG7PwfGdSy6haKE64TPQy24pUS6Kawo4RyqJFiaEnuV6gtgFdEFZa6mn0KoFXSdTu+lFOk1i4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771407969; c=relaxed/simple;
	bh=+/zonLHVCNiYpF3F1mGEWfBegPViwa5HxidFiTwykE0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=nwiJHxzGjItnKEm/6qwarTr2bpYB/owbhtZXr9IekHa4gAX2RS74mUuROIhPWFq6+SrhnavCyaw7R0r1SqPZU+1CM0AcegiEaKl2iAIw6HUIUv71zm2G+HziJpg95+Te9rTlU9Us+JFqJqk/92V1D0o4JjZYLIBMCs7g63QuYrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=b8Rz7/99; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="b8Rz7/99"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771407967;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RyJBX+PISSbPZLtLewMjCIqsH1uiQW06yqBd1F+fu9Q=;
	b=b8Rz7/99/k8NSLyn6gIhNMqdyo48jGtwFqkNaAAxcAR/cKIeCI8nmnZ5eDcgTlqV1LNFph
	m48PmmGsgf+o1PK6ZKt5Gv8Ll69hJxQJHcB2Ns2tCAofH1cqqvVfLBAfhsnV2epfvTcnjX
	KT+vo42ySDM9yqe+dphKMTLTS4NXnwY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-86-3gp8GE51Nien_uBd1UtJBw-1; Wed, 18 Feb 2026 04:46:06 -0500
X-MC-Unique: 3gp8GE51Nien_uBd1UtJBw-1
X-Mimecast-MFC-AGG-ID: 3gp8GE51Nien_uBd1UtJBw_1771407965
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-435a11575ecso4923652f8f.2
        for <fsverity@lists.linux.dev>; Wed, 18 Feb 2026 01:46:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771407965; x=1772012765;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RyJBX+PISSbPZLtLewMjCIqsH1uiQW06yqBd1F+fu9Q=;
        b=gFroyKpE7yiLyD2evp2KAv5NXBGdmO6y6Fw5zBSdZydHAIfyPmzHihlRhkaJ2q4Q7N
         F15fndqaN/CtLj1cHw4aovDljl9I9rLEpx/5MLKQGiQdVW9dDiLLDMvun64OP9vlelb0
         cta2prxwxXmAyJuLvnVK5KLVDdMkY4FNIat53N58X0Feiehohnh4TL+Pr4zAPPuP3IJY
         0g0rGz1ene1G2td+EWeuKza+9u2iQM5toDXeHV3XwQX4Bi/E2FpM8feHPIzkriclDxEk
         k3k4xxaqTiAZ/VBjYEQtJdEZ4cCWB0evKU/ZRIpkr9Rm0iACGII4sSIqeJDZgEnR19hF
         cW2Q==
X-Forwarded-Encrypted: i=1; AJvYcCU8lylCbYsKbLGhY3zRBOy/RWcNWt9FMq65VjLSNXpj68Q0DJtTPeJBVin4TeoozxsZqk7e7J1ULQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyHl90PmD43R7LiomOp52khbCZ9IB4EvDtjk0IpRLiPiko5iEq3
	6CKI9ps93qKNZZlSDYD9D84NkO+ck6nOvyMJ5adtkKjoqYLUPO5nPGKR6MpY4u83GwULV5sLwEo
	URcy+JJ941f9daEcPuuExfmQSCQOd+q1V1YOrYwtmDSFF5y2ClOWjFGBc5KI=
X-Gm-Gg: AZuq6aKlxfkl7lsVp8unFpb4akpgT1BlPtx437LNms07wbW75ilsjAD+LFlE1K/whPI
	dSuJJOcFHzt834NbTLidaVnBn1guOlMd1WAz82z6WwQQj0e2gSIDFECXpN8AhHlMw0XL4rrmzsU
	GyEdvOuPUHQPHhFgsYsmqs3LU4nasf7uOLXlz5L6ppt2qz0Zax5voCuYKLLhc5LyLzgTBZDozZy
	VhXV6XhdniorVI3U7TMkV+l7IbX26WbMF35ccpDtN/fVy4jrEXdtEGv8Nyqq8yVZ77KYIUp8tS7
	GtYLmPYyii0qTxuT2ubKb3+z6UKTa1NqbaJagdJNEaD+hYEg+pmdBjBEIOv7DcE59o+B1mrdQcK
	/6RCMKMegHZA=
X-Received: by 2002:a05:600c:4f92:b0:482:eec4:76d with SMTP id 5b1f17b1804b1-48398b5e0d0mr23667665e9.17.1771407964654;
        Wed, 18 Feb 2026 01:46:04 -0800 (PST)
X-Received: by 2002:a05:600c:4f92:b0:482:eec4:76d with SMTP id 5b1f17b1804b1-48398b5e0d0mr23667385e9.17.1771407964108;
        Wed, 18 Feb 2026 01:46:04 -0800 (PST)
Received: from thinky ([217.30.74.39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48387ab1974sm196913305e9.3.2026.02.18.01.46.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 01:46:03 -0800 (PST)
Date: Wed, 18 Feb 2026 10:46:02 +0100
From: Andrey Albershteyn <aalbersh@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Cc: Andrey Albershteyn <aalbersh@kernel.org>, linux-xfs@vger.kernel.org, 
	fsverity@lists.linux.dev, linux-fsdevel@vger.kernel.org, ebiggers@kernel.org, 
	djwong@kernel.org
Subject: Re: [PATCH v3 23/35] xfs: add helper to check that inode data need
 fsverity verification
Message-ID: <7c2kegonzbfrdv3thcrorgadyuejyknb3uipxlbxkpa4gfgu3t@zpowelexa6zu>
References: <20260217231937.1183679-1-aalbersh@kernel.org>
 <20260217231937.1183679-24-aalbersh@kernel.org>
 <20260218063827.GA8768@lst.de>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260218063827.GA8768@lst.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5crUCm--tpJr10LtapjSnAfm_FffMtksJ59E9mbkLw4_1771407965
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2026-02-18 07:38:27, Christoph Hellwig wrote:
> On Wed, Feb 18, 2026 at 12:19:23AM +0100, Andrey Albershteyn wrote:
> > +	       (offset < fsverity_metadata_offset(inode));
> 
> No need for the braces.
> 
> > +}
> > +
> > diff --git a/fs/xfs/xfs_fsverity.h b/fs/xfs/xfs_fsverity.h
> > new file mode 100644
> > index 000000000000..5fc55f42b317
> > --- /dev/null
> > +++ b/fs/xfs/xfs_fsverity.h
> > @@ -0,0 +1,22 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Copyright (C) 2026 Red Hat, Inc.
> > + */
> > +#ifndef __XFS_FSVERITY_H__
> > +#define __XFS_FSVERITY_H__
> > +
> > +#include "xfs.h"
> > +
> > +#ifdef CONFIG_FS_VERITY
> > +bool xfs_fsverity_sealed_data(const struct xfs_inode *ip,
> > +		loff_t offset);
> > +#else
> > +static inline loff_t xfs_fsverity_offset_to_disk(struct xfs_inode *ip,
> > +						 loff_t pos)
> > +{
> > +	WARN_ON_ONCE(1);
> > +	return ULLONG_MAX;
> > +}
> > +#endif	/* CONFIG_FS_VERITY */
> 
> It looks like this got messed up a bit when splitting the patches and
> you want an xfs_fsverity_sealed_data stub here?

oh, right, haven't noticed that, will fix this

> 
> Also I'm not sure introducing the "sealed" terminology just for this
> function make much sense.  Just say xfs_is_fsverity_data maybe?
> 

sure, xfs_fsverity_is_data/_is_file_data maybe? to keep consistent
xfs_fsverity_ prefix

-- 
- Andrey

