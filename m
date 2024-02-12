Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C1B45013
	for <fsverity@lists.linux.dev>; Mon, 12 Feb 2024 17:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707757229; cv=none; b=J6eAwYyVYFqLdtueACvPipaP9pMyMaj3zSiyTp+6v7MgdupXUq+82cHdQIkVndtIS8ytGwbRpVu81eXh0Ic75Ry08/XtINZURV/bio9XZ6Y2Ob2bbVuElBRnHL8JMDjcaa1B546sHcrYVxMnkZJ6PxOvtrhxVx06fkPsaRkD+Uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707757229; c=relaxed/simple;
	bh=QdzJQ1kBU4GhtNmWFv/v5q2u9OPK6bqQ8YoEEN+UHm4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Yll1mSirsmEAMPtFYkDfAhM6ZmPqll5oG+qYoN2v4uTpwyckAlfXiKt4XwgqAhQDy/pszfPGrCYdV4+PdQ3tWvKHoP1SZmdTuOIXzzGhmQZM3gKvHpDzyiTwwQ1HDZQfBZEtdpL8/H7/kVqN6dqM7TjKobhtJlcRt+bW4UsARpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XbJaHOXN; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XbJaHOXN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707757227;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CCVu6C3sA7ElU4nB0aYXUKm+yvCdjGTpJNzXHRX3ZOA=;
	b=XbJaHOXNUq3o7GMO2lNM7RZ2Yl6zki9XWShtu2ISxvBOGXb92NbOJ9PqRIWEP7MaINn1XI
	tS3g79+CCTuyiHJ10WzboXgM59E3I/J736/y5ZYtqBw1XuYPRk0KzQNmwS1D8TI8lNjsjU
	ChNrjTRI+BL7nUhZgtKVXgGi92xaIF0=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-632-vMn35QFpP4KX1o1X0HYFPA-1; Mon, 12 Feb 2024 12:00:25 -0500
X-MC-Unique: vMn35QFpP4KX1o1X0HYFPA-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-56001d4c9c8so2107869a12.0
        for <fsverity@lists.linux.dev>; Mon, 12 Feb 2024 09:00:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707757223; x=1708362023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CCVu6C3sA7ElU4nB0aYXUKm+yvCdjGTpJNzXHRX3ZOA=;
        b=N/rVf/gic+1RVrqABCbrprnnm+dlBMAxfpPIQRYXZU65OZwFRMaTGeM5I20/pMQnI4
         W5tuL7I22V3oBCH4R56jwV4MJBBULBbq8DHLGn5gIn8gEgHHzgi580ELbV5PnSawqn+i
         0jDyFAunqDRp5AEoYOKTPs0TW+kYTTbGJditlfnzwjgo1zNoWeoyxpOxMtpdN6bheHAQ
         E0PLSVqDiwDaPB7Eh+zGnYwnt3CzfdHpOhu/6t7AL3Rm8HnMB+fM64OUuxaNuzR/xCOq
         yvbufU8YLn/R2LQPbZ7RC4lHlsHK3GgGEf8Vth3/PNDq0YM1tqhPe98vELpOmQpoZyy1
         hjsA==
X-Gm-Message-State: AOJu0Yyz64VJHTbfb+xl/GMsw/dGiPNNEqAeF+G3yLSDNzL762K93jXO
	JLezT6MpW82cFPUBQFuq7nbcNxJnwWWuIFirjMbjT01a7OhsnHonIr68iWiRzLOuOGdAbWigiqR
	ByDANLQyE4ueUt5dTbrtOz+/Tbsm2HyrbUDIV1aas0YoMCf01oAn+Bs6rm9Z+c8Vhvg9y/74Eqn
	X77lip4EDzEVsDxxHkILyd7JJmBHWtFKNkXxKUfac=
X-Received: by 2002:a50:fa86:0:b0:55f:fd61:b08f with SMTP id w6-20020a50fa86000000b0055ffd61b08fmr5444435edr.4.1707757223252;
        Mon, 12 Feb 2024 09:00:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGX4QsV2jwPgEK3ppOb+fAmuTGxzi5pj46ICsgxsM5V1RWud/SUlTZ9QaiHLZpC1sd63X9YYw==
X-Received: by 2002:a50:fa86:0:b0:55f:fd61:b08f with SMTP id w6-20020a50fa86000000b0055ffd61b08fmr5444416edr.4.1707757223016;
        Mon, 12 Feb 2024 09:00:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVbixGwNn2/iQes+rCvgVp/F3RjBSehosjFCAIvdLXWSMONtUscMUhdVZvz2ojDIXeQtTNHdhZ8OVZwgnN/hd7k6GmI5Ryp54qW3fmznAn2ASgRznKnI1XzfIgGrVB3dwYWfYVzmpZ0hy2OW2vDHkBCu2jmZU1UIQXfV1xRLXQkWg38QoXASDkPImLM3obGk9jg3wyKszAXbZUxea+dMcCgzt2VQyuH8wp/
Received: from thinky.redhat.com ([109.183.6.197])
        by smtp.gmail.com with ESMTPSA id 14-20020a0564021f4e00b0056176e95a88sm2620261edz.32.2024.02.12.09.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 09:00:22 -0800 (PST)
From: Andrey Albershteyn <aalbersh@redhat.com>
To: fsverity@lists.linux.dev,
	linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	chandan.babu@oracle.com,
	djwong@kernel.org,
	ebiggers@kernel.org
Cc: Andrey Albershteyn <aalbersh@redhat.com>
Subject: [PATCH v4 23/25] xfs: make scrub aware of verity dinode flag
Date: Mon, 12 Feb 2024 17:58:20 +0100
Message-Id: <20240212165821.1901300-24-aalbersh@redhat.com>
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

