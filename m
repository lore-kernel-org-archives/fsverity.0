Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAAA7522F0F
	for <fsverity@lists.linux.dev>; Fri, 18 Sep 2026 19:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789761591; cv=none; b=oJHOBlNwm69xj/diwN/fpF4sGj5/Mwhvp7NS79czGkd3ToI9aTZ8zsjlOS14jAJ95aZKeYhkQP+ihHcV66ZnbVoBPtnv65xyobLS3mpUr3pJSpm9bXcXxInbzgbBPruiVVjC10YASSxPie8QeKf2JwKpkD3swxFMaiXI8pmScJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789761591; c=relaxed/simple;
	bh=Jv9PmI2tuRQ6a0mGkf94vkgPMQlOdZGeXzjl16O8i00=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uLEfyGeFdnm7JySBzuTXvRE63tQV9hoKtkseaWzXJQfb6Mn4hDQAKZ56ad46qlfnV1caQ4LqLr4j4cPBsMFO1PYjntWJk/s6/rbeHsS8+N7fVXi27CDobaWxjByOP0JwCgrJ6ZA8cE7ipE+eHwrbGIwqyU9TZdzZT36jdUrSc/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com; spf=pass smtp.mailfrom=amutable.com; dkim=pass (2048-bit key) header.d=amutable-com.20251104.gappssmtp.com header.i=@amutable-com.20251104.gappssmtp.com header.b=QKzaE4Ae; arc=none smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20251104.gappssmtp.com header.i=@amutable-com.20251104.gappssmtp.com header.b="QKzaE4Ae"
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-66f7a9afe43so1070152d50.1
        for <fsverity@lists.linux.dev>; Fri, 18 Sep 2026 12:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20251104.gappssmtp.com; s=20251104; t=1789761587; x=1790366387; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jFiXSu2V4pZ+QeomBn1c5HcWy5gtnzTo7Z55CduAixo=;
        b=QKzaE4Aedl3E9mGvBkMJ/22jL7oPxGf6fuwULsC7uygqvycWLKyKy7vx7BQosHfUeB
         694khV7nrTr4oD8URVzIfIz9BxYRTe+pBHDnjSi1OehK0ZPcTU3WJWO0CgJe8/NaLhlb
         FGL7sKV6OlMEr+6Ij81Q18BjrLSWbMsz5x5d2kbqVTJeqxICB5AntfaG9Rp5O6GFULwd
         TMAzAx3YoOnemF9+Ka5zdHHNaxOAwt4sH3Iazwcxo1Vik3jjEz1DRzn3e5UuJVgOCfAz
         22A+b3FQYW81J0CKrKzlTsVj0cK/DiQCgJqFbI4HIS2EUeIZFpRPAxLrCNDKapFBLzdF
         ll9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789761587; x=1790366387;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jFiXSu2V4pZ+QeomBn1c5HcWy5gtnzTo7Z55CduAixo=;
        b=jt03trJkvUqOP0wiYW47eQcMrtavQBkwbI1ucHXnXeDobTg2JKXuaX7CHObv6t2uCg
         gkO/m4p+1Pg9bmYuJyBvJbqTsS+WgojKjRB95wn9pchh5bKIZRQ+pIGGI8C3cFa+AevG
         o6WtErvylLsFWOQwYVqBEhU+RNc/25p8Cq6+Iu8ZcuYjqwpNWturo8t7+xljsj93WRhq
         bVCzfKhY+ArESPJCvg6mJClH4qbsPyoLBtsHWNCrB4BENlOfp9+8brIFFMw6Jd+AOhNT
         kY23A16RscYpz4SyEAnBC22mMBjxfKzgegQd2Hc4mJM4dpRUyN3xRDu0PyHPEknyvnPX
         vL+Q==
X-Forwarded-Encrypted: i=1; AKwUvBzpvzA+dlKiGZi8HFoBWPrYsoWsEF1wOyYmevRwWEn4uumB4BbVlT+JEC7YMkjcBOYm0zNQSrNymA==@lists.linux.dev
X-Gm-Message-State: AFuF++mygTPSiW3RewP27lXav1PhpZDXxV7x0sa47J2fKkvhaRG/8BN9
	B6oDivq5IyyzeuTWrMM6zftdZvXhf5dAGf2OZem8GsdmIJnPnV1KDjs3UpIHTFSAtv90
X-Gm-Gg: AYBFou3lFew/7M0k+aLXKIyQsVhw1ReSZXhxeCLOGakjDIOStpu41M7EjYmOMDmEsF+
	FNGUtN9FsfLU747FjA9SBysjDULcnP16UeVCD+AlsNGFSqya90TIfj3vMRRIgJU1r2FjLgXQy/I
	8bq/lu5Xi4+4Hz9WrM20qnef09yTTZSJJ4zIuMio2+cCmD6aExWmKSpxZWzdUpcDLGKIAGaaSqM
	RghmMISDpDcEKyE8L5iKF5SOi1RMQHJB8GTgZhaWcHqV7enRFLjPqBbseyO0iy+yQ/DLBf4l3cJ
	XAZK+BdKY4HlbaD/doUfo2JQVPjnuESnkN7qO41thNJzYegk/1Kb0+3RvwYU4vTE+wnl9GN1GGm
	lKZEtiS3FSfvxXTOwQ/PSwEiaMS+ITJMRv1V1weg9ICDBu5myiky+s2bse9wd1lV02W0DxZZPJi
	PkHCg8AUH5pFXUoPQn30n9LxFytr0jzH2DE3qWgQKeqF7vVnkb+JiaKq8OE+Tp3Iv2l6IEos0ZN
	C/UxIWK2QaCKhCgAHloVpPV0Sy3vSyhBn19IZB6e7ZyKVkUD0W4qQ==
X-Received: by 2002:a05:690e:e89:b0:671:4d46:8d5a with SMTP id 956f58d0204a3-6717fcee54emr1347891d50.41.1789761587246;
        Fri, 18 Sep 2026 12:59:47 -0700 (PDT)
Received: from toolbx (104-53-165-62.lightspeed.stlsmo.sbcglobal.net. [104.53.165.62])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-672990ab5desm406523d50.8.2026.09.18.12.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 12:59:46 -0700 (PDT)
Date: Fri, 18 Sep 2026 14:59:49 -0500
From: Andrew Halaney <andrew@amutable.com>
To: David Howells <dhowells@redhat.com>
Cc: Jarkko Sakkinen <jarkko@kernel.org>, Alasdair Kergon <agk@redhat.com>, 
	Mike Snitzer <snitzer@kernel.org>, Mikulas Patocka <mpatocka@redhat.com>, 
	Benjamin Marzinski <bmarzins@redhat.com>, Paul Moore <paul@paul-moore.com>, 
	James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, 
	Eric Biggers <ebiggers@kernel.org>, "Theodore Y. Ts'o" <tytso@mit.edu>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, dm-devel@lists.linux.dev, linux-kernel@vger.kernel.org, 
	keyrings@vger.kernel.org, linux-security-module@vger.kernel.org, bpf@vger.kernel.org, 
	fsverity@lists.linux.dev, linux-doc@vger.kernel.org, 
	"Christian Brauner (Amutable)" <brauner@kernel.org>
Subject: Re: [PATCH 1/3] keys: add KEY_SPEC_DM_VERITY_KEYRING
Message-ID: <aq2VxlttdlTNlHo6@toolbx>
References: <aqyiCavj3xeNqyAo@kernel.org>
 <20260914-ajhalaney-dmverity-key-identifier-v1-0-01922dc1366a@amutable.com>
 <20260914-ajhalaney-dmverity-key-identifier-v1-1-01922dc1366a@amutable.com>
 <715249.1789718726@warthog.procyon.org.uk>
Precedence: bulk
X-Mailing-List: fsverity@lists.linux.dev
List-Id: <fsverity.lists.linux.dev>
List-Subscribe: <mailto:fsverity+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fsverity+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <715249.1789718726@warthog.procyon.org.uk>

On Fri, Sep 18, 2026 at 09:05:26AM +0100, David Howells wrote:
> Jarkko Sakkinen <jarkko@kernel.org> wrote:
> 
> > This is great for discussion but what we want for the commit message
> > is just motivation and resolution.
> 
> Actually, I think it's useful that Andrew wrote up the issues in the commit
> message - and I think it shows part of the motivation.  The 'writing a fake
> /proc/keys line in the description' is something I hadn't considered.

I'll defer to what you all want in the message here, I found it valuable
but I trend on the side of overly verbose admittedly!

> 
> > I don't think we need all this just to say that /proc/keys in a racy
> > query mechanism for production, which is an issue for dm-verity, given
> > that nothing else is available.
> 
> I think at some point, we will need a system call to search all for all
> accessible keys matching certain criteria by actually walking the key
> database.  The problem there is that there may be multiple hits, so we may
> need something like:
> 
> 	int count = find_key(key_serial_t start_id,
> 			     const char *type, const char *desc_prefix,
> 			     key_serial_t *results, size_t results_size,
> 			     unsigned int flags);
> 
> Allowing you to do:
> 
> 	key_serial_t dm_key;
> 	int n = find_key(0, "keyring", ".dm_verity", &dm_key, 1,
> 			 FIND_KEY_EXACT_DESC);
> 
> This wouldn't be as fast as a direct lookup since it would have to walk the
> key tree, doing name comparisons and perm checks on each key of the type.
> 
> > And secondly special keys are meant for implicit keyrings so isn't
> > that all there's to it?
> 
> I have no particular objection to setting aside a block of negative key IDs
> for special keyrings that need to be accessed a lot - though I would make
> common reg/unreg functions that take the ID to be registered and, say, set the
> block at -257..-512.  Moving the BFP keyring to -257 and DM to -258.

To be clear are you suggesting I do that for v2 here? Happy to make the
change and add some reuse to the registration functions, etc. I'm
guessing its fine to change the bpf id since its still only in -next?

The only awkward bit with making that more generic is that dm-verity
isn't __ro_after_init since its coming from a module possibly, and
because of the module usage I also protected it with a spinlock in case
someone's accessing it while you unload the module. Could just use one
spinlock for the whole generic array, and drop the __ro_after_init I
suppose.

Let me know if I'm not following properly!

Thanks,
Andrew
