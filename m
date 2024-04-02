Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B8FB15ADA0
	for <fsverity@lists.linux.dev>; Tue,  2 Apr 2024 18:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712081103; cv=none; b=hDIRz3vN2X8iWGVq+5ICbbM+2IVfdGy/tTNejn0beSpfQzP0cG47LhdRQtwje8R1FJMYw/R/N8t4b8yDq6tEWI3bS+jVU77+rN0iMZMrQtYJ4epU57AESOC5giUsj17UyT910S/G/lqm86tmmSFRDnlkUI0BBDKMrmCvJJs74f0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712081103; c=relaxed/simple;
	bh=BmvQ+0xao1n5voXSxUVflO7jZ9eSYVUGYxtndPxgVXU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=NZrgyONEjGotUi23dHXX1BAua5sKAQU3dmm9fOMgSVHPvBLFg/LGWNEwvN54BzVybcrevW2XUvqshDPSfp/GzUulDClXi1we9ZGeNsKMfW7gz473GJ6F3VevzHFaiehVcoKJ667bJCJBtuzeRhhhIgQbIazP56XXqHl3JaeArf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cVHfvd/V; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cVHfvd/V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712081101;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QxsmDw4gKSaDCVTh8/y79dF5qk4AA3NIv/V1UZhqWH0=;
	b=cVHfvd/ViI78j9Zycxe8WdtnRxymkB7r/gxYJqYdM2wncZo6q4DmJRIgIcPGHBs128NPwt
	hxex67fBnSD2F2Zqd8EArEX2Nx/YjU6Mj3itsrIyofniPnjHAg1GdZavtF1SsFfAaAqMhJ
	hJk93n2zkQZZIlc+4uTcLkGY5xynOtU=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-130-T14mBHnuM3uYyTC5MV33Ng-1; Tue, 02 Apr 2024 14:04:59 -0400
X-MC-Unique: T14mBHnuM3uYyTC5MV33Ng-1
Received: by mail-lf1-f70.google.com with SMTP id 2adb3069b0e04-515d45b24f3so3466801e87.0
        for <fsverity@lists.linux.dev>; Tue, 02 Apr 2024 11:04:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712081098; x=1712685898;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QxsmDw4gKSaDCVTh8/y79dF5qk4AA3NIv/V1UZhqWH0=;
        b=HlD+5OOIEXQqH8GSUfe16Vmh3w+LUpn8IOPKTrCTal4OqYvBO9ce0Ao0vPVLqiAEiA
         BW0/n4BJCToovOakP0TIhAZqa34MXskgJJHnExni0FqixfLjk8SI8I9Am9CFClhL0zNl
         RTlesjaStGbUNPWCgx5doYAIeg/KMc48dyS1O9nUjsZrBrst6i1xI20JLuegYKzWPfWI
         yabeQRNrw7I4gyE0LB9OUBxsqnzYt8cM1mbErVxzuZTnBGTzyJkhUSNKiWW7/daf8sXM
         cAa36reeD2eW9gv+awXt+3XF7xM/TppO6RCKwL7GhTgkXdO0ZZReDozQE6TyDTMQNZz+
         v5vw==
X-Forwarded-Encrypted: i=1; AJvYcCWnU3HZs/bAUDSOATuGYPi60BbxJm1eci0PBP6z84KYs60o8GWcTAtEdxO8rdaXATO4UF2lrL2Odjaj0sjKk2wsr2D2I7PEkuU=
X-Gm-Message-State: AOJu0YyIeS7koFv9GPJbvJUxlvUNLxjIvy0psdIW+1x8QlB/Q/Q45ZO7
	vaJ1P4hfxJZBMQ7QZJ4/KF2/P+gVRVsuAZMIfszZdmEL2ohb0PlMeYLWDhqJEe1GkerBqbp/8gD
	obYFTwkEFfx3xgyRNX5stiOCX//QYYC4zqfYqMH3R3uruIv+qESp74kA=
X-Received: by 2002:a19:2d4c:0:b0:513:ed0f:36c9 with SMTP id t12-20020a192d4c000000b00513ed0f36c9mr9132288lft.45.1712081097767;
        Tue, 02 Apr 2024 11:04:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFzWp30/35ol9RiIOdC+Dvt7bTyK8WadGPxAm9ZdLb9mGQnaUhhgWBUQWoANMM+1yaQOUy+yQ==
X-Received: by 2002:a19:2d4c:0:b0:513:ed0f:36c9 with SMTP id t12-20020a192d4c000000b00513ed0f36c9mr9132275lft.45.1712081097240;
        Tue, 02 Apr 2024 11:04:57 -0700 (PDT)
Received: from thinky ([109.183.6.197])
        by smtp.gmail.com with ESMTPSA id a17-20020a05640233d100b0056ded9bc62esm886769edc.43.2024.04.02.11.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 11:04:56 -0700 (PDT)
Date: Tue, 2 Apr 2024 20:04:56 +0200
From: Andrey Albershteyn <aalbersh@redhat.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: ebiggers@kernel.org, linux-xfs@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, fsverity@lists.linux.dev
Subject: Re: [PATCH 28/29] xfs: allow verity files to be opened even if the
 fsverity metadata is damaged
Message-ID: <deqh2ho6ra7tahcuczessc336kmsj3ltgsk6jhu34jrbwwkjqg@uvgkpd5kz542>
References: <171175868489.1988170.9803938936906955260.stgit@frogsfrogsfrogs>
 <171175869022.1988170.16501260874882118498.stgit@frogsfrogsfrogs>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <171175869022.1988170.16501260874882118498.stgit@frogsfrogsfrogs>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2024-03-29 17:43:22, Darrick J. Wong wrote:
> From: Darrick J. Wong <djwong@kernel.org>
> 
> There are more things that one can do with an open file descriptor on
> XFS -- query extended attributes, scan for metadata damage, repair
> metadata, etc.  None of this is possible if the fsverity metadata are
> damaged, because that prevents the file from being opened.
> 
> Ignore a selective set of error codes that we know fsverity_file_open to
> return if the verity descriptor is nonsense.
> 
> Signed-off-by: Darrick J. Wong <djwong@kernel.org>
> ---
>  fs/iomap/buffered-io.c |    8 ++++++++
>  fs/xfs/xfs_file.c      |   19 ++++++++++++++++++-
>  2 files changed, 26 insertions(+), 1 deletion(-)
> 
> 

Looks good to me:
Reviewed-by: Andrey Albershteyn <aalbersh@redhat.com>

-- 
- Andrey

