Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 966ADBA3F
	for <fsverity@lists.linux.dev>; Tue,  4 Apr 2023 14:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680620146;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FFUi+70wiITyeuozy7B4Yd/jMxRAxWPn5c55TeHG694=;
	b=OiK9wBa4sW6wqjHIU+o1uTWpnqhAWSs5TmYAN5zmY7kqMJzvmhBksczKOYJAChrniyT6XN
	Ec/b0UdF2gSO18qRnyVD5GvwAn9Qf+48gVmMgrWP/gujUPVLeCA7SHA9dpBwUxeme6PMRv
	e9qkOyWge1RGGEMzT70cQfuOsy+Y3CU=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-491-CvXy3d97MVqMYGMPtm4gUA-1; Tue, 04 Apr 2023 10:55:41 -0400
X-MC-Unique: CvXy3d97MVqMYGMPtm4gUA-1
Received: by mail-qt1-f198.google.com with SMTP id u22-20020a05622a011600b003dfd61e8594so22278556qtw.15
        for <fsverity@lists.linux.dev>; Tue, 04 Apr 2023 07:55:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680620140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FFUi+70wiITyeuozy7B4Yd/jMxRAxWPn5c55TeHG694=;
        b=HAYeGVhudi7qWacZviVu3vYcVdh4cykAsQxSpXwq6DesmBmcy86QPjY6poSgUqbBg1
         LhlYXqE4bSPWb6ykyVu3Vj0BeI2Ce1uJlXT76nbyND0pyvxlH4VmY43ZI3iRT7hYyuga
         VFg0XMgG8U71T05kxO7tRW5zIPYIVPUddGrDM01MDmss3c7/6B+buk5CCQPNOKbIMfiK
         0AE/qUy66iutebeXOxZkl+E4TcId+8q8ar7BbfwUaYXRMHUajoEfX+35jqR58Ujlltg8
         Osh6SoR5o8cb90PTj4mqP4FgGiGG/tepTYBVjGaVrKjUrmOEnob5gfjD+1pRgjAUOI3d
         8NeQ==
X-Gm-Message-State: AAQBX9fBq2wbxzsvKMDikvV0fFrxHLtna8uqvALzZEjjJa+VTDNWJIly
	q+tyVYtkWO/bpqNVTdqvNNXT9lWD7G+O3PUV00X+afodx8krITTHPWZA+qfQSvpiBKz0ITZHa6b
	8WKRSFEwRCNTEMPIROw==
X-Received: by 2002:a05:622a:199f:b0:3e3:913c:1ca8 with SMTP id u31-20020a05622a199f00b003e3913c1ca8mr4130745qtc.22.1680620140348;
        Tue, 04 Apr 2023 07:55:40 -0700 (PDT)
X-Google-Smtp-Source: AKy350Zzc10/1v2LcCE0zfPnbg3x+8dh54gKx1zJb5SpW17zpBOCvtCa2VKQbBuo0E40V5nvMeZ6aQ==
X-Received: by 2002:a05:622a:199f:b0:3e3:913c:1ca8 with SMTP id u31-20020a05622a199f00b003e3913c1ca8mr4130703qtc.22.1680620139945;
        Tue, 04 Apr 2023 07:55:39 -0700 (PDT)
Received: from aalbersh.remote.csb ([109.183.6.197])
        by smtp.gmail.com with ESMTPSA id j4-20020ac86644000000b003e6387431dcsm3296539qtp.7.2023.04.04.07.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 07:55:39 -0700 (PDT)
From: Andrey Albershteyn <aalbersh@redhat.com>
To: djwong@kernel.org,
	dchinner@redhat.com,
	ebiggers@kernel.org,
	hch@infradead.org,
	linux-xfs@vger.kernel.org,
	fsverity@lists.linux.dev
Cc: rpeterso@redhat.com,
	agruenba@redhat.com,
	xiang@kernel.org,
	chao@kernel.org,
	damien.lemoal@opensource.wdc.com,
	jth@kernel.org,
	linux-erofs@lists.ozlabs.org,
	linux-btrfs@vger.kernel.org,
	linux-ext4@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	cluster-devel@redhat.com,
	Andrey Albershteyn <aalbersh@redhat.com>
Subject: [PATCH v2 18/23] xfs: don't allow to enable DAX on fs-verity sealsed inode
Date: Tue,  4 Apr 2023 16:53:14 +0200
Message-Id: <20230404145319.2057051-19-aalbersh@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230404145319.2057051-1-aalbersh@redhat.com>
References: <20230404145319.2057051-1-aalbersh@redhat.com>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

fs-verity doesn't support DAX. Forbid filesystem to enable DAX on
inodes which already have fs-verity enabled. The opposite is checked
when fs-verity is enabled, it won't be enabled if DAX is.

Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
---
 fs/xfs/xfs_iops.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/xfs/xfs_iops.c b/fs/xfs/xfs_iops.c
index 5398be75a76a..e0d7107a9ba1 100644
--- a/fs/xfs/xfs_iops.c
+++ b/fs/xfs/xfs_iops.c
@@ -1204,6 +1204,8 @@ xfs_inode_should_enable_dax(
 		return false;
 	if (!xfs_inode_supports_dax(ip))
 		return false;
+	if (ip->i_diflags2 & XFS_DIFLAG2_VERITY)
+		return false;
 	if (xfs_has_dax_always(ip->i_mount))
 		return true;
 	if (ip->i_diflags2 & XFS_DIFLAG2_DAX)
-- 
2.38.4

