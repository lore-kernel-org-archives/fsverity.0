Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65FE8BA3E
	for <fsverity@lists.linux.dev>; Tue,  4 Apr 2023 14:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680620169;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O6TxF2wDPSZ8VkfH+UnP0K94pMIAUpQJ5kpEzKyPwfU=;
	b=IbPQNTjLYWm0PAejNiB66D/yM8aWcus6Sr0ERQhXWgyv5ol5eVLK6/3c7YkrZm5oGT7EwV
	yNyf21hvuD6WIcple4gxG64GnnAjblvgpNP8yVorjH0AiVIiYMeMPx8NN5lpq2wpGAbD8S
	OGgVIuiDqDX38UW0KKDEHD/ydM2dFQg=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-517-XH-yexOmMrSR36P9hD-KTQ-1; Tue, 04 Apr 2023 10:56:00 -0400
X-MC-Unique: XH-yexOmMrSR36P9hD-KTQ-1
Received: by mail-qt1-f199.google.com with SMTP id l13-20020a05622a174d00b003e4df699997so20089566qtk.20
        for <fsverity@lists.linux.dev>; Tue, 04 Apr 2023 07:56:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680620160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O6TxF2wDPSZ8VkfH+UnP0K94pMIAUpQJ5kpEzKyPwfU=;
        b=hUKbTejf5KofrKBfgq6gLO+8ky/yr36QzYsMdECeBnVLGZ8fcQzlFMxkP8zb7RDUiK
         9btQuAhSL88h0lIPxc9MFUM/QU/oMB5q057y7EymluP91ekny1b06Hn46OODU2tZ9iIL
         zh+mk0R6k30j9j7cysXGkTtu0C24InnXLu9S8IJZVLCyOF9T0QOM+4GLs427GcnC4ZDJ
         6ilOJ0xg8CATz3JVAOPFBWq2mKj809/pZCB6sDS7FXSMEGk8nTOGfLRaEo0tP8RU5Jq1
         P85PSMQSvujvPqANz7cN8ZA7ljJ0RlPr98B5eZQMiFauqbX0VVvLYPhqqhODYF2Uo88g
         ClrA==
X-Gm-Message-State: AAQBX9eFNAigEOb3vUpxRrAA9mteixLNRJJOmH9C20rmlfRSxa53ucyx
	lGtqh2xfncfUKOQwjd4gJyPQGG7evbxbFU7DzSvlXZcXN8xMGTUwGiAkJ7+4q8lnFgCmqVFKMrl
	g1j9ot7rstXOftQNlpg==
X-Received: by 2002:ac8:5b8f:0:b0:3e3:9502:8dfc with SMTP id a15-20020ac85b8f000000b003e395028dfcmr4467465qta.9.1680620159965;
        Tue, 04 Apr 2023 07:55:59 -0700 (PDT)
X-Google-Smtp-Source: AKy350a7eyzBLFAVwLtkZzZp5jojS6UQc2rD1+xfGSjK6d6WcBELJ7jmQgpE+gezZ7mdNPw1AFtdEg==
X-Received: by 2002:ac8:5b8f:0:b0:3e3:9502:8dfc with SMTP id a15-20020ac85b8f000000b003e395028dfcmr4467424qta.9.1680620159602;
        Tue, 04 Apr 2023 07:55:59 -0700 (PDT)
Received: from aalbersh.remote.csb ([109.183.6.197])
        by smtp.gmail.com with ESMTPSA id j4-20020ac86644000000b003e6387431dcsm3296539qtp.7.2023.04.04.07.55.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 07:55:59 -0700 (PDT)
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
Subject: [PATCH v2 23/23] xfs: enable ro-compat fs-verity flag
Date: Tue,  4 Apr 2023 16:53:19 +0200
Message-Id: <20230404145319.2057051-24-aalbersh@redhat.com>
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

Finalize fs-verity integration in XFS by making kernel fs-verity
aware with ro-compat flag.

Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
---
 fs/xfs/libxfs/xfs_format.h | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/fs/xfs/libxfs/xfs_format.h b/fs/xfs/libxfs/xfs_format.h
index ccb2ae5c2c93..a21612319765 100644
--- a/fs/xfs/libxfs/xfs_format.h
+++ b/fs/xfs/libxfs/xfs_format.h
@@ -355,10 +355,11 @@ xfs_sb_has_compat_feature(
 #define XFS_SB_FEAT_RO_COMPAT_INOBTCNT (1 << 3)		/* inobt block counts */
 #define XFS_SB_FEAT_RO_COMPAT_VERITY   (1 << 4)		/* fs-verity */
 #define XFS_SB_FEAT_RO_COMPAT_ALL \
-		(XFS_SB_FEAT_RO_COMPAT_FINOBT | \
-		 XFS_SB_FEAT_RO_COMPAT_RMAPBT | \
-		 XFS_SB_FEAT_RO_COMPAT_REFLINK| \
-		 XFS_SB_FEAT_RO_COMPAT_INOBTCNT)
+		(XFS_SB_FEAT_RO_COMPAT_FINOBT  | \
+		 XFS_SB_FEAT_RO_COMPAT_RMAPBT  | \
+		 XFS_SB_FEAT_RO_COMPAT_REFLINK | \
+		 XFS_SB_FEAT_RO_COMPAT_INOBTCNT| \
+		 XFS_SB_FEAT_RO_COMPAT_VERITY)
 #define XFS_SB_FEAT_RO_COMPAT_UNKNOWN	~XFS_SB_FEAT_RO_COMPAT_ALL
 static inline bool
 xfs_sb_has_ro_compat_feature(
-- 
2.38.4

