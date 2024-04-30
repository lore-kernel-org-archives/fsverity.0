Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 139F713DB92
	for <fsverity@lists.linux.dev>; Tue, 30 Apr 2024 12:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714480150; cv=none; b=pXUtBo5ej/1mGpDiTMJA/5ji9nwz9SeuXFl3ljbbIl6jKp9sTIZhs6GmKaQtsMv7h5xlpq7p3cRg/OEHbShxgfycGNl8NQ9XKK/tJGd7AQUKzhncaX5W2VHuNOg1TSq+YVWSEmvZtD7nUIzGKH01VCzq3bwjcNkZxv1Q3TC/6ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714480150; c=relaxed/simple;
	bh=rvl2LGQYTgzq38mG6SzOpcDNFvD/j4jBEIgOtnfpgmM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=EvUNAecvB5gjULxHJxB2hOC8UpOBtUhL9W9Idk8KmO+hrFZJqCx8/luduo55O6+iku4WmJ+MG1dWT9wg+q9JBk3Y3ukRRfCSoQ8b0Rr1UgiyRK+l8YuJ1cUZh0NNFsFSuLlXp3pEcndrIcakbvVmFXHSsjF6Ycv4edbz2caeLME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=V1GkuDft; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="V1GkuDft"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714480148;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PSKTo0fsUqmzxcGkY1pyXO8izPBGY9fWGNOTqw95lTQ=;
	b=V1GkuDft48AycKGR997oeX+ZQCEn2VDP6qJan0o3YZHTOUo5GF7hkkaQncDBT/RRjPq7vO
	M3QzUjf3t8zF4x3CWWDUGFc7v9ETovOHkmViCnnaF/2gQxK6qID0ToSFdcpZm045hqRC0s
	Wzw0ASv2sO9nKRN/QOW1nLzHEQqiRng=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-569-TrrTcRN6PgW8lkhLk-ZZrA-1; Tue, 30 Apr 2024 08:29:06 -0400
X-MC-Unique: TrrTcRN6PgW8lkhLk-ZZrA-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a5564a2e3a5so412357766b.1
        for <fsverity@lists.linux.dev>; Tue, 30 Apr 2024 05:29:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714480145; x=1715084945;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PSKTo0fsUqmzxcGkY1pyXO8izPBGY9fWGNOTqw95lTQ=;
        b=fceButsNVuLV549yYLfb+iYKZaLiaHNaL9dKXf+mXYpccPDyaY/4f6KNatVzoR/VTU
         yZwp18E/AGYxqXxGrGTdokpj14bYuDfpx02PnfiNSRtheMTQlShMcMzNENB4XXUHuZuv
         AU8q1JnPwVTtXNSsEuyE1x5yTVycca+4H4KPF3xlpMXIhMy6mj0yEhh5l0bZLc2Wyh01
         pGA7uKxbXjfVgp0bvC4q5Y0SzINarb2WyWD7chV1M03RGn1UD/Wu1ZanXqLqYXDqyIB/
         ZTH7Vvtxk4/65YEMy/Kl51cK9uw4bfm06H7EPW1nimFEAgnP0fPVHo6dixVfdDz08aNt
         4X5g==
X-Forwarded-Encrypted: i=1; AJvYcCVuYlUKvaxM9YZknctN7DNWFOZO8aNMlEojlMojCGkM0O3jML/9BjcBWNnzzs2Bb+If2vFv+58ioCyEAej2y6qMin3dpE5unHo=
X-Gm-Message-State: AOJu0Yxu1haRktDhsbmUDvEyrI3eEpQvB9rkMSjALv4iGF9mFcfvu4UD
	kEwjmUlA+MIP5eFpFzbChu5fbG5eZdeOG2vZwd9z2NYVvuWbp08W40X86rhDSWdMkdtNO2NJvUa
	sssKAbn3nOqfEyGnN0DM7ZfKelroGB3eFt4dqzn3eqPMIWh6Rx+idOJc=
X-Received: by 2002:a17:906:140a:b0:a55:b05b:cdf2 with SMTP id p10-20020a170906140a00b00a55b05bcdf2mr1982560ejc.21.1714480145008;
        Tue, 30 Apr 2024 05:29:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IExbEF0B6PaeOO+gY91rAjKvEnZ0XZPuVp+IG/Xa1dBjLeL09mDJp7gx/hEZ7mhWw+WUvxzVQ==
X-Received: by 2002:a17:906:140a:b0:a55:b05b:cdf2 with SMTP id p10-20020a170906140a00b00a55b05bcdf2mr1982527ejc.21.1714480144432;
        Tue, 30 Apr 2024 05:29:04 -0700 (PDT)
Received: from thinky ([109.183.6.197])
        by smtp.gmail.com with ESMTPSA id u3-20020a170906b10300b00a52552a8605sm14992175ejy.159.2024.04.30.05.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 05:29:04 -0700 (PDT)
Date: Tue, 30 Apr 2024 14:29:03 +0200
From: Andrey Albershteyn <aalbersh@redhat.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: zlang@redhat.com, ebiggers@kernel.org, fsverity@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, guan@eryu.me, linux-xfs@vger.kernel.org, fstests@vger.kernel.org
Subject: Re: [PATCH 4/6] xfs: test xfs_scrub detection and correction of
 corrupt fsverity metadata
Message-ID: <4atckq27cuppwfue762g3xctp46dnwmjffawuxqsdfq6qeb5rd@g4snomzn7v4g>
References: <171444687971.962488.18035230926224414854.stgit@frogsfrogsfrogs>
 <171444688039.962488.5264219734710985894.stgit@frogsfrogsfrogs>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <171444688039.962488.5264219734710985894.stgit@frogsfrogsfrogs>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2024-04-29 20:41:50, Darrick J. Wong wrote:
> From: Darrick J. Wong <djwong@kernel.org>
> 
> Create a basic test to ensure that xfs_scrub media scans complain about
> files that don't pass fsverity validation.
> 
> Signed-off-by: Darrick J. Wong <djwong@kernel.org>
> ---
>  tests/xfs/1880     |  135 ++++++++++++++++++++++++++++++++++++++++++++++++++++
>  tests/xfs/1880.out |   37 ++++++++++++++
>  2 files changed, 172 insertions(+)
>  create mode 100755 tests/xfs/1880
>  create mode 100644 tests/xfs/1880.out
> 
> 
> diff --git a/tests/xfs/1880 b/tests/xfs/1880
> new file mode 100755
> index 0000000000..a2119f04c2
> --- /dev/null
> +++ b/tests/xfs/1880
> @@ -0,0 +1,135 @@
> +#! /bin/bash
> +# SPDX-License-Identifier: GPL-2.0
> +# Copyright (c) 2024 Oracle.  All Rights Reserved.
> +#
> +# FS QA Test 1880
> +#
> +# Corrupt fsverity descriptor, merkle tree blocks, and file contents.  Ensure
> +# that xfs_scrub detects this and repairs whatever it can.
> +#
> +. ./common/preamble
> +_begin_fstest auto quick verity
> +
> +_cleanup()
> +{
> +	cd /
> +	_restore_fsverity_signatures
> +	rm -f $tmp.*
> +}
> +
> +. ./common/verity
> +. ./common/filter
> +. ./common/fuzzy
> +
> +_supported_fs xfs
> +_require_scratch_verity
> +_disable_fsverity_signatures
> +_require_fsverity_corruption
> +_require_scratch_nocheck	# fsck test
> +
> +_scratch_mkfs >> $seqres.full
> +_scratch_mount
> +
> +_require_scratch_xfs_scrub
> +_require_xfs_has_feature "$SCRATCH_MNT" verity
> +VICTIM_FILE="$SCRATCH_MNT/a"
> +_fsv_can_enable "$VICTIM_FILE" || _notrun "cannot enable fsverity"

I think this is not necessary, _require_scratch_verity already does
check if verity can be enabled (with more detailed errors).

Otherwise, looks good to me:
Reviewed-by: Andrey Albershteyn <aalbersh@redhat.com>

-- 
- Andrey

