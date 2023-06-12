Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4868921CEB
	for <fsverity@lists.linux.dev>; Mon, 12 Jun 2023 16:32:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88CBAC433D2;
	Mon, 12 Jun 2023 16:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686587538;
	bh=PV5OW3UaWfWmaC3Hd9wjtEzKlQ9Rb16b7K8BlJN47QQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E+8mITw9pTk12tRvdksTbVB+55sgKuY5k8jelBY+flV6vPrMyDXlroQAqc6PC9jJy
	 xfErlu4b6gikEXx4RUsWnar5wejmHSnFs4P+eoefjP5QwA4EPPHNPpFGTSuNYF0icV
	 DYMyS0hdoOMCq2I0Gu3mwGER0nS7Zk05VKYUEk4g923q2dmHzQAxXc1Uo6OJ/outvD
	 IhIXMyD5bEgmDlwiZh2kQ37xfkbVjSJGXmDNMQVIpgen5qSyP1PPOP/YcnxNo9j7TC
	 fZnWyT692R4WMrbyxAjsEKDKwl7mjT+cD4t+3/MBcIU5qtY6r1EsDWqzFnf3gT5Fb/
	 cJGBttEK519Aw==
Date: Mon, 12 Jun 2023 09:32:16 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Alexander Larsson <alexl@redhat.com>
Cc: miklos@szeredi.hu, linux-unionfs@vger.kernel.org, amir73il@gmail.com,
	tytso@mit.edu, fsverity@lists.linux.dev
Subject: Re: [PATCH v3 2/4] ovl: Add framework for verity support
Message-ID: <20230612163216.GA847@sol.localdomain>
References: <cover.1686565330.git.alexl@redhat.com>
 <03ac0ffd82bc1edc3a9baa68d1125f5e8cad93fd.1686565330.git.alexl@redhat.com>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <03ac0ffd82bc1edc3a9baa68d1125f5e8cad93fd.1686565330.git.alexl@redhat.com>

On Mon, Jun 12, 2023 at 12:27:17PM +0200, Alexander Larsson wrote:
> +fs-verity support
> +----------------------
> +
> +When metadata copy up is used for a file, then the xattr
> +"trusted.overlay.verity" may be set on the metacopy file. This
> +specifies the expected fs-verity digest of the lowerdata file. This
> +may then be used to verify the content of the source file at the time
> +the file is opened. During metacopy copy up overlayfs can also set
> +this xattr.
> +
> +This is controlled by the "verity" mount option, which supports
> +these values:
> +
> +- "off":
> +    The verity xattr is never used. This is the default if verity
> +    option is not specified.
> +- "on":
> +    Whenever a metacopy files specifies an expected digest, the
> +    corresponding data file must match the specified digest.
> +    When generating a metacopy file the verity xattr will be set
> +    from the source file fs-verity digest (if it has one).
> +- "require":
> +    Same as "on", but additionally all metacopy files must specify a
> +    verity xattr. This means metadata copy up will only be used if
> +    the data file has fs-verity enabled, otherwise a full copy-up is
> +    used.

It looks like my request for improved documentation was not taken, which is
unfortunate and makes this patchset difficult to review.

- Eric
