Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35DAF46D2CF
	for <fsverity@lists.linux.dev>; Fri, 25 Sep 2026 11:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790337522; cv=none; b=DyMsokcS8Jb7+eElJxkcVQ7f5C5J8tCbDnDEOmsNgyaoIGC+lLzRYHUNrVXAj8KGmOA6ySgGaV8hPWcKut4RPHLtu5pRBNJR4A7E5GsCDXMEHlsHnFVlWxJBMZY60rhco5ysQY8XZhPDhjYAsA4UQlOYsVRqWV5T09bDJoezfn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790337522; c=relaxed/simple;
	bh=FxKBpOBjA/JkIs/Fl2MnIY0gyzz7K9xSHeNXcVVjUAg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LjvMWQG4W05tpqvhxy+Ce/IOWwKrUmRnu/vB7NqECWN/bZttga+Td8eczMaXmWS0SBZSjVHX3WsDjZNNUeNpr4NU+1BU0jK71iATOi66nWYlnT51Hse5ewCSFbfGri6S8DCZp75BRAAwbrbmGctKoJp4iR0cRuKhY1vucC5SIRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GHogh/N9; arc=none smtp.client-ip=74.125.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GHogh/N9"
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-34215285aa1so105956eec.1
        for <fsverity@lists.linux.dev>; Fri, 25 Sep 2026 04:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790337518; x=1790942318; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lHC73SowwbefD+dnD0Tzun2jA32dwQM9QRKwhvKfql4=;
        b=GHogh/N9rHbJZb3ZDAPgypgeaZtT67F33m3NOZPGXU/kGEo7szNMv/lVASMPKVVWmL
         pwYQIcKzDF/ul/0aEcd8NkaYT6zFFYYdQIYY08+F8W6BycTX3Sg5vqQYigJzx2g6Twhn
         QBpCA/qfCE0coxjcYdz2gnFtyE/iuhgvTWzNuczyHDGOy/6LtMFgPVG9ltytiYgvwFto
         Q/lHHzoi5a0m1JUf6eoCuvP8rh1Pu/5DptBYK7p7KpPR4lK+qjAZAg33xkGoTCreUCLs
         hbGEzYX/Y4C30555pk50ksXK6nICQ8fVjuxUtcuJMB0O3fKKoXRtMRO9ySlIu09tThbY
         CHuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790337518; x=1790942318;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lHC73SowwbefD+dnD0Tzun2jA32dwQM9QRKwhvKfql4=;
        b=coQBJDskEezISDsI/GTVfa0tLf7mUktD+25brY2rxVNx9EOxYVpOhQv3ppRZrk+qvJ
         xdz9ePqoIqy/07CBdqcoNniMVNRsyI4IFW3Rg1dZkzqQeyqG2htPJQL4cS962ywJ2J+P
         c6Q2d0cShifWXUFuYeqeqv40Rlq7CYU3VIX+tQX7phDo4OZuuQt0VoHfxYyIsHw7JX5E
         hUr4kTOz8ErDrmjxijV49AS+GWZvLdqIbcjRkbcDZcA6xmJMv3dH6p7s+J+Ggz+3iVHd
         xEDIn40HlaZo8gK5jU9AtPfQZz7oCOpx+QMQXEcdUj6KMQJ/k2kLiRjfN53zWkqJA4xO
         gmKQ==
X-Forwarded-Encrypted: i=1; AKwUvBww04UcIIo/F6TzpiA4CFR2AsmAYzMF5Q1+qBLZU7aLPEJ1IbnVv6/Mg/UZb132zOSCuvczDkArrg==@lists.linux.dev
X-Gm-Message-State: AFuF++nL7yA0Uwzyap95AG9j7wvM/e6jRKeODZtwru2BHLhLjuTkNRdp
	X13yPTJfuM/p0TfEB2tnDviwvyvSmJSwZCL+T1f/hr39uyxPJLLLLbVv
X-Gm-Gg: AYBFou3wZCLcLPra4iddoAtlFd3ONiDL2DUJKac2PRnbsyYVkW/e2qeBx0GZh2+5j/t
	jJnEecBHVokoo2FXULTfU85g3qf40arqJcnLWFGS8nlvSf9rTnWE1muWShci8Qdm9hWjR/Nm1ft
	vIoYQ1nZJLTw+kawQOUg2xxrehDEnMgp/zsm6AnHvkiobB77dQ3Wo52J/H8k+Ja7ME6/QUEwIa3
	EDO0zCy5eFz+vCiB+dxUyJ0MN5t7UQy51KIrOHWVaFn2wcEZUYLNIdX8iJsFp4We37jNH3gXwPI
	FeCyjj3bLsBJBR3UrinE/bdXudTG4Xb43LTjGvzxIL0dz02BFYYLDrztjpEeq01xZ4BQhjZv0+w
	4/hh8Pvj4uKWoJckrN8wX4Hnfv2iHvEOwU9nYsLXuwbULZ6V10CKDDDBzb0gT5uI+Zn1vsjG85E
	/TKUibUqRmPwJO9AJjaehHsmUap53VsqM2TFEJJIx35D+ncTeEMBqFSSDXT0xu35Zrij3HBxfNi
	ygBl3B/8c+YTuqR8wyPjLo7NNA4HY2pRPNKnucCitXeDWIhrRg/f2ew6j57I7RxpxZVOVl1phXR
	qEjQtPx1jeulnGVqjAscICwMTOHKwuWsq0g8DfjJ1rnC1/CUmgDy0bUhr88=
X-Received: by 2002:a05:7301:1f15:b0:332:94e9:a732 with SMTP id 5a478bee46e88-34273b41bbemr4098eec.13.1790337518181;
        Fri, 25 Sep 2026 04:58:38 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34144757f31sm10299851eec.14.2026.09.25.04.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 04:58:37 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: ebiggers@kernel.org
Cc: linux-fscrypt@vger.kernel.org,
	fsverity@lists.linux.dev,
	tytso@mit.edu,
	jaegeuk@kernel.org
Subject: Re: [PATCH] MAINTAINERS: List the fsverity branches
Date: Fri, 25 Sep 2026 19:58:34 +0800
Message-ID: <20260925115834.1067656-1-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260925042356.GA112369@sol>
References: <20260925041654.112935-1-ebiggers@kernel.org> <20260925042356.GA112369@sol>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, Sep 24, 2026 at 09:16:54PM -0700, Eric Biggers wrote:
> The fsverity entry in MAINTAINERS has a T: entry but it doesn't mention
> which branches are used.  Update it to have a T: entry for each branch.

Both branches exist and match what linux-next merges from this
repository (fsverity and fsverity-current in Next/Trees).

Reviewed-by: Matthias Goergens <matthias.goergens@gmail.com>
