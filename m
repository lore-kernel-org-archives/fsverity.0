Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3E0280327
	for <fsverity@lists.linux.dev>; Mon, 28 Jul 2025 20:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753734704; cv=none; b=OlIyK/B30S+X4vzYq4myMNzVnWghdlpGSNNtB81aEqax6axanQHCddAAjT/q7iHoEof0f1dujGan1N08tsWzVuoQvcQZbEzK/XJ8RRewnNGIu0udhTWW8P/dCJLRVviqzekJ8ocTzePozaYM8BN5Kptn20D8Ttt4zW59x0gD1kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753734704; c=relaxed/simple;
	bh=pEsdBsP++Y85G6aS7bR9cTIxDhq123OG0RgfqhdTNOc=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=CNYVk9YBCXMijeCXkCf3V7KQR0lGUIWlXM6BFr+YUL5GNJCPaAg8WbHVsR4GuGAnWig3QwGkfBv+zEovGmRJC3h5t6d5VDraQmDATtcwwfVIZnmf2yXhtkvxDtrq4t1Q02Kanx1HjWunb73ku4sRYA2P3204OaxGkXoKlXd3+4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PLcT1N7K; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PLcT1N7K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753734702;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wvsKU5ht1WKmP/gTh8rNGT9sMvO2NAzg8uCQD7oEXFQ=;
	b=PLcT1N7Kbny7lptvmax2N4jtScSgSOqcEKwtfa9EKf+vyiDLo33x4OtPg94it+ppmNOVez
	eVLN+nCxWEFfObwkdy1+xGgfpECCqupksq3MA4uWa917OQl4wCW3Lpk8ie65xkBM/iVItP
	YmNZ+fjy3Qavqn9bqee2XGOUvDoTTcY=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-461-bEXSewn1P5efbwXOMc6svw-1; Mon, 28 Jul 2025 16:31:41 -0400
X-MC-Unique: bEXSewn1P5efbwXOMc6svw-1
X-Mimecast-MFC-AGG-ID: bEXSewn1P5efbwXOMc6svw_1753734700
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-612b700c54eso3942695a12.0
        for <fsverity@lists.linux.dev>; Mon, 28 Jul 2025 13:31:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753734700; x=1754339500;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wvsKU5ht1WKmP/gTh8rNGT9sMvO2NAzg8uCQD7oEXFQ=;
        b=uUzehJvvwi0+KyfPl+fR+DqAuFVhVyXG19AIZumbEwcxzC9KDAC4pjImfHrBC9nzu2
         WR73S3N1rt9nAPuTR5aHPNAn3OVVtt1TDBF/qS//ldFd79BEBpzAM3GBOjjPZdJN8CZo
         9oXCM6HLzq9Io28KUtwSzAN1n/pqPgY3ZqZY7IO63tCDfD+Up/E/CV3PlJBDm89v/kG+
         ugQtCxkybBziGEBIkvC8w7DG2f2VKxgX4I/I+wdTkF53I8B6vTzIabH33y1USNMBi3yf
         eZmPYypjSOv8dN79BpKPdBsFTj/WZcQGYf4cW6enh0SVKgsgmWPSmco4JC5Znk84AFSZ
         x/Pg==
X-Gm-Message-State: AOJu0YxMxpiN1e4pzWZpX/B5QjIVj4MVMlYuofjrYqYYlRnLNkZWdBAJ
	COauK0h0bi3kzyYqKyniE5jKGieNET9hrbodtcKHXSgiFXPj2OdQjq638p6JmN3A9BIPRaiVa6U
	fu8IzjgteidbUzFdhZTD9l3V1OQ3SAR0Lf2xLEWig3QnyypSp+7RJ6VpGl3I=
X-Gm-Gg: ASbGncs0nlAEmxcX93H7lYPCeOrBq7Z8QCcbcU128w0E2S20DBZSedb2Fg49mKbE3U7
	iwkfLz/1DFcdNxFjracsP/0o37ZJDwfj7EsLV3KN1TGX+3OOc/iuUM+5X/GF9FPStBlo4nu52+F
	I22jKcgNeSGKfVivgyKwmK6X91neLDQc3S3ACCTK1QPVFmYNfl1aQ2CjVM1TE7V4q8o5mULWCOt
	cg5HyGi88JxF42F9MBMlHK6ePOanro0v/ESJkuxEmw94KZGxRvH6kAXK68hl4clMGWcKdDGTMs5
	dh1iO9wzbHo/0sWzTJC1rGMmrw0EzZ9e5yieULe2/CuFHw==
X-Received: by 2002:a05:6402:4301:b0:612:3d0c:a71a with SMTP id 4fb4d7f45d1cf-614f1d1fb27mr12150580a12.14.1753734699802;
        Mon, 28 Jul 2025 13:31:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEAgVdoNTEBJPqNHsQOHuT9fwO/DO3qMlfW/S4s3Osuit2xlyTjHHaIzxM7/XbZcrxj7z3tdA==
X-Received: by 2002:a05:6402:4301:b0:612:3d0c:a71a with SMTP id 4fb4d7f45d1cf-614f1d1fb27mr12150558a12.14.1753734699371;
        Mon, 28 Jul 2025 13:31:39 -0700 (PDT)
Received: from [127.0.0.2] (ip-217-030-074-039.aim-net.cz. [217.30.74.39])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615226558d3sm2730656a12.45.2025.07.28.13.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 13:31:38 -0700 (PDT)
From: Andrey Albershteyn <aalbersh@redhat.com>
X-Google-Original-From: Andrey Albershteyn <aalbersh@kernel.org>
Date: Mon, 28 Jul 2025 22:30:22 +0200
Subject: [PATCH RFC 18/29] xfs: don't allow to enable DAX on fs-verity
 sealed inode
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <20250728-fsverity-v1-18-9e5443af0e34@kernel.org>
References: <20250728-fsverity-v1-0-9e5443af0e34@kernel.org>
In-Reply-To: <20250728-fsverity-v1-0-9e5443af0e34@kernel.org>
To: fsverity@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
 linux-xfs@vger.kernel.org, david@fromorbit.com, djwong@kernel.org, 
 ebiggers@kernel.org, hch@lst.de
Cc: Andrey Albershteyn <aalbersh@redhat.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=898; i=aalbersh@kernel.org;
 h=from:subject:message-id; bh=VsEwWloIYSoJV3t10dMO/UU69MLyJpIl83HjhawNhNE=;
 b=owJ4nJvAy8zAJea2/JXEGuOHHIyn1ZIYMtrvSaSauInrBJydPPWKkpFKI8MDeYdw853hsVkzN
 /I8trh34lVHKQuDGBeDrJgiyzppralJRVL5Rwxq5GHmsDKBDGHg4hSAiSRGMjJczTb9yi05r+xl
 4rdFa1eLfF/6KK25opvb576Gyvs9l9e+Z2T4luqUMafv5KawH4qnzDbxLM48f8iIf+313i8mWQf
 ON7ziBAB2pUkA
X-Developer-Key: i=aalbersh@kernel.org; a=openpgp;
 fpr=AE1B2A9562721A6FC4307C1F46A7EA18AC33E108
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: wJ-CA8Qb_fn6eqT4GLJzxwcRfwpNaW4iKR0ovsYYVSo_1753734700
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

From: Andrey Albershteyn <aalbersh@redhat.com>

fs-verity doesn't support DAX. Forbid filesystem to enable DAX on
inodes which already have fs-verity enabled. The opposite is checked
when fs-verity is enabled, it won't be enabled if DAX is.

Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
Reviewed-by: Darrick J. Wong <djwong@kernel.org>
[djwong: fix typo in subject]
Signed-off-by: Darrick J. Wong <djwong@kernel.org>
---
 fs/xfs/xfs_iops.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/xfs/xfs_iops.c b/fs/xfs/xfs_iops.c
index 83d31802f943..2d8ecdd0b403 100644
--- a/fs/xfs/xfs_iops.c
+++ b/fs/xfs/xfs_iops.c
@@ -1365,6 +1365,8 @@ xfs_inode_should_enable_dax(
 		return false;
 	if (!xfs_inode_supports_dax(ip))
 		return false;
+	if (ip->i_diflags2 & XFS_DIFLAG2_VERITY)
+		return false;
 	if (xfs_has_dax_always(ip->i_mount))
 		return true;
 	if (ip->i_diflags2 & XFS_DIFLAG2_DAX)

-- 
2.50.0

