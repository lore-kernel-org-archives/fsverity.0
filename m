Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792622473;
	b=kmSFXCaxQqZQ3OoJNNdcK2IJE8balEM6sulu2F1+Dq16zGosGsub7Ogw/91xCWTg3li+
	 SU84fRRP5EsabhrPmg+cuOrRITjJYceF934aLvxCZiWLBhuzS97mQWQoxvzsnuiEJCjZx
	 4TTu4YkdykfwfMx7xaJp/YL3DPzliBkUgMXeM0atk4XqnPIzJHJu9vPaP2Yg7wI2tjsIv
	 rePXuwmkIkc8ZJt6Mmx+4gHDv3DSmzyvfXly58x/ZIbF6S333AmnoQfX/qwVXv0WIo28Q
	 6l3CPEDPAjgHR6CNXc/E91K+nu0qbufPcxquh4ILbrPcFLhZH8+IiAUv56ItGXqk3aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792622473;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RR60lewB4YzwZ3O+6UuYsULCErs4OnkxNF54hpKeVK8=;
	b=rziNbYqcVdRCzyNjGk14pOT2oCD+zsvn9Otkx3h5wgsBgpZmjDXTKUDY7f81Z3Bsu5fD
	 TAlSHb003zZQ78J+kT1A7koOM9nOi2gDX6DQJ16DsgylCmwAO2kDkQLlkFIxaQ7r52eHf
	 n+9LdlP0OWz+snaubc3vYRcphrDy0B1N0fxNfMyry2/jUVcecYs9i4Rav5faK88mPWudt
	 Gw4FXWUewns+UOjpEM3qXhDX4s70cPsqhsQdmSdiGAyPvw4uGKRqcO7shuDiZbkzxeBae
	 wVzxJV/HW6UsiZs/RJ+8lsokubD6e9Rum2xGSz58bTq7jZ9HxZrYEw0RkhbDUEJjIDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YCBmrPnr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C327D606A319
	for <fsverity@lists.linux.dev>; Wed, 21 Oct 2026 22:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YCBmrPnr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49E211F000C2;
	Wed, 21 Oct 2026 22:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792622472;
	bh=RR60lewB4YzwZ3O+6UuYsULCErs4OnkxNF54hpKeVK8=;
	h=From:To:Cc:Subject:Date;
	b=YCBmrPnruvtF7HNAQKp1+wRgOwIiI/e2dFnkmQkpmMyYL7HCucHX5/oi7vMUsvdfM
	 BVX6LtUwQAzNf1wWuO/BCJ9HOLVJUDdtMl7qsdPj3HoP1ST0LWuXagi25fqltnvzih
	 AyFfbKQwaQorJWYoIH3BMU9QW/TewiB+WGfbCmx8Gv+iKoF1W+qY5Mg2LovtGUWuxf
	 4UKw1Iyx1svteKSFHZdSNEKwB8sMwUGTQkgzFkID+juVoSLcranQ/QZ+JsTtrqYIiD
	 MAU+MHj8vzDQ4jO3E10swYza7L0kqObNTGSNLN9tQ252hrkNmRGiPU1vpmNCDUj4hL
	 MCKIe1eBVnWEw==
From: Eric Biggers <ebiggers@kernel.org>
To: fsverity@lists.linux.dev
Cc: Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH] fsverity: Update misleading comment in fsverity_ioctl_read_metadata()
Date: Wed, 21 Oct 2026 22:40:30 +0000
Message-ID: <20261021224030.2346074-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.56.0.218.g1ec904b173-goog
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Post: <mailto:fsverity@lists.linux.dev>
List-Help: <mailto:fsverity+help@lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fsverity+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The comment in fsverity_ioctl_read_metadata(), which justifies not
checking for FMODE_READ, doesn't consider that the nonstandard access
mode 3 (ioctl-only) exists.

It's reasonable to continue to allow this ioctl in that case, since this
*is* an ioctl, and opening a file with mode 3 checks for read (and
write) access.  However, adjust the comment to not be misleading.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 fs/verity/read_metadata.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/fs/verity/read_metadata.c b/fs/verity/read_metadata.c
index b4c0892430cde..5e81847bdb036 100644
--- a/fs/verity/read_metadata.c
+++ b/fs/verity/read_metadata.c
@@ -170,8 +170,9 @@ int fsverity_ioctl_read_metadata(struct file *filp, const void __user *uarg)
 	if (!vi)
 		return -ENODATA; /* not a verity file */
 	/*
-	 * Note that we don't have to explicitly check that the file is open for
-	 * reading, since verity files can only be opened for reading.
+	 * No need to check for FMODE_READ.  Verity files can't be open for
+	 * writing, and opening with access mode 3 (ioctl-only) requires read
+	 * (and write) permission, so the opener has read permission either way.
 	 */
 
 	if (copy_from_user(&arg, uarg, sizeof(arg)))

base-commit: ccc4d9f8912a5d9f519a34c3633fe53c8f9b429e
-- 
2.56.0.218.g1ec904b173-goog

