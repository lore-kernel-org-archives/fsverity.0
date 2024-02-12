Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AEFD3FB1E
	for <fsverity@lists.linux.dev>; Mon, 12 Feb 2024 17:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707757223; cv=none; b=MqRzZbsBQ9KPQMFk6VrVKaiwck9tIdMzSifjXb/h/cMZz8b7UO4c833aoyQf0gCtSK9M3xdQ1R4O2j8LOXPAp7uFL5HBimhyLGantm6GuD2+pz94rBVAZjPK9B2GfmZ+eeVWmnyf/hXoF2KuBQkOgMkkmwgwLMmOaAAeHlVbd2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707757223; c=relaxed/simple;
	bh=vdHiY+5n22LurY8Opd20329Jh2sRmadcybRUqQPyIPs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UymugsEeYpX3j5unVJmcPB48t0/mygm/1FaRcxYY93E030oAm+/pydzKJja9MomM2ZKHo3u5VkSgVMycHzeBcDjrx6nlMN0th0ps81ccT+qNSJK2lkYRQ4WUWVXzc8FP8nTf9gRToh1f9WaVHM3HzBLeBtDZ+UrBmEWcldvK91I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ap0e/sTk; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ap0e/sTk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707757221;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dJCZCHIXGjyZyLUGP8rE/I4QvbwAG0uLO2o/5Ew8lzA=;
	b=ap0e/sTk7myeRYV3c5Cn29+802yQ36dc9mWtSLpOcg1HkNo5Ivg+KajmPMdub6fL5Xw2JV
	J5fwTlcUCblSyLlE+xk7E6S242HqxSPouHJfCRzXUvmMxmTVaQeShFTQan1d/atUl0pSk1
	AQeUNEVMGVLsh2ijN7Yf5ZkY699MkHk=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-568-kagy7WpWMVajollX8Mg0OA-1; Mon, 12 Feb 2024 12:00:20 -0500
X-MC-Unique: kagy7WpWMVajollX8Mg0OA-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-55ffcfed2ffso4899509a12.0
        for <fsverity@lists.linux.dev>; Mon, 12 Feb 2024 09:00:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707757218; x=1708362018;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dJCZCHIXGjyZyLUGP8rE/I4QvbwAG0uLO2o/5Ew8lzA=;
        b=flsw12VsqJtax042UQngljrxI3VPh2w4X9aBZjDpMeqEP6ylmX1rMLd24sSj9AGgHb
         bqFQJEEWX4+XryLRyZZu6iGlOaDV8WQSAvoFQ7Y3YI4iw7fxQLreBjHFYKArIOwXQtl4
         QaLz2a+Z0xmw6gDoQTd2EDSngN383rIsy/AnZ7T/o4AGLVclSCkGeQFJQ7mdFo+TXIue
         FolcyV0lhBVKO5NFrHItC4RlVSzknjkXf3X/u5MT8PPwtt2vHhKaIGAoeCsFjPitJCvq
         Ocl1OmZXWqPJg9qnjxyaDmmo3ctZSf6LDKo9q5rpS1nwzTUTVxucTeYETq5DG7B1jKkH
         6hKw==
X-Gm-Message-State: AOJu0YyJF0SV2o/zQeJ8n/lotBIE0uuOIdTAl9DVMPDuQ10wnd/0+flX
	J68WLPGYZ/uN4ezcq13uZOCIr4jTTB1aPdlr0KVqXdfyhJlWcOvuoPPKe1WEZux/GyJwUOkmIkV
	UvkpoZGKglCdpIxmaF9Rf6c1Ph/5wIoRNRrnPPoWA6K15T6ax81i0hj41G2FIWl4u+C9q7ZbrKh
	VOKman24b0SZbPobvV41MPL+fLZqks2ttYyeEI7H8=
X-Received: by 2002:a05:6402:194b:b0:55f:d6b9:245f with SMTP id f11-20020a056402194b00b0055fd6b9245fmr81620edz.6.1707757218658;
        Mon, 12 Feb 2024 09:00:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEu9oz4kqazMkidIDc3OUaR2AIuDA+GdBkSrnXsXdYN1B/OVQMbeN2XlXF0/dFPIuNCyt2esg==
X-Received: by 2002:a05:6402:194b:b0:55f:d6b9:245f with SMTP id f11-20020a056402194b00b0055fd6b9245fmr81598edz.6.1707757218421;
        Mon, 12 Feb 2024 09:00:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX8qHo9KFTFqx7ffS+BaQUSAi3Ftf56a5RyK3q9a4EYYj9+86aRggYimde3QhhRm33PiYHGgj7kNkzhhEsugmBNpWsi1icmAgylRr/h8p1RapPYuLxTDAlrSRUjc60PQto5qCyrEP3V2pzQKbUURXsWdrlcSV9NVR3+GoKHqeQKhrkIlIb0ivzRDOeqUhRshgvoZj3vznkzGwz47of+OthOjOLnc7ISms8s
Received: from thinky.redhat.com ([109.183.6.197])
        by smtp.gmail.com with ESMTPSA id 14-20020a0564021f4e00b0056176e95a88sm2620261edz.32.2024.02.12.09.00.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 09:00:17 -0800 (PST)
From: Andrey Albershteyn <aalbersh@redhat.com>
To: fsverity@lists.linux.dev,
	linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	chandan.babu@oracle.com,
	djwong@kernel.org,
	ebiggers@kernel.org
Cc: Andrey Albershteyn <aalbersh@redhat.com>
Subject: [PATCH v4 20/25] xfs: don't allow to enable DAX on fs-verity sealsed inode
Date: Mon, 12 Feb 2024 17:58:17 +0100
Message-Id: <20240212165821.1901300-21-aalbersh@redhat.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240212165821.1901300-1-aalbersh@redhat.com>
References: <20240212165821.1901300-1-aalbersh@redhat.com>
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
index 8972274b8bc0..4cf6b317d018 100644
--- a/fs/xfs/xfs_iops.c
+++ b/fs/xfs/xfs_iops.c
@@ -1214,6 +1214,8 @@ xfs_inode_should_enable_dax(
 		return false;
 	if (!xfs_inode_supports_dax(ip))
 		return false;
+	if (ip->i_diflags2 & XFS_DIFLAG2_VERITY)
+		return false;
 	if (xfs_has_dax_always(ip->i_mount))
 		return true;
 	if (ip->i_diflags2 & XFS_DIFLAG2_DAX)
-- 
2.42.0

