Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB6234349BF
	for <fsverity@lists.linux.dev>; Thu,  8 Oct 2026 20:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791493086; cv=none; b=bb+h2ytIp5JBRjfpTZZ9h7ByHl954hyw5+7C9dk3NK0yyZW4aE0ion18z1c8bLr+HudK8h3VeHe5pdsz5nJXt3uBpxqnpOMeefSbrDJ9UfNsV9FAP7uJoI5NmqLDMoI3aOlh9UY+ogvOOkKP/CaLPYq8b+VLUCa4wklZ6exMofI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791493086; c=relaxed/simple;
	bh=vpbeEaPR3E1pmaT/xNDC5hjULFUimCv8YKxCMpWM/dg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZTAT6V50K+tTpOhJElvTix9ZwTIczSS30XhKfLcSv8Qh3tLuKCqrch7u3zWqb2FlDZWXmhVlUpx4g74zlpROFszoA+/TNp2izCELLh1YIVGSW1iesvdQSdI0VIhCwpx2Ie5H9y81E7+d14WEXunyvIT+UVV5e0mn5BdWsITpqm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com; spf=pass smtp.mailfrom=amutable.com; dkim=pass (2048-bit key) header.d=amutable-com.20251104.gappssmtp.com header.i=@amutable-com.20251104.gappssmtp.com header.b=PiM8ErB9; arc=none smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20251104.gappssmtp.com header.i=@amutable-com.20251104.gappssmtp.com header.b="PiM8ErB9"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-6768ced47aeso4022910d50.1
        for <fsverity@lists.linux.dev>; Thu, 08 Oct 2026 13:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20251104.gappssmtp.com; s=20251104; t=1791493083; x=1792097883; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=V0S61SflNz3PvfgcGBGx11GkE7hBo5diSyO3i89hlIg=;
        b=PiM8ErB9YOBH3pDrFcRfakqLOs+ZntKl+RNI8tkgFL2g34gPyssbbSeRYFdNMBez9u
         2hEU8aaJs1qBHs9C0S7OAe6Iu7zLLiWpJhY+JdnCaOlczhoOsAx2XsV30b7/sCWK99/c
         TNVL83tL7ddOcwUHQUlJ5saUcuMb2k49fP6Yz5C2C95fFmkKBZTM7038bIFs1G/+2Flu
         Xs5apVqFiuVNAW6fPA4Bepl4b5e/d+AFtVAjgKxZ7q8lCRAiDMkQwhbA8fk66L+gTZjZ
         iXlEfqTV6rkzZ4zBKa1pS+2x4837/CsjW+FucR1K8rXloircrwJqvhoOCyZSk40ACiD2
         +u2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791493083; x=1792097883;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=V0S61SflNz3PvfgcGBGx11GkE7hBo5diSyO3i89hlIg=;
        b=dgwESyWtHkTOY3ZxXqeDCC7pGfgw4nMK8lO4rKoghQ37AL1387vmrZSV7vBzKUvEIl
         dMoJYwEs0bBlc/ZPBS15k2FzmQmzbbptXpnmUBbjk/xklmY9giX6ef4CiMjAGIrzuT/E
         10j9FncEU/ioIkpxKDNyptcvf7RqXspsc91U0ykIhgxd3yz/NE6TKJv+zUVk6SKZflXY
         WnVyIeu9A5ISzWNebi+HuopEcakX/srvu3uDmS7eh2C/L64Flw2ChfSKklTRtSaApgDa
         L31YDLJp/v4ux/qdx7jNWguHPkBYeXQl3h5cBKalNFsA/fF7AbI0QHUl7F8iyTd6aoYa
         sY9g==
X-Forwarded-Encrypted: i=1; AKwUvByGAYIkywyf3V9P9xnXX7fyC4OEAFO7LjaCmy8HDeBy154l+9r2AmmqEaogx0iFtN4ZYc8jQuuzaA==@lists.linux.dev
X-Gm-Message-State: AFq9FYJLTIKyKpQvSRTKMMTZfGmqhtenqWYYZYCGZLp2S8EkmF6gC74E
	ns/CVj7vBM3eU5HK8ZZu4HqAPk4SgEzgpttSYG/naBRozpRNeIrC8R0uQZ3ouYBRSW/r
X-Gm-Gg: AYBFou1MBqOHJs045DkAlmN+CJu9QbzzNEtiAfUkqxZ2MlovwHI2DKupFJOgwD3MGwr
	JndP0iS1AGZWul/QV7fEMn3rOqhuM06mDKffn5Zn9JNTTA6Swg1Apzg6WfvhHW3FuTNEj24t6Sg
	u62WTdYvHh/1qV+YYfbr9xu3YVgZ8Hw143I8htMqGclvw9dIgSNBc8XLorBaG4V2VPe6SjH3pA8
	5kT0Ct4sARfRY/QQQG68U7cDp81/I1LSqhIcKYHf0ITjKL6zeJTS5GpGY4Yx6diSY02uiFn0x6v
	XJwSQe9gR4PyyUJcCIPct1SThDp8l+2NK6J58PkzBNw62hSLyiX3fIpqyI+4s7ucoj9aLYgN2uZ
	ELUdV0H5CMfbkCJu+CF/xAz5+vAgWDH6/lz9IKd0mHGXhfxgCkSvCq/X1LhyucQh+R9BnE2F1Gc
	KoRJ0OgUCACszfTEy35F/r4LeGBadCDfMOdaIfx/M0oqjCpk3RYUMVFspVQJllxu7kG3o0Gq+ry
	7q010+ta0GtIbKXAQH2SyWQMGqoUt+37zgqU+6O82iRybDd8WORUYGK
X-Received: by 2002:a05:690e:d06:b0:678:4671:d9d1 with SMTP id 956f58d0204a3-679360087aamr34732d50.21.1791493083618;
        Thu, 08 Oct 2026 13:58:03 -0700 (PDT)
Received: from [192.168.1.110] (104-53-165-62.lightspeed.stlsmo.sbcglobal.net. [104.53.165.62])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67935707401sm78814d50.24.2026.10.08.13.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 13:58:03 -0700 (PDT)
From: Andrew Halaney <andrew@amutable.com>
Subject: [PATCH bpf-next v2 0/3] keys: Add well known IDs for
 fs-verity/dm-verity keys
Date: Thu, 08 Oct 2026 15:57:34 -0500
Message-Id: <20261008-ajhalaney-dmverity-key-identifier-v2-0-008456d189cb@amutable.com>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WNQQ6CMBBFr0JmbU1bsIor72FYtHSQUSikrQ2Ec
 HcbbuDy5eX/t0FATxjgXmzgMVGgyWWQpwLaXrsXMrKZQXKpeC0qpt+9HrTDldkx5W1c2ScDWXS
 ROkLPKnG7GiXL0uAF8s/ssaPlaDzBzB1zuERosukpxMmvRzyJw//RSYJxxkUtpW1FqZR+6PEbt
 Rnw3E4jNPu+/wBcIMGP3wAAAA==
X-Change-ID: 20260914-ajhalaney-dmverity-key-identifier-4187b6233be5
To: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>, 
 Mikulas Patocka <mpatocka@redhat.com>, 
 Benjamin Marzinski <bmarzins@redhat.com>, 
 David Howells <dhowells@redhat.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
 Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
 "Serge E. Hallyn" <serge@hallyn.com>, Eric Biggers <ebiggers@kernel.org>, 
 "Theodore Y. Ts'o" <tytso@mit.edu>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: dm-devel@lists.linux.dev, linux-kernel@vger.kernel.org, 
 keyrings@vger.kernel.org, linux-security-module@vger.kernel.org, 
 bpf@vger.kernel.org, fsverity@lists.linux.dev, linux-doc@vger.kernel.org, 
 Andrew Halaney <andrew@amutable.com>, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>
X-Mailer: b4 0.14.3

This more or less follows the bpf keyring approach, allowing userspace
to easily find the keys instead of having to parse /proc/keys.

Signed-off-by: Andrew Halaney <andrew@amutable.com>
---
Changes in v2:
- Rebased / target bpf-next/for-next since 264d8fd2794f ("bpf, keys: Add a bpf
  keyring for program signature validation") only exists there.
- Grabbed Reviewed-by trailers.
- Link to v1: https://lore.kernel.org/r/20260914-ajhalaney-dmverity-key-identifier-v1-0-01922dc1366a@amutable.com

---
Andrew Halaney (3):
      keys: add KEY_SPEC_DM_VERITY_KEYRING
      keys: add KEY_SPEC_FS_VERITY_KEYRING
      Documentation: keys: document IDs added since KEY_SPEC_REQKEY_AUTH_KEY

 Documentation/security/keys/core.rst | 13 ++++++++
 drivers/md/dm-verity-verify-sig.c    |  3 ++
 fs/verity/signature.c                |  2 ++
 include/linux/key.h                  |  2 ++
 include/uapi/linux/keyctl.h          |  2 ++
 security/keys/process_keys.c         | 58 ++++++++++++++++++++++++++++++++++++
 6 files changed, 80 insertions(+)
---
base-commit: e1d84a37cba984388988d2f1ddc84561413f0db2
change-id: 20260914-ajhalaney-dmverity-key-identifier-4187b6233be5

Best regards,
-- 
Andrew Halaney <andrew@amutable.com>

