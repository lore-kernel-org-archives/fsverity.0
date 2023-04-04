Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C282FAE
	for <fsverity@lists.linux.dev>; Tue,  4 Apr 2023 14:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680620101;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I6je06aEmhF92s7sMY7DVi3uR44iZ0FPA/bMk0qTbjY=;
	b=SQb8yHWMvzMBsLVLdhaVAFt6X0ngmUjjMA4fgqYg0oNgREFBbCBgxR2rhpkL/BvwPWBJ4F
	qKVVJpUx+h+tHSlq6CQmA89n8q0y7Kb2b8+Ts/Cmxk96MvYVZ7RYlWm034Voso0RaT7eYB
	MjXbC3InscDJehUunC9xdLjsol2poL0=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-602-cPEDTQ-uPFOzK8ZpObo5Eg-1; Tue, 04 Apr 2023 10:55:00 -0400
X-MC-Unique: cPEDTQ-uPFOzK8ZpObo5Eg-1
Received: by mail-qk1-f197.google.com with SMTP id 198-20020a370bcf000000b007468cffa4e2so14831063qkl.10
        for <fsverity@lists.linux.dev>; Tue, 04 Apr 2023 07:54:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680620099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I6je06aEmhF92s7sMY7DVi3uR44iZ0FPA/bMk0qTbjY=;
        b=TRFmYQ2P4+WycySqqTWq91KFiJbHC4IqwsBraijJo+jsXo54hw+ANL9E36nVTIDAZm
         AkXRp79hvl78kLhhwQjtNlZ/d0TOcRSMn/OHCYBPMKKZ6JxjaDpigQz3NbRYtdlu8Wg4
         EmbY9epjDDx30eFuKVHDc3BTZc4UOwcbL3oMDescQQ6iGQEFUqPS1+lDp6WbUNGiB1jd
         C/T5ehS2JOszSga1/UTK4zraBi9dqQ6/zLrWlHn/uUqFvhQcEScb66oAboR/J6vNbeO7
         uy4PjWhWzhtReGX49iNxJZ8DEcucflgVWSgOoPUDJVOvJFs0zidUeZqKxYxUFWMNK+xV
         y33g==
X-Gm-Message-State: AAQBX9fTh0MUKZL6RkUX7mlGDlbQ3oVcI7iNPgrRWsI5kgY/8v4DaFu8
	+VyvSGT9JzO1T1chVBswCmiv3NhW4d9RBAiEWznXdMSKdBNPY5KZ0WpsDBB+yQ/ZTIwexXvxGv6
	WY0nEGw+97E/4G85PTw==
X-Received: by 2002:a05:622a:189e:b0:3bc:dd21:4a0 with SMTP id v30-20020a05622a189e00b003bcdd2104a0mr3575660qtc.30.1680620099214;
        Tue, 04 Apr 2023 07:54:59 -0700 (PDT)
X-Google-Smtp-Source: AKy350ba/Mx2sYrhvQuuxEbUABini+6j6yzJy9T6p4OPPcKlZcS6dLVBbS/lM0x+VENbSuVT7xiskA==
X-Received: by 2002:a05:622a:189e:b0:3bc:dd21:4a0 with SMTP id v30-20020a05622a189e00b003bcdd2104a0mr3575618qtc.30.1680620098846;
        Tue, 04 Apr 2023 07:54:58 -0700 (PDT)
Received: from aalbersh.remote.csb ([109.183.6.197])
        by smtp.gmail.com with ESMTPSA id j4-20020ac86644000000b003e6387431dcsm3296539qtp.7.2023.04.04.07.54.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 07:54:58 -0700 (PDT)
From: Andrey Albershteyn <aalbersh@redhat.com>
To: djwong@kernel.org,
	dchinner@redhat.com,
	ebiggers@kernel.org,
	hch@infradead.org,
	linux-xfs@vger.kernel.org,
	fsverity@lists.linux.dev
Cc: rpeterso@redhat.com,
	agruenba@redhat.com,
	xiang@kernel.org,
	chao@kernel.org,
	damien.lemoal@opensource.wdc.com,
	jth@kernel.org,
	linux-erofs@lists.ozlabs.org,
	linux-btrfs@vger.kernel.org,
	linux-ext4@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	cluster-devel@redhat.com,
	Andrey Albershteyn <aalbersh@redhat.com>
Subject: [PATCH v2 05/23] fsverity: make fsverity_verify_folio() accept folio's offset and size
Date: Tue,  4 Apr 2023 16:53:01 +0200
Message-Id: <20230404145319.2057051-6-aalbersh@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230404145319.2057051-1-aalbersh@redhat.com>
References: <20230404145319.2057051-1-aalbersh@redhat.com>
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

Not the whole folio always need to be verified by fs-verity (e.g.
with 1k blocks). Use passed folio's offset and size.

Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
---
 include/linux/fsverity.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/include/linux/fsverity.h b/include/linux/fsverity.h
index 119a3266791f..6d7a4b3ea626 100644
--- a/include/linux/fsverity.h
+++ b/include/linux/fsverity.h
@@ -249,9 +249,10 @@ static inline void fsverity_enqueue_verify_work(struct work_struct *work)
 
 #endif	/* !CONFIG_FS_VERITY */
 
-static inline bool fsverity_verify_folio(struct folio *folio)
+static inline bool fsverity_verify_folio(struct folio *folio, size_t len,
+					 size_t offset)
 {
-	return fsverity_verify_blocks(folio, folio_size(folio), 0);
+	return fsverity_verify_blocks(folio, len, offset);
 }
 
 static inline bool fsverity_verify_page(struct page *page)
-- 
2.38.4

