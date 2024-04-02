Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A541E58AAF
	for <fsverity@lists.linux.dev>; Tue,  2 Apr 2024 10:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712052574; cv=none; b=RuZ7kEX6RVFU5pxtPJ9yLgbnBgSdWWhBEYU0WraiUR8Cb1NdrF8eizTKVf+PvlfeSQlFicQU2qXlG/Dwv3ojp4LEXHEJwRKD5QpzAs0GcGJ9WKFoid//+xrTm5IDTGoSDOiyQY6J5oDka1H2v7L3q+myT20JXTUPBLeXsM6HS7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712052574; c=relaxed/simple;
	bh=OU9f/oHdpSv5so4XxuOO4NXfr+ACnzAx5W/5jBZ/xW8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=s9nCDDTC0ngLfGp8mpNPELvGrawF5arzse/a/wYPeWozwL13wiJMjufYuU9k8jTqOaomMVSfLHMa6eKYtxlB3i0GI6e6MBEXfDKnxoEW5SHI9dgsu/4yWQOKRooUJJtOYyy+iGuHJ0+MyetMXUXul/wZfR8ATeOaLTUF2AlKFsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Uj1t0NZV; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Uj1t0NZV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712052571;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Y2bp0ENkGdxs60VdgrG/Ao+HASiC17rsYdOAl+5ioPU=;
	b=Uj1t0NZVCzyOACj12i04yK0VfEfK8bVY2DbYTWDClepOy5YaoQ0aXMN9ixxZjn1tOMVT0B
	6Sf6E/Tr5KLnM+sCI+gF5rnyPkPU+By3orv8lm70Vl8vm4VOJJhpO22YoVxZifwwKquCx6
	tTwXaJKzd5WlwWcdWByOefyQSwOgb2k=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-358-pkkT8ZmnPiCSAL4msp1nOA-1; Tue, 02 Apr 2024 06:09:30 -0400
X-MC-Unique: pkkT8ZmnPiCSAL4msp1nOA-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-56c0d3514baso2514792a12.0
        for <fsverity@lists.linux.dev>; Tue, 02 Apr 2024 03:09:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712052569; x=1712657369;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y2bp0ENkGdxs60VdgrG/Ao+HASiC17rsYdOAl+5ioPU=;
        b=bua7HIjfLy1SErDnpnPGYZiBKOyn8jGS0KocUTESsqFYn1c/a1MwbgHEzc3Dgdws5m
         XgifQWE13gr6PqAWtlegcP+7WBcz1wmkzBt7Vb00AWbts3UlHBRrDIsYwwnwtiFeTWyq
         nHgvWq+cGH5p4RcePPZj/hBKRl3oy7irnJMiClY6M+XSZbBgm/HRv8ZhjV2Uvr5o5cPg
         4VmCNh8Dxbh7Pd3YWyRbtb69cJzHAbsKR9sip1EIAink0GZbkf5E9MCrvNKkxBLBNc8f
         u9LUHvJkdbjVJsP1qzfdG6abOXnxl74k7TPd35oGIMSsX8Zu8IS9q+oFkIKGvfYchpt6
         9HtQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlCu/T2h1k7ZX3b4P2S2MIGWTGzntGR6UqzCpSMJIdeHcUFM6jBEhwgCAwq3xzHJRsENfbPDOGoZX6ELlSJXoYJ0aJij/akTU=
X-Gm-Message-State: AOJu0YyEB9W0AvR3aHE1wp2jGNHCnLOSYfl3nond/5SPDFDO0US96/ww
	4h0QL7R2PhfVlLLdQ+t+PkdF2zIDVlf1mHPNpq/FXT7sSKwn5yjlS6VQ0M8Igeg6rIQl6NMKZLJ
	ffc8BisWW3+URe9sSLQpuaNt0aUtOWlEfzB/ICkN8vffdmgRl7hDDnyM=
X-Received: by 2002:a50:d7d9:0:b0:568:180a:284b with SMTP id m25-20020a50d7d9000000b00568180a284bmr6072561edj.37.1712052569091;
        Tue, 02 Apr 2024 03:09:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2u/iYin6OUN30jHEOhcY414TrEvqk+AMnddAkYTd2kcCDkV6Z9aKRNEYtCWRv/9yomjo8ZQ==
X-Received: by 2002:a50:d7d9:0:b0:568:180a:284b with SMTP id m25-20020a50d7d9000000b00568180a284bmr6072551edj.37.1712052568633;
        Tue, 02 Apr 2024 03:09:28 -0700 (PDT)
Received: from thinky ([109.183.6.197])
        by smtp.gmail.com with ESMTPSA id n3-20020a50cc43000000b0056bb1b017besm6549855edi.23.2024.04.02.03.09.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 03:09:28 -0700 (PDT)
Date: Tue, 2 Apr 2024 12:09:27 +0200
From: Andrey Albershteyn <aalbersh@redhat.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: ebiggers@kernel.org, linux-xfs@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, fsverity@lists.linux.dev
Subject: Re: [PATCH 02/29] xfs: turn XFS_ATTR3_RMT_BUF_SPACE into a function
Message-ID: <33acelck44533qoui3avtjbehb54rvf2j2opmxhpflf4g3kr22@wkipgjny64yn>
References: <171175868489.1988170.9803938936906955260.stgit@frogsfrogsfrogs>
 <171175868593.1988170.18437361749358268580.stgit@frogsfrogsfrogs>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <171175868593.1988170.18437361749358268580.stgit@frogsfrogsfrogs>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2024-03-29 17:36:35, Darrick J. Wong wrote:
> From: Darrick J. Wong <djwong@kernel.org>
> 
> Turn this into a properly typechecked function, and actually use the
> correct blocksize for extended attributes.  The function cannot be
> static inline because xfsprogs userspace uses it.
> 
> Signed-off-by: Darrick J. Wong <djwong@kernel.org>
> ---
>  fs/xfs/libxfs/xfs_attr_remote.c |   19 ++++++++++++++++---
>  fs/xfs/libxfs/xfs_da_format.h   |    4 +---
>  2 files changed, 17 insertions(+), 6 deletions(-)
> 

Looks good to me:
Reviewed-by: Andrey Albershteyn <aalbersh@redhat.com>

-- 
- Andrey

