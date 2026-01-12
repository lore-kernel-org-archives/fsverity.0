Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC85C2D46CE
	for <fsverity@lists.linux.dev>; Mon, 12 Jan 2026 14:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768229462; cv=none; b=ikD9Z2pBheMTojff66w2zLjWfrqlupBlwBb2N4X56+DBw2WETIG6sAGnB7pJYVqFKkE/7t06TaGm7Q7kkBmjcc+o++wY4nXSH/ilMZdV0s5Cu4b50luMfJju/Ymz3/HPiBpiaZFh/lErjs/CzcIltJ84FvPDDZ4OZe5whXA7qFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768229462; c=relaxed/simple;
	bh=yWqqnqyEHVCP+GfyyAPeDyvO4XQXeMSaifR3DHZygFE=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=E+r84/XYrZvUAq1ZwVDShkTggNQhdtPS/8tsBlzeDNdxTYFeG6JD0Esg7frjMXJ97DF8tyI4/0nFwKS718pocl7siDzL2e5bDj76Zl9uKX1hMQ60A3bW7VdndkP/o8mPxFsDjDuDxdHdPjTvqeWelmKu+q4FNfoZvVEdwDZrQ58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NR7MOrnU; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NR7MOrnU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768229460;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/8i7Y45C1rUzQ3Pho8pbs3bPeHebh5bCEthructqQBM=;
	b=NR7MOrnUx1bdGohKn4zbXSOSZn5vgMtklFFHs66f+YzT//QuQZL/lc21zaWTPg2yoayO71
	cZtGaT72mlP6Plh6IdhG73NbQZ7zhxexD/NDZYsQJt8sqoujcf2uphnYIwPpTAc+zFYhMU
	NLJaJLAHEB+VAwgqrzeJ/BwKwk6EkII=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-604-GZ19yMoZP_O6w073WasGIw-1; Mon, 12 Jan 2026 09:50:59 -0500
X-MC-Unique: GZ19yMoZP_O6w073WasGIw-1
X-Mimecast-MFC-AGG-ID: GZ19yMoZP_O6w073WasGIw_1768229458
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-b87039c9a43so170483666b.1
        for <fsverity@lists.linux.dev>; Mon, 12 Jan 2026 06:50:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768229457; x=1768834257;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/8i7Y45C1rUzQ3Pho8pbs3bPeHebh5bCEthructqQBM=;
        b=RoZvJfnrWDV9ukFoezLMN20uy6oe9Ly5Yzh5QarAeFqfT5VfaUQ6CBYEMFQm3O2I3y
         9VFAejid8ZdHVHmEihOITdidT2GAlwHXyMeMs/Ynv9/Tz/CLJ+HA4Fv7AD2zF+4bQVMq
         bW8RmbHFAQW9CdvVNEjDPglDjE2zWpEL52uEpVwoEliIJX1P695CRihg58ebq/CUtCOh
         HPYj9T5ccM9YHy9wsF30pfxPE8YUyJFsMSRPy/G3TT7YjbhBtkxI6YXo5+UO0R83yruE
         oVt4S56eLO3R2WwRiyCcZ0Wb+B0Nf4eiyAtZpuxn/3eF2hy1BRLZtdsVWv3dAgz8/Qdo
         0A3Q==
X-Gm-Message-State: AOJu0YzxYDHNyMrD4DQd7rGvNrZIOIiC1rHd//XjoEoes7YnJzZG/d1g
	3Pp3kmQ4IWI+c7DG7D4Z7K3fTs6m9xgi3HTSeyeUhmCSY48L/MdmUWtkV9VnNGN2itC6rHc7RNm
	JMCeOQGPLUAyd8zwpFZTxJJh0idytFz41I8HlAZIqwRV2cRdYlegLHUDHnDQiGF8InijijBrMEB
	h9i+IU/8SGSBqvAujkuuEC2gVo2FCJHZYW0s33SrnQ1a8=
X-Gm-Gg: AY/fxX5v1rZti0OWC5m9vnOEO0AufXmYgrnDmus/8r4y8vZRs1wstkhboMtaGadzFvf
	3ALp+z+9y+wLX3a1i8jTL/NTT9Ag49DoAH7H3XSlGRYihUX3rF8KlDcJpeYnlKDfM9T3Iqgvyyu
	Qo1JVUiAsHkMn6APGHxVO6MzUzkqg+SHuyrpHQNlMHz7Nu94Ein1EXNTSbu6d2zSYZJTRCmz01e
	QIpK3We/L4AmRVBF/6WrSXafb2UVQHOxgfRxiQ4ni7bJ+5iYJNMGgZUtLymDwSQnAXlCKpnSOcy
	6JfY49Js3wuaobKo02EduGh4UKDurrZOerWM8/RsBgQ/sRLtkj+fzIfaZK8BFqzpUefbcBzEA2k
	=
X-Received: by 2002:a17:907:d11:b0:b87:19ac:98ce with SMTP id a640c23a62f3a-b8719ac9ba6mr340671166b.4.1768229457299;
        Mon, 12 Jan 2026 06:50:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGodEgWaGnO/BinsgSPFbBzgONiFVWuueEar/8j4zEvL7xMhaUYrOMxjKwwTSCT4wC7a0hARQ==
X-Received: by 2002:a17:907:d11:b0:b87:19ac:98ce with SMTP id a640c23a62f3a-b8719ac9ba6mr340667066b.4.1768229456659;
        Mon, 12 Jan 2026 06:50:56 -0800 (PST)
Received: from thinky ([217.30.74.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8715d0e99asm388258666b.51.2026.01.12.06.50.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 06:50:56 -0800 (PST)
From: Andrey Albershteyn <aalbersh@redhat.com>
X-Google-Original-From: Andrey Albershteyn <aalbersh@kernel.org>
Date: Mon, 12 Jan 2026 15:50:55 +0100
To: fsverity@lists.linux.dev, linux-xfs@vger.kernel.org, 
	ebiggers@kernel.org, linux-fsdevel@vger.kernel.org, aalbersh@kernel.org, 
	aalbersh@redhat.com, djwong@kernel.org
Cc: djwong@kernel.org, david@fromorbit.com, hch@lst.de
Subject: [PATCH v2 9/22] xfs: don't allow to enable DAX on fs-verity sealed
 inode
Message-ID: <osfyixw77gnssemtxreoziyumsdstic4xgm6k6c5hp7v2nj4x6@ypfnx6seiaps>
References: <cover.1768229271.patch-series@thinky>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <cover.1768229271.patch-series@thinky>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: LBinezXNe8wRUlQRvhHpSGRfzfK6Xa8hDU4RcDBlafs_1768229458
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

fs-verity doesn't support DAX. Forbid filesystem to enable DAX on
inodes which already have fs-verity enabled. The opposite is checked
when fs-verity is enabled, it won't be enabled if DAX is.

Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org>
Reviewed-by: Darrick J. Wong <djwong@kernel.org>
[djwong: fix typo in subject]
Signed-off-by: Darrick J. Wong <djwong@kernel.org>
---
 fs/xfs/xfs_iops.c | 2 ++
 1 file changed, 2 insertions(+), 0 deletions(-)

diff --git a/fs/xfs/xfs_iops.c b/fs/xfs/xfs_iops.c
index 6b8e4e87ab..44c6161137 100644
--- a/fs/xfs/xfs_iops.c
+++ b/fs/xfs/xfs_iops.c
@@ -1366,6 +1366,8 @@
 		return false;
 	if (!xfs_inode_supports_dax(ip))
 		return false;
+	if (ip->i_diflags2 & XFS_DIFLAG2_VERITY)
+		return false;
 	if (xfs_has_dax_always(ip->i_mount))
 		return true;
 	if (ip->i_diflags2 & XFS_DIFLAG2_DAX)

-- 
- Andrey

