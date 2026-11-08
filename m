Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794168330;
	b=TCI1IibC+htbcQmn4WpzhDHP2gNi33OmR4c1J9ghFMbO1+KrKUOXepCnFz00ZIlBU4/t
	 HyVe1w2cRf+o8anSeqLTT7PPRR/RPiKLpIjLX9kzTHmniW3tTH9gxmB+i5c6VIZ5wN0uA
	 7U8mpb6ez5qtKkjbAnrazxUqvscnSGDFcKftoae9urzv9yRpFJm/zEwiuX/G5y5YewS1P
	 CXS92Lyob0yMhlqUSFUFuVop+9T0v/bI6JUCzGu4zswU3uMaecFof3rjNO+O//q/Z0C2z
	 WONQlFJD7tdfnznCpB9zZmamxPeOX5kCyeNxlB9A8wI7BIcVkHQGGNCohRgt3FrquQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794168330;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=NsI7ZZLkYjCZutUVEg7TJNtNpCk2xGDMbVs7o+8cm3Y=;
	b=00pDeQp4dvpA0wgvrFQ/8YlijiMyyt8P63DMlHyC6xHEJCqbVhAkk5JuNaD0xL5ISsqU
	 KshlL7HZRBbTnvTIpQJVmXCVrWg9ifvBU4lfPT6ZsYWEhLBx4K4FmkbamCvYVhK9B8hZg
	 DaL5AWQSL3hTyi4F3dWNaft75g6R5JjkN4jOHQr1pKdElVfUZBS9FFoOA3Llhgi1fP1qZ
	 BnWdBgbq3ZZNBQ3FTPcr07A3Q1gOAs6kVJwt1SxCI+n7OoLFt38808OGv/IbfG499LM6t
	 yuKRiPir/HD6UTZ1QJTIwgbl1/EBvunTMW82PBwDJSEgX1vV7uUWQmUyldYluRtcarQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="ZpVOXa7/";
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50328606A321
	for <fsverity@lists.linux.dev>; Sun,  8 Nov 2026 20:05:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50328606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZpVOXa7/
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so1606065e9.0
        for <fsverity@lists.linux.dev>; Sun, 08 Nov 2026 12:05:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794168329; x=1794773129; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NsI7ZZLkYjCZutUVEg7TJNtNpCk2xGDMbVs7o+8cm3Y=;
        b=ZpVOXa7/Fhnumr2tBcIUy/OamRHq+llX8Z1JcVJkOxPb6RCt6QrRS4Qj99L6tRnlqz
         3GkEp1ytFAImoFVULTp7DU+17XBCaByRZ3uEZDTZojlM0OPviIqCzF/fO6Jxu5aBN+kL
         fNlq0YBu50ViJvpSDnTBHHharyIGvyLaOwVrKjM9NIRK7g3/RURJpApvtBAKh1bjbnrr
         KyR3jjCPpNw7e7+dAxZsi4iuh5nMUSBQKJ7kAX3zbTadWBAjIhGp9+cNqJOPJ8IrURV4
         VUATsmXkEV53XLUANxay7nitkFABH6pRambiV7Rn5CZpiSXCAMvOrwh509Zu/ihrgmCk
         p8BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794168329; x=1794773129;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NsI7ZZLkYjCZutUVEg7TJNtNpCk2xGDMbVs7o+8cm3Y=;
        b=Tjo31zLoqhDaebY8/q16Uj+C2VCS4qu/JPfnZQVnFMthbu0Z4kPW8rvRWkD6sbwJqj
         GD9n8ddVeH163QHAEIgBeK9RTGsQzuUXuOY3W/tbiw09MF4VfxQ5zKaf0uonwInlfqca
         YMjYTTfpOC5CPvlwYHqdlH/XuyRJFFKmKneVLwobGRlX0MTrBrGpHR117R7Z1trIqiji
         +Y2ElD2zcjOgf8bVRUbAlLi6LkLt2FvIllj+VTHuRC1B1CqtorJ0r0GvkvftUInhFgi0
         51dGPwkE7vauyHDI4hwLHo0xvjBon2VQHlzr+qWk+J5ngB+Gk9FR+JYMb/iz6UL+d99J
         7dxQ==
X-Forwarded-Encrypted: i=1; AL+hErFpKvjFIuE+si7Hyh59ju2Feee8yRvNKsleHSG5wx4g0g3oW0Y/Gk7Ac7RezaQEyLtA4lvf3xxH0g==@lists.linux.dev
X-Gm-Message-State: APuU4Z9FOvgqZsDUgiFI9IkOJ0PzQOfAwPAvyTnSAZwR2FeWEC4sB5cm
	i4SVW1opPxod4FOFihe4EN6oVbNjqtZujYusMd+9orasQoUdH6Fv3nIj
X-Gm-Gg: AYBFou3J4fd0e+KU6iw+LHnyfJXHyKNxq5GtbJcY+Bo3GcIsE0eDi7ws3tsXmq/3aYy
	p8htfn9tCzbSKQ2zjV9vmSywasG/J5ZUdoyq+mfOdLYJEbp7PplsHIz1UQN8WrsHnuI1oRKX2Bl
	3ZZEDpxaBzZBfQrCk8CXwc0Hu56XY8ceN0THEEMLsZ+/Qk3mFg2phujKF9tWkcE5Yt8E8NtbKE4
	6b+L6no5ISQWnTK/ow7qZ8DpgoQNsN1Uo3XkdkCRb2hQwEyAHEc/QpG2JvIIvgrzP/vZiabiyP8
	3KbpvItJeYs7f+gTGXzZSsglD+EVqmjxPTFJ5sOBv8wXyXdcXzwRXrTG77J8PMyeZpYhWoSzN57
	zJZkhXU7Grrj0GEolPXqjYSgvoIva9nv2pFNjvYCo9x91hebhDUWixriXVEr8o4TnbIr2JgU078
	QFP/nmJKA05hmpjwbN6ojUymUfd7VcEem3aktfDsPejU+CKtqAMVGrjX78JJRjippp5Y/6fPTG5
	rCy+Pl010iLvnOgwzzF4USOqTBPV6gMO1uCVx4AOiluwk9mmK/v4Y8OdJPO0rQrCl4qNqrdeK8D
	AM49SCHro8hSnYx3HiPDXWCgs0SrBYS8dUjZPx0bqbOdGgHI+EstrGJP44EkAbZDNwenSE7Gei3
	voRY+p7lSgA==
X-Received: by 2002:a05:600c:1c0c:b0:49f:ce78:3562 with SMTP id 5b1f17b1804b1-4b963c69d23mr43591205e9.19.1794168328561;
        Sun, 08 Nov 2026 12:05:28 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49597186ec5sm5768522f8f.33.2026.11.08.12.05.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 12:05:28 -0800 (PST)
Date: Sun, 8 Nov 2026 20:05:26 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Hannes Reinecke <hare@suse.de>, Jarkko Sakkinen <jarkko@kernel.org>,
 David Howells <dhowells@redhat.com>, bpf@vger.kernel.org,
 dm-devel@lists.linux.dev, fsverity@lists.linux.dev,
 keyrings@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-security-module@vger.kernel.org, Alasdair Kergon <agk@redhat.com>,
 Alexei Starovoitov <ast@kernel.org>, Alex Shi <alexs@kernel.org>, Andrew
 Morton <akpm@linux-foundation.org>, Andrii Nakryiko <andrii@kernel.org>,
 Benjamin Marzinski <bmarzins@redhat.com>, Daniel Borkmann
 <daniel@iogearbox.net>, Dongliang Mu <dzm91@hust.edu.cn>, Eduard Zingerman
 <eddyz87@gmail.com>, Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai
 <ihor.solodrai@linux.dev>, James Morris <jmorris@namei.org>, Jiri Olsa
 <jolsa@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Kumar Kartikeya
 Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Mike
 Snitzer <snitzer@kernel.org>, Mikulas Patocka <mpatocka@redhat.com>, Paul
 Moore <paul@paul-moore.com>, Randy Dunlap <rdunlap@infradead.org>, "Serge
 E. Hallyn" <serge@hallyn.com>, Shuah Khan <skhan@linuxfoundation.org>, Song
 Liu <song@kernel.org>, "Theodore Y. Ts'o" <tytso@mit.edu>, Yanteng Si
 <si.yanteng@linux.dev>, Yonghong Song <yonghong.song@linux.dev>, Linus
 Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v5 2/3] KEYS: Replace assoc_array with rhashtable
Message-ID: <20261108200526.43579e2a@pumpkin>
In-Reply-To: <20261106090516.GA1973@sol>
References: <20261105031401.956609-1-jarkko@kernel.org>
	<20261105031401.956609-3-jarkko@kernel.org>
	<27015846-0161-4700-b810-4643e1f7b63a@suse.de>
	<20261106090516.GA1973@sol>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Post: <mailto:fsverity@lists.linux.dev>
List-Help: <mailto:fsverity+help@lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fsverity+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 6 Nov 2026 01:05:16 -0800
Eric Biggers <ebiggers@kernel.org> wrote:

> Side note: fips=1 actually has little do with security, and in some
> cases it actually decreases security.  See for example
> https://lore.kernel.org/linux-crypto/20261026183332.11402-1-ebiggers@kernel.org/
> where I'm fixing a vulnerability caused by fips=1.

Then there is the 'fips compliant' server we used for routing 911 calls between
TDM and VoIP.
Any kind of PCIe error gets routed out the the motherboard management module
which then proceeds to inform the kernel with an NMI.
At which point Linux crashes.
The NMI is too late to stop the kernel having to handle the ~0 from a read.
And even happens when there is no driver using that device.

David
