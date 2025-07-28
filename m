Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A5128504B
	for <fsverity@lists.linux.dev>; Mon, 28 Jul 2025 20:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753734715; cv=none; b=txx3L803DyZrXHKerF/ZM26N7Q4nvdIXe5H68nkQM/YymEZIVJRmXvmPIIZV42L/1VXEnZmXpA3/ucdNqK10Aqqcbhj0GEm5aoIgylmnIzE/wuEDsy+yicByE5Q+P2xjLe7tkCwwnGuUwXaTwW20CMEU/Ap8z/gubVISP52ivGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753734715; c=relaxed/simple;
	bh=XZog9aZiyfgLoq7Tkao+LQWKyegfQweHS6lu6myBM8g=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=GnzsCnxOodhJJ0vMWMUI7woImzf6Nfr2ESQkKJEXFOSrJZLWOoRF8a0Y3WepYHR2dAVgLTn8JElH8EYkLf+J/dgsAUEzTJXQkOyxDsjWRbGmwCyMNLN+jL8PPJQcRTTr0HLsI5ah959vxiTFTbpO3x+eR37S5C58sU8Izdvw0kY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eSma5KuA; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eSma5KuA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753734713;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gH0Lip9xmhyDI76+rRDc64g7XoAkacubf8KpRqwbwBI=;
	b=eSma5KuAEr7UnOFVZ7mIcDRc7A5hflUsFIzvtaBh+MYTNB7XH/OEG6CovzsM1cgddLWhoP
	Dp9KNShO+Utuuxxl30cj0ORbxYpA8t0lk0q5+EtxW2kn1vvmjT//hEIfbskkOOYqwu58/3
	/Hsqaesm3MI/foeHh2aFAj5fJmdajIU=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-64-KedQMSDINu2ryj2LeoL0-g-1; Mon, 28 Jul 2025 16:31:52 -0400
X-MC-Unique: KedQMSDINu2ryj2LeoL0-g-1
X-Mimecast-MFC-AGG-ID: KedQMSDINu2ryj2LeoL0-g_1753734711
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-612b6aa7ed2so4639701a12.0
        for <fsverity@lists.linux.dev>; Mon, 28 Jul 2025 13:31:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753734711; x=1754339511;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gH0Lip9xmhyDI76+rRDc64g7XoAkacubf8KpRqwbwBI=;
        b=eaH3AOwgLslEzERatrO1GTWycXDcIJwopTvUzM/efPIPzLDbttXkOBl+ATCXcqZnfF
         KL7CL0tvmxn8aaz+Pjgoa2YIwugqVRMj8sIQBasyz2k5FlktIbMrrGqliiLNcbtSr99G
         wLDcwVxyA8SDofk+zuCyia+ISkemanBVWbqL7LwWbx7Vp/YIya6U7inTP8HrqD/xvakq
         pbq1RHs1hZIJHmctbb8WW9GJ6+HAMhowTIOy1wuXpBSqQIWiOEBgTZgSIj5iG77l/XtZ
         fyzx30qkNDfYm1Ufv6+WvXsChLVMsgVlY0eL/UI7xo3rGM/Et2lBH9b9lxtzTuhF/BW8
         Opjg==
X-Gm-Message-State: AOJu0YzRwEKKyiYLFrSHb5mQ2n1b5mbMKyHzGZAwfrnkERva+uwF+ilN
	odi31tUfudp2J/KXIeTrEO5+BXSCKz50d4viVAs6muAlSZ4CPLGiNcGLs4OJm/v28jwW7VE9FI9
	oEXA6NGAzkyg+671R81ND4uOjDzuQhgdEivD0V4D80ESuxQht3JdnvE4iyHw=
X-Gm-Gg: ASbGncti7dNUaZWyersvDHxkQT8oM9cpTRQ/9GmdLO7Qhv/dfT8CwT+y6sARP49sUlz
	AM4p+ckcAJV8i96Zih0I1uaS/y4s88A+SZPOq0H70pNqASg51Fbfr8FJ17e18xuJ0NEzRfqcH+T
	gYOcqZa86nPND3fSCAnxoTe1JRbIStXpBnKmERga2wXxTL4i2I7UtKMNgNavvscuNhKv/9Jg9mM
	OUo/Vhr7AmNDHE48qVPIhYyPNBQQoylhrtRR+5uRjgNn4E0JjfFTp+As5ieA1SxjLifLNlF3q9b
	SzvPb6XteFsU+kuWC70OiFW+S9t8IQsji8yyeAIDxaUI+g==
X-Received: by 2002:a05:6402:2756:b0:609:d491:8d7c with SMTP id 4fb4d7f45d1cf-614f1f66f87mr11976067a12.33.1753734710734;
        Mon, 28 Jul 2025 13:31:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHI3KbTQXSSj5d0i+WPVKT4xKWHTGAUK9qnZRk/deHjUofLu4acifg7ReKqkBwYsZpz0medqQ==
X-Received: by 2002:a05:6402:2756:b0:609:d491:8d7c with SMTP id 4fb4d7f45d1cf-614f1f66f87mr11976045a12.33.1753734710264;
        Mon, 28 Jul 2025 13:31:50 -0700 (PDT)
Received: from [127.0.0.2] (ip-217-030-074-039.aim-net.cz. [217.30.74.39])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615226558d3sm2730656a12.45.2025.07.28.13.31.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 13:31:49 -0700 (PDT)
From: Andrey Albershteyn <aalbersh@redhat.com>
X-Google-Original-From: Andrey Albershteyn <aalbersh@kernel.org>
Date: Mon, 28 Jul 2025 22:30:33 +0200
Subject: [PATCH RFC 29/29] xfs: enable ro-compat fs-verity flag
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <20250728-fsverity-v1-29-9e5443af0e34@kernel.org>
References: <20250728-fsverity-v1-0-9e5443af0e34@kernel.org>
In-Reply-To: <20250728-fsverity-v1-0-9e5443af0e34@kernel.org>
To: fsverity@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
 linux-xfs@vger.kernel.org, david@fromorbit.com, djwong@kernel.org, 
 ebiggers@kernel.org, hch@lst.de
Cc: Andrey Albershteyn <aalbersh@redhat.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1038; i=aalbersh@kernel.org;
 h=from:subject:message-id; bh=/S+exzUxtYfMmpJRCWmXU4e4VlkdT3KBsUDTnMS5dHE=;
 b=owJ4nJvAy8zAJea2/JXEGuOHHIyn1ZIYMtrvSdbUMs6aPjvsoGNA8Cp/k1aH29nLGDmvrs7ZN
 vW67AK+rdwdpSwMYlwMsmKKLOuktaYmFUnlHzGokYeZw8oEMoSBi1MAJiI/keG/R+3FQz9ndnRe
 eGTkurXGke/IjlchefdnNWj3KQTMbH4Ux/A/KWgHS3vJ+Se8VZ/9Ele9Dk4J8Zhrvkmz696230+
 KO+vZAAuSSbM=
X-Developer-Key: i=aalbersh@kernel.org; a=openpgp;
 fpr=AE1B2A9562721A6FC4307C1F46A7EA18AC33E108
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: tY7Es0RuMTT5_7Ih6GdIaFfRayU2hTI43gavxA4YS-I_1753734711
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

From: Andrey Albershteyn <aalbersh@redhat.com>

Finalize fs-verity integration in XFS by making kernel fs-verity
aware with ro-compat flag.

Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
Reviewed-by: Darrick J. Wong <djwong@kernel.org>
[djwong: add spaces]
Signed-off-by: Darrick J. Wong <djwong@kernel.org>
---
 fs/xfs/libxfs/xfs_format.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/fs/xfs/libxfs/xfs_format.h b/fs/xfs/libxfs/xfs_format.h
index 1cd9106d852b..b61dccf8cc38 100644
--- a/fs/xfs/libxfs/xfs_format.h
+++ b/fs/xfs/libxfs/xfs_format.h
@@ -378,8 +378,9 @@ xfs_sb_has_compat_feature(
 #define XFS_SB_FEAT_RO_COMPAT_ALL \
 		(XFS_SB_FEAT_RO_COMPAT_FINOBT | \
 		 XFS_SB_FEAT_RO_COMPAT_RMAPBT | \
-		 XFS_SB_FEAT_RO_COMPAT_REFLINK| \
-		 XFS_SB_FEAT_RO_COMPAT_INOBTCNT)
+		 XFS_SB_FEAT_RO_COMPAT_REFLINK | \
+		 XFS_SB_FEAT_RO_COMPAT_INOBTCNT | \
+		 XFS_SB_FEAT_RO_COMPAT_VERITY)
 #define XFS_SB_FEAT_RO_COMPAT_UNKNOWN	~XFS_SB_FEAT_RO_COMPAT_ALL
 static inline bool
 xfs_sb_has_ro_compat_feature(

-- 
2.50.0

