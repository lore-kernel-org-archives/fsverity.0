Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D65879DBA
	for <fsverity@lists.linux.dev>; Mon,  4 Mar 2024 19:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709579541; cv=none; b=UUXUoUruZjBrcwHYbjfcZqKMS/c0eXM2upug2FoBnmANbnTF7VEvJ2O3/d8rztR8xLYkD+Ja6xNa/PfN6hcGKTQZSo6TQCcdzWCtJfB/TChkrBp1rv2Fz3yGuRitzu7ozwwpR6v87Ue7+/buKyXboI/zzNsGpGVoXhgSJoa5I/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709579541; c=relaxed/simple;
	bh=RsSA5HXP4XdTMyeDSklbX2t9chAOtXyvct70Wpdi/s8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aYxpVkLDZM+2fDY99OMMeEbk4T/+qOufOaIakEGAvvMy+8e44QGm+y7GBegUOnbNcUIUqFe7V/ahujPD/SF6GdME95NSmId+GPrvXa63sGfkKXWS/HWXq2Jk7ykK32j+JRqicNRtSmLoGvCi/Qjkk6GVcf/DdVhIIxuwrFEX7Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bVivn2Is; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bVivn2Is"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709579538;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GLiAPlULZquK5Brfr95QLdeh/hZ5v9ntg4e4aq6YwHM=;
	b=bVivn2Ispu+P8qilsKx4wkSo8GH+P/4PgbLjEvygFDqP+fn0LRKj37hIGWu1GpST2XeYJf
	plK9qFUaYuPX01kWFsh5aWT/Rx8Vtsymk3PyZG6sHyD8wJEr4OkPDCdIBTfPkggSEte1uh
	MpeQzjl3u9RWigm+8sJC2XvNrx9wAKc=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-7-ZitWRpVxNPuG1XSCemujKw-1; Mon, 04 Mar 2024 14:12:17 -0500
X-MC-Unique: ZitWRpVxNPuG1XSCemujKw-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a357c92f241so345822666b.0
        for <fsverity@lists.linux.dev>; Mon, 04 Mar 2024 11:12:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709579536; x=1710184336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GLiAPlULZquK5Brfr95QLdeh/hZ5v9ntg4e4aq6YwHM=;
        b=eEeQtOd2nH6BMKrLE7r07hnhVMtgrswK+rxj5J+GRo7hlFDPuNRxMJ1ssW7hz9QNOL
         KBCMx1XZT/6OiwVqZmGoM1oMk7y+V1dhlhA/Isb1UvanatxZrFVyj52J9uKX26nsbn4a
         3uz0H2Ja4ybb5dFwBc4R8Wg9rOHUI3v/ZmJXwGab6EAApEXauYBLt7u9axnTHkRqRDaJ
         jEMbjybxk+iaGWxMdDt9GDhg3dugdHIT0i0kXMoLRTMyJX+Z6D0ueSwtXZIN09CAp0/Y
         jIuGeYWZRNNmGxgygZa95aGPiqJ5j2OhfuXL9afnf4OIIoqCIxy2Y6Gis1PRuc05ziUx
         0Rvw==
X-Gm-Message-State: AOJu0Ywab4nSn+Z+xv9zbS0yyV64jEyDo/T5l0UAPgtTIaLi/vyLH5cV
	dW8SI7H4ooDOfUoXjjkV3h9i/I6rQfjSX8gaD05/LaUqLK4h1EczGXOVm9SiTcHFryFdc58/qFc
	CERtyl58k6UmaO3zHdqFKkujbTu1cN8zN+eTpCp379as0TIV9BmtCgWQ0dkPedihDP3evYiO8AQ
	8apwBCtlRbZ1sctWTIcyRyuW9IB/xKk91vjDoWtw4=
X-Received: by 2002:a17:906:13d5:b0:a45:95f5:f314 with SMTP id g21-20020a17090613d500b00a4595f5f314mr344247ejc.42.1709579535595;
        Mon, 04 Mar 2024 11:12:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFx8vfrZMAjuMwszwGXOM9gKTiOkhdQUg8Hw3nl4YJ4PBoUGUn4W527I5Al2Nj2TIVW4ljXsA==
X-Received: by 2002:a17:906:13d5:b0:a45:95f5:f314 with SMTP id g21-20020a17090613d500b00a4595f5f314mr344237ejc.42.1709579535279;
        Mon, 04 Mar 2024 11:12:15 -0800 (PST)
Received: from thinky.redhat.com ([109.183.6.197])
        by smtp.gmail.com with ESMTPSA id a11-20020a1709064a4b00b00a44a04aa3cfsm3783319ejv.225.2024.03.04.11.12.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 11:12:14 -0800 (PST)
From: Andrey Albershteyn <aalbersh@redhat.com>
To: fsverity@lists.linux.dev,
	linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	chandan.babu@oracle.com,
	djwong@kernel.org,
	ebiggers@kernel.org
Cc: Andrey Albershteyn <aalbersh@redhat.com>
Subject: [PATCH v5 05/24] fs: add FS_XFLAG_VERITY for verity files
Date: Mon,  4 Mar 2024 20:10:28 +0100
Message-ID: <20240304191046.157464-7-aalbersh@redhat.com>
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

Add extended attribute FS_XFLAG_VERITY for inodes with fs-verity
enabled.

Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
---
 Documentation/filesystems/fsverity.rst |  8 ++++++++
 fs/ioctl.c                             | 11 +++++++++++
 include/uapi/linux/fs.h                |  1 +
 3 files changed, 20 insertions(+)

diff --git a/Documentation/filesystems/fsverity.rst b/Documentation/filesystems/fsverity.rst
index 13e4b18e5dbb..887cdaf162a9 100644
--- a/Documentation/filesystems/fsverity.rst
+++ b/Documentation/filesystems/fsverity.rst
@@ -326,6 +326,14 @@ the file has fs-verity enabled.  This can perform better than
 FS_IOC_GETFLAGS and FS_IOC_MEASURE_VERITY because it doesn't require
 opening the file, and opening verity files can be expensive.
 
+FS_IOC_FSGETXATTR
+-----------------
+
+Since Linux v6.9, the FS_IOC_FSGETXATTR ioctl sets FS_XFLAG_VERITY (0x00020000)
+in the returned flags when the file has verity enabled. Note that this attribute
+cannot be set with FS_IOC_FSSETXATTR as enabling verity requires input
+parameters. See FS_IOC_ENABLE_VERITY.
+
 .. _accessing_verity_files:
 
 Accessing verity files
diff --git a/fs/ioctl.c b/fs/ioctl.c
index 76cf22ac97d7..38c00e47c069 100644
--- a/fs/ioctl.c
+++ b/fs/ioctl.c
@@ -481,6 +481,8 @@ void fileattr_fill_xflags(struct fileattr *fa, u32 xflags)
 		fa->flags |= FS_DAX_FL;
 	if (fa->fsx_xflags & FS_XFLAG_PROJINHERIT)
 		fa->flags |= FS_PROJINHERIT_FL;
+	if (fa->fsx_xflags & FS_XFLAG_VERITY)
+		fa->flags |= FS_VERITY_FL;
 }
 EXPORT_SYMBOL(fileattr_fill_xflags);
 
@@ -511,6 +513,8 @@ void fileattr_fill_flags(struct fileattr *fa, u32 flags)
 		fa->fsx_xflags |= FS_XFLAG_DAX;
 	if (fa->flags & FS_PROJINHERIT_FL)
 		fa->fsx_xflags |= FS_XFLAG_PROJINHERIT;
+	if (fa->flags & FS_VERITY_FL)
+		fa->fsx_xflags |= FS_XFLAG_VERITY;
 }
 EXPORT_SYMBOL(fileattr_fill_flags);
 
@@ -641,6 +645,13 @@ static int fileattr_set_prepare(struct inode *inode,
 	    !(S_ISREG(inode->i_mode) || S_ISDIR(inode->i_mode)))
 		return -EINVAL;
 
+	/*
+	 * Verity cannot be set through FS_IOC_FSSETXATTR/FS_IOC_SETFLAGS.
+	 * See FS_IOC_ENABLE_VERITY
+	 */
+	if (fa->fsx_xflags & FS_XFLAG_VERITY)
+		return -EINVAL;
+
 	/* Extent size hints of zero turn off the flags. */
 	if (fa->fsx_extsize == 0)
 		fa->fsx_xflags &= ~(FS_XFLAG_EXTSIZE | FS_XFLAG_EXTSZINHERIT);
diff --git a/include/uapi/linux/fs.h b/include/uapi/linux/fs.h
index 48ad69f7722e..b1d0e1169bc3 100644
--- a/include/uapi/linux/fs.h
+++ b/include/uapi/linux/fs.h
@@ -140,6 +140,7 @@ struct fsxattr {
 #define FS_XFLAG_FILESTREAM	0x00004000	/* use filestream allocator */
 #define FS_XFLAG_DAX		0x00008000	/* use DAX for IO */
 #define FS_XFLAG_COWEXTSIZE	0x00010000	/* CoW extent size allocator hint */
+#define FS_XFLAG_VERITY		0x00020000	/* fs-verity enabled */
 #define FS_XFLAG_HASATTR	0x80000000	/* no DIFLAG for this	*/
 
 /* the read-only stuff doesn't really belong here, but any other place is
-- 
2.42.0

