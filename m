Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23608330339
	for <fsverity@lists.linux.dev>; Mon, 12 Jan 2026 12:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768220098; cv=none; b=h+Ejdv+V7MM37Ox6eoyGidWw+Nv9n03gDrz04kNbu1uQTZTkkpAqEXudqYY+nojSDsHnTnfvKFyfeIAdR9/sXleOtOjFlJ8MRRoOJcHDgjlyPUwDK8/tola9xpcNxeZplT+y6r13jZTMgt9d6XswFnMHf74ddsx4LRfjTr84D/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768220098; c=relaxed/simple;
	bh=/UA0JwwNENWIoYGMWKzyDfTyT398AFdT9BuVpL0XjcI=;
	h=From:Date:To:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=E9XsyUwbIPgxsk7LmWb5HV/W0JMcQQdr40Z3YCiCowLQjaxmDlUbMA1Zdpuhx1H0VnEJyxjx3qd3ScxGvPgszadDlsTZqqZLF3ymuI2+p74GjR3Eape/c4toE7gjaNDoMAieFjGrjfkw566qMV9zzjoGqRfs5XduVAiwe2aS24A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cLHwINXw; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cLHwINXw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768220096;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nkRKky/Jj6zGEH0vDlk2zWAoS5QM9RjuE8nRTGGh+oQ=;
	b=cLHwINXwXJKZYj7p+gyghqH98s4EM2et2oxiTw5Q3+YGCTi/1Q6HY4lhUcij5D8BXh8iJC
	hEMVzxLQ+P/7rEzBeQNyrgafJHoP21iYZgTnm8ZEOOIBwaMzsoQTJdcYU3U2mqsAA/FP55
	TrqF1djjnDlvq56HS/aWr0dKZuJSS+g=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-582-W_FQQ4cWPG6dHHxhmuqVRA-1; Mon, 12 Jan 2026 07:14:55 -0500
X-MC-Unique: W_FQQ4cWPG6dHHxhmuqVRA-1
X-Mimecast-MFC-AGG-ID: W_FQQ4cWPG6dHHxhmuqVRA_1768220094
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-430fd96b2f5so4722389f8f.3
        for <fsverity@lists.linux.dev>; Mon, 12 Jan 2026 04:14:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768220093; x=1768824893;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nkRKky/Jj6zGEH0vDlk2zWAoS5QM9RjuE8nRTGGh+oQ=;
        b=w1huVuJ/M7+KnbAmOu52Ppx+6bk/lBMkaaWMgdjo/OBORoRKmPgRakwkubxfEeT1wS
         oKygW02jkgTqZ/n4VTsGUd2jod5I620yqINjWacwaIGRSrKho2d1x6U3VSl/QLslsKmH
         LpZmi112BOZDx1zJVasvwlsPZ2XPLWpv2iW9XgtPRDdNXc0nfHuCnYZukvngelbr/w1x
         JwjAvHcjehhBhBcnpQWxtp4aYnG9RE1HvcFbcii4sWSMqerQ5+jVwSjNm8u8qZvPLbxR
         CHnOf8jXx1CtLsnywrndXKq0QQ9XUn6BGIGXXnNedaM60osRUFVS3KU6C4eikdSn6N7e
         M0Ug==
X-Gm-Message-State: AOJu0YzaA9ZmjETTC1oOOOuFTao3EbnCiDIKff3+lxShVTWtCIBpfZ88
	wOUOBd99N0zaDYUqu8jjA2R8ErHV9P3e8NKgOwc56HAHtQsbrJzROoS+v9sR4c/8+/pgyqGS8l5
	dSVD8blGOL11ropbanxOA/GragQ7/j1DXKWINfYd+m/MaLvV5KQslhzXtXBeWfGVwP0BE/AEK5r
	544BGENzlXVvksYr2P43DGPmNDbUCcYlZsf4cwOlgOhLM=
X-Gm-Gg: AY/fxX4ot/o05bylLpMiKNr0yzjbpCTwMm2B1GS2N8ED/Gu+/AISiZ6pYpREYegwbAo
	u7ZLKfrWrjKCq9rvpQHEOr10FM9/haX1yaAMgvMobjvitMYK0yIVcQCyj78Zes5FVVw9smNBbp5
	gbdXQBhCA5IHHu9MCCdawIgn9SDRuT1+AeQ9rb22d+9Wf2Ds9G8Jv/VHw4PTGYn33wNYLWAPpr9
	swW41wMhnCBCyfcaTzxHNIfW3L2uF199xBGt9S3YaGf6o8pH1o6dUUjg5NRmXvsuMOVOYBLRf2s
	dgfcyIhOi1CeQHk5e933+vhsqQCHtAFqwojHBu1FRu3O5YLAq+eOBQv9W8BYQ8ebsAMrgGONr3s
	=
X-Received: by 2002:a05:6000:4287:b0:430:f494:6aad with SMTP id ffacd0b85a97d-432c378a7dfmr18834916f8f.2.1768220093249;
        Mon, 12 Jan 2026 04:14:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE/T8mbp6gJn8+fAsQQnYKpwKUELaqdp5UB+0oPdHIyXQqTegvCHJ5vBHyYA/G1Bo5zoTeCXA==
X-Received: by 2002:a05:6000:4287:b0:430:f494:6aad with SMTP id ffacd0b85a97d-432c378a7dfmr18834878f8f.2.1768220092657;
        Mon, 12 Jan 2026 04:14:52 -0800 (PST)
Received: from thinky ([217.30.74.39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432d286cdecsm24623150f8f.7.2026.01.12.04.14.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 04:14:52 -0800 (PST)
From: Andrey Albershteyn <aalbersh@redhat.com>
X-Google-Original-From: Andrey Albershteyn <aalbersh@kernel.org>
Date: Mon, 12 Jan 2026 13:14:21 +0100
To: fsverity@lists.linux.dev, ebiggers@kernel.org, aalbersh@kernel.org, 
	djwong@kernel.org
Subject: [PATCH 1/2] fs: add FS_XFLAG_VERITY for fs-verity files
Message-ID: <osw6nyp4khzjirdl5mf7ebpcuxlqxqggfez62vcx7bfj5kgksv@pt2bvkxmb5t3>
References: <cover.1768219885.patch-series@thinky>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <cover.1768219885.patch-series@thinky>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: uZUvBqpFGJ1qfybhN_eIWpecQ9Hun9DLTuAOIWPuZic_1768220094
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

fs-verity introduced inode flag for inodes with enabled fs-verity on
them. This patch adds FS_XFLAG_VERITY file attribute which can be
retrieved with FS_IOC_FSGETXATTR ioctl() and file_getattr() syscall. This
flag is read-only and can not be set with corresponding set ioctl() and
file_setattr().

Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org>
---
 Documentation/filesystems/fsverity.rst | 16 ++++++++++++++++
 fs/file_attr.c                         |  4 ++++
 include/linux/fileattr.h               |  2 +-
 include/uapi/linux/fs.h                |  1 +
 4 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/Documentation/filesystems/fsverity.rst b/Documentation/filesystems/fsverity.rst
index 412cf11e32..541ac4af4b 100644
--- a/Documentation/filesystems/fsverity.rst
+++ b/Documentation/filesystems/fsverity.rst
@@ -341,6 +341,22 @@
 FS_IOC_GETFLAGS and FS_IOC_MEASURE_VERITY because it doesn't require
 opening the file, and opening verity files can be expensive.
 
+FS_IOC_FSGETXATTR
+-----------------
+
+Since Linux v6.19, the FS_IOC_FSGETXATTR ioctl sets FS_XFLAG_VERITY (0x00020000)
+in the returned flags when the file has verity enabled. Note that this attribute
+cannot be set with FS_IOC_FSSETXATTR as enabling verity requires input
+parameters. See FS_IOC_ENABLE_VERITY.
+
+file_getattr
+------------
+
+Since Linux v6.19, the file_getattr() syscall sets FS_XFLAG_VERITY (0x00020000)
+in the returned flags when the file has verity enabled. Note that this attribute
+cannot be set with file_setattr() as enabling verity requires input parameters.
+See FS_IOC_ENABLE_VERITY.
+
 .. _accessing_verity_files:
 
 Accessing verity files
diff --git a/fs/file_attr.c b/fs/file_attr.c
index 13cdb31a3e..f44c873af9 100644
--- a/fs/file_attr.c
+++ b/fs/file_attr.c
@@ -37,6 +37,8 @@
 		fa->flags |= FS_DAX_FL;
 	if (fa->fsx_xflags & FS_XFLAG_PROJINHERIT)
 		fa->flags |= FS_PROJINHERIT_FL;
+	if (fa->fsx_xflags & FS_XFLAG_VERITY)
+		fa->flags |= FS_VERITY_FL;
 }
 EXPORT_SYMBOL(fileattr_fill_xflags);
 
@@ -67,6 +69,8 @@
 		fa->fsx_xflags |= FS_XFLAG_DAX;
 	if (fa->flags & FS_PROJINHERIT_FL)
 		fa->fsx_xflags |= FS_XFLAG_PROJINHERIT;
+	if (fa->flags & FS_VERITY_FL)
+		fa->fsx_xflags |= FS_XFLAG_VERITY;
 }
 EXPORT_SYMBOL(fileattr_fill_flags);
 
diff --git a/include/linux/fileattr.h b/include/linux/fileattr.h
index f89dcfad3f..6aebfd63bd 100644
--- a/include/linux/fileattr.h
+++ b/include/linux/fileattr.h
@@ -16,7 +16,7 @@
 
 /* Read-only inode flags */
 #define FS_XFLAG_RDONLY_MASK \
-	(FS_XFLAG_PREALLOC | FS_XFLAG_HASATTR)
+	(FS_XFLAG_PREALLOC | FS_XFLAG_HASATTR | FS_XFLAG_VERITY)
 
 /* Flags to indicate valid value of fsx_ fields */
 #define FS_XFLAG_VALUES_MASK \
diff --git a/include/uapi/linux/fs.h b/include/uapi/linux/fs.h
index 66ca526cf7..70b2b661f4 100644
--- a/include/uapi/linux/fs.h
+++ b/include/uapi/linux/fs.h
@@ -253,6 +253,7 @@
 #define FS_XFLAG_FILESTREAM	0x00004000	/* use filestream allocator */
 #define FS_XFLAG_DAX		0x00008000	/* use DAX for IO */
 #define FS_XFLAG_COWEXTSIZE	0x00010000	/* CoW extent size allocator hint */
+#define FS_XFLAG_VERITY		0x00020000	/* fs-verity enabled */
 #define FS_XFLAG_HASATTR	0x80000000	/* no DIFLAG for this	*/
 
 /* the read-only stuff doesn't really belong here, but any other place is

-- 
- Andrey

