Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D373318AE1
	for <fsverity@lists.linux.dev>; Mon, 12 Jun 2023 10:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686565657;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MOlfdaPnMmUP9g7vcnNIn0Q1D7Ns0mSoof416/Dem7s=;
	b=Y28Z1cgYlkXmnsXuR4v+iQMOL2jTDxEizXnEpkmEj3v0pu7ciaiK5LHhMGvM0o5tyl79wO
	MCYoiIkC/MUksMyKcVTxiSN6xfgLsnudCd6jfc1zv/qHJG8lTlkoAwy48PEnP319t/vM7p
	MlbGa5lVJqvlWFwEK0GnlPiDS8pg5Os=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-341-piRnNV4JOWWzS1vkbXEnXA-1; Mon, 12 Jun 2023 06:27:36 -0400
X-MC-Unique: piRnNV4JOWWzS1vkbXEnXA-1
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-4f517b5309cso2808819e87.1
        for <fsverity@lists.linux.dev>; Mon, 12 Jun 2023 03:27:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686565655; x=1689157655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MOlfdaPnMmUP9g7vcnNIn0Q1D7Ns0mSoof416/Dem7s=;
        b=Y0QeLtbtoSuQPn97rqcEdPGOPILUQpxBSgAgihtTB0YOTA3IfEPaBd9hf8p20VvjO0
         x3FhEYgUBAUc+U8CCK25HgCxYoVRv6j+RLJ5M3vZ8/DyOj02zJ7zQpiUYU6p4PHjN9/P
         DnGZ6tOSAYUc7VuXuY+WXdzxI9ySjlLw1PBF+KoafcY49CTmxPg1PnO/TjFZn9eNm1qG
         EUoXXGRtifFFzdU5gBBpHTENdFqGz+6bYclPgcqCSdcJGO0iKP+3gwlbbqcMpZcgHLbX
         eeQJ5pST7QhtoqVK6w8K1aogQH1VG/K6UczsJpUAZ9g6IAaqCjhceWNFWFhnAzfDtW2D
         YEug==
X-Gm-Message-State: AC+VfDzDstgRbr2HsLWPaOJlB3yahHGChDD3K6JUqPwbaGjfccgp5u3b
	pIQsPw4TM3Haa8JaFOpjkPHLzYqqyjmVj+PIV/GM85iHp+RXX6bFO0XU+AtDx085kakpHU2X1/4
	7SkTtv6XquaHBQhA3UgQlY4FJDGw=
X-Received: by 2002:a2e:7202:0:b0:2b2:10e2:af0a with SMTP id n2-20020a2e7202000000b002b210e2af0amr2396407ljc.33.1686565654818;
        Mon, 12 Jun 2023 03:27:34 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6Tlb2tgmCHslDPEzeAtOL6Icrk3GS4shFBMdzO/O//Sb0hXSor67hV+FKKKU9/Vvd1R6p5OQ==
X-Received: by 2002:a2e:7202:0:b0:2b2:10e2:af0a with SMTP id n2-20020a2e7202000000b002b210e2af0amr2396391ljc.33.1686565654453;
        Mon, 12 Jun 2023 03:27:34 -0700 (PDT)
Received: from localhost.localdomain (c-e6a5e255.022-110-73746f36.bbcust.telenor.se. [85.226.165.230])
        by smtp.googlemail.com with ESMTPSA id m25-20020a2e8719000000b002b1fc6e70a1sm1709095lji.21.2023.06.12.03.27.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 03:27:34 -0700 (PDT)
From: Alexander Larsson <alexl@redhat.com>
To: miklos@szeredi.hu
Cc: linux-unionfs@vger.kernel.org,
	amir73il@gmail.com,
	ebiggers@kernel.org,
	tytso@mit.edu,
	fsverity@lists.linux.dev,
	Alexander Larsson <alexl@redhat.com>
Subject: [PATCH v3 1/4] fsverity: Export fsverity_get_digest
Date: Mon, 12 Jun 2023 12:27:16 +0200
Message-Id: <ead88201cfbf072f429a9db24fd7e4a86ea38e99.1686565330.git.alexl@redhat.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <cover.1686565330.git.alexl@redhat.com>
References: <cover.1686565330.git.alexl@redhat.com>
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

Overlayfs needs to call this when built in module form, so
we need to export the symbol. This uses EXPORT_SYMBOL_GPL
like the other fsverity functions do.

Signed-off-by: Alexander Larsson <alexl@redhat.com>
---
 fs/verity/measure.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/verity/measure.c b/fs/verity/measure.c
index 5c79ea1b2468..875d143e0c7e 100644
--- a/fs/verity/measure.c
+++ b/fs/verity/measure.c
@@ -85,3 +85,4 @@ int fsverity_get_digest(struct inode *inode,
 	*alg = hash_alg->algo_id;
 	return 0;
 }
+EXPORT_SYMBOL_GPL(fsverity_get_digest);
-- 
2.40.1

