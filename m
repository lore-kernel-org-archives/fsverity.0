Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA498BE5E
	for <fsverity@lists.linux.dev>; Tue,  2 Apr 2024 12:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712061478; cv=none; b=tmvmApwufmr1voPN3tEdW3qLPykClqiEf8sL9K8IFg9DD3zFyHpVlxwKuFwVSkA1HyYXpXkl0NNz4iumznI+e2g8uO9A8W7zsddbN8k2hLB4dtj0DwMjyOfTR+ShI17d9uVaXry0zoq3SLhuB75pMuILK8DCEju2E0f+lekOnHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712061478; c=relaxed/simple;
	bh=mTKiK/bd4B5Snb61jQKfVAlk1Uk8dcd9CCgYlmgpV9I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=kjRbCqK+AOPwlEaiaOpPhwdKAriwMDhKLOaaHtxw/qveXaCDCxLvGWRVljiucQbDqF0T2U/1VoWCLiF0af7TozRBjhjR+dxOICJVsIers+bdNdxKTSgN+sGnc7girZQY8Xj2wszGfpm5Dbb1k9KwCjB3naqMoFxjhosIQHwRb5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WmYZTt7I; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WmYZTt7I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712061474;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=g6k4yhaZw6MRRje/zJwwEymZQjJ1fk5zRXcMKDtCSjQ=;
	b=WmYZTt7IrxcBuuQyxsN7Y4R8kk9S5MIcrws/mU8LZ1LetyivSt8AtjQzz8PAVH6QSV3rel
	aA3ahYl/INOXjTK4jQYPB6JZNamihwasCTBGrfr0IcmDW9qFQTfCGaw4C5AnD/1sbw2YG6
	7vhgyPUVN4mMcRBofNNWFKWB23rgo7Y=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-609-pGcgc_wKNi6QvkbYBA3I-g-1; Tue, 02 Apr 2024 08:37:53 -0400
X-MC-Unique: pGcgc_wKNi6QvkbYBA3I-g-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a4e05cee8faso197742966b.1
        for <fsverity@lists.linux.dev>; Tue, 02 Apr 2024 05:37:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712061472; x=1712666272;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g6k4yhaZw6MRRje/zJwwEymZQjJ1fk5zRXcMKDtCSjQ=;
        b=ZoihK5rMAJPJ++y5xun2WLx5lNGJaQLabiSZN5eH9CNhwNdLIhBbaUXPMZCtJtvsPa
         9RWvcROXMc0qhv+q5LQCWh2oQvV+g/ifpmEhP2OO5fasTj/9np331WzlRvqjyNze+gvG
         ikFJsrozrOFrmu3C/2ZJpYqAhUwN88Mqg1YE49c5cP1ZqmNAhC0URmM8NeI7EmXlEjV+
         /Fm87lFbMoBis4OYjzvUYxSdg49qTyHVteWIiot/H1/gvBnK6Ol/QlG9qu4chW0FmxT/
         74tV27W3qGaipyjurq6BzvU+W75wJA6EeqXdqGxuq+J7m8zNZFegMNjUDfOSESgdGG7h
         lujg==
X-Forwarded-Encrypted: i=1; AJvYcCX/B6EH/eT4REa4C8H+49/SwrfyKpwee98UA/fN5E4xLLb+d/+WgcAnxiY6HBB2PC+Pt4rb9+veRZGkCkveRhIj/cPgd6ON6O0=
X-Gm-Message-State: AOJu0Yzo8QgRywjXqLqNFcu0SC/Ad29tIa40jWurRSFBM1hb8uLUaSBg
	1ch9xCa17kGOh1PxZN0LJjZ288PRN9P8ainAEqvpDHUBg7lEU+e1OOt41kVetE5k1c+gErq+1uB
	RBUhuDA6vk7u/ja6rdLGDDu7jkgVjzldn72RIjuYsaSdjWLgQWjw9Gmw=
X-Received: by 2002:a17:906:f284:b0:a4e:2123:e3c8 with SMTP id gu4-20020a170906f28400b00a4e2123e3c8mr7407272ejb.56.1712061472107;
        Tue, 02 Apr 2024 05:37:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHlEz2I255dOogolt0uIznw+lpBOPt+W1j5C0C+337idh8Agza65YdRH9pPiFHshDM6HSGN3Q==
X-Received: by 2002:a17:906:f284:b0:a4e:2123:e3c8 with SMTP id gu4-20020a170906f28400b00a4e2123e3c8mr7407256ejb.56.1712061471443;
        Tue, 02 Apr 2024 05:37:51 -0700 (PDT)
Received: from thinky ([109.183.6.197])
        by smtp.gmail.com with ESMTPSA id dl5-20020a170907944500b00a4e28b2639asm6003714ejc.209.2024.04.02.05.37.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 05:37:51 -0700 (PDT)
Date: Tue, 2 Apr 2024 14:37:50 +0200
From: Andrey Albershteyn <aalbersh@redhat.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: ebiggers@kernel.org, linux-xfs@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, fsverity@lists.linux.dev
Subject: Re: [PATCH 12/29] xfs: widen flags argument to the xfs_iflags_*
 helpers
Message-ID: <vhk2g3qvkf224oklr57pmdnrjh6odshv62ciqguxcsgbrbplt5@3msropqnuqfa>
References: <171175868489.1988170.9803938936906955260.stgit@frogsfrogsfrogs>
 <171175868758.1988170.13958676356498248164.stgit@frogsfrogsfrogs>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <171175868758.1988170.13958676356498248164.stgit@frogsfrogsfrogs>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2024-03-29 17:39:11, Darrick J. Wong wrote:
> From: Darrick J. Wong <djwong@kernel.org>
> 
> xfs_inode.i_flags is an unsigned long, so make these helpers take that
> as the flags argument instead of unsigned short.  This is needed for the
> next patch.
> 
> Signed-off-by: Darrick J. Wong <djwong@kernel.org>
> ---
>  fs/xfs/xfs_inode.h |   14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> 

Would it also make sense to flip iflags to unsigned long in
xfs_iget_cache_miss()?

Looks good to me:
Reviewed-by: Andrey Albershteyn <aalbersh@redhat.com>

-- 
- Andrey

