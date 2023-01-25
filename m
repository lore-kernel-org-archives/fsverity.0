Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4766C1102
	for <fsverity@lists.linux.dev>; Wed, 25 Jan 2023 04:48:21 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4P1rv75Q5Hz4xwq;
	Wed, 25 Jan 2023 15:48:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1674622100;
	bh=YpBIUAJ0Y+tnPxd3Pdf0j6P5IFQtiaMQ9t/s0VbiGtE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=kZ4YBYcw22qPnUY+ZfSjDDnrdTFq8RkDu8AKnT5Clo3ewa65Dtg+/d+nzgPeI3bOW
	 7N8r66OyfbpvPmedTRDhuPVB2w1/PZ1XuvPplV449Dk7nSPk8G0mW/vuRevkU3akDK
	 iQUcNIWRm9lYuQwryAYnWxfvj39PNjqpQFZQWHqgJWuX1nIvna3YV5HdL3PqhcXJ4p
	 9guGzwW+b3zARKyXtZ7cqQxWhi0RHdAcC65kwqlrSxzPZGssXeaMt4A0EyHK6WemJQ
	 x5JOV9CHnP+3yYiPu+LULqnPIQEMet+k/yQ/GVHq+BJgH+v8mxvyVnygunlRe6NGde
	 H2nusPAYle6JQ==
Date: Wed, 25 Jan 2023 15:48:18 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-next@vger.kernel.org, "Theodore Y. Ts'o" <tytso@mit.edu>, Jaegeuk
 Kim <jaegeuk@kernel.org>, linux-fscrypt@vger.kernel.org,
 fsverity@lists.linux.dev
Subject: Re: Please update fscrypt and fsverity branches in linux-next
Message-ID: <20230125154818.671047ae@canb.auug.org.au>
In-Reply-To: <Y9BRoE/SIg1aUh+P@sol.localdomain>
References: <Y9BRoE/SIg1aUh+P@sol.localdomain>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9VMgMlTY9ztCyui7_93KTsw";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/9VMgMlTY9ztCyui7_93KTsw
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Eric,

On Tue, 24 Jan 2023 13:46:08 -0800 Eric Biggers <ebiggers@kernel.org> wrote:
>=20
> I've moved the fscrypt and fsverity development branches to split them up
> properly and make it clear what each branch is for.  Therefore, can you p=
lease
> remove the following branches from linux-next:
>=20
> 	Repo:      git://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git
> 	Branches:  master, for-stable, and fsverity
>=20
> And please add the following branches to linux-next:
>=20
> 	Repo:      https://git.kernel.org/pub/scm/fs/fscrypt/linux.git
> 	Branches:  for-next and for-current
>=20
> 	Repo:      https://git.kernel.org/pub/scm/fs/fsverity/linux.git
> 	Branches:  for-next and for-current
>=20
> Also please ensure the contacts match the corresponding MAINTAINERS file
> entries.  For fscrypt that is:
>=20
> 	M:      Eric Biggers <ebiggers@kernel.org>
> 	M:      Theodore Y. Ts'o <tytso@mit.edu>
> 	M:      Jaegeuk Kim <jaegeuk@kernel.org>
>=20
> and for fsverity that is:
>=20
> 	M:      Eric Biggers <ebiggers@kernel.org>
> 	M:      Theodore Y. Ts'o <tytso@mit.edu>

All done.  They will be included on Friday (as I am not doing a tree
tomorrow).

--=20
Cheers,
Stephen Rothwell

--Sig_/9VMgMlTY9ztCyui7_93KTsw
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmPQtJIACgkQAVBC80lX
0Gyl5gf/R6kmBxXL99RET1pi0t/OKiFdd6HxteBx1beZ3OuIFr8ih49NjQ28N6hV
ZkZSatwKfrniPlTYREyCugQsenWviXikHD2QLmEab3tgxvUYERzxzr+FoxicFCKH
P1QXYJvf4tvWXfuKEU6fcAtfo1E5WW1iVGyUTk8758YuLeDCC6V70l/5xY1EMTqX
NvGQNM+bZPmWGu7+UaRHQCfjtcVdKIpzs83Qo7mVZ3JScIHhG+sG8oNYPBeUQc3j
63AasEVPOqI4qw4QbIJXn/jiUBBvo/2JPkP67w7oDKwikzCcFe6gGQFzfdBuIVS6
F7vX32XEVrf9Zmfruq8mog0eBC5Aww==
=2D2C
-----END PGP SIGNATURE-----

--Sig_/9VMgMlTY9ztCyui7_93KTsw--
