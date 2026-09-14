Received: from mail-yx2-f3.google.com (mail-yx2-f3.google.com [74.125.224.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B9048F84C
	for <fsverity@lists.linux.dev>; Mon, 14 Sep 2026 16:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789404128; cv=none; b=eMm1UU7jp06rWZzetBBFJr1tuICZxj9GYm0rhk/nGcWw2BNUH+OILCYxiHrVKX678Y2zG5FQo2uhFpfVC+Qa/Ns2a9ny5zHFaI5J0kkxamNmZB+pTQIYwTASwySdGJAhOdpR+sE90+qzc0WkBi/1vlovRymJSYiVAshc9k7kIrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789404128; c=relaxed/simple;
	bh=fyPrl3WvozGTDDVsDO8MGVfKnhRCs2T8g6qKeea9uQc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fQG5C0rZIzD861l6y5+bNGeD4mkaiyXktP9EArIkZF/xwpUSUcrvMecwOZ3sI8QAuYCd9cFaBi4nA0Dgq62z4BBwEaqMBNLy4Ts4ZeRda8ys9qeywMcb2gUq0achpUtE63nXYF8AUuFzCWYf+j/RdpmTAdLHgYr4q+6pysEWasM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com; spf=pass smtp.mailfrom=amutable.com; dkim=pass (2048-bit key) header.d=amutable-com.20251104.gappssmtp.com header.i=@amutable-com.20251104.gappssmtp.com header.b=CSSPmmwt; arc=none smtp.client-ip=74.125.224.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20251104.gappssmtp.com header.i=@amutable-com.20251104.gappssmtp.com header.b="CSSPmmwt"
Received: by mail-yx2-f3.google.com with SMTP id 956f58d0204a3-66fd0af9eb0so1249823d50.0
        for <fsverity@lists.linux.dev>; Mon, 14 Sep 2026 09:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20251104.gappssmtp.com; s=20251104; t=1789404124; x=1790008924; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ndMM0TFrryHnZOvHnxhOWJr9tGmJVwIhyX6o7UKbX40=;
        b=CSSPmmwtLsnpkMnVxOZj+Pnww/BHr6wkwiuljzDnwkhxYZyJPXfmA4O61tLBrI1aoi
         0cETUolZVfBwBYj737oRNpxJYiGWy8CUup6UWp1VgQxYXaJu3fDGsaM61OWFdTphVR1j
         eTczYLf8uoOVkiy1KiBMheqNVVpQtzFrqlBpH4zWVWlU7kzSX68l9FWFHELF63/RgYzP
         2dPXGvQbYekD46WROVeBUYlKzNMdNRO7L4ecaba1epuStd+S6lcJE/FoFh4hcTkq7tct
         yw6pUkfPQlfzJla4y1XP30GaHTNOSBqR603bAY2pW7lKzNo2G1DUXt7bg21DDER0U6BN
         2O0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789404124; x=1790008924;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ndMM0TFrryHnZOvHnxhOWJr9tGmJVwIhyX6o7UKbX40=;
        b=jLE0PApHyo92D/3HJSYLLtbU1+1JU0Pxbjsdw18hFz85fSKV5uBA9DqIOZ9inrAYQI
         XR6OTXZr5cZrV0+2x8ULn3jL2neLS63BxF88Hj+3V9pjBb3IYbzBd7q/qsgaLBcC1iov
         Rgc/1PDhb1eKUjTJdbrZxfV/4VWO2T5kIFzW4JdsQJDikAxwbbUhCT0PIKo6z3C0lG96
         ILV2dPBiqpIiBSua4ms1YWbTZS8Jt5Adi37YiQgSJkYPGu+INmqzEByg+aGA+GR+uXGM
         Wlthsj/ZktwQKHABII26DG9NTwoXqxVy+G/OvNOotm7YtSlG4Gt2ZvK4LHmkEl+VdgG3
         Y36w==
X-Forwarded-Encrypted: i=1; AKwUvBx1bwx5almateDbyJYUyH6tYn2+H/uBO2BNR6cXEOA0BVsAhPt8tz/7rSLwQ6azUIEm6yItnXo20w==@lists.linux.dev
X-Gm-Message-State: AFuF++mZDo3F5Ryth1x2x1sEpmGCUjroDD0my1JLBlBDvL8IJY2EI/X+
	whPir/rIXPq4utsCKVLhJiNgKUQVIBgzk6U4pHmAlOjni83iYRHQhXIJ2NQTxke4+tAC
X-Gm-Gg: AYBFou1xLCZ+B6nDeV2NNUJX4neSbx/L4hIgbWCIG0l2nrsEx+ViYBOifcarDOZ4R6z
	y95FhifEno3VZROdTuTwMPTCXa4hO9aam2S8Vlkaw5IGJRSQgGUbpdpU5Lb5jtwrnJG2BTALpsq
	yVJtu3d8dWR2EjqsdCfg8lrwyH754C9pwxHXNJjL0dyJsTL/fWwzn6Ot6bHshtzuGlO8vmZDvGN
	DhqvYaMXvzHEiZDK7fSFGN7Ior7btSripn3PaqnPl5wh32MIVIkiZA6jm81l53Aq4ySY8sWUUwI
	OoDiyHZYjE+KokRFnqLSgLVrzfS9Ih3GXzxzJE8kM7xFLKan46EC8+ZPwedVm3xB/wBTiPJOC4p
	OrwbR/GTYacKK9sohtZUhjshtsKxksqfHS/wMfQw4beA2G0ORD0H/CUdityJMNzgPDfNBiVeXp0
	GiTIZ2N0e2tuVwIElYjnZZJ7zNh30ZYHYZjgOSCWDLalsUMM8xNuyttYdxT2aL
X-Received: by 2002:a05:690e:810:20b0:671:4a9e:7c91 with SMTP id 956f58d0204a3-6714dfd252cmr743318d50.10.1789404124390;
        Mon, 14 Sep 2026 09:42:04 -0700 (PDT)
Received: from [192.168.1.110] ([2600:1700:1ff0:d0ef::d15])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67125df42a8sm4879023d50.8.2026.09.14.09.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 09:42:04 -0700 (PDT)
From: Andrew Halaney <andrew@amutable.com>
Date: Mon, 14 Sep 2026 11:41:44 -0500
Subject: [PATCH 3/3] Documentation: keys: document IDs added since
 KEY_SPEC_REQKEY_AUTH_KEY
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-ajhalaney-dmverity-key-identifier-v1-3-01922dc1366a@amutable.com>
References: <20260914-ajhalaney-dmverity-key-identifier-v1-0-01922dc1366a@amutable.com>
In-Reply-To: <20260914-ajhalaney-dmverity-key-identifier-v1-0-01922dc1366a@amutable.com>
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

The table of special key IDs stops at KEY_SPEC_REQKEY_AUTH_KEY.
Fill in all the new ones.

Suggested-by: Christian Brauner (Amutable) <brauner@kernel.org>
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

