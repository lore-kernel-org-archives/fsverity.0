Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 505D97E563
	for <fsverity@lists.linux.dev>; Mon,  4 Mar 2024 19:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709579561; cv=none; b=uwgXsH8xa9vqYca/+9pZ19HpzsbCrA9i9J4HyCYq29DkywYb5+oYgfZv516ZrrIUfQd4Wo5PoukL+f8mhmB6yEQ4Y6z0420Gc1RsIMChgF3pK+WwlQ3z4Cddxwa4B/BVTpHCDInTJ0cjrpOSNoKPiHOcr9/E2lpk/zinKVoSJeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709579561; c=relaxed/simple;
	bh=Vv6pshJlKGTE98xSJNd6Xk8HKI+ZQ4JRPxzDEoR1Lmg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=okx2abQhFe8oPtFSuWZ2gvB7aIIUTrja1nA5QRkCzvZXWy5TVCep3r7+3GVE5Ww1vBXQVmp6duC0uLwLJZEMrZBKsuFlqmnyCEUo3fPwGOkVO3i2g/qC3VsAOLf15kL7H9pK4o39M24az5EN3wDHbIEQG7c85ZpbLIFieo3ghmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jCfvVGi5; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jCfvVGi5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709579559;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZV6cPRqKx5ix6M5gdtJYtyedkYWhw05+92IPp1Ctzuk=;
	b=jCfvVGi5zOBcY8R/yybhoR0da7kfC8Pl8QqUWXfKUHbg8OkK2hJBS5xU8mV0Enf6RcQpVy
	gi7cKYeDYucroVaJhUXjcW4vMLb6BFhcK/svK10Fv3YpH5R9qdWGeoQggazVL1i+UsV+tM
	YZMpkmi+S3xs7qpc9GZSwWUTVkdAqpk=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-511-zWKa8rq3Pa2qa_O9dN46Fw-1; Mon, 04 Mar 2024 14:12:36 -0500
X-MC-Unique: zWKa8rq3Pa2qa_O9dN46Fw-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-5670557f9aeso1454314a12.3
        for <fsverity@lists.linux.dev>; Mon, 04 Mar 2024 11:12:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709579555; x=1710184355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZV6cPRqKx5ix6M5gdtJYtyedkYWhw05+92IPp1Ctzuk=;
        b=roY64YqrmFubMTh36WUYfbt5vO/mpHC+ucDLBUDJB9Lux9pUr5fKUgPwH2g29LWzVP
         niyB6P1XpP3EeOVOSAr4uMoV+8J4Pzub9gv0rGiSCYYuYePvInORkGoTjQ13AnGnR06T
         YYOboZOoHwaRpRQ8qxj66zIjlKmHrmRemLhamV3XhoTrdCKU7GhmpPv662GhcvjKf9ay
         28eW/EsgsmrNEQL7Oqaai2RA5KQTMWa199aS16gg8iAXJekPj3kYJQHCDVvbuvOzUa1W
         pCRz/TTnQ0j8T2kA0e21FExTsTJJ1ov3Hbmy0Ue1acRezhBqhVEkJfNr9R1+ciqQvztd
         Rxng==
X-Gm-Message-State: AOJu0Yz7oNTARDJ5SWoUpb+q47Na/bYFpNa9PX8OSPmKi6RbgWPqHkAN
	8eM/zZaYm4wxCJG19sgrEQXi67+Khc0rv5Fx616D6xcpp4PDF6OvEfUrpuAhdvoYwNhQNEsN129
	/jb3bTPWEf8hZoUVTw9Ljd4rscMpQ/OhAgHP1Nli0VuVKQAS2+I/EZIXaiJ9/bgr3YsMqRyWPN9
	8OIX++1AkXLgItv6S8JzScHefkaEdKo6a9Kdvd2Uw=
X-Received: by 2002:a17:906:a3cd:b0:a45:1f03:4f23 with SMTP id ca13-20020a170906a3cd00b00a451f034f23mr3215560ejb.52.1709579554857;
        Mon, 04 Mar 2024 11:12:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEr0NI1aFj9SyMPj6KLK6wqTh72eLYmQdqNJLscKrLdEp90sMnUKsBE06KkZVd9YcuteqLjDA==
X-Received: by 2002:a17:906:a3cd:b0:a45:1f03:4f23 with SMTP id ca13-20020a170906a3cd00b00a451f034f23mr3215547ejb.52.1709579554621;
        Mon, 04 Mar 2024 11:12:34 -0800 (PST)
Received: from thinky.redhat.com ([109.183.6.197])
        by smtp.gmail.com with ESMTPSA id a11-20020a1709064a4b00b00a44a04aa3cfsm3783319ejv.225.2024.03.04.11.12.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 11:12:33 -0800 (PST)
From: Andrey Albershteyn <aalbersh@redhat.com>
To: fsverity@lists.linux.dev,
	linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	chandan.babu@oracle.com,
	djwong@kernel.org,
	ebiggers@kernel.org
Cc: Andrey Albershteyn <aalbersh@redhat.com>
Subject: [PATCH v5 24/24] xfs: enable ro-compat fs-verity flag
Date: Mon,  4 Mar 2024 20:10:47 +0100
Message-ID: <20240304191046.157464-26-aalbersh@redhat.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240304191046.157464-2-aalbersh@redhat.com>
References: <20240304191046.157464-2-aalbersh@redhat.com>
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

Finalize fs-verity integration in XFS by making kernel fs-verity
aware with ro-compat flag.

Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
---
 fs/xfs/libxfs/xfs_format.h | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/fs/xfs/libxfs/xfs_format.h b/fs/xfs/libxfs/xfs_format.h
index 3ce2902101bc..be66f0ab20cb 100644
--- a/fs/xfs/libxfs/xfs_format.h
+++ b/fs/xfs/libxfs/xfs_format.h
@@ -355,10 +355,11 @@ xfs_sb_has_compat_feature(
 #define XFS_SB_FEAT_RO_COMPAT_INOBTCNT (1 << 3)		/* inobt block counts */
 #define XFS_SB_FEAT_RO_COMPAT_VERITY   (1 << 4)		/* fs-verity */
 #define XFS_SB_FEAT_RO_COMPAT_ALL \
-		(XFS_SB_FEAT_RO_COMPAT_FINOBT | \
-		 XFS_SB_FEAT_RO_COMPAT_RMAPBT | \
-		 XFS_SB_FEAT_RO_COMPAT_REFLINK| \
-		 XFS_SB_FEAT_RO_COMPAT_INOBTCNT)
+		(XFS_SB_FEAT_RO_COMPAT_FINOBT  | \
+		 XFS_SB_FEAT_RO_COMPAT_RMAPBT  | \
+		 XFS_SB_FEAT_RO_COMPAT_REFLINK | \
+		 XFS_SB_FEAT_RO_COMPAT_INOBTCNT| \
+		 XFS_SB_FEAT_RO_COMPAT_VERITY)
 #define XFS_SB_FEAT_RO_COMPAT_UNKNOWN	~XFS_SB_FEAT_RO_COMPAT_ALL
 static inline bool
 xfs_sb_has_ro_compat_feature(
-- 
2.42.0

