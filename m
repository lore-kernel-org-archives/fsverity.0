Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B733BFE3C
	for <fsverity@lists.linux.dev>; Wed, 22 Apr 2026 08:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776848289; cv=none; b=STvO02rTD0wV+aHJsLiK3BunuH2mQSqMlyMT/3T2G5Z2VqYfXsE6yFhEiY691wB6t35Rn4W0aoIURfsL2RV0T/Fw3UpvSKVptJBQTjOtELTLvVNUSF4d75HwQx0ZMdyAgQLW2/JPgUF58T6rGQfOS3c7TS5mi4s20zxw5cpSNWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776848289; c=relaxed/simple;
	bh=uF63Ms8AACR/oFWxgd+uFy3hlr2NIcQ7At05T0KyQug=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=F25LiwDCL97a2hfttf8zIaYNovARDoXqc3oDIkuOk+3ZLW/6RBNNwaYP9cp2Az9hpaTtWSarHHjxL20/O5i/vpcvMHl1S8jh6sW/Ob8CRD7ab8rQTid/v0bAc3Tlv617dZb6zIgs2dxxAk7NmdOainxeQKFSRMOZ71Jb18S44oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cHQHEGn4; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cHQHEGn4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776848286;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FFaygBUBXXsgixj3eSOd6CMo0lj7K6zPcakxuhrDzd4=;
	b=cHQHEGn4d65uGcHveSIfcaCYX+F8OuoMacUm1MAOmqirZSK4FaBJJv5JD4WXXd/psgrLV4
	AyeNE1L6dGikldh6xPKHp9tapFPxBEeg5jZczq2A419pFkp0K5EdnG6cEGSDAAe63btKjy
	0tAeHahRUjaQ4pK45Cde+QMyNuzt6lE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-44-hAcIjljUMLG0Xg1wVMwKTA-1; Wed, 22 Apr 2026 04:58:05 -0400
X-MC-Unique: hAcIjljUMLG0Xg1wVMwKTA-1
X-Mimecast-MFC-AGG-ID: hAcIjljUMLG0Xg1wVMwKTA_1776848284
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-43d7e5b98ebso4373496f8f.0
        for <fsverity@lists.linux.dev>; Wed, 22 Apr 2026 01:58:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776848284; x=1777453084;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FFaygBUBXXsgixj3eSOd6CMo0lj7K6zPcakxuhrDzd4=;
        b=T9rxvRdndoHweMDM27yqnc80V7dO2wwBE/E7ZkIPMR/jq7UG1brl7N69y4MDe12/dm
         7m4w3JrXVkJS15HSzGoqlCdITKOyIsea0Rzl9WUmrievIFw4wYRwPj4B+FBPeHQwdrir
         WmOWePsITCKA2JxRO9UgGeGWPi4gKNfb7MiE0m2CYM47ObkyJknF805o6XGlGqiuCERw
         T1MjYn6lfKv+PYQKSgCtPJvzHpNDzn1IulUuzD6RBYVHCThLFqsnw0ZA6nUDChhQ/Kbu
         WGOzMp08Pc+n5cntFAYZTNGLyErX3pUkbKFDid5fHwPp9lWY4jPqoBWtFGPteuhawCyM
         awHg==
X-Forwarded-Encrypted: i=1; AFNElJ9kH8c4HmzvCfqM3/o2oncGn5BgF694zJPphap9nl7QL00HhOn9I5ARQoDXAvEBXANrYZ6IdKB7aA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz1sPWwk0DVf+iLLmnGz2w8F42KBXq/ps/bfT/Z3YYR5e6s2GI1
	YCfQXSm8SNEFsy9OqbPIlMrkOT+gmR3sQFgiM/xcfx3t1MdZFHOiiARnqL55CP9DbgloIDHjA/O
	QP1jQsH+D2mz+IyfS9QW6R4J7IfbW3XELKnHaYWgaNeRIA+n+UUuh1r7uAIw=
X-Gm-Gg: AeBDietMhGSxVNUnsCqMaG89xj0kPWkYXX1W3h7M+dnK59zP96Sf26vX80rlEsDG3q0
	txHMJB1G7KvcJLhqjRO2J5hkbZvNc3AHY4W7zunqJX/unzZlqScmj3y6ty7vMTu/rFJp327KeCy
	Q9CDIFxzUnJwCA7bLqjAgQpYGYlH6pT+3Ri8PK7QakIryZ3XKYfKdLVBY9HNO39D5RG7Chnoyso
	rfM1G0BpxaXHGJ6EErMqESzHN8m408loEPe607WHxZFNE1xCnCFvDT0FhAwaNRBsAcd+21+q2tv
	mn82UiRKCfh5TwztuABvl7ooUPfRj6fMhU/5SwpEgjih3SXwC0Wy4kvI9k+vBdgZdrkCs0ajBiq
	JNLMASzzgjNAly90GFx5AZg==
X-Received: by 2002:a05:6000:4022:b0:441:2439:bef2 with SMTP id ffacd0b85a97d-4412439befdmr4594392f8f.24.1776848283823;
        Wed, 22 Apr 2026 01:58:03 -0700 (PDT)
X-Received: by 2002:a05:6000:4022:b0:441:2439:bef2 with SMTP id ffacd0b85a97d-4412439befdmr4594342f8f.24.1776848283286;
        Wed, 22 Apr 2026 01:58:03 -0700 (PDT)
Received: from thinky ([217.30.74.39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e3a341sm47712138f8f.24.2026.04.22.01.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 01:58:02 -0700 (PDT)
Date: Wed, 22 Apr 2026 10:58:02 +0200
From: Andrey Albershteyn <aalbersh@redhat.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Andrey Albershteyn <aalbersh@kernel.org>, linux-xfs@vger.kernel.org, 
	fsverity@lists.linux.dev, linux-fsdevel@vger.kernel.org, hch@lst.de, 
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
	linux-btrfs@vger.kernel.org, linux-unionfs@vger.kernel.org, djwong@kernel.org, 
	david@fromorbit.com
Subject: Re: [PATCH v8 00/22] fs-verity support for XFS with post EOF merkle
 tree
Message-ID: <iads77qkk2wjkqfezd4vtqsga6btlkqdyephqojyv76herp6by@l24e2hm2ebas>
References: <20260420114714.1621982-1-aalbersh@kernel.org>
 <20260421214316.GB37143@quark>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260421214316.GB37143@quark>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 2Uw4dbUHSmbZ7KAv54nYfWPl_gaOU0NM55642vFGZXI_1776848284
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2026-04-21 14:43:16, Eric Biggers wrote:
> On Mon, Apr 20, 2026 at 01:46:47PM +0200, Andrey Albershteyn wrote:
> > This series based on v7.0 with Christoph's read ioends patchset [1].
> > 
> > kernel:
> > https://git.kernel.org/pub/scm/linux/kernel/git/aalbersh/xfs-linux.git/log/?h=b4/fsverity
> 
> FYI: the git repository doesn't match what was actually sent out.  For
> example the patch "ovl: use core fsverity ensure info interface" is a
> bit different.  The version in git (incorrectly, I think) ignores the
> error code, while the patch returns it.
> 
> - Eric
> 

Thanks, you're right, I forgot to push

-- 
- Andrey

