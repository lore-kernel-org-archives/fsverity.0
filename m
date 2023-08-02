Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12DC6111B
	for <fsverity@lists.linux.dev>; Wed,  2 Aug 2023 04:27:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB901C433C7;
	Wed,  2 Aug 2023 04:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690950439;
	bh=hX4+BBNpY6v9V9yZmshvQoS2ubWChKYDj6zUT1dKWf0=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=bSxZK9xs07htwRlGuKQb9U2jFQkdd+JKtZYkj+yJEcR44l8EqDG1BjPOtF+4W2jn3
	 wykaCI70IJb3VLGc85XnN8GzZXv6RbmV5T5CJ4t7SQ3WWZUArbOrtG2nZUMnZ4LOd9
	 UagH0QAmYhqQxETcZlp1l4L1URn4Foxi+Fh3+nBzHop3PgHCrHIK9XklKMUgIetOGH
	 oRGyd7XXqlxvrhOhFpM5FkG6nkW4P737UzLaOxq6rrtFfhlaLIsMmVN8q3hqNpe6mn
	 zSQwVjbhZn4K2TvzW3Fk4EJzLjXfYZk6Wv5tOPu2aNKG6LTQ/QIq19rMqZOHPO5rQA
	 lONsz3hkckJHg==
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 02 Aug 2023 07:27:15 +0300
Message-Id: <CUHRWHU485NB.19OIDMLF4WY5G@suppilovahvero>
Cc: <keyrings@vger.kernel.org>, "Victor Hsieh" <victorhsieh@google.com>,
 <stable@vger.kernel.org>
Subject: Re: [PATCH v2] fsverity: skip PKCS#7 parser when keyring is empty
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Eric Biggers" <ebiggers@kernel.org>, <fsverity@lists.linux.dev>
X-Mailer: aerc 0.14.0
References: <20230802041503.11530-1-ebiggers@kernel.org>
In-Reply-To: <20230802041503.11530-1-ebiggers@kernel.org>

On Wed Aug 2, 2023 at 7:15 AM EEST, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
>
> If an fsverity builtin signature is given for a file but the
> ".fs-verity" keyring is empty, there's no real reason to run the PKCS#7
> parser.  Skip this to avoid the PKCS#7 attack surface when builtin
> signature support is configured into the kernel but is not being used.
>
> This is a hardening improvement, not a fix per se, but I've added
> Fixes and Cc stable to get it out to more users.
>
> Fixes: 432434c9f8e1 ("fs-verity: support builtin file signatures")
> Cc: stable@vger.kernel.org
> Acked-by: Jarkko Sakkinen <jarkko@kernel.org>
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>
> v2: check keyring and return early before allocating formatted digest
>
>  fs/verity/signature.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/fs/verity/signature.c b/fs/verity/signature.c
> index b95acae64eac6..8f474702aa249 100644
> --- a/fs/verity/signature.c
> +++ b/fs/verity/signature.c
> @@ -62,6 +62,21 @@ int fsverity_verify_signature(const struct fsverity_in=
fo *vi,
>  		return 0;
>  	}
> =20
> +	if (fsverity_keyring->keys.nr_leaves_on_tree =3D=3D 0) {
> +		/*
> +		 * The ".fs-verity" keyring is empty, due to builtin signatures
> +		 * being supported by the kernel but not actually being used.
> +		 * In this case, verify_pkcs7_signature() would always return an
> +		 * error, usually ENOKEY.  It could also be EBADMSG if the
> +		 * PKCS#7 is malformed, but that isn't very important to
> +		 * distinguish.  So, just skip to ENOKEY to avoid the attack
> +		 * surface of the PKCS#7 parser, which would otherwise be
> +		 * reachable by any task able to execute FS_IOC_ENABLE_VERITY.
> +		 */
> +		fsverity_err(inode, "fs-verity keyring is empty");
> +		return -ENOKEY;
> +	}
> +
>  	d =3D kzalloc(sizeof(*d) + hash_alg->digest_size, GFP_KERNEL);
>  	if (!d)
>  		return -ENOMEM;
>
> base-commit: 456ae5fe9b448f44ebe98b391a3bae9c75df465e
> --=20
> 2.41.0

Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>

applied

BR, Jarkko
