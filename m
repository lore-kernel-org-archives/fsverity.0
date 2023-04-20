Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E915028F6
	for <fsverity@lists.linux.dev>; Thu, 20 Apr 2023 07:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681976667;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wlIazMnz9pOTl1ymeBj6LcHkPUdAOxzUMXG5pIjT/Hw=;
	b=HycgSt4ZdXWXphhz0dyX81gJhLx2vqtZVbpZxpkh6bxxAdpnP4uiJAalGA5QawpYucwDTx
	a1/jTLR4svrqtLRr1OVcBeDDDgXQ1nzJu7bMgmlVkjwQPuXQjso5UE1LUT7Fz9MSAWqjvF
	RsTa82JhT5W1UW8kjznfNmuCMLh6FUY=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-151-BpUtfq4XPqCGUCFajUectw-1; Thu, 20 Apr 2023 03:44:26 -0400
X-MC-Unique: BpUtfq4XPqCGUCFajUectw-1
Received: by mail-lf1-f71.google.com with SMTP id 2adb3069b0e04-4ecb06abc1aso177062e87.3
        for <fsverity@lists.linux.dev>; Thu, 20 Apr 2023 00:44:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681976665; x=1684568665;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wlIazMnz9pOTl1ymeBj6LcHkPUdAOxzUMXG5pIjT/Hw=;
        b=hiCMxQ3G7VA+DaJUx95pn7tVpk0fdVOx8MBip9xDtkwe8O+jzyG2j1TkUG/PFgU0Uh
         EkJk8Zm6H8wevU3a+uKnZOciOf+AkJIHgUyl9LkYdqeSXI3pp9bpnWM6C+EG1A7TgFT5
         gUYAu86/NJqW3+2GsbnjmuSi63SzkukpwvP5yy/JfBeu2repY3kqorS9If8BZbSpuLlx
         BXomLbDgb1voUrMFvE0H2uaLoil8a5jtIRSorZCOHGhui92mTOZLviPitno7LbEswZeE
         1wCa43CMp8Wlmg+Mge9RhvUL7j2Gosjc8lxzbL1/pibv8ka8nnDdNVUGQrLxLxG1uomQ
         sHNg==
X-Gm-Message-State: AAQBX9eXS8FADlzaVWncDqz2BPnbt3MjjOEbCSBa68t0VIG8e2fmFFh5
	uiZju5SvPqYMThu4CwADvABJpWj8zO/Nw6CsXdgrAyVazeJAq3QRwa+qwVLwV9Ng9R1i1Ms+Joy
	YciwMnBK9vpPQXbEhs24=
X-Received: by 2002:ac2:51b3:0:b0:4ec:8615:303e with SMTP id f19-20020ac251b3000000b004ec8615303emr153861lfk.33.1681976665501;
        Thu, 20 Apr 2023 00:44:25 -0700 (PDT)
X-Google-Smtp-Source: AKy350YEziSOqiyA9fM17QB4Y5n27W0I+mAplCATFDWAS0IAwiGx01XZ3yJ3qzZFw6GbH5+krOMaiQ==
X-Received: by 2002:ac2:51b3:0:b0:4ec:8615:303e with SMTP id f19-20020ac251b3000000b004ec8615303emr153849lfk.33.1681976665187;
        Thu, 20 Apr 2023 00:44:25 -0700 (PDT)
Received: from localhost.localdomain (c-e6a5e255.022-110-73746f36.bbcust.telenor.se. [85.226.165.230])
        by smtp.googlemail.com with ESMTPSA id x24-20020ac24898000000b004edc7247778sm129468lfc.79.2023.04.20.00.44.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Apr 2023 00:44:24 -0700 (PDT)
From: Alexander Larsson <alexl@redhat.com>
To: miklos@szeredi.hu
Cc: linux-unionfs@vger.kernel.org,
	amir73il@gmail.com,
	ebiggers@kernel.org,
	tytso@mit.edu,
	fsverity@lists.linux.dev,
	Alexander Larsson <alexl@redhat.com>
Subject: [PATCH 0/6] ovl: Add support for fs-verity checking of lowerdata
Date: Thu, 20 Apr 2023 09:43:59 +0200
Message-Id: <cover.1681917551.git.alexl@redhat.com>
X-Mailer: git-send-email 2.39.2
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

This patchset adds support for using fs-verity to validate lowerdata
files by specifying an overlay.verity xattr on the metacopy
files.

This is primarily motivated by the Composefs usecase, where there will
be a read-only EROFS layer that contains redirect into a base data
layer which has fs-verity enabled on all files. However, it is also
useful in general if you want to ensure that the lowerdata files
matches the expected content over time.

This patch series is based on the lazy lowerdata patch series by Amir[1].

I have also added some tests for this feature to xfstests[2].

I'm also CC:ing the fsverity list and maintainers because there is one
(tiny) fsverity change, and there may be interest in this usecase.

[1] https://lore.kernel.org/linux-unionfs/20230412135412.1684197-1-amir73il@gmail.com/T/#m1bc31eb75dc9dd22204b8f0cfc67bad9b6c785a7
[2] https://github.com/alexlarsson/xfstests/commits/verity-tests

Alexander Larsson (6):
  fsverity: Export fsverity_get_digest
  ovl: Break out ovl_entry_path_real() from ovl_i_path_real()
  ovl: Break out ovl_entry_path_lowerdata() from ovl_path_lowerdata()
  ovl: Add framework for verity support
  ovl: Validate verity xattr when resolving lowerdata
  ovl: Handle verity during copy-up

 Documentation/filesystems/overlayfs.rst |  33 +++++
 fs/overlayfs/Kconfig                    |  14 ++
 fs/overlayfs/copy_up.c                  |  27 ++++
 fs/overlayfs/namei.c                    |  34 +++++
 fs/overlayfs/overlayfs.h                |  11 ++
 fs/overlayfs/ovl_entry.h                |   4 +
 fs/overlayfs/super.c                    |  49 +++++++
 fs/overlayfs/util.c                     | 167 ++++++++++++++++++++++--
 fs/verity/measure.c                     |   1 +
 9 files changed, 332 insertions(+), 8 deletions(-)

-- 
2.39.2

