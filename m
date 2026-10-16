Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 829D125B09C
	for <fsverity@lists.linux.dev>; Fri, 16 Oct 2026 00:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792111095; cv=none; b=i6onFusuh72InSVvs3LNLwWVj2SGUuCciL9bXJZGat6uee6lIV7SWvAdejvnUcCluNyz3WJ41TU82DJeXk1uVhQNBAaecBGxLDlrUo1wuQWPrzw/OO486WKdKfDkiFejp6edteA+yE2AKe+RxKWoSiFNxlYuwHEkCi4/AyD6Zu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792111095; c=relaxed/simple;
	bh=wJv6Oy02ZyVpQIEV4S+JLl2ZMXIUTlylj7/wOCMhJJY=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:In-Reply-To:
	 References:MIME-Version; b=JyT9NNJp04fXgsteNWen4vbJIq4xqjjY4RVKaIreVEXLWm3D/zZUF9uO3+pB7VwKx9sEpihrvaxm2q9jSw4rKmEHR6L0lKbVRH1Cj7E+zx0wL6Kv1qZ4vN+g3unEJLzMSoow4vaBd1k15oXfNOuUXqjJ1U6Bg6fiZpZFtXGVQc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GSLLsWcO; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GSLLsWcO"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-ccca948203aso2456946a12.3
        for <fsverity@lists.linux.dev>; Thu, 15 Oct 2026 17:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792111094; x=1792715894; darn=lists.linux.dev;
        h=mime-version:content-transfer-encoding:references:in-reply-to:cc:to
         :from:subject:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wJv6Oy02ZyVpQIEV4S+JLl2ZMXIUTlylj7/wOCMhJJY=;
        b=GSLLsWcO+wJQALu8B+YYCizYd/xGXXiCDKWhTGOpe1lQRbd6sThJvLig51oa6kGc6X
         sJCUb8pWzKwRhoozX/7clQY+B4qABsFScNnlbAx2CkSTlPKeiLlumedbKQm+xd3kEhUn
         F0nGgtzFF4C82gPQcgAZodoMOTZNai1cLO4oYgpuHjRIvEDlgDV0DIA4Jr8OJd8gb9sS
         lvZrAskDjeal7MIXhigg0R9gL7/coXgFPd3V+uSiGGKdCXjCa2hI2ws7vBDG0Fo6TAJD
         tyNddMatM4zJYieOcyHyEFUJpV0otIsJMJA7LfDm5yupmRAGZKHcr6WxlvDR0jClyTGc
         jzkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792111094; x=1792715894;
        h=mime-version:content-transfer-encoding:references:in-reply-to:cc:to
         :from:subject:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wJv6Oy02ZyVpQIEV4S+JLl2ZMXIUTlylj7/wOCMhJJY=;
        b=emnpNfskFx2NmZElpIEJJdyW9YeBGxl0xIRDwXdLHrnZgOVfxQXg3Rbq6RZlsb19JW
         yBUgOeITTsiwZKyJxxApXGOsCX6o0PZE+QKwOeWC8w3OOb6E3jzgGD9/7ZnjXLsBv9IE
         cqKE2aC5/y8hpQnR3CFoam3E0FRcB8xABWsCkO+DNGO7d+J8IUgHMJBi5s5CTojVfzXx
         fzK/98baCI+iSZXs9cECphM/2OOU/4uYTjAr6sSlggS+F1l5yTTFhHFzXr5GG8fsckMM
         7KH4TFxGja/sd9fD7nPo0qfJr58EU1qRF59S9CE0MCN4Yd1L2SFDeKhm0TngTZv0ViIR
         ZB+A==
X-Forwarded-Encrypted: i=1; AKwUvBwEks1Cf8gaEm2GLFYLi2IKk2UyRskfTjh3OUnt44QokMM52yXP/9s9IpwiPy/7MTZCFiMeZ2RBqg==@lists.linux.dev
X-Gm-Message-State: AFq9FYK7AOK3CFV6ECQzYHhHoClpLNKjiXzHwLssriRaVtOFnnY9ZG1R
	09kfKqYYuvVcZZGK4WyRmioZxmbBKJka+ulqFHncqOFytVu+482fDgh8
X-Gm-Gg: AYBFou3UBBnrVHucmPSy/QmNWrE1dmT8aYfuovJdwNjQFpl72AWFSmBOkYVuL4KXTwB
	o5sF8b79rG60CFvmiojtpevOgPSO/UQHL032WQyBSAb3EC1k/5lG5DFu+4NnaEcFGw43JEFa+iv
	2oxNXUv8LWJBfXr13pCGnhb7dw7bdMPgq5P0KWuSBJmSvO/2M4HjV5X3ngHQYaD7i7Hyp5Ozgt5
	3vTBqM3tJHrLiqejTzwm9ybaAcvb4X5pT7siYwuJ9JjhGLBWfFxHT0PNJuVjBeTswg7tWw6NVkL
	eUXhN/dQuCyUdpCvNmySUzeK1lBUNTKjOqSVf2BQpdTELA7ULqIvwv1o6taf/40uZAHH//6We3m
	oTvBzsCtvKG0PciLs1gqo1KtqhAbBkGNlnMYWIzw6bm7CdeBp8KbBBobnXtn4+XX9flpkbQBtwa
	sMOb91uWMfzBOvRt6Hxa9updfNd5KDCmlvyi40JKFToCwgsBq3cWQcZDr/itok0zXaJMeCvUNf5
	Zt8lcOPYbb+pkB2VORoGw+ADhEInNjAuDhhVF7PKrSpKCUQl0PJRiEl7ihXkvsvo9XLOFUD0MRh
	vCc=
X-Received: by 2002:a17:90b:1d4f:b0:3ab:c80:936f with SMTP id 98e67ed59e1d1-3ab3a94ffa7mr15824328a91.16.1792111093664;
        Thu, 15 Oct 2026 17:38:13 -0700 (PDT)
Received: from localhost ([153.61.198.253])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac947dfa00sm6462107a91.17.2026.10.15.17.38.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 17:38:12 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 Oct 2026 00:38:11 +0000
Message-Id: <DM5UD20248FG.3BXPS76LK06F5@gmail.com>
Subject: Re: [PATCH bpf-next v2 0/3] keys: Add well known IDs for
 fs-verity/dm-verity keys
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Christian Brauner" <brauner@kernel.org>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Andrii Nakryiko" <andrii@kernel.org>, "Alasdair
 Kergon" <agk@redhat.com>, "Mike Snitzer" <snitzer@kernel.org>, "Mikulas
 Patocka" <mpatocka@redhat.com>, "Benjamin Marzinski" <bmarzins@redhat.com>,
 "David Howells" <dhowells@redhat.com>, "Jarkko Sakkinen"
 <jarkko@kernel.org>, "Paul Moore" <paul@paul-moore.com>, "James Morris"
 <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, "Eric Biggers"
 <ebiggers@kernel.org>, "Theodore Y. Ts'o" <tytso@mit.edu>, "Jonathan
 Corbet" <corbet@lwn.net>, "Shuah Khan" <skhan@linuxfoundation.org>, "Randy
 Dunlap" <rdunlap@infradead.org>, "Andrew Halaney" <andrew@amutable.com>
Cc: <dm-devel@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <keyrings@vger.kernel.org>, <linux-security-module@vger.kernel.org>,
 <bpf@vger.kernel.org>, <fsverity@lists.linux.dev>,
 <linux-doc@vger.kernel.org>
In-Reply-To: <20261012-broschen-inanspruchnahme-gebilde-d72cf2b99cda@brauner>
References: <20261008-ajhalaney-dmverity-key-identifier-v2-0-008456d189cb@amutable.com> <20261012-broschen-inanspruchnahme-gebilde-d72cf2b99cda@brauner>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Mon, Oct 12, 2026 at 12:38 PM Christian Brauner <brauner@kernel.org> wrote:
> Applied to the vfs-7.4.keyring branch of the vfs/vfs.git tree.
> Patches in the vfs-7.4.keyring branch should appear in linux-next soon.

What is this branch based on ?
v2 was sent against bpf-next, because
commit 264d8fd2794f ("bpf, keys: Add a bpf keyring for program signature validation")
is only there.
All hunks in keyctl.h, key.h and process_keys.c have its lines as
context, so the patches don't apply to -rc as-is.
And patch 3 documents KEY_SPEC_BPF_KEYRING.

I'm confused.

