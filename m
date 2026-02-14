Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 580812E5B19
	for <fsverity@lists.linux.dev>; Sat, 14 Feb 2026 20:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771102577; cv=none; b=o+YRck2G6Zmx6dM78YfFyTrkVV6lfKcA+UyR31alzzUqVsrfduTJAFWoBaVZv71xga/RVvbXFgUHcO5VNxRQVQrizzpfTdWhFpTukE4ujs0w8zGJci+lRssa5QacwGNk8GD5jw99NdShzsFH2XlWikTl31iDafTyLLIOwoJfwJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771102577; c=relaxed/simple;
	bh=h6P5xznVIbtrkQIWUXaREkKf8IBGeM8PtnYOpbHTLBU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LZP4h6MgVUs65GZVokUYxQ5ZtHRnIa5U6cBXECNKwlS/2Ciml2CgnKlo9io3/MbMM3OhrbuqGtJabuJUAL7eq/khmf+W5Hf6MctJyfAox668gMtlOQ0AMVfH7nAdqLk6/YSk3oR1GsISL2bvDKu/toq5bV4pfRyQMNTv+2Mih58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=eH2vM14h; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="eH2vM14h"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b8f97c626aaso287847566b.2
        for <fsverity@lists.linux.dev>; Sat, 14 Feb 2026 12:56:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1771102574; x=1771707374; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JbvQMzer3/FUOLzQD0nRpytAmjKpWlv4HRm0x7BxSPk=;
        b=eH2vM14hx/NMbxNu5vVtlpXVB5G9rS00K201ym17MPksKxkz/RT5Q1uhifK32aPCR6
         AmuN6K6csFcI3qtrJWnJ5fAXjiQIeiYRxJvNDz3cwxfe8+tAG1rZuSgotriNH6sgqv2x
         TKZf0QxxuKjQI0mGyWF/bfQ9nzBg3Avx5TsSU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771102574; x=1771707374;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JbvQMzer3/FUOLzQD0nRpytAmjKpWlv4HRm0x7BxSPk=;
        b=jKBmOP/l33inwqM1IMf4OVgZgoHZRsWGYCEQnEWgiLHN/nTKJsOpHIhKq5ds6QRDBy
         8etD1rKqY3XIxK9L9bguhguZ/dheO1pOYd5gSVQpHiMkaxsY9nWQH/s/q+lkGztD03wB
         6i2PAOZdFMo4cIq4a6SednZ7GpNunvtF2DQWo/TcJeCVEghk8TOvm+nCfwgPlshznliy
         xkYO45XGI49LRS1rAo50EcY6EfEeRAHmT1wdMESpuokcnRpMClL0JMaaC0HDSuw8NNaX
         15pOK9rhLmDuC/aAABBchzKPI+3KpOkyaXsJ3TfgcxVQwEuQkrdj3VFRnsPO7A3j4/nZ
         0Xlg==
X-Gm-Message-State: AOJu0YxOsGev8O7OM7P9IYHfHMnjLZvwfxTt2YCWHUTIsLmjeMw5kFsv
	EnqS7aLymuC+SaQvSSuGdDaiEktJSLyvf9fwo0clNA1TRYZUWGs3hpsZ9ukKEEJo+sd4tNbtt8Y
	sZFYtpwA=
X-Gm-Gg: AZuq6aLpV18BNW5rwyUhSHh1UjiUiiW5N3vGG75SUzcXJRJHhx+Y5Yd+1i0Tn1qg5z4
	PBTwNPSMxTIe2IOiwLOE6u84cZzumXggvUW4Qtd9O3lus8V6ETuYUqhY+daB4O9kWS12D2kq44x
	w29MqgmPExO/sM8CRENGWN1ic9iyNDvtZWfXxaUhmGk4dDrCyHnjbkewzNWaHX675ZzV67nfWcj
	7am2g2XQTZDzeXW3hb7ts0g0WnWTbQqxnYb7TNOYrteyE4Pw3/u54jndqzFXIlwqY5VnicuGAAi
	evuJRXq9Am0Y0DA9HtMQqNdM9XzH/ZmlF4bo0rNSzk/jQ/6aeVtXs7eibhFZ6faiR5PhqPPBvd5
	MwNEx4dlpKz1AUMC/p/U6GP0fafAXruBxMLZcJSdHwlUh0Y+DjPvbJIcA1XwLGywVHes82ViyLJ
	KjP70mjvZuYzbTFH+hZ30SKOq8Huj4r/SOfdIj+zZJX83HnVPvvA+mx48KMH5Hq8RS646OFXAO
X-Received: by 2002:a17:907:728c:b0:b8d:bfb9:aefc with SMTP id a640c23a62f3a-b8fb416018cmr294439266b.11.1771102574409;
        Sat, 14 Feb 2026 12:56:14 -0800 (PST)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc73860cesm98695666b.23.2026.02.14.12.56.13
        for <fsverity@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Feb 2026 12:56:14 -0800 (PST)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b8fbe5719ceso231518866b.1
        for <fsverity@lists.linux.dev>; Sat, 14 Feb 2026 12:56:13 -0800 (PST)
X-Received: by 2002:a17:907:3fa4:b0:b87:2780:1b1e with SMTP id
 a640c23a62f3a-b8fb4485f66mr344808366b.41.1771102573559; Sat, 14 Feb 2026
 12:56:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260214203311.9759-1-ebiggers@kernel.org> <20260214203311.9759-2-ebiggers@kernel.org>
 <CAHk-=wi60UWZ=kVayGKfrGURiX4aN6P4J_bNMOw_pSvUrxw1jw@mail.gmail.com> <20260214204833.GA10472@quark>
In-Reply-To: <20260214204833.GA10472@quark>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 14 Feb 2026 12:55:57 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjiNgOopJgV9=apY8AzOBAqXi=xfWpzN-3dkhL=5_4UKg@mail.gmail.com>
X-Gm-Features: AaiRm51_6K5-2xlX2SS3HjfeJ2KHPjBlp8PFC1E0bbiJAg4nV-gV3EBEtvG_dBo
Message-ID: <CAHk-=wjiNgOopJgV9=apY8AzOBAqXi=xfWpzN-3dkhL=5_4UKg@mail.gmail.com>
Subject: Re: [PATCH 1/2] f2fs: use fsverity_verify_blocks() instead of fsverity_verify_page()
To: Eric Biggers <ebiggers@kernel.org>
Cc: fsverity@lists.linux.dev, linux-f2fs-devel@lists.sourceforge.net, 
	linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>, 
	Chao Yu <chao@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, 14 Feb 2026 at 12:48, Eric Biggers <ebiggers@kernel.org> wrote:
>
> The reason I went with the direct conversion is that
> f2fs_verify_cluster() clearly assumes small folios already

... and that was exactly the same thinking that led to the other bug -
"it's fine when folios and pages are the same".

And then when the caller was then changed to know about large folios,
the code silently became buggy even when it visually *looked* right,
because the page-to-folio translation had cut corners.

           Linus
