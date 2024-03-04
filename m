Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F187C0B7
	for <fsverity@lists.linux.dev>; Mon,  4 Mar 2024 19:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709579556; cv=none; b=d8fDjrclVfsf2OWrwGdtEKRILYeLWDnRlZWnY7h/25gZh4zJWXzhW5VN6c8GfaNgfFRVLGhHLLEAep8AHS1/hv4392fIXVAN9cvDVjjMuLVRKgyyc9khEbDAcBP5Pf0oaoKhS5cbTPY2ZfUc1UkcUYfh5dIaUI6YLIE+g4rL7fU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709579556; c=relaxed/simple;
	bh=QdzJQ1kBU4GhtNmWFv/v5q2u9OPK6bqQ8YoEEN+UHm4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y87ezDcc+aK3P/nnTXNHE6bpefQOUY02ijdWOnlfosy+PBwsFWBN53Dg75UHTWeCawTKlfpZZXS8izWjJmsPFcQX9qBC6+4PcOhyIsTCzHyl4mMAJBAdJhnZfcA6ALIxhVOMnp22bBN5Mbt7CF3/lmw1Kn7zrc4RcOHPTkUCMNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gf4ydPS9; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gf4ydPS9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709579554;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CCVu6C3sA7ElU4nB0aYXUKm+yvCdjGTpJNzXHRX3ZOA=;
	b=gf4ydPS9Uejvkt2tTRt6oB74zMLtC2SuOk89ermWuUn6BV3Lfnhueo10ArL8nIu+/udHTM
	RWNdq66hWUy0nmRZYMD6ef9mEoN9hLsvpHlzztM4GTt5toTK/OVwPNFcILetoiN+P1nYER
	WntBXKq7K7J3Q1wKDpqKV/mpelmh/HE=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-32-GQ6TaSbAN7G5OddBdTvm8w-1; Mon, 04 Mar 2024 14:12:33 -0500
X-MC-Unique: GQ6TaSbAN7G5OddBdTvm8w-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a448b3a36eeso234145466b.3
        for <fsverity@lists.linux.dev>; Mon, 04 Mar 2024 11:12:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709579551; x=1710184351;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CCVu6C3sA7ElU4nB0aYXUKm+yvCdjGTpJNzXHRX3ZOA=;
        b=LtOnTy+aE0mScg1YoJeS4bxZVfw2WwVhO7sZQ8h3eT5lTsSGNhjnQ16MsWPSOlQEfq
         MB7RN1vQDTszD7kltVz/U68S1j/s6Qf+P48v193me7OnVJ6Gz9RyOqnTzomvAyGs8H1e
         Kl1s3JILfyFfQR7pD4p92iBJri1GUBgNeyaRJ4k0KWbPSpbj6geCTbU5OTffKX2SOfKO
         nDg3/FxtfFDe2FhHJk3DoZxDqcDseir39YOk+55ATjWsYk6Hx/bH4IAN6GFJpQEffaqj
         7yo74dqf0R5tyznobpj41y1jr2Y3nSOKL36dSJNh1WYrGOy3Z8HfWnvAZ3cjCmtkrydk
         cgBw==
X-Gm-Message-State: AOJu0YyZDrlouwocK487NdRc7esnw7RStdHEsZQiUuzs4Uip8VrXUFB/
	V2REBXM6fWzcOxR/288JTrc/FbuksB8e9WbXiX8aOSYIuU6fjEcGKXja8MKhk6Gx9eu7UEMn6OR
	4zXK2PqF9lfJB4DyGsaDTeGZmv9GlnyLfntRvDpYhiyy6qDr0hSoB5OBcd8cmM3k8WGaWfQClGJ
	Bm9djGIHbIpof0bnqI6z8devqWLqdo4ugabhOvctA=
X-Received: by 2002:a17:906:ca46:b0:a3e:8223:289a with SMTP id jx6-20020a170906ca4600b00a3e8223289amr6658578ejb.31.1709579551811;
        Mon, 04 Mar 2024 11:12:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGwEVH/LAIuJqd047oj/TDNuXhBpSOEKAD5TItZIL/0FSEVj2eqhjgA+Kb1gdJhwoiOZ/4iBg==
X-Received: by 2002:a17:906:ca46:b0:a3e:8223:289a with SMTP id jx6-20020a170906ca4600b00a3e8223289amr6658560ejb.31.1709579551268;
        Mon, 04 Mar 2024 11:12:31 -0800 (PST)
Received: from thinky.redhat.com ([109.183.6.197])
        by smtp.gmail.com with ESMTPSA id a11-20020a1709064a4b00b00a44a04aa3cfsm3783319ejv.225.2024.03.04.11.12.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 11:12:30 -0800 (PST)
From: Andrey Albershteyn <aalbersh@redhat.com>
To: fsverity@lists.linux.dev,
	linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	chandan.babu@oracle.com,
	djwong@kernel.org,
	ebiggers@kernel.org
Cc: Andrey Albershteyn <aalbersh@redhat.com>
Subject: [PATCH v5 22/24] xfs: make scrub aware of verity dinode flag
Date: Mon,  4 Mar 2024 20:10:45 +0100
Message-ID: <20240304191046.157464-24-aalbersh@redhat.com>
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

fs-verity adds new inode flag which causes scrub to fail as it is
not yet known.

Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
Reviewed-by: Darrick J. Wong <djwong@kernel.org>
---
 fs/xfs/scrub/attr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/xfs/scrub/attr.c b/fs/xfs/scrub/attr.c
index 9a1f59f7b5a4..ae4227cb55ec 100644
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
2.42.0

