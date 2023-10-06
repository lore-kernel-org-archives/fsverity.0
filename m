Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C955138F99
	for <fsverity@lists.linux.dev>; Fri,  6 Oct 2023 18:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LLREg3PY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1696618364;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Bq+G/SWzJbNXPr4q3ksgk2vbn5f43WMbMxlAhTulQsg=;
	b=LLREg3PYvNwBiUpEQizvPKVaU4jZsbzLXr1Rg1SYH3T73auqOnHs9HPj6TuL+Hb03jp8g5
	3yzVO6nHkw+QSPDuFxPh5GaB6BpFyKuQsHgOhqSMihufxYRM30OhiICKq5er6Q5VlsPNY4
	j0Cp6JIZ0lNJu+n7u2gEWt/FPzkG/DU=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-279-2VXmezjVMkuR6KtH8YxFrQ-1; Fri, 06 Oct 2023 14:52:43 -0400
X-MC-Unique: 2VXmezjVMkuR6KtH8YxFrQ-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-9b65c46bca8so208417166b.1
        for <fsverity@lists.linux.dev>; Fri, 06 Oct 2023 11:52:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696618362; x=1697223162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bq+G/SWzJbNXPr4q3ksgk2vbn5f43WMbMxlAhTulQsg=;
        b=YOlESnQdu6ZlOxhUl5v0KhjIs9y7R5xmc8UFGBzCkhZWPW9VUR2k7geM5kGCSHPpKm
         uf8F1G5LG55ooYFXxTIve7yLeN8I0I4zczhZCoQVblfWini6wpXbWbDilsWAODHewljx
         gR5Pr44zLlG20W4t92256Z7/usimeueuEAsnX2HUSMSu7fSllmY+CJ38z9FnkjdE5dF9
         IMMBMI0Zkf+P1vNJtcdV5YpJsbdjFRC5lpMM+vCYCCvVNGeTMikYkS0GIf0CHFmVb8nP
         2qyYAbcpqxtnB24D/UttS1OEvXJ4VIRXyH/PEpV+wUM3ZJnHgzXkrRoeE3gkxYxKR6Tc
         6rNw==
X-Gm-Message-State: AOJu0Yz3O6i+mf59FK0eRtrzO29oWpmgwSGKO0QttZrrrXYSB7EgA+Cc
	uvh24DU1GW8gMKRtXH0ohuiqiVPL4hv3kvOuEyX5p7AfBuuOhcIqy4sJMcMX4j/aLAMGnET36a6
	G0QHJtaRgvdSYb//WdA==
X-Received: by 2002:a17:906:768e:b0:9ae:729c:f651 with SMTP id o14-20020a170906768e00b009ae729cf651mr7909059ejm.17.1696618362723;
        Fri, 06 Oct 2023 11:52:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEJNFgKdzEHOeVvd+3tQl9Cob5IB9hO5jTuzm4AjNObs8WxdVcJlwftDSDxj9DkgztYQ4iC7A==
X-Received: by 2002:a17:906:768e:b0:9ae:729c:f651 with SMTP id o14-20020a170906768e00b009ae729cf651mr7909049ejm.17.1696618362520;
        Fri, 06 Oct 2023 11:52:42 -0700 (PDT)
Received: from localhost.localdomain ([109.183.6.197])
        by smtp.gmail.com with ESMTPSA id os5-20020a170906af6500b009b947f81c4asm3304741ejb.155.2023.10.06.11.52.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 11:52:42 -0700 (PDT)
From: Andrey Albershteyn <aalbersh@redhat.com>
To: linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	fsverity@lists.linux.dev
Cc: djwong@kernel.org,
	ebiggers@kernel.org,
	david@fromorbit.com,
	dchinner@redhat.com,
	Andrey Albershteyn <aalbersh@redhat.com>
Subject: [PATCH v3 26/28] xfs: make scrub aware of verity dinode flag
Date: Fri,  6 Oct 2023 20:49:20 +0200
Message-Id: <20231006184922.252188-27-aalbersh@redhat.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231006184922.252188-1-aalbersh@redhat.com>
References: <20231006184922.252188-1-aalbersh@redhat.com>
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

fs-verity adds new inode flag which causes scrub to fail as it is
not yet known.

Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
---
 fs/xfs/scrub/attr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/xfs/scrub/attr.c b/fs/xfs/scrub/attr.c
index f35144704395..b4f0ba45a092 100644
--- a/fs/xfs/scrub/attr.c
+++ b/fs/xfs/scrub/attr.c
@@ -494,7 +494,7 @@ xchk_xattr_rec(
 	/* Retrieve the entry and check it. */
 	hash = be32_to_cpu(ent->hashval);
 	badflags = ~(XFS_ATTR_LOCAL | XFS_ATTR_ROOT | XFS_ATTR_SECURE |
-			XFS_ATTR_INCOMPLETE | XFS_ATTR_PARENT);
+			XFS_ATTR_INCOMPLETE | XFS_ATTR_PARENT | XFS_ATTR_VERITY);
 	if ((ent->flags & badflags) != 0)
 		xchk_da_set_corrupt(ds, level);
 	if (ent->flags & XFS_ATTR_LOCAL) {
-- 
2.40.1

