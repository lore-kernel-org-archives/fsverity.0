Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1455DED2
	for <fsverity@lists.linux.dev>; Wed,  3 May 2023 08:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683103918;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w0VxTZdYvYJJpJt4f1CWhQCMN6thwfx97+dJKO1TgUg=;
	b=dJWRn0c0zywAKegE1amoWBwBxUuL1/MWnD2hSAK9D3dcpQgSxgQaD5vjijr3HbKXey1lT7
	Fi1fWxCFoXqwoQKd3++d8xc9DLvsC1NZoCZn30KhxXq0pN0np6wS2XaJLyyLjSMUR6qci7
	TApOW57asUYrD2crdV/ejjjthpdyecU=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-427-bqjhupYdOOagnGbabKF9rQ-1; Wed, 03 May 2023 04:51:57 -0400
X-MC-Unique: bqjhupYdOOagnGbabKF9rQ-1
Received: by mail-lj1-f200.google.com with SMTP id 38308e7fff4ca-2a8be1c1844so24029641fa.3
        for <fsverity@lists.linux.dev>; Wed, 03 May 2023 01:51:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683103915; x=1685695915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w0VxTZdYvYJJpJt4f1CWhQCMN6thwfx97+dJKO1TgUg=;
        b=ZakxKXOFgIP++38sUh8JAgi4tMHxIjj9Ok786ZvPDioMOXM6vycaP2uhD/YXtjxSwo
         Ru3sl68OMMp6EJYxalXWu6DT33LbXfLM0nUPDXwJVN02rQ9EdNQMF9AhTDD42TZma+XE
         XqTkIjWL6dk6FaW/Idy2do6jmEilCdiCPgaJfaI1OLd8CLEAO3nz2s+DYnWxSynhutOy
         Wvb7YZeXjX2Oqnd00NLoB+DVJ3VZaaURmwAxb/th1xEAEciVmeq5+fiSBfS2dr6ibf/v
         1Kq8F5RaJDv/DLIfhxyHwLI8RPVbrc4BjZBCSY6Pd8BK/3VqXBMyxSLAT0WHfyNJMTV9
         3QLA==
X-Gm-Message-State: AC+VfDx6kgXtWiEsysMdSV7bKT57GZuFE5LYqxnG4KVBGQjqYlPTe/PS
	p1XQIq0nrU+fo2zIiuSkdomMguq+uX3rsbWKo7DIE/PriA+rvWwemBAe9f9bDbCvMr4RYtFJLGI
	G8A8N133wm64P100eG6o=
X-Received: by 2002:ac2:410b:0:b0:4ec:8596:918b with SMTP id b11-20020ac2410b000000b004ec8596918bmr769944lfi.24.1683103915597;
        Wed, 03 May 2023 01:51:55 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7s2nioBDBre/9YYc1rxWYzSkRPrtaIAepxt562IrVn/o804+eY82qdLC3B2qSUScqlyA+z5A==
X-Received: by 2002:ac2:410b:0:b0:4ec:8596:918b with SMTP id b11-20020ac2410b000000b004ec8596918bmr769937lfi.24.1683103915310;
        Wed, 03 May 2023 01:51:55 -0700 (PDT)
Received: from localhost.localdomain (c-e6a5e255.022-110-73746f36.bbcust.telenor.se. [85.226.165.230])
        by smtp.googlemail.com with ESMTPSA id j6-20020ac24546000000b004ed4fa5f20fsm5907089lfm.25.2023.05.03.01.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 01:51:54 -0700 (PDT)
From: Alexander Larsson <alexl@redhat.com>
To: miklos@szeredi.hu
Cc: linux-unionfs@vger.kernel.org,
	amir73il@gmail.com,
	ebiggers@kernel.org,
	tytso@mit.edu,
	fsverity@lists.linux.dev,
	Alexander Larsson <alexl@redhat.com>
Subject: [PATCH v2 1/6] fsverity: Export fsverity_get_digest
Date: Wed,  3 May 2023 10:51:34 +0200
Message-Id: <ff458c6bcf6bd9ab10dbcb80894ea24d34f9f7c6.1683102959.git.alexl@redhat.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1683102959.git.alexl@redhat.com>
References: <cover.1683102959.git.alexl@redhat.com>
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
2.39.2

