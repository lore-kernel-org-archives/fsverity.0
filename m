Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD1983A6F0A
	for <fsverity@lists.linux.dev>; Sat, 22 Aug 2026 13:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787406119; cv=none; b=BeNpFfSHzcEXG6BmStEI2TllPhhSdpvZSOvfLVrxMtebsxFoZiHDLvNiK9O54VGU2ZuX2dXMH2bkqXjlUKSYDabn+2s9jFRYq5IfPIPt5mAd6TuAqatUiMmhIpm8zhojMo1T4nWWUMhhMinYeie0SAaVzX7Tohf8+bibd0Nsnt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787406119; c=relaxed/simple;
	bh=ShtTkIU3ezbFJIydaBLYCMvhC/wGsulze2uz5bQe5G4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fqDGkBcvOV4xbBLMGAdU9fQ/H4OYs+AUyAr5vrXzmzHlJh6M3cM3CnGETa4CKEGlmqOPRQHCA5iklS+YDBwu5uV259R72NbUwG40arytROg8JR2kTc5KBXKjXq7kPfyKIRsTYEV/uFHZsUx6GidjKkOBNPIK3P2tIF+1ucutFFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=m7ARVDz0; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="m7ARVDz0"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c15cb6f5c12so352920166b.0
        for <fsverity@lists.linux.dev>; Sat, 22 Aug 2026 06:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1787406114; x=1788010914; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Aj3ZYubTvLgnR11pZYHVat4EVUJdKX6AnHgTVge4+Wc=;
        b=m7ARVDz0+tsAgVTJG5RARAOMnpQnZzJ1TOPyGGj10sNI7L0waOq//ywaRJV4NQRxif
         8tnHfjm+tphsuEqmxX0rrvT5AeZTcbFEuZ/fyqyHL7q2gZdJ+8Wv9m5JAO7yhdZtOGuS
         I2Y/+cSIW1S+zvXmvh+M8a8ExdKlcqgxY54Nn4au83qia4qDGfHfwte/fImIy0QQI6Yz
         BFTtyWEH3b19yLryO+W/F62RCL1KFgDhKs90rRdVFZ/qI0BBfQRWZadjDpzbZ0LXVcpK
         daleagdCmdZFumcLMJOyi6Ff20WlWyYPAFkrl6yALoLlY6tKS9yFIW5A+vgW4wCfun8Q
         Vf0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787406114; x=1788010914;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Aj3ZYubTvLgnR11pZYHVat4EVUJdKX6AnHgTVge4+Wc=;
        b=jO9OneekthVbJaNec25sn5TPt/eeonRqvz8dbO78xHXXUWnif60uD+BzKoCEC6O6fr
         7RRxjj0R3s1UpnLBfKcvHUHczJ+7s7+fbJhPymhVkmcEjNg5hVS+Dq4vyTklFEK3oDz4
         V8+ZqfNaCwRr8stcVo+Hb8v7dAcW0ZIErMD+qF8ki74I89Qj53gcWcSannnNW6hXwpiy
         zRPUWsnFJyBse0LJdPdaRqMfmWMfHWbmF2rvF4KraRZbBDThoiBoDh+XVbBEvIsXcKPi
         4XBOZww1dChobMO/AOgAbmMQi+qEuUWr/Ft6rXk/01toTDcXxHcPRJfYOoHE9M6K9UnH
         d6AA==
X-Forwarded-Encrypted: i=1; AHgh+RodWkTDpbtk3U3WwsL0pvuFqcTL2ICOSCdiIpzTP1GcAM3xGWeQTLW1rujAY3vPqW2h2uVZFYV5LA==@lists.linux.dev
X-Gm-Message-State: AFuF++kgDso6Uqw23DXGl8Mw8oMdORYr/6KwBjgzKdOX88vO3Kd+obOS
	GaRQXrtrUkDCcmIS529+VVVAFaj6kDZz9/jOqyoFnx5T0ddbkY2D4i7Yk2ZpNVB/di8=
X-Gm-Gg: AR+sD12VX4qFiODHKGSS8LN6qNFrz72qrC6fR3iER+hwXDDFN/caqORj809qJH2R5Hn
	WP6nplD25slsi5pWnVMhXON2c8jX9P5e0GKfcgHKMDEf0L110jYUOsUjVWFur2H4REClo/4kpRb
	EE3e0wDV6iqIfEmGLyNRAB2BSGDFDiqnBqLEfjLZtVOfeRGvuJGPtjjgejbYPin/fzdYSEZjOvh
	rKqgva16GQmmbirL+IbJGFaB0NhIt11LAaAGo7YZfXCJZ6EZ8N2nX5WBFOOLrjebUJxgalAMoRQ
	e/k9Xmrf5iwV/E9Z+XXgXASS401OmvYWMGYukFMrlEhwjlMu5AtX4XUvXv9sxbqCxBsmJl+5iLG
	WN/CobR6k32byHe3AmeG4fsY1a0BBNITtIR60ElJJNLzxMSiEV/vZVR8RPtOqYCx+fqZnrVlAm3
	eIEXhII8KW4BdP9dIuMNfpm4wWiFwGeefhPds0BdM6NGTmR9QJBvNoxjIBwHOTgh82Gw==
X-Received: by 2002:a17:907:8908:b0:c21:35d0:f435 with SMTP id a640c23a62f3a-c24924db408mr547750766b.10.1787406113365;
        Sat, 22 Aug 2026 06:41:53 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-c249606a8fasm387614266b.8.2026.08.22.06.41.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Aug 2026 06:41:52 -0700 (PDT)
Date: Sat, 22 Aug 2026 15:41:50 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Mauricio Faria de Oliveira <mfo@igalia.com>
Cc: Kees Cook <kees@kernel.org>, Joel Granados <joel.granados@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	kernel-dev@igalia.com, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	fsverity@lists.linux.dev, keyrings@vger.kernel.org, bpf@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kbuild@vger.kernel.org, netdev@vger.kernel.org, 
	linux-wpan@vger.kernel.org, lvs-devel@vger.kernel.org, netfilter-devel@vger.kernel.org, 
	coreteam@netfilter.org, linux-sctp@vger.kernel.org, linux-rdma@vger.kernel.org, 
	linux-s390@vger.kernel.org, bridge@lists.linux.dev, mptcp@lists.linux.dev, 
	rds-devel@oss.oracle.com, virtualization@lists.linux.dev
Subject: Re: [PATCH RFC v3 03/13] sysctl, mod_devicetable: add macro
 MODULE_SYSCTL_TABLE
Message-ID: <aomlfGJM61qZKxx2@monoceros>
References: <20260819-sysctl-module-aliases-v3-0-aab90569365d@igalia.com>
 <20260819-sysctl-module-aliases-v3-3-aab90569365d@igalia.com>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="akn7oxv4v2qk2wdq"
Content-Disposition: inline
In-Reply-To: <20260819-sysctl-module-aliases-v3-3-aab90569365d@igalia.com>


--akn7oxv4v2qk2wdq
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH RFC v3 03/13] sysctl, mod_devicetable: add macro
 MODULE_SYSCTL_TABLE
MIME-Version: 1.0

Hello,

On Wed, Aug 19, 2026 at 03:16:16PM -0300, Mauricio Faria de Oliveira wrote:
> The MODULE_SYSCTL_TABLE macro emits a struct module_sysctl_table variable
> with pointers to a sysctl table's path and entries, and table/entry sizes.

That new struct doesn't seem to contain any pointer?

> That symbol will be handled by file2alias.c (modpost) with the changes in
> mod_devicetable.h and devicetable-offsets.c.
>=20
> The option macros MODULE_SYSCTL_TABLE_{DISABLE,UNIQUE_ID} can be used on
> a per-file basis to disable the macro and change the symbol name pattern.
>=20
> Signed-off-by: Mauricio Faria de Oliveira <mfo@igalia.com>
> ---
>  include/linux/mod_devicetable.h   |  7 +++++++
>  include/linux/sysctl.h            | 42 +++++++++++++++++++++++++++++++++=
++++++
>  scripts/mod/devicetable-offsets.c |  6 ++++++
>  3 files changed, 55 insertions(+)

Please put the new struct in a separate header. Apart from not being
about a device table, I'm currently work on removing
<linux/mod_devicetable.h>. See commit
ad428f5811bd7fb3d91fa002174de533f9da94d7 for more details.

Best regards
Uwe

--akn7oxv4v2qk2wdq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmqJpxsACgkQj4D7WH0S
/k5bfgf9HJoNnVEr9RCdAghOTP5QqFmH5ae7Kbmnodv6c6Pi9JGIjjGbeT5eKw3e
JkSKqdEnlVMrLoKrhneRsxwTDGPrZvrLZrPLdZwJmPWZn5Fg+kkOO9yFAGPeMsPX
S6UP1NY9kaCiBtlcsGT9EvMWz0jWVAWX1xb7Y2WcVZJsCWdcPhvWc3/lIbw3E4o7
PqLtSFblkQmtGl2OL4WkP6xhEPH6qQO9BAmhLVKKZwFW5/l4sHmXRrpgSJlroR3b
iH3liIeS6wxFp/fMYuFRryGHNMXn6gC447OnOCTmGNEj7+7Y3COwSGivgubcRIzI
RkmxkMf2Iuntnwp4oQzCbipE5EiKGA==
=SPY4
-----END PGP SIGNATURE-----

--akn7oxv4v2qk2wdq--
