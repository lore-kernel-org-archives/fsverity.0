Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D2D1284B42
	for <fsverity@lists.linux.dev>; Mon, 28 Jul 2025 20:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753734713; cv=none; b=iC9uFBt1tK8bF3wRXTHM9AreGA/Zyc63LbdewgofqH14I9I/PNibrjhBLcHbDjyu83GN6v6ePFb0o3tXYrTm+rh/UuYNx57oL+GS6Wq9HSFWyhBi9mXhJOsLirRZQ4icYYj1fExWqdimNvXfYpd7H/tvb19DGAhdbF2rmcoeIws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753734713; c=relaxed/simple;
	bh=oXrYk89O0Um5P8PkyP0aN/fzstJe93VqP0YI02ddnhE=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=Z/DxcqKdu218/SQHyENLri46oATYdIvi+naLPkskJ87/sMC6WbrBCVc6W7bzwspN5N5k8+bIe4A7x6+A2S7uZr0qS+8Sljcb0mfTtRmdwgmZEhtUx8jbmA94z6B+XwzcUxN3ASeaztsh7TZFgGQZMg/7DggG2V591RYHdXl8rLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ibNambPz; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ibNambPz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753734709;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/UHpX8nvBBvaUQO36ZKMY1wOJRmJ65rli9NZbFUt5AA=;
	b=ibNambPz6wnC6b4JeteKRCrARHbA+U4nAcAMNJPUceXru41mSC2Cde5KKJbNLtS+5LzXJO
	Mwq54/aEdZOep1+TDVJQwJckiM91Wm1jsCHN6aEQjS07oYDzpcN7ooCh4L2vjWz14s4pVM
	icmosm9LdQpGy21vzUWMAYz5VhArzCQ=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-150-quRuTT5_Mne8y4U4r4W6IA-1; Mon, 28 Jul 2025 16:31:47 -0400
X-MC-Unique: quRuTT5_Mne8y4U4r4W6IA-1
X-Mimecast-MFC-AGG-ID: quRuTT5_Mne8y4U4r4W6IA_1753734706
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-60c9d8a169cso5354457a12.0
        for <fsverity@lists.linux.dev>; Mon, 28 Jul 2025 13:31:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753734705; x=1754339505;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/UHpX8nvBBvaUQO36ZKMY1wOJRmJ65rli9NZbFUt5AA=;
        b=te7gfuLrcVAC6zt8uonH3RgIUIUZ9ubTrqLFn71CAMn8gm4Nchh9MrnbO0ayU9utyu
         c0qbmfbpqYJn/4hzDtrLb4+M4wQhfK8pOsAVav7mxaa3sDQfD2mtYUkIUrlAqUkW7Odw
         lOz1w2zxwnNVK0J8h7uzcT8ZzQBK7SfDENCzL4QUmwkC2diktYdf5S4+89xRzqz/+uvS
         usN8w36EKnAwQsXNLvxZrDfWHIjznKcN/Ivn9Kp0v2JPwgE/FovVJ5m42mRbVR1co4d4
         I58W/pPtmSKLUu2k8B6CjdP3WEyN/xeua0HuZnb8g4pBOlcHT0d6g7oQxBAHHlTXJJAG
         ioAg==
X-Gm-Message-State: AOJu0Yxhxug3tBcu7FjfeW9T84lJlWACEEjuHu12pEjpHW1ERX4cx7Ln
	wsA6TJj/BveubW1/91EOXXRJWMfKB3WTCQ3syNuMsG86XBG7y3w0mBiJ41Mwn8YZ/SiaNxOFKsY
	ipbfEiPL8Wu+SihN26pZ8tWF96eiWyV8cbJnhhJ1hN4klLA0KaJOkRo0l8b3S72CoCS0=
X-Gm-Gg: ASbGncsSrg9z7oPyGMGGxB//FqNRsQPO/DiaSnbmVTm332CA0lI92RP6fvQt3EE/Z67
	fQBZowPdXOhHjN5PWY62X6ac509CM90ecy7/r+yGirrfh4Z3q2nHrPwSvqFj8u3rtrsdKMx5uw8
	h6l8ac26lrBjrc6W3V6w/S9WWUeizBt9YVCjLUtpdJHlBreG2COunfhaqwox1fheUWkbgPJgX2z
	7I6kSeoHs+NzRH/PlsyAoAjIPVjMDmqOiCe0cg2rR1dvogeYzE3UnIU1aOUr2U6APo2lkVKhS+B
	MaKuxqzFQC4tQnG+6eJ8l+1Iqk4JRcyFgFJY0/IpumyCxQ==
X-Received: by 2002:a05:6402:1ec5:b0:612:a77e:1843 with SMTP id 4fb4d7f45d1cf-614f1bd4bc1mr12230474a12.5.1753734705273;
        Mon, 28 Jul 2025 13:31:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFoDTzvEORt+zYj5p5DTj1JYCh8sm3pEhkMIx1xgTWgVgB7tdbLlFlIksa68FpKbUDf1D8onw==
X-Received: by 2002:a05:6402:1ec5:b0:612:a77e:1843 with SMTP id 4fb4d7f45d1cf-614f1bd4bc1mr12230456a12.5.1753734704844;
        Mon, 28 Jul 2025 13:31:44 -0700 (PDT)
Received: from [127.0.0.2] (ip-217-030-074-039.aim-net.cz. [217.30.74.39])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615226558d3sm2730656a12.45.2025.07.28.13.31.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 13:31:42 -0700 (PDT)
From: Andrey Albershteyn <aalbersh@redhat.com>
X-Google-Original-From: Andrey Albershteyn <aalbersh@kernel.org>
Date: Mon, 28 Jul 2025 22:30:27 +0200
Subject: [PATCH RFC 23/29] xfs: add fs-verity ioctls
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <20250728-fsverity-v1-23-9e5443af0e34@kernel.org>
References: <20250728-fsverity-v1-0-9e5443af0e34@kernel.org>
In-Reply-To: <20250728-fsverity-v1-0-9e5443af0e34@kernel.org>
To: fsverity@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
 linux-xfs@vger.kernel.org, david@fromorbit.com, djwong@kernel.org, 
 ebiggers@kernel.org, hch@lst.de
Cc: Andrey Albershteyn <aalbersh@redhat.com>, 
 Andrey Albershteyn <aalbersh@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1235; i=aalbersh@kernel.org;
 h=from:subject:message-id; bh=1zT9nrTCecXTInwM9izpme0zk/YxcLuwcyE7K7v4l/w=;
 b=owJ4nJvAy8zAJea2/JXEGuOHHIyn1ZIYMtrvSUgKGS+eNzO21U7T/oLpxbM/FOT+TbixuChou
 0JdzLdShpMdpSwMYlwMsmKKLOuktaYmFUnlHzGokYeZw8oEMoSBi1MAJlLey/A/ecr87Tt4lXv3
 TFp3aaKx/Mw/YmbHXa3ZXkxgr4ngmW6oxchwVew9d6SIbvOkjAPRH83lblz88svzXlqExAw+WSa
 H+Yo8AM5/RB4=
X-Developer-Key: i=aalbersh@kernel.org; a=openpgp;
 fpr=AE1B2A9562721A6FC4307C1F46A7EA18AC33E108
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: YxqK3LDYKlfTlP68LnD8xOhZq9sWXuv_0ekwO2puqyw_1753734706
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

From: Andrey Albershteyn <aalbersh@redhat.com>

Add fs-verity ioctls to enable, dump metadata (descriptor and Merkle
tree pages) and obtain file's digest.

[djwong: remove unnecessary casting]
Signed-off-by: Darrick J. Wong <djwong@kernel.org>
Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org>
---
 fs/xfs/xfs_ioctl.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/fs/xfs/xfs_ioctl.c b/fs/xfs/xfs_ioctl.c
index d250f7f74e3b..589c36ee4e7f 100644
--- a/fs/xfs/xfs_ioctl.c
+++ b/fs/xfs/xfs_ioctl.c
@@ -44,6 +44,7 @@
 
 #include <linux/mount.h>
 #include <linux/fileattr.h>
+#include <linux/fsverity.h>
 
 /* Return 0 on success or positive error */
 int
@@ -1428,6 +1429,21 @@ xfs_file_ioctl(
 	case XFS_IOC_COMMIT_RANGE:
 		return xfs_ioc_commit_range(filp, arg);
 
+	case FS_IOC_ENABLE_VERITY:
+		if (!xfs_has_verity(mp))
+			return -EOPNOTSUPP;
+		return fsverity_ioctl_enable(filp, arg);
+
+	case FS_IOC_MEASURE_VERITY:
+		if (!xfs_has_verity(mp))
+			return -EOPNOTSUPP;
+		return fsverity_ioctl_measure(filp, arg);
+
+	case FS_IOC_READ_VERITY_METADATA:
+		if (!xfs_has_verity(mp))
+			return -EOPNOTSUPP;
+		return fsverity_ioctl_read_metadata(filp, arg);
+
 	default:
 		return -ENOTTY;
 	}

-- 
2.50.0

