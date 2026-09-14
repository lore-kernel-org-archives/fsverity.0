Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C41A548CD77
	for <fsverity@lists.linux.dev>; Mon, 14 Sep 2026 16:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789404127; cv=none; b=AQKtwkO6VI4d1nFM0UEfLvvnS2/AKdoI1i42zG2k7vG+qfapCIWAmXzp8d5UXjRD7OvvqOz1AdCTN3eCKYSBe//pzA/wfJlpmK/wt7a/V2PnJGw1+o5WWDFZTNzAujs7eibxI8LeuJ9d+YoPpvsQ04hFC/xwI/N9RB50SLZCeRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789404127; c=relaxed/simple;
	bh=H1l4m7LqRJnZ49EJ8tR396A7/0u8ejG0VymqYOqgnNY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=eFhi0aiUTWHPJNDd81axUMkXqu1QN8W5AR6478TanJu/PaiPTsuEqbuv+fwD9qKudQJAl/cmfLr3aMi8vwKcuT7lDfibhKMMfkR/lrgIHa/yce65dZkFwFHB8ZKyk++KAaFX7EmeqoA3KLztbDHeGOJaffcmvzm/fuDT11tcKCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com; spf=pass smtp.mailfrom=amutable.com; dkim=pass (2048-bit key) header.d=amutable-com.20251104.gappssmtp.com header.i=@amutable-com.20251104.gappssmtp.com header.b=Ks8yhw0G; arc=none smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20251104.gappssmtp.com header.i=@amutable-com.20251104.gappssmtp.com header.b="Ks8yhw0G"
Received: by mail-yx2-f13.google.com with SMTP id 956f58d0204a3-66e4ab201ecso1995941d50.2
        for <fsverity@lists.linux.dev>; Mon, 14 Sep 2026 09:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20251104.gappssmtp.com; s=20251104; t=1789404122; x=1790008922; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OKDUxsVBgyG13X1UZt4eR7O3fTMlydeoVTGRT2zzuL8=;
        b=Ks8yhw0Gj69jiXAqQmf6hIFwFxORAFJaOcR0d1tP5jJF+O1WGihxlsRuFcmKR6/mV+
         bW+k9sp5vWpVlYufLNDOz1d3sfkU6kI4FTNRmLYPXERIj/OAZbDkNFzn2/V80fRoLE27
         DqOzeZnLOk7w13+VyWon46b176/nD9z2dtdp0441GSnAFeKRghfcGN8LQBDsmeYlyQkg
         VRFpB4uTN29tcupqnnUD2KAR/IczBjuh73sPrXGmZdT4XVaT9xW5nt5ic1tG8aIY3Ppk
         XL64+BqXaTI4w+h6056bdMjl36u0HWA7hZd0J6/Fd8YZFrphKwUlsRHdMeWCwC7OGXBk
         lDMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789404122; x=1790008922;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OKDUxsVBgyG13X1UZt4eR7O3fTMlydeoVTGRT2zzuL8=;
        b=P5ArMwwFhTTvWpmq42HKtQO95hB5nEp3gSlyehfug2Lvnq5XJKiBgwsjdGq1Eo48dk
         kV9b0JI+srdoKocmRoj+K2jvd1SvIgVi6zmz4Ljui/AeoJIYs8PGJV7E6fON0UWl3ALJ
         5Bg7cjVB3HCdyah4k/oj+JFUoQMwoDR/E6n6CAxvYpKabxURoQ6OomfJwGDjnyRAFiu/
         0607gh5n5wE5uWG0uX/88/YatpcuypPKvaVXvQ+y9tq5KAgopMzMn2HjIMH8Tfylv/dw
         uN51Ni2TdrWIAiS30K5F5qx1Y720YL/3icYtlxTbvULLgz4dMP9ADTfJHCHiQpjnbfBT
         r6HQ==
X-Forwarded-Encrypted: i=1; AKwUvBxwUxt4QMKJmmv4e5OW6/12ZWkCwY4UUMfm0Pc/JoKymtw24HkDQ/pTawQufYKYZADBC/9LULBBjw==@lists.linux.dev
X-Gm-Message-State: AFuF++njTJR1LhMwZvmMyNa8JaNF+2+wP2aea9f4cV1OSy+EufkRO2rk
	ScWE6xcSgQZGbzQDRYMm89HiU2hE/0/Nt8KS5CHbb5fFNtR+0DVgnbuTRqcmEPROZ8g1
X-Gm-Gg: AYBFou0H3QJCO8KA76ahVXEPGg7KOq3RxFL717xciCO7Pi3mTJi0DDDiPxxuKrk2MWt
	zKT76ZTbH5E8opoQ2X5dfzVcWyVzcZIkRxtFwDg7TQZgwnNjLNGBQRzRBAkU52USbW0Q2A4mJWH
	HSXkQHHXKJd4ocnabPU3Gy9lCwcV64MoPUh+C2P+b4YiovxLYVFgB1vlq87kRLvWbHZjvyURgLn
	xtL1Fp4TWEoI1o75qlqY3MBFC0PKx+B2EI+cxQszZyj3gX6b8tcFqPltL4s9z0ax0k7JAKFaNAQ
	HPdRr+K+EhUp6pUUFHkemFnEkRHS7ZrxO3qJv0q/tMEQTwwus88u1Lf6HZD5GJZyeXf81MAauoZ
	EKq2UPG0mu7rRdeKqEZj3CQVf88+cbY4kLFJcFAfpf+DXDAXPNifWZBMxdJZu/V8lpaBdhnJLuj
	JfhnhnGoRaCSyMTawkPWxU+POzq/OuwoE5gucaEvg3Ym94dPBdE7lV3GzxRvhV
X-Received: by 2002:a05:690e:12c8:b0:66d:132a:875f with SMTP id 956f58d0204a3-6714e088222mr1068042d50.47.1789404120256;
        Mon, 14 Sep 2026 09:42:00 -0700 (PDT)
Received: from [192.168.1.110] ([2600:1700:1ff0:d0ef::d15])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67125df42a8sm4879023d50.8.2026.09.14.09.41.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 09:41:59 -0700 (PDT)
From: Andrew Halaney <andrew@amutable.com>
Subject: [PATCH 0/3] keys: Add well known IDs for fs-verity/dm-verity keys
Date: Mon, 14 Sep 2026 11:41:41 -0500
Message-Id: <20260914-ajhalaney-dmverity-key-identifier-v1-0-01922dc1366a@amutable.com>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3NSQ6DMBBE0augXqclbIYMV0EsTFyEzmCQjRAIc
 fe0WL7Fr9opIQoSPbKdIhZJMgaFuWT0HFx4gcWryea2zu+mZPce3NcFbOx/i7bzxh+FeIRZekH
 k0tyuXW2LokNFujNF9LKeH017HH+y3YXWcwAAAA==
X-Change-ID: 20260914-ajhalaney-dmverity-key-identifier-4187b6233be5
To: Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>, 
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
base-commit: 1a1de54f7369cd2b5bac0f265910e60ad3a6b4c3
change-id: 20260914-ajhalaney-dmverity-key-identifier-4187b6233be5

Best regards,
-- 
Andrew Halaney <andrew@amutable.com>

