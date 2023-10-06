Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B4738F98
	for <fsverity@lists.linux.dev>; Fri,  6 Oct 2023 18:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TgWSt/L3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1696618346;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g1rGIaFOcgzEDtbNfKOICnouTJvfDrh5OEfl1tH6mXc=;
	b=TgWSt/L3YVB/JomJeajoi5hUv4SpGD/I058FDdaXUCQFN669vEXbABE3f49Xd4N1VXO6Bl
	94It6r6KQTmthk90OKy+G5p8/x3XNncZbh22/uau4kn1AToKi9kzXNe7Yo01UL4vNPpBll
	860G4/B1ZMSASxyZ24VAA+Vfb232Qac=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-504-JQaCGWx8MA-3d1dEdE1prQ-1; Fri, 06 Oct 2023 14:52:24 -0400
X-MC-Unique: JQaCGWx8MA-3d1dEdE1prQ-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-9b2e030e4caso393335866b.1
        for <fsverity@lists.linux.dev>; Fri, 06 Oct 2023 11:52:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696618343; x=1697223143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g1rGIaFOcgzEDtbNfKOICnouTJvfDrh5OEfl1tH6mXc=;
        b=KoCSDCIHsxJXixw4ajt/WYLoieNVFiVAQmir/4I340NeiLoT4xoPT/Pc3jk8FCNTp8
         +2lvJgo84Q8L87cNaRcBjnfDe+mix/g/IJbQknshGBK/jm1uaaCWwpeFp9FMkFzcL2o5
         A0KlJ0MK+yXLUPNzWZFIztjjGVhK2pwVIB/RkSu1+MzpzUmLZpwpH9HD9Q7RKPyIwa/b
         2RdoJ66GzO6/rynuNl2eLPm2ubNVtQFDwSR9zPjO9cOeC5m+vYQ1d/JJPd1K3t3d0C3t
         mabKkMXJMZwf1maSsFKurw0JLvo1d4m6Gv5xbJHM5sDPhRTAe8qZZ3ZYFgtd4+cnuxEF
         zUNA==
X-Gm-Message-State: AOJu0YwOx1MzZkxjAVjkedJalNl10yfHt9CQRpxuZiufgWOwRcKayieJ
	zXdqK+9whnbvXPOlnqg6+2remeNWMisMBn6E/jKjn+NGUAdEti/jW/b15P+akUzg6r5b01wSTRw
	H8edFG9pV2DRH++jO4GBxjbiS7Q==
X-Received: by 2002:a17:907:9491:b0:9a5:962c:cb6c with SMTP id dm17-20020a170907949100b009a5962ccb6cmr5175902ejc.31.1696618342982;
        Fri, 06 Oct 2023 11:52:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH17nmROYKxmyjF7xwhLbMraoHotdEHwmzzX8X0FXNpicq6vdW0N2QZENxJT12qGNrH88Nkhg==
X-Received: by 2002:a17:907:9491:b0:9a5:962c:cb6c with SMTP id dm17-20020a170907949100b009a5962ccb6cmr5175890ejc.31.1696618342685;
        Fri, 06 Oct 2023 11:52:22 -0700 (PDT)
Received: from localhost.localdomain ([109.183.6.197])
        by smtp.gmail.com with ESMTPSA id os5-20020a170906af6500b009b947f81c4asm3304741ejb.155.2023.10.06.11.52.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 11:52:22 -0700 (PDT)
From: Andrey Albershteyn <aalbersh@redhat.com>
To: linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	fsverity@lists.linux.dev
Cc: djwong@kernel.org,
	ebiggers@kernel.org,
	david@fromorbit.com,
	dchinner@redhat.com,
	Andrey Albershteyn <aalbersh@redhat.com>
Subject: [PATCH v3 05/28] fs: add FS_XFLAG_VERITY for fs-verity sealed inodes
Date: Fri,  6 Oct 2023 20:48:59 +0200
Message-Id: <20231006184922.252188-6-aalbersh@redhat.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231006184922.252188-1-aalbersh@redhat.com>
References: <20231006184922.252188-1-aalbersh@redhat.com>
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

Add extended file attribute FS_XFLAG_VERITY for inodes sealed with
fs-verity.

Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
---
 Documentation/filesystems/fsverity.rst | 9 +++++++++
 include/uapi/linux/fs.h                | 1 +
 2 files changed, 10 insertions(+)

diff --git a/Documentation/filesystems/fsverity.rst b/Documentation/filesystems/fsverity.rst
index 13e4b18e5dbb..af889512c6ac 100644
--- a/Documentation/filesystems/fsverity.rst
+++ b/Documentation/filesystems/fsverity.rst
@@ -326,6 +326,15 @@ the file has fs-verity enabled.  This can perform better than
 FS_IOC_GETFLAGS and FS_IOC_MEASURE_VERITY because it doesn't require
 opening the file, and opening verity files can be expensive.
 
+Extended file attributes
+------------------------
+
+For fs-verity sealed files the FS_XFLAG_VERITY extended file
+attribute is set. The attribute can be observed via lsattr.
+
+    [root@vm:~]# lsattr /mnt/test/foo
+    --------------------V- /mnt/test/foo
+
 .. _accessing_verity_files:
 
 Accessing verity files
diff --git a/include/uapi/linux/fs.h b/include/uapi/linux/fs.h
index b7b56871029c..5172a2eb902c 100644
--- a/include/uapi/linux/fs.h
+++ b/include/uapi/linux/fs.h
@@ -140,6 +140,7 @@ struct fsxattr {
 #define FS_XFLAG_FILESTREAM	0x00004000	/* use filestream allocator */
 #define FS_XFLAG_DAX		0x00008000	/* use DAX for IO */
 #define FS_XFLAG_COWEXTSIZE	0x00010000	/* CoW extent size allocator hint */
+#define FS_XFLAG_VERITY		0x00020000	/* fs-verity sealed inode */
 #define FS_XFLAG_HASATTR	0x80000000	/* no DIFLAG for this	*/
 
 /* the read-only stuff doesn't really belong here, but any other place is
-- 
2.40.1

