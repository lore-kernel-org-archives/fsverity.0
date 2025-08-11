Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD59B2E2DF3
	for <fsverity@lists.linux.dev>; Mon, 11 Aug 2025 19:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754938861; cv=none; b=Nph8fWGuqpQTCMb3AeFa6YS9ijJl9i/KEucFvilF8p1y6fAryBmFLE6oHKRaZN7EeFEnONEwbTqaqycaEI58Vvgm7AwJ8h4P8Z3vcWjrlSlb0MT1LTejUUjF9MZtqGYSP4cS7qaRjZgVCb0DPl7NYUfnxQINLqpHTa1kVZejbFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754938861; c=relaxed/simple;
	bh=ybcjvOJlMNn70eoStdwho8f04eAjfDTqsUepVF/tZCI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=RYQdzZXmPRFVEllRxry/WVdpIHwmrook3x8/5PWVD6u8xgr8KgLaeuiiy5waMQZMuyr2EbdDVnL6CXm05gtl/z+bDow72inbRInpB3haf42Gf6j02GhDe2xvTDTWK+W/8j36ACc4ZdMv2todgqcMaxL5d33lzxebq/fEkizqvUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=STq1Z4uX; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="STq1Z4uX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754938834;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=58JoT5HH4eptH1LhdQHcGjevevo6yl7PELRmS6dCCGw=;
	b=STq1Z4uXuOXBhRkud3tsuf3Ad/0+BmbxyLFl/U6PgMtpFWr9JuKlHK4N4s0UXco22cPbYu
	+FLTIpXGqmKkv1hiWDlxlkdkHgMIjpV+SsN175YvUu/FJJpykr6UddYO60qK58AcmpdCt1
	hnOcbteUt5UXnwRElfOrKCftt7qTuRk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-359-7ySg7qknOFayS_hjsRpU9w-1; Mon, 11 Aug 2025 15:00:33 -0400
X-MC-Unique: 7ySg7qknOFayS_hjsRpU9w-1
X-Mimecast-MFC-AGG-ID: 7ySg7qknOFayS_hjsRpU9w_1754938832
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3b780da0ab6so2364896f8f.0
        for <fsverity@lists.linux.dev>; Mon, 11 Aug 2025 12:00:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754938832; x=1755543632;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=58JoT5HH4eptH1LhdQHcGjevevo6yl7PELRmS6dCCGw=;
        b=ct5uuO8Dh4iz6+O9NPFc4oL67OS3DhgaiQCIOrNuzSJ/+08qZuQu03WiNDBiDZrSYT
         zY7wTDChuBDA59OJkic1VBXb0Re/ZlOYqZrSZlMwbpfVG7cPyJ0QT1l5nSJmGyR4Fqjc
         Ki7WbdxgE3ZpdfbvhdZNBOnlCarnilrvrVxFwYHWCKh5XKz4/yb5wjjsy2xwa84l8ppo
         t9EIYeU7AJUx4KjTF7I2AwzaJ9pQgQTd2TrrIUzH0XP2S+ZEs1MtWtR52EQUO6w5pghz
         iHbbkcNXVyVP1fmlZL656c2LjAGnTsh8BxgOYtZKduc75eKj2e2VPctaL5O6IkE1D889
         s22g==
X-Gm-Message-State: AOJu0Yz2ftpPytfcyEQD6YMZefEbYgVYpyXeH9UqDO+wib/tg8pujDkg
	KILQXJtc54FuGiwCdkgxdx1bHLYgyUgBlwkBOK9rTpBuUSQ0T6s7vXbIiErd5rDI819gAOOK8Wr
	mWFALv+wZJYF4Bybs1/4W9kvbb4IqHpWt8uYZbV1Dh53ezEo0MYzJU0Sb7gE=
X-Gm-Gg: ASbGnctEp+NAfsauIx/C1N0yPxHs4Lmjt9gB6D1YW40Dxo3miTf220RYf5h+wwu0ErY
	Kg8nx1tDqVlWg14ThtuBy1uhOFww1mvyvy+/sBXHI40UULxiCPtcij33zzttVR5F+rrkj2AJlBH
	yJdCXg1ytN2EKxrrTxoB/SBFl1wdqb6wH6rROo4WaoJnfYLRUCC5i3HyhdYG+MGjqXoGYv9hGtA
	kE0VwgvsWF6KAAK9DjL916ILct3L3v6+T6cwjFTniCrR9V/BH37A2SRndSAnAOy85jFjJ5hPoD6
	AYN3mDETKhyZcJdFCNEggWjaotlk/7kWaShUpMMZYZlUnHEhiyl/fHXhCBs=
X-Received: by 2002:a05:6000:310d:b0:3a5:3b03:3bc6 with SMTP id ffacd0b85a97d-3b911007a82mr729070f8f.28.1754938832133;
        Mon, 11 Aug 2025 12:00:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFhSlMkIt2XZ85mTyNIxX5yeT/WsbII4MET5l/kPnwGJDSFQsCvBR4Sv0f4Njm12y3xRw1vzQ==
X-Received: by 2002:a05:6000:310d:b0:3a5:3b03:3bc6 with SMTP id ffacd0b85a97d-3b911007a82mr729045f8f.28.1754938831710;
        Mon, 11 Aug 2025 12:00:31 -0700 (PDT)
Received: from thinky (ip-217-030-074-039.aim-net.cz. [217.30.74.39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-458b866392csm232787035e9.2.2025.08.11.12.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 12:00:31 -0700 (PDT)
Date: Mon, 11 Aug 2025 21:00:29 +0200
From: Andrey Albershteyn <aalbersh@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Cc: fsverity@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
	linux-xfs@vger.kernel.org, david@fromorbit.com, djwong@kernel.org, ebiggers@kernel.org, 
	Andrey Albershteyn <aalbersh@kernel.org>
Subject: Re: [PATCH RFC 14/29] xfs: add attribute type for fs-verity
Message-ID: <je3ryqpl3dyryplaxt6a5h6vtvsa2tpemfzraofultyfccr4a4@mftein7jfwmt>
References: <20250728-fsverity-v1-0-9e5443af0e34@kernel.org>
 <20250728-fsverity-v1-14-9e5443af0e34@kernel.org>
 <20250811115023.GD8969@lst.de>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20250811115023.GD8969@lst.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: YGoUIa_DHyYJC6NQunh_SNAScJBU_4aMPJsPhSEFv3g_1754938832
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2025-08-11 13:50:23, Christoph Hellwig wrote:
> On Mon, Jul 28, 2025 at 10:30:18PM +0200, Andrey Albershteyn wrote:
> > From: Andrey Albershteyn <aalbersh@redhat.com>
> > 
> > The fsverity descriptor is stored in the extended attributes of the
> > inode. Add new attribute type for fs-verity metadata. Add
> > XFS_ATTR_INTERNAL_MASK to skip parent pointer and fs-verity attributes
> > as those are only for internal use. While we're at it add a few comments
> > in relevant places that internally visible attributes are not suppose to
> > be handled via interface defined in xfs_xattr.c.
> 
> So ext4 and other seems to place the descriptor just before the verity
> data.  What is the benefit of an attr?
> 

Mostly because it was already implemented. But looking for benefits,
attr can be inode LOCAL so a bit of saved space? Also, seems like a
better interface than to look at a magic offset

-- 
- Andrey

