Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 024B428F6
	for <fsverity@lists.linux.dev>; Thu, 20 Apr 2023 07:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681976670;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w0VxTZdYvYJJpJt4f1CWhQCMN6thwfx97+dJKO1TgUg=;
	b=VfLBAOQuNUyDNvHx4V7CiR1OMncG5nT3SUPiIQiHVIKIdyfa6n9WWllUcZs4nh6nqKGYSI
	9gE8szken4vRThBHqaNXfu7OTeqY7S4sqV4Tt5cssRhznZa1rw+d8Klc+HTqXq8907eFSJ
	I5U/tbi7xl83LiGQ0E3MD6cY0pccLCg=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-339-eDbFzHZ6P9y6L7zFiLb8Qg-1; Thu, 20 Apr 2023 03:44:29 -0400
X-MC-Unique: eDbFzHZ6P9y6L7zFiLb8Qg-1
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-4ecb207aab0so198733e87.1
        for <fsverity@lists.linux.dev>; Thu, 20 Apr 2023 00:44:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681976668; x=1684568668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w0VxTZdYvYJJpJt4f1CWhQCMN6thwfx97+dJKO1TgUg=;
        b=WTQ7UkKZhOJGIfjD1cmzbfUG8ltIEzKE6GmCoM9sZBvj+Uit2o6iDbMnj4C2SkhRuf
         /irPi8k5cAFH+agICmpuPkDlzkhvum5lScE2X5Nd8bPycGWFuIR8+ttpheM+uU/AqrPu
         I6AKvHDtqOS76w6A28n+DvLLJbOisUjQLazyk0IiFL9GxhVmxjUMnz1xZOG+U0r/EvzW
         5rEnXtVPumejS8Ir3Bq8fC6Jxp2ZvpQ8aOyceuYiLmeT2VW9XcegePwBo2FBvTHIbhxy
         mZhj3iUKGX+wwMtw2muqal+3sVOeZX5EX3axHQ2HswqhijqX2KyJWyIonYfiHwPT+lQW
         2gIA==
X-Gm-Message-State: AAQBX9fSgXFORL7p+fHrjK0VM2SX90I1UJVNlSTh9CYf+kDW2guenif2
	Z2FB4oDQyBKpz75KkXw5JoIcIm5AvBFwSg9FxKLd+FWAxCZh3uM7TxlruQggGY5WZy8WQvDuiEU
	U+GgVSc6EbEGNlnwx8THnJ8YcdBM=
X-Received: by 2002:a19:ac0d:0:b0:4e9:59cd:416c with SMTP id g13-20020a19ac0d000000b004e959cd416cmr167073lfc.0.1681976668157;
        Thu, 20 Apr 2023 00:44:28 -0700 (PDT)
X-Google-Smtp-Source: AKy350Z7IEfs0fAM7ebAg8DXVOr8q6egC2Kzod/k8cQl1IYX07gfmo+OuSG7Na72Eh/GwKepAXSnkg==
X-Received: by 2002:a19:ac0d:0:b0:4e9:59cd:416c with SMTP id g13-20020a19ac0d000000b004e959cd416cmr167067lfc.0.1681976668012;
        Thu, 20 Apr 2023 00:44:28 -0700 (PDT)
Received: from localhost.localdomain (c-e6a5e255.022-110-73746f36.bbcust.telenor.se. [85.226.165.230])
        by smtp.googlemail.com with ESMTPSA id x24-20020ac24898000000b004edc7247778sm129468lfc.79.2023.04.20.00.44.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Apr 2023 00:44:27 -0700 (PDT)
From: Alexander Larsson <alexl@redhat.com>
To: miklos@szeredi.hu
Cc: linux-unionfs@vger.kernel.org,
	amir73il@gmail.com,
	ebiggers@kernel.org,
	tytso@mit.edu,
	fsverity@lists.linux.dev,
	Alexander Larsson <alexl@redhat.com>
Subject: [PATCH 1/6] fsverity: Export fsverity_get_digest
Date: Thu, 20 Apr 2023 09:44:00 +0200
Message-Id: <9602bc96aff2506906d5d7ac4f67b137f16bc95a.1681917551.git.alexl@redhat.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1681917551.git.alexl@redhat.com>
References: <cover.1681917551.git.alexl@redhat.com>
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

