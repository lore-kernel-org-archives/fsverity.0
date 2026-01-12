Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11DFA15665C
	for <fsverity@lists.linux.dev>; Mon, 12 Jan 2026 12:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768220053; cv=none; b=C8ptRZ7CcfHzG9xtj1RZfiX50oUarHu1qi5t1vQ2wEPxXq4pnFgInYLYkLvMPfjWNx96SH+4lslPEnsoeWQN9ily+cES4Xu5zFCNnlF0a5HisIOO/EUdyaeykpkbDDtaSKVG2F0blAXZ4oriwY+FWz7DFgLPY/I4/QKHz68dF6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768220053; c=relaxed/simple;
	bh=s0lkRGn+OPf26LEbMW9zlWOMUVCyx33MWRt0/I84ZIU=;
	h=From:Date:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GXsBuanPCNBsGRnfHuBxzwWuoGhcjoYfmVFaKK7oECD4yaVhg6D60i1kn2rcHFS7x3KlCtLk63wbm+fgx/xnWRqzfZMIFCTmedemR9c1docrrs3Wjw/sw4RWRIxi7e5gFhK73mMGcB+vpKJ9k4/sKMPWUxSIMFYfyCEK2U5vrG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FDBs6O5C; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FDBs6O5C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768220051;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=xlUxWpL0Zl+q7put4ON366tNHi/Wyr0IYc7VL7ENIJ4=;
	b=FDBs6O5Ce3FZWIoylBHYuuNJ80mrHQfW9Hcs9q0VXjm9OZV8ABo0Emmd6mtjtePPQ06UC6
	qhdCvWm3HxkknfiA8/r4TCWIRiSx/GeKdE1kBd9Jgzjm6qb5126PsyWLkEP5Hqcw2q7T5u
	R1+4gSj1rcnudQ7tOdPSFru90aCoIuI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-80-ZutqcbcaP8ePdwrDzaqz7g-1; Mon, 12 Jan 2026 07:14:10 -0500
X-MC-Unique: ZutqcbcaP8ePdwrDzaqz7g-1
X-Mimecast-MFC-AGG-ID: ZutqcbcaP8ePdwrDzaqz7g_1768220049
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-47775585257so43810625e9.1
        for <fsverity@lists.linux.dev>; Mon, 12 Jan 2026 04:14:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768220048; x=1768824848;
        h=content-disposition:mime-version:message-id:subject:to:date:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xlUxWpL0Zl+q7put4ON366tNHi/Wyr0IYc7VL7ENIJ4=;
        b=Sm2wmjA9aqmOh3Y0wG9BPvrMy75xCCKp1KtMHifl5Kod03z/mJ7A89+IfgtixByW9/
         buWWt+W62SEvm8kkglGxdU/fxu6yI22UWEKCAQ94O8LNdbYfRhRf73jyfeDzA0w9Dw5K
         d04e11Fp5Byy7PXJjSwPUGh521hYa4rErMTvgrR1vCKLGI33wE35FyezdemZn/CQyq5o
         2rrq35wq/sEOz/Qofb/5hK2VdKOF5ZMJ6d7IIW2xthWQ96211HVKAWYY9FxkqJb6k1QY
         xgLEbyaucurDaGdCOwbQ7EtdIDRiRdVuLrjDLSsAHw8AwGUf60lolh/QE9UMV3rsFH5k
         ZUgQ==
X-Gm-Message-State: AOJu0YwRA3XXPKHznrBTQQzq1znr+PJAwNdsDd6Aldf9QrLQi6A8/DX6
	XnWJoQpal64qGD3MbPd9enaJ3RTaKdkx3kbG+VZE4KwhMuzx3pafNDsbmkPkZw8ebfVPdVs5hBW
	LObX+HWZW15OeoDdi2UH0k3Nx7ID2eukOIrzZal1uYRKs8wrUv0bau7ziH5j1Y5JKX6XImkQgYQ
	0ye+55O4KWHdc9xSuIdV22WEa1l2f3QViPcEKeq8cdYz0=
X-Gm-Gg: AY/fxX4bMCGJfKuAWZ7zJZ2Uktrc36H9uW1wRpvJTPXVBQCEdPRfkZ6fWRAxXSG5HvP
	sFk1zW7aOL7cGRamQ+5zlckjGQl0HYYGg0NxVs31Txb8dxhwytklI6VXO2Q8l8AwB7KkCwR32tI
	BuVqOhx8/1qwCHgyqqlRU72p5g7aQ/VOBd3079lKBPGZFSSCyipKifjg60KLj0T8dvtBTbgAH9T
	euB8yztf9OCJKkLIxVhvC+9kHWiwmSE2Ph7aqRz9hlioz9KpB7JYNkCZGXFb0E57nUOj98JkeQe
	U4ql19u2h4ypfdP5ONYaZEC98G1FWOM5kdjwSZWXFfl9gNfsdb27KcI86SFAbVgHLuOAdjd1tsI
	=
X-Received: by 2002:a05:600c:6385:b0:477:632a:fd67 with SMTP id 5b1f17b1804b1-47d84b1a166mr200753355e9.12.1768220048189;
        Mon, 12 Jan 2026 04:14:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFX9sL32kuKf7xE5BHndI9cjjE5zBPXyzfwobNJF1wEGXXWLoS3W0GJh5sa63koDAX8nbYtbg==
X-Received: by 2002:a05:600c:6385:b0:477:632a:fd67 with SMTP id 5b1f17b1804b1-47d84b1a166mr200752965e9.12.1768220047602;
        Mon, 12 Jan 2026 04:14:07 -0800 (PST)
Received: from thinky ([217.30.74.39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0dad8bsm38765424f8f.8.2026.01.12.04.14.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 04:14:07 -0800 (PST)
From: Andrey Albershteyn <aalbersh@redhat.com>
X-Google-Original-From: Andrey Albershteyn <aalbersh@kernel.org>
Date: Mon, 12 Jan 2026 13:13:35 +0100
To: fsverity@lists.linux.dev, ebiggers@kernel.org, aalbersh@kernel.org, 
	djwong@kernel.org
Subject: [PATCH 0/3] Add traces and file attributes for fs-verity
Message-ID: <cover.1768219885.patch-series@thinky>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: y2X6umYugTow2DZeYSWOTW56H6RBR7k-pctwmpnrRkE_1768220049
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

This two small patches grew from fs-verity XFS patchset. I think
they're self-contained improvements which could go without XFS
implementation.

Andrey Albershteyn <aalbersh@kernel.org>:
  fs: add FS_XFLAG_VERITY for fs-verity files
  fsverity: add tracepoints

Diffstat:
  Documentation/filesystems/fsverity.rst |  16 ++++++++++++++++
  MAINTAINERS                            |   1 +
  fs/file_attr.c                         |   4 ++++
  fs/verity/enable.c                     |   4 ++++
  fs/verity/fsverity_private.h           |   2 ++
  fs/verity/init.c                       |   1 +
  fs/verity/verify.c                     |   9 +++++++++
  include/linux/fileattr.h               |   2 +-
  include/trace/events/fsverity.h        | 143 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  include/uapi/linux/fs.h                |   1 +
  10 files changed, 182 insertions(+), 1 deletion(-)

-- 
- Andrey

