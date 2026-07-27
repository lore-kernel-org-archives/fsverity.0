Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13EF3F9298
	for <fsverity@lists.linux.dev>; Mon, 27 Jul 2026 10:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785149337; cv=none; b=PQOlJHX0MoFzJBGEAHutUbt/MgdkHCulsmjWQwtiibzSz1tadC2EmmC1XpF1IznPBVSwwsGqOa2HolxT4Yvf4KJ5L4s6rI50XVzeLwD9Pm+iOxFu6fjz4K53ik6S6t1jHq6sZ/HAAwx98iRR6OtwZzpRoeWnAtk9bE/TD1LG8HU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785149337; c=relaxed/simple;
	bh=eCRRircvREoM/iKBqnGOOGYYVHjFVnNml43mqCwm7tk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=etQD5XovqFRXoNQPnWxg6hesQOwdgLzE76unJQoWp9ABoLTwwGUBOGswhaVXlGeJBGl0s4ji+hRNfQTOX8ebPpzkMoYYzg0YHFVlkP/ORPBPzOg/ndWMOUI8YYBvJ4nVlLwjD4HVB9+1Z6vtZpTgkLlirV75kloO6Z4+Zwo6I/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hEy8hEoX; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hEy8hEoX"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47f71156e1aso1126846f8f.3
        for <fsverity@lists.linux.dev>; Mon, 27 Jul 2026 03:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785149331; x=1785754131; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=neqsEsWHuKT6LwcChvXBKjF2Wl4AED5GjZjnD9EI9lc=;
        b=hEy8hEoXxmS0m/3YOGvkXOwLac4UqhKt3SnPJaPQm18pcQ5atGp5XUNfxXewTQYFJp
         3TvpXSOD0fVBvGTFLSFh69LulNR/3USyMGbO9Uyk+ZJpF8f+ADulvIevJ/otblHyK8L1
         ZtTQLVrTUarstEI2jmNkgYgDytu7sCKxKItRaM1pgkTGPpUGX2sHxAVfdK3ZC4XNYg70
         pqW8Ae7L5HrkCAIYeZPHFUBCQDAjfEUD9aZyyxUFwMIoK9y63nkHKFXq7NChWXI0lLgC
         3xmZqdF2ynw3qjyHjPj96Qo6q7gE+lMe50/hsQohopt2jPFN3bUhESXIfRY+q++bwda1
         eESA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785149331; x=1785754131;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=neqsEsWHuKT6LwcChvXBKjF2Wl4AED5GjZjnD9EI9lc=;
        b=gYbZn19kiTfT/Hn5C++1Mhpf4pxAkJSVsArizxsixRLf6nw8p83zitUdW3qfx7Lgep
         ZN22kob4oL48In+p720QT6LTXnnYM/Z6oPHxa28rAOxqndv1l8dt7dG18B+8AB4YyVlu
         TLGzZJf+syDqb7qISZGCEu0PX9K/cyPGNPsCqeFJ+zoPU9hsR50AyyjO9GjW9uFeA31P
         zBOZKOS1P1Dym89qfh0nd8uzuNLUsg1d4qILXWpyDTcog4XWQ7rbqUVRECMx9W+avMIJ
         ZNkV89HkBQkM2VFxMsr9azbYyflpA2G2GUF/TWia11hekxgXZEgP/fUSI0DRryUMMJxe
         nBiA==
X-Forwarded-Encrypted: i=1; AHgh+RoeR1XjT5JBDFUygiXmf3r+0EfgTBNSYNXdrbvkz2KGOKfaAu3dQc3TQrazwLiEhLnAIkYqDIqFKA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyh2hupvpaRYS6n2vYfkHevJ4YSXY2YWMxaU1eFt+y92pB75ha9
	AElPjHe+c1iyaihC/jG1OCtU3/LGH2PkeWQH0ZJksiI1d3M7xbDghDz/
X-Gm-Gg: AR+sD10Tlp/UUVLXza3GnyowfOTUkvca93oK63eFORakt86PzS0PXqknZwOFjEIO/Aj
	cq1Mh5Lb3r5znfN5tjwuPuafyrUDUZtULFhQ8ICdesZazs8ItfVv119+emYFFg4o4I9kiXtiV5C
	vV6/r0IFPbYLRw1vVg7x/mCVW+s1K6CRcyIJpgwOSv+3vPhuWDy3vNvWXZL437b5/kvd+m1iZsq
	dZOpLvQFNvIW1QL39QpSaG9N+MLJXclfQ630n531q1kofih3Zt4bNeV1FqeP69K8nKk0Hj5X+Ba
	9Z3YAhwFKaP6j+7WrMb4K7rb1ePUzLaFyeIGpFFL/2/wwyAJ2qZBT23KxJLA9y2Cn5bBhvsbJ3g
	63RIQ0yPNoL4ZXXpJLuswCiTx4diSDqxl3wrd0v+klxQ33Av1rX0uaLUld+I5XgHaqSPCZ12iAd
	kx8fAJHg==
X-Received: by 2002:a5d:5d09:0:b0:472:7dce:d8c7 with SMTP id ffacd0b85a97d-47f9fe9e8bbmr10201283f8f.36.1785149330834;
        Mon, 27 Jul 2026 03:48:50 -0700 (PDT)
Received: from spark.Home ([2001:8a0:7280:4000:53fe:effd:424:fa7e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85b9a659sm49056188f8f.6.2026.07.27.03.48.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 03:48:49 -0700 (PDT)
From: Eric Curtin <ericcurtin17@gmail.com>
To: Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>
Cc: Jan Kara <jack@suse.cz>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Eric Biggers <ebiggers@kernel.org>,
	"Theodore Y . Ts'o" <tytso@mit.edu>,
	Gao Xiang <xiang@kernel.org>,
	Chao Yu <chao@kernel.org>,
	fsverity@lists.linux.dev,
	linux-erofs@lists.ozlabs.org,
	linux-fsdevel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Eric Curtin <ericcurtin17@gmail.com>
Subject: [RFC PATCH v2 2/4] erofs: use fs_context source_file for file-backed mounts when given
Date: Mon, 27 Jul 2026 11:48:43 +0100
Message-ID: <20260727104845.2607444-3-ericcurtin17@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260727-gepaukt-eislauf-waran-7c03f0e47609@brauner>
References: <20260727-gepaukt-eislauf-waran-7c03f0e47609@brauner>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

erofs_fc_get_tree() falls back to filp_open(fc->source, ...) itself
when get_tree_bdev_flags() reports the source isn't a block device.
That is the only way to reach erofs's file-backed mount support today,
which means an in-kernel caller that already opened and validated (e.g.
fsverity-checked) that exact file has no way to make erofs mount it: it
can only hand over the path again and trust erofs's independent lookup
to land on the same file, which it has no way to guarantee.

Check fc->source_file first and use it directly when set, taking a
reference and skipping the independent filp_open(fc->source) entirely
(fc->source is unset in this case). This has no effect on the existing
path-based fsconfig()/mount(2) flow, since userspace has no way to set
fc->source_file (see the previous patch); it only enables in-kernel
callers such as the following init/do_mounts.c change.

Signed-off-by: Eric Curtin <ericcurtin17@gmail.com>
---
 fs/erofs/super.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/fs/erofs/super.c b/fs/erofs/super.c
index 802add6652fd..b6cd4fde3ca2 100644
--- a/fs/erofs/super.c
+++ b/fs/erofs/super.c
@@ -799,6 +799,25 @@ static int erofs_fc_get_tree(struct fs_context *fc)
 	if (IS_ENABLED(CONFIG_EROFS_FS_ONDEMAND) && sbi->fsid)
 		return get_tree_nodev(fc, erofs_fc_fill_super);
 
+	/*
+	 * An in-kernel caller (see path_mount_file()) has handed us the
+	 * exact, already-open file to mount, rather than a path for us to
+	 * resolve ourselves: use it directly instead of independently
+	 * re-opening fc->source (which isn't set in this case), so that
+	 * whatever the caller validated about this file - e.g. an fsverity
+	 * digest - is guaranteed to still apply to what actually gets
+	 * mounted.
+	 */
+	if (fc->source_file) {
+		if (!IS_ENABLED(CONFIG_EROFS_FS_BACKED_BY_FILE))
+			return invalf(fc, "File-backed mounts not supported");
+		if (!S_ISREG(file_inode(fc->source_file)->i_mode) ||
+		    !fc->source_file->f_mapping->a_ops->read_folio)
+			return invalf(fc, "Source file is not a plain, read-foliable file");
+		sbi->dif0.file = get_file(fc->source_file);
+		return get_tree_nodev(fc, erofs_fc_fill_super);
+	}
+
 	ret = get_tree_bdev_flags(fc, erofs_fc_fill_super,
 		IS_ENABLED(CONFIG_EROFS_FS_BACKED_BY_FILE) ?
 			GET_TREE_BDEV_QUIET_LOOKUP : 0);
-- 
2.43.0

