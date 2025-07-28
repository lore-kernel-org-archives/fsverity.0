Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78750285042
	for <fsverity@lists.linux.dev>; Mon, 28 Jul 2025 20:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753734713; cv=none; b=bnJvMhF92RX3RlpZKaBbVtifpOrJpLYPfZrAqXzTijMSO0axzTYf+UtR2Nt3Vs+NBp4ldS0KBsNr0Qcaer8C0DXaHsQwzyUZFtvhUpKrHjRYuNwiOoYco69MNSER8EMCmDpYpwitkD9X1Jfw9B1vvgH5tIKkceDme0X4P6lhaaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753734713; c=relaxed/simple;
	bh=4CpWmxTo2hLmGYDDA8Lp7aLfPM6yv41pw1diCtdXE1Q=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=XJDFjNqmHWjundJNvfNOoMor5SxpM+o2Qc4YGQret/EdzV5Ag9mnxXjAjTujRdCB8UlBFAPL1+gBILnQ13DXylJZG7ABMGXzGLC8LDgaX6pjKUaDQvP6kPWZszhusgFNmvbEdqDeRVJ/KGNbgvN6C9qrL4Utko7z2uL5BJxj1EQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HOqAAQOI; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HOqAAQOI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753734710;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UboS3qfLDBc+qi6WxzczFNpJ8WP4O5vMDtMD40JSNis=;
	b=HOqAAQOIjURFrb/PnEaRFoPpNZBLJq9T2wO5QPzWsPyYj6oHWEW2MKz8z+ejBX5vcfLBtY
	/u1s1kJXAaV3gKMus8+Xb1AVghdfKDucqXuETrDAux0mRIQtTlDnBavQmd6dLMYyW3WicY
	szL8US8qhGBqxF/4mhsh7pn4OVeOeAU=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-407-PR2KlCuJMQKfrnw6DcA74A-1; Mon, 28 Jul 2025 16:31:49 -0400
X-MC-Unique: PR2KlCuJMQKfrnw6DcA74A-1
X-Mimecast-MFC-AGG-ID: PR2KlCuJMQKfrnw6DcA74A_1753734708
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-61525af8a0bso1925116a12.2
        for <fsverity@lists.linux.dev>; Mon, 28 Jul 2025 13:31:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753734708; x=1754339508;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UboS3qfLDBc+qi6WxzczFNpJ8WP4O5vMDtMD40JSNis=;
        b=mqnI0dPn/LuWDzkhNI1Ngu27NgwMIq5kJCfAjocwootcLHFjj0BA1z+bDsV2ExaLaK
         1EnRHCpYUDw6GlU9e2GwZgctr/lfo83zKn+z8PEcR3fUJx0yi1dqfRm4CIgosordLFUG
         kJ+tDy9njcu9YBAjLKmYZF/+S5aEZU+gT0FBybREziCbKCgE4gxEWnKib/NhIKsxgofT
         /5JgfpGA599P2giY1NS4ZmpjuGvzFrp7bOAip+Oy1VOmXyTaSflwHyAPyiaF7PC4Dukj
         sH58BlnguIRfkBRITRXdZQdVRy/r0nx0RiEfebvg+1Eftou9EQDamVxhst8zJ6/l//gL
         AMtw==
X-Gm-Message-State: AOJu0YxSHW0vnAw/8j7kcgbnOwRPIkAHR8DLYxId3MTQYVvriK6IJIRJ
	pvwhNuygn+fqG8WYrhk8E28Z3HkOyGLIxbfUVJtiexbNqkm+OaPpl8hDB4RA9SZCMHt4YZdgulK
	JBKkGMIdeWZoKZuc1FcMSao/SWvmzsenfRWpA4nyAjiBvw3u8dKdXo1YUMPg=
X-Gm-Gg: ASbGncvpAxsTu6b2NXQFlNSQMfF3VXB6+ikGgkAjRfa9D4CE68kHxzRfwQ9SvGaQhGE
	eozj4HAJ7nMIaU1qBdL51MBwEAqYTLVoq0AOMeAkwuxwm7L4dwmiUEPX1xksArQKqaoHee5z3RG
	LP40p/Aefw7FOeZ1ftHedwyIWyRkadK3VNNZMfofv+e5hLi2koYuVLIdH4j7i9XFzCQMffqp8ul
	ENTbvss21P7HhZXAAwv5zi6lMJvF6cRqU92R1hf8LU2626L31Z0gPL/jvVhULwNIrW3SxE8hGkA
	4rPQvELGucl305yJmPiAfqRYCtJwwxIlsR1R3lgpUsqfaA==
X-Received: by 2002:a05:6402:348b:b0:615:41e5:cfda with SMTP id 4fb4d7f45d1cf-61541e5d4admr4626005a12.22.1753734707688;
        Mon, 28 Jul 2025 13:31:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH7NbV31Mm8G/xBUFv0BekV/8LN0fAoNrs1I+/WZVoZ8FMzVU2xsjyF09u66gqCrOLV/426wA==
X-Received: by 2002:a05:6402:348b:b0:615:41e5:cfda with SMTP id 4fb4d7f45d1cf-61541e5d4admr4625990a12.22.1753734707333;
        Mon, 28 Jul 2025 13:31:47 -0700 (PDT)
Received: from [127.0.0.2] (ip-217-030-074-039.aim-net.cz. [217.30.74.39])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615226558d3sm2730656a12.45.2025.07.28.13.31.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 13:31:47 -0700 (PDT)
From: Andrey Albershteyn <aalbersh@redhat.com>
X-Google-Original-From: Andrey Albershteyn <aalbersh@kernel.org>
Date: Mon, 28 Jul 2025 22:30:30 +0200
Subject: [PATCH RFC 26/29] xfs: fix scrub trace with null pointer in
 quotacheck
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <20250728-fsverity-v1-26-9e5443af0e34@kernel.org>
References: <20250728-fsverity-v1-0-9e5443af0e34@kernel.org>
In-Reply-To: <20250728-fsverity-v1-0-9e5443af0e34@kernel.org>
To: fsverity@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
 linux-xfs@vger.kernel.org, david@fromorbit.com, djwong@kernel.org, 
 ebiggers@kernel.org, hch@lst.de
Cc: Andrey Albershteyn <aalbersh@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=702; i=aalbersh@kernel.org;
 h=from:subject:message-id; bh=4CpWmxTo2hLmGYDDA8Lp7aLfPM6yv41pw1diCtdXE1Q=;
 b=owJ4nJvAy8zAJea2/JXEGuOHHIyn1ZIYMtrvSezXTDTT+zVlsmy5qlDdVOUb/ed2xV/6HHW5Q
 FG0P317j3dHKQuDGBeDrJgiyzppralJRVL5Rwxq5GHmsDKBDGHg4hSAiQhtYmSYI/6O+d+5oz0V
 /X9FVJIaW/pkrXe1Bp72jDwwPZPHJHkdwz+rn1bOZgXH6pQ0/Q6w/8g0vunFt+7gDf6g2SmWhhE
 nPzIDAMKNRVQ=
X-Developer-Key: i=aalbersh@kernel.org; a=openpgp;
 fpr=AE1B2A9562721A6FC4307C1F46A7EA18AC33E108
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: jcFRuOraGd3IhLHhlLpjG8mC_LWAXfB1C0UrZaY8twQ_1753734708
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

The quotacheck doesn't initialize sc->ip.

Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org>
---
 fs/xfs/scrub/trace.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/xfs/scrub/trace.h b/fs/xfs/scrub/trace.h
index d7c4ced47c15..4368f08e91c6 100644
--- a/fs/xfs/scrub/trace.h
+++ b/fs/xfs/scrub/trace.h
@@ -479,7 +479,7 @@ DECLARE_EVENT_CLASS(xchk_dqiter_class,
 		__field(xfs_exntst_t, state)
 	),
 	TP_fast_assign(
-		__entry->dev = cursor->sc->ip->i_mount->m_super->s_dev;
+		__entry->dev = cursor->sc->mp->m_super->s_dev;
 		__entry->dqtype = cursor->dqtype;
 		__entry->ino = cursor->quota_ip->i_ino;
 		__entry->cur_id = cursor->id;

-- 
2.50.0

