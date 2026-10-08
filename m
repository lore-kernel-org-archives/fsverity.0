Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BE7743C076
	for <fsverity@lists.linux.dev>; Thu,  8 Oct 2026 20:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791493091; cv=none; b=SIzAiEQpWOPuHmlF5TQZRCEZo8XbIyC7fmcIypp7jGoAzTggu3X6tSowN7Gn7DIF5RG6S3KwzhCopEcXgVIevJA6P8nYbLVYGDkQHSm0f/mo7q9DjmiHqcZCpFmJmKUnibpkC2m72gWJdPK1HhZPnV+YjdyP6drZgIf25RHXZN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791493091; c=relaxed/simple;
	bh=vQAwyxNj3AED0ZWDQ7B3q4d5Ag5/7cRBweYxf4EerGQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=svN6/LCyE2AATAClLpO8y1595TS6nKk7rcAGXs6+KxTlugveXHTFzQIK4+nwOh2JVJX8LruFwxpHT8kOV1TMvE2F/9VsP3yZA7HUsQ0dG6RSY0node3EZCliklz/drq2RlI6ioTYR8oaKgaypMMZOwv40rAt1cpN9Ng6Uk7Iyts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com; spf=pass smtp.mailfrom=amutable.com; dkim=pass (2048-bit key) header.d=amutable-com.20251104.gappssmtp.com header.i=@amutable-com.20251104.gappssmtp.com header.b=Y6ooOmEz; arc=none smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20251104.gappssmtp.com header.i=@amutable-com.20251104.gappssmtp.com header.b="Y6ooOmEz"
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-678febd9307so1414129d50.0
        for <fsverity@lists.linux.dev>; Thu, 08 Oct 2026 13:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20251104.gappssmtp.com; s=20251104; t=1791493088; x=1792097888; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LSvHBJQxiIqbp6o9z5pfgV7EhGFvpIA3j/HhyOfsFYA=;
        b=Y6ooOmEz+8w8Z9iGnf2gtVbMUFNnQaNt5jYvGr/R0Y/Pus/rd28HXJ33TEoGeruBH5
         3KKkpXU39Rzmq9Q08wdr09E6gQEkuRUgFF3ZdduzLkMOOO/oCHwqdttEUwLJXbVwQ7ig
         kBalr+d/nHycaL7N46v/UTQhyZLu0Sath/h1HP4GgllkiYGyjVUEIRZh/+pweQMGDNT/
         L1b3slxRdHdiv3phxrlIfSxvg8w2aaN32clH8FHBe5jKwNt++91xsT1C+IashSDO6Tt1
         Au52cO2ElvRmCNKOklezbZUKKL8xeQ862sAM4UihFZEzNgb7odLnqRWPLxbvcgSDeGCQ
         xR4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791493088; x=1792097888;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LSvHBJQxiIqbp6o9z5pfgV7EhGFvpIA3j/HhyOfsFYA=;
        b=0EVZU89XhkkPjNcOA9m5Eo/xsgP98n+0FVlcHb0R4t6uxEORRkGsAQeXvUsF+5iS7j
         1uMq+D2pSIZB+C9NLBcPqKqQez4HvyfhKlh/IL0wpvm0MU6if2YDqiQamjWGQB1osRKE
         bxeOuAECLqXTmVOEK3HZMdzr4G7+z0s985eAKpZFAN1bH17n22IBxAYBBOdpPsBavP/s
         cvJx0FK28j5aiypCrx3MA8lAihUYFKKtBD1uED6kXM3NuWu1dgRUizQQMRmjygIwez2k
         vbOPLJ1AYw7ydIkG+lf6gXbtNxDgvMXXvpfxbShlkkrmUP+VrQj9h7g44IGZXibONcIo
         403w==
X-Forwarded-Encrypted: i=1; AKwUvBy1Cq7H8KVr5MxF7jtkTdFJWrZsmyy+jwjPD+/vYtI6RwLLi9Qyxnr61h6KGXxVhVS5LEFwB05M6A==@lists.linux.dev
X-Gm-Message-State: AFq9FYLFDdicVQ/rDp+h71pLdZLd2XdV6sGvofe5bPK5T2RNrdn1HrMZ
	4e8tn0E6AYef23Ubp/cIEXxHsiyXgK9G+1BrU0AewnjDq2rBGDUPdOcVYwK0ZNQcbgyZ
X-Gm-Gg: AYBFou3lft6FZUPYlwnsNMPzOb4SZY2AH6C971h5U/3EqYuDXdB1wO4cYjsdOw18Wc0
	NFZsgRrPVHIrfMhBUg07qp4fsuNMQmE40Oe+X9VUq68db1RSVloDKjccw5svbD379Q/pX5ay0IW
	ep/nf7xUIihpvZzrvahm7ZRSFpXvAFNU+j571qawkV7xzsQ+oKzGC5YoPMaTvZ1x0n9qAitQzhO
	LhmsnVK1PZveRaDjrLv9MMa550FRai/jnoCpavG/9selgELMPFQaO4N4DXMPEnf4ePTmV6QhbhX
	FUME3xaBmRHijeZQYT+kZ36fJwO9w+ItKhCMYBKrEyecA8P2clfekpkYlNKZjL8HF7aY9PGsvna
	qSwSAVfICzUtr5Xj1bAjOjuLiw5vhhRKOV+QtFG8dZsJu2RHlIc5hI2dt6ZaMsyjITpxFmcFE0o
	9KK2G3tSes6kuACMa6RgukuRKsalkt51twrIzm6xfehJhflU+oYeWKY3irhQq2ltU+vec+juzmt
	XOgVRF1Xrc9vUBxXqTAOPUl6lGeh0u2nzjjO9IbDFQJ6ChF7oUCqbk=
X-Received: by 2002:a05:690e:4391:b0:675:6803:98bf with SMTP id 956f58d0204a3-6793628b5b5mr14774d50.45.1791493088070;
        Thu, 08 Oct 2026 13:58:08 -0700 (PDT)
Received: from [192.168.1.110] (104-53-165-62.lightspeed.stlsmo.sbcglobal.net. [104.53.165.62])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67935707401sm78814d50.24.2026.10.08.13.58.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 13:58:07 -0700 (PDT)
From: Andrew Halaney <andrew@amutable.com>
Date: Thu, 08 Oct 2026 15:57:37 -0500
Subject: [PATCH bpf-next v2 3/3] Documentation: keys: document IDs added
 since KEY_SPEC_REQKEY_AUTH_KEY
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-ajhalaney-dmverity-key-identifier-v2-3-008456d189cb@amutable.com>
References: <20261008-ajhalaney-dmverity-key-identifier-v2-0-008456d189cb@amutable.com>
In-Reply-To: <20261008-ajhalaney-dmverity-key-identifier-v2-0-008456d189cb@amutable.com>
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

The table of special key IDs stops at KEY_SPEC_REQKEY_AUTH_KEY.
Fill in all the new ones.

Suggested-by: Christian Brauner (Amutable) <brauner@kernel.org>
Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
Reviewed-by: Christian Brauner (Amutable) <brauner@kernel.org>
Signed-off-by: Andrew Halaney <andrew@amutable.com>
---
 Documentation/security/keys/core.rst | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/security/keys/core.rst b/Documentation/security/keys/core.rst
index 326b8a973828..37ed42382f16 100644
--- a/Documentation/security/keys/core.rst
+++ b/Documentation/security/keys/core.rst
@@ -372,6 +372,19 @@ process making the call::
 	KEY_SPEC_GROUP_KEYRING		-6	GID-specific keyring
 	KEY_SPEC_REQKEY_AUTH_KEY	-7	assumed request_key()
 						  authorisation key
+	KEY_SPEC_REQUESTOR_KEYRING	-8	request_key() destination
+						  keyring
+
+There are also values that refer to a specific kernel keyring rather than to
+anything belonging to the caller.  These keyrings are not linked into any
+keyring, so a search cannot reach them and the ID is the only way to name
+one::
+
+	CONSTANT			VALUE	KEY REFERENCED
+	==============================	======	===========================
+	KEY_SPEC_BPF_KEYRING		-9	the ".bpf" keyring
+	KEY_SPEC_DM_VERITY_KEYRING	-10	the ".dm-verity" keyring
+	KEY_SPEC_FS_VERITY_KEYRING	-11	the ".fs-verity" keyring
 
 
 The main syscalls are:

-- 
2.55.0

