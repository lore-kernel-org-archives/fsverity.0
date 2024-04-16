Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 480C636E
	for <fsverity@lists.linux.dev>; Tue, 16 Apr 2024 00:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713226682; cv=none; b=Nl1wsXk5AHwttClW6sIVoGWMsAUQ5dXqtbyl6F3wWdlNSa0p/jJNQ+klWEdgPdgbr8JmoLEk9exCkqHpt+NSD4dl1B0JWGG0LgHoLigsuAiK73TO8H8W0roZ9qJStb88VVcjIAFQokXhWSAWO15UHuZ6pb/ybYRmyKsrRXmwe+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713226682; c=relaxed/simple;
	bh=3/B7vWRvtl8aIFH3hKbhQRfODs9XZZsKXmwpTHvU13w=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=dronrswiP0YiNVWYF59V9lazWwxiKpFRMTI2UmL+GrJpV18mbiSwhXMJI0WD5gRO2TNuir0mrjrBlor5rYsygkywChDV0lkYupWPPsu78E2tSEPOjazlVjCMOiLbwHptME2oly3Q3TqB2dHfsVjpIc+CrkE0xaaYp1F73VhebRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--richardfung.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=P3JtWeJZ; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--richardfung.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="P3JtWeJZ"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-61ab173fe00so37550827b3.3
        for <fsverity@lists.linux.dev>; Mon, 15 Apr 2024 17:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713226678; x=1713831478; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NDPBbN30ZyY8UoIY8djlTeTTFaUIobcz6dPBP5TgibQ=;
        b=P3JtWeJZ9DSZzEd30rCIj3gBC6/sHBBAAl5JgN+5KFM0LlsL9thvFIoAitOTLTddcG
         OEWplvGLvZ8GZIZYXzYVpsqZrIzkqKJWGbnO1DsIRdk72g5w0kpesEb9lGYxDU1MiYLP
         CqT3zw/0fz49Jyz8wS2UV+HgWJhUHItWtzP6bbKRPeJ691XB9WoAfW4X+Bx8edoh+jrp
         snPOaAmn9dvCl5YAuoIiBDQ/BBo+ZFxXt1hfjhSYR7Rt5ioGuJVSUVoaYVR3rNvMZwxm
         4m4cv1WM3vMB4HvSDc+j/lA/8JYmpzTYOLMluMLtfCwDZGuvrJXFk9/PL/IgzaG08OuN
         c2AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713226678; x=1713831478;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NDPBbN30ZyY8UoIY8djlTeTTFaUIobcz6dPBP5TgibQ=;
        b=OD5nIEJrHm72uCXvi2sSjfxY4LjX0o5zvsPE3G8qyma/8ZVFkZlyI6+0SGZdoYe4lB
         wpb0cVoflVlB+G5LEc/tjau+BT/+uRosY2eNkd7x2HXmVhonpb3QKOsK8FRDVQb+IR+K
         80S40hqhQiXyDzMdUSxwqP2VGZy+DJbK5Ogy19jy04+KgxhMbYhpY309swlzH7ZPbW09
         XNOTyo6lkBWfY+t3l8uCRrawncq05RE3rfJBmw+Mi9jLYqla4YqYaFaM1OrV0wxawE8I
         TlTEdsE426RF2hObDrn+OPQ70l/g/6pNk3IPPP8/SqrpR/feCb8tsNzl+igaXN/IpPVx
         dtdw==
X-Forwarded-Encrypted: i=1; AJvYcCWCuPW0nRg9tELl53K7ojPOYnRSy9xOzKEk9d2O6aT3Qzy1WEDJo0UfofOXKvDnKiU3UEDaJQ2/QGF8rS4bh+f0R/0KT8eWHBw=
X-Gm-Message-State: AOJu0Yz/Lc4Pxe0foQIjAl52+ODRSis811VgGcTltvNNZePzQHGQEppo
	ASSWFk7mCAspWw/rFKB2lSrriEFZhX8aUl0rNsZp+nu6M18RLt3Aa6KHX4gUims2XdGp4T9/szP
	J4bcqZMabYv3X0a+OlCh1Zw==
X-Google-Smtp-Source: AGHT+IEFs8S7fF1QpMnQnAC+kmqFQmfo80Y1WQ0kEcu5yg8AmrzI1xpvYGzVs0pY7o3M8wl96F5ZI35J1UHXIXplQg==
X-Received: from richardfung.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:2a5c])
 (user=richardfung job=sendgmr) by 2002:a05:6902:709:b0:dcc:50ca:e153 with
 SMTP id k9-20020a056902070900b00dcc50cae153mr3880572ybt.7.1713226678341; Mon,
 15 Apr 2024 17:17:58 -0700 (PDT)
Date: Tue, 16 Apr 2024 00:16:39 +0000
In-Reply-To: <20240328205822.1007338-1-richardfung@google.com>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240328205822.1007338-1-richardfung@google.com>
X-Mailer: git-send-email 2.44.0.683.g7961c838ac-goog
Message-ID: <20240416001639.359059-1-richardfung@google.com>
Subject: [PATCH v2] fuse: Add initial support for fs-verity
From: Richard Fung <richardfung@google.com>
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: linux-fsdevel@vger.kernel.org, ebiggers@kernel.org, 
	fsverity@lists.linux.dev, ynaffit@google.com, 
	Richard Fung <richardfung@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This adds support for the FS_IOC_ENABLE_VERITY and FS_IOC_MEASURE_VERITY
ioctls. The FS_IOC_READ_VERITY_METADATA is missing but from the
documentation, "This is a fairly specialized use case, and most fs-verity
users won=E2=80=99t need this ioctl."

Signed-off-by: Richard Fung <richardfung@google.com>
---
 fs/fuse/ioctl.c | 64 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/fs/fuse/ioctl.c b/fs/fuse/ioctl.c
index 726640fa439e..01638784972a 100644
--- a/fs/fuse/ioctl.c
+++ b/fs/fuse/ioctl.c
@@ -8,6 +8,7 @@
 #include <linux/uio.h>
 #include <linux/compat.h>
 #include <linux/fileattr.h>
+#include <linux/fsverity.h>
=20
 static ssize_t fuse_send_ioctl(struct fuse_mount *fm, struct fuse_args *ar=
gs,
 			       struct fuse_ioctl_out *outarg)
@@ -118,6 +119,63 @@ static int fuse_copy_ioctl_iovec(struct fuse_conn *fc,=
 struct iovec *dst,
 }
=20
=20
+/* For fs-verity, determine iov lengths from input */
+static long fuse_setup_verity_ioctl(unsigned int cmd, unsigned long arg,
+				    struct iovec *iov, unsigned int *in_iovs)
+{
+	switch (cmd) {
+	case FS_IOC_MEASURE_VERITY: {
+		__u16 digest_size;
+		struct fsverity_digest __user *uarg =3D
+				(struct fsverity_digest __user *)arg;
+
+		if (copy_from_user(&digest_size, &uarg->digest_size,
+				sizeof(digest_size)))
+			return -EFAULT;
+
+		if (digest_size > SIZE_MAX - sizeof(struct fsverity_digest))
+			return -EINVAL;
+
+		iov->iov_len =3D sizeof(struct fsverity_digest) + digest_size;
+		break;
+	}
+	case FS_IOC_ENABLE_VERITY: {
+		struct fsverity_enable_arg enable;
+		struct fsverity_enable_arg __user *uarg =3D
+				(struct fsverity_enable_arg __user *)arg;
+		const __u32 max_buffer_len =3D FUSE_MAX_MAX_PAGES * PAGE_SIZE;
+
+		if (copy_from_user(&enable, uarg, sizeof(enable)))
+			return -EFAULT;
+
+		if (enable.salt_size > max_buffer_len ||
+				enable.sig_size > max_buffer_len)
+			return -ENOMEM;
+
+		if (enable.salt_size > 0) {
+			iov++;
+			(*in_iovs)++;
+
+			iov->iov_base =3D u64_to_user_ptr(enable.salt_ptr);
+			iov->iov_len =3D enable.salt_size;
+		}
+
+		if (enable.sig_size > 0) {
+			iov++;
+			(*in_iovs)++;
+
+			iov->iov_base =3D u64_to_user_ptr(enable.sig_ptr);
+			iov->iov_len =3D enable.sig_size;
+		}
+		break;
+	}
+	default:
+		break;
+	}
+	return 0;
+}
+
+
 /*
  * For ioctls, there is no generic way to determine how much memory
  * needs to be read and/or written.  Furthermore, ioctls are allowed
@@ -227,6 +285,12 @@ long fuse_do_ioctl(struct file *file, unsigned int cmd=
, unsigned long arg,
 			out_iov =3D iov;
 			out_iovs =3D 1;
 		}
+
+		if (cmd =3D=3D FS_IOC_MEASURE_VERITY || cmd =3D=3D FS_IOC_ENABLE_VERITY)=
 {
+			err =3D fuse_setup_verity_ioctl(cmd, arg, iov, &in_iovs);
+			if (err)
+				goto out;
+		}
 	}
=20
  retry:
--=20
2.44.0.683.g7961c838ac-goog

