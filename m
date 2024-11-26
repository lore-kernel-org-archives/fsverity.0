Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0238117BA0
	for <fsverity@lists.linux.dev>; Tue, 26 Nov 2024 08:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732611055; cv=none; b=AhMs4XalemK6J4SOaVbZtRdqzuglCQPeLLxhTHvIFlHIhL07IBfdWlK8eITll3PIIOis6HcBeSVP4I3CjtqEM/OFF3qk1DZEvXTyYJshqU2YfjKMxaDEhybfZHEZltosN45/PVk+/EXw1wsxHiOIIGEoRgUE6GP0lu7+EzW0na8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732611055; c=relaxed/simple;
	bh=IUhwwt+ITIX4SPkoM87abxZfmerRNWd6+ZyHckcNp4Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=tRI+splgEBuzS/PfEtsLGFlfU0+PW1MOIAFLVjJSrNxpvL7MHiKbVjYzLXJrjTLu6Jv9ovdpmQLSFm7vmDdgbV3gKo+/H9B/EE+tl2a99dViF8D+upCxTeEc8iZ+y9n84P230O5c8x9Bl4gFps+mQVbAl8PBdBV79NWWEF8/MfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TFKTZ2V1; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TFKTZ2V1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732611052;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/8zf0IBOqjP1m87T0wdS5BOeWr+jryQc1HjiPPmPRzo=;
	b=TFKTZ2V141CuYBCdF9xkK8ulLTyqfArw++Uy2ajc4FSMIpk0qUQ25IE0bPbYAkDquPwP2z
	jIiiOZTgRZZphLsdELodNKlNifqjSywewe3NCIrRdZqIc371A7ErrNobjC+e4CicCxkn3U
	kod6hmBjUiEtbVfwvY7DlAl9rMWoMnc=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-74-41xFrCeDMaiQYmBR3ochhQ-1; Tue,
 26 Nov 2024 03:50:49 -0500
X-MC-Unique: 41xFrCeDMaiQYmBR3ochhQ-1
X-Mimecast-MFC-AGG-ID: 41xFrCeDMaiQYmBR3ochhQ
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 17B13195395B;
	Tue, 26 Nov 2024 08:50:48 +0000 (UTC)
Received: from toolbx.redhat.com (unknown [10.39.193.207])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 97E8E30000DF;
	Tue, 26 Nov 2024 08:50:45 +0000 (UTC)
From: Allison Karlitskaya <allison.karlitskaya@redhat.com>
To: Eric Biggers <ebiggers@kernel.org>,
	"Theodore Y . Ts'o" <tytso@mit.edu>
Cc: fsverity@lists.linux.dev,
	Allison Karlitskaya <allison.karlitskaya@redhat.com>
Subject: [PATCH] Documentation: add a usecase for FS_IOC_READ_VERITY_METADATA
Date: Tue, 26 Nov 2024 09:48:33 +0100
Message-ID: <20241126084833.70538-1-allison.karlitskaya@redhat.com>
In-Reply-To: <20241126023313.GA3095319@google.com>
References: <20241126023313.GA3095319@google.com>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: AygnIvbfBfcLG1ziShgPCMIsytbj5Oqcwz9bP6Ts-Nc_1732611048
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Mention another potential usecase for FS_IOC_READ_VERITY_METADATA:
creating filesystem images which contain fs-verity-enabled files,
without having to redo all of the work in userspace.

Signed-off-by: Allison Karlitskaya <allison.karlitskaya@redhat.com>
---
 Documentation/filesystems/fsverity.rst | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/Documentation/filesystems/fsverity.rst b/Documentation/filesystems/fsverity.rst
index 0e2fac7a16da..8bcded27b517 100644
--- a/Documentation/filesystems/fsverity.rst
+++ b/Documentation/filesystems/fsverity.rst
@@ -248,11 +248,17 @@ FS_IOC_READ_VERITY_METADATA
 The FS_IOC_READ_VERITY_METADATA ioctl reads verity metadata from a
 verity file.  This ioctl is available since Linux v5.12.
 
-This ioctl allows writing a server program that takes a verity file
-and serves it to a client program, such that the client can do its own
-fs-verity compatible verification of the file.  This only makes sense
-if the client doesn't trust the server and if the server needs to
-provide the storage for the client.
+This ioctl is useful for cases where the verity verification should be
+performed somewhere other than the currently running kernel.
+
+One example is a server program that takes a verity file and serves it
+to a client program, such that the client can do its own fs-verity
+compatible verification of the file. This only makes sense if the
+client doesn't trust the server and if the server needs to provide the
+storage for the client.
+
+Another example is copying verity metadata when creating filesystem
+images in userspace (such as with `mkfs.ext4 -d`).
 
 This is a fairly specialized use case, and most fs-verity users won't
 need this ioctl.
-- 
2.47.0

