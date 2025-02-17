Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44563237160
	for <fsverity@lists.linux.dev>; Mon, 17 Feb 2025 19:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739821421; cv=none; b=M2jh9dSQ6RMGyyR0uzjkR+9Bj+MplQlzgZ0T/EbiJjYHQHLlSUinWKHNQDvAlU3IoWzd1BjWSOgwl7nl9kJ3PsVsppVKYMA69u3y9HQH6pENzFMon6bbp7XJsHoxAQkzy48EDDKyL55KmvVZjXVqwbxVRtplM+PTRqLm0/5YlRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739821421; c=relaxed/simple;
	bh=uafwRf7i12m281cPfWq8453lJP3CKKStPf2uuPBrNTc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qWBNlZ9zBQ8+v4jeZn1LpExC8YKynthhNBHLLwMSTHxjuXGrSQJpK+actTUQE2q2RKTh1ms5SYDfu+V+r0wytDkiGXP48roisCEa9m0J4wNhpY9g19gWEGWj4+exZKEJadYmMNZ9tHjg3Qz8hafzVkzd3Adk5VH2jeljIggC82k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CCZwjECk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CCZwjECk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DBCDC4CED1;
	Mon, 17 Feb 2025 19:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739821420;
	bh=uafwRf7i12m281cPfWq8453lJP3CKKStPf2uuPBrNTc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CCZwjECkAQbUtTJLSxcec1/l1C8rkrtIlDmhuwIAjL/x1UkY04pchAIX+T44dLlL2
	 yNyhtlMxb4vtRJ5kxgWuvAZun33CBGzGH+HVKMFFWu7BCd2bvDLwiGJOrsoSg0a5tD
	 OmuW/rwk/uYs1s+tgxwd2ZolDHyYDjjD1+t2bsffA88UEHuTLD6TCO/vW6aVX8DoWP
	 lpF6eVVz6q34UcVOznrBLBncuGxBUiUK4MbeVjFsHWPbUhvq9FoX4JPjH0hMCQ8W4G
	 grMctneradbPPy94GqKur6V/5/7avnT8ZaLKAGiZZvJGPBK/8HR+IYxi80LHEX4xpv
	 nDSQVNNxPIfIA==
Date: Mon, 17 Feb 2025 11:43:39 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Disha Goel <disgoel@linux.ibm.com>
Cc: fsverity@lists.linux.dev, Aleksander Adamowski <olo@fb.com>
Subject: Re: OpenSSL engine removal and fsverity-utils compilation issue
Message-ID: <20250217194339.GE1258@sol.localdomain>
References: <d42c3dd4-47b4-4e98-9814-99cd9c1d112d@linux.ibm.com>
 <20250123182436.GB2117666@google.com>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250123182436.GB2117666@google.com>

On Thu, Jan 23, 2025 at 06:24:36PM +0000, Eric Biggers wrote:
> On Thu, Jan 23, 2025 at 04:02:46PM +0530, Disha Goel wrote:
> > Hi,
> > 
> > Some distributions have started removing OpenSSL engine support, replacing
> > engine.h with an empty dummy header file. As a result, fsverity-utils fails
> > to compile with the following error.
> > 
> > Is there any plan to address this issue and support these distributions?
> > 
> > Please seehttps://fedoraproject.org/wiki/Changes/OpensslDeprecateEngine for more details.
> > 
> > # make
> >   CC       lib/compute_digest.o
> >   CC       lib/enable.o
> >   CC       lib/hash_algs.o
> >   CC       lib/sign_digest.o
> > lib/sign_digest.c: In function ‘load_pkcs11_private_key’:
> > lib/sign_digest.c:350:9: error: implicit declaration of function ‘ENGINE_load_dynamic’ [-Wimplicit-function-declaration]
> >   350 |         ENGINE_load_dynamic();
> >       |         ^~~~~~~~~~~~~~~~~~~
> 
> This is my first time hearing about this, but yes this has to be fixed.  Thanks
> for reporting it.
> 
> It's just the PKCS#11 token feature that is causing problems.  This feature was
> contributed by Aleksander Adamowski <olo@fb.com> (Cc'ed) several years ago.  I
> don't have much context on how/whether it is still being used.
> 
> I'm tempted to just make the PKCS#11 token support conditional on
> !defined(OPENSSL_NO_ENGINE) for now.  If someone still cares about PKCS#11 token
> support they can look into finding a way to keep it working with latest OpenSSL.
> 

Now fixed in the master branch of fsverity-utils.

- Eric
